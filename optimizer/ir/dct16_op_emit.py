"""DCT16 OpIR -> ACLE emitter (op-backend first slice).

Consumes only the op DAG from dct16_op_ir (upstream per-row pass1 +
upstream pass2) and emits self-contained ACLE. No grouped C++ block is
imported; the generated source mirrors the grouped shared emitter
(tools/emit_dct16_sve2_shared.py) statement-for-statement so instruction
counts can be aligned before rewrites are ported.

Compile contract: -O2 -fno-tree-pre -march=armv8.2-a+sve2.
"""

from __future__ import annotations

from typing import Dict, List

from dct16_op_ir import G16, GT16_S32, T8E, lower_pass1_perrow, \
    lower_pass2_upstream
from op_ir import Op


IDX_REV = "static const uint16_t idx_rev[16] =\n" \
          "    { 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };\n"

REV16_TBL = "static const uint8_t rev16_tbl[16] =\n" \
    "    { 14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1 };\n"
REV32_TBL = "static const uint8_t rev32_tbl[16] =\n" \
    "    { 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 };\n"

HELPERS = """\
static inline int16x8_t rev16(const int16x8_t a)
{
    return vreinterpretq_s16_s8(vqtbx1q_s8(
        vreinterpretq_s8_s16(a), vreinterpretq_s8_s16(a),
        vld1q_u8(rev16_tbl)));
}

static inline int32x4_t rev32(const int32x4_t a)
{
    return vreinterpretq_s32_s8(vqtbx1q_s8(
        vreinterpretq_s8_s32(a), vreinterpretq_s8_s32(a),
        vld1q_u8(rev32_tbl)));
}

static inline int64x2_t sdotq_s16(int64x2_t acc, int16x8_t x, int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(
        svset_neonq_s64(svundef_s64(), acc),
        svset_neonq_s16(svundef_s16(), x),
        svset_neonq_s16(svundef_s16(), y)));
}
"""


def _const_table(name: str, rows: List[List[int]], ctype: str,
                 width: int) -> str:
    body = "\n".join(
        "    { %s }," % ", ".join(str(x) for x in r) for r in rows)
    return "static const %s %s[%d][%d] = {\n%s\n};\n" \
        % (ctype, name, len(rows), width, body)


def _v(name: str) -> str:
    return name.replace(".", "_")


def _const_decls() -> str:
    return "\n".join([
        _const_table("C8", G16, "int16_t", 8),
        _const_table("GT16", G16, "int16_t", 8),
        _const_table("GT16_S32", GT16_S32, "int32_t", 4),
        _const_table("T8E", T8E, "int32_t", 4),
    ])


def _emit_pass1(ops: List[Op]) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, str] = {}
    by_out = {o.out: o for o in ops}

    def emit_load_const(op: Op, expr: str) -> str:
        if expr in const_cache:
            return const_cache[expr]
        nm = "ck_" + _v(op.out)
        if op.attrs["elem"] == "s32":
            body.append("    const int32x4_t %s = vld1q_s32(%s);"
                        % (nm, expr))
            ctype[nm] = "int32x4_t"
        else:
            body.append("    const int16x8_t %s = vld1q_s16(%s);"
                        % (nm, expr))
            ctype[nm] = "int16x8_t"
        const_cache[expr] = nm
        return nm

    for op in ops:
        kind = op.kind
        attrs = op.attrs
        out = _v(op.out)
        ins = [_v(x) for x in op.inputs]
        if kind == "load":
            row = attrs["row"]
            body.append("    svint16_t %s = svld1_s16(p16, src + %d * stride);"
                        % (out, row))
            ctype[out] = "svint16_t"
        elif kind == "permute" and attrs["kind"] == "tbl":
            body.append("    svint16_t %s = svtbl_s16(%s, irv);"
                        % (out, ins[0]))
            ctype[out] = "svint16_t"
        elif kind in ("add", "sub"):
            fn = ("svadd_s16_x" if kind == "add" else "svsub_s16_x")
            body.append("    svint16_t %s = %s(p16, %s, %s);"
                        % (out, fn, ins[0], ins[1]))
            ctype[out] = "svint16_t"
        elif kind == "dot_segment":
            cexpr = attrs["const_src"]      # "C8[k]"
            if cexpr not in const_cache:
                nm = "ck_" + out
                body.append("    const svint16_t %s = svld1_s16(p16, %s);"
                            % (nm, cexpr))
                ctype[nm] = "svint16_t"
                const_cache[cexpr] = nm
            body.append("    svint64_t %s = svdot_s64(zero64, %s, %s);"
                        % (out, ins[0], const_cache[cexpr]))
            ctype[out] = "svint64_t"
        elif kind == "neon_pack":
            body.append("    int64x2_t %s = svget_neonq_s64(%s);"
                        % (out, ins[0]))
            ctype[out] = "int64x2_t"
        elif kind == "neon_reduce_narrow":
            nm = "_%s" % out
            body.append("    const int32x4_t t01%s = vcombine_s32("
                        "vmovn_s64(%s), vmovn_s64(%s));"
                        % (nm, ins[0], ins[1]))
            body.append("    const int32x4_t t23%s = vcombine_s32("
                        "vmovn_s64(%s), vmovn_s64(%s));"
                        % (nm, ins[2], ins[3]))
            body.append("    const int32x4_t w%s = vpaddq_s32(t01%s, t23%s);"
                        % (nm, nm, nm))
            body.append("    int16x4_t %s = vrshrn_n_s32(w%s, %d);"
                        % (out, nm, attrs["shift"]))
            ctype[out] = "int16x4_t"
        elif kind == "store":
            lanes = attrs["lanes"]
            k, base = lanes[0][1], lanes[0][2]
            body.append("    vst1_s16(dst + 16 * %d + %d, %s);"
                        % (k, base, ins[0]))
        else:
            raise ValueError("pass1: unsupported op %s (%s)" % (kind, out))
    return body


def _emit_pass2(ops: List[Op]) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, str] = {}

    def load_const(op: Op) -> str:
        expr = op.attrs["const"]
        if expr in const_cache:
            return const_cache[expr]
        nm = "c_" + _v(op.out)
        if op.attrs["elem"] == "s32":
            body.append("    const int32x4_t %s = vld1q_s32(%s);"
                        % (nm, expr))
            ctype[nm] = "int32x4_t"
        else:
            body.append("    const int16x8_t %s = vld1q_s16(%s);"
                        % (nm, expr))
            ctype[nm] = "int16x8_t"
        const_cache[expr] = nm
        return nm

    for op in ops:
        kind = op.kind
        attrs = op.attrs
        out = _v(op.out)
        ins = [_v(x) for x in op.inputs]
        if kind == "load":
            if attrs["arch"] == "neon-const":
                nm = load_const(op)
                continue
            row = attrs["row"]
            if attrs["half"] == "lo":
                body.append("    const int16x8_t %s = vld1q_s16("
                            "src + %d * line);" % (out, row))
            else:
                body.append("    const int16x8_t %s = vld1q_s16("
                            "src + %d * line + 8);" % (out, row))
            ctype[out] = "int16x8_t"
        elif kind == "permute":
            pk = attrs["kind"]
            if pk == "rev16":
                body.append("    int16x8_t %s = rev16(%s);" % (out, ins[0]))
                ctype[out] = "int16x8_t"
            elif pk == "rev32":
                body.append("    int32x4_t %s = rev32(%s);" % (out, ins[0]))
                ctype[out] = "int32x4_t"
            elif pk in ("zip1q", "zip2q"):
                fn = "vzip1q_s64" if pk == "zip1q" else "vzip2q_s64"
                body.append("    int32x4_t %s = vreinterpretq_s32_s64("
                            "%s(vreinterpretq_s64_s32(%s), "
                            "vreinterpretq_s64_s32(%s)));"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "int32x4_t"
            elif pk == "rev64q":
                body.append("    int32x4_t %s = vrev64q_s32(%s);"
                            % (out, ins[0]))
                ctype[out] = "int32x4_t"
            else:
                raise ValueError("pass2 permute %s" % pk)
        elif kind == "vget":
            fn = "vget_low_s16" if attrs["which"] == "lo" \
                else "vget_high_s16"
            body.append("    int16x4_t %s = %s(%s);" % (out, fn, ins[0]))
            ctype[out] = "int16x4_t"
        elif kind == "widen_add":
            body.append("    int32x4_t %s = vaddl_s16(%s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "int32x4_t"
        elif kind in ("add", "sub"):
            elem = attrs["elem"]
            if elem == "s16":
                fn = "vaddq_s16" if kind == "add" else "vsubq_s16"
                ct = "int16x8_t"
            else:
                fn = "vaddq_s32" if kind == "add" else "vsubq_s32"
                ct = "int32x4_t"
            body.append("    %s %s = %s(%s, %s);" % (ct, out, fn,
                                                     ins[0], ins[1]))
            ctype[out] = ct
        elif kind == "dot_segment":
            ck = const_cache[attrs["const_src"]]
            body.append("    int64x2_t %s = sdotq_s16(vdupq_n_s64(0), %s, %s);"
                        % (out, ck, ins[0]))
            ctype[out] = "int64x2_t"
        elif kind == "neon_reduce_narrow":
            nm = "_%s" % out
            body.append("    const int32x4_t t01%s = vcombine_s32("
                        "vmovn_s64(%s), vmovn_s64(%s));"
                        % (nm, ins[0], ins[1]))
            body.append("    const int32x4_t t23%s = vcombine_s32("
                        "vmovn_s64(%s), vmovn_s64(%s));"
                        % (nm, ins[2], ins[3]))
            body.append("    const int32x4_t w%s = vpaddq_s32(t01%s, t23%s);"
                        % (nm, nm, nm))
            body.append("    int16x4_t %s = vrshrn_n_s32(w%s, %d);"
                        % (out, nm, attrs["shift"]))
            ctype[out] = "int16x4_t"
        elif kind == "neon_mul":
            ck = const_cache[attrs["const_src"]]
            body.append("    int32x4_t %s = vmulq_s32(%s, %s);"
                        % (out, ck, ins[0]))
            ctype[out] = "int32x4_t"
        elif kind == "neon_padd":
            body.append("    int32x4_t %s = vpaddq_s32(%s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "int32x4_t"
        elif kind == "neon_narrow":
            body.append("    int16x4_t %s = vrshrn_n_s32(%s, %d);"
                        % (out, ins[0], attrs["shift"]))
            ctype[out] = "int16x4_t"
        elif kind == "store":
            lanes = attrs["lanes"]
            k, base = lanes[0][1], lanes[0][2]
            body.append("    vst1_s16(dst + 16 * %d + %d, %s);"
                        % (k, base, ins[0]))
        else:
            raise ValueError("pass2: unsupported op %s (%s)" % (kind, out))
    return body


def emit_acle(func_name: str = "dynopt_dct16_sve2_shared") -> str:
    ops = lower_pass1_perrow() + lower_pass2_upstream()
    b1 = _emit_pass1([o for o in ops if o.tile_id.startswith("p1.")])
    b2 = _emit_pass2([o for o in ops if o.tile_id.startswith("p2.")])
    pass1 = "static __attribute__((noinline)) void op_pass_4(" \
            "const int16_t* src, int16_t* dst, intptr_t stride)\n{\n" \
            "    const svbool_t p16 = svptrue_b16();\n" \
            "    const svuint16_t irv = svld1_u16(p16, idx_rev);\n" \
            "    const svint64_t zero64 = svdup_n_s64(0);\n" \
            "%s\n}" % "\n".join(b1)
    pass2 = "static __attribute__((noinline)) void op_pass_11(" \
            "const int16_t* src, int16_t* dst)\n{\n" \
            "    const int line = 16;\n" \
            "%s\n}" % "\n".join(b2)
    return """\
// Generated by optimizer/ir/dct16_op_emit.py -- do not edit by hand.
// OpIR backend slice (no grouped C++ blocks).
#include <arm_sve.h>
#include <arm_neon.h>
#include <arm_neon_sve_bridge.h>
#include <cstdint>

%s
%s
%s

%s
%s

%s
%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    int16_t coef[256];
    op_pass_4(src, coef, srcStride);
    op_pass_11(coef, dst);
}

extern "C" void dynopt_dct16_op_pass1(
    const int16_t* src, int16_t* dst, intptr_t srcStride)
{
    op_pass_4(src, dst, srcStride);
}

extern "C" void dynopt_dct16_op_pass2(
    const int16_t* src, int16_t* dst)
{
    op_pass_11(src, dst);
}
""" % (IDX_REV, REV16_TBL, REV32_TBL, HELPERS, _const_decls(),
       pass1, pass2, func_name)


def emit_from_combo(combo=None,
                    func_name: str = "dynopt_dct16_sve2_shared") -> str:
    """Manifest-combo entry point. The op backend currently lowers the
    upstream per-row pass1 + upstream pass2 for every combo (legacy and
    odd-quarter axes are the next slice); identical sources dedupe in the
    search driver."""
    return emit_acle(func_name)
