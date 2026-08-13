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
"""


def _ctype(elem: str) -> str:
    return {"s16": "svint16_t", "s32": "svint32_t",
            "s64": "svint64_t"}[elem]


def _row_from_tile(tile_id: str) -> int:
    return int(tile_id.rsplit("row", 1)[1])


def _k_from_tile(tile_id: str) -> int:
    return int(tile_id.split(".")[2][1:])


def _emit_pass(ops: List[Op], add_value: int) -> List[str]:
    body: List[str] = []
    ctype: Dict[str, str] = {}
    const_cache: Dict[str, List[str]] = {}

    def v(name: str) -> str:
        return name.replace(".", "_")

    def pg_for(elem: str) -> str:
        return {"s16": "p16", "s32": "p8s", "s64": "p64"}[elem]

    # The op DAG is per-4-row-group; emit one group body inside a loop.
    ops0 = [o for o in ops if o.attrs.get("g", 0) == 0]
    for op in ops0:
        kind = op.kind
        attrs = op.attrs
        pass_id = int(op.tile_id.split(".")[0][1:])
        out = "%s_p%d" % (v(op.out), pass_id)
        ins = ["%s_p%d" % (v(x), pass_id) for x in op.inputs]
        if kind == "load":
            row = _row_from_tile(op.tile_id)
            base = "src" if pass_id == 1 else "coef"
            stride = "stride" if pass_id == 1 else "32"
            body.append("    svint16_t %s = svld1_s16(p16, "
                        "%s + (g * 4 + %d) * %s%s);"
                        % (out, base, row, stride,
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
            body.append("    %s %s = %s(%s, %s, %s);"
                        % (_ctype(elem), out, fn, pg, ins[0], ins[1]))
            ctype[out] = _ctype(elem)
        elif kind == "permute":
            if attrs["kind"] == "tbl":
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
                nconst = 4 if k % 2 == 1 else 2
                table = "CODD" if k % 2 == 1 else "K2S"
                for m in range(nconst):
                    nm = "c_%s_%d" % (tid.replace(".", "_"), m)
                    body.append("    svint16_t %s = svld1_s16(p16, "
                                "%s[%d][%d]);"
                                % (nm, table, k // (2 if k % 2 else 4), m))
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
            else:
                idx = k // 8
                body.append("    int32_t k0v_%s[2];" % out)
                body.append("    svst1_s32(pg2s, k0v_%s, %s);" % (out, ins[0]))
                body.append("    int64_t %s = (int64_t)K0[%d][0] * "
                            "k0v_%s[0] + (int64_t)K0[%d][1] * k0v_%s[1];"
                            % (out, idx, out, idx, out))
            ctype[out] = "int64_t"
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
        elif kind == "store":
            lanes = attrs["lanes"]
            pass_id, k, row = lanes[0]
            dst = "coef" if pass_id == 1 else "dst"
            if ctype.get(ins[0]) == "svint16_t" and len(lanes) > 1:
                body.append("    svst1_s16(pg4h, %s + %d * 32 + g * 4, %s);"
                            % (dst, k, ins[0]))
            else:
                rloc = row % 4
                body.append("    %s[%d * 32 + g * 4 + %d] = (int16_t)%s;"
                            % (dst, k, rloc, ins[0]))
    body.insert(0, "    add = %d;" % add_value)
    body.insert(1, "    for (int g = 0; g < 8; g++)")
    body.insert(2, "    {")
    body.append("    }")
    return body


def emit_acle(plan: Plan, ops: List[Op],
              func_name: str = "dynopt_dct32_opbackend") -> str:
    pass1 = [o for o in ops if o.tile_id.startswith("p1.")]
    pass2 = [o for o in ops if o.tile_id.startswith("p2.")]
    b1 = _emit_pass(pass1, 8)
    b2 = _emit_pass(pass2, 1024)
    prologue = """\
    const svbool_t p16 = svptrue_b16();
    const svbool_t p8s = svptrue_b32();
    const svbool_t p64 = svptrue_b64();
    const svbool_t pg4s = svwhilelt_b32(0, 4);
    const svbool_t pg4h = svwhilelt_b16(0, 4);
    const svbool_t pg2s = svwhilelt_b32(0, 2);
    const svint64_t zero64 = svdup_n_s64(0);
    int add;
    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);
    const svuint16_t i0 = svld1_u16(p16, IDX_04);
    const svuint16_t i1 = svld1_u16(p16, IDX_47);
    const svuint16_t i2 = svld1_u16(p16, IDX_8B);
    const svuint16_t i3 = svld1_u16(p16, IDX_CF);
    const svuint16_t ilo = svld1_u16(p16, IDX_LO8);
"""
    return """\
// Generated by optimizer/ir/dct32_op_emit.py -- do not edit by hand.
// OpIR backend slice (no grouped C++ blocks).
#include <arm_sve.h>
#include <cstdint>

%s
%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t stride)
{
    int16_t coef[32 * 32];
%s
%s
%s
}
""" % (IDX_DEFS, cpp_constants(), func_name, prologue,
       "\n".join(b1), "\n".join(b2))


def emit_from_plan(plan: Plan, func_name: str = "dynopt_dct32_opbackend") -> str:
    return emit_acle(plan, lower_plan_to_ops(plan), func_name)
