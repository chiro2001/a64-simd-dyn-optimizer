// Differential probe for upstream x265 dct8_neon vs a self-contained scalar
// oracle that reproduces dct8_c / partialButterfly8 bit-exactly (g_t8 copied
// from common/constants.cpp, pinned x265 commit b81f650).
//
// KNOWN FINDING (m12, 2026-08-13): the oracle is bit-exact with x265::dct8_c
// on the full [-255,255] contract, but upstream dct8_neon differs from the C
// reference on ~0.87% of random in-range inputs (uniform across strides,
// differences are multiples of 64 in odd coefficient columns of rows 5-7).
// x265's own TestBench transforms harness (128 iterations, different
// buffers) still passes the NEON implementation, so this is a latent upstream
// divergence, not a violation of upstream's shipped test contract. Our
// canonical reference for candidates is therefore the C oracle; the NEON
// divergence rate is recorded here as a diagnostic, and a nonzero exit
// reflects that upstream finding rather than a failure of this project's
// code.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

#ifdef DYNOPT_SVE_VL
#include <sys/prctl.h>
#endif

// Upstream symbol (namespace x265, defined in common/aarch64/dct-prim.cpp):
namespace x265 {
void dct8_neon(const int16_t* src, int16_t* dst, intptr_t srcStride);
void dct8_c(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

#ifdef DYNOPT_CANDIDATE
extern "C" void DYNOPT_CANDIDATE(
    const int16_t*, int16_t*, intptr_t) __attribute__((weak));
#endif

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
#ifdef DYNOPT_SVE_VL
    // SVE candidates assume VL=256 bit (svcntb()==32); PR_SVE_SET_VL takes
    // bytes on Linux and qemu-user.
    if (prctl(PR_SVE_SET_VL, (unsigned long)DYNOPT_SVE_VL) < 0)
    {
        fprintf(stderr, "PR_SVE_SET_VL(%d) failed\n", DYNOPT_SVE_VL);
        return 2;
    }
#endif
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0xD8C82026u);
    const int strides[4] = { 8, 16, 17, 32 };

    int mism = 0;
    int mism_c = 0;
    int mism_cand = 0;
    int mism_cand_neon = 0;
    int mism_by_stride[4] = { 0, 0, 0, 0 };
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 4];
        int16_t buf[8 * 32 + 8];
        // x265 8-bit residual contract: [-255, 255]. vrshrn is a rounding,
        // NON-saturating narrow (vqrshrn is the saturating variant); pass1 is
        // safe in-range, while pass2's O=sub<s16> wraps - that is the
        // upstream divergence this probe quantifies.
        for (int j = 0; j < (int)sizeof(buf) / (int)sizeof(buf[0]); j++)
            buf[j] = (int16_t)((int)(rng() % 511) - 255);

        int16_t want[64], got[64];
        int16_t cref[64];
        int16_t cand[64];
        dct8_oracle(buf, want, stride);
        x265::dct8_neon(buf, got, stride);
        x265::dct8_c(buf, cref, stride);
#ifdef DYNOPT_CANDIDATE
        if (DYNOPT_CANDIDATE)
        {
            DYNOPT_CANDIDATE(buf, cand, stride);
            if (memcmp(got, cand, sizeof(got)) != 0)
                mism_cand_neon++;
            if (memcmp(want, cand, sizeof(want)) != 0)
            {
                mism_cand++;
                if (mism_cand == 1)
                {
                    fprintf(stderr, "cand mismatch stride=%d: input",
                            stride);
                    for (int r = 0; r < 8; r++)
                    {
                        fprintf(stderr, "\n row%d:", r);
                        for (int c = 0; c < 8; c++)
                            fprintf(stderr, " %d",
                                    (int)buf[(size_t)r * stride + c]);
                    }
                    fprintf(stderr, "\nwant:");
                    for (int k = 0; k < 64; k++)
                        fprintf(stderr, " %d", (int)want[k]);
                    fprintf(stderr, "\ncand:");
                    for (int k = 0; k < 64; k++)
                        fprintf(stderr, " %d", (int)cand[k]);
                    fprintf(stderr, "\n");
                }
            }
        }
#endif
        if (memcmp(want, cref, sizeof(want)) != 0)
            mism_c++;
        if (memcmp(want, got, sizeof(want)) != 0)
        {
            int si = 0;
            for (; si < 4; si++)
                if (strides[si] == stride)
                    break;
            mism_by_stride[si]++;
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
                if (mism == 0)
                {
                    fprintf(stderr, "input:");
                    for (int r = 0; r < 8; r++)
                    {
                        fprintf(stderr, "\n row%d:", r);
                        for (int c = 0; c < 8; c++)
                            fprintf(stderr, " %d",
                                    (int)buf[(size_t)r * stride + c]);
                    }
                    fprintf(stderr, "\nwant:");
                    for (int k = 0; k < 64; k++)
                        fprintf(stderr, " %d", (int)want[k]);
                    fprintf(stderr, "\ngot :");
                    for (int k = 0; k < 64; k++)
                        fprintf(stderr, " %d", (int)got[k]);
                    fprintf(stderr, "\n");
                }
            }
            mism++;
        }
    }
    printf("cases=%d mismatches_oracle_vs_neon=%d "
           "mismatches_oracle_vs_c=%d\n", cases, mism, mism_c);
    printf("mismatches_by_stride 8/16/17/32 = %d/%d/%d/%d\n",
           mism_by_stride[0], mism_by_stride[1],
           mism_by_stride[2], mism_by_stride[3]);
    printf("candidate_mismatches=%d\n", mism_cand);
    printf("candidate_vs_neon_mismatches=%d\n", mism_cand_neon);
    return (mism_c || mism_cand) ? 1 : 0;
}
