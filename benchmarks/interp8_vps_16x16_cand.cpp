// Inlined interp8 vert_ps 16x16 candidate (coeffIdx=3): copies the
// upstream filter8_u8x16 body with always_inline, avoiding the GCC12
// `bl` outline + stack round-trip measured at ~2.0x on 920B.
#include <arm_neon.h>
#include <stdint.h>

#define IF_FILTER_PREC 6
#define IF_INTERNAL_PREC 14
#define IF_INTERNAL_OFFS (1 << (IF_INTERNAL_PREC - 1))

__attribute__((always_inline)) static inline void filter8_inline(
    const uint8x16_t* s, const uint16x8_t c, int16x8_t& d0, int16x8_t& d1)
{
    const uint8x16_t f0 = vdupq_n_u8(4);
    const uint8x16_t f1 = vdupq_n_u8(10);
    const uint8x16_t f2 = vdupq_n_u8(58);
    const uint8x16_t f3 = vdupq_n_u8(17);
    const uint8x16_t f4 = vdupq_n_u8(5);
    uint16x8_t t0 = vsubl_u8(vget_low_u8(s[1]), vget_low_u8(s[7]));
    t0 = vaddq_u16(c, t0);
    t0 = vmlal_u8(t0, vget_low_u8(s[6]), vget_low_u8(f0));
    t0 = vmlsl_u8(t0, vget_low_u8(s[5]), vget_low_u8(f1));
    t0 = vmlal_u8(t0, vget_low_u8(s[4]), vget_low_u8(f2));
    t0 = vmlal_u8(t0, vget_low_u8(s[3]), vget_low_u8(f3));
    t0 = vmlsl_u8(t0, vget_low_u8(s[2]), vget_low_u8(f4));
    d0 = vreinterpretq_s16_u16(t0);
    uint16x8_t t1 = vsubl_u8(vget_high_u8(s[1]), vget_high_u8(s[7]));
    t1 = vaddq_u16(c, t1);
    t1 = vmlal_u8(t1, vget_high_u8(s[6]), vget_high_u8(f0));
    t1 = vmlsl_u8(t1, vget_high_u8(s[5]), vget_high_u8(f1));
    t1 = vmlal_u8(t1, vget_high_u8(s[4]), vget_high_u8(f2));
    t1 = vmlal_u8(t1, vget_high_u8(s[3]), vget_high_u8(f3));
    t1 = vmlsl_u8(t1, vget_high_u8(s[2]), vget_high_u8(f4));
    d1 = vreinterpretq_s16_u16(t1);
}

extern "C" void dynopt_interp8_vert_ps_16x16(
    const uint8_t* src, intptr_t srcStride, int16_t* dst, intptr_t dstStride)
{
    const int offset = (unsigned)-IF_INTERNAL_OFFS;
    src -= 3 * srcStride;
    const uint16x8_t c = vdupq_n_u16((uint16_t)offset);
    uint8x16_t s[11];
    for (int i = 0; i < 7; i++)
        s[i] = vld1q_u8(src + i * srcStride);
    const uint8_t* p = src + 7 * srcStride;
    int16_t* d = dst;
    for (int row = 0; row < 16; row += 4)
    {
        for (int i = 7; i < 11; i++)
            s[i] = vld1q_u8(p + (i - 7) * srcStride);
        for (int k = 0; k < 4; k++)
        {
            int16x8_t d0, d1;
            filter8_inline(s + k, c, d0, d1);
            vst1q_s16(d + k * dstStride, d0);
            vst1q_s16(d + k * dstStride + 8, d1);
        }
        for (int i = 0; i < 7; i++)
            s[i] = s[i + 4];
        p += 4 * srcStride;
        d += 4 * dstStride;
    }
}
