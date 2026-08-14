// dequant_normal 256 NEON seed (ACLE), straight-line (docs/41, docs/44).
// Semantics: per element `(q * scale + (1 << (shift-1))) >> shift`,
// saturating narrow to s16 -- matches x265_dequant_normal_neon exactly.
// Upstream aarch64 dequant is assembly (pixel-util.S), so the seed is the
// ACLE semantics; the roundtrip gate validates against the NEON reference.
#include <arm_neon.h>

#include <stdint.h>

static inline void dqn16(const int16_t* q, int16_t* c,
                         int16x8_t sv, int32x4_t nv)
{
    int16x8_t v = vld1q_s16(q);
    int32x4_t lo = vmull_s16(vget_low_s16(v), vget_low_s16(sv));
    int32x4_t hi = vmull_s16(vget_high_s16(v), vget_high_s16(sv));
    lo = vqrshlq_s32(lo, nv);
    hi = vqrshlq_s32(hi, nv);
    vst1q_s16(c, vcombine_s16(vqmovn_s32(lo), vqmovn_s32(hi)));
}

#define DQN_8(off) dqn16(q + (off), c + (off), sv, nv)

extern "C" void dynopt_dequant_normal_256(
    const int16_t* q, int16_t* c, int scale, int shift)
{
    int16x8_t sv = vdupq_n_s16((int16_t)scale);
    int32x4_t nv = vdupq_n_s32(-shift);
    DQN_8(0);
    DQN_8(8);
    DQN_8(16);
    DQN_8(24);
    DQN_8(32);
    DQN_8(40);
    DQN_8(48);
    DQN_8(56);
    DQN_8(64);
    DQN_8(72);
    DQN_8(80);
    DQN_8(88);
    DQN_8(96);
    DQN_8(104);
    DQN_8(112);
    DQN_8(120);
    DQN_8(128);
    DQN_8(136);
    DQN_8(144);
    DQN_8(152);
    DQN_8(160);
    DQN_8(168);
    DQN_8(176);
    DQN_8(184);
    DQN_8(192);
    DQN_8(200);
    DQN_8(208);
    DQN_8(216);
    DQN_8(224);
    DQN_8(232);
    DQN_8(240);
    DQN_8(248);
}
