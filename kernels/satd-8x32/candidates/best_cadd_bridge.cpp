// SATD 8x32 SVE2 candidate: cadd-butterfly bridge (8-wide shape).
//
// satd8_sve2<8,32> decomposes into 4 8x8 blocks (rows 0-7, 8-15,
// 16-23, 24-31), each hadamard_4x4_quad (4 4x4 blocks, 2 cadd stages
// + tbl reorder + vertical abs/max fold). 8-wide cannot fill VL=256,
// so the 128-bit NEON-SVE2 bridge mirrors the upstream exactly.
// Returns the RAW sum (no sa8d-style >>1 - round-22 finding).
// Gate-arbitrated bit-exact vs x265::satd8_sve2<8,32>.

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

extern "C" int dynopt_satd_8x32_sve2(const uint8_t* pix1, intptr_t sp1,
              const uint8_t* pix2, intptr_t sp2)
{
    uint32x4_t sum = vdupq_n_u32(0);
    const uint8x16_t idx = vld1q_u8(kHADPermuteTbl);
    for (int blk = 0; blk < 4; blk++)
    {
        const uint8_t* p1 = pix1 + blk * 8 * sp1;
        const uint8_t* p2 = pix2 + blk * 8 * sp2;
        int16x8_t diff[8], a[8], b[8];
        for (int i = 0; i < 8; i++)
            diff[i] = vreinterpretq_s16_u16(vsubl_u8(
                vld1_u8(p1 + i * sp1), vld1_u8(p2 + i * sp2)));
        for (int i = 0; i < 8; i++) a[i] = caddq_s16<90>(diff[i], diff[i]);
        for (int i = 0; i < 8; i++) b[i] = vqtbl1q_s16(a[i], idx);
        for (int i = 0; i < 8; i++) a[i] = caddq_s16<90>(b[i], b[i]);
        abssumsubq_s16(&b[0], &b[1], a[0], a[1]);
        abssumsubq_s16(&b[2], &b[3], a[2], a[3]);
        abssumsubq_s16(&b[4], &b[5], a[4], a[5]);
        abssumsubq_s16(&b[6], &b[7], a[6], a[7]);
        uint16x8_t max0 = vmaxq_u16(vreinterpretq_u16_s16(b[0]),
                                    vreinterpretq_u16_s16(b[2]));
        uint16x8_t max1 = vmaxq_u16(vreinterpretq_u16_s16(b[1]),
                                    vreinterpretq_u16_s16(b[3]));
        uint16x8_t max2 = vmaxq_u16(vreinterpretq_u16_s16(b[4]),
                                    vreinterpretq_u16_s16(b[6]));
        uint16x8_t max3 = vmaxq_u16(vreinterpretq_u16_s16(b[5]),
                                    vreinterpretq_u16_s16(b[7]));
        sum = vpadalq_u16(sum, vaddq_u16(max0, max1));
        sum = vpadalq_u16(sum, vaddq_u16(max2, max3));
    }
    return (int)vaddvq_u32(sum);
}
