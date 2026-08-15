// 20k differential + CNTVCT paired for inlined psyCost_pp candidates.
// Usage: psy_cost_verify <8x8|16x16|32x32|64x64> <neon|cand> samples batch
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_psy_cost_pp_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_psy_cost_pp_16x16_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_psy_cost_pp_32x32_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_psy_cost_pp_64x64_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

// weak defaults so a single-shape link succeeds; strong candidate
// symbols (when linked) override them
#define WEAK_STUB(NAME) \
    extern "C" int NAME(const uint8_t*, intptr_t, const uint8_t*, intptr_t) \
        __attribute__((weak)); \
    extern "C" int NAME(const uint8_t* a, intptr_t s1, \
                        const uint8_t* b, intptr_t s2) { \
        (void)a; (void)s1; (void)b; (void)s2; return 0; }
WEAK_STUB(dynopt_psy_cost_pp_8x8_sve2)
WEAK_STUB(dynopt_psy_cost_pp_16x16_sve2)
WEAK_STUB(dynopt_psy_cost_pp_32x32_sve2)
WEAK_STUB(dynopt_psy_cost_pp_64x64_sve2)

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

int main(int argc, char** argv)
{
    const char* shape = argc > 1 ? argv[1] : "32x32";
    const int which = argc > 2 && !strcmp(argv[2], "cand");
    const int samples = argc > 3 ? atoi(argv[3]) : 30;
    const int batch = argc > 4 ? atoi(argv[4]) : 128;
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t ref = nullptr;
    int (*cand)(const uint8_t*, intptr_t, const uint8_t*, intptr_t) = nullptr;
    int n = 32;
    if (!strcmp(shape, "8x8"))
    {
        ref = primitives.cu[BLOCK_8x8].psy_cost_pp;
        cand = dynopt_psy_cost_pp_8x8_sve2;
        n = 8;
    }
    else if (!strcmp(shape, "16x16"))
    {
        ref = primitives.cu[BLOCK_16x16].psy_cost_pp;
        cand = dynopt_psy_cost_pp_16x16_sve2;
        n = 16;
    }
    else if (!strcmp(shape, "32x32"))
    {
        ref = primitives.cu[BLOCK_32x32].psy_cost_pp;
        cand = dynopt_psy_cost_pp_32x32_sve2;
        n = 32;
    }
    else if (!strcmp(shape, "64x64"))
    {
        ref = primitives.cu[BLOCK_64x64].psy_cost_pp;
        cand = dynopt_psy_cost_pp_64x64_sve2;
        n = 64;
    }
    if (!ref || !cand)
        return 2;
    std::mt19937 rng(0x5A8Eu);
    std::vector<uint8_t> a(96 * 96), b(96 * 96);
    for (size_t i = 0; i < a.size(); i++)
    {
        a[i] = (uint8_t)rng();
        b[i] = (uint8_t)rng();
    }
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        const uint8_t* pa = a.data() + (t % 48) * 96;
        const uint8_t* pb = b.data() + (t % 48) * 96;
        if (ref(pa, 96, pb, 96) != cand(pa, 96, pb, 96))
            bad++;
    }
    std::vector<uint64_t> times;
    for (int s = 0; s < samples; s++)
    {
        const uint8_t* pa = a.data() + (s % 48) * 96;
        const uint8_t* pb = b.data() + (s % 48) * 96;
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
                cand(pa, 96, pb, 96);
            else
                ref(pa, 96, pb, 96);
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
    }
    std::sort(times.begin(), times.end());
    printf("psy_cost_%s,%s,verify_bad=%d,median_total=%llu\n",
           shape, which ? "cand" : "neon", bad,
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
