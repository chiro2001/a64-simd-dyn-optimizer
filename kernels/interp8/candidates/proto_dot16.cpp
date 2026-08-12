// C-exact 8-tap luma horizontal PP via sdot, 16x16 blocks.
//
// Same construction as proto_dot (8x8) but 16 outputs per row from two
// overlapping 16-byte windows; 4 rows per iteration for ILP.

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

static inline uint8x8_t filter8(uint8x16_t samples, const int8x8_t filter,
                                const int32x4_t constant,
                                const uint8x16x3_t tbl)
{
    int8x16_t s = vreinterpretq_s8_u8(
        vsubq_u8(samples, vdupq_n_u8(128)));
    int8x16_t p0 = vqtbl1q_s8(s, tbl.val[0]);
    int8x16_t p1 = vqtbl1q_s8(s, tbl.val[1]);
    int8x16_t p2 = vqtbl1q_s8(s, tbl.val[2]);
    int32x4_t lo = vdotq_lane_s32(constant, p0, filter, 0);
    int32x4_t hi = vdotq_lane_s32(constant, p1, filter, 0);
    lo = vdotq_lane_s32(lo, p1, filter, 1);
    hi = vdotq_lane_s32(hi, p2, filter, 1);
    return vqrshrun_n_s16(vcombine_s16(vmovn_s32(lo), vmovn_s32(hi)), 6);
}

extern "C" void dynopt_interp8_hpp16_candidate(const uint8_t* src,
                                               intptr_t srcStride,
                                               uint8_t* dst,
                                               intptr_t dstStride,
                                               int coeffIdx)
{
    src -= 3;
    const uint8x16x3_t tbl = vld1q_u8_x3(dotprod_permute_tbl);
    const int8x8_t filter = vmovn_s16(vld1q_s16(g_lumaFilter[coeffIdx]));
    const int32x4_t constant = vdupq_n_s32(64 * 128);

    for (int row = 0; row < 16; row += 4)
    {
        uint8x16_t lo0 = vld1q_u8(src + 0 * srcStride);
        uint8x16_t hi0 = vld1q_u8(src + 0 * srcStride + 8);
        uint8x16_t lo1 = vld1q_u8(src + 1 * srcStride);
        uint8x16_t hi1 = vld1q_u8(src + 1 * srcStride + 8);
        uint8x16_t lo2 = vld1q_u8(src + 2 * srcStride);
        uint8x16_t hi2 = vld1q_u8(src + 2 * srcStride + 8);
        uint8x16_t lo3 = vld1q_u8(src + 3 * srcStride);
        uint8x16_t hi3 = vld1q_u8(src + 3 * srcStride + 8);

        uint8x8_t a0 = filter8(lo0, filter, constant, tbl);
        uint8x8_t b0 = filter8(hi0, filter, constant, tbl);
        uint8x8_t a1 = filter8(lo1, filter, constant, tbl);
        uint8x8_t b1 = filter8(hi1, filter, constant, tbl);
        uint8x8_t a2 = filter8(lo2, filter, constant, tbl);
        uint8x8_t b2 = filter8(hi2, filter, constant, tbl);
        uint8x8_t a3 = filter8(lo3, filter, constant, tbl);
        uint8x8_t b3 = filter8(hi3, filter, constant, tbl);

        vst1q_u8(dst + 0 * dstStride, vcombine_u8(a0, b0));
        vst1q_u8(dst + 1 * dstStride, vcombine_u8(a1, b1));
        vst1q_u8(dst + 2 * dstStride, vcombine_u8(a2, b2));
        vst1q_u8(dst + 3 * dstStride, vcombine_u8(a3, b3));
        src += 4 * srcStride;
        dst += 4 * dstStride;
    }
}
