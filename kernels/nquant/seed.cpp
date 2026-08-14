// nquant 256 NEON seed (ACLE), straight-line (docs/44).
// Semantics per element (x265 nquant_c, numCoeff=256):
//   level = (abs(coef) * quantCoeff + add) >> qBits
//   qCoef = |level|  (level >= 0, fits s16 under harness constraints)
//   returns #nonzero(level)
#include <arm_neon.h>

#include <stdint.h>

static inline uint32_t nquant8(const int16_t* coef, const int32_t* qc,
                               int16_t* qo, int32x4_t addv, int32x4_t negq)
{
    int16x8_t c = vld1q_s16(coef);
    int32x4_t a0 = vabsq_s32(vmovl_s16(vget_low_s16(c)));
    int32x4_t a1 = vabsq_s32(vmovl_s16(vget_high_s16(c)));
    int32x4_t q0 = vld1q_s32(qc);
    int32x4_t q1 = vld1q_s32(qc + 4);
    int32x4_t l0 = vshlq_s32(vaddq_s32(vmulq_s32(a0, q0), addv), negq);
    int32x4_t l1 = vshlq_s32(vaddq_s32(vmulq_s32(a1, q1), addv), negq);
    vst1q_s16(qo, vcombine_s16(vqmovn_s32(l0), vqmovn_s32(l1)));
    // vceqzq mask is 0/-1, so vaddlvq = -#zeros; 4 + that = #nonzero.
    uint32_t n0 = 4 + (uint32_t)vaddlvq_s32(
        vreinterpretq_s32_u32(vceqzq_s32(l0)));
    uint32_t n1 = 4 + (uint32_t)vaddlvq_s32(
        vreinterpretq_s32_u32(vceqzq_s32(l1)));
    return n0 + n1;
}

#define NQUANT8(off) \
    n += nquant8(coef + (off), qc + (off), qo + (off), addv, negq)

extern "C" uint32_t dynopt_nquant_256(
    const int16_t* coef, const int32_t* qc, int16_t* qo, int qBits, int add)
{
    int32x4_t addv = vdupq_n_s32(add);
    int32x4_t negq = vdupq_n_s32(-qBits);
    uint32_t n = 0;
    NQUANT8(0);    NQUANT8(8);    NQUANT8(16);   NQUANT8(24);
    NQUANT8(32);   NQUANT8(40);   NQUANT8(48);   NQUANT8(56);
    NQUANT8(64);   NQUANT8(72);   NQUANT8(80);   NQUANT8(88);
    NQUANT8(96);   NQUANT8(104);  NQUANT8(112);  NQUANT8(120);
    NQUANT8(128);  NQUANT8(136);  NQUANT8(144);  NQUANT8(152);
    NQUANT8(160);  NQUANT8(168);  NQUANT8(176);  NQUANT8(184);
    NQUANT8(192);  NQUANT8(200);  NQUANT8(208);  NQUANT8(216);
    NQUANT8(224);  NQUANT8(232);  NQUANT8(240);  NQUANT8(248);
    return n;
}
