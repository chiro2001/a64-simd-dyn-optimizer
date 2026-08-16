// i8mm interp8 hpp candidates (8x8/16x16/32x32), upstream-exact;
// extracted from x265 common/aarch64/filter-neon-i8mm.cpp (GPL-2.0
// with commercial exception). Requires -march=armv8.2-a+i8mm.
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

template<bool coeff2, int width, int height>
void inline interp8_horiz_pp_matmul_wh(const uint8_t *src, intptr_t srcStride,
                                       uint8_t *dst, intptr_t dstStride,
                                       int coeffIdx)
{
    const int N_TAPS = 8;
    const uint8x16x2_t tbl = vld1q_u8_x2(matmul_permute_tbl[coeffIdx >> 1]);
    const int8x16_t filter = vld1q_s8(matmul_luma_filter[coeffIdx - 1]);

    src -= N_TAPS / 2 - 1;

    for (int row = 0; row < height; row += 4)
    {
        int col = 0;
        if (width >= 32)
        {
            for (; (col + 16) <= width; col += 16)
            {
                uint8x16_t s_lo[4], s_hi[4];
                load_u8x16xn<4>(src + col + 0, srcStride, s_lo);
                load_u8x16xn<4>(src + col + 8, srcStride, s_hi);

                uint8x8_t d_lo[4], d_hi[4];
                for (int i = 0; i < 4; i++)
                {
                    d_lo[i] = filter8_8_pp_matmul<coeff2>(s_lo[i], filter, tbl);
                    d_hi[i] = filter8_8_pp_matmul<coeff2>(s_hi[i], filter, tbl);
                }
                store_u8x8xn<4>(dst + col + 0, dstStride, d_lo);
                store_u8x8xn<4>(dst + col + 8, dstStride, d_hi);
            }
        }
        for (; col + 8 <= width; col += 8)
        {
            uint8x16_t s[4];
            load_u8x16xn<4>(src + col, srcStride, s);

            uint8x8_t d[4];
            for (int i = 0; i < 4; i++)
                d[i] = filter8_8_pp_matmul<coeff2>(s[i], filter, tbl);

            store_u8x8xn<4>(dst + col, dstStride, d);
        }
        for (; col < width; col += 4)
        {
            uint8x16_t s[4];
            load_u8x16xn<4>(src + col, srcStride, s);

            uint8x8_t d[4];
            for (int i = 0; i < 4; i++)
                d[i] = filter8_8_pp_matmul<coeff2>(s[i], filter, tbl);

            store_u8x4xn<4>(dst + col, dstStride, d);
        }
        src += 4 * srcStride;
        dst += 4 * dstStride;
    }
}

#define I8MM_WRAPPER(W, H)                                                    \
extern "C" void dynopt_interp8_hpp_##W##x##H##_i8mm(                          \
    const uint8_t* src, intptr_t srcStride, uint8_t* dst,                     \
    intptr_t dstStride, int coeffIdx)                                          \
{                                                                              \
    if (coeffIdx == 2)                                                         \
        interp8_horiz_pp_matmul_wh<true, W, H>(                                \
            src, srcStride, dst, dstStride, coeffIdx);                         \
    else                                                                       \
        interp8_horiz_pp_matmul_wh<false, W, H>(                               \
            src, srcStride, dst, dstStride, coeffIdx);                         \
}

I8MM_WRAPPER(32, 32)
