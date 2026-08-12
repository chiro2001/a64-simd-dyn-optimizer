// Differential verify for upstream x265 luma_hvpp (8-tap 2D) vs a
// self-contained C oracle: horizontal ps (pixel -> short, IF_INTERNAL_PREC)
// then vertical sp (short -> pixel). Covers idxX,idxY in 1..3.
#include "primitives.h"

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

using namespace X265_NS;

static void hvpp_c(const pixel* src, intptr_t srcStride, pixel* dst,
                   intptr_t dstStride, int idxX, int idxY)
{
    // horizontal pixel->short (shift 0, offset -IF_INTERNAL_OFFS)
    int16_t immed[8 * (8 + 8 - 1)];
    src -= 3 + 3 * srcStride;
    for (int row = 0; row < 8 + 7; row++)
        for (int col = 0; col < 8; col++)
        {
            int sum = 0;
            for (int k = 0; k < 8; k++)
                sum += src[(size_t)row * srcStride + col + k]
                    * g_lumaFilter[idxX][k];
            immed[row * 8 + col] = (int16_t)(sum - (1 << 13));
        }
    // vertical short->pixel: (sum + offset) >> 12, then clamp
    const int offset = (1 << 11) + ((1 << 13) << 6);
    for (int row = 0; row < 8; row++)
        for (int col = 0; col < 8; col++)
        {
            int sum = 0;
            for (int k = 0; k < 8; k++)
                sum += immed[(row + k) * 8 + col] * g_lumaFilter[idxY][k];
            int val = (sum + offset) >> 12;
            val = val < 0 ? 0 : val;
            val = val > 255 ? 255 : val;
            dst[(size_t)row * dstStride + col] = (pixel)val;
        }
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 20000;
    EncoderPrimitives cprim, neon;
    std::memset(&cprim, 0, sizeof(cprim));
    std::memset(&neon, 0, sizeof(neon));
    setupCPrimitives(cprim);
    setupAliasPrimitives(cprim);
    const int cpu = cpu_detect(false);
    setupIntrinsicPrimitives(neon, cpu);
    setupAssemblyPrimitives(neon, cpu);
    setupAliasPrimitives(neon);

    std::mt19937 rng(0x1A8A8u);
    int mism = 0;
    for (int t = 0; t < cases && mism < 5; t++)
    {
        pixel a[64 * 64], want[64 * 64], got[64 * 64];
        for (int i = 0; i < 64 * 64; i++)
            a[i] = (pixel)(rng() & 0xFF);
        const int off = 3 + 3 * 64;
        for (int idxX = 1; idxX <= 3; idxX++)
            for (int idxY = 1; idxY <= 3; idxY++)
            {
                hvpp_c(a + off, 64, want, 8, idxX, idxY);
                cprim.pu[LUMA_8x8].luma_hvpp(a + off, 64, got, 8, idxX, idxY);
                if (memcmp(want, got, 64) != 0)
                {
                    for (int r = 0; r < 8; r++)
                        for (int c = 0; c < 8; c++)
                            if (want[r * 8 + c] != got[r * 8 + c])
                            {
                                fprintf(stderr,
                                        "c-oracle diff t=%d idx=(%d,%d)"
                                        " r=%d c=%d want=%d got=%d off=%d\n",
                                        t, idxX, idxY, r, c,
                                        want[r * 8 + c], got[r * 8 + c],
                                        want[r * 8 + c] - got[r * 8 + c]);
                                goto cnext;
                            }
cnext:
                    mism++;
                    continue;
                }
                neon.pu[LUMA_8x8].luma_hvpp(a + off, 64, got, 8, idxX, idxY);
                if (memcmp(want, got, 64) != 0)
                {
                    if (mism == 0)
                    {
                        for (int r = 0; r < 8; r++)
                            for (int c = 0; c < 8; c++)
                                if (want[r * 8 + c] != got[r * 8 + c])
                                {
                                    fprintf(stderr,
                                            "neon first diff t=%d idx=(%d,%d)"
                                            " r=%d c=%d want=%d got=%d"
                                            " (off=%d)\n",
                                            t, idxX, idxY, r, c,
                                            want[r * 8 + c], got[r * 8 + c],
                                            want[r * 8 + c] - got[r * 8 + c]);
                                    goto next_idx;
                                }
                    }
next_idx:
                    fprintf(stderr, "neon mismatch t=%d idx=(%d,%d)\n",
                            t, idxX, idxY);
                    mism++;
                }
            }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
