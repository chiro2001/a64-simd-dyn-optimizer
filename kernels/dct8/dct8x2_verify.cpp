// Differential probe for the DCT8 x2 SVE2 candidate (two horizontally
// adjacent 8x8 tiles) against the bit-exact scalar oracle. The oracle is
// dct8_c's partialButterfly8 semantics and is the canonical reference
// (upstream dct8_neon itself diverges from it on ~0.87% of the uniform
// [-255,255] contract because of an s16 wrap in its O path).
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

#include <sys/prctl.h>

extern "C" void dynopt_dct8x2_neon_sve2(
    const int16_t*, int16_t*, intptr_t) __attribute__((weak));

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

        dst[0] = (int16_t)((g_t8[0][0] * EE[0] + g_t8[0][1] * EE[1] + add)
                           >> shift);
        dst[4 * line] = (int16_t)((g_t8[4][0] * EE[0] + g_t8[4][1] * EE[1]
                                   + add) >> shift);
        dst[2 * line] = (int16_t)((g_t8[2][0] * EO[0] + g_t8[2][1] * EO[1]
                                   + add) >> shift);
        dst[6 * line] = (int16_t)((g_t8[6][0] * EO[0] + g_t8[6][1] * EO[1]
                                   + add) >> shift);

        dst[line] = (int16_t)((g_t8[1][0] * O[0] + g_t8[1][1] * O[1]
                               + g_t8[1][2] * O[2] + g_t8[1][3] * O[3] + add)
                              >> shift);
        dst[3 * line] = (int16_t)((g_t8[3][0] * O[0] + g_t8[3][1] * O[1]
                                   + g_t8[3][2] * O[2] + g_t8[3][3] * O[3]
                                   + add) >> shift);
        dst[5 * line] = (int16_t)((g_t8[5][0] * O[0] + g_t8[5][1] * O[1]
                                   + g_t8[5][2] * O[2] + g_t8[5][3] * O[3]
                                   + add) >> shift);
        dst[7 * line] = (int16_t)((g_t8[7][0] * O[0] + g_t8[7][1] * O[1]
                                   + g_t8[7][2] * O[2] + g_t8[7][3] * O[3]
                                   + add) >> shift);

        src += 8;
        dst++;
    }
}

static void dct8_oracle(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    const int shift_1st = 2 + 8 - 8;
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
    // SVE2 candidate assumes VL=256 bit (svcntb()==32); PR_SVE_SET_VL takes
    // bytes on Linux and qemu-user.
    if (prctl(PR_SVE_SET_VL, 32UL) < 0)
    {
        fprintf(stderr, "PR_SVE_SET_VL(32) failed\n");
        return 2;
    }

    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD8C82026u);
    const int strides[3] = { 16, 17, 32 };

    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        int16_t buf[8 * 32 + 16];
        for (int j = 0; j < (int)(sizeof(buf) / sizeof(buf[0])); j++)
            buf[j] = (int16_t)((int)(rng() % 511) - 255);

        int16_t wantA[64], wantB[64], cand[128];
        dct8_oracle(buf, wantA, stride);
        dct8_oracle(buf + 8, wantB, stride);
        dynopt_dct8x2_neon_sve2(buf, cand, stride);

        if (memcmp(wantA, cand, 64 * sizeof(int16_t)) != 0 ||
            memcmp(wantB, cand + 64, 64 * sizeof(int16_t)) != 0)
        {
            mism++;
            if (mism == 1)
            {
                fprintf(stderr, "x2 mismatch stride=%d: input", stride);
                for (int r = 0; r < 8; r++)
                {
                    fprintf(stderr, "\n row%d:", r);
                    for (int c = 0; c < 16; c++)
                        fprintf(stderr, " %d",
                                (int)buf[(size_t)r * stride + c]);
                }
                fprintf(stderr, "\nwantA:");
                for (int k = 0; k < 64; k++)
                    fprintf(stderr, " %d", (int)wantA[k]);
                fprintf(stderr, "\nwantB:");
                for (int k = 0; k < 64; k++)
                    fprintf(stderr, " %d", (int)wantB[k]);
                fprintf(stderr, "\ncand:");
                for (int k = 0; k < 128; k++)
                    fprintf(stderr, " %d", (int)cand[k]);
                fprintf(stderr, "\n");
            }
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism != 0;
}
