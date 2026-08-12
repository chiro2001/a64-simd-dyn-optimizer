// C-exact 8-tap luma hvpp (2D) for 8x8 blocks, sdot horizontal + sliding
// vmlal_s16 vertical.
//
// Horizontal (pixel->short, shift 0, -8192 offset): the int8-domain sdot
// computes sum_k (s-128)*f_x which equals sum_k s*f_x - 8192 exactly (each
// luma phase sums to 64), so no correction constant is needed and the s16
// intermediate is produced by vmovn_s32.
//
// Vertical (short->pixel, shift 12, offset 526336): sliding window of 8
// intermediate rows, vmlal_s16 with the widened/duplicated y filter, then
// vqrshrun_n_s32(acc + 526336, 12) applies the rounding and [0,255] clamp.

#include <arm_neon.h>
#include <cstddef>
#include <cstdint>

static const int16_t g_lumaFilter[4][8] =
{
    { 0, 0, 0, 64, 0, 0, 0, 0 },
    { -1, 4, -10, 58, 17, -5, 1, 0 },
    { -1, 4, -11, 40, 40, -11, 4, -1 },
    { 0, 1, -5, 17, 58, -10, 4, -1 },
};

static const uint8_t dotprod_permute_tbl[48] =
{
    0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6,
    4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10,
    8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14,
};

static inline int16x8_t hps8(uint8x16_t samples, const int8x8_t filter,
                             const uint8x16x3_t tbl)
{
    int8x16_t s = vreinterpretq_s8_u8(
        vsubq_u8(samples, vdupq_n_u8(128)));
    int8x16_t p0 = vqtbl1q_s8(s, tbl.val[0]);
    int8x16_t p1 = vqtbl1q_s8(s, tbl.val[1]);
    int8x16_t p2 = vqtbl1q_s8(s, tbl.val[2]);
    int32x4_t lo = vdotq_lane_s32(vdupq_n_s32(0), p0, filter, 0);
    int32x4_t hi = vdotq_lane_s32(vdupq_n_s32(0), p1, filter, 0);
    lo = vdotq_lane_s32(lo, p1, filter, 1);
    hi = vdotq_lane_s32(hi, p2, filter, 1);
    return vcombine_s16(vmovn_s32(lo), vmovn_s32(hi));
}

extern "C" void dynopt_interp8_hvpp_candidate(const uint8_t* src,
                                              intptr_t srcStride,
                                              uint8_t* dst,
                                              intptr_t dstStride,
                                              int idxX, int idxY)
{
    src -= 3 + 3 * srcStride;
    const uint8x16x3_t tbl = vld1q_u8_x3(dotprod_permute_tbl);
    const int8x8_t fx = vmovn_s16(vld1q_s16(g_lumaFilter[idxX]));
    const int8x8_t fy = vmovn_s16(vld1q_s16(g_lumaFilter[idxY]));

    // horizontal: 15 rows of the s16 intermediate
    int16x8_t immed[15];
    for (int r = 0; r < 15; r++)
    {
        uint8x16_t samples = vld1q_u8(src + (size_t)r * srcStride);
        immed[r] = hps8(samples, fx, tbl);
    }

    // vertical: sliding 8-row window
    int16x4_t fy_lo[8], fy_hi[8];
#pragma GCC unroll 8
    for (int k = 0; k < 8; k++)
    {
        int16x8_t f = vdupq_n_s16(vgetq_lane_s16(vmovl_s8(fy), k));
        fy_lo[k] = vget_low_s16(f);
        fy_hi[k] = vget_high_s16(f);
    }
    // 526336 = 2048 (vqrshrun's internal rounding) + 524288 (IF_INTERNAL_OFFS
    // << IF_FILTER_PREC); vqrshrun adds the 2048, so pre-add only 524288.
    const int32x4_t offset = vdupq_n_s32(524288);

    int16x8_t win[8];
    for (int k = 0; k < 8; k++)
        win[k] = immed[k];
    for (int out = 0; out < 8; out++)
    {
        int32x4_t lo = vdupq_n_s32(0);
        int32x4_t hi = vdupq_n_s32(0);
#pragma GCC unroll 8
        for (int k = 0; k < 8; k++)
        {
            lo = vmlal_s16(lo, vget_low_s16(win[k]), fy_lo[k]);
            hi = vmlal_s16(hi, vget_high_s16(win[k]), fy_hi[k]);
        }
        lo = vaddq_s32(lo, offset);
        hi = vaddq_s32(hi, offset);
        uint8x8_t outv = vqmovn_u16(vcombine_u16(
            vqrshrun_n_s32(lo, 12), vqrshrun_n_s32(hi, 12)));
        vst1_u8(dst + (size_t)out * dstStride, outv);
        for (int k = 0; k < 7; k++)
            win[k] = win[k + 1];
        if (out < 7)
            win[7] = immed[out + 8];
    }
}
