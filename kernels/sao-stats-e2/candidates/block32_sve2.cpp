#include <arm_sve.h>
#include <stdint.h>
#include <stddef.h>

extern "C" void dynopt_sao_stats_e2_64_sve2(const int16_t* diff, const uint8_t* rec, intptr_t stride, int8_t* upBuff1, int8_t* upBufft, int32_t* stats, int32_t* count)
{
    const svbool_t pg8 = svptrue_b8();
    const svbool_t pg16 = svptrue_b16();
    const svbool_t pg64 = svptrue_b64();
    const svint8_t n1 = svdup_n_s8(-1);
    const svint8_t z0 = svdup_n_s8(0);
    long cnt[5] = { 0, 0, 0, 0, 0 };
    svint64_t st0 = svdup_n_s64(0), st1 = svdup_n_s64(0), st2 = svdup_n_s64(0), st3 = svdup_n_s64(0), st4 = svdup_n_s64(0);
    for (int x = 0; x < 64; x += 32)
    {
        svint8_t su = svneg_s8_x(pg8, svld1_s8(pg8, upBuff1 + x));
        svuint8_t cur = svld1_u8(pg8, rec + x);
        svuint8_t nxt = svld1_u8(pg8, rec + x + stride + 1);
        svint8_t sd = svsub_s8_x(svptrue_b8(), svsel_s8(svcmpgt_u8(svptrue_b8(), nxt, cur), n1, z0), svsel_s8(svcmpgt_u8(svptrue_b8(), cur, nxt), n1, z0));
        svint8_t et = svsub_s8_x(pg8, sd, su);
        svst1_s8(pg8, upBufft + x + 1, sd);
        svint16_t dl = svld1_s16(pg16, diff + x);
        svint16_t dh = svld1_s16(pg16, diff + x + 16);
        svbool_t p0 = svcmpeq_s8(pg8, et, svdup_n_s8(-2));
        svbool_t p1 = svcmpeq_s8(pg8, et, svdup_n_s8(-1));
        svbool_t p2 = svcmpeq_s8(pg8, et, svdup_n_s8(0));
        svbool_t p3 = svcmpeq_s8(pg8, et, svdup_n_s8(1));
        svbool_t p4 = svcmpeq_s8(pg8, et, svdup_n_s8(2));
        cnt[0] += svcntp_b8(pg8, p0);
        cnt[1] += svcntp_b8(pg8, p1);
        cnt[2] += svcntp_b8(pg8, p2);
        cnt[3] += svcntp_b8(pg8, p3);
        cnt[4] += svcntp_b8(pg8, p4);
        {
            svint8_t mk = svsel_s8(p0, n1, z0);
            svint16_t ml = svunpklo_s16(mk);
            svint16_t mh = svunpkhi_s16(mk);
            svint64_t stk = svdot_s64(svdup_n_s64(0), dl, ml);
            stk = svdot_s64(stk, dh, mh);
            st0 = svadd_s64_x(pg64, st0, stk);
        }
        {
            svint8_t mk = svsel_s8(p1, n1, z0);
            svint16_t ml = svunpklo_s16(mk);
            svint16_t mh = svunpkhi_s16(mk);
            svint64_t stk = svdot_s64(svdup_n_s64(0), dl, ml);
            stk = svdot_s64(stk, dh, mh);
            st1 = svadd_s64_x(pg64, st1, stk);
        }
        {
            svint8_t mk = svsel_s8(p2, n1, z0);
            svint16_t ml = svunpklo_s16(mk);
            svint16_t mh = svunpkhi_s16(mk);
            svint64_t stk = svdot_s64(svdup_n_s64(0), dl, ml);
            stk = svdot_s64(stk, dh, mh);
            st2 = svadd_s64_x(pg64, st2, stk);
        }
        {
            svint8_t mk = svsel_s8(p3, n1, z0);
            svint16_t ml = svunpklo_s16(mk);
            svint16_t mh = svunpkhi_s16(mk);
            svint64_t stk = svdot_s64(svdup_n_s64(0), dl, ml);
            stk = svdot_s64(stk, dh, mh);
            st3 = svadd_s64_x(pg64, st3, stk);
        }
        {
            svint8_t mk = svsel_s8(p4, n1, z0);
            svint16_t ml = svunpklo_s16(mk);
            svint16_t mh = svunpkhi_s16(mk);
            svint64_t stk = svdot_s64(svdup_n_s64(0), dl, ml);
            stk = svdot_s64(stk, dh, mh);
            st4 = svadd_s64_x(pg64, st4, stk);
        }
    }
    int d0 = (int)rec[-1] - (int)rec[stride];
    upBufft[0] = d0 < 0 ? -1 : (d0 > 0 ? 1 : 0);
    // s_eoTable memory order for et=-2,-1,0,1,2: {1,2,0,3,4}.
    count[1] += (int)cnt[0]; stats[1] -= (int)svaddv_s64(pg64, st0);
    count[2] += (int)cnt[1]; stats[2] -= (int)svaddv_s64(pg64, st1);
    count[0] += (int)cnt[2]; stats[0] -= (int)svaddv_s64(pg64, st2);
    count[3] += (int)cnt[3]; stats[3] -= (int)svaddv_s64(pg64, st3);
    count[4] += (int)cnt[4]; stats[4] -= (int)svaddv_s64(pg64, st4);
}
