"""SATD width-independent op DAGs (8x8 and 16x16, non-DCT PoC).

Mirrors kernels/satd-8/candidates/best_sve1.cpp (pure-NEON 8-lane,
VL-independent) and upstream pixel-prim.cpp pixel_satd_*_neon:
load_diff -> hadamard_4_v butterflies -> transpose permutes +
abs/sumsub -> vmax/vadd -> reduce (vpaddl/vpadal/vaddv); 16x16 is four
satd8-style quads accumulated per group.
"""

from __future__ import annotations

from typing import Callable, Dict, List, Tuple

from lane_defuse import annotate  # noqa: E402
from op_ir import Op


def _builder() -> Tuple[List[Op], Callable]:
    ops: List[Op] = []
    n = 0

    def fresh(kind, tile, ins=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("s%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def _load_diffs(fresh, rows, half=None) -> Dict[int, str]:
    diff: Dict[int, str] = {}
    for y in rows:
        attrs = {"arch": "neon", "elem": "s16", "row": y,
                 "base": "pix", "index": "y*sp"}
        if half:
            attrs["half"] = half
        d = fresh("load_diff", "s.load.row%d" % y, attrs=attrs)
        diff[y] = d.out
    return diff


def _hadamard4_v(fresh, ins, base):
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


def _hadamard_abs4_h(fresh, ins, base):
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
    d0 = fresh("abd", base, (t0.out, t1.out), attrs={"elem": "s16"})
    sb = fresh("add", base, (t2.out, t3.out),
               attrs={"elem": "s16", "arch": "neon"})
    s1 = fresh("abs", base, (sb.out,), attrs={"elem": "s16"})
    d1 = fresh("abd", base, (t2.out, t3.out), attrs={"elem": "s16"})
    o0 = fresh("permute", base, (s0.out, s1.out),
               attrs={"kind": "trn1q_s32", "arch": "neon"})
    o1 = fresh("permute", base, (s0.out, s1.out),
               attrs={"kind": "trn2q_s32", "arch": "neon"})
    o2 = fresh("permute", base, (d0.out, d1.out),
               attrs={"kind": "trn1q_s32", "arch": "neon"})
    o3 = fresh("permute", base, (d0.out, d1.out),
               attrs={"kind": "trn2q_s32", "arch": "neon"})
    return (o0.out, o1.out, o2.out, o3.out)


def _quad_block(fresh, rows, half, base, gtag):
    """One hadamard_4x4_quad: diff rows -> out0/out1 names."""
    diff = _load_diffs(fresh, rows, half)
    t = _hadamard4_v(fresh, [diff[y] for y in rows], base + ".v")
    h = _hadamard_abs4_h(fresh, t[0:4], base + ".h.a")
    h += _hadamard_abs4_h(fresh, t[4:8], base + ".h.b")
    max0 = fresh("max", gtag, (h[0], h[1]), attrs={"elem": "u16"})
    max1 = fresh("max", gtag, (h[2], h[3]), attrs={"elem": "u16"})
    max2 = fresh("max", gtag, (h[4], h[5]), attrs={"elem": "u16"})
    max3 = fresh("max", gtag, (h[6], h[7]), attrs={"elem": "u16"})
    o0 = fresh("add", gtag, (max0.out, max1.out),
               attrs={"elem": "u16", "arch": "neon"})
    o1 = fresh("add", gtag, (max2.out, max3.out),
               attrs={"elem": "u16", "arch": "neon"})
    return o0.out, o1.out


def _reduce(fresh, out0, out1):
    p0 = fresh("vpaddl", "s.reduce", (out0,),
               attrs={"from": "u16", "to": "u32"})
    p1 = fresh("vpadal", "s.reduce", (p0.out, out1),
               attrs={"from": "u16", "to": "u32"})
    fresh("vaddv", "s.reduce", (p1.out,),
          attrs={"from": "u32", "to": "s32"})


def _reduce_vaddlv(fresh, outs):
    t = outs[0]
    for o in outs[1:]:
        t = fresh("add", "s.reduce", (t, o),
                  attrs={"elem": "u16", "arch": "neon"}).out
    fresh("vaddlv", "s.reduce", (t,),
          attrs={"from": "u16", "to": "s32", "add1_shift1": False})


def satd8_dag() -> List[Op]:
    ops, fresh = _builder()
    diff = _load_diffs(fresh, list(range(8)))
    t = _hadamard4_v(fresh, [diff[y] for y in range(4)], "s8.v.0")
    t += _hadamard4_v(fresh, [diff[y] for y in range(4, 8)], "s8.v.1")
    h = _hadamard_abs4_h(fresh, t[0:4], "s8.h.0")
    h += _hadamard_abs4_h(fresh, t[4:8], "s8.h.1")
    max0 = fresh("max", "s8.reduce", (h[0], h[1]),
                 attrs={"elem": "u16"})
    max1 = fresh("max", "s8.reduce", (h[2], h[3]),
                 attrs={"elem": "u16"})
    max2 = fresh("max", "s8.reduce", (h[4], h[5]),
                 attrs={"elem": "u16"})
    max3 = fresh("max", "s8.reduce", (h[6], h[7]),
                 attrs={"elem": "u16"})
    o0 = fresh("add", "s8.reduce", (max0.out, max1.out),
               attrs={"elem": "u16", "arch": "neon"})
    o1 = fresh("add", "s8.reduce", (max2.out, max3.out),
               attrs={"elem": "u16", "arch": "neon"})
    _reduce(fresh, o0.out, o1.out)
    return annotate(ops)


def satd16_dag() -> List[Op]:
    """SATD 16x16: 4 groups, each 4 rows x lo/hi halves, accumulated."""
    ops, fresh = _builder()
    sum0 = sum1 = None
    for g in range(4):
        rows = [g * 4 + y for y in range(4)]
        lo = _load_diffs(fresh, rows, half="lo")
        hi = _load_diffs(fresh, rows, half="hi")
        diff = [lo[y] for y in rows] + [hi[y] for y in rows]
        t = _hadamard4_v(fresh, diff[0:4], "s16.v.%d.a" % g)
        t += _hadamard4_v(fresh, diff[4:8], "s16.v.%d.b" % g)
        h = _hadamard_abs4_h(fresh, t[0:4], "s16.h.%d.a" % g)
        h += _hadamard_abs4_h(fresh, t[4:8], "s16.h.%d.b" % g)
        max0 = fresh("max", "s16.g%d" % g, (h[0], h[1]),
                     attrs={"elem": "u16"})
        max1 = fresh("max", "s16.g%d" % g, (h[2], h[3]),
                     attrs={"elem": "u16"})
        max2 = fresh("max", "s16.g%d" % g, (h[4], h[5]),
                     attrs={"elem": "u16"})
        max3 = fresh("max", "s16.g%d" % g, (h[6], h[7]),
                     attrs={"elem": "u16"})
        o0 = fresh("add", "s16.g%d" % g, (max0.out, max1.out),
                   attrs={"elem": "u16", "arch": "neon"})
        o1 = fresh("add", "s16.g%d" % g, (max2.out, max3.out),
                   attrs={"elem": "u16", "arch": "neon"})
        if sum0 is None:
            sum0, sum1 = o0.out, o1.out
        else:
            sum0 = fresh("add", "s16.acc%d" % g, (sum0, o0.out),
                         attrs={"elem": "u16", "arch": "neon"}).out
            sum1 = fresh("add", "s16.acc%d" % g, (sum1, o1.out),
                         attrs={"elem": "u16", "arch": "neon"}).out
    _reduce(fresh, sum0, sum1)
    return annotate(ops)


def satd_rect_dag(mode: str) -> List[Op]:
    """SATD 8x16 or 16x8: two quads (row groups or lo/hi halves) + vaddlv.
    """
    ops, fresh = _builder()
    outs = []
    if mode == "8x16":
        groups = [(list(range(8)), None), (list(range(8, 16)), None)]
    elif mode == "16x8":
        groups = [(list(range(8)), "lo"), (list(range(8)), "hi")]
    else:
        raise ValueError("mode %s" % mode)
    for gi, (rows, half) in enumerate(groups):
        diff = _load_diffs(fresh, rows, half)
        t = _hadamard4_v(fresh, [diff[y] for y in rows],
                         "s.%d.v.a" % gi)
        t += _hadamard4_v(fresh, [diff[y] for y in rows[4:]],
                          "s.%d.v.b" % gi)
        h = _hadamard_abs4_h(fresh, t[0:4], "s.%d.h.a" % gi)
        h += _hadamard_abs4_h(fresh, t[4:8], "s.%d.h.b" % gi)
        max0 = fresh("max", "s.%d" % gi, (h[0], h[1]),
                     attrs={"elem": "u16"})
        max1 = fresh("max", "s.%d" % gi, (h[2], h[3]),
                     attrs={"elem": "u16"})
        max2 = fresh("max", "s.%d" % gi, (h[4], h[5]),
                     attrs={"elem": "u16"})
        max3 = fresh("max", "s.%d" % gi, (h[6], h[7]),
                     attrs={"elem": "u16"})
        o0 = fresh("add", "s.%d" % gi, (max0.out, max1.out),
                   attrs={"elem": "u16", "arch": "neon"})
        o1 = fresh("add", "s.%d" % gi, (max2.out, max3.out),
                   attrs={"elem": "u16", "arch": "neon"})
        outs.extend((o0.out, o1.out))
    _reduce_vaddlv(fresh, outs)
    return annotate(ops)
