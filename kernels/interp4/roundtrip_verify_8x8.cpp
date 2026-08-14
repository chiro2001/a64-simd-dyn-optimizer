// Differential probe for the generated interp4 8x8 roundtrip candidate
// against the upstream x265::interp4_horiz_pp_dotprod<8,8> reference
// (phase 4 identity filter excluded, matching the 7-phase contract).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
template <int W, int H>
void interp4_horiz_pp_dotprod(const uint8_t*, intptr_t, uint8_t*, intptr_t,
                              int);
}

extern "C" void dynopt_interp4_8x8_neon_roundtrip(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 50000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 8, 16, 32 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ss = strides[rng() % 3];
        const intptr_t ds = strides[rng() % 3];
        int ph = (int)(rng() % 8);
        if (ph == 4)
            ph = 1;
        uint8_t src[8 * 32 + 32], wa[8 * 32], wb[8 * 32];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() % 256);
        x265::interp4_horiz_pp_dotprod<8, 8>(src, ss, wa, ds, ph);
        dynopt_interp4_8x8_neon_roundtrip(src, ss, wb, ds, ph);
        for (int r = 0; r < 8; r++)
            if (memcmp(wa + r * ds, wb + r * ds, 8) != 0)
            {
                if (mism < 5)
                    fprintf(stderr, "row %d phase %d stride %ld/%ld\n",
                            r, ph, (long)ss, (long)ds);
                mism++;
                break;
            }
    }
    printf("cases=%d mismatches=%ld\n", cases, mism);
    return mism ? 1 : 0;
}
