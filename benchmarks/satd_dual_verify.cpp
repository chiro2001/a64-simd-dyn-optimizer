// 20k differential for the inlined SATD 8x16 / 16x8 candidates vs x265
// primitives (LUMA_8x16 / LUMA_16x8 satd).
// Build with -DSATD_PU=LUMA_8x16 -DSATD_FUNC=dynopt_satd_8x16_sve2
#ifndef SATD_PU
#define SATD_PU LUMA_8x16
#endif
#ifndef SATD_FUNC
#define SATD_FUNC dynopt_satd_8x16_sve2
#endif
#ifndef SATD_ROWS
#define SATD_ROWS 16
#endif
#ifndef SATD_COLS
#define SATD_COLS 8
#endif
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int SATD_FUNC(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

// independent C oracle: sum over 4x4 blocks of |H4(d)| >> 1 (matches
// x265 satd_8x4-band semantics)
static int oracle_satd(const uint8_t* a, intptr_t sa,
                       const uint8_t* b, intptr_t sb, int rows, int cols)
{
    static const int H[4][4] = {{1,1,1,1},{1,-1,1,-1},
                                {1,1,-1,-1},{1,-1,-1,1}};
    int want = 0;
    // Each 8x4 band: (s_left + s_right) >> 1 like x265 satd_8x4.
    for (int br = 0; br < rows; br += 4)
        for (int bc = 0; bc < cols; bc += 8)
        {
            int s[2] = {0, 0};
            for (int half = 0; half < 2; half++)
                for (int pr = 0; pr < 4; pr++)
                    for (int pc = 0; pc < 4; pc++)
                    {
                        int coef = 0;
                        for (int i = 0; i < 4; i++)
                            for (int j = 0; j < 4; j++)
                                coef += H[pr][i] * H[pc][j] * (
                                    a[(br + i) * sa + bc + half * 4 + j] -
                                    b[(br + i) * sb + bc + half * 4 + j]);
                        s[half] += coef < 0 ? -coef : coef;
                    }
            want += (s[0] + s[1]) >> 1;
        }
    return want;
}

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    pixelcmp_t ref = primitives.pu[SATD_PU].satd;
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        uint8_t a[32 * 32], b[32 * 32];
        for (int i = 0; i < 32 * 32; i++)
        {
            a[i] = (uint8_t)rng();
            b[i] = (uint8_t)rng();
        }
        const int r = ref(a, 32, b, 32);
        const int d = SATD_FUNC(a, 32, b, 32);
        const int o = oracle_satd(a, 32, b, 32, SATD_ROWS, SATD_COLS);
        if (r != d || r != o)
        {
            if (bad < 8)
                printf("mismatch t=%d ref=%d dyn=%d oracle=%d\n",
                       t, r, d, o);
            bad++;
        }
    }
    printf("satd_dual verify bad=%d\n", bad);
    return bad != 0;
}
