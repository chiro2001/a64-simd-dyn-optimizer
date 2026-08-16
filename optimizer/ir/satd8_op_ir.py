"""SATD 8x8 width-independent op DAG (first non-DCT kernel PoC).

Mirrors kernels/satd-8/candidates/best_sve1.cpp (pure-NEON 8-lane,
VL-independent, 77 fused_uop) and upstream pixel-prim.cpp
pixel_satd_8x8_neon: load_diff -> hadamard_4_v butterflies -> transpose
permutes + abs/sumsub -> vmax/vadd -> reduce (vpaddl/vpadal/vaddv).

The point of the PoC: the same DAG/lowering machinery used for
dct16/32 transfers to a non-butterfly-DCT kernel; the emitted code is
pure NEON (no SVE), so it is VL-independent like the dct NEON variants.
"""

from __future__ import annotations

from typing import Dict, List, Tuple

from lane_defuse import annotate  # noqa: E402
from op_ir import Op


def _builder_dag() -> Tuple[List[Op], Dict[int, str]]:
    ops: List[Op] = []
    n = 0

    def fresh(kind, tile, ins=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("s8%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    diff: Dict[int, str] = {}
    for y in range(8):
        d = fresh("load_diff", "s8.load.row%d" % y,
                  attrs={"arch": "neon", "elem": "s16", "row": y,
                         "base": "pix", "index": "y*sp"})
        diff[y] = d.out

    def hadamard4_v(ins, base):
        s0 = fresh("add", base, (ins[0], ins[1]),
                   attrs={"elem": "s16", "arch": "neon"})
        d0 = fresh("sub", base, (ins[0], ins[1]),
                   attrs={"elem": "s16", "arch": "neon"})
        s1 = fresh("add", base, (ins[2], ins[3]),
                   attrs={"elem": "s16", "arch": "neon"})
        d1 = fresh("sub", base, (ins[2], ins[3]),
                   attrs={"elem": "s16", "arch": "neon"})
        o0 = fresh("add", base, (s0.out, s1.out),
                   attrs={"elem": "s16", "arch": "neon"})
        o2 = fresh("sub", base, (s0.out, s1.out),
                   attrs={"elem": "s16", "arch": "neon"})
        o1 = fresh("add", base, (d0.out, d1.out),
                   attrs={"elem": "s16", "arch": "neon"})
        o3 = fresh("sub", base, (d0.out, d1.out),
                   attrs={"elem": "s16", "arch": "neon"})
        return (o0.out, o1.out, o2.out, o3.out)

    t = hadamard4_v([diff[y] for y in range(4)], "s8.v.0")
    t += hadamard4_v([diff[y] for y in range(4, 8)], "s8.v.1")

    def hadamard_abs4_h(ins, base):
        t0 = fresh("permute", base, (ins[0], ins[1]),
                   attrs={"kind": "trn1q_s16", "arch": "neon"})
        t1 = fresh("permute", base, (ins[0], ins[1]),
                   attrs={"kind": "trn2q_s16", "arch": "neon"})
        t2 = fresh("permute", base, (ins[2], ins[3]),
                   attrs={"kind": "trn1q_s16", "arch": "neon"})
        t3 = fresh("permute", base, (ins[2], ins[3]),
                   attrs={"kind": "trn2q_s16", "arch": "neon"})
        sa = fresh("add", base, (t0.out, t1.out),
                   attrs={"elem": "s16", "arch": "neon"})
        s0 = fresh("abs", base, (sa.out,), attrs={"elem": "s16"})
        d0 = fresh("abd", base, (t0.out, t1.out),
                   attrs={"elem": "s16"})
        sb = fresh("add", base, (t2.out, t3.out),
                   attrs={"elem": "s16", "arch": "neon"})
        s1 = fresh("abs", base, (sb.out,), attrs={"elem": "s16"})
        d1 = fresh("abd", base, (t2.out, t3.out),
                   attrs={"elem": "s16"})
        o0 = fresh("permute", base, (s0.out, s1.out),
                   attrs={"kind": "trn1q_s32", "arch": "neon"})
        o1 = fresh("permute", base, (s0.out, s1.out),
                   attrs={"kind": "trn2q_s32", "arch": "neon"})
        o2 = fresh("permute", base, (d0.out, d1.out),
                   attrs={"kind": "trn1q_s32", "arch": "neon"})
        o3 = fresh("permute", base, (d0.out, d1.out),
                   attrs={"kind": "trn2q_s32", "arch": "neon"})
        return (o0.out, o1.out, o2.out, o3.out)

    h = hadamard_abs4_h(t[0:4], "s8.h.0")
    h += hadamard_abs4_h(t[4:8], "s8.h.1")

    max0 = fresh("max", "s8.reduce", (h[0], h[1]),
                 attrs={"elem": "u16"})
    max1 = fresh("max", "s8.reduce", (h[2], h[3]),
                 attrs={"elem": "u16"})
    max2 = fresh("max", "s8.reduce", (h[4], h[5]),
                 attrs={"elem": "u16"})
    max3 = fresh("max", "s8.reduce", (h[6], h[7]),
                 attrs={"elem": "u16"})
    out0 = fresh("add", "s8.reduce", (max0.out, max1.out),
                 attrs={"elem": "u16", "arch": "neon"})
    out1 = fresh("add", "s8.reduce", (max2.out, max3.out),
                 attrs={"elem": "u16", "arch": "neon"})
    p0 = fresh("vpaddl", "s8.reduce", (out0.out,),
               attrs={"from": "u16", "to": "u32"})
    p1 = fresh("vpadal", "s8.reduce", (p0.out, out1.out),
               attrs={"from": "u16", "to": "u32"})
    fresh("vaddv", "s8.reduce", (p1.out,),
          attrs={"from": "u32", "to": "s32"})
    return annotate(ops), diff


def satd8_dag() -> List[Op]:
    ops, _ = _builder_dag()
    return ops
