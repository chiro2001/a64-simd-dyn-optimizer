// ssim_4x4x2_core NEON seed (ACLE), straight-line (docs/37).
// Computes for two adjacent 4x4 blocks (8 pixels/row): per block
// sums[z] = { sum(p1), sum(p2), sum(p1*p1)+sum(p2*p2), sum(p1*p2) }.
// Mirrors x265_ssim_4x4x2_core_neon lane layout.
#include <arm_neon.h>
#include <stddef.h>
#include <stdint.h>

extern "C" void dynopt_ssim_4x4x2(
    const uint8_t* p1, intptr_t s1, const uint8_t* p2, intptr_t s2,
    int32_t sums[8])
{
    uint8x8_t a0 = vld1_u8(p1); p1 += s1;
    uint8x8_t a1 = vld1_u8(p1); p1 += s1;
    uint8x8_t a2 = vld1_u8(p1); p1 += s1;
    uint8x8_t a3 = vld1_u8(p1);
    uint8x8_t b0 = vld1_u8(p2); p2 += s2;
    uint8x8_t b1 = vld1_u8(p2); p2 += s2;
    uint8x8_t b2 = vld1_u8(p2); p2 += s2;
    uint8x8_t b3 = vld1_u8(p2);

    uint16x8_t t = vaddl_u8(a0, a1);
    t = vaddw_u8(t, a2);
    t = vaddw_u8(t, a3);
    uint32x4_t s1v = vpaddlq_u16(t);
    uint16x8_t u = vaddl_u8(b0, b1);
    u = vaddw_u8(u, b2);
    u = vaddw_u8(u, b3);
    uint32x4_t s2v = vpaddlq_u16(u);

    uint32x4_t ssv = vpaddlq_u16(vmull_u8(a0, a0));
    ssv = vpadalq_u16(ssv, vmull_u8(a1, a1));
    ssv = vpadalq_u16(ssv, vmull_u8(a2, a2));
    ssv = vpadalq_u16(ssv, vmull_u8(a3, a3));
    ssv = vpadalq_u16(ssv, vmull_u8(b0, b0));
    ssv = vpadalq_u16(ssv, vmull_u8(b1, b1));
    ssv = vpadalq_u16(ssv, vmull_u8(b2, b2));
    ssv = vpadalq_u16(ssv, vmull_u8(b3, b3));
    uint32x4_t s12v = vpaddlq_u16(vmull_u8(a0, b0));
    s12v = vpadalq_u16(s12v, vmull_u8(a1, b1));
    s12v = vpadalq_u16(s12v, vmull_u8(a2, b2));
    s12v = vpadalq_u16(s12v, vmull_u8(a3, b3));

    int32x4_t r0 = vpaddq_s32(vreinterpretq_s32_u32(s1v),
                              vreinterpretq_s32_u32(s1v));
    int32x4_t r1 = vpaddq_s32(vreinterpretq_s32_u32(s2v),
                              vreinterpretq_s32_u32(s2v));
    int32x4_t r2 = vpaddq_s32(vreinterpretq_s32_u32(ssv),
                              vreinterpretq_s32_u32(ssv));
    int32x4_t r3 = vpaddq_s32(vreinterpretq_s32_u32(s12v),
                              vreinterpretq_s32_u32(s12v));
    int32x2x4_t out = { vget_low_s32(r0), vget_low_s32(r1),
                        vget_low_s32(r2), vget_low_s32(r3) };
    vst4_s32(sums, out);
}
