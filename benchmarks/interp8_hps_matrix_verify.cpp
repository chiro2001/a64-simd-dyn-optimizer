// Matrix differential for inlined interp8 hps candidates
// (6 shapes x coeffIdx 1/2/3, isRowExt 0/1) vs luma_hps.
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

#define DECL(W, H) \
    extern "C" void dynopt_interp8_hps_##W##x##H##_sve2( \
        const uint8_t*, intptr_t, int16_t*, intptr_t, int, int)
DECL(8, 16); DECL(16, 8); DECL(16, 16); DECL(16, 32);
DECL(32, 16); DECL(32, 32);

struct Shape { int w, h; void (*fn)(const uint8_t*, intptr_t, int16_t*,
                                    intptr_t, int, int); };

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    const Shape shapes[] = {
        {8, 16, dynopt_interp8_hps_8x16_sve2},
        {16, 8, dynopt_interp8_hps_16x8_sve2},
        {16, 16, dynopt_interp8_hps_16x16_sve2},
        {16, 32, dynopt_interp8_hps_16x32_sve2},
        {32, 16, dynopt_interp8_hps_32x16_sve2},
        {32, 32, dynopt_interp8_hps_32x32_sve2},
    };
    std::mt19937 rng(0x4E98u);
    uint8_t buf[160 * 160];
    for (int i = 0; i < 160 * 160; i++)
        buf[i] = (uint8_t)rng();
    int total_bad = 0;
    for (const auto& s : shapes)
    {
        filter_hps_t ref = nullptr;
        switch (s.w * 1000 + s.h)
        {
        case 8016: ref = primitives.pu[LUMA_8x16].luma_hps; break;
        case 16008: ref = primitives.pu[LUMA_16x8].luma_hps; break;
        case 16016: ref = primitives.pu[LUMA_16x16].luma_hps; break;
        case 16032: ref = primitives.pu[LUMA_16x32].luma_hps; break;
        case 32016: ref = primitives.pu[LUMA_32x16].luma_hps; break;
        case 32032: ref = primitives.pu[LUMA_32x32].luma_hps; break;
        }
        if (!ref)
        {
            printf("shape %dx%d: no ref\n", s.w, s.h);
            return 2;
        }
        for (int ci = 1; ci <= 3; ci++)
            for (int ext = 0; ext <= 1; ext++)
            {
                const int cases = ext ? 2000 : 20000;
                int bad = 0;
                for (int t = 0; t < cases; t++)
                {
                    static int16_t r[96 * 96 + 16], g[96 * 96 + 16];
                    const uint8_t* pa = buf + (t % 80) * 160;
                    ref(pa, 160, r, s.w, ci, ext);
                    s.fn(pa, 160, g, s.w, ci, ext);
                    if (std::memcmp(r, g, (size_t)s.w * (s.h + 7) * 2) != 0)
                        bad++;
                }
                if (bad)
                    printf("hps %dx%d ci=%d ext=%d bad=%d\n",
                           s.w, s.h, ci, ext, bad);
                total_bad += bad;
            }
    }
    printf("interp8_hps_matrix verify bad=%d\n", total_bad);
    return total_bad != 0;
}
