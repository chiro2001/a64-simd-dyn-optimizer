// SVE2 saoCuOrgE0 (64x2), upstream-exact vs x265 C semantics
// (docs/45 tbl-u16 layout).  Sign via u8 comparisons (wrap-free);
// edge recurrence sl_i = -sr_{i-1} via shift-insert; offset table
// lookup (svtbl); output = saturating narrow of zero-extended p +
// signed offset (clip to [0,255]).
#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_sao_e0_64_sve2(
    uint8_t* rec, int8_t* offsetEo, int8_t* signLeft, intptr_t stride)
{
    const svbool_t pg8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);
    const svbool_t pg8h = svwhilelt_b16((uint32_t)0, (uint32_t)8);
    const int8_t offs[16] = {
        offsetEo[0], offsetEo[1], offsetEo[2], offsetEo[3], offsetEo[4],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    const svint8_t offv = svld1_s8(svptrue_b8(), offs);

    for (int y = 0; y < 2; y++)
    {
        int8_t sl = signLeft[y];
        for (int x = 0; x < 64; x += 8)
        {
            svuint8_t p = svld1_u8(pg8, rec + x);
            svuint8_t n = svld1_u8(pg8, rec + x + 1);
            svbool_t gt = svcmpgt_u8(svptrue_b8(), p, n);
            svbool_t lt = svcmplt_u8(svptrue_b8(), p, n);
            svint8_t sr8 = svsel_s8(gt, svdup_s8(1),
                                    svsel_s8(lt, svdup_s8(-1),
                                             svdup_s8(0)));
            svint16_t sr = svunpklo_s16(sr8);
            svint16_t slv = svinsr_n_s16(
                svneg_s16_x(svptrue_b16(), sr), sl);
            svint16_t edge = svadd_s16_x(svptrue_b16(),
                                         svadd_s16_x(svptrue_b16(),
                                                     sr, slv),
                                         svdup_s16(2));
            svuint8_t idx = svuzp1_u8(svqxtunb_s16(edge),
                                      svqxtunb_s16(edge));
            svint8_t off = svtbl_s8(offv, idx);
            svint16_t pu = svreinterpret_s16_u16(svunpklo_u16(p));
            svint16_t so = svunpklo_s16(off);
            svint16_t sum = svadd_s16_x(svptrue_b16(), pu, so);
            svuint8_t out = svuzp1_u8(svqxtunb_s16(sum),
                                      svqxtunb_s16(sum));
            svst1_u8(pg8, rec + x, out);
            svint16_t s7 = svdup_lane_s16(sr, 7);
            sl = (int8_t)-svlasta_s16(svptrue_b16(), s7);
        }
        rec += stride;
    }
}
