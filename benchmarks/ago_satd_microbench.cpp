// AGO M2-expanded paired microbench for SATD shapes.
// Compile with:
//   -DAGO_PU=LUMA_8x8 (or LUMA_8x4 / LUMA_8x16 / LUMA_16x8)
//   -DAGO_FUNC=dynopt_ago_satd8 (or the shape-specific cover symbol)
// Usage: ago_satd_microbench <neon|cand> [samples=100] [batch=16384]
#ifndef AGO_PU
#define AGO_PU LUMA_8x8
#endif
#ifndef AGO_FUNC
#define AGO_FUNC dynopt_ago_satd8
#endif
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int AGO_FUNC(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "cand");
    const int samples = argc > 2 ? atoi(argv[2]) : 100;
    const int batch = argc > 3 ? atoi(argv[3]) : 16384;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t neon = primitives.pu[AGO_PU].satd;
    std::mt19937 rng(0xA608u);
    std::vector<uint8_t> a(32 * 32), b(32 * 32);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)rng();
        b[i] = (uint8_t)rng();
    }
    int bad = 0;
    for (int t = 0; t < 1000; t++)
    {
        const uint8_t* pa = a.data() + (t % 16) * 32;
        const uint8_t* pb = b.data() + (t % 16) * 32;
        int n = neon(pa, 32, pb, 32);
        int g = AGO_FUNC(pa, 32, pb, 32);
        if (n != g)
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const uint8_t* pa = a.data() + (s % 16) * 32;
        const uint8_t* pb = b.data() + (s % 16) * 32;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                AGO_FUNC(pa, 32, pb, 32);
            else
                neon(pa, 32, pb, 32);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("ago_satd,%s,verify_bad=%d,median_total=%llu\n",
           which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
