// 20k differential + CNTVCT paired for pelFilterLumaStrong candidate
// (V direction) vs primitives.pelFilterLumaStrong[0].
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_pel_filter_luma_strong_sve2(
    uint8_t*, intptr_t, intptr_t, int32_t, int32_t);

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
    const int batch = argc > 3 ? atoi(argv[3]) : 128;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pelFilterLumaStrong_t ref = primitives.pelFilterLumaStrong[0];
    std::mt19937 rng(0x5A4Eu);
    std::vector<uint8_t> buf(32 * 32);
    for (size_t i = 0; i < buf.size(); i++)
        buf[i] = (uint8_t)rng();
    uint8_t r[32 * 32], g[32 * 32];
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        memcpy(r, buf.data(), sizeof(r));
        memcpy(g, buf.data(), sizeof(g));
        const int32_t tcP = (int32_t)(rng() % 64);
        const int32_t tcQ = (int32_t)(rng() % 64);
        ref(r + 16, 32, 1, tcP, tcQ);
        dynopt_pel_filter_luma_strong_sve2(g + 16, 32, 1, tcP, tcQ);
        if (memcmp(r, g, sizeof(r)) != 0)
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const int32_t tcP = (int32_t)(rng() % 64);
        const int32_t tcQ = (int32_t)(rng() % 64);
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                dynopt_pel_filter_luma_strong_sve2(g + 16, 32, 1, tcP, tcQ);
            else
                ref(r + 16, 32, 1, tcP, tcQ);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("pelfilterV,%s,verify_bad=%d,median_total=%llu\n",
           which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
