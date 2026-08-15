// AGO M0 paired microbench: upstream NEON sa8d 8x8 vs AGO cover output.
// Usage: ago_sa8d_microbench <neon|cand> [samples=100] [batch=16384]
// Prints a correctness check (1000 cases) and CNTVCT median total ticks
// per batch (per-call division rounds to 0 on the 25 MHz N1 counter).
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_ago_sa8d8(
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
    pixelcmp_t neon = primitives.cu[BLOCK_8x8].sa8d;
    std::mt19937 rng(0xA608u);
    std::vector<uint8_t> a(16 * 16), b(16 * 16);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)rng();
        b[i] = (uint8_t)rng();
    }
    int bad = 0;
    for (int t = 0; t < 1000; t++)
    {
        const uint8_t* pa = a.data() + (t % 8) * 16;
        const uint8_t* pb = b.data() + (t % 8) * 16;
        int n = neon(pa, 16, pb, 16);
        int g = dynopt_ago_sa8d8(pa, 16, pb, 16);
        if (n != g)
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const uint8_t* pa = a.data() + (s % 8) * 16;
        const uint8_t* pb = b.data() + (s % 8) * 16;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                dynopt_ago_sa8d8(pa, 16, pb, 16);
            else
                neon(pa, 16, pb, 16);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("ago_sa8d8,%s,verify_bad=%d,median_total=%llu\n",
           which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
