#include <arm_neon.h>
#include <arm_sve.h>
#include <arm_neon_sve_bridge.h>
#include <stdint.h>
#include <stddef.h>

static inline int8x16_t sign16n(const uint8_t* a, const uint8_t* b)
{
    uint8x16_t s0 = vld1q_u8(a);
    uint8x16_t s1 = vld1q_u8(b);
    return vsubq_s8(vreinterpretq_s8_u8(vcgtq_u8(s1, s0)),
                    vreinterpretq_s8_u8(vcgtq_u8(s0, s1)));
}

static inline int64x2_t sdot16(int64x2_t acc, int16x8_t x,
                               int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(
        svset_neonq_s64(svundef_s64(), acc),
        svset_neonq_s16(svundef_s16(), x),
        svset_neonq_s16(svundef_s16(), y)));
}

extern "C" void dynopt_sao_stats_e0_64_sve2(const int16_t* diff, const uint8_t* rec, intptr_t stride, int32_t* stats, int32_t* count)
{
    const int8x16_t DC = vdupq_n_s8(-3);
    const int8x16_t idx = { 0, -2, -1, 1, 2, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3, -3 };
    svint8_t svidx = svset_neonq_s8(svundef_s8(), idx);
    uint8x16_t count_u8 = vdupq_n_u8(0);
    int64x2_t st[5] = { vdupq_n_s64(0), vdupq_n_s64(0), vdupq_n_s64(0), vdupq_n_s64(0), vdupq_n_s64(0) };
    int d0 = (int)rec[-1] - (int)rec[0];
    int8x16_t nsl = vdupq_n_s8(d0 < 0 ? -1 : (d0 > 0 ? 1 : 0));
    {
        int8x16_t sr = sign16n(rec + 0, rec + 0 + 1);
        nsl = vextq_s8(nsl, sr, 15);
        int8x16_t et = vsubq_s8(sr, nsl);
        nsl = sr;
        svint8_t svet = svset_neonq_s8(svundef_s8(), et);
        count_u8 = vaddq_u8(count_u8,
            svget_neonq_u8(svhistseg_s8(svidx, svet)));
        int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-2)));
        int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-1)));
        int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(0)));
        int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(1)));
        int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(2)));
        int16x8_t dl = vld1q_s16(diff + 0);
        int16x8_t dh = vld1q_s16(diff + 0 + 8);
        st[0] = sdot16(st[0], dl, vreinterpretq_s16_s8(vzip1q_s8(m0, m0)));
        st[1] = sdot16(st[1], dl, vreinterpretq_s16_s8(vzip1q_s8(m1, m1)));
        st[2] = sdot16(st[2], dl, vreinterpretq_s16_s8(vzip1q_s8(m2, m2)));
        st[3] = sdot16(st[3], dl, vreinterpretq_s16_s8(vzip1q_s8(m3, m3)));
        st[4] = sdot16(st[4], dl, vreinterpretq_s16_s8(vzip1q_s8(m4, m4)));
        st[0] = sdot16(st[0], dh, vreinterpretq_s16_s8(vzip2q_s8(m0, m0)));
        st[1] = sdot16(st[1], dh, vreinterpretq_s16_s8(vzip2q_s8(m1, m1)));
        st[2] = sdot16(st[2], dh, vreinterpretq_s16_s8(vzip2q_s8(m2, m2)));
        st[3] = sdot16(st[3], dh, vreinterpretq_s16_s8(vzip2q_s8(m3, m3)));
        st[4] = sdot16(st[4], dh, vreinterpretq_s16_s8(vzip2q_s8(m4, m4)));
    }
    {
        int8x16_t sr = sign16n(rec + 16, rec + 16 + 1);
        nsl = vextq_s8(nsl, sr, 15);
        int8x16_t et = vsubq_s8(sr, nsl);
        nsl = sr;
        svint8_t svet = svset_neonq_s8(svundef_s8(), et);
        count_u8 = vaddq_u8(count_u8,
            svget_neonq_u8(svhistseg_s8(svidx, svet)));
        int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-2)));
        int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-1)));
        int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(0)));
        int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(1)));
        int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(2)));
        int16x8_t dl = vld1q_s16(diff + 16);
        int16x8_t dh = vld1q_s16(diff + 16 + 8);
        st[0] = sdot16(st[0], dl, vreinterpretq_s16_s8(vzip1q_s8(m0, m0)));
        st[1] = sdot16(st[1], dl, vreinterpretq_s16_s8(vzip1q_s8(m1, m1)));
        st[2] = sdot16(st[2], dl, vreinterpretq_s16_s8(vzip1q_s8(m2, m2)));
        st[3] = sdot16(st[3], dl, vreinterpretq_s16_s8(vzip1q_s8(m3, m3)));
        st[4] = sdot16(st[4], dl, vreinterpretq_s16_s8(vzip1q_s8(m4, m4)));
        st[0] = sdot16(st[0], dh, vreinterpretq_s16_s8(vzip2q_s8(m0, m0)));
        st[1] = sdot16(st[1], dh, vreinterpretq_s16_s8(vzip2q_s8(m1, m1)));
        st[2] = sdot16(st[2], dh, vreinterpretq_s16_s8(vzip2q_s8(m2, m2)));
        st[3] = sdot16(st[3], dh, vreinterpretq_s16_s8(vzip2q_s8(m3, m3)));
        st[4] = sdot16(st[4], dh, vreinterpretq_s16_s8(vzip2q_s8(m4, m4)));
    }
    {
        int8x16_t sr = sign16n(rec + 32, rec + 32 + 1);
        nsl = vextq_s8(nsl, sr, 15);
        int8x16_t et = vsubq_s8(sr, nsl);
        nsl = sr;
        svint8_t svet = svset_neonq_s8(svundef_s8(), et);
        count_u8 = vaddq_u8(count_u8,
            svget_neonq_u8(svhistseg_s8(svidx, svet)));
        int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-2)));
        int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-1)));
        int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(0)));
        int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(1)));
        int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(2)));
        int16x8_t dl = vld1q_s16(diff + 32);
        int16x8_t dh = vld1q_s16(diff + 32 + 8);
        st[0] = sdot16(st[0], dl, vreinterpretq_s16_s8(vzip1q_s8(m0, m0)));
        st[1] = sdot16(st[1], dl, vreinterpretq_s16_s8(vzip1q_s8(m1, m1)));
        st[2] = sdot16(st[2], dl, vreinterpretq_s16_s8(vzip1q_s8(m2, m2)));
        st[3] = sdot16(st[3], dl, vreinterpretq_s16_s8(vzip1q_s8(m3, m3)));
        st[4] = sdot16(st[4], dl, vreinterpretq_s16_s8(vzip1q_s8(m4, m4)));
        st[0] = sdot16(st[0], dh, vreinterpretq_s16_s8(vzip2q_s8(m0, m0)));
        st[1] = sdot16(st[1], dh, vreinterpretq_s16_s8(vzip2q_s8(m1, m1)));
        st[2] = sdot16(st[2], dh, vreinterpretq_s16_s8(vzip2q_s8(m2, m2)));
        st[3] = sdot16(st[3], dh, vreinterpretq_s16_s8(vzip2q_s8(m3, m3)));
        st[4] = sdot16(st[4], dh, vreinterpretq_s16_s8(vzip2q_s8(m4, m4)));
    }
    {
        int8x16_t sr = sign16n(rec + 48, rec + 48 + 1);
        nsl = vextq_s8(nsl, sr, 15);
        int8x16_t et = vsubq_s8(sr, nsl);
        nsl = sr;
        svint8_t svet = svset_neonq_s8(svundef_s8(), et);
        count_u8 = vaddq_u8(count_u8,
            svget_neonq_u8(svhistseg_s8(svidx, svet)));
        int8x16_t m0 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-2)));
        int8x16_t m1 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(-1)));
        int8x16_t m2 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(0)));
        int8x16_t m3 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(1)));
        int8x16_t m4 = vreinterpretq_s8_u8(vceqq_s8(et,
 vdupq_n_s8(2)));
        int16x8_t dl = vld1q_s16(diff + 48);
        int16x8_t dh = vld1q_s16(diff + 48 + 8);
        st[0] = sdot16(st[0], dl, vreinterpretq_s16_s8(vzip1q_s8(m0, m0)));
        st[1] = sdot16(st[1], dl, vreinterpretq_s16_s8(vzip1q_s8(m1, m1)));
        st[2] = sdot16(st[2], dl, vreinterpretq_s16_s8(vzip1q_s8(m2, m2)));
        st[3] = sdot16(st[3], dl, vreinterpretq_s16_s8(vzip1q_s8(m3, m3)));
        st[4] = sdot16(st[4], dl, vreinterpretq_s16_s8(vzip1q_s8(m4, m4)));
        st[0] = sdot16(st[0], dh, vreinterpretq_s16_s8(vzip2q_s8(m0, m0)));
        st[1] = sdot16(st[1], dh, vreinterpretq_s16_s8(vzip2q_s8(m1, m1)));
        st[2] = sdot16(st[2], dh, vreinterpretq_s16_s8(vzip2q_s8(m2, m2)));
        st[3] = sdot16(st[3], dh, vreinterpretq_s16_s8(vzip2q_s8(m3, m3)));
        st[4] = sdot16(st[4], dh, vreinterpretq_s16_s8(vzip2q_s8(m4, m4)));
    }
    uint16x8_t count_u16 = vaddw_u8(vdupq_n_u16(0),
                                     vget_low_u8(count_u8));
    int32x4_t c0123 = vmovl_s16(
        vget_low_s16(vreinterpretq_s16_u16(count_u16)));
    vst1q_s32(count, vaddq_s32(vld1q_s32(count), c0123));
    count[4] += vgetq_lane_u16(count_u16, 4);
    int32x4_t s01 = vcombine_s32(vmovn_s64(st[2]), vmovn_s64(st[0]));
    int32x4_t s23 = vcombine_s32(vmovn_s64(st[1]), vmovn_s64(st[3]));
    int32x4_t s0123 = vpaddq_s32(s01, s23);
    vst1q_s32(stats, vsubq_s32(vld1q_s32(stats), s0123));
    stats[4] -= vaddvq_s64(st[4]);
}
