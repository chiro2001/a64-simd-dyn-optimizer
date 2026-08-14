// dequant_scaling 256 NEON seed, shift+4 <= per branch (docs/44).
// Semantics per element: sat16(sat16(q*dq) << (per-shift)).
// Branchless specialization; the harness only tests this branch.
#include <arm_neon.h>

#include <stdint.h>

static inline void dqs8_le(const int16_t* q, const int32_t* dq, int16_t* c,
                           int16x8_t shv)
{
    int16x8_t vq = vld1q_s16(q);
    int32x4_t vd0 = vld1q_s32(dq);
    int32x4_t vd1 = vld1q_s32(dq + 4);
    int32x4_t p0 = vmulq_s32(vmovl_s16(vget_low_s16(vq)), vd0);
    int32x4_t p1 = vmulq_s32(vmovl_s16(vget_high_s16(vq)), vd1);
    int16x8_t out = vcombine_s16(vqmovn_s32(p0), vqmovn_s32(p1));
    vst1q_s16(c, vqshlq_s16(out, shv));
}

#define DQS_LE(off) \
    dqs8_le(q + (off), dq + (off), c + (off), shv)

extern "C" void dynopt_dequant_scaling_256_le(
    const int16_t* q, const int32_t* dq, int16_t* c, int shift, int per)
{
    const int16x8_t shv = vdupq_n_s16((int16_t)(per - (shift + 4)));
    DQS_LE(0);   DQS_LE(8);   DQS_LE(16);  DQS_LE(24);
    DQS_LE(32);  DQS_LE(40);  DQS_LE(48);  DQS_LE(56);
    DQS_LE(64);  DQS_LE(72);  DQS_LE(80);  DQS_LE(88);
    DQS_LE(96);  DQS_LE(104); DQS_LE(112); DQS_LE(120);
    DQS_LE(128); DQS_LE(136); DQS_LE(144); DQS_LE(152);
    DQS_LE(160); DQS_LE(168); DQS_LE(176); DQS_LE(184);
    DQS_LE(192); DQS_LE(200); DQS_LE(208); DQS_LE(216);
    DQS_LE(224); DQS_LE(232); DQS_LE(240); DQS_LE(248);
}
