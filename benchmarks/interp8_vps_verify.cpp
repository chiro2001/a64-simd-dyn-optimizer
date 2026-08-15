// 20k differential + CNTVCT paired for the inlined interp8 vert_ps
// 16x16 candidate vs primitives.pu[LUMA_16x16].luma_vps.
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_interp8_vert_ps_16x16(
    const uint8_t*, intptr_t, int16_t*, intptr_t);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "cand");
    const int samples = argc > 2 ? atoi(argv[2]) : 30;
    const int batch = argc > 3 ? atoi(argv[3]) : 512;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    filter_ps_t ref = primitives.pu[LUMA_16x16].luma_vps;
    std::mt19937 rng(0x4E97u);
    uint8_t a[32 * 32], b[32 * 32];
    for (int i = 0; i < 32 * 32; i++)
    {
        a[i] = (uint8_t)rng();
        b[i] = (uint8_t)rng();
    }
    int16_t r[16 * 16 + 16], g[16 * 16 + 16];
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        const uint8_t* pa = a + (t % 8) * 16;
        ref(pa, 32, r, 16, 3);
        dynopt_interp8_vert_ps_16x16(pa, 32, g, 16);
        if (std::memcmp(r, g, 16 * 16 * 2) != 0 && ++bad < 5)
            printf("mismatch t=%d\n", t);
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const uint8_t* pa = a + (s % 8) * 16;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                dynopt_interp8_vert_ps_16x16(pa, 32, g, 16);
            else
                ref(pa, 32, r, 16, 3);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("interp8_vps16,%s,verify_bad=%d,median_total=%llu\n",
           which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
