"""DCT32 OpIR -> ACLE emitter (round-0013 E1-B first codegen slice).

Consumes only the typed op DAG from dct32_op_ir and data tables
(cpp_constants / index arrays). It never imports the grouped C++ blocks,
so a candidate produced here is backend-independent by construction.
"""

from __future__ import annotations

import os
import sys
from typing import Dict, List

from dct32_op_ir import Op, lower_plan_to_ops
from layout_ir import Plan

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
TOOLS = os.path.join(ROOT, "tools")
if TOOLS not in sys.path:
    sys.path.insert(0, TOOLS)
from emit_dct32_sve2_shared import cpp_constants  # noqa: E402


IDX_DEFS = """\
static const uint32_t IDX_REV4S[8] =
    { 3, 2, 1, 0, 7, 6, 5, 4 };
static const uint16_t IDX_REV8[16] =
    { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 };
static const uint16_t IDX_04[16] =
    { 0, 1, 2, 3, 16, 17, 18, 19, 0, 1, 2, 3, 16, 17, 18, 19 };
static const uint16_t IDX_47[16] =
    { 4, 5, 6, 7, 20, 21, 22, 23, 4, 5, 6, 7, 20, 21, 22, 23 };
static const uint16_t IDX_8B[16] =
    { 8, 9, 10, 11, 24, 25, 26, 27, 8, 9, 10, 11, 24, 25, 26, 27 };
static const uint16_t IDX_CF[16] =
    { 12, 13, 14, 15, 28, 29, 30, 31, 12, 13, 14, 15, 28, 29, 30, 31 };
static const uint16_t IDX_LO8[16] =
    { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
static const uint32_t IDX_S8[8] = { 0, 1, 2, 3, 8, 9, 10, 11 };
static const uint16_t IDX_EVEN16[16] =
    { 0, 2, 4, 6, 8, 10, 12, 14,
      16, 18, 20, 22, 24, 26, 28, 30 };
"""

HELPERS32 = """\
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
"""

K0EVEN_CPP = """\
static const int32_t K0EVEN[4][8] = {
    { 64, 64, 64, 64, 64, 64, 64, 64 },   // k=0
    { 83, 36, 83, 36, 83, 36, 83, 36 },   // k=8
    { 64, -64, 64, -64, 64, -64, 64, -64 }, // k=16
    { 36, -83, 36, -83, 36, -83, 36, -83 }, // k=24
};
"""


def _ctype(elem: str) -> str:
    return {"s16": "svint16_t", "s32": "svint32_t",
            "s64": "svint64_t"}[elem]


def _row_from_tile(tile_id: str) -> int:
    return int(tile_id.rsplit("row", 1)[1])


def _k_from_tile(tile_id: str) -> int:
    return int(tile_id.split(".")[2][1:])


def _emit_pass(ops: List[Op], add_value: int, row_group: int = 4) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, List[str]] = {}
    fused: Dict[str, str] = {}
    fuse_ids = set()

    def v(name: str) -> str:
        return name.replace(".", "_")

    def pg_for(elem: str) -> str:
        return {"s16": "p16", "s32": "p8s", "s64": "p64"}[elem]

    # The op DAG is per-4-row-group; emit one group body inside a loop.
    ops0 = [o for o in ops if o.attrs.get("g", 0) == 0]
    by_out = {o.out: o for o in ops0}
    # Prepass: fuse scalar mul_reduce -> round_shift -> store into one
    # expression so the compiler does not spill scalar temps.
    for op in ops0:
        if op.kind != "store":
            continue
        rnd = by_out.get(op.inputs[0]) if op.inputs else None
        if not rnd or rnd.kind != "round_shift":
            continue
        mul = by_out.get(rnd.inputs[0]) if rnd.inputs else None
        if not mul or mul.kind != "mul_reduce" or \
                mul.attrs.get("reduce") not in ("saddv", "scalar2"):
            continue
        fuse_ids.add(rnd.op_id)
        fuse_ids.add(mul.op_id)
        fused[op.op_id] = mul.out
    for op in ops0:
        if op.kind != "store" and op.op_id in fuse_ids:
            continue
        kind = op.kind
        attrs = op.attrs
        pass_id = int(op.tile_id.split(".")[0][1:])
        out = "%s_p%d" % (v(op.out), pass_id)
        ins = ["%s_p%d" % (v(x), pass_id) for x in op.inputs]
        if kind == "load":
            row = _row_from_tile(op.tile_id)
            base = "src"
            stride = "stride" if pass_id == 1 else "32"
            body.append("    svint16_t %s = svld1_s16(p16, "
                        "%s + (g * %d + %d) * %s%s);"
                        % (out, base, row_group, row, stride,
                           " + 16" if "+16" in attrs["index"] else ""))
            ctype[out] = "svint16_t"
        elif kind == "rev":
            elem = attrs["elem"]
            fn = "svrev_s16" if elem == "s16" else "svrev_s32"
            body.append("    %s %s = %s(%s);" % (_ctype(elem), out, fn, ins[0]))
            ctype[out] = _ctype(elem)
        elif kind == "unpk":
            fn = "svunpklo_s32" if attrs["which"] == "lo" else "svunpkhi_s32"
            body.append("    svint32_t %s = %s(%s);" % (out, fn, ins[0]))
            ctype[out] = "svint32_t"
        elif kind in ("add", "sub"):
            elem = attrs["elem"]
            pg = pg_for(elem)
            fn = ("svadd_%s_x" if kind == "add" else "svsub_%s_x") % elem
            a0, a1 = ins[0], ins[1]
            if elem == "s32" and attrs.get("view") == "s64":
                a0 = "svreinterpret_s32_s64(%s)" % a0
                a1 = "svreinterpret_s32_s64(%s)" % a1
            body.append("    %s %s = %s(%s, %s, %s);"
                        % (_ctype(elem), out, fn, pg, a0, a1))
            ctype[out] = _ctype(elem)
        elif kind == "widen_add_sve":
            fn = "svaddlb_s32" if attrs["kind"] == "lb" else "svaddlt_s32"
            body.append("    svint32_t %s = %s(%s, %s);"
                        % (out, fn, ins[0], ins[1]))
            ctype[out] = "svint32_t"
        elif kind == "permute":
            pk = attrs["kind"]
            if pk in ("zip1d64", "zip2d64"):
                fn = "svzip1_s64" if pk == "zip1d64" else "svzip2_s64"
                body.append("    svint64_t %s = %s(%s, %s);"
                            % (out, fn, ins[0], ins[1]))
                ctype[out] = "svint64_t"
            elif pk in ("zip1d", "zip2d", "trn1d", "trn2d"):
                fn = {"zip1d": "svzip1_s64", "zip2d": "svzip2_s64",
                      "trn1d": "svtrn1_s64", "trn2d": "svtrn2_s64"}[
                          pk]
                body.append("    svint16_t %s = svreinterpret_s16_s64("
                            "%s(svreinterpret_s64_s16(%s), "
                            "svreinterpret_s64_s16(%s)));"
                            % (out, fn, ins[0], ins[1]))
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
            elif pk == "tbl2s":
                body.append("    svint32_t %s = svtbl2_s32("
                            "svcreate2_s32(%s, %s), idx8);"
                            % (out, ins[0], ins[1]))
                ctype[out] = "svint32_t"
            elif pk == "revh_d":
                body.append("    svint16_t %s = revh_d(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint16_t"
            elif pk == "revw_d32":
                body.append("    svint32_t %s = revw_d32(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint32_t"
            elif pk == "revw_d64":
                body.append("    svint64_t %s = revw_d64(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint64_t"
            elif pk == "rev16":
                body.append("    svint16_t %s = svrev_s16(%s);"
                            % (out, ins[0]))
                ctype[out] = "svint16_t"
            elif pk == "tbl":
                if attrs.get("idx") == "rev8":
                    body.append("    svint16_t %s = svtbl_s16(%s, rev8);"
                                % (out, ins[0]))
                    ctype[out] = "svint16_t"
                elif attrs.get("idx") == "rev4":
                    body.append("    svint16_t %s = svtbl_s16(%s, rev4);"
                                % (out, ins[0]))
                    ctype[out] = "svint16_t"
                else:
                    body.append("    svint32_t %s = svtbl_s32(%s, rev4s);"
                                % (out, ins[0]))
                    ctype[out] = "svint32_t"
            else:
                body.append("    svint16_t %s = svtbl2_s16("
                            "svcreate2_s16(%s, %s), %s);"
                            % (out, ins[0], ins[1], attrs["idx"]))
                ctype[out] = "svint16_t"
        elif kind == "dot_segment":
            tid = op.tile_id
            ckey = tid
            if ckey not in const_cache:
                k = _k_from_tile(tid)
                names = []
                nconst = attrs.get("nconst", 4 if k % 2 == 1 else 2)
                if "K4S" in attrs.get("const_src", ""):
                    table = "K4S"
                    tidx = k // 8
                elif k % 2 == 1:
                    table = "CODD"
                    tidx = k // 2
                else:
                    table = "K2S"
                    tidx = k // 4
                for m in range(nconst):
                    nm = "c_%s_%d" % (tid.replace(".", "_"), m)
                    if table == "K4S":
                        body.append("    svint16_t %s = svld1_s16(p16, "
                                    "K4S[%d]);" % (nm, tidx))
                    else:
                        body.append("    svint16_t %s = svld1_s16(p16, "
                                    "%s[%d][%d]);" % (nm, table, tidx, m))
                    names.append(nm)
                const_cache[ckey] = names
            m = attrs.get("slice", 0)
            body.append("    svint64_t %s = svdot_s64(zero64, %s, %s);"
                        % (out, ins[0], const_cache[ckey][m]))
            ctype[out] = "svint64_t"
        elif kind == "accumulate":
            body.append("    svint64_t %s = svadd_s64_x(p64, %s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "svint64_t"
        elif kind == "mul_reduce":
            k = _k_from_tile(op.tile_id)
            if attrs["reduce"] == "saddv":
                tmp = out + "_t"
                if k % 4 == 2:
                    cexpr = "svld1_s32(p8s, K2[%d])" % (k // 4)
                    redpg = "p8s"
                else:
                    cexpr = "svld1_s32(pg4s, K4[%d])" % (k // 8)
                    redpg = "pg4s"
                body.append("    svint32_t %s = svmul_s32_x(p8s, %s, %s);"
                            % (tmp, ins[0], cexpr))
                body.append("    int64_t %s = svaddv_s32(%s, %s);"
                            % (out, redpg, tmp))
            elif attrs["reduce"] == "scalar2":
                idx = k // 8
                body.append("    int64_t %s = (int64_t)K0[%d][0] * %s + "
                            "(int64_t)K0[%d][1] * %s_1;"
                            % (out, idx, ins[0], idx, ins[0]))
            ctype[out] = "int64_t"
        elif kind == "extract2":
            body.append("    int32_t %s = svlastb_s32(pg1s, %s);"
                        % (out, ins[0]))
            body.append("    int32_t %s_1 = svlastb_s32(pg2s, %s);"
                        % (out, ins[0]))
            ctype[out] = "int32"
        elif kind == "mul":
            cexpr = attrs["const_src"]
            if cexpr not in const_cache:
                nm = "c_%s" % out
                body.append("    const svint32_t %s = svld1_s32(p8s, %s);"
                            % (nm, cexpr))
                const_cache[cexpr] = nm
            body.append("    svint32_t %s = svmul_s32_x(p8s, %s, %s);"
                        % (out, ins[0], const_cache[cexpr]))
            ctype[out] = "svint32_t"
        elif kind == "addp32":
            body.append("    svint32_t %s = addp_s32(%s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "svint32_t"
        elif kind == "narrow4_sve":
            body.append("    svint16_t %s = svrshrnb_n_s32(%s, %d);"
                        % (out, ins[0], attrs["shift"]))
            ctype[out] = "svint16_t"
        elif kind == "round_shift":
            if ctype.get(ins[0]) == "svint64_t":
                body.append("    svint16_t %s = svrshrnb_n_s32("
                            "svuzp1_s32(svreinterpret_s32_s64(%s), "
                            "svreinterpret_s32_s64(%s)), %d);"
                            % (out, ins[0], ins[0], attrs["shift"]))
                ctype[out] = "svint16_t"
            else:
                body.append("    int64_t %s = (%s + add) >> %d;"
                            % (out, ins[0], attrs["shift"]))
                ctype[out] = "int64_t"
        elif kind == "narrow":
            body.append("    svint16_t %s = svuzp1_s16(%s, %s);"
                        % (out, ins[0], ins[0]))
            ctype[out] = "svint16_t"
        elif kind == "narrow8":
            # even/odd row banks + rshrnb results in even h16 lanes:
            # trn1 interleaves the even lanes -> row order [0..7].
            body.append("    svint16_t %s = svtrn1_s16(%s, %s);"
                        % (out, ins[0], ins[1]))
            ctype[out] = "svint16_t"
        elif kind == "narrow8_merged":
            # contiguous 4-row banks: uzp1 the two s64 accs' low s32
            # halves -> 8 rows in order -> one rshrnb (even h16 lanes)
            # -> uzp1_s16 compression -> 8 contiguous lanes.
            body.append("    const svint32_t w_%s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (out, ins[0], ins[1]))
            body.append("    const svint16_t nr_%s = "
                        "svrshrnb_n_s32(w_%s, %d);"
                        % (out, out, attrs["shift"]))
            body.append("    svint16_t %s = svuzp1_s16(nr_%s, nr_%s);"
                        % (out, out, out))
            ctype[out] = "svint16_t"
        elif kind == "narrow16_merged":
            # 4 contiguous 4-row banks: uzp1_s32 each pair -> 8 rows each;
            # one rshrnb per pair (results in even h16 lanes) -> tbl2_s16
            # concatenates the even lanes of both halves -> 16 contiguous.
            w0 = "w_%s" % out
            w1 = "w2_%s" % out
            n0 = "nr_%s" % out
            n1 = "nr2_%s" % out
            body.append("    const svint32_t %s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (w0, ins[0], ins[1]))
            body.append("    const svint32_t %s = svuzp1_s32("
                        "svreinterpret_s32_s64(%s), "
                        "svreinterpret_s32_s64(%s));"
                        % (w1, ins[2], ins[3]))
            body.append("    const svint16_t %s = svrshrnb_n_s32(%s, %d);"
                        % (n0, w0, attrs["shift"]))
            body.append("    const svint16_t %s = svrshrnb_n_s32(%s, %d);"
                        % (n1, w1, attrs["shift"]))
            body.append("    svint16_t %s = svtbl2_s16("
                        "svcreate2_s16(%s, %s), idx_even16);"
                        % (out, n0, n1))
            ctype[out] = "svint16_t"
        elif kind == "store":
            lanes = attrs["lanes"]
            pass_id, k, row = lanes[0]
            if op.op_id in fused:
                mul = by_out[fused[op.op_id]]
                rnd = by_out[op.inputs[0]]
                km = _k_from_tile(mul.tile_id)
                mulin = "%s_p%d" % (mul.inputs[0].replace(".", "_"),
                                    pass_id)
                if mul.attrs["reduce"] == "saddv":
                    if km % 4 == 2:
                        cexpr = "svld1_s32(p8s, K2[%d])" % (km // 4)
                        redpg = "p8s"
                    else:
                        cexpr = "svld1_s32(pg4s, K4[%d])" % (km // 8)
                        redpg = "pg4s"
                    expr = "svaddv_s32(%s, svmul_s32_x(p8s, %s, %s))" \
                        % (redpg, mulin, cexpr)
                else:
                    idx = km // 8
                    expr = "((int64_t)K0[%d][0] * %s + " \
                           "(int64_t)K0[%d][1] * %s_1)" \
                        % (idx, mulin, idx, mulin)
                rloc = row % row_group
                body.append("    dst[%d * 32 + g * %d + %d] = (int16_t)"
                            "((%s + add) >> %d);"
                            % (k, row_group, rloc, expr, rnd.attrs["shift"]))
                continue
            if ctype.get(ins[0]) == "svint16_t" and len(lanes) > 1:
                pg = {"16": "pg16h", "8": "pg8h", "4": "pg4h"}[
                    str(len(lanes))]
                body.append("    svst1_s16(%s, dst + %d * 32 + g * %d + %d,"
                            " %s);"
                            % (pg, k, row_group, attrs.get("base_off", 0),
                               ins[0]))
            else:
                rloc = row % row_group
                body.append("    dst[%d * 32 + g * %d + %d] = (int16_t)%s;"
                            % (k, row_group, rloc, ins[0]))
    body.insert(0, "    add = %d;" % add_value)
    body.insert(1, "    for (int g = 0; g < %d; g++)"
                % (32 // row_group))
    body.insert(2, "    {")
    body.append("    }")
    return body


def emit_acle(plan: Plan, ops: List[Op],
              func_name: str = "dynopt_dct32_opbackend") -> str:
    # Derive the group loop from the op DAG: max g -> n_groups, so an
    # op-level rewrite can re-tag g (e.g. merge_narrow8) without any
    # plan flag. Both passes share the same g range.
    max_g = max((int(o.attrs.get("g", 0)) for o in ops), default=7)
    n_groups = max_g + 1
    row_group = 32 // n_groups
    pass1 = [o for o in ops if o.tile_id.startswith("p1.")]
    pass2 = [o for o in ops if o.tile_id.startswith("p2.")]
    b1 = _emit_pass(pass1, 8, row_group)
    b2 = _emit_pass(pass2, 1024, row_group)
    prologue = """\
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svbool_t p64 = svptrue_b64();
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svbool_t pg4h = svwhilelt_b16(0, 4);
    const svbool_t pg2s = svwhilelt_b32(0, 2);
    const svbool_t pg1s = svwhilelt_b32(0, 1);
    const svint64_t zero64 = svdup_n_s64(0);
    int add;
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);
    const svuint16_t i0 = svld1_u16(p16, IDX_04);
    const svuint16_t i1 = svld1_u16(p16, IDX_47);
    const svuint16_t i2 = svld1_u16(p16, IDX_8B);
    const svuint16_t i3 = svld1_u16(p16, IDX_CF);
    const svuint16_t ilo = svld1_u16(p16, IDX_LO8);
"""
    if row_group == 8:
        prologue += "    const svbool_t pg8h = svwhilelt_b16(0, 8);\n"
    if row_group == 16:
        prologue += "    const svbool_t pg16h = svptrue_b16();\n"
    if any(o.kind == "narrow16_merged" for o in ops):
        prologue += ("    const svuint16_t idx_even16 = "
                     "svld1_u16(p16, IDX_EVEN16);\n")
    if any(o.kind == "permute" and o.attrs.get("kind") == "tbl2s"
           for o in ops):
        prologue += "    const svuint32_t idx8 = svld1_u32(p8s, IDX_S8);\n"
    if any(o.kind == "permute" and o.attrs.get("idx") == "rev8"
           for o in ops):
        prologue += "    const svuint16_t rev8 = svld1_u16(p16, IDX_REV8);\n"
    pass4 = "static __attribute__((noinline)) void op_pass_4("\
            "const int16_t* src, int16_t* dst, intptr_t stride)\n{\n%s\n%s\n}"\
            % (prologue, "\n".join(b1))
    pass11 = "static __attribute__((noinline)) void op_pass_11("\
             "const int16_t* src, int16_t* dst, intptr_t stride)\n{\n%s\n%s\n}"\
             % (prologue, "\n".join(b2))
    return """\
// Generated by optimizer/ir/dct32_op_emit.py -- do not edit by hand.
// OpIR backend slice (no grouped C++ blocks).
#include <arm_sve.h>
#include <cstdint>

%s
%s
%s
%s
%s
%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t stride)
{
    int16_t coef[32 * 32];
    op_pass_4(src, coef, stride);
    op_pass_11(coef, dst, 32);
}
""" % (IDX_DEFS, HELPERS32, cpp_constants(), K0EVEN_CPP,
       pass4, pass11, func_name)


def emit_from_plan(plan: Plan, func_name: str = "dynopt_dct32_opbackend") -> str:
    ops = lower_plan_to_ops(plan)
    rewrites = plan.lowering.get("rewrites") or []
    if rewrites:
        from dct32_rewrites import apply_rewrites  # noqa: E402
        ops = apply_rewrites(ops, rewrites)
    return emit_acle(plan, ops, func_name)
