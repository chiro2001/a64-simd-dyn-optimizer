// 20k differential for SVE1 satd8 candidates vs x265 primitives
// (LUMA_8x8 satd, NEON on aarch64).
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_satd_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t ref = primitives.pu[LUMA_8x8].satd;
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        uint8_t a[64], b[64];
        for (int i = 0; i < 64; i++)
        {
            a[i] = (uint8_t)rng();
            b[i] = (uint8_t)rng();
        }
        const int r = ref(a, 8, b, 8);
        const int d = dynopt_satd_8x8_sve2(a, 8, b, 8);
        if (r != d)
        {
            if (bad < 5)
                printf("mismatch t=%d ref=%d dyn=%d\n", t, r, d);
            bad++;
        }
    }
    printf("satd8_sve1 verify bad=%d\n", bad);
    return bad != 0;
}
