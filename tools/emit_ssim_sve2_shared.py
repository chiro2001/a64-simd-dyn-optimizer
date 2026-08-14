"""SVE2 ssim_4x4x2_core (two 4x4 blocks, VL=256) candidate emitter.

Processes both blocks in one 8-lane u32 vector (8 pixels/row); block sums
come from 4-lane sub-predicates (svwhilelt 0..4 / 4..8).
"""


def emit(func_name="dynopt_ssim_4x4x2_sve2"):
    return """\
#include <arm_sve.h>
#include <stdint.h>
#include <stddef.h>

extern "C" void %s(const uint8_t* p1, intptr_t s1,
                   const uint8_t* p2, intptr_t s2, int32_t* sums)
{
    svbool_t pg8 = svwhilelt_b32_u64(0, 8);
    svbool_t pg4a = svwhilelt_b32_u64(0, 4);
    svuint32_t a0 = svld1ub_u32(pg8, p1); p1 += s1;
    svuint32_t a1 = svld1ub_u32(pg8, p1); p1 += s1;
    svuint32_t a2 = svld1ub_u32(pg8, p1); p1 += s1;
    svuint32_t a3 = svld1ub_u32(pg8, p1);
    svuint32_t b0 = svld1ub_u32(pg8, p2); p2 += s2;
    svuint32_t b1 = svld1ub_u32(pg8, p2); p2 += s2;
    svuint32_t b2 = svld1ub_u32(pg8, p2); p2 += s2;
    svuint32_t b3 = svld1ub_u32(pg8, p2);

    svuint32_t t = svadd_u32_x(pg8, svadd_u32_x(pg8, a0, a1),
                               svadd_u32_x(pg8, a2, a3));
    svuint32_t u = svadd_u32_x(pg8, svadd_u32_x(pg8, b0, b1),
                               svadd_u32_x(pg8, b2, b3));
    svuint32_t sq = svadd_u32_x(pg8, svmul_u32_x(pg8, a0, a0),
                                svmul_u32_x(pg8, b0, b0));
    sq = svadd_u32_x(pg8, sq, svadd_u32_x(
        pg8, svmul_u32_x(pg8, a1, a1), svmul_u32_x(pg8, b1, b1)));
    sq = svadd_u32_x(pg8, sq, svadd_u32_x(
        pg8, svmul_u32_x(pg8, a2, a2), svmul_u32_x(pg8, b2, b2)));
    sq = svadd_u32_x(pg8, sq, svadd_u32_x(
        pg8, svmul_u32_x(pg8, a3, a3), svmul_u32_x(pg8, b3, b3)));
    svuint32_t cr = svmul_u32_x(pg8, a0, b0);
    cr = svadd_u32_x(pg8, cr, svmul_u32_x(pg8, a1, b1));
    cr = svadd_u32_x(pg8, cr, svmul_u32_x(pg8, a2, b2));
    cr = svadd_u32_x(pg8, cr, svmul_u32_x(pg8, a3, b3));

    // x265 sums layout is block-major: sums[z][0..3] = s1, s2, ss, s12.
    sums[0] = (int32_t)svaddv_u32(pg4a, t);
    sums[1] = (int32_t)svaddv_u32(pg4a, u);
    sums[2] = (int32_t)svaddv_u32(pg4a, sq);
    sums[3] = (int32_t)svaddv_u32(pg4a, cr);
    sums[4] = (int32_t)(svaddv_u32(pg8, t) - (uint32_t)sums[0]);
    sums[5] = (int32_t)(svaddv_u32(pg8, u) - (uint32_t)sums[1]);
    sums[6] = (int32_t)(svaddv_u32(pg8, sq) - (uint32_t)sums[2]);
    sums[7] = (int32_t)(svaddv_u32(pg8, cr) - (uint32_t)sums[3]);
}
""" % func_name


def emit_combo(combo):
    return emit()
