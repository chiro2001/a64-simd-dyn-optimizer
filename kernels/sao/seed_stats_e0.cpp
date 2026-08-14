// SAO stats E0, 64x1 NEON seed (ACLE, docs/45 §7). Mirrors
// saoCuStatsE0_neon: edge_type = sign_right - neg_sign_left (carry via
// vextq rotate 15), 5 edge-type count/stats accumulators, reduce.
#include <arm_neon.h>

#include <stddef.h>
#include <stdint.h>

static inline int8x16_t sgn16s(const uint8_t* a, const uint8_t* b)
{
    uint8x16_t s0 = vld1q_u8(a);
    uint8x16_t s1 = vld1q_u8(b);
    // sign(a-b) = (b>a ? -1 : 0) - (a>b ? -1 : 0); vcgt yields 0xFF for
    // true, so the -1/0 convention is implicit.
    return vsubq_s8(vreinterpretq_s8_u8(vcgtq_u8(s1, s0)),
                    vreinterpretq_s8_u8(vcgtq_u8(s0, s1)));
}

static inline void eo_stats_s(const int8x16_t et, const int16_t* diff,
                              int16x8_t* cnt, int32x4_t* st)
{
    int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et, vdupq_n_s8(-2)));
    int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et, vdupq_n_s8(-1)));
    int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et, vdupq_n_s8(0)));
    int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et, vdupq_n_s8(1)));
    int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et, vdupq_n_s8(2)));
    cnt[0] = vpadalq_s8(cnt[0], m0);
    cnt[1] = vpadalq_s8(cnt[1], m1);
    cnt[2] = vpadalq_s8(cnt[2], m2);
    cnt[3] = vpadalq_s8(cnt[3], m3);
    cnt[4] = vpadalq_s8(cnt[4], m4);
    int16x8_t d0 = vld1q_s16(diff), d1 = vld1q_s16(diff + 8);
    st[0] = vpadalq_s16(st[0],
                        vmulq_s16(d0, vreinterpretq_s16_s8(
                            vzip1q_s8(m0, m0))));
    st[1] = vpadalq_s16(st[1],
                        vmulq_s16(d0, vreinterpretq_s16_s8(
                            vzip1q_s8(m1, m1))));
    st[2] = vpadalq_s16(st[2],
                        vmulq_s16(d0, vreinterpretq_s16_s8(
                            vzip1q_s8(m2, m2))));
    st[3] = vpadalq_s16(st[3],
                        vmulq_s16(d0, vreinterpretq_s16_s8(
                            vzip1q_s8(m3, m3))));
    st[4] = vpadalq_s16(st[4],
                        vmulq_s16(d0, vreinterpretq_s16_s8(
                            vzip1q_s8(m4, m4))));
    st[0] = vpadalq_s16(st[0],
                        vmulq_s16(d1, vreinterpretq_s16_s8(
                            vzip2q_s8(m0, m0))));
    st[1] = vpadalq_s16(st[1],
                        vmulq_s16(d1, vreinterpretq_s16_s8(
                            vzip2q_s8(m1, m1))));
    st[2] = vpadalq_s16(st[2],
                        vmulq_s16(d1, vreinterpretq_s16_s8(
                            vzip2q_s8(m2, m2))));
    st[3] = vpadalq_s16(st[3],
                        vmulq_s16(d1, vreinterpretq_s16_s8(
                            vzip2q_s8(m3, m3))));
    st[4] = vpadalq_s16(st[4],
                        vmulq_s16(d1, vreinterpretq_s16_s8(
                            vzip2q_s8(m4, m4))));
}

#define STATS_BLOCK(x)                                                    \
    do {                                                                  \
        int8x16_t sr = sgn16s(rec + (x), rec + (x) + 1);                  \
        neg_sign_left = vextq_s8(neg_sign_left, sr, 15);                  \
        int8x16_t et = vsubq_s8(sr, neg_sign_left);                       \
        neg_sign_left = sr;                                               \
        eo_stats_s(et, diff + (x), cnt, st);                              \
    } while (0)

extern "C" void dynopt_sao_stats_e0_64(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int32_t* stats, int32_t* count)
{
    int16x8_t cnt[5] = { vdupq_n_s16(0), vdupq_n_s16(0), vdupq_n_s16(0),
                         vdupq_n_s16(0), vdupq_n_s16(0) };
    int32x4_t st[5] = { vdupq_n_s32(0), vdupq_n_s32(0), vdupq_n_s32(0),
                        vdupq_n_s32(0), vdupq_n_s32(0) };
    // neg_sign_left(0) = signOf(rec[-1]-rec[0]) = -signLeft(0); the per-lane
    // signLeft for x=0 is the negation of this value (mirrors NEON).
    int d0 = (int)rec[-1] - (int)rec[0];
    int8_t sl0 = d0 < 0 ? -1 : (d0 > 0 ? 1 : 0);
    int8x16_t neg_sign_left = vdupq_n_s8(sl0);
    STATS_BLOCK(0);
    STATS_BLOCK(16);
    STATS_BLOCK(32);
    STATS_BLOCK(48);
    int16x8_t c01 = vpaddq_s16(cnt[2], cnt[0]);
    int16x8_t c23 = vpaddq_s16(cnt[1], cnt[3]);
    int16x8_t c0123 = vpaddq_s16(c01, c23);
    vst1q_s32(count, vsubq_s32(vld1q_s32(count), vpaddlq_s16(c0123)));
    count[4] -= vaddvq_s16(cnt[4]);
    int32x4_t s01 = vpaddq_s32(st[2], st[0]);
    int32x4_t s23 = vpaddq_s32(st[1], st[3]);
    int32x4_t s0123 = vpaddq_s32(s01, s23);
    vst1q_s32(stats, vsubq_s32(vld1q_s32(stats), s0123));
    stats[4] -= vaddvq_s32(st[4]);
}
