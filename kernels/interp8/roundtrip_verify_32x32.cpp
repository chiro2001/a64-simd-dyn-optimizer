// Differential probe for the generated interp8 32x32 roundtrip candidate
// against the upstream x265::interp8_horiz_pp_dotprod<32,32> reference.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

namespace x265 {
template <int W, int H>
void interp8_horiz_pp_dotprod(const uint8_t*, intptr_t, uint8_t*, intptr_t,
                              int);
}

extern "C" void dynopt_interp8_32x32_neon_roundtrip(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    std::mt19937 rng(0xD16C2026u);
    const int strides[3] = { 32, 64, 96 };

    long mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const intptr_t ss = strides[rng() % 3];
        const intptr_t ds = strides[rng() % 3];
        const int ph = (int)(rng() % 8);
        uint8_t src[32 * 96 + 32], wa[32 * 96], wb[32 * 96];
        for (int j = 0; j < (int)sizeof(src); j++)
            src[j] = (uint8_t)(rng() % 256);
        x265::interp8_horiz_pp_dotprod<32, 32>(src, ss, wa, ds, ph);
        dynopt_interp8_32x32_neon_roundtrip(src, ss, wb, ds, ph);
        for (int r = 0; r < 32; r++)
            if (memcmp(wa + r * ds, wb + r * ds, 32) != 0)
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
