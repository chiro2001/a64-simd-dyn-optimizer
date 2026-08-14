// quant 256 NEON seed (ACLE), straight-line (docs/44).
// Semantics per element (x265 quant_c, numCoeff=256):
//   a = abs(coef) * quantCoeff
//   level = (a + add) >> qBits
//   deltaU = (a - (level << qBits)) >> (qBits - 8)
//   qCoef = level * sign(coef); returns #nonzero(level)
// Constraints (harness): quantCoeff in [1,16384], qBits in [14,22],
// add < 2^qBits, so level fits s16 and NEON asm semantics are exact.
#include <arm_neon.h>

#include <stdint.h>

static inline uint32_t quant8(const int16_t* coef, const int32_t* qc,
                              int32_t* du, int16_t* qo,
                              int32x4_t addv, int32x4_t negq,
                              int32x4_t qbitsv, int32x4_t negq8)
{
    int16x8_t c = vld1q_s16(coef);
    int32x4_t a0 = vabsq_s32(vmovl_s16(vget_low_s16(c)));
    int32x4_t a1 = vabsq_s32(vmovl_s16(vget_high_s16(c)));
    int32x4_t q0 = vld1q_s32(qc);
    int32x4_t q1 = vld1q_s32(qc + 4);
    int32x4_t p0 = vmulq_s32(a0, q0);
    int32x4_t p1 = vmulq_s32(a1, q1);
    int32x4_t l0 = vshlq_s32(vaddq_s32(p0, addv), negq);
    int32x4_t l1 = vshlq_s32(vaddq_s32(p1, addv), negq);
    vst1q_s32(du, vshlq_s32(vmlsq_s32(p0, l0, qbitsv), negq8));
    vst1q_s32(du + 4, vshlq_s32(vmlsq_s32(p1, l1, qbitsv), negq8));
    int16x8_t lv = vcombine_s16(vqmovn_s32(l0), vqmovn_s32(l1));
    uint16x8_t m = vcltzq_s16(c);
    vst1q_s16(qo, vbslq_s16(m, vnegq_s16(lv), lv));
    // vceqzq mask is 0/-1, so vaddlvq = -#zeros; 4 + that = #nonzero.
    uint32_t n0 = 4 + (uint32_t)vaddlvq_s32(
        vreinterpretq_s32_u32(vceqzq_s32(l0)));
    uint32_t n1 = 4 + (uint32_t)vaddlvq_s32(
        vreinterpretq_s32_u32(vceqzq_s32(l1)));
    return n0 + n1;
}

#define QUANT8(off) \
    n += quant8(coef + (off), qc + (off), du + (off), qo + (off), \
                addv, negq, qbitsv, negq8)

extern "C" uint32_t dynopt_quant_256(
    const int16_t* coef, const int32_t* qc, int32_t* du, int16_t* qo,
    int qBits, int add)
{
    int32x4_t addv = vdupq_n_s32(add);
    int32x4_t negq = vdupq_n_s32(-qBits);
    int32x4_t qbitsv = vdupq_n_s32(1 << qBits);
    int32x4_t negq8 = vdupq_n_s32(8 - qBits);
    uint32_t n = 0;
    QUANT8(0);    QUANT8(8);    QUANT8(16);   QUANT8(24);
    QUANT8(32);   QUANT8(40);   QUANT8(48);   QUANT8(56);
    QUANT8(64);   QUANT8(72);   QUANT8(80);   QUANT8(88);
    QUANT8(96);   QUANT8(104);  QUANT8(112);  QUANT8(120);
    QUANT8(128);  QUANT8(136);  QUANT8(144);  QUANT8(152);
    QUANT8(160);  QUANT8(168);  QUANT8(176);  QUANT8(184);
    QUANT8(192);  QUANT8(200);  QUANT8(208);  QUANT8(216);
    QUANT8(224);  QUANT8(232);  QUANT8(240);  QUANT8(248);
    return n;
}
