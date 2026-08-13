"""DCT16 OpIR -> ACLE emitter (op-backend first slice).

Consumes only the op DAG from dct16_op_ir (upstream per-row pass1 +
upstream pass2) and emits self-contained ACLE. No grouped C++ block is
imported; the generated source mirrors the grouped shared emitter
(tools/emit_dct16_sve2_shared.py) statement-for-statement so instruction
counts can be aligned before rewrites are ported.

Compile contract: -O2 -fno-tree-pre -march=armv8.2-a+sve2.
"""

from __future__ import annotations

from typing import Dict, List, Optional

from dct16_op_ir import G16, GT16_S32, T8E, lower_pass1_perrow, \
    lower_pass1_quarter, lower_pass2_odd_quarter, \
    lower_pass2_odd_quarter_legacy_even_sve, lower_pass2_upstream
from op_ir import Op


IDX_REV = "static const uint16_t idx_rev[16] =\n" \
          "    { 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 };\n"

IDX_LO = "static const uint16_t idx_lo[16] =\n" \
    "    { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };\n"
IDX_QA = "static const uint16_t idx_qa[16] =\n" \
    "    { 0, 1, 2, 3, 8, 9, 10, 11, 16, 17, 18, 19, 24, 25, 26, 27 };\n"
IDX_QB = "static const uint16_t idx_qb[16] =\n" \
    "    { 4, 5, 6, 7, 12, 13, 14, 15, 20, 21, 22, 23, 28, 29, 30, 31 };\n"

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

static inline svint16_t revh_d(svint16_t x)
{
    svint16_t r;
    asm volatile("revh %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t revw_d32(svint32_t x)
{
    svint32_t r;
    asm volatile("revw %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint64_t revw_d64(svint64_t x)
{
    svint64_t r;
    asm volatile("revw %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t addp_s32(svint32_t a, svint32_t b)
{
    svint32_t r = a;
    asm volatile("addp %[r].s, %[p]/m, %[r].s, %[b].s"
                 : [r] "+w" (r)
                 : [b] "w" (b), [p] "Upl" (svptrue_b32()));
    return r;
}

static inline void st1d_scatter_s16(int16_t* base, svint64_t offs,
                                    svint16_t data)
{
    asm volatile("st1d {%[d].d}, %[p], [%[b], %[o].d]"
                 :
                 : [d] "w" (data), [b] "r" (base), [o] "w" (offs),
                   [p] "Upl" (svptrue_b64())
                 : "memory");
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
    cq_lo = []
    cq_hi = []
    for c in G16:
        cq_lo.append("    { %s }," % ", ".join(str(x) for x in c[:4] * 4))
        cq_hi.append("    { %s }," % ", ".join(str(x) for x in c[4:] * 4))
    return "\n".join([
        _const_table("C8", G16, "int16_t", 8),
        _const_table("GT16", G16, "int16_t", 8),
        _const_table("GT16_S32", GT16_S32, "int32_t", 4),
        _const_table("T8E", T8E, "int32_t", 4),
        "static const int16_t CQ_LO[16][16] = {\n%s\n};" % "\n".join(cq_lo),
        "static const int16_t CQ_HI[16][16] = {\n%s\n};" % "\n".join(cq_hi),
        "static const int32_t T8E8[4][8] = {\n"
        "    { 64, 64, 64, 64, 64, 64, 64, 64 },\n"
        "    { 83, 36, 83, 36, 83, 36, 83, 36 },\n"
        "    { 64, -64, 64, -64, 64, -64, 64, -64 },\n"
        "    { 36, -83, 36, -83, 36, -83, 36, -83 },\n"
        "};",
        "static const int64_t EVEN_OFFS[4] = { 0, 128, 256, 384 };",
    ])


def _emit_pass1(ops: List[Op], legacy: bool = False) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, str] = {}
    by_out = {o.out: o for o in ops}
    used_p8 = False
    used_p4 = False
    rshrn = "svqrshrnb_n_s32" if legacy else "svrshrnb_n_s32"

    for op in ops:
        kind = op.kind
        attrs = op.attrs
        out = _v(op.out)
        ins = [_v(x) for x in op.inputs]
        if kind == "load":
            if attrs["arch"] == "sve-const":
                expr = attrs["const"]
                if expr not in const_cache:
                    nm = "ck_" + out
                    body.append("    const svint16_t %s = "
                                "svld1_s16(p16, %s);" % (nm, expr))
                    ctype[nm] = "svint16_t"
                    const_cache[expr] = nm
                continue
            row = attrs["row"]
            body.append("    svint16_t %s = svld1_s16(p16, src + %d * stride);"
                        % (out, row))
            ctype[out] = "svint16_t"
        elif kind == "permute" and attrs["kind"] == "tbl":
            body.append("    svint16_t %s = svtbl_s16(%s, irv);"
                        % (out, ins[0]))
            ctype[out] = "svint16_t"
        elif kind == "permute" and attrs["kind"] in ("view_s64", "view_s16"):
            body.append("    %s %s = svreinterpret_%s_%s(%s);"
                        % ("svint64_t" if attrs["kind"] == "view_s64"
                           else "svint16_t", out,
                           "s64" if attrs["kind"] == "view_s64" else "s16",
                           "s16" if attrs["kind"] == "view_s64" else "s64",
                           ins[0]))
            ctype[out] = ("svint64_t" if attrs["kind"] == "view_s64"
                          else "svint16_t")
        elif kind == "permute" and attrs["kind"] in ("zip1d", "zip2d"):
            fn = "svzip1_s64" if attrs["kind"] == "zip1d" else "svzip2_s64"
            body.append("    svint64_t %s = %s(%s, %s);"
                        % (out, fn, ins[0], ins[1]))
            ctype[out] = "svint64_t"
        elif kind == "permute" and attrs["kind"] == "revh_d":
            body.append("    svint16_t %s = revh_d(%s);" % (out, ins[0]))
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
        elif kind == "dot_accum":
            body.append("    svint64_t %s = svdot_s64(%s, %s, %s);"
                        % (out, ins[0], ins[1],
                           const_cache[attrs["const_src"]]))
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
        elif kind == "narrow4":
            body.append("    const svint32_t w_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (out, ins[0], ins[0]))
            body.append("    svint16_t %s = %s(w_%s, %d);"
                        % (out, rshrn, out, attrs["shift"]))
            body.append("    %s = svuzp1_s16(%s, %s);" % (out, out, out))
            ctype[out] = "svint16_t"
            used_p4 = True
        elif kind == "narrow8":
            body.append("    const svint32_t w_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (out, ins[0], ins[1]))
            body.append("    svint16_t %s = %s(w_%s, %d);"
                        % (out, rshrn, out, attrs["shift"]))
            body.append("    %s = svuzp1_s16(%s, %s);" % (out, out, out))
            ctype[out] = "svint16_t"
            used_p8 = True
        elif kind == "store":
            lanes = attrs["lanes"]
            k, base = lanes[0][1], lanes[0][2]
            if attrs["arch"] == "sve":
                nl = attrs.get("n_lanes", 8)
                pg = "p16" if nl == 16 else ("p8" if nl == 8 else "p4")
                body.append("    svst1_s16(%s, dst + 16 * %d + %d, %s);"
                            % (pg, k, base, ins[0]))
            else:
                body.append("    vst1_s16(dst + 16 * %d + %d, %s);"
                            % (k, base, ins[0]))
        else:
            raise ValueError("pass1: unsupported op %s (%s)" % (kind, out))
    return body, used_p8, used_p4


def _emit_pass2(ops: List[Op], legacy: bool = False) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, str] = {}
    used_p8 = False
    used_p32 = False
    used_p64 = False
    scatter_loaded = False
    used_idx = set()
    rshrn = "svqrshrnb_n_s32" if legacy else "svrshrnb_n_s32"

    def sv_load_const(op: Op) -> str:
        nonlocal used_p32
        expr = op.attrs["const"]
        if expr in const_cache:
            return const_cache[expr]
        nm = "c_" + _v(op.out)
        if op.attrs["elem"] == "s32":
            body.append("    const svint32_t %s = svld1_s32(p32, %s);"
                        % (nm, expr))
            ctype[nm] = "svint32_t"
            used_p32 = True
        else:
            body.append("    const svint16_t %s = svld1_s16(p16, %s);"
                        % (nm, expr))
            ctype[nm] = "svint16_t"
        const_cache[expr] = nm
        return nm

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
            if attrs["arch"] == "sve-const":
                sv_load_const(op)
                continue
            if attrs["arch"] == "neon-const":
                nm = load_const(op)
                continue
            if attrs["arch"] == "sve":
                row = attrs["row"]
                body.append("    svint16_t %s = svld1_s16(p16, "
                            "src + %d * line);" % (out, row))
                ctype[out] = "svint16_t"
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
            if pk == "rev_sve":
                body.append("    svint16_t %s = svrev_s16(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint16_t"
            elif pk in ("view_s64", "view_s16"):
                body.append("    %s %s = svreinterpret_%s_%s(%s);"
                            % ("svint64_t" if pk == "view_s64"
                               else "svint16_t", out,
                               "s64" if pk == "view_s64" else "s16",
                               "s16" if pk == "view_s64" else "s64",
                               ins[0]))
                ctype[out] = ("svint64_t" if pk == "view_s64"
                              else "svint16_t")
            elif pk in ("zip1d", "zip2d"):
                fn = "svzip1_s64" if pk == "zip1d" else "svzip2_s64"
                body.append("    svint64_t %s = %s(%s, %s);"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "svint64_t"
            elif pk in ("zip1s", "zip2s"):
                fn = "svzip1_s32" if pk == "zip1s" else "svzip2_s32"
                body.append("    svint32_t %s = %s(%s, %s);"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "svint32_t"
            elif pk in ("uzp1s", "uzp2s"):
                fn = "svuzp1_s32" if pk == "uzp1s" else "svuzp2_s32"
                body.append("    svint32_t %s = %s(%s, %s);"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "svint32_t"
            elif pk in ("uzp1d", "uzp2d"):
                fn = "svuzp1_s64" if pk == "uzp1d" else "svuzp2_s64"
                body.append("    svint64_t %s = %s("
                            "svreinterpret_s64_s32(%s), "
                            "svreinterpret_s64_s32(%s));"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "svint64_t"
            elif pk == "uzp1_wide":
                if attrs.get("inputs_s16"):
                    body.append("    svint16_t %s = svuzp1_s16(%s, %s);"
                                % (out, ins[0], ins[1]))
                else:
                    body.append("    svint16_t %s = svuzp1_s16("
                                "svreinterpret_s16_s32(%s), "
                                "svreinterpret_s16_s32(%s));"
                                % (out, ins[0], ins[1]))
                ctype[out] = "svint16_t"
            elif pk == "revw_d32":
                body.append("    svint32_t %s = revw_d32(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint32_t"
            elif pk == "revw_d64":
                body.append("    svint64_t %s = revw_d64(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint64_t"
            elif pk == "revh_d":
                body.append("    svint16_t %s = revh_d(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint16_t"
            elif pk == "tbl2":
                body.append("    svint16_t %s = svtbl2_s16("
                            "svcreate2_s16(%s, %s), %s);"
                            % (out, ins[0], ins[1], attrs["idx"]))
                ctype[out] = "svint16_t"
                used_idx.add(attrs["idx"])
            elif pk == "rev16":
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
        elif kind == "widen_add_sve":
            fn = "svaddlb_s32" if attrs["kind"] == "lb" else "svaddlt_s32"
            body.append("    svint32_t %s = %s(%s, %s);"
                        % (out, fn, ins[0], ins[1]))
            ctype[out] = "svint32_t"
        elif kind == "neon_pack":
            if attrs.get("from") == "s16":
                body.append("    int16x8_t %s = svget_neonq_s16(%s);"
                            % (out, ins[0]))
                ctype[out] = "int16x8_t"
            else:
                body.append("    int64x2_t %s = svget_neonq_s64(%s);"
                            % (out, ins[0]))
                ctype[out] = "int64x2_t"
        elif kind in ("add", "sub"):
            elem = attrs["elem"]
            if attrs.get("arch") == "sve":
                if elem == "s16":
                    fn = ("svadd_s16_x" if kind == "add"
                          else "svsub_s16_x")
                    body.append("    svint16_t %s = %s(p16, %s, %s);"
                                % (out, fn, ins[0], ins[1]))
                    ctype[out] = "svint16_t"
                else:
                    fn = ("svadd_s32_x" if kind == "add"
                          else "svsub_s32_x")
                    a0, a1 = ins[0], ins[1]
                    if attrs.get("view") == "s64":
                        a0 = "svreinterpret_s32_s64(%s)" % a0
                        a1 = "svreinterpret_s32_s64(%s)" % a1
                    body.append("    svint32_t %s = %s(p32, %s, %s);"
                                % (out, fn, a0, a1))
                    ctype[out] = "svint32_t"
                    used_p32 = True
            else:
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
            if attrs["arch"] == "sve":
                ck = const_cache[attrs["const_src"]]
                body.append("    svint64_t %s = svdot_s64(zero64, %s, %s);"
                            % (out, ins[0], ck))
                ctype[out] = "svint64_t"
            else:
                ck = const_cache[attrs["const_src"]]
                body.append("    int64x2_t %s = sdotq_s16("
                            "vdupq_n_s64(0), %s, %s);"
                            % (out, ck, ins[0]))
                ctype[out] = "int64x2_t"
        elif kind == "dot_accum":
            ck = const_cache[attrs["const_src"]]
            body.append("    svint64_t %s = svdot_s64(%s, %s, %s);"
                        % (out, ins[0], ins[1], ck))
            ctype[out] = "svint64_t"
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
        elif kind == "mul":
            ck = const_cache[attrs["const_src"]]
            body.append("    svint32_t %s = svmul_s32_x(p32, %s, %s);"
                        % (out, ins[0], ck))
            ctype[out] = "svint32_t"
            used_p32 = True
        elif kind == "addp32":
            body.append("    svint32_t %s = addp_s32(%s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "svint32_t"
        elif kind == "narrow4_sve":
            body.append("    svint16_t %s = %s(%s, %d);"
                        % (out, rshrn, ins[0], attrs["shift"]))
            ctype[out] = "svint16_t"
        elif kind == "narrow8":
            body.append("    const svint32_t w_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));" % (out, ins[0], ins[1]))
            body.append("    svint16_t %s = %s(w_%s, %d);"
                        % (out, rshrn, out, attrs["shift"]))
            body.append("    %s = svuzp1_s16(%s, %s);" % (out, out, out))
            ctype[out] = "svint16_t"
            used_p8 = True
        elif kind == "narrow16":
            body.append("    const svint32_t w01_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (out, ins[0], ins[1]))
            body.append("    const svint32_t w23_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (out, ins[2], ins[3]))
            body.append("    const svint16_t nb_%s = "
                        "%s(w01_%s, %d);" % (out, rshrn, out,
                                             attrs["shift"]))
            body.append("    const svint16_t nt_%s = "
                        "%s(w23_%s, %d);" % (out, rshrn, out,
                                             attrs["shift"]))
            body.append("    svint16_t %s = svuzp1_s16(nb_%s, nt_%s);"
                        % (out, out, out))
            ctype[out] = "svint16_t"
        elif kind == "store":
            lanes = attrs["lanes"]
            k, base = lanes[0][1], lanes[0][2]
            if attrs["arch"] == "sve-scatter":
                if not scatter_loaded:
                    body.append("    const svint64_t evoffs = "
                                "svld1_s64(p64, EVEN_OFFS);")
                    scatter_loaded = True
                    used_p64 = True
                body.append("    st1d_scatter_s16(dst + %d, evoffs, %s);"
                            % (base, ins[0]))
            elif attrs["arch"] == "sve":
                pg = "p16" if attrs.get("n_lanes", 8) == 16 else "p8"
                body.append("    svst1_s16(%s, dst + 16 * %d + %d, %s);"
                            % (pg, k, base, ins[0]))
            else:
                body.append("    vst1_s16(dst + 16 * %d + %d, %s);"
                            % (k, base, ins[0]))
        else:
            raise ValueError("pass2: unsupported op %s (%s)" % (kind, out))
    return body, used_p8, used_p32, used_p64, used_idx


def emit_acle(func_name: str = "dynopt_dct16_sve2_shared",
              pass1: str = "per-row", pass1_k_tile: int = 4,
              pass1_pack_zip: bool = True, pass1_even_factor: bool = True,
              pass2: str = "upstream", pass2_k_tile: int = 1,
              pass2_pack_zip: bool = True,
              store_merge16: bool = True,
              legacy: bool = False, even_sve: bool = False) -> str:
    if pass1 == "quarter":
        ops = lower_pass1_quarter(k_tile=pass1_k_tile,
                                  pack_zip=pass1_pack_zip,
                                  even_factor=pass1_even_factor,
                                  narrow_merge=True)
    else:
        ops = lower_pass1_perrow()
    if pass2 == "odd-quarter" and legacy and even_sve:
        ops += lower_pass2_odd_quarter_legacy_even_sve(
            k_tile=pass2_k_tile, store_merge16=store_merge16)
    elif pass2 == "odd-quarter":
        ops += lower_pass2_odd_quarter(pack_zip=pass2_pack_zip,
                                       store_merge16=store_merge16,
                                       k_tile=pass2_k_tile)
    else:
        ops += lower_pass2_upstream()
    return emit_ops(ops, func_name)


def emit_ops(ops, func_name: str = "dynopt_dct16_sve2_shared",
             legacy: bool = False) -> str:
    """Emit ACLE from an already-built op list (rewrites applied)."""
    b1, p1_p8, p1_p4 = _emit_pass1(
        [o for o in ops if o.tile_id.startswith("p1.")], legacy=legacy)
    b2, used_p8, used_p32, used_p64, used_idx = _emit_pass2(
        [o for o in ops if o.tile_id.startswith("p2.")], legacy=legacy)
    need_irv = any(o.kind == "permute" and o.attrs.get("idx") == "rev16"
                   for o in ops if o.tile_id.startswith("p1."))
    prologue1 = "    const svbool_t p16 = svptrue_b16();\n" \
                "    const svint64_t zero64 = svdup_n_s64(0);\n"
    if need_irv:
        prologue1 += "    const svuint16_t irv = svld1_u16(p16, idx_rev);\n"
    if p1_p8:
        prologue1 += "    const svbool_t p8 = svwhilelt_b16(0, 8);\n"
    if p1_p4:
        prologue1 += "    const svbool_t p4 = svwhilelt_b16(0, 4);\n"
    pass1 = "static __attribute__((noinline)) void op_pass_4(" \
            "const int16_t* src, int16_t* dst, intptr_t stride)\n{\n" \
            "%s%s\n}" % (prologue1, "\n".join(b1))
    prologue2 = "    const int line = 16;\n" \
                "    const svbool_t p16 = svptrue_b16();\n" \
                "    const svint64_t zero64 = svdup_n_s64(0);\n"
    if used_p8:
        prologue2 += "    const svbool_t p8 = svwhilelt_b16(0, 8);\n"
    if used_p32:
        prologue2 += "    const svbool_t p32 = svptrue_b32();\n"
    if used_p64:
        prologue2 += "    const svbool_t p64 = svptrue_b64();\n"
    for idx in ("iloq", "q0q", "q1q"):
        if idx in used_idx:
            prologue2 += "    const svuint16_t %s = svld1_u16(p16, %s);\n" \
                % (idx, {"iloq": "idx_lo", "q0q": "idx_qa",
                         "q1q": "idx_qb"}[idx])
    pass2_fn = "static __attribute__((noinline)) void op_pass_11(" \
               "const int16_t* src, int16_t* dst)\n{\n%s%s\n}" \
               % (prologue2, "\n".join(b2))
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
""" % (IDX_REV, REV16_TBL, REV32_TBL, IDX_LO, IDX_QA, IDX_QB,
       HELPERS, _const_decls(), pass1, pass2_fn, func_name)


def emit_from_combo(combo=None,
                    func_name: str = "dynopt_dct16_sve2_shared",
                    rewrites: Optional[List[str]] = None) -> str:
    """Manifest-combo entry point with optional op rewrite sequence."""
    ops = _build_ops(combo, func_name)
    if rewrites:
        from dct16_rewrites import apply_rewrites  # noqa: E402
        ops = apply_rewrites(ops, rewrites)
    return emit_ops(ops, func_name,
                    legacy=bool((combo or {}).get("legacy_semantics", 0)))


def _build_ops(combo, func_name: str = "dynopt_dct16_sve2_shared"):
    """Rebuild the op DAG for a combo (shared by emit_from_combo)."""
    from dct16_op_ir import lower_pass1_perrow, lower_pass1_quarter, \
        lower_pass2_odd_quarter, lower_pass2_odd_quarter_legacy_even_sve, \
        lower_pass2_upstream  # noqa: E402
    combo = combo or {}
    pass1 = combo.get("pass1", "per-row")
    if pass1 not in ("per-row", "quarter"):
        pass1 = "per-row"
    pass2 = combo.get("pass2", "upstream")
    if pass2 not in ("upstream", "odd-quarter"):
        pass2 = "upstream"
    ops = []
    if pass1 == "quarter":
        ops += lower_pass1_quarter(
            k_tile=int(combo.get("pass1_k_tile", 4)),
            pack_zip=bool(combo.get("pass1_pack_zip", 1)),
            even_factor=bool(combo.get("pass1_even_factor", 1)),
            narrow_merge=True)
    else:
        ops += lower_pass1_perrow()
    legacy = bool(combo.get("legacy_semantics", 0))
    even_sve = bool(combo.get("even_sve", 0))
    if pass2 == "odd-quarter" and legacy and even_sve:
        ops += lower_pass2_odd_quarter_legacy_even_sve(
            k_tile=int(combo.get("pass2_k_tile", 1)),
            store_merge16=bool(combo.get("store_merge16", 1)))
    elif pass2 == "odd-quarter":
        ops += lower_pass2_odd_quarter(
            pack_zip=bool(combo.get("pass2_pack_zip", 1)),
            store_merge16=bool(combo.get("store_merge16", 1)),
            k_tile=int(combo.get("pass2_k_tile", 1)))
    else:
        ops += lower_pass2_upstream()
    return ops
