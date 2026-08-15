// CNTVCT paired for inlined interp8 vert_ps candidates (coeffIdx=3).
// Usage: interp8_vps_bench <16x16|32x32|8x8|16x32> <neon|cand> samples batch
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_interp8_vps_16x16_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int);
extern "C" void dynopt_interp8_vps_32x32_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int);
extern "C" void dynopt_interp8_vps_8x8_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int);
extern "C" void dynopt_interp8_vps_16x32_sve2(
    const uint8_t*, intptr_t, int16_t*, intptr_t, int);

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
    filter_ps_t ref = nullptr;
    void (*cand)(const uint8_t*, intptr_t, int16_t*, intptr_t, int) = nullptr;
    int w = 16, h = 16;
    if (!strcmp(shape, "16x16"))
    {
        ref = primitives.pu[LUMA_16x16].luma_vps;
        cand = dynopt_interp8_vps_16x16_sve2;
    }
    else if (!strcmp(shape, "32x32"))
    {
        ref = primitives.pu[LUMA_32x32].luma_vps;
        cand = dynopt_interp8_vps_32x32_sve2;
        w = 32; h = 32;
    }
    else if (!strcmp(shape, "8x8"))
    {
        ref = primitives.pu[LUMA_8x8].luma_vps;
        cand = dynopt_interp8_vps_8x8_sve2;
        w = 8; h = 8;
    }
    else if (!strcmp(shape, "16x32"))
    {
        ref = primitives.pu[LUMA_16x32].luma_vps;
        cand = dynopt_interp8_vps_16x32_sve2;
        w = 16; h = 32;
    }
    if (!ref || !cand)
        return 2;
    std::mt19937 rng(0x4E97u);
    std::vector<uint8_t> buf(128 * 128);
    for (size_t i = 0; i < buf.size(); i++)
        buf[i] = (uint8_t)rng();
    int16_t r[64 * 64 + 16], g[64 * 64 + 16];
    int bad = 0;
    for (int t = 0; t < 2000; t++)
    {
        const uint8_t* pa = buf.data() + (t % 64) * 128;
        ref(pa, 128, r, w, 3);
        cand(pa, 128, g, w, 3);
        if (std::memcmp(r, g, (size_t)w * h * 2) != 0)
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const uint8_t* pa = buf.data() + (s % 64) * 128;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                cand(pa, 128, g, w, 3);
            else
                ref(pa, 128, r, w, 3);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("interp8_vps_%s,%s,verify_bad=%d,median_total=%llu\n",
           shape, which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
