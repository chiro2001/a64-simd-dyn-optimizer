// Prototype (c): full-width 128-bit row processing + stride-direct loads.
//
// Round-0006 prototype (c): load each row as one int16x8_t directly with the
// caller stride (no intermediate block buffer), compute E/O pairs with one
// widening add/sub per row, and keep the TREE-shaped odd-column reduction
// (upstream structure) so the critical path stays short on N1. O is computed
// in s32 (vsubl_s16) in both passes: this is also the C-exact fix.

#include <arm_neon.h>
#include <cstddef>
#include <cstdint>

static const int32_t t8_even[4][4] =
{
    { 64,  64, 64,  64 },
    { 83,  36, 83,  36 },
    { 64, -64, 64, -64 },
    { 36, -83, 36, -83 },
};

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

template<int shift>
static inline void butterfly_rows(const int16x8_t* rows, int16x8_t* out)
{
    const int line = 8;
    int32x4_t EE[4];
    int32x4_t EO[4];
    int32x4_t O[8];

    for (int i = 0; i < line; i += 2)
    {
        // full-width: one widening add/sub per row yields the 4 E/O pairs
        int16x4_t lo0 = vget_low_s16(rows[i]);
        int16x4_t hi0 = vrev64_s16(vget_high_s16(rows[i]));
        int16x4_t lo1 = vget_low_s16(rows[i + 1]);
        int16x4_t hi1 = vrev64_s16(vget_high_s16(rows[i + 1]));

        int32x4_t E0 = vaddl_s16(lo0, hi0);
        int32x4_t E1 = vaddl_s16(lo1, hi1);
        O[i + 0] = vsubl_s16(lo0, hi0);
        O[i + 1] = vsubl_s16(lo1, hi1);

        int32x4_t t0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(E0), vreinterpretq_s64_s32(E1)));
        int32x4_t t1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(E0), vreinterpretq_s64_s32(E1))));
        EE[i / 2] = vaddq_s32(t0, t1);
        EO[i / 2] = vsubq_s32(t0, t1);
    }

    int32x4_t c0 = vld1q_s32(t8_even[0]);
    int32x4_t c2 = vld1q_s32(t8_even[1]);
    int32x4_t c4 = vld1q_s32(t8_even[2]);
    int32x4_t c6 = vld1q_s32(t8_even[3]);
    int16x4_t c1 = vld1_s16(g_t8[1]);
    int16x4_t c3 = vld1_s16(g_t8[3]);
    int16x4_t c5 = vld1_s16(g_t8[5]);
    int16x4_t c7 = vld1_s16(g_t8[7]);
    // Hoist the odd-column coefficient widening out of the loop: the
    // constants are the same for both j-groups.
    int32x4_t c1w = vmovl_s16(c1);
    int32x4_t c3w = vmovl_s16(c3);
    int32x4_t c5w = vmovl_s16(c5);
    int32x4_t c7w = vmovl_s16(c7);

    int16x4_t res[2][8];
    for (int b = 0, j = 0; b < 2; b++, j += 4)
    {
        // odd columns: tree-shaped s32 reduction (short critical path)
        int32x4_t t01 = vpaddq_s32(vmulq_s32(c1w, O[j + 0]),
                                   vmulq_s32(c1w, O[j + 1]));
        int32x4_t t23 = vpaddq_s32(vmulq_s32(c1w, O[j + 2]),
                                   vmulq_s32(c1w, O[j + 3]));
        res[b][1] = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);

        t01 = vpaddq_s32(vmulq_s32(c3w, O[j + 0]),
                         vmulq_s32(c3w, O[j + 1]));
        t23 = vpaddq_s32(vmulq_s32(c3w, O[j + 2]),
                         vmulq_s32(c3w, O[j + 3]));
        res[b][3] = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);

        t01 = vpaddq_s32(vmulq_s32(c5w, O[j + 0]),
                         vmulq_s32(c5w, O[j + 1]));
        t23 = vpaddq_s32(vmulq_s32(c5w, O[j + 2]),
                         vmulq_s32(c5w, O[j + 3]));
        res[b][5] = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);

        t01 = vpaddq_s32(vmulq_s32(c7w, O[j + 0]),
                         vmulq_s32(c7w, O[j + 1]));
        t23 = vpaddq_s32(vmulq_s32(c7w, O[j + 2]),
                         vmulq_s32(c7w, O[j + 3]));
        res[b][7] = vrshrn_n_s32(vpaddq_s32(t01, t23), shift);

        // even columns (upstream structure)
        int32x4_t e0 = vpaddq_s32(EE[j / 2 + 0], EE[j / 2 + 1]);
        res[b][0] = vrshrn_n_s32(vmulq_s32(c0, e0), shift);
        int32x4_t e2a = vmulq_s32(c2, EO[j / 2 + 0]);
        int32x4_t e2b = vmulq_s32(c2, EO[j / 2 + 1]);
        res[b][2] = vrshrn_n_s32(vpaddq_s32(e2a, e2b), shift);
        int32x4_t e4a = vmulq_s32(c4, EE[j / 2 + 0]);
        int32x4_t e4b = vmulq_s32(c4, EE[j / 2 + 1]);
        res[b][4] = vrshrn_n_s32(vpaddq_s32(e4a, e4b), shift);
        int32x4_t e6a = vmulq_s32(c6, EO[j / 2 + 0]);
        int32x4_t e6b = vmulq_s32(c6, EO[j / 2 + 1]);
        res[b][6] = vrshrn_n_s32(vpaddq_s32(e6a, e6b), shift);
    }
    for (int k = 0; k < 8; k++)
    {
        out[k] = vcombine_s16(res[0][k], res[1][k]);
    }
}

extern "C" void dynopt_dct8_neon_candidate(const int16_t* src, int16_t* dst,
                                           intptr_t srcStride)
{
    int16x8_t r[8], t[8];
    int16_t coef[64];
    for (int i = 0; i < 8; i++)
        r[i] = vld1q_s16(src + (size_t)i * srcStride);
    butterfly_rows<2>(r, t);
    for (int k = 0; k < 8; k++)
        vst1q_s16(coef + k * 8, t[k]);
    for (int i = 0; i < 8; i++)
        r[i] = vld1q_s16(coef + i * 8);
    butterfly_rows<9>(r, t);
    for (int i = 0; i < 8; i++)
        vst1q_s16(dst + i * 8, t[i]);
}
