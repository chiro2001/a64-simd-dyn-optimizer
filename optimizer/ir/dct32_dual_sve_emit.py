"""dct32 dual-group 16-lane SVE emitter (VL=256 fixed).

Same packed dual-group lowering as dct16 (docs/72): two 8-lane groups
per 16-lane register, adjacent rows paired (A = rows i/i+1,
B = rows i+2/i+3).  dct32 rows have four 8-lane chunks (v0..v3), so
each row contributes two O registers (O_0 = v0-rev(v3),
O_1 = v1-rev(v2)) and an 8-lane EO; the pair-form dual registers feed
the sdot loops directly (no quad pack needed, unlike dct16).

Correctness gate: 0 NEON object check; TestBenchLite vs x265 dct32_c
at QEMU VL=256; cross-VQ diff vs the 8-lane pure-SVE dct32 (vq=1,
separate process).
"""

from __future__ import annotations

from dct32_pure_sve_emit import emit_pure_sve as emit_pure_sve32
from dct16_dual_sve_emit import DUAL_HELPERS


_PROLOGUE = r"""
static inline void op_pass_4_dual(const int16_t* src, int16_t* dst,
                                  intptr_t stride)
{
    const int line = 32;
    const int shift = 4;
    for (int i = 0; i < line; i += 4)
    {
        // Pair A: rows i+0, i+1; pair B: rows i+2, i+3.
        const svint16_t rA_v0 = psv16_dual_load8_safe(
            src + (i + 0) * stride + 0, src + (i + 1) * stride + 0);
        const svint16_t rA_v1 = psv16_dual_load8_safe(
            src + (i + 0) * stride + 8, src + (i + 1) * stride + 8);
        const svint16_t rA_v2 = psv16_dual_load8_safe(
            src + (i + 0) * stride + 16, src + (i + 1) * stride + 16);
        const svint16_t rA_v3 = psv16_dual_load8_safe(
            src + (i + 0) * stride + 24, src + (i + 1) * stride + 24);
        svint16_t rA_v2r = psv16_dual_rev16(rA_v2);
        svint16_t rA_v3r = psv16_dual_rev16(rA_v3);
        svint16_t O_A0 = svsub_s16_x(svptrue_b16(), rA_v0, rA_v3r);
        svint16_t O_A1 = svsub_s16_x(svptrue_b16(), rA_v1, rA_v2r);
        svint32_t E0_A = psv16_dual_saddl(psv16_dual_vget_lo4(rA_v0),
                                          psv16_dual_vget_lo4(rA_v3r));
        svint32_t E1_A = psv16_dual_saddl(psv16_dual_vget_hi4(rA_v0),
                                          psv16_dual_vget_hi4(rA_v3r));
        svint32_t E2_A = psv16_dual_saddl(psv16_dual_vget_lo4(rA_v1),
                                          psv16_dual_vget_lo4(rA_v2r));
        svint32_t E3_A = psv16_dual_saddl(psv16_dual_vget_hi4(rA_v1),
                                          psv16_dual_vget_hi4(rA_v2r));
        // Odd (EO): pass1 keeps the 8-lane s16 combine; pass2 keeps
        // the two s32 per-row registers.
        svint32_t EOx_A_lo = svsub_s32_x(svptrue_b32(), E0_A,
                                         psv16_dual_rev32_s32(E3_A));
        svint32_t EOx_A_hi = svsub_s32_x(svptrue_b32(), E1_A,
                                         psv16_dual_rev32_s32(E2_A));
        svint16_t EO_A_s16 = psv16_dual_combine4_s16(
            psv16_dual_vmovn_s32(EOx_A_lo),
            psv16_dual_vmovn_s32(EOx_A_hi));
        // Even: EE -> EEE/EEO (pair-form dual s32).
        svint32_t EE_A0 = svadd_s32_x(svptrue_b32(), E0_A,
                                      psv16_dual_rev32_s32(E3_A));
        svint32_t EE_A1 = svadd_s32_x(svptrue_b32(), E1_A,
                                      psv16_dual_rev32_s32(E2_A));
        svint32_t EEE_A = svadd_s32_x(svptrue_b32(), EE_A0,
                                      psv16_dual_rev32_s32(EE_A1));
        svint32_t EEO_A = svsub_s32_x(svptrue_b32(), EE_A0,
                                      psv16_dual_rev32_s32(EE_A1));
        // Even-even / even-odd across the row pair (g1 = 0).
        svint32_t t0_A = svreinterpret_s32_s64(svuzp1_s64(
            svreinterpret_s64_s32(EEE_A), psv_zero_s64()));
        svint32_t z2_A = svreinterpret_s32_s64(svuzp2_s64(
            svreinterpret_s64_s32(EEE_A), psv_zero_s64()));
        svint32_t t1_A = psv16_dual_rev64_s32(z2_A);
        svint32_t EEEE_A = svadd_s32_x(svptrue_b32(), t0_A, t1_A);
        svint32_t EEEO_A = svsub_s32_x(svptrue_b32(), t0_A, t1_A);

        const svint16_t rB_v0 = psv16_dual_load8_safe(
            src + (i + 2) * stride + 0, src + (i + 3) * stride + 0);
        const svint16_t rB_v1 = psv16_dual_load8_safe(
            src + (i + 2) * stride + 8, src + (i + 3) * stride + 8);
        const svint16_t rB_v2 = psv16_dual_load8_safe(
            src + (i + 2) * stride + 16, src + (i + 3) * stride + 16);
        const svint16_t rB_v3 = psv16_dual_load8_safe(
            src + (i + 2) * stride + 24, src + (i + 3) * stride + 24);
        svint16_t rB_v2r = psv16_dual_rev16(rB_v2);
        svint16_t rB_v3r = psv16_dual_rev16(rB_v3);
        svint16_t O_B0 = svsub_s16_x(svptrue_b16(), rB_v0, rB_v3r);
        svint16_t O_B1 = svsub_s16_x(svptrue_b16(), rB_v1, rB_v2r);
        svint32_t E0_B = psv16_dual_saddl(psv16_dual_vget_lo4(rB_v0),
                                          psv16_dual_vget_lo4(rB_v3r));
        svint32_t E1_B = psv16_dual_saddl(psv16_dual_vget_hi4(rB_v0),
                                          psv16_dual_vget_hi4(rB_v3r));
        svint32_t E2_B = psv16_dual_saddl(psv16_dual_vget_lo4(rB_v1),
                                          psv16_dual_vget_lo4(rB_v2r));
        svint32_t E3_B = psv16_dual_saddl(psv16_dual_vget_hi4(rB_v1),
                                          psv16_dual_vget_hi4(rB_v2r));
        svint32_t EOx_B_lo = svsub_s32_x(svptrue_b32(), E0_B,
                                         psv16_dual_rev32_s32(E3_B));
        svint32_t EOx_B_hi = svsub_s32_x(svptrue_b32(), E1_B,
                                         psv16_dual_rev32_s32(E2_B));
        svint16_t EO_B_s16 = psv16_dual_combine4_s16(
            psv16_dual_vmovn_s32(EOx_B_lo),
            psv16_dual_vmovn_s32(EOx_B_hi));
        svint32_t EE_B0 = svadd_s32_x(svptrue_b32(), E0_B,
                                      psv16_dual_rev32_s32(E3_B));
        svint32_t EE_B1 = svadd_s32_x(svptrue_b32(), E1_B,
                                      psv16_dual_rev32_s32(E2_B));
        svint32_t EEE_B = svadd_s32_x(svptrue_b32(), EE_B0,
                                      psv16_dual_rev32_s32(EE_B1));
        svint32_t EEO_B = svsub_s32_x(svptrue_b32(), EE_B0,
                                      psv16_dual_rev32_s32(EE_B1));
        svint32_t t0_B = svreinterpret_s32_s64(svuzp1_s64(
            svreinterpret_s64_s32(EEE_B), psv_zero_s64()));
        svint32_t z2_B = svreinterpret_s32_s64(svuzp2_s64(
            svreinterpret_s64_s32(EEE_B), psv_zero_s64()));
        svint32_t t1_B = psv16_dual_rev64_s32(z2_B);
        svint32_t EEEE_B = svadd_s32_x(svptrue_b32(), t0_B, t1_B);
        svint32_t EEEO_B = svsub_s32_x(svptrue_b32(), t0_B, t1_B);
"""


_ODD_LOOP = r"""
        for (int k = 1; k < 32; k += 2)
        {
            const svint16_t cA = psv16_dup8_s16(GT32A[k]);
            const svint16_t cB = psv16_dup8_s16(GT32B[k]);
            svint64_t t_A = psv16_sdot(psv_zero_s64(), cA, O_A0);
            t_A = psv16_sdot(t_A, cB, O_A1);
            svint64_t t_B = psv16_sdot(psv_zero_s64(), cA, O_B0);
            t_B = psv16_sdot(t_B, cB, O_B1);
            const svint32_t t01 = psv16_dual_vmovn_s64(t_A);
            const svint32_t t23 = psv16_dual_vmovn_s64(t_B);
            const svint32_t cmb = psv16_combine_g0_s32(t01, t23);
            const svint32_t w = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 32 * k + i, nn);
        }
"""


_K2_LOOP_PASS1 = r"""
        for (int k = 2; k < 32; k += 4)
        {
            // EO pair-form dual: g0 = EO_0 (row i, 8 lanes),
            // g1 = EO_1 (row i+1) -> one 16-lane sdot per pair.
            const svint16_t c = psv16_dup8_s16(GT32A[k]);
            svint64_t t_A = psv16_sdot(psv_zero_s64(), c, EO_A_s16);
            svint64_t t_B = psv16_sdot(psv_zero_s64(), c, EO_B_s16);
            const svint32_t t01 = psv16_dual_vmovn_s64(t_A);
            const svint32_t t23 = psv16_dual_vmovn_s64(t_B);
            const svint32_t cmb = psv16_combine_g0_s32(t01, t23);
            const svint32_t w = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 32 * k + i, nn);
        }
"""


_K2_LOOP_PASS2 = r"""
        for (int k = 2; k < 32; k += 4)
        {
            const svint32_t cA = psv16_dup4_s32(GT32S32A[(k - 2) / 4]);
            const svint32_t cB = psv16_dup4_s32(GT32S32B[(k - 2) / 4]);
            svint32_t m_A = svmul_s32_x(svptrue_b32(), cA, EO_A0);
            m_A = svmla_s32_x(svptrue_b32(), m_A, cB, EO_A1);
            svint32_t m_B = svmul_s32_x(svptrue_b32(), cA, EO_B0);
            m_B = svmla_s32_x(svptrue_b32(), m_B, cB, EO_B1);
            svint32_t s1 = psv16_pairwise_add_s32(m_A, m_B);
            svint32_t w = psv16_pairwise_add_s32(s1, s1);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 32 * k + i, nn);
        }
"""


_K4_LOOP = r"""
        for (int k = 4; k < 32; k += 8)
        {
            const svint32_t c = psv16_dup4_s32(GT32S32A4[(k - 4) / 8]);
            svint32_t m_A = svmul_s32_x(svptrue_b32(), c, EEO_A);
            svint32_t m_B = svmul_s32_x(svptrue_b32(), c, EEO_B);
            svint32_t s1 = psv16_pairwise_add_s32(m_A, m_B);
            svint32_t w = psv16_pairwise_add_s32(s1, s1);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 32 * k + i, nn);
        }
"""


_EVEN_LOOP = r"""
        {
            const svint32_t c = psv16_dup4_s32(T8E[0]);
            svint32_t cmb = psv16_combine_g0_s32(EEEE_A, EEEE_B);
            svint32_t pp = psv16_pairwise_add_s32(cmb, cmb);
            svint32_t m = svmul_s32_x(svptrue_b32(), c, pp);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 32 * 0 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[1]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEEO_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEEO_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 32 * 8 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[2]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEEE_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEEE_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 32 * 16 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[3]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEEO_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEEO_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 32 * 24 + i, nn);
        }
    }
}
"""


def _extract_constants(pure_src: str) -> str:
    start = pure_src.index("static const int16_t GT32A[32][8] = {")
    end_marker = "static const int32_t T8E[4][4]"
    end = pure_src.index(end_marker)
    end = pure_src.index("};", end) + 2
    return pure_src[start:end + 1]


def _pass2_prologue(p1: str) -> str:
    """pass2 keeps s32 per-row EO registers (EO_*0/EO_*1) and drops
    the pass1-only s16 EO combine; it also uses `line` strides."""
    p2 = p1
    p2 = p2.replace("op_pass_4_dual", "op_pass_11_dual")
    p2 = p2.replace("const int shift = 4;", "const int shift = 11;")
    p2 = p2.replace("svint16_t EO_A_s16 = psv16_dual_combine4_s16(\n"
                    "            psv16_dual_vmovn_s32(EOx_A_lo),\n"
                    "            psv16_dual_vmovn_s32(EOx_A_hi));",
                    "svint32_t EO_A0 = EOx_A_lo;\n"
                    "        svint32_t EO_A1 = EOx_A_hi;")
    p2 = p2.replace("svint16_t EO_B_s16 = psv16_dual_combine4_s16(\n"
                    "            psv16_dual_vmovn_s32(EOx_B_lo),\n"
                    "            psv16_dual_vmovn_s32(EOx_B_hi));",
                    "svint32_t EO_B0 = EOx_B_lo;\n"
                    "        svint32_t EO_B1 = EOx_B_hi;")
    p2 = p2.replace("src + (i + 0) * stride", "src + (i + 0) * line")
    p2 = p2.replace("src + (i + 1) * stride", "src + (i + 1) * line")
    p2 = p2.replace("src + (i + 2) * stride", "src + (i + 2) * line")
    p2 = p2.replace("src + (i + 3) * stride", "src + (i + 3) * line")
    p2 = p2.replace(
        "op_pass_11_dual(const int16_t* src, int16_t* dst,\n"
        "                                  intptr_t stride)",
        "op_pass_11_dual(const int16_t* src, int16_t* dst)")
    return p2


def emit_dual_sve(func_name: str = "dynopt_dct32_sve16") -> str:
    from pure_sve_helpers import PURE_SVE_HELPERS
    pure = emit_pure_sve32()
    constants = _extract_constants(pure)
    pass1_body = (_PROLOGUE + _ODD_LOOP + _K2_LOOP_PASS1 + _K4_LOOP
                  + _EVEN_LOOP)
    pass2_body = (_pass2_prologue(_PROLOGUE) + _ODD_LOOP + _K2_LOOP_PASS2
                  + _K4_LOOP + _EVEN_LOOP)
    head = (
        "// Generated by optimizer/ir/dct32_dual_sve_emit.py -- "
        "dual-group 16-lane SVE (VL=256-fixed, zero NEON).\n"
        "#include <arm_sve.h>\n#include <cstdint>\n\n"
        + PURE_SVE_HELPERS + DUAL_HELPERS + "\n" + constants + "\n")
    body = (pass1_body + "\n" + pass2_body + "\n"
            + 'extern "C" void %s(const int16_t* src, int16_t* dst, '
              "intptr_t srcStride)\n{\n"
              "    if (svcntb() != 32) return;\n"
              "    int16_t coef[1024];\n"
              "    op_pass_4_dual(src, coef, srcStride);\n"
              "    op_pass_11_dual(coef, dst);\n}\n" % func_name)
    return head + body


if __name__ == "__main__":
    import os
    out = os.path.abspath(os.path.join(
        os.path.dirname(__file__), "..", "..", "kernels", "dct32",
        "candidates", "best_ir_sve16.cpp"))
    src = emit_dual_sve()
    with open(out, "w") as f:
        f.write(src)
    print("wrote %s (%d bytes)" % (out, len(src)))
