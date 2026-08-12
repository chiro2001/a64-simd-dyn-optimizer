// Prototype (b): four-column-parallel s32 mul/mla odd columns.
//
// Round-0006 prototype (b). The upstream/widened odd-column computation is
//   per 4-row block: 16 x (smull|vmulq) + 12 x vpaddq + 4 x vrshrn
// This candidate transposes the 4x4 O block and folds each 4-term dot into a
// 4-deep vmlaq_s32 chain:
//   8 x transpose ops + 16 x (vmulq+vmlaq) + 4 x vrshrn
// O is computed in s32 (vsubl_s16) in BOTH passes, which is also the C-exact
// fix (no s16 wrap in pass 2).

#include <arm_neon.h>
#include <cstdint>
#include <cstring>

static const int32_t t8_even[4][4] =
{
    { 64,  64, 64,  64 },
    { 83,  36, 83,  36 },
    { 64, -64, 64, -64 },
    { 36, -83, 36, -83 },
};

template<int shift>
static inline void butterfly(const int16_t* src, int16_t* dst)
{
    const int line = 8;
    int32x4_t EE[4];
    int32x4_t EO[4];
    int32x4_t O[8];

    for (int i = 0; i < line; i += 2)
    {
        int16x4_t s0_lo = vld1_s16(src + i * line);
        int16x4_t s0_hi = vrev64_s16(vld1_s16(src + i * line + 4));
        int16x4_t s1_lo = vld1_s16(src + (i + 1) * line);
        int16x4_t s1_hi = vrev64_s16(vld1_s16(src + (i + 1) * line + 4));

        int32x4_t E0 = vaddl_s16(s0_lo, s0_hi);
        int32x4_t E1 = vaddl_s16(s1_lo, s1_hi);
        O[i + 0] = vsubl_s16(s0_lo, s0_hi);
        O[i + 1] = vsubl_s16(s1_lo, s1_hi);

        int32x4_t t0 = vreinterpretq_s32_s64(
            vzip1q_s64(vreinterpretq_s64_s32(E0), vreinterpretq_s64_s32(E1)));
        int32x4_t t1 = vrev64q_s32(vreinterpretq_s32_s64(
            vzip2q_s64(vreinterpretq_s64_s32(E0), vreinterpretq_s64_s32(E1))));
        EE[i / 2] = vaddq_s32(t0, t1);
        EO[i / 2] = vsubq_s32(t0, t1);
    }

    int16_t* d = dst;
    int32x4_t c0 = vld1q_s32(t8_even[0]);
    int32x4_t c2 = vld1q_s32(t8_even[1]);
    int32x4_t c4 = vld1q_s32(t8_even[2]);
    int32x4_t c6 = vld1q_s32(t8_even[3]);
    for (int j = 0; j < line; j += 4)
    {
        // 4x4 transpose of O[j..j+3] (each int32x4_t holds o=0..3 per row)
        int32x4_t t1 = vtrn1q_s32(O[j + 0], O[j + 1]);
        int32x4_t t2 = vtrn2q_s32(O[j + 0], O[j + 1]);
        int32x4_t t3 = vtrn1q_s32(O[j + 2], O[j + 3]);
        int32x4_t t4 = vtrn2q_s32(O[j + 2], O[j + 3]);
        int32x4_t Oo0 = vcombine_s32(vget_low_s32(t1), vget_low_s32(t3));
        int32x4_t Oo1 = vcombine_s32(vget_low_s32(t2), vget_low_s32(t4));
        int32x4_t Oo2 = vcombine_s32(vget_high_s32(t1), vget_high_s32(t3));
        int32x4_t Oo3 = vcombine_s32(vget_high_s32(t2), vget_high_s32(t4));

        // odd columns: one 4-deep scalar-broadcast mla chain per coefficient
        // (lane = row; the coefficient is the same scalar for every row)
        int32x4_t a1 = vmulq_n_s32(Oo0, 89);
        a1 = vmlaq_n_s32(a1, Oo1, 75);
        a1 = vmlaq_n_s32(a1, Oo2, 50);
        a1 = vmlaq_n_s32(a1, Oo3, 18);
        vst1_s16(d + 1 * line, vrshrn_n_s32(a1, shift));

        int32x4_t a3 = vmulq_n_s32(Oo0, 75);
        a3 = vmlaq_n_s32(a3, Oo1, -18);
        a3 = vmlaq_n_s32(a3, Oo2, -89);
        a3 = vmlaq_n_s32(a3, Oo3, -50);
        vst1_s16(d + 3 * line, vrshrn_n_s32(a3, shift));

        int32x4_t a5 = vmulq_n_s32(Oo0, 50);
        a5 = vmlaq_n_s32(a5, Oo1, -89);
        a5 = vmlaq_n_s32(a5, Oo2, 18);
        a5 = vmlaq_n_s32(a5, Oo3, 75);
        vst1_s16(d + 5 * line, vrshrn_n_s32(a5, shift));

        int32x4_t a7 = vmulq_n_s32(Oo0, 18);
        a7 = vmlaq_n_s32(a7, Oo1, -50);
        a7 = vmlaq_n_s32(a7, Oo2, 75);
        a7 = vmlaq_n_s32(a7, Oo3, -89);
        vst1_s16(d + 7 * line, vrshrn_n_s32(a7, shift));

        // even columns (unchanged upstream structure)
        int32x4_t e0 = vpaddq_s32(EE[j / 2 + 0], EE[j / 2 + 1]);
        vst1_s16(d + 0 * line, vrshrn_n_s32(vmulq_s32(c0, e0), shift));

        int32x4_t e2a = vmulq_s32(c2, EO[j / 2 + 0]);
        int32x4_t e2b = vmulq_s32(c2, EO[j / 2 + 1]);
        vst1_s16(d + 2 * line,
                 vrshrn_n_s32(vpaddq_s32(e2a, e2b), shift));

        int32x4_t e4a = vmulq_s32(c4, EE[j / 2 + 0]);
        int32x4_t e4b = vmulq_s32(c4, EE[j / 2 + 1]);
        vst1_s16(d + 4 * line,
                 vrshrn_n_s32(vpaddq_s32(e4a, e4b), shift));

        int32x4_t e6a = vmulq_s32(c6, EO[j / 2 + 0]);
        int32x4_t e6b = vmulq_s32(c6, EO[j / 2 + 1]);
        vst1_s16(d + 6 * line,
                 vrshrn_n_s32(vpaddq_s32(e6a, e6b), shift));

        d += 4;
    }
}

extern "C" void dynopt_dct8_neon_candidate(const int16_t* src, int16_t* dst,
                                           intptr_t srcStride)
{
    int16_t block[64];
    int16_t coef[64];
    for (int i = 0; i < 8; i++)
        memcpy(&block[i * 8], &src[(size_t)i * srcStride], 8 * sizeof(int16_t));
    butterfly<2>(block, coef);
    butterfly<9>(coef, dst);
}
