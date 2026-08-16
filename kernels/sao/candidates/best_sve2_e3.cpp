// SVE2 saoCuOrgE3 (64x1, diagonal 45deg), upstream-exact vs x265 C
// semantics: sd = sign(rec[x] - rec[x+stride]),
// edge = sd + upBuff1[x] + 2, upBuff1[x-1] = -sd,
// rec[x] = clip(rec[x] + offsetEo[edge]) for x in [1,64).
// Lane-independent; chunks x=1..32 (full) and x=33..63 (31 lanes).
#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_sao_e3_64_sve2(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo, intptr_t stride)
{
    const int8_t offs[16] = {
        offsetEo[0], offsetEo[1], offsetEo[2], offsetEo[3], offsetEo[4],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    const svbool_t pg16 = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svbool_t pg31 = svwhilelt_b8((uint32_t)0, (uint32_t)31);
    const svint8_t offv = svld1_s8(pg16, offs);
    const svint8_t c2 = svdup_s8(2);
    const svint8_t c128s = svdup_s8(128);
    const svuint8_t c128u = svdup_u8(128);

    // x = 1..32 (full 32-byte chunk).
    svuint8_t p = svld1_u8(svptrue_b8(), rec + 1);
    svuint8_t n = svld1_u8(svptrue_b8(), rec + 1 + stride);
    svbool_t gt = svcmpgt_u8(svptrue_b8(), p, n);
    svbool_t lt = svcmplt_u8(svptrue_b8(), p, n);
    svint8_t sd = svsel_s8(gt, svdup_s8(1),
                           svsel_s8(lt, svdup_s8(-1),
                                    svdup_s8(0)));
    svint8_t su = svld1_s8(svptrue_b8(), upBuff1 + 1);
    svint8_t edge = svadd_s8_x(svptrue_b8(),
                               svadd_s8_x(svptrue_b8(), sd, su), c2);
    svint8_t off = svtbl_s8(offv, svreinterpret_u8_s8(edge));
    svint8_t ps = svsub_s8_x(svptrue_b8(), svreinterpret_s8_u8(p), c128s);
    svint8_t s = svqadd_s8_x(svptrue_b8(), ps, off);
    svuint8_t out = svadd_u8_x(svptrue_b8(), svreinterpret_u8_s8(s), c128u);
    svst1_u8(svptrue_b8(), rec + 1, out);
    svint8_t ns = svneg_s8_x(svptrue_b8(), sd);
    svst1_s8(svptrue_b8(), upBuff1, ns);

    // x = 33..63 (31 lanes).
    p = svld1_u8(pg31, rec + 33);
    n = svld1_u8(pg31, rec + 33 + stride);
    gt = svcmpgt_u8(pg31, p, n);
    lt = svcmplt_u8(pg31, p, n);
    sd = svsel_s8(gt, svdup_s8(1), svsel_s8(lt, svdup_s8(-1), svdup_s8(0)));
    su = svld1_s8(pg31, upBuff1 + 33);
    edge = svadd_s8_x(pg31, svadd_s8_x(pg31, sd, su), c2);
    off = svtbl_s8(offv, svreinterpret_u8_s8(edge));
    ps = svsub_s8_x(pg31, svreinterpret_s8_u8(p), c128s);
    s = svqadd_s8_x(pg31, ps, off);
    out = svadd_u8_x(pg31, svreinterpret_u8_s8(s), c128u);
    svst1_u8(pg31, rec + 33, out);
    ns = svneg_s8_x(pg31, sd);
    svst1_s8(pg31, upBuff1 + 32, ns);
}
