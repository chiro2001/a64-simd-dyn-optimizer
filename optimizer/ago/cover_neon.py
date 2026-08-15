"""NEON cover for AGO M0: graph -> C intrinsic source (round-0023).

The cover maps AGO IR op nodes to NEON instruction templates. For the
SA8D 8x8 vertical slice the upstream helper functions
(common/aarch64/pixel-prim.h) are used so the upstream NEON sequence is
exactly selectable; later milestones can add alternative covers.

Semantic authority stays the contract + C reference; this cover is one
target implementation among several.
"""

from __future__ import annotations

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))

from ago.ir import Graph  # noqa: E402


NEON_HELPERS = r"""\
/* AGO NEON helper library (M0): upstream x265 pixel-prim.h/cpp helpers
 * inlined so the generated source is self-contained. DEPTH=8 variants. */
static inline void sumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                               const int16x8_t a, const int16x8_t b)
{
    *sum = vaddq_s16(a, b);
    *sub = vsubq_s16(a, b);
}
static inline void abssumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                                  const int16x8_t a, const int16x8_t b)
{
    *sum = vabsq_s16(vaddq_s16(a, b));
    *sub = vabdq_s16(a, b);
}
static inline void transpose_s16_s16x2(int16x8_t *t1, int16x8_t *t2,
                                       const int16x8_t s1, const int16x8_t s2)
{
    *t1 = vtrn1q_s16(s1, s2);
    *t2 = vtrn2q_s16(s1, s2);
}
static inline void transpose_s16_s32x2(int16x8_t *t1, int16x8_t *t2,
                                       const int16x8_t s1, const int16x8_t s2)
{
    int32x4_t tmp1 = vreinterpretq_s32_s16(s1);
    int32x4_t tmp2 = vreinterpretq_s32_s16(s2);
    *t1 = vreinterpretq_s16_s32(vtrn1q_s32(tmp1, tmp2));
    *t2 = vreinterpretq_s16_s32(vtrn2q_s32(tmp1, tmp2));
}
static inline void transpose_s16_s64x2(int16x8_t *t1, int16x8_t *t2,
                                       const int16x8_t s1, const int16x8_t s2)
{
    int64x2_t tmp1 = vreinterpretq_s64_s16(s1);
    int64x2_t tmp2 = vreinterpretq_s64_s16(s2);
    *t1 = vreinterpretq_s16_s64(vtrn1q_s64(tmp1, tmp2));
    *t2 = vreinterpretq_s16_s64(vtrn2q_s64(tmp1, tmp2));
}
static inline void hadamard_4_v(const int16x8_t in_coefs[4],
                                int16x8_t out_coefs[4])
{
    int16x8_t s0, s1, d0, d1;
    sumsubq_s16(&s0, &d0, in_coefs[0], in_coefs[1]);
    sumsubq_s16(&s1, &d1, in_coefs[2], in_coefs[3]);
    sumsubq_s16(&out_coefs[0], &out_coefs[2], s0, s1);
    sumsubq_s16(&out_coefs[1], &out_coefs[3], d0, d1);
}
static inline void hadamard_8_v(const int16x8_t in_coefs[8],
                                int16x8_t out_coefs[8])
{
    int16x8_t temp[8];
    hadamard_4_v(in_coefs, temp);
    hadamard_4_v(in_coefs + 4, temp + 4);
    sumsubq_s16(&out_coefs[0], &out_coefs[4], temp[0], temp[4]);
    sumsubq_s16(&out_coefs[1], &out_coefs[5], temp[1], temp[5]);
    sumsubq_s16(&out_coefs[2], &out_coefs[6], temp[2], temp[6]);
    sumsubq_s16(&out_coefs[3], &out_coefs[7], temp[3], temp[7]);
}
static inline void hadamard_4_h(const int16x8_t in_coefs[4],
                                int16x8_t out_coefs[4])
{
    int16x8_t s0, s1, d0, d1, t0, t1, t2, t3;
    transpose_s16_s16x2(&t0, &t1, in_coefs[0], in_coefs[1]);
    transpose_s16_s16x2(&t2, &t3, in_coefs[2], in_coefs[3]);
    sumsubq_s16(&s0, &d0, t0, t1);
    sumsubq_s16(&s1, &d1, t2, t3);
    transpose_s16_s32x2(&out_coefs[0], &out_coefs[1], s0, s1);
    transpose_s16_s32x2(&out_coefs[2], &out_coefs[3], d0, d1);
}
static inline int hadamard_4x4(int16x8_t a0, int16x8_t a1)
{
    int16x8_t sum, dif, t0, t1;
    sumsubq_s16(&sum, &dif, a0, a1);
    transpose_s16_s64x2(&t0, &t1, sum, dif);
    sumsubq_s16(&sum, &dif, t0, t1);
    transpose_s16_s16x2(&t0, &t1, sum, dif);
    abssumsubq_s16(&sum, &dif, t0, t1);
    transpose_s16_s32x2(&t0, &t1, sum, dif);
    uint16x8_t max = vmaxq_u16(vreinterpretq_u16_s16(t0),
                               vreinterpretq_u16_s16(t1));
    return vaddlvq_u16(max);
}
static inline void hadamard_abs_4_h(const int16x8_t in_coefs[4],
                                    int16x8_t out_coefs[4])
{
    int16x8_t s0, s1, d0, d1, t0, t1, t2, t3;
    transpose_s16_s16x2(&t0, &t1, in_coefs[0], in_coefs[1]);
    transpose_s16_s16x2(&t2, &t3, in_coefs[2], in_coefs[3]);
    abssumsubq_s16(&s0, &d0, t0, t1);
    abssumsubq_s16(&s1, &d1, t2, t3);
    transpose_s16_s32x2(&out_coefs[0], &out_coefs[1], s0, s1);
    transpose_s16_s32x2(&out_coefs[2], &out_coefs[3], d0, d1);
}
static inline void hadamard_4x4_quad(int16x8_t diff[8],
                                     uint16x8_t out[2])
{
    int16x8_t temp[8];
    hadamard_4_v(diff, temp);
    hadamard_4_v(diff + 4, temp + 4);
    hadamard_abs_4_h(temp, diff);
    hadamard_abs_4_h(temp + 4, diff + 4);
    uint16x8_t sum0 = vmaxq_u16(vreinterpretq_u16_s16(diff[0]),
                                vreinterpretq_u16_s16(diff[1]));
    uint16x8_t sum1 = vmaxq_u16(vreinterpretq_u16_s16(diff[2]),
                                vreinterpretq_u16_s16(diff[3]));
    uint16x8_t sum2 = vmaxq_u16(vreinterpretq_u16_s16(diff[4]),
                                vreinterpretq_u16_s16(diff[5]));
    uint16x8_t sum3 = vmaxq_u16(vreinterpretq_u16_s16(diff[6]),
                                vreinterpretq_u16_s16(diff[7]));
    out[0] = vaddq_u16(sum0, sum1);
    out[1] = vaddq_u16(sum2, sum3);
}
static inline void hadamard_8_h(int16x8_t coefs[8], uint16x8_t out[4])
{
    int16x8_t s0, s1, s2, s3, d0, d1, d2, d3;
    int16x8_t temp[8];
    hadamard_4_h(coefs, temp);
    hadamard_4_h(coefs + 4, temp + 4);
    abssumsubq_s16(&s0, &d0, temp[0], temp[1]);
    abssumsubq_s16(&s1, &d1, temp[2], temp[3]);
    abssumsubq_s16(&s2, &d2, temp[4], temp[5]);
    abssumsubq_s16(&s3, &d3, temp[6], temp[7]);
    transpose_s16_s64x2(&temp[0], &temp[1], s0, s2);
    transpose_s16_s64x2(&temp[2], &temp[3], s1, s3);
    transpose_s16_s64x2(&temp[4], &temp[5], d0, d2);
    transpose_s16_s64x2(&temp[6], &temp[7], d1, d3);
    out[0] = vmaxq_u16(vreinterpretq_u16_s16(temp[0]),
                       vreinterpretq_u16_s16(temp[1]));
    out[1] = vmaxq_u16(vreinterpretq_u16_s16(temp[2]),
                       vreinterpretq_u16_s16(temp[3]));
    out[2] = vmaxq_u16(vreinterpretq_u16_s16(temp[4]),
                       vreinterpretq_u16_s16(temp[5]));
    out[3] = vmaxq_u16(vreinterpretq_u16_s16(temp[6]),
                       vreinterpretq_u16_s16(temp[7]));
}
"""


def _op_outs(g: Graph, kind: str):
    return [n for n, op in sorted(g.ops.items()) if op.kind == kind]


def _build_sa8d8_source(g: Graph, func: str) -> str:
    rows = g.meta.get("rows", 8)
    diff_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "sub_ext"))]
    v_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "hadamard_v"))]
    h_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "hadamard_h_abs"))]
    assert len(diff_outs) == rows and len(v_outs) == rows and len(h_outs) == 4

    L = [
        "// Generated by optimizer/ago/cover_neon.py -- do not edit.",
        "#include <arm_neon.h>",
        "#include <stdint.h>",
        NEON_HELPERS,
        "",
        'extern "C" int %s(const uint8_t* pix1, intptr_t stride1,' % func,
        "                    const uint8_t* pix2, intptr_t stride2)",
        "{",
    ]
    # load + diff per row into an explicit array (upstream
    # load_diff_u8x8x8 shape); explicit arrays are required because the
    # helpers take array pointers (compound-literal outputs would not
    # write back).
    L.append("    int16x8_t d[%d];" % rows)
    for i, d in enumerate(diff_outs):
        L.append(
            "    d[%d] = vreinterpretq_s16_u16(vsubl_u8("
            "vld1_u8(pix1 + %d * stride1), vld1_u8(pix2 + %d * stride2)));"
            % (i, i, i))
    # vertical 8-point hadamard
    L.append("    int16x8_t t[%d];" % rows)
    L.append("    hadamard_8_v(d, t);")
    # horizontal 8-point hadamard with abs sums
    L.append("    uint16x8_t s[4];")
    L.append("    hadamard_8_h(t, s);")
    # o0 = s0+s1, o1 = s2+s3, acc = o0+o1, satd = (vaddlvq(acc)+1)>>1
    L.append("    uint16x8_t o0 = vaddq_u16(s[0], s[1]);")
    L.append("    uint16x8_t o1 = vaddq_u16(s[2], s[3]);")
    L.append("    uint16x8_t accv = vaddq_u16(o0, o1);")
    L.append("    return (int)((vaddlvq_u16(accv) + 1) >> 1);")
    L.append("}")
    return "\n".join(L) + "\n"


def _build_satd8_source(g: Graph, func: str) -> str:
    """Map the satd8 8x8 graph to the upstream NEON instruction dataflow
    (load_diff_u8x8x8 -> hadamard_4x4_quad -> vaddq -> vaddlvq).
    """
    rows = g.meta.get("rows", 8)
    diff_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "sub_ext"))]
    v_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "hadamard_v"))]
    h_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "hadamard_h_abs"))]
    max_outs = [g.ops[n].out for n in sorted(
        (n for n, op in g.ops.items() if op.kind == "max"))]
    n_add = sum(1 for op in g.ops.values() if op.kind == "add")
    n_red = sum(1 for op in g.ops.values() if op.kind == "reduce_addv")
    assert len(diff_outs) == rows and len(v_outs) == rows
    assert len(h_outs) == rows and len(max_outs) == 4
    assert n_add == 3 and n_red == 1

    L = [
        "// Generated by optimizer/ago/cover_neon.py -- do not edit.",
        "#include <arm_neon.h>",
        "#include <stdint.h>",
        NEON_HELPERS,
        "",
        'extern "C" int %s(const uint8_t* pix1, intptr_t stride1,' % func,
        "                    const uint8_t* pix2, intptr_t stride2)",
        "{",
    ]
    L.append("    int16x8_t d[%d];" % rows)
    for i, d in enumerate(diff_outs):
        L.append(
            "    d[%d] = vreinterpretq_s16_u16(vsubl_u8("
            "vld1_u8(pix1 + %d * stride1), vld1_u8(pix2 + %d * stride2)));"
            % (i, i, i))
    # two 4-point vertical Hadamard quadrants (rows 0-3, rows 4-7)
    L.append("    int16x8_t t[%d];" % rows)
    L.append("    hadamard_4_v(d, t);")
    L.append("    hadamard_4_v(d + 4, t + 4);")
    # horizontal 4-point Hadamard with abs per quadrant (reuses d as scratch)
    L.append("    hadamard_abs_4_h(t, d);")
    L.append("    hadamard_abs_4_h(t + 4, d + 4);")
    # max-pair dedup + pair sums (upstream hadamard_4x4_quad tail)
    L.append("    uint16x8_t sum0 = vmaxq_u16(vreinterpretq_u16_s16(d[0]), "
             "vreinterpretq_u16_s16(d[1]));")
    L.append("    uint16x8_t sum1 = vmaxq_u16(vreinterpretq_u16_s16(d[2]), "
             "vreinterpretq_u16_s16(d[3]));")
    L.append("    uint16x8_t sum2 = vmaxq_u16(vreinterpretq_u16_s16(d[4]), "
             "vreinterpretq_u16_s16(d[5]));")
    L.append("    uint16x8_t sum3 = vmaxq_u16(vreinterpretq_u16_s16(d[6]), "
             "vreinterpretq_u16_s16(d[7]));")
    L.append("    uint16x8_t o0 = vaddq_u16(sum0, sum1);")
    L.append("    uint16x8_t o1 = vaddq_u16(sum2, sum3);")
    L.append("    uint16x8_t accv = vaddq_u16(o0, o1);")
    L.append("    return (int)vaddlvq_u16(accv);")
    L.append("}")
    return "\n".join(L) + "\n"


def build_c_source(g: Graph, func: str = "") -> str:
    if not func:
        func = "dynopt_ago_%s" % g.name
    if g.name == "sa8d8":
        return _build_sa8d8_source(g, func)
    if g.name == "satd8":
        return _build_satd8_source(g, func)
    raise ValueError("no cover for graph %r" % g.name)
