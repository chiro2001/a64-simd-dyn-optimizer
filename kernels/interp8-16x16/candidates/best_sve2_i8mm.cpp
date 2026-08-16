// Minimal i8mm interp8 hpp 16x16 candidate (upstream-exact; extracted
// from x265 common/aarch64/filter-neon-i8mm.cpp, GPL-2.0 with
// commercial exception). Requires -march=armv8.2-a+i8mm.
#define X265_NS x265
#define IF_FILTER_PREC 6
#define X265_CHECK(cond, msg) ((void)0)
#include <arm_neon.h>
#include <stdint.h>
namespace x265 {}
#include "common/aarch64/mem-neon.h"

static const uint8_t matmul_permute_tbl[2][32] = {
    { 0,  1,  2,  3,  4,  5,  6,  7,  2,  3,  4,  5,  6,  7,  8,  9,
      4,  5,  6,  7,  8,  9, 10, 11,  6,  7,  8,  9, 10, 11, 12, 13 },
    { 1,  2,  3,  4,  5,  6,  7,  8,  3,  4,  5,  6,  7,  8,  9, 10,
      5,  6,  7,  8,  9, 10, 11, 12,  7,  8,  9, 10, 11, 12, 13, 14 }
};

static const int8_t matmul_luma_filter[3][16] = {
    { -1, 4, -10, 58, 17, -5, 1, 0, 0, -1, 4, -10, 58, 17, -5, 1 },
    { 4, -11, 40, 40, -11, 4, -1, 0, 0, 4, -11, 40, 40, -11, 4, -1 },
    { 1, -5, 17, 58, -10, 4, -1, 0, 0, 1, -5, 17, 58, -10, 4, -1 }
};

template<bool coeff2>
uint8x8_t inline filter8_8_pp_matmul(uint8x16_t samples, const int8x16_t filter,
                                     const uint8x16x2_t tbl)
{
    uint8x16_t perm_s0 = vqtbl1q_u8(samples, tbl.val[0]);
    uint8x16_t perm_s1 = vqtbl1q_u8(samples, tbl.val[1]);

    int32x4_t matmul_lo = vusmmlaq_s32(vdupq_n_s32(0), perm_s0, filter);
    int32x4_t matmul_hi = vusmmlaq_s32(vdupq_n_s32(0), perm_s1, filter);

    int16x8_t matmul = vcombine_s16(vmovn_s32(matmul_lo), vmovn_s32(matmul_hi));

    if (coeff2)
        matmul = vreinterpretq_s16_u16(vsubw_u8(vreinterpretq_u16_s16(matmul),
                                                vget_low_u8(samples)));

    return vqrshrun_n_s16(matmul, IF_FILTER_PREC);
}

template<bool coeff2>
void inline interp8_horiz_pp_matmul_16x16(const uint8_t *src, intptr_t srcStride,
                                          uint8_t *dst, intptr_t dstStride,
                                          int coeffIdx)
{
    const int width = 16, height = 16;
    const int N_TAPS = 8;
    const uint8x16x2_t tbl = vld1q_u8_x2(matmul_permute_tbl[coeffIdx >> 1]);
    const int8x16_t filter = vld1q_s8(matmul_luma_filter[coeffIdx - 1]);

    src -= N_TAPS / 2 - 1;

    for (int row = 0; row < height; row += 4)
    {
        int col = 0;
        for (; col + 8 <= width; col += 8)
        {
            uint8x16_t s[4];
            load_u8x16xn<4>(src + col, srcStride, s);

            uint8x8_t d[4];
            d[0] = filter8_8_pp_matmul<coeff2>(s[0], filter, tbl);
            d[1] = filter8_8_pp_matmul<coeff2>(s[1], filter, tbl);
            d[2] = filter8_8_pp_matmul<coeff2>(s[2], filter, tbl);
            d[3] = filter8_8_pp_matmul<coeff2>(s[3], filter, tbl);

            store_u8x8xn<4>(dst + col, dstStride, d);
        }
        src += 4 * srcStride;
        dst += 4 * dstStride;
    }
}

extern "C" void dynopt_interp8_hpp_16x16_i8mm(
    const uint8_t* src, intptr_t srcStride,
    uint8_t* dst, intptr_t dstStride, int coeffIdx)
{
    if (coeffIdx == 2)
        interp8_horiz_pp_matmul_16x16<true>(
            src, srcStride, dst, dstStride, coeffIdx);
    else
        interp8_horiz_pp_matmul_16x16<false>(
            src, srcStride, dst, dstStride, coeffIdx);
}
