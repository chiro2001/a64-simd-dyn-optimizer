// CNTVCT paired for inlined interp8 vsp candidates (coeffIdx=2).
// Usage: interp8_vsp_bench <16x16|32x32> <neon|cand> samples batch
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_interp8_vsp_16x16_sve2(
    const int16_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_interp8_vsp_32x32_sve2(
    const int16_t*, intptr_t, uint8_t*, intptr_t, int);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const char* shape = argc > 1 ? argv[1] : "16x16";
    const int which = argc > 2 && !strcmp(argv[2], "cand");
    const int samples = argc > 3 ? atoi(argv[3]) : 30;
    const int batch = argc > 4 ? atoi(argv[4]) : 512;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    filter_sp_t ref = nullptr;
    void (*cand)(const int16_t*, intptr_t, uint8_t*, intptr_t, int) = nullptr;
    int w = 16, h = 16;
    if (!strcmp(shape, "16x16"))
    {
        ref = primitives.pu[LUMA_16x16].luma_vsp;
        cand = dynopt_interp8_vsp_16x16_sve2;
    }
    else if (!strcmp(shape, "32x32"))
    {
        ref = primitives.pu[LUMA_32x32].luma_vsp;
        cand = dynopt_interp8_vsp_32x32_sve2;
        w = 32; h = 32;
    }
    if (!ref || !cand)
        return 2;
    std::mt19937 rng(0x4EA1u);
    std::vector<int16_t> buf(160 * 160);
    for (size_t i = 0; i < buf.size(); i++)
        buf[i] = (int16_t)((int)(rng() & 0x3FFF) - 0x2000);
    uint8_t r[96 * 96 + 16], g[96 * 96 + 16];
    int bad = 0;
    for (int t = 0; t < 2000; t++)
    {
        const int16_t* ps = buf.data() + (t % 80) * 160;
        ref(ps, 160, r, w, 2);
        cand(ps, 160, g, w, 2);
        if (std::memcmp(r, g, (size_t)w * h) != 0)
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const int16_t* ps = buf.data() + (s % 80) * 160;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                cand(ps, 160, g, w, 2);
            else
                ref(ps, 160, r, w, 2);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("interp8_vsp_%s,%s,verify_bad=%d,median_total=%llu\n",
           shape, which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
