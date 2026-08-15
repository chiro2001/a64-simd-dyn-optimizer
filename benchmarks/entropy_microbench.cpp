// CNTVCT A/B for the entropy/quant hot functions found by gprof on 920B:
// scanPosLast, costCoeffNxN, costC1C2Flag, costCoeffRemain.
//
// Usage: entropy_microbench <scan|cost|flag|remain> <neon|cand>
//                           <samples> <batch>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <algorithm>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_scan_pos_last_sve2(
    const uint16_t*, const int16_t*, uint16_t*, uint16_t*, uint8_t*,
    int, const uint16_t*, int);
extern "C" uint32_t dynopt_cost_coeff_nxn_sve2(
    const uint16_t*, const int16_t*, intptr_t, uint16_t*,
    const uint8_t*, uint32_t, uint8_t*, int, int, int);
static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static const uint16_t SCAN[16] =
    { 0, 4, 1, 8, 5, 2, 12, 9, 6, 3, 13, 10, 7, 14, 11, 15 };

static int bench_scan(int which, int samples, int batch)
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    scanPosLast_t neon = primitives.scanPosLast;
    std::mt19937 rng(0x5CA9u);
    std::vector<int16_t> coeff(16);
    std::vector<uint16_t> sign(64), flag(64);
    std::vector<uint8_t> num(64);
    std::vector<uint64_t> times;
    times.reserve(samples);
    for (int s = 0; s < samples; s++)
    {
        for (int i = 0; i < 16; i++)
            coeff[i] = i < 6 ? (int16_t)((i + 1) * 17) : 0;
        std::memset(sign.data(), 0, sign.size() * 2);
        std::memset(flag.data(), 0, flag.size() * 2);
        std::memset(num.data(), 0, num.size());
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++)
        {
            if (which == 0)
                neon(SCAN, coeff.data(), sign.data(),
                     flag.data(), num.data(), 6, SCAN, 4);
            else
                dynopt_scan_pos_last_sve2(SCAN, coeff.data(), sign.data(),
                                          flag.data(), num.data(), 6,
                                          SCAN, 4);
        }
        uint64_t t1 = rdtsc();
        uint64_t per = (t1 - t0) / (uint64_t)batch;
        times.push_back(per);
    }
    std::sort(times.begin(), times.end());
    printf("scan,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}

static int bench_cost(int which, int samples, int batch)
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    costCoeffNxN_t neon = primitives.costCoeffNxN;
    std::mt19937 rng(0xC057u);
    std::vector<int16_t> coeff(16);
    std::vector<uint8_t> tab(16), base(256);
    std::vector<uint16_t> absbuf(32);
    std::vector<uint64_t> times;
    times.reserve(samples);
    for (int i = 0; i < 256; i++)
        base[i] = (uint8_t)(i % 128);
    for (int s = 0; s < samples; s++)
    {
        for (int i = 0; i < 16; i++)
        {
            coeff[i] = (int16_t)((int)(rng() % 200) - 100);
            tab[i] = (uint8_t)i;
        }
        std::memset(absbuf.data(), 0, absbuf.size() * 2);
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++)
        {
            if (which == 0)
                neon(SCAN, coeff.data(), 4,
                     absbuf.data() + 8, tab.data(),
                     0x5555u, base.data(), 3, 15, 0);
            else
                dynopt_cost_coeff_nxn_sve2(SCAN, coeff.data(), 4,
                                           absbuf.data() + 8, tab.data(),
                                           0x5555u, base.data(), 3, 15, 0);
        }
        uint64_t t1 = rdtsc();
        uint64_t per = (t1 - t0) / (uint64_t)batch;
        times.push_back(per);
    }
    std::sort(times.begin(), times.end());
    printf("cost,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}

static int bench_flag(int which, int samples, int batch)
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    costC1C2Flag_t fn = primitives.costC1C2Flag;
    if (!fn)
    {
        printf("flag,no-baseline\n");
        return 0;
    }
    std::mt19937 rng(0xF1A6u);
    std::vector<uint16_t> absbuf(32);
    std::vector<uint8_t> ctx(64);
    std::vector<uint64_t> times;
    times.reserve(samples);
    for (int s = 0; s < samples; s++)
    {
        for (int i = 0; i < 32; i++)
            absbuf[i] = (uint16_t)(rng() & 0x3FF);
        for (int i = 0; i < 64; i++)
            ctx[i] = (uint8_t)(rng() & 0x3F);
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++)
            fn(absbuf.data(), 16, ctx.data(), 16);
        uint64_t t1 = rdtsc();
        uint64_t per = (t1 - t0) / (uint64_t)batch;
        times.push_back(per);
    }
    std::sort(times.begin(), times.end());
    printf("flag,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}

static int bench_remain(int which, int samples, int batch)
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    costCoeffRemain_t fn = primitives.costCoeffRemain;
    if (!fn)
    {
        printf("remain,no-baseline\n");
        return 0;
    }
    std::mt19937 rng(0x2A11u);
    std::vector<uint16_t> absbuf(32);
    std::vector<uint64_t> times;
    times.reserve(samples);
    for (int s = 0; s < samples; s++)
    {
        for (int i = 0; i < 32; i++)
            absbuf[i] = (uint16_t)(rng() & 0x3FF);
        uint64_t t0 = rdtsc();
        for (int b = 0; b < batch; b++)
            fn(absbuf.data(), 16, 0);
        uint64_t t1 = rdtsc();
        uint64_t per = (t1 - t0) / (uint64_t)batch;
        times.push_back(per);
    }
    std::sort(times.begin(), times.end());
    printf("remain,%s,median=%llu\n", which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc < 4)
    {
        fprintf(stderr, "usage: %s scan|cost|flag|remain neon|cand "
                "samples [batch]\n", argv[0]);
        return 2;
    }
    int samples = atoi(argv[3]);
    int batch = argc > 4 ? atoi(argv[4]) : 16;
    int which = !strcmp(argv[2], "cand");
    if (!strcmp(argv[1], "scan"))
        return bench_scan(which, samples, batch);
    if (!strcmp(argv[1], "cost"))
        return bench_cost(which, samples, batch);
    if (!strcmp(argv[1], "flag"))
        return bench_flag(which, samples, batch);
    if (!strcmp(argv[1], "remain"))
        return bench_remain(which, samples, batch);
    return 2;
}
