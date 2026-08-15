#include <arm_neon.h>
#include <stdint.h>

__attribute__((always_inline)) static inline void sumsubq_s16(
    int16x8_t *sum, int16x8_t *sub, const int16x8_t a, const int16x8_t b)
{
    *sum = vaddq_s16(a, b);
    *sub = vsubq_s16(a, b);
}
__attribute__((always_inline)) static inline void abssumsubq_s16(
    int16x8_t *sum, int16x8_t *sub, const int16x8_t a, const int16x8_t b)
{
    *sum = vabsq_s16(vaddq_s16(a, b));
    *sub = vabdq_s16(a, b);
}
__attribute__((always_inline)) static inline void transpose_s16_s16x2(
    int16x8_t *t1, int16x8_t *t2, const int16x8_t s1, const int16x8_t s2)
{
    *t1 = vtrn1q_s16(s1, s2);
    *t2 = vtrn2q_s16(s1, s2);
}
__attribute__((always_inline)) static inline void transpose_s16_s32x2(
    int16x8_t *t1, int16x8_t *t2, const int16x8_t s1, const int16x8_t s2)
{
    int32x4_t a = vreinterpretq_s32_s16(s1);
    int32x4_t b = vreinterpretq_s32_s16(s2);
    *t1 = vreinterpretq_s16_s32(vtrn1q_s32(a, b));
    *t2 = vreinterpretq_s16_s32(vtrn2q_s32(a, b));
}
__attribute__((always_inline)) static inline void transpose_s16_s64x2(
    int16x8_t *t1, int16x8_t *t2, const int16x8_t s1, const int16x8_t s2)
{
    int64x2_t a = vreinterpretq_s64_s16(s1);
    int64x2_t b = vreinterpretq_s64_s16(s2);
    *t1 = vreinterpretq_s16_s64(vtrn1q_s64(a, b));
    *t2 = vreinterpretq_s16_s64(vtrn2q_s64(a, b));
}
__attribute__((always_inline)) static inline void hadamard_4_v(
    const int16x8_t in[4], int16x8_t out[4])
{
    int16x8_t s0, s1, d0, d1;
    sumsubq_s16(&s0, &d0, in[0], in[1]);
    sumsubq_s16(&s1, &d1, in[2], in[3]);
    sumsubq_s16(&out[0], &out[2], s0, s1);
    sumsubq_s16(&out[1], &out[3], d0, d1);
}
__attribute__((always_inline)) static inline void hadamard_4_h(
    const int16x8_t in[4], int16x8_t out[4])
{
    int16x8_t s0, s1, d0, d1, t0, t1, t2, t3;
    transpose_s16_s16x2(&t0, &t1, in[0], in[1]);
    transpose_s16_s16x2(&t2, &t3, in[2], in[3]);
    sumsubq_s16(&s0, &d0, t0, t1);
    sumsubq_s16(&s1, &d1, t2, t3);
    transpose_s16_s32x2(&out[0], &out[1], s0, s1);
    transpose_s16_s32x2(&out[2], &out[3], d0, d1);
}
__attribute__((always_inline)) static inline void hadamard_8_v(
    const int16x8_t in[8], int16x8_t out[8])
{
    int16x8_t temp[8];
    hadamard_4_v(in, temp);
    hadamard_4_v(in + 4, temp + 4);
    sumsubq_s16(&out[0], &out[4], temp[0], temp[4]);
    sumsubq_s16(&out[1], &out[5], temp[1], temp[5]);
    sumsubq_s16(&out[2], &out[6], temp[2], temp[6]);
    sumsubq_s16(&out[3], &out[7], temp[3], temp[7]);
}
__attribute__((always_inline)) static inline void hadamard_8_h(
    int16x8_t coefs[8], uint16x8_t out[4])
{
    int16x8_t s0, s1, s2, s3, d0, d1, d2, d3;
    int16x8_t temp[8];
    hadamard_4_h(coefs, temp);
    hadamard_4_h(coefs + 4, temp + 4);
    abssumsubq_s16(&s0, &d0, temp[0], temp[1]);
    abssumsubq_s16(&s1, &d1, temp[2], temp[3]);
    abssumsubq_s16(&s2, &d2, temp[4], temp[5]);
    abssumsubq_s16(&s3, &d3, temp[6], temp[7]);
    transpose_s16_s64x2(&temp[0], &temp[1], s0, s2);
    transpose_s16_s64x2(&temp[2], &temp[3], s1, s3);
    transpose_s16_s64x2(&temp[4], &temp[5], d0, d2);
    transpose_s16_s64x2(&temp[6], &temp[7], d1, d3);
    out[0] = vmaxq_u16(vreinterpretq_u16_s16(temp[0]),
                       vreinterpretq_u16_s16(temp[1]));
    out[1] = vmaxq_u16(vreinterpretq_u16_s16(temp[2]),
                       vreinterpretq_u16_s16(temp[3]));
    out[2] = vmaxq_u16(vreinterpretq_u16_s16(temp[4]),
                       vreinterpretq_u16_s16(temp[5]));
    out[3] = vmaxq_u16(vreinterpretq_u16_s16(temp[6]),
                       vreinterpretq_u16_s16(temp[7]));
}
__attribute__((always_inline)) static inline int calc_energy_8x8_inline(
    const uint8_t* source, intptr_t sstride)
{
    uint8x8_t s[8];
    for (int i = 0; i < 8; i++)
        s[i] = vld1_u8(source + i * sstride);
    int16x8_t in[8], temp[8];
    in[0] = vreinterpretq_s16_u16(vaddl_u8(s[0], s[1]));
    in[1] = vreinterpretq_s16_u16(vaddl_u8(s[2], s[3]));
    in[2] = vreinterpretq_s16_u16(vaddl_u8(s[4], s[5]));
    in[3] = vreinterpretq_s16_u16(vaddl_u8(s[6], s[7]));
    in[4] = vreinterpretq_s16_u16(vsubl_u8(s[0], s[1]));
    in[5] = vreinterpretq_s16_u16(vsubl_u8(s[2], s[3]));
    in[6] = vreinterpretq_s16_u16(vsubl_u8(s[4], s[5]));
    in[7] = vreinterpretq_s16_u16(vsubl_u8(s[6], s[7]));
    hadamard_4_v(in, temp);
    hadamard_4_v(in + 4, temp + 4);
    int sum = vaddvq_s16(temp[0]) >> 2;
    uint16x8_t sa8_out[4];
    hadamard_8_h(temp, sa8_out);
    uint16x8_t res = vaddq_u16(sa8_out[0], sa8_out[1]);
    res = vaddq_u16(res, sa8_out[2]);
    res = vaddq_u16(res, sa8_out[3]);
    int sa8 = (vaddlvq_u16(res) + 1) >> 1;
    return sa8 - sum;
}

extern "C" int dynopt_psy_cost_pp_32x32_sve2(const uint8_t* source, intptr_t sstride,
                  const uint8_t* recon, intptr_t rstride)
{
    uint32_t totEnergy = 0;
    for (int i = 0; i < 32; i += 8)
        for (int j = 0; j < 32; j += 8)
        {
            int se = calc_energy_8x8_inline(source + i * sstride + j, sstride);
            int re = calc_energy_8x8_inline(recon + i * rstride + j, rstride);
            totEnergy += (se > re) ? (unsigned)(se - re) : (unsigned)(re - se);
        }
    return (int)totEnergy;
}
