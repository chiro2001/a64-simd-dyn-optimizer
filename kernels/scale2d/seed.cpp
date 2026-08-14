// scale2D_64to32 NEON seed (ACLE), straight-line (docs/37).
// 64x64 -> 32x32: each 2x2 block -> (a+b+c+d+2)>>2.
// Mirrors x265_scale2D_64to32_neon (uaddlp + uqrshrn).
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

static inline void s2d32(uint8_t* d, const uint8_t* r0, const uint8_t* r1)
{
    uint8x16_t a0 = vld1q_u8(r0);
    uint8x16_t a1 = vld1q_u8(r0 + 16);
    uint8x16_t b0 = vld1q_u8(r1);
    uint8x16_t b1 = vld1q_u8(r1 + 16);
    uint16x8_t s0 = vpaddlq_u8(a0);
    s0 = vpadalq_u8(s0, b0);
    uint16x8_t s1 = vpaddlq_u8(a1);
    s1 = vpadalq_u8(s1, b1);
    vst1q_u8(d, vcombine_u8(vqrshrn_n_u16(s0, 2), vqrshrn_n_u16(s1, 2)));
}

#define S2D(y, c) \
    s2d32(dst + (y) / 2 * 32 + (c) / 2, \
          src + (y) * stride + (c), \
          src + ((y) + 1) * stride + (c))

extern "C" void dynopt_scale2d_64to32(
    uint8_t* dst, const uint8_t* src, intptr_t stride)
{
    S2D(0, 0);    S2D(0, 32);
    S2D(2, 0);    S2D(2, 32);
    S2D(4, 0);    S2D(4, 32);
    S2D(6, 0);    S2D(6, 32);
    S2D(8, 0);    S2D(8, 32);
    S2D(10, 0);   S2D(10, 32);
    S2D(12, 0);   S2D(12, 32);
    S2D(14, 0);   S2D(14, 32);
    S2D(16, 0);   S2D(16, 32);
    S2D(18, 0);   S2D(18, 32);
    S2D(20, 0);   S2D(20, 32);
    S2D(22, 0);   S2D(22, 32);
    S2D(24, 0);   S2D(24, 32);
    S2D(26, 0);   S2D(26, 32);
    S2D(28, 0);   S2D(28, 32);
    S2D(30, 0);   S2D(30, 32);
    S2D(32, 0);   S2D(32, 32);
    S2D(34, 0);   S2D(34, 32);
    S2D(36, 0);   S2D(36, 32);
    S2D(38, 0);   S2D(38, 32);
    S2D(40, 0);   S2D(40, 32);
    S2D(42, 0);   S2D(42, 32);
    S2D(44, 0);   S2D(44, 32);
    S2D(46, 0);   S2D(46, 32);
    S2D(48, 0);   S2D(48, 32);
    S2D(50, 0);   S2D(50, 32);
    S2D(52, 0);   S2D(52, 32);
    S2D(54, 0);   S2D(54, 32);
    S2D(56, 0);   S2D(56, 32);
    S2D(58, 0);   S2D(58, 32);
    S2D(60, 0);   S2D(60, 32);
    S2D(62, 0);   S2D(62, 32);
}
