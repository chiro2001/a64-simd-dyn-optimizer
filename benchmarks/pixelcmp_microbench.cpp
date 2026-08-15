// CNTVCT A/B for pixelcmp family (satd/sad/sa8d) on 920B.
// Usage: pixelcmp_microbench <satd16|sad16|sa8d16> <neon|cand> samples batch
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_satd_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sad_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_sa8d_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    if (argc < 4)
        return 2;
    const char* op = argv[1];
    const int which = !strcmp(argv[2], "cand");
    const int samples = atoi(argv[3]);
    const int batch = argc > 4 ? atoi(argv[4]) : 16;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t neon = nullptr;
    int (*cand)(const uint8_t*, intptr_t, const uint8_t*, intptr_t) = nullptr;
    if (!strcmp(op, "satd16"))
    {
        neon = primitives.pu[LUMA_16x16].satd;
        cand = dynopt_satd_16x16_sve2;
    }
    else if (!strcmp(op, "sad16"))
    {
        neon = primitives.pu[LUMA_16x16].sad;
        cand = dynopt_sad_16x16_sve2;
    }
    else if (!strcmp(op, "sa8d16"))
    {
        neon = primitives.cu[BLOCK_16x16].sa8d;
        cand = dynopt_sa8d_16x16_sve2;
    }
    else if (!strcmp(op, "satd8"))
    {
        neon = primitives.pu[LUMA_8x8].satd;
        cand = dynopt_satd_8x8_sve2;
    }
    if (!neon || !cand)
        return 2;
    std::mt19937 rng(0x51A7u);
    std::vector<uint8_t> a(64 * 64), b(64 * 64);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)(rng() & 0xFF);
        b[i] = (uint8_t)(rng() & 0xFF);
    }
    std::vector<uint64_t> times;
    volatile int sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                sink += cand(a.data(), 64, b.data(), 64);
            else
                sink += neon(a.data(), 64, b.data(), 64);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("%s,%s,median=%llu\n", op, which ? "cand" : "neon",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
