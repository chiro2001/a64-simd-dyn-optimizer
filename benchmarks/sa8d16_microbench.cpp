// 920B SVE1 microbench: AGO sa8d16 cover A (best_sve1) vs the
// machine's current sa8d_16x16 path (NEON/C on 920B).
// Usage: sa8d16_microbench [samples] [batch]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_sa8d_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

typedef int (*sa8d16_fn)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static uint64_t bench(sa8d16_fn fn, const uint8_t* a, intptr_t sa,
                      const uint8_t* b, intptr_t sb,
                      int samples, int batch)
{
    // warmup
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
    return ticks[samples / 2];  // median total ticks
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
    sa8d16_fn ref = primitives.cu[BLOCK_16x16].sa8d;
    sa8d16_fn cand = dynopt_sa8d_16x16_sve2;

    std::mt19937 rng(0x5A8D16u);
    std::vector<uint8_t> a(64 * 64), b(64 * 64);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)(rng() & 0xFF);
        b[i] = (uint8_t)(rng() & 0xFF);
    }
    // correctness check
    int mism = 0;
    for (int i = 0; i < 1000; i++)
    {
        int x = (int)(rng() % 49), y = (int)(rng() % 49);
        const uint8_t* pa = &a[y * 64 + x];
        const uint8_t* pb = &b[y * 64 + x];
        if (ref(pa, 64, pb, 64) != cand(pa, 64, pb, 64))
            mism++;
    }
    printf("correctness mism=%d/1000\n", mism);

    const intptr_t sa = 64, sb = 64;
    uint64_t tr = bench(ref, a.data(), sa, b.data(), sb, samples, batch);
    uint64_t tc = bench(cand, a.data(), sa, b.data(), sb, samples, batch);
    double per_call = 1.0 / batch;
    printf("samples=%d batch=%d\n", samples, batch);
    printf("ref : median %llu ticks (%.2f/call)\n",
           (unsigned long long)tr, tr * per_call);
    printf("cand: median %llu ticks (%.2f/call)\n",
           (unsigned long long)tc, tc * per_call);
    printf("ratio cand/ref = %.4f\n", (double)tc / tr);
    return 0;
}
