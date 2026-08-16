// costCoeffNxN real-machine microbenchmark (Yitian710 VL=128): upstream
// x265 NEON vs AGO SVE2 candidate, CNTVCT ticks. 4x4 diagonal scan.
//
// Usage: cost_coeff_microbench <upstream|cand> <latency|throughput>
//                              <samples> <batch>
// Verify mode: cost_coeff_microbench verify <cases>
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

namespace x265 {
extern const uint16_t g_scan4x4[3][16];
}

extern "C" uint32_t x265_costCoeffNxN_neon(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" uint32_t dynopt_cost_coeff_nxn_sve2(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" uint32_t dynopt_ccn_v_neon(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" uint32_t dynopt_ccn_v_neon_unroll(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" uint32_t dynopt_ccn_v_vector(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
extern "C" uint32_t dynopt_ccn_v_gather(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);

typedef uint32_t (*fn_t)(const uint16_t*, const int16_t*, intptr_t,
                         uint16_t*, const uint8_t*, uint32_t, uint8_t*,
                         int, int, int);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

struct Case
{
    const uint16_t* scan;
    int16_t coeff[128];
    uint8_t tab[16];
    uint8_t base[256];
    uint32_t mask;
    int offset, scanPosSigOff, subPosBase, trSize;
};

static std::vector<Case> make_corpus(int n, std::mt19937& rng)
{
    static const int TRS[8] = { 4, 8, 8, 16, 16, 32, 32, 32 };
    std::vector<Case> out(n);
    for (int i = 0; i < n; i++)
    {
        Case& c = out[i];
        c.scan = x265::g_scan4x4[rng() % 3];
        c.trSize = TRS[rng() % 8];
        c.scanPosSigOff = (int)(rng() % 16);
        c.mask = (uint32_t)(rng() & 0xFFFF);
        if (c.scanPosSigOff < 15)
            c.mask &= (1u << (c.scanPosSigOff + 1)) - 1;
        if (c.mask == 0)
            c.mask = 1;
        memset(c.coeff, 0, sizeof(c.coeff));
        for (int j = 0; j < 16; j++)
            if ((c.mask >> j) & 1)
                c.coeff[((c.scan[j] >> 2) * c.trSize) + (c.scan[j] & 3)] =
                    (int16_t)((int)(rng() % 65535) - 32768);
        for (int j = 0; j < 16; j++)
            c.tab[j] = (uint8_t)(rng() % 16);
        for (int j = 0; j < 256; j++)
            c.base[j] = (uint8_t)(rng() % 128);
        c.subPosBase = (int)(rng() % 2);
        c.offset = (int)(rng() % 33);
    }
    return out;
}

static fn_t pick(const char* impl)
{
    if (!strcmp(impl, "upstream")) return x265_costCoeffNxN_neon;
    if (!strcmp(impl, "cand"))     return dynopt_cost_coeff_nxn_sve2;
    if (!strcmp(impl, "v_neon"))       return dynopt_ccn_v_neon;
    if (!strcmp(impl, "v_neon_unroll")) return dynopt_ccn_v_neon_unroll;
    if (!strcmp(impl, "v_vector"))     return dynopt_ccn_v_vector;
    if (!strcmp(impl, "v_gather"))     return dynopt_ccn_v_gather;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0xC0FFEEu);
    fn_t fn = pick(impl);
    std::vector<Case> corpus = make_corpus(cases, rng);
    long mism = 0;
    for (const Case& c : corpus)
    {
        alignas(16) uint16_t absA[32] = {}, absB[32] = {};
        uint8_t baseA[256], baseB[256];
        memcpy(baseA, c.base, 256);
        memcpy(baseB, c.base, 256);
        uint32_t ra = x265_costCoeffNxN_neon(
            c.scan, c.coeff, c.trSize, absA + 8, c.tab, c.mask,
            baseA, c.offset, c.scanPosSigOff, c.subPosBase);
        uint32_t rb = fn(c.scan, c.coeff, c.trSize, absB + 8, c.tab,
                         c.mask, baseB, c.offset, c.scanPosSigOff,
                         c.subPosBase);
        int bad = (ra != rb) || memcmp(absA, absB, sizeof(absA)) ||
                  memcmp(baseA, baseB, 256);
        if (bad)
            mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, int samples, int batch)
{
    fn_t fn = pick(impl);
    std::mt19937 rng(0xC0FFEEu);
    std::vector<Case> corpus = make_corpus(1024, rng);
    std::vector<uint64_t> ts(samples);
    volatile uint32_t sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int b = 0; b < batch; b++)
        {
            const Case& c = corpus[(s * 7 + b * 13) % 1024];
            alignas(16) uint16_t absbuf[32] = {};
            sink += fn(c.scan, c.coeff, c.trSize, absbuf + 8, c.tab,
                       c.mask, const_cast<uint8_t*>(c.base), c.offset,
                       c.scanPosSigOff, c.subPosBase);
        }
        ts[s] = read_cntvct() - t0;
    }
    (void)sink;
    std::sort(ts.begin(), ts.end());
    printf("%s,%d,%d,%.2f\n", impl, samples, batch,
           (double)ts[samples / 2] / batch);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <upstream|cand> <samples> <batch> | "
                        "verify [cases]\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    return bench(argv[1], atoi(argv[2]), atoi(argv[3]));
}
