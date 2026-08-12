// C-exact 8-tap luma horizontal PP via sdot (dotprod), 8x8 blocks.
//
// Reproduces the x265 interp8_horiz_pp_dotprod<8,8> structure: samples are
// transformed uint8->int8, permuted with dotprod_permute_tbl, and the four
// tap groups are accumulated with vdotq_lane_s32 seeded by the 64*128
// correction constant (which cancels the -128 transform because each luma
// phase's taps sum to 64). vqrshrun_n_s16 applies the (x+32)>>6 rounding and
// the [0,255] clamp in one instruction, matching the C reference bit-exactly.

#include <arm_neon.h>
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

extern "C" void dynopt_interp8_hpp_candidate(const uint8_t* src,
                                            intptr_t srcStride, uint8_t* dst,
                                            intptr_t dstStride, int coeffIdx)
{
    src -= 3;
    const uint8x16x3_t tbl = vld1q_u8_x3(dotprod_permute_tbl);
    const int8x8_t filter = vmovn_s16(vld1q_s16(g_lumaFilter[coeffIdx]));
    const int32x4_t constant = vdupq_n_s32(64 * 128);

    for (int row = 0; row < 8; row++)
    {
        uint8x16_t samples = vld1q_u8(src);
        int8x16_t samples_s8 = vreinterpretq_s8_u8(
            vsubq_u8(samples, vdupq_n_u8(128)));
        int8x16_t p0 = vqtbl1q_s8(samples_s8, tbl.val[0]);
        int8x16_t p1 = vqtbl1q_s8(samples_s8, tbl.val[1]);
        int8x16_t p2 = vqtbl1q_s8(samples_s8, tbl.val[2]);

        int32x4_t lo = vdotq_lane_s32(constant, p0, filter, 0);
        int32x4_t hi = vdotq_lane_s32(constant, p1, filter, 0);
        lo = vdotq_lane_s32(lo, p1, filter, 1);
        hi = vdotq_lane_s32(hi, p2, filter, 1);

        int16x8_t dot = vcombine_s16(vmovn_s32(lo), vmovn_s32(hi));
        uint8x8_t out = vqrshrun_n_s16(dot, 6);
        vst1_u8(dst, out);
        src += srcStride;
        dst += dstStride;
    }
}
