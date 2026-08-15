// 20k matrix differential for the inlined interp8 vert_ps candidates
// (10 shapes x coeffIdx 1/2/3) vs primitives.pu[LUMA_WxH].luma_vps.
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

#define DECL(W, H) \
    extern "C" void dynopt_interp8_vps_##W##x##H##_sve2( \
        const uint8_t*, intptr_t, int16_t*, intptr_t, int)
DECL(8, 8); DECL(16, 8); DECL(8, 16); DECL(16, 16); DECL(16, 32);
DECL(32, 16); DECL(32, 32); DECL(32, 64); DECL(64, 32); DECL(64, 64);

struct Shape { int w, h; void (*fn)(const uint8_t*, intptr_t, int16_t*,
                                    intptr_t, int); };

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    const Shape shapes[] = {
        {8, 8, dynopt_interp8_vert_ps_8x8},
        {16, 8, dynopt_interp8_vert_ps_16x8},
        {8, 16, dynopt_interp8_vert_ps_8x16},
        {16, 16, dynopt_interp8_vert_ps_16x16},
        {16, 32, dynopt_interp8_vert_ps_16x32},
        {32, 16, dynopt_interp8_vert_ps_32x16},
        {32, 32, dynopt_interp8_vert_ps_32x32},
        {32, 64, dynopt_interp8_vert_ps_32x64},
        {64, 32, dynopt_interp8_vert_ps_64x32},
        {64, 64, dynopt_interp8_vert_ps_64x64},
    };
    std::mt19937 rng(0x4E97u);
    uint8_t buf[128 * 128];
    for (int i = 0; i < 128 * 128; i++)
        buf[i] = (uint8_t)rng();
    int total_bad = 0;
    for (const auto& s : shapes)
    {
        pixelcmp_t pu = primitives.pu[LUMA_8x8].satd;  // placeholder
        (void)pu;
        filter_ps_t ref = nullptr;
        switch (s.w * 1000 + s.h)
        {
        case 8008: ref = primitives.pu[LUMA_8x8].luma_vps; break;
        case 16008: ref = primitives.pu[LUMA_16x8].luma_vps; break;
        case 8016: ref = primitives.pu[LUMA_8x16].luma_vps; break;
        case 16016: ref = primitives.pu[LUMA_16x16].luma_vps; break;
        case 16032: ref = primitives.pu[LUMA_16x32].luma_vps; break;
        case 32016: ref = primitives.pu[LUMA_32x16].luma_vps; break;
        case 32032: ref = primitives.pu[LUMA_32x32].luma_vps; break;
        case 32064: ref = primitives.pu[LUMA_32x64].luma_vps; break;
        case 64032: ref = primitives.pu[LUMA_64x32].luma_vps; break;
        case 64064: ref = primitives.pu[LUMA_64x64].luma_vps; break;
        }
        if (!ref)
        {
            printf("shape %dx%d: no ref\n", s.w, s.h);
            return 2;
        }
        for (int ci = 1; ci <= 3; ci++)
        {
            int bad = 0;
            for (int t = 0; t < 20000; t++)
            {
                static int16_t r[64 * 64 + 16], g[64 * 64 + 16];
                const uint8_t* pa = buf + (t % 64) * 128;
                ref(pa, 128, r, s.w, ci);
                s.fn(pa, 128, g, s.w, ci);
                if (std::memcmp(r, g, (size_t)s.w * s.h * 2) != 0)
                    bad++;
            }
            if (bad)
                printf("shape %dx%d ci=%d bad=%d\n", s.w, s.h, ci, bad);
            total_bad += bad;
        }
    }
    printf("interp8_vps_matrix verify bad=%d\n", total_bad);
    return total_bad != 0;
}
