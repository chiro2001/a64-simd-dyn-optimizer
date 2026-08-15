// Real-call trace replay for the entropy family (expert-advice
// round-0021 P0): read a trace captured by tools/trace_entropy_calls.py
// on the target 920B, run each record through baseline (x265 primitives)
// or candidate (dynopt_*), and report total CNTVCT ticks per kernel and
// per shape bucket so rankings use the true call mix.
//
// Usage: entropy_trace_replay <trace.bin> <neon|cand> [workdir]
// Output: kernel,bucket,impl,ticks,count  (one line per kernel/bucket)
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <string>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" uint32_t dynopt_cost_c1c2_flag_sve2(
    uint16_t*, intptr_t, uint8_t*, intptr_t);
extern "C" uint32_t dynopt_cost_coeff_remain_sve2(
    uint16_t*, int, int);
extern "C" uint32_t dynopt_cost_coeff_nxn_sve2(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" int dynopt_scan_pos_last_sve2(
    const uint16_t*, const int16_t*, uint16_t*, uint16_t*,
    uint8_t*, int, const uint16_t*, int);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

enum KID { K_C1 = 1, K_REM = 2, K_CCN = 3, K_SCAN = 4 };

static const char* KNAME(int k)
{
    switch (k)
    {
    case K_C1: return "c1c2";
    case K_REM: return "remain";
    case K_CCN: return "ccn";
    case K_SCAN: return "scan";
    }
    return "?";
}

static int split_trace(const char* path, const char* work)
{
    FILE* in = fopen(path, "rb");
    if (!in)
        return -1;
    FILE* out[5][9] = { { 0 } };
    char p[1024];
    for (int k = 1; k <= 4; k++)
        for (int b = 0; b < 9; b++)
        {
            snprintf(p, sizeof(p), "%s/replay-%d-%d.bin", work, k, b);
            out[k][b] = fopen(p, "wb");
            if (!out[k][b])
                return -2;
        }
    unsigned char id;
    long long n = 0;
    while (fread(&id, 1, 1, in) == 1)
    {
        if (id < 1 || id > 4)
            return -3;
        if (id == K_C1)
        {
            unsigned char body[89];
            if (fread(body, 1, 89, in) != 89)
                return -4;
            int b = body[0] >= 1 && body[0] <= 8 ? body[0] : 0;
            fwrite(&id, 1, 1, out[K_C1][b]);
            fwrite(body, 1, 89, out[K_C1][b]);
        }
        else if (id == K_REM)
        {
            unsigned char body[36];
            if (fread(body, 1, 36, in) != 36)
                return -5;
            int idx = (int)((unsigned)body[2] | ((unsigned)body[3] << 8));
            int b = idx < 8 ? 0 : 1;
            fwrite(&id, 1, 1, out[K_REM][b]);
            fwrite(body, 1, 36, out[K_REM][b]);
        }
        else if (id == K_CCN)
        {
            unsigned char body[168];
            if (fread(body, 1, 168, in) != 168)
                return -6;
            int soff;
            memcpy(&soff, body + 16, 4);
            int b = soff == 15 ? 0 : 1;
            fwrite(&id, 1, 1, out[K_CCN][b]);
            fwrite(body, 1, 168, out[K_CCN][b]);
        }
        else
        {
            unsigned char hdr[6];
            if (fread(hdr, 1, 6, in) != 6)
                return -7;
            int ncg = (int)((unsigned)hdr[4] | ((unsigned)hdr[5] << 8));
            unsigned char vals[2048];
            if (fread(vals, 1, (size_t)ncg * 32, in) != (size_t)ncg * 32)
                return -9;
            int trSize = (int)((unsigned)hdr[0] | ((unsigned)hdr[1] << 8));
            const int scanlen = trSize * trSize;
            const int b = scanlen == 16 ? 0 : scanlen == 64 ? 1
                         : scanlen == 256 ? 2 : scanlen == 1024 ? 3 : -1;
            if (b < 0 || ncg < 0 || ncg > scanlen / 16)
            {
                fprintf(stderr, "bad scan hdr: trSize=%d numSig=%d ncg=%d\n",
                        trSize,
                        (int)((unsigned)hdr[2] | ((unsigned)hdr[3] << 8)),
                        ncg);
                return -11;
            }
            unsigned char tail[2080];
            const int taillen = scanlen * 2 + 32;
            if (fread(tail, 1, taillen, in) != (size_t)taillen)
                return -10;
            FILE* o = out[K_SCAN][b];
            fwrite(&id, 1, 1, o);
            fwrite(hdr, 1, 6, o);
            fwrite(vals, 1, (size_t)ncg * 32, o);
            fwrite(tail, 1, taillen, o);
        }
        n++;
    }
    fclose(in);
    for (int k = 1; k <= 4; k++)
        for (int b = 0; b < 9; b++)
            fclose(out[k][b]);
    fprintf(stderr, "split ok, records=%lld\n", n);
    return 0;
}

static int run_c1(const unsigned char* b, int which, uint64_t* acc)
{
    int n = b[0];
    if (n < 1 || n > 8)
    {
        fprintf(stderr, "c1 guard: n=%d\n", n);
        fflush(stderr);
        return n;
    }
    uint16_t abs[8];
    memcpy(abs, b + 1, 16);
    uint8_t ctx[64];
    memcpy(ctx, b + 17, 64);
    intptr_t off;
    memcpy(&off, b + 81, 8);
    uint32_t r;
    if (which == 0)
    {
        costC1C2Flag_t fn = primitives.costC1C2Flag;
        r = fn(abs, n, ctx, off);
    }
    else
        r = dynopt_cost_c1c2_flag_sve2(abs, n, ctx, off);
    *acc += r;
    return n;
}

static int run_rem(const unsigned char* b, int which, uint64_t* acc)
{
    int nn = (int)((unsigned)b[0] | ((unsigned)b[1] << 8));
    int idx = (int)((unsigned)b[2] | ((unsigned)b[3] << 8));
    if (nn < 0 || nn > 64 || idx < 0 || idx > 32)
    {
        fprintf(stderr, "rem guard: nn=%d idx=%d\n", nn, idx);
        fflush(stderr);
        return idx;
    }
    uint16_t buf[64];
    memset(buf, 0, sizeof(buf));
    memcpy(buf + 16, b + 4, 32);
    uint32_t r;
    if (which == 0)
    {
        costCoeffRemain_t fn = primitives.costCoeffRemain;
        r = fn(buf + 16 - (idx >= 0 ? idx : 0), nn, idx);
    }
    else
        r = dynopt_cost_coeff_remain_sve2(
            buf + 16 - (idx >= 0 ? idx : 0), nn, idx);
    *acc += r;
    return idx;
}

static int run_ccn(const unsigned char* b, int which, uint64_t* acc)
{
    intptr_t trSize;
    uint32_t mask;
    int offset, soff, sub;
    memcpy(&trSize, b, 8);
    memcpy(&mask, b + 8, 4);
    memcpy(&offset, b + 12, 4);
    memcpy(&soff, b + 16, 4);
    memcpy(&sub, b + 20, 4);
    int16_t coeff[128];
    memset(coeff, 0, sizeof(coeff));
    for (int i = 0; i < 4; i++)
        memcpy(coeff + i * trSize, b + 24 + 8 * i, 8);
    uint8_t tab[16], ctx[256];
    uint16_t scan[48];
    memcpy(tab, b + 56, 16);
    memset(ctx, 0, sizeof(ctx));
    memcpy(ctx, b + 72, 64);
    memset(scan, 0, sizeof(scan));
    memcpy(scan, b + 136, 32);
    uint16_t absbuf[32];
    memset(absbuf, 0, sizeof(absbuf));
    uint32_t r;
    if (which == 0)
    {
        costCoeffNxN_t fn = primitives.costCoeffNxN;
        r = fn(scan, coeff, trSize, absbuf, tab, mask, ctx, offset,
               soff, sub);
    }
    else
        r = dynopt_cost_coeff_nxn_sve2(
            scan, coeff, trSize, absbuf, tab, mask, ctx, offset, soff, sub);
    *acc += r;
    return soff;
}

static int run_scan(const unsigned char* hdr, const unsigned char* vals,
                    const unsigned char* tail, int which, uint64_t* acc)
{
    int trSize = (int)((unsigned)hdr[0] | ((unsigned)hdr[1] << 8));
    int numSig = (int)((unsigned)hdr[2] | ((unsigned)hdr[3] << 8));
    int ncg = (int)((unsigned)hdr[4] | ((unsigned)hdr[5] << 8));
    alignas(16) int16_t coeff[2048];
    memset(coeff, 0, sizeof(coeff));
    alignas(16) uint16_t scan[1024];
    const int scanlen = trSize * trSize;
    memcpy(scan, tail, (size_t)scanlen * 2);
    for (int i = 0; i < ncg; i++)
    {
        const int off = scan[16 * i];
        if (off < 0 || off + 3 * trSize + 3 >= 2048)
        {
            fprintf(stderr, "scan guard: trSize=%d numSig=%d ncg=%d "
                            "i=%d off=%d\n", trSize, numSig, ncg, i, off);
            fflush(stderr);
            return 0;
        }
        for (int k = 0; k < 4; k++)
            for (int j = 0; j < 4; j++)
                memcpy(&coeff[off + k * trSize + j],
                       vals + (i * 16 + k * 4 + j) * 2, 2);
    }
    alignas(16) uint16_t cg[16];
    memcpy(cg, tail + (size_t)scanlen * 2, 32);
    alignas(16) uint16_t cs[64], cf[64];
    alignas(16) uint8_t cn[64];
    memset(cs, 0, sizeof(cs));
    memset(cf, 0, sizeof(cf));
    memset(cn, 0, sizeof(cn));
    int r;
    if (which == 0)
    {
        scanPosLast_t fn = primitives.scanPosLast;
        r = fn(scan, coeff, cs, cf, cn, numSig, cg, trSize);
    }
    else
        r = dynopt_scan_pos_last_sve2(
            scan, coeff, cs, cf, cn, numSig, cg, trSize);
    *acc += (uint64_t)(uint32_t)r;
    return trSize * 1000 + (numSig <= 4 ? 1 : 0);
}

// Time one bucket by loading its records into memory first, so the timed
// window contains only kernel calls (round-0021: the earlier per-pass
// design timed file IO and made scan buckets ~99% IO).
static void bench_file(const char* path, int kid, int which,
                       const char* bname, int* bucket_ok)
{
    FILE* f = fopen(path, "rb");
    if (!f)
        return;
    std::vector<unsigned char> data;
    data.reserve(64 << 20);
    unsigned char buf[1 << 20];
    size_t rd;
    while ((rd = fread(buf, 1, sizeof(buf), f)) > 0)
        data.insert(data.end(), buf, buf + rd);
    fclose(f);
    if (data.empty())
        return;
    uint64_t acc = 0;
    long long cnt = 0;
    size_t pos = 0;
    uint64_t t0 = rdtsc();
    while (pos < data.size())
    {
        const unsigned char* p = &data[pos];
        if (kid == K_SCAN)
        {
            if (data.size() - pos < 7)
                break;
            int ncg = (int)((unsigned)p[5] | ((unsigned)p[6] << 8));
            int trSize = (int)((unsigned)p[1] | ((unsigned)p[2] << 8));
            const int scanlen = trSize * trSize;
            const int taillen = scanlen * 2 + 32;
            size_t rec = 7 + (size_t)ncg * 32 + taillen;
            if (data.size() - pos < rec)
                break;
            run_scan(p + 1, p + 7, p + 7 + (size_t)ncg * 32,
                     which, &acc);
            pos += rec;
            cnt++;
        }
        else
        {
            size_t rec = kid == K_C1 ? 90 :
                         kid == K_REM ? 37 : 169;
            if (data.size() - pos < rec)
                break;
            const unsigned char* b = p + 1;
            if (kid == K_C1)
                run_c1(b, which, &acc);
            else if (kid == K_REM)
                run_rem(b, which, &acc);
            else
                run_ccn(b, which, &acc);
            pos += rec;
            cnt++;
        }
    }
    uint64_t t1 = rdtsc();
    printf("%s,%s,%s,%llu,%lld,%llu\n",
           KNAME(kid), bname, which ? "cand" : "neon",
           (unsigned long long)(t1 - t0), cnt,
           (unsigned long long)(acc & 0xFFFFFFF));
    fflush(stdout);
    *bucket_ok = 1;
}

int main(int argc, char** argv)
{
    if (argc < 3)
    {
        fprintf(stderr, "usage: %s <trace.bin> <neon|cand> [workdir]\n",
                argv[0]);
        return 2;
    }
    x265_param p;
    memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = getenv("REPLAY_C") ? 0 : X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    int which = !strcmp(argv[2], "cand");
    std::string work = argc > 3 ? argv[3] : "/tmp";
    char spath[1024];
    bool have_split = true;
    snprintf(spath, sizeof(spath), "%s/replay-1-1.bin", work.c_str());
    FILE* t0 = fopen(spath, "rb");
    if (!t0)
        have_split = false;
    else
        fclose(t0);
    for (int k = 2; k <= 4 && have_split; k++)
    {
        snprintf(spath, sizeof(spath), "%s/replay-%d-0.bin",
                 work.c_str(), k);
        FILE* t = fopen(spath, "rb");
        if (!t)
            have_split = false;
        else
            fclose(t);
    }
    if (!have_split)
    {
        int sp = split_trace(argv[1], work.c_str());
        if (sp != 0)
        {
            fprintf(stderr, "split failed (%d)\n", sp);
            return 3;
        }
    }
    const char* buckets_c1[8] =
        { "n1", "n2", "n3", "n4", "n5", "n6", "n7", "n8" };
    const char* buckets_rem[2] = { "idx<8", "idx>=8" };
    const char* buckets_ccn[2] = { "soff=15", "soff!=15" };
    const char* buckets_scan[4] = { "tr4", "tr8", "tr16", "tr32" };
    char path[1024];
    int ok = 0;
    for (int b = 1; b <= 8; b++)
    {
        snprintf(path, sizeof(path), "%s/replay-1-%d.bin",
                 work.c_str(), b);
        bench_file(path, K_C1, which, buckets_c1[b - 1], &ok);
    }
    for (int b = 0; b < 2; b++)
    {
        snprintf(path, sizeof(path), "%s/replay-2-%d.bin",
                 work.c_str(), b);
        bench_file(path, K_REM, which, buckets_rem[b], &ok);
    }
    for (int b = 0; b < 2; b++)
    {
        snprintf(path, sizeof(path), "%s/replay-3-%d.bin",
                 work.c_str(), b);
        bench_file(path, K_CCN, which, buckets_ccn[b], &ok);
    }
    for (int b = 0; b < 4; b++)
    {
        snprintf(path, sizeof(path), "%s/replay-4-%d.bin",
                 work.c_str(), b);
        bench_file(path, K_SCAN, which, buckets_scan[b], &ok);
    }
    return ok ? 0 : 4;
}
