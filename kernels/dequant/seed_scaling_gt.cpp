// dequant_scaling 256 NEON seed, shift+4 > per branch (docs/44).
// Semantics per element: sat16((q*dq + (1 << (shift-per-1))) >> (shift-per)).
// Branchless specialization; the harness only tests this branch.
#include <arm_neon.h>

#include <stdint.h>

static inline void dqs8_gt(const int16_t* q, const int32_t* dq, int16_t* c,
                           int32x4_t addv, int32x4_t nshiftv)
{
    int16x8_t vq = vld1q_s16(q);
    int32x4_t vd0 = vld1q_s32(dq);
    int32x4_t vd1 = vld1q_s32(dq + 4);
    int32x4_t p0 = vmulq_s32(vmovl_s16(vget_low_s16(vq)), vd0);
    int32x4_t p1 = vmulq_s32(vmovl_s16(vget_high_s16(vq)), vd1);
    p0 = vshlq_s32(vaddq_s32(p0, addv), nshiftv);
    p1 = vshlq_s32(vaddq_s32(p1, addv), nshiftv);
    vst1q_s16(c, vcombine_s16(vqmovn_s32(p0), vqmovn_s32(p1)));
}

#define DQS_GT(off) \
    dqs8_gt(q + (off), dq + (off), c + (off), addv, nshiftv)

extern "C" void dynopt_dequant_scaling_256_gt(
    const int16_t* q, const int32_t* dq, int16_t* c, int shift, int per)
{
    const int nshift = per - (shift + 4);
    const int add = 1 << ((shift + 4) - per - 1);
    const int32x4_t addv = vdupq_n_s32(add);
    const int32x4_t nshiftv = vdupq_n_s32(nshift);
    DQS_GT(0);   DQS_GT(8);   DQS_GT(16);  DQS_GT(24);
    DQS_GT(32);  DQS_GT(40);  DQS_GT(48);  DQS_GT(56);
    DQS_GT(64);  DQS_GT(72);  DQS_GT(80);  DQS_GT(88);
    DQS_GT(96);  DQS_GT(104); DQS_GT(112); DQS_GT(120);
    DQS_GT(128); DQS_GT(136); DQS_GT(144); DQS_GT(152);
    DQS_GT(160); DQS_GT(168); DQS_GT(176); DQS_GT(184);
    DQS_GT(192); DQS_GT(200); DQS_GT(208); DQS_GT(216);
    DQS_GT(224); DQS_GT(232); DQS_GT(240); DQS_GT(248);
}
