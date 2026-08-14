// Differential probe for the generated interp8 vpp 16x16 roundtrip
// candidate (case coeffIdx==1) against the upstream
// x265::interp_vert_pp_neon<8,16,16> reference at coeffIdx=1.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
template <int N, int W, int H>
void interp_vert_pp_neon(const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
}

extern "C" void dynopt_interp8vpp_16x16_case1_neon_roundtrip(
    const uint8_t*, intptr_t, uint8_t*, intptr_t);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 16, 32, 64 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ss = strides[rng() % 3];
        const intptr_t ds = strides[rng() % 3];
        // vpp reads src - 3*stride .. src + 4*stride; pad 3 rows in front.
        uint8_t srcbuf[16 * 64 + 4 * 64 + 64], wa[16 * 64], wb[16 * 64];
        uint8_t* src = srcbuf + 3 * 64;
        for (int j = 0; j < (int)sizeof(srcbuf); j++)
            srcbuf[j] = (uint8_t)(rng() % 256);
        x265::interp_vert_pp_neon<8, 16, 16>(src, ss, wa, ds, 1);
        dynopt_interp8vpp_16x16_case1_neon_roundtrip(src, ss, wb, ds);
        for (int r = 0; r < 16; r++)
            if (memcmp(wa + r * ds, wb + r * ds, 16) != 0)
            {
                if (mism < 5)
                    fprintf(stderr, "row %d stride %ld/%ld\n",
                            r, (long)ss, (long)ds);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%ld\n", cases, mism);
    return mism ? 1 : 0;
}
