// C-exact 8-tap luma vertical PP via sliding-window vmlal_lane_s8, 8x8.
//
// Vertical taps span rows: keep the 8 source rows in registers and slide the
// window by one row per output row. Each output accumulates
//   8192 + sum_k (row_k - 128) * f_k
// in s16; because every luma phase's taps sum to 64 this equals sum_k row_k
// * f_k exactly, and vqrshrun_n_s16 applies the (x+32)>>6 rounding plus the
// [0,255] clamp.

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

extern "C" void dynopt_interp8_vpp_candidate(const uint8_t* src,
                                             intptr_t srcStride,
                                             uint8_t* dst,
                                             intptr_t dstStride,
                                             int coeffIdx)
{
    src -= 3 * srcStride;
    const int8x8_t filter = vmovn_s16(vld1q_s16(g_lumaFilter[coeffIdx]));
    const int16x8_t correction = vdupq_n_s16(64 * 128);
    const uint8x8_t bias = vdup_n_u8(128);
    int8x8_t fdup[8];
#pragma GCC unroll 8
    for (int k = 0; k < 8; k++)
        fdup[k] = vdup_lane_s8(filter, k);

    uint8x8_t rows[8];
    for (int k = 0; k < 8; k++)
        rows[k] = vld1_u8(src + (size_t)k * srcStride);

    for (int out = 0; out < 8; out++)
    {
        int16x8_t acc = correction;
#pragma GCC unroll 8
        for (int k = 0; k < 8; k++)
        {
            int8x8_t s = vreinterpret_s8_u8(vsub_u8(rows[k], bias));
            acc = vmlal_s8(acc, s, fdup[k]);
        }
        vst1_u8(dst + (size_t)out * dstStride,
                vqrshrun_n_s16(acc, 6));
        for (int k = 0; k < 7; k++)
            rows[k] = rows[k + 1];
        rows[7] = vld1_u8(src + (size_t)(out + 8) * srcStride);
    }
}
