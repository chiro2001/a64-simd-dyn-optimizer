// SVE2 saoCuOrgE1_2Rows (64x2, vertical), upstream-exact vs x265 C
// semantics: same per-pixel E1 rule over two rows sharing upBuff1.
// Lane-independent within a row; same 128-bias clip as E1/B0.
#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_sao_e1_2rows_64x2_sve2(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo, intptr_t stride)
{
    const int8_t offs[16] = {
        offsetEo[0], offsetEo[1], offsetEo[2], offsetEo[3], offsetEo[4],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    const svbool_t pg16 = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svint8_t offv = svld1_s8(pg16, offs);
    const svint8_t c2 = svdup_s8(2);
    const svint8_t c128s = svdup_s8(128);
    const svuint8_t c128u = svdup_u8(128);
    for (int y = 0; y < 2; y++)
    {
        for (int x = 0; x < 64; x += 32)
        {
            svuint8_t p = svld1_u8(svptrue_b8(), rec + x);
            svuint8_t n = svld1_u8(svptrue_b8(), rec + x + stride);
            svbool_t gt = svcmpgt_u8(svptrue_b8(), p, n);
            svbool_t lt = svcmplt_u8(svptrue_b8(), p, n);
            svint8_t sr = svsel_s8(gt, svdup_s8(1),
                                   svsel_s8(lt, svdup_s8(-1),
                                            svdup_s8(0)));
            svint8_t up = svld1_s8(svptrue_b8(), upBuff1 + x);
            svint8_t edge = svadd_s8_x(svptrue_b8(),
                                       svadd_s8_x(svptrue_b8(),
                                                  sr, up),
                                       c2);
            svint8_t off = svtbl_s8(offv, svreinterpret_u8_s8(edge));
            svint8_t ps = svsub_s8_x(svptrue_b8(),
                                     svreinterpret_s8_u8(p), c128s);
            svint8_t s = svqadd_s8_x(svptrue_b8(), ps, off);
            svuint8_t out = svadd_u8_x(svptrue_b8(),
                                       svreinterpret_u8_s8(s), c128u);
            svst1_u8(svptrue_b8(), rec + x, out);
            svint8_t ns = svneg_s8_x(svptrue_b8(), sr);
            svst1_s8(svptrue_b8(), upBuff1 + x, ns);
        }
        rec += stride;
    }
}
