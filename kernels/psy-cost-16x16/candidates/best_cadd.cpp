// psy-cost 16x16 SVE2 candidate: cadd-butterfly horizontal hadamard.
//
// Port of the upstream x265 psyCost_pp_sve2<2> u8 internal structure
// (pixel-prim-sve2.cpp calc_energy_*): the 8-point horizontal hadamard
// uses the SVE2 cadd<90>(x,x) butterfly ([a+b, a-b] on lane pairs) plus
// a single 8-lane tbl reorder per 8x8 block, instead of the
// trn1/trn2-based transpose chain used by best_sve2.cpp (24 trn per
// 8x8 block).  Expected: permute_depth_ratio well below the 30.8% of
// best_sve2.cpp (upstream body measures ~8 tbl per block).
//
// Requires SVE2 (svcadd via the NEON-SVE2 bridge, low 128 bits only —
// same width semantics as upstream).  bit-exact vs x265::psyCost_pp_sve2<2>
// by construction (verbatim algorithm); verified by the psy-cost funnel
// gate (QEMU vq=2, 2000 cases).

#include <arm_neon.h>
#include <arm_sve.h>
#include <arm_neon_sve_bridge.h>
#include <stdint.h>

// cadd butterfly: [a+b, a-b] on adjacent lane pairs (rotate=90, x==y).
template<uint64_t Rotation>
static inline int16x8_t caddq_s16(const int16x8_t x, const int16x8_t y)
{
    return svget_neonq_s16(svcadd_s16(svset_neonq_s16(svundef_s16(), x),
                                      svset_neonq_s16(svundef_s16(), y), Rotation));
}

// Re-order for CADD: {0,1,4,5,8,9,12,13, 2,3,6,7,10,11,14,15}
static const uint8_t kHADPermuteTbl[] = {0, 1, 4, 5, 8,  9,  12, 13,
                                         2, 3, 6, 7, 10, 11, 14, 15};

static inline int16x8_t vqtbl1q_s16(int16x8_t a, uint8x16_t index)
{
    return vreinterpretq_s16_s8(vqtbl1q_s8(vreinterpretq_s8_s16(a), index));
}

static inline void sumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                               const int16x8_t a, const int16x8_t b)
{
    *sum = vaddq_s16(a, b);
    *sub = vsubq_s16(a, b);
}

static inline void abssumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                                  const int16x8_t a, const int16x8_t b)
{
    *sum = vabsq_s16(vaddq_s16(a, b));
    *sub = vabdq_s16(a, b);
}

// Vertical pass 1: pairwise row sums/diffs (no permutes).
static inline void calc_energy_v_8x8_pass_1(uint8x8_t s[8], int16x8_t d[8])
{
    d[0] = vreinterpretq_s16_u16(vaddl_u8(s[0], s[1]));
    d[1] = vreinterpretq_s16_u16(vaddl_u8(s[2], s[3]));
    d[2] = vreinterpretq_s16_u16(vaddl_u8(s[4], s[5]));
    d[3] = vreinterpretq_s16_u16(vaddl_u8(s[6], s[7]));
    d[4] = vreinterpretq_s16_u16(vsubl_u8(s[0], s[1]));
    d[5] = vreinterpretq_s16_u16(vsubl_u8(s[2], s[3]));
    d[6] = vreinterpretq_s16_u16(vsubl_u8(s[4], s[5]));
    d[7] = vreinterpretq_s16_u16(vsubl_u8(s[6], s[7]));
}

// Horizontal 8-point hadamard via cadd butterfly + one tbl reorder.
static inline void calc_energy_h_8x8(int16x8_t a[8], int16x8_t b[8])
{
    b[0] = caddq_s16<90>(a[0], a[0]);
    b[1] = caddq_s16<90>(a[1], a[1]);
    b[2] = caddq_s16<90>(a[2], a[2]);
    b[3] = caddq_s16<90>(a[3], a[3]);
    b[4] = caddq_s16<90>(a[4], a[4]);
    b[5] = caddq_s16<90>(a[5], a[5]);
    b[6] = caddq_s16<90>(a[6], a[6]);
    b[7] = caddq_s16<90>(a[7], a[7]);

    const uint8x16_t idx = vld1q_u8(kHADPermuteTbl);
    // Re-order input ready for CADD instruction.
    a[0] = vqtbl1q_s16(b[0], idx);
    a[1] = vqtbl1q_s16(b[1], idx);
    a[2] = vqtbl1q_s16(b[2], idx);
    a[3] = vqtbl1q_s16(b[3], idx);
    a[4] = vqtbl1q_s16(b[4], idx);
    a[5] = vqtbl1q_s16(b[5], idx);
    a[6] = vqtbl1q_s16(b[6], idx);
    a[7] = vqtbl1q_s16(b[7], idx);

    b[0] = caddq_s16<90>(a[0], a[0]);
    b[1] = caddq_s16<90>(a[1], a[1]);
    b[2] = caddq_s16<90>(a[2], a[2]);
    b[3] = caddq_s16<90>(a[3], a[3]);
    b[4] = caddq_s16<90>(a[4], a[4]);
    b[5] = caddq_s16<90>(a[5], a[5]);
    b[6] = caddq_s16<90>(a[6], a[6]);
    b[7] = caddq_s16<90>(a[7], a[7]);

    // Re-order input ready for CADD instruction (second stage).
    a[0] = vqtbl1q_s16(b[0], idx);
    a[1] = vqtbl1q_s16(b[1], idx);
    a[2] = vqtbl1q_s16(b[2], idx);
    a[3] = vqtbl1q_s16(b[3], idx);
    a[4] = vqtbl1q_s16(b[4], idx);
    a[5] = vqtbl1q_s16(b[5], idx);
    a[6] = vqtbl1q_s16(b[6], idx);
    a[7] = vqtbl1q_s16(b[7], idx);

    b[0] = caddq_s16<90>(a[0], a[0]);
    b[1] = caddq_s16<90>(a[1], a[1]);
    b[2] = caddq_s16<90>(a[2], a[2]);
    b[3] = caddq_s16<90>(a[3], a[3]);
    b[4] = caddq_s16<90>(a[4], a[4]);
    b[5] = caddq_s16<90>(a[5], a[5]);
    b[6] = caddq_s16<90>(a[6], a[6]);
    b[7] = caddq_s16<90>(a[7], a[7]);
}

// Vertical passes 2+3: abs-sum-sub + max-pair + widen-sum; DC in lane 3.
static inline int32x4_t calc_energy_v_8x8_pass_2_3(int16x8_t a[8],
                                                   int32x4_t *dcCoeff)
{
    // DC coefficient is in lane 3, other lanes are 'don't care'.
    *dcCoeff = vaddl_high_s16(vaddq_s16(a[0], a[1]), vaddq_s16(a[2], a[3]));

    int16x8_t b[8];
    abssumsubq_s16(&b[0], &b[1], a[0], a[1]);
    abssumsubq_s16(&b[2], &b[3], a[2], a[3]);
    abssumsubq_s16(&b[4], &b[5], a[4], a[5]);
    abssumsubq_s16(&b[6], &b[7], a[6], a[7]);

    uint16x8_t sum0 = vmaxq_u16(vreinterpretq_u16_s16(b[0]),
                                vreinterpretq_u16_s16(b[2]));
    uint16x8_t sum1 = vmaxq_u16(vreinterpretq_u16_s16(b[1]),
                                vreinterpretq_u16_s16(b[3]));
    uint16x8_t sum2 = vmaxq_u16(vreinterpretq_u16_s16(b[4]),
                                vreinterpretq_u16_s16(b[6]));
    uint16x8_t sum3 = vmaxq_u16(vreinterpretq_u16_s16(b[5]),
                                vreinterpretq_u16_s16(b[7]));

    uint16x8_t sum01 = vaddq_u16(sum0, sum1);
    uint16x8_t sum23 = vaddq_u16(sum2, sum3);
    uint16x8_t sum = vaddq_u16(sum01, sum23);
    return vreinterpretq_s32_u32(vpaddlq_u16(sum));
}

// 16x16 energy: four 8x8 sub-blocks, then combine DC + sa8d.
static inline int32x4_t calc_energy_16x16(const uint8_t *source,
                                          intptr_t sstride)
{
    int32x4_t dcCoeff[4];
    int32x4_t sum[4];
    uint8x8_t s[8];
    int16x8_t a[8], b[8];

    for (int blk = 0; blk < 4; blk++)
    {
        const int bi = (blk >> 1) * 8;
        const int bj = (blk & 1) * 8;
        for (int i = 0; i < 8; i++)
            s[i] = vld1_u8(source + (bi + i) * sstride + bj);
        calc_energy_v_8x8_pass_1(s, a);
        calc_energy_h_8x8(a, b);
        sum[blk] = calc_energy_v_8x8_pass_2_3(b, &dcCoeff[blk]);
    }

    // Combine all DC coefficients into one vector.
    dcCoeff[0] = vzip2q_s32(dcCoeff[0], dcCoeff[1]);
    dcCoeff[2] = vzip2q_s32(dcCoeff[2], dcCoeff[3]);
    dcCoeff[0] = vcombine_s32(vget_high_s32(dcCoeff[0]),
                              vget_high_s32(dcCoeff[2]));
    int32x4_t dc = vshrq_n_s32(vabsq_s32(dcCoeff[0]), 2);

    sum[0] = vpaddq_s32(sum[0], sum[1]);
    sum[2] = vpaddq_s32(sum[2], sum[3]);
    sum[0] = vpaddq_s32(sum[0], sum[2]);
    int32x4_t sa8d = vrshrq_n_s32(sum[0], 1);

    return vsubq_s32(sa8d, dc);
}

extern "C" int dynopt_psy_cost_pp_16x16_sve2(const uint8_t *source,
                                             intptr_t sstride,
                                             const uint8_t *recon,
                                             intptr_t rstride)
{
    int32x4_t totEnergy = vdupq_n_s32(0);
    totEnergy = vabaq_s32(totEnergy,
                          calc_energy_16x16(source, sstride),
                          calc_energy_16x16(recon, rstride));
    return vaddvq_u32(vreinterpretq_u32_s32(totEnergy));
}
