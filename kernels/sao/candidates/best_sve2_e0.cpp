// SVE2 saoCuOrgE0 (64x2, horizontal), upstream-exact vs x265 C
// semantics: sr_i = sign(rec[i]-rec[i+1]); edge_0 = sr_0 + signLeft + 2,
// edge_i = sr_i - sr_{i-1} + 2 (i>=1); rec[i] = clip(rec[i] + offset[edge]).
//
// The sign recurrence sl_i = -sr_{i-1} is a 1-lag difference, so the
// whole 32-byte chunk is processed in parallel: a TBL2 shift vector
// [-sl, sr_0, ..., sr_30] is built with svindex+svinsr, and
// edge = 2 + sr - shifted.  No NEON: pure Z-register, 0 umov/D-mem.
// clip(p + off) via 128 bias + wrapping add (same as B0/E1 family).
#include <arm_sve.h>
#include <stdint.h>

extern "C" void dynopt_sao_e0_64_sve2(
    uint8_t* rec, int8_t* offsetEo, int8_t* signLeft, intptr_t stride)
{
    const int8_t offs[16] = {
        offsetEo[0], offsetEo[1], offsetEo[2], offsetEo[3], offsetEo[4],
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
    };
    const svbool_t pg16 = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svint8_t offv = svld1_s8(pg16, offs);
    // [0, 32, 33, ..., 62]: lane0 -> dup(-sl)[0], lane i -> sr[i-1].
    // GPR constant + insr wzr, no NEON movi.
    const svuint8_t shuf = svinsr_n_u8(svindex_u8(32, 1), 0);
    const svint8_t c1 = svdup_s8(1);
    const svint8_t cm1 = svdup_s8(-1);
    const svint8_t c0 = svdup_s8(0);
    const svint8_t c2 = svdup_s8(2);
    const svint8_t c128s = svdup_s8(128);
    const svuint8_t c128u = svdup_u8(128);

    for (int y = 0; y < 2; y++)
    {
        int8_t sl = signLeft[y];
        for (int x = 0; x < 64; x += 32)
        {
            svuint8_t p = svld1_u8(svptrue_b8(), rec + x);
            svuint8_t n = svld1_u8(svptrue_b8(), rec + x + 1);
            svbool_t gt = svcmpgt_u8(svptrue_b8(), p, n);
            svbool_t lt = svcmplt_u8(svptrue_b8(), p, n);
            svint8_t sr = svsel_s8(gt, c1, svsel_s8(lt, cm1, c0));
            svint8_t shifted = svtbl2_s8(
                svcreate2_s8(svdup_s8((int8_t)-sl), sr), shuf);
            svint8_t edge = svadd_s8_x(svptrue_b8(),
                                       svsub_s8_x(svptrue_b8(),
                                                  sr, shifted),
                                       c2);
            svint8_t off = svtbl_s8(offv, svreinterpret_u8_s8(edge));
            svint8_t ps = svsub_s8_x(svptrue_b8(),
                                     svreinterpret_s8_u8(p), c128s);
            svint8_t s = svqadd_s8_x(svptrue_b8(), ps, off);
            svuint8_t out = svadd_u8_x(svptrue_b8(),
                                       svreinterpret_u8_s8(s), c128u);
            svst1_u8(svptrue_b8(), rec + x, out);
            // svlasta returns the FIRST active lane; the carry needs the
            // LAST lane (sr_31), so use svlastb.
            sl = (int8_t)-svlastb_s8(svptrue_b8(), sr);
        }
        rec += stride;
    }
}
