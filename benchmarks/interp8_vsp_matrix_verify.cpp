// Matrix differential for inlined interp8 vsp candidates
// (6 shapes x coeffIdx 1/2/3) vs primitives luma_vsp.
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

#define DECL(W, H) \
    extern "C" void dynopt_interp8_vsp_##W##x##H##_sve2( \
        const int16_t*, intptr_t, uint8_t*, intptr_t, int)
DECL(8, 8); DECL(8, 16); DECL(16, 16); DECL(16, 32);
DECL(32, 16); DECL(32, 32);

struct Shape { int w, h; void (*fn)(const int16_t*, intptr_t, uint8_t*,
                                    intptr_t, int); };

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    const Shape shapes[] = {
        {8, 8, dynopt_interp8_vsp_8x8_sve2},
        {8, 16, dynopt_interp8_vsp_8x16_sve2},
        {16, 16, dynopt_interp8_vsp_16x16_sve2},
        {16, 32, dynopt_interp8_vsp_16x32_sve2},
        {32, 16, dynopt_interp8_vsp_32x16_sve2},
        {32, 32, dynopt_interp8_vsp_32x32_sve2},
    };
    std::mt19937 rng(0x4EA0u);
    int16_t buf[160 * 160];
    for (int i = 0; i < 160 * 160; i++)
        buf[i] = (int16_t)((int)(rng() & 0x3FFF) - 0x2000);
    int total_bad = 0;
    for (const auto& s : shapes)
    {
        filter_sp_t ref = nullptr;
        switch (s.w * 1000 + s.h)
        {
        case 8008: ref = primitives.pu[LUMA_8x8].luma_vsp; break;
        case 8016: ref = primitives.pu[LUMA_8x16].luma_vsp; break;
        case 16016: ref = primitives.pu[LUMA_16x16].luma_vsp; break;
        case 16032: ref = primitives.pu[LUMA_16x32].luma_vsp; break;
        case 32016: ref = primitives.pu[LUMA_32x16].luma_vsp; break;
        case 32032: ref = primitives.pu[LUMA_32x32].luma_vsp; break;
        }
        if (!ref)
            return 2;
        for (int ci = 1; ci <= 3; ci++)
        {
            int bad = 0;
            for (int t = 0; t < 20000; t++)
            {
                static uint8_t r[96 * 96 + 16], g[96 * 96 + 16];
                const int16_t* ps = buf + (t % 80) * 160;
                ref(ps, 160, r, s.w, ci);
                s.fn(ps, 160, g, s.w, ci);
                if (std::memcmp(r, g, (size_t)s.w * s.h) != 0)
                    bad++;
            }
            if (bad)
                printf("vsp %dx%d ci=%d bad=%d\n", s.w, s.h, ci, bad);
            total_bad += bad;
        }
    }
    printf("interp8_vsp_matrix verify bad=%d\n", total_bad);
    return total_bad != 0;
}
