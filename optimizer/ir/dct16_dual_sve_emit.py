"""dct16 dual-group 16-lane SVE emitter (VL=256 fixed).

The fused8 DAG is lowered to a "packed dual-group" SVE form (docs/72):
one 16-lane SVE register carries two independent 8-lane groups
(lanes 0-7 / 8-15), and every operation acts on both groups at once.
Rows i..i+3 of a dct16 pass are processed as two dual registers
(rows i/i+1 and rows i+2/i+3); the three output loops then reconstruct
the four per-row results in s16 lanes 0-3 and store them with the
existing 8-lane store helper.

Correctness gate: 20k QEMU VL=256 diff against the 8-lane pure-SVE
dct16 (guard removed) and against the neon8 fused8 candidate;
zero-NEON object check via check_isa_level.py --no-neon.
"""

from __future__ import annotations

from dct16_pure_sve_emit import emit_pure_sve


DUAL_HELPERS = r"""
// --- dual-group helper additions for the VL=256 emitter (docs/72) ---
// Safe 8-lane dual load: loads exactly 8 lanes from a and b (no
// full-VL over-read), packs group0 = a[0..7], group1 = b[0..7].
static inline svint16_t psv16_dual_load8_safe(const int16_t* a,
                                               const int16_t* b)
{
    svint16_t la = psv_load8(a);
    svint16_t lb = psv_load8(b);
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(la),
                                   svreinterpret_u16_s16(lb));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

// Duplicate one 8-lane constant row into both groups (g0 = g1 = row).
static inline svint16_t psv16_dup8_s16(const int16_t* p)
{
    svint16_t v = psv_load8(p);
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 4, 5, 6, 7, 0, 1, 2, 3, 4, 5, 6, 7 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    return svreinterpret_s16_u16(
        svtbl_u16(svreinterpret_u16_s16(v), i));
}

// Duplicate one 4-lane s32 constant row into both groups.
static inline svint32_t psv16_dup4_s32(const int32_t* p)
{
    svint32_t v = psv_load4_s32(p);
    static const uint32_t idx[8] = { 0, 1, 2, 3, 0, 1, 2, 3 };
    svuint32_t i = svld1_u32(svptrue_b32(), idx);
    return svreinterpret_s32_u32(
        svtbl_u32(svreinterpret_u32_s32(v), i));
}

// Pack two pair-form s16 dual registers into one quad-form register:
// a = [r0(0-3), pad, r1(8-11), pad], b = [r2(0-3), pad, r3(8-11), pad]
// -> lanes [r0, r1, r2, r3] at 0-3/4-7/8-11/12-15.
static inline svint16_t psv16_quad_pack_s16(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

// Raw pairwise-add helper: uzp1(a,b)+uzp2(a,b) with NO lane
// permutation (the dual_addp4 helper permutes; this one keeps the
// natural [g0 partials, g1 partials] order).
static inline svint32_t psv16_pairwise_add_s32(svint32_t a, svint32_t b)
{
    return svadd_s32_x(svptrue_b32(), svuzp1_s32(a, b),
                       svuzp2_s32(a, b));
}

// Cross-pack the g0 (lanes 0-3) of two dual s32 registers into one
// 8-lane s32 register: out = [a.g0, b.g0].  The 8-lane pairwise-add
// pattern (uzp1/uzp2 + add) is only layout-correct when both groups'
// values are contiguous in one register, so this pack must precede it.
static inline svint32_t psv16_combine_g0_s32(svint32_t a, svint32_t b)
{
    static const uint32_t idx[8] = { 0, 1, 2, 3, 8, 9, 10, 11 };
    svuint32_t i = svld1_u32(svptrue_b32(), idx);
    svuint32x2_t t = svcreate2_u32(svreinterpret_u32_s32(a),
                                   svreinterpret_u32_s32(b));
    return svreinterpret_s32_u32(svtbl2_u32(t, i));
}
"""


_PROLOGUE = r"""
static inline void op_pass_4_dual(const int16_t* src, int16_t* dst,
                                  intptr_t stride)
{
    const int line = 16;
    const int shift = 3;
    for (int i = 0; i < line; i += 4)
    {
        // Pair A: rows i+0, i+1; pair B: rows i+2, i+3.
        const svint16_t sA_lo = psv16_dual_load8_safe(
            src + (i + 0) * stride, src + (i + 1) * stride);
        const svint16_t sA_hi_raw = psv16_dual_load8_safe(
            src + (i + 0) * stride + 8, src + (i + 1) * stride + 8);
        svint16_t sA_hi = psv16_dual_rev16(sA_hi_raw);
        svint16_t O_A = svsub_s16_x(svptrue_b16(), sA_lo, sA_hi);
        svint16_t g0_A_a = psv16_dual_vget_lo4(sA_lo);
        svint16_t g0_A_c = psv16_dual_vget_lo4(sA_hi);
        svint32_t E0_A = psv16_dual_saddl(g0_A_a, g0_A_c);
        svint16_t g1_A_a = psv16_dual_vget_hi4(sA_lo);
        svint16_t g1_A_c = psv16_dual_vget_hi4(sA_hi);
        svint32_t E1_A = psv16_dual_saddl(g1_A_a, g1_A_c);
        svint32_t EO_A = svsub_s32_x(svptrue_b32(), E0_A,
                                     psv16_dual_rev32_s32(E1_A));
        svint16_t EO_A_s16 = psv16_dual_vmovn_s32(EO_A);

        const svint16_t sB_lo = psv16_dual_load8_safe(
            src + (i + 2) * stride, src + (i + 3) * stride);
        const svint16_t sB_hi_raw = psv16_dual_load8_safe(
            src + (i + 2) * stride + 8, src + (i + 3) * stride + 8);
        svint16_t sB_hi = psv16_dual_rev16(sB_hi_raw);
        svint16_t O_B = svsub_s16_x(svptrue_b16(), sB_lo, sB_hi);
        svint16_t g0_B_a = psv16_dual_vget_lo4(sB_lo);
        svint16_t g0_B_c = psv16_dual_vget_lo4(sB_hi);
        svint32_t E0_B = psv16_dual_saddl(g0_B_a, g0_B_c);
        svint16_t g1_B_a = psv16_dual_vget_hi4(sB_lo);
        svint16_t g1_B_c = psv16_dual_vget_hi4(sB_hi);
        svint32_t E1_B = psv16_dual_saddl(g1_B_a, g1_B_c);
        svint32_t EO_B = svsub_s32_x(svptrue_b32(), E0_B,
                                     psv16_dual_rev32_s32(E1_B));
        svint16_t EO_B_s16 = psv16_dual_vmovn_s32(EO_B);

        // Quad-form EO for the k = 2 mod 4 sdot loop:
        // lanes [r0, r1, r2, r3] at 0-3/4-7/8-11/12-15.
        svint16_t EO_quad = psv16_quad_pack_s16(EO_A_s16, EO_B_s16);

        // Even-even/even-odd values per row pair (g1 = 0 by
        // construction, mirroring the 8-lane per-pair 4-lane values).
        svint32_t EE_A = svadd_s32_x(svptrue_b32(), E0_A,
                                     psv16_dual_rev32_s32(E1_A));
        svint32_t t0_A = svreinterpret_s32_s64(svuzp1_s64(
            svreinterpret_s64_s32(EE_A), psv_zero_s64()));
        svint32_t z2_A = svreinterpret_s32_s64(svuzp2_s64(
            svreinterpret_s64_s32(EE_A), psv_zero_s64()));
        svint32_t t1_A = psv16_dual_rev64_s32(z2_A);
        svint32_t EEE_A = svadd_s32_x(svptrue_b32(), t0_A, t1_A);
        svint32_t EEO_A = svsub_s32_x(svptrue_b32(), t0_A, t1_A);

        svint32_t EE_B = svadd_s32_x(svptrue_b32(), E0_B,
                                     psv16_dual_rev32_s32(E1_B));
        svint32_t t0_B = svreinterpret_s32_s64(svuzp1_s64(
            svreinterpret_s64_s32(EE_B), psv_zero_s64()));
        svint32_t z2_B = svreinterpret_s32_s64(svuzp2_s64(
            svreinterpret_s64_s32(EE_B), psv_zero_s64()));
        svint32_t t1_B = psv16_dual_rev64_s32(z2_B);
        svint32_t EEE_B = svadd_s32_x(svptrue_b32(), t0_B, t1_B);
        svint32_t EEO_B = svsub_s32_x(svptrue_b32(), t0_B, t1_B);
"""


_ODD_LOOP = r"""
        for (int k = 1; k < 16; k += 2)
        {
            const svint16_t c = psv16_dup8_s16(GT16[k]);
            svint64_t t_A = psv16_sdot(psv_zero_s64(), c, O_A);
            svint64_t t_B = psv16_sdot(psv_zero_s64(), c, O_B);
            const svint32_t t01 = psv16_dual_vmovn_s64(t_A);
            const svint32_t t23 = psv16_dual_vmovn_s64(t_B);
            const svint32_t cmb = psv16_combine_g0_s32(t01, t23);
            const svint32_t w = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 16 * k + i, nn);
        }
"""


_PASS4_K2_LOOP = r"""
        for (int k = 2; k < 16; k += 4)
        {
            const svint16_t c = psv16_dup8_s16(T8ODD16[(k - 2) / 4]);
            svint64_t t = psv16_sdot(psv_zero_s64(), c, EO_quad);
            const svint32_t w = psv16_dual_vmovn_s64(t);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 16 * k + i, nn);
        }
"""


_PASS11_K2_LOOP = r"""
        for (int k = 2; k < 16; k += 4)
        {
            const svint32_t c = psv16_dup4_s32(GT16_S32[(k - 2) / 4]);
            svint32_t m_A = svmul_s32_x(svptrue_b32(), c, EO_A);
            svint32_t m_B = svmul_s32_x(svptrue_b32(), c, EO_B);
            // Stage 1: per-row partials (g0 = rows 0/1, g1 = rows 2/3).
            svint32_t s1 = psv16_pairwise_add_s32(m_A, m_B);
            // Stage 2: per-row totals -> lanes 0-3.
            svint32_t w = psv16_pairwise_add_s32(s1, s1);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(w);
            psv_store4_s16(dst + 16 * k + i, nn);
        }
"""


_EVEN_LOOP = r"""
        {
            const svint32_t c = psv16_dup4_s32(T8E[0]);
            svint32_t cmb = psv16_combine_g0_s32(EEE_A, EEE_B);
            svint32_t pp = psv16_pairwise_add_s32(cmb, cmb);
            svint32_t m = svmul_s32_x(svptrue_b32(), c, pp);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 16 * 0 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[1]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEO_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEO_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 16 * 4 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[2]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEE_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEE_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 16 * 8 + i, nn);
        }
        {
            const svint32_t c = psv16_dup4_s32(T8E[3]);
            svint32_t m0 = svmul_s32_x(svptrue_b32(), c, EEO_A);
            svint32_t m1 = svmul_s32_x(svptrue_b32(), c, EEO_B);
            svint32_t cmb = psv16_combine_g0_s32(m0, m1);
            svint32_t m = psv16_pairwise_add_s32(cmb, cmb);
            svint16_t nn = psv16_dual_rshrn_s32<shift>(m);
            psv_store4_s16(dst + 16 * 12 + i, nn);
        }
    }
}
"""


def _extract_constants(pure_src: str) -> str:
    start = pure_src.index("static const int16_t C8[16][8] = {")
    end_marker = "static const int64_t EVEN_OFFS"
    end = pure_src.index(end_marker)
    end = pure_src.index("};", end) + 2
    return pure_src[start:end + 1]


def emit_dual_sve(func_name: str = "dynopt_dct16_sve16") -> str:
    from pure_sve_helpers import PURE_SVE_HELPERS
    pure = emit_pure_sve()
    constants = _extract_constants(pure)
    pass11_body = (_PROLOGUE + _ODD_LOOP + _PASS11_K2_LOOP + _EVEN_LOOP)
    pass11_body = pass11_body.replace(
        "op_pass_4_dual", "op_pass_11_dual")
    pass11_body = pass11_body.replace(
        "op_pass_11_dual(const int16_t* src, int16_t* dst,\n"
        "                                  intptr_t stride)",
        "op_pass_11_dual(const int16_t* src, int16_t* dst)")
    pass11_body = pass11_body.replace(
        "const int shift = 3;", "const int shift = 10;")
    # pass11 keeps the s32 per-row EO pair registers (no s16 combine,
    # no quad form): drop the dead pair/quad s16 values.
    for dead in ("        svint16_t EO_A_s16 = psv16_dual_vmovn_s32(EO_A);\n",
                 "        svint16_t EO_B_s16 = psv16_dual_vmovn_s32(EO_B);\n",
                 "        svint16_t EO_quad = psv16_quad_pack_s16(EO_A_s16, "
                 "EO_B_s16);\n"):
        pass11_body = pass11_body.replace(dead, "")
    pass11_body = pass11_body.replace(
        "src + (i + 0) * stride", "src + (i + 0) * line")
    pass11_body = pass11_body.replace(
        "src + (i + 1) * stride", "src + (i + 1) * line")
    pass11_body = pass11_body.replace(
        "src + (i + 2) * stride", "src + (i + 2) * line")
    pass11_body = pass11_body.replace(
        "src + (i + 3) * stride", "src + (i + 3) * line")
    pass4_body = _PROLOGUE + _ODD_LOOP + _PASS4_K2_LOOP + _EVEN_LOOP
    head = (
        "// Generated by optimizer/ir/dct16_dual_sve_emit.py -- "
        "dual-group 16-lane SVE (VL=256-fixed, zero NEON).\n"
        "#include <arm_sve.h>\n#include <cstdint>\n\n"
        + PURE_SVE_HELPERS + DUAL_HELPERS + "\n" + constants + "\n")
    body = (pass4_body + "\n" + pass11_body + "\n"
            + 'extern "C" void %s(const int16_t* src, int16_t* dst, '
              "intptr_t srcStride)\n{\n"
              "    if (svcntb() != 32) return;\n"
              "    int16_t coef[256];\n"
              "    op_pass_4_dual(src, coef, srcStride);\n"
              "    op_pass_11_dual(coef, dst);\n}\n" % func_name)
    return head + body


if __name__ == "__main__":
    import sys
    import os
    out = os.path.join(os.path.dirname(__file__), "..", "..", "kernels",
                       "dct16", "candidates", "best_ir_sve16.cpp")
    out = os.path.abspath(out)
    src = emit_dual_sve()
    with open(out, "w") as f:
        f.write(src)
    print("wrote %s (%d bytes)" % (out, len(src)))
