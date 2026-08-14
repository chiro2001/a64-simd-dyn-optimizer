// scale1D_128to64 NEON seed (ACLE), straight-line (docs/37).
// Two input rows of 128 px -> two output rows of 64 px, per-pixel-pair
// (a+b+1)>>1. Mirrors x265_scale1D_128to64_neon (vld2/vrhadd).
#include <arm_neon.h>

#include <stdint.h>

static inline void s1d32(uint8_t* d, const uint8_t* s)
{
    uint8x16_t a = vld1q_u8(s);
    uint8x16_t b = vld1q_u8(s + 16);
    vst1q_u8(d, vrhaddq_u8(vuzp1q_u8(a, b), vuzp2q_u8(a, b)));
}

extern "C" void dynopt_scale1d_128to64(uint8_t* dst, const uint8_t* src)
{
    s1d32(dst, src);
    s1d32(dst + 16, src + 32);
    s1d32(dst + 32, src + 64);
    s1d32(dst + 48, src + 96);
    s1d32(dst + 64, src + 128);
    s1d32(dst + 80, src + 160);
    s1d32(dst + 96, src + 192);
    s1d32(dst + 112, src + 224);
}
