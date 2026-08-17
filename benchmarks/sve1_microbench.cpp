// 920B (SVE1, VL=256) real-machine microbenchmark: AGO SVE1 covers
// vs the machine's current dispatched path (primitives.*).
//
// Kernels measured (all 4-arg pixelcmp_t signatures):
//   satd-16x16 : dynopt_satd_16x16_sve2   vs primitives.pu[LUMA_16x16].satd
//   sad-16x16  : dynopt_sad_16x16_sve2    vs primitives.pu[LUMA_16x16].sad
//   psy        : dynopt_psy_cost_pp_<N>x<N>_sve2 vs primitives.cu[BLOCK_NxN]
//                .psy_cost_pp  (N = 8/16/32/64 via -DPSY_N)
//
// Usage: sve1_microbench <satd|sad|psy> [samples] [batch]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_satd_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
    __attribute__((weak));
extern "C" int dynopt_sad_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t)
    __attribute__((weak));
#if defined(PSY_N) && PSY_N == 8
extern "C" int dynopt_psy_cost_pp_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define PSY_FN dynopt_psy_cost_pp_8x8_sve2
#define PSY_BLOCK BLOCK_8x8
#elif defined(PSY_N) && PSY_N == 32
extern "C" int dynopt_psy_cost_pp_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define PSY_FN dynopt_psy_cost_pp_32x32_sve2
#define PSY_BLOCK BLOCK_32x32
#elif defined(PSY_N) && PSY_N == 64
extern "C" int dynopt_psy_cost_pp_64x64_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define PSY_FN dynopt_psy_cost_pp_64x64_sve2
#define PSY_BLOCK BLOCK_64x64
#else
extern "C" int dynopt_psy_cost_pp_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define PSY_FN dynopt_psy_cost_pp_16x16_sve2
#define PSY_BLOCK BLOCK_16x16
#endif

typedef int (*fn_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static uint64_t bench(fn_t fn, const uint8_t* a, intptr_t sa,
                      const uint8_t* b, intptr_t sb,
                      int samples, int batch)
{
    volatile int sink = 0;
    for (int i = 0; i < 1000; i++)
        sink += fn(a, sa, b, sb);
    std::vector<uint64_t> ticks(samples);
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int i = 0; i < batch; i++)
            sink += fn(a, sa, b, sb);
        ticks[s] = read_cntvct() - t0;
    }
    std::sort(ticks.begin(), ticks.end());
    if (sink == 0x7fffffff)  // never true; keeps the calls live
        printf("sink=%d\n", sink);
    return ticks[samples / 2];
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: sve1_microbench <satd|sad|psy> [samples] [batch]\n");
        return 2;
    }
    const char* which = argv[1];
    const int samples = argc > 2 ? atoi(argv[2]) : 40;
    const int batch = argc > 3 ? atoi(argv[3]) : 8192;

    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);

    fn_t ref = nullptr, cand = nullptr;
    if (!strcmp(which, "satd"))
    {
        ref = primitives.pu[LUMA_16x16].satd;
        cand = dynopt_satd_16x16_sve2;
    }
    else if (!strcmp(which, "sad"))
    {
        ref = primitives.pu[LUMA_16x16].sad;
        cand = dynopt_sad_16x16_sve2;
    }
    else if (!strcmp(which, "psy"))
    {
        ref = primitives.cu[PSY_BLOCK].psy_cost_pp;
        cand = PSY_FN;
    }
    else
    {
        fprintf(stderr, "unknown kernel %s\n", which);
        return 2;
    }

    std::mt19937 rng(0x5A8D16u ^ (unsigned)which[0]);
#ifdef PSY_N
    const int PAD = 96;
#else
    const int PAD = 64;
#endif
    std::vector<uint8_t> a(PAD * PAD), b(PAD * PAD);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)(rng() & 0xFF);
        b[i] = (uint8_t)(rng() & 0xFF);
    }
    // correctness check (random top-left offsets within the padded buffers)
    int mism = 0;
    for (int i = 0; i < 1000; i++)
    {
        int x = (int)(rng() % (PAD - 65)), y = (int)(rng() % (PAD - 65));
        const uint8_t* pa = &a[y * PAD + x];
        const uint8_t* pb = &b[y * PAD + x];
        if (ref(pa, PAD, pb, PAD) != cand(pa, PAD, pb, PAD))
            mism++;
    }
    printf("[%s] correctness mism=%d/1000\n", which, mism);

    const intptr_t sa = PAD, sb = PAD;
    uint64_t tr = bench(ref, a.data(), sa, b.data(), sb, samples, batch);
    uint64_t tc = bench(cand, a.data(), sa, b.data(), sb, samples, batch);
    double per_call = 1.0 / batch;
    printf("[%s] samples=%d batch=%d\n", which, samples, batch);
    printf("[%s] ref : median %llu ticks (%.2f/call)\n",
           which, (unsigned long long)tr, tr * per_call);
    printf("[%s] cand: median %llu ticks (%.2f/call)\n",
           which, (unsigned long long)tc, tc * per_call);
    printf("[%s] ratio cand/ref = %.4f\n", which, (double)tc / tr);
    return 0;
}
