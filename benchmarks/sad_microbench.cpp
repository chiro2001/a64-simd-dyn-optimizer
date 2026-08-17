// 920B (SVE1, VL=256) real-machine microbenchmark: SAD covers vs
// dispatched path. Default shape 16x16; compile with -DSAD_N=32 for
// 32x32 (ref = pu[LUMA_32x32].sad).
//
// Usage: sad_microbench [samples] [batch]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

#ifdef SAD_N32
extern "C" int dynopt_sad_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define CAND_FN dynopt_sad_32x32_sve2
#else
extern "C" int dynopt_sad_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
#define CAND_FN dynopt_sad_16x16_sve2
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
    const int samples = argc > 1 ? atoi(argv[1]) : 40;
    const int batch = argc > 2 ? atoi(argv[2]) : 8192;

    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);

#ifdef SAD_N32
    fn_t ref = primitives.pu[LUMA_32x32].sad;
#else
    fn_t ref = primitives.pu[LUMA_16x16].sad;
#endif
    fn_t cand = CAND_FN;

    std::mt19937 rng(0x5A8D16u);
#ifdef SAD_N32
    const int PAD = 128;
#else
    const int PAD = 64;
#endif
    std::vector<uint8_t> a(PAD * PAD), b(PAD * PAD);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)(rng() & 0xFF);
        b[i] = (uint8_t)(rng() & 0xFF);
    }
    int mism = 0;
    for (int i = 0; i < 1000; i++)
    {
        int x = (int)(rng() % (PAD - 33)), y = (int)(rng() % (PAD - 33));
        const uint8_t* pa = &a[y * 64 + x];
        const uint8_t* pb = &b[y * 64 + x];
        if (ref(pa, 64, pb, 64) != cand(pa, 64, pb, 64))
            mism++;
    }
    printf("[sad-B] correctness mism=%d/1000\n", mism);

    const intptr_t sa = PAD, sb = PAD;
    uint64_t tr = bench(ref, a.data(), sa, b.data(), sb, samples, batch);
    uint64_t tc = bench(cand, a.data(), sa, b.data(), sb, samples, batch);
    double per_call = 1.0 / batch;
    printf("[sad-B] samples=%d batch=%d\n", samples, batch);
    printf("[sad-B] ref : median %llu ticks (%.2f/call)\n",
           (unsigned long long)tr, tr * per_call);
    printf("[sad-B] cand: median %llu ticks (%.2f/call)\n",
           (unsigned long long)tc, tc * per_call);
    printf("[sad-B] ratio cand/ref = %.4f\n", (double)tc / tr);
    return 0;
}
