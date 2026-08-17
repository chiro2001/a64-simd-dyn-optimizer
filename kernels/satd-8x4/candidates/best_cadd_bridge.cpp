// SATD 8x4 SVE2 candidate: cadd-butterfly bridge port.
//
// Width-native at VL=256 is not viable for 8-wide shapes (the 8-lane
// rows cannot fill the 256-bit vectors without combine permutes), so
// this mirrors the upstream hadamard_4x4_dual exactly via the
// NEON-SVE2 bridge (svcadd on the low 128 bits, same as psy-cost
// best_cadd): horizontal 4-point cadd butterfly (cadd -> tbl -> cadd)
// per row, then the vertical abs/max fold, udot-accumulated.
// Bit-exact by construction; verified by the satd-8x4 funnel gate.

#include <arm_neon.h>
#include <arm_sve.h>
#include <arm_neon_sve_bridge.h>
#include <stdint.h>

template<uint64_t Rotation>
static inline int16x8_t caddq_s16(const int16x8_t x, const int16x8_t y)
{
    return svget_neonq_s16(svcadd_s16(svset_neonq_s16(svundef_s16(), x),
                                      svset_neonq_s16(svundef_s16(), y), Rotation));
}

static const uint8_t kHADPermuteTbl[16] =
    { 0, 1, 4, 5, 8, 9, 12, 13, 2, 3, 6, 7, 10, 11, 14, 15 };

static inline int16x8_t vqtbl1q_s16(int16x8_t a, uint8x16_t index)
{
    return vreinterpretq_s16_s8(vqtbl1q_s8(vreinterpretq_s8_s16(a), index));
}

static inline void abssumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                                  const int16x8_t a, const int16x8_t b)
{
    *sum = vabsq_s16(vaddq_s16(a, b));
    *sub = vabdq_s16(a, b);
}

extern "C" int dynopt_satd_8x4_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    uint32x4_t sum = vdupq_n_u32(0);
    int16x8_t diff[4];
    for (int i = 0; i < 4; i++)
        diff[i] = vreinterpretq_s16_u16(vsubl_u8(
            vld1_u8(pix1 + i * sp1), vld1_u8(pix2 + i * sp2)));

    int16x8_t a[4], b[4];
    for (int i = 0; i < 4; i++) a[i] = caddq_s16<90>(diff[i], diff[i]);
    const uint8x16_t idx = vld1q_u8(kHADPermuteTbl);
    for (int i = 0; i < 4; i++) b[i] = vqtbl1q_s16(a[i], idx);
    for (int i = 0; i < 4; i++) a[i] = caddq_s16<90>(b[i], b[i]);

    int16x8_t s0, s1, d0, d1;
    abssumsubq_s16(&s0, &d0, a[0], a[1]);
    abssumsubq_s16(&s1, &d1, a[2], a[3]);
    uint16x8_t max0 = vmaxq_u16(vreinterpretq_u16_s16(s0),
                                vreinterpretq_u16_s16(s1));
    uint16x8_t max1 = vmaxq_u16(vreinterpretq_u16_s16(d0),
                                vreinterpretq_u16_s16(d1));
    sum = vpadalq_u16(sum, max0);
    sum = vpadalq_u16(sum, max1);
    // satd8_sve2<8,4> returns the raw sum (no sa8d-style >>1 rounding).
    return (int)vaddvq_u32(sum);
}
