// Differential verify for upstream x265 dct8_neon vs a self-contained scalar
// oracle that reproduces dct8_c / partialButterfly8 bit-exactly (g_t8 copied
// from common/constants.cpp, pinned x265 commit b81f650).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

// Upstream symbol (C++ linkage, defined in common/aarch64/dct-prim.cpp):
// void dct8_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);
void dct8_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);

static const int16_t g_t8[8][8] =
{
    { 64, 64, 64, 64, 64, 64, 64, 64 },
    { 89, 75, 50, 18, -18, -50, -75, -89 },
    { 83, 36, -36, -83, -83, -36, 36, 83 },
    { 75, -18, -89, -50, 50, 89, 18, -75 },
    { 64, -64, -64, 64, 64, -64, -64, 64 },
    { 50, -89, 18, 75, -75, -18, 89, -50 },
    { 36, -83, 83, -36, -36, 83, -83, 36 },
    { 18, -50, 75, -89, 89, -75, 50, -18 },
};

static void partial_butterfly8(const int16_t* src, int16_t* dst, int shift,
                               int line)
{
    int E[4], O[4];
    int EE[2], EO[2];
    const int add = 1 << (shift - 1);

    for (int j = 0; j < line; j++)
    {
        for (int k = 0; k < 4; k++)
        {
            E[k] = src[k] + src[7 - k];
            O[k] = src[k] - src[7 - k];
        }

        EE[0] = E[0] + E[3];
        EO[0] = E[0] - E[3];
        EE[1] = E[1] + E[2];
        EO[1] = E[1] - E[2];

        dst[0] = (int16_t)((g_t8[0][0] * EE[0] + g_t8[0][1] * EE[1] + add) >> shift);
        dst[4 * line] = (int16_t)((g_t8[4][0] * EE[0] + g_t8[4][1] * EE[1] + add) >> shift);
        dst[2 * line] = (int16_t)((g_t8[2][0] * EO[0] + g_t8[2][1] * EO[1] + add) >> shift);
        dst[6 * line] = (int16_t)((g_t8[6][0] * EO[0] + g_t8[6][1] * EO[1] + add) >> shift);

        dst[line] = (int16_t)((g_t8[1][0] * O[0] + g_t8[1][1] * O[1]
                              + g_t8[1][2] * O[2] + g_t8[1][3] * O[3] + add) >> shift);
        dst[3 * line] = (int16_t)((g_t8[3][0] * O[0] + g_t8[3][1] * O[1]
                                  + g_t8[3][2] * O[2] + g_t8[3][3] * O[3] + add) >> shift);
        dst[5 * line] = (int16_t)((g_t8[5][0] * O[0] + g_t8[5][1] * O[1]
                                  + g_t8[5][2] * O[2] + g_t8[5][3] * O[3] + add) >> shift);
        dst[7 * line] = (int16_t)((g_t8[7][0] * O[0] + g_t8[7][1] * O[1]
                                  + g_t8[7][2] * O[2] + g_t8[7][3] * O[3] + add) >> shift);

        src += 8;
        dst++;
    }
}

static void dct8_oracle(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    const int shift_1st = 2 + 8 - 8;   // X265_DEPTH=8
    const int shift_2nd = 9;
    int16_t coef[8 * 8];
    int16_t block[8 * 8];

    for (int i = 0; i < 8; i++)
        memcpy(&block[i * 8], &src[(size_t)i * srcStride],
               8 * sizeof(int16_t));

    partial_butterfly8(block, coef, shift_1st, 8);
    partial_butterfly8(coef, dst, shift_2nd, 8);
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD8C82026u);
    const int strides[4] = { 8, 16, 17, 32 };

    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 4];
        int16_t buf[8 * 32 + 8];
        for (int j = 0; j < (int)sizeof(buf) / (int)sizeof(buf[0]); j++)
            buf[j] = (int16_t)((int)(rng() & 0x3FF) - 512);   // [-512,511]

        int16_t want[64], got[64];
        dct8_oracle(buf, want, stride);
        dct8_neon(buf, got, stride);
        if (memcmp(want, got, sizeof(want)) != 0)
        {
            if (mism < 5)
            {
                fprintf(stderr, "mismatch %d stride=%d: first-diff ",
                        i, stride);
                for (int k = 0; k < 64; k++)
                {
                    if (want[k] != got[k])
                    {
                        fprintf(stderr, "idx=%d want=%d got=%d\n",
                                k, want[k], got[k]);
                        break;
                    }
                }
            }
            mism++;
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
