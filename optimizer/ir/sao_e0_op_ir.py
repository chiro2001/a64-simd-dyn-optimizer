"""SAO stats E0 64x1 width-independent op DAG (triple-ISA family PoC).

Mirrors upstream saoCuStatsE0_neon (sao-prim.cpp): 4 blocks of 16
pixels, each with edge-type masks (vceq), count accumulation
(vpadalq_s8), zip-widened masks, and stats dots (NEON vmul/vmla path
vs SVE sdot.d), then reduce_eo_stats (vpadd + memory subtract).

The dot node is target-agnostic: the emitter lowers it to mul (NEON)
or sdot.d bridge (SVE), exactly like the dct dot node.
"""

from __future__ import annotations

from typing import Callable, List

from lane_defuse import annotate  # noqa: E402
from op_ir import Op


def _builder() -> List[Op]:
    ops: List[Op] = []
    n = 0

    def fresh(kind, tile, ins=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("eo%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def sao_e0_64_dag(target: str = "neon") -> List[Op]:
    ops, fresh = _builder()
    # 5 edge types, masks from vceq against -2..2.
    values = (-2, -1, 0, 1, 2)
    if target == "sve2":
        count_u8 = fresh("dup8", "eo.init", attrs={"value": 0}).out
        stats_acc = [fresh("dup64", "eo.init", attrs={"value": 0}).out
                     for _ in range(5)]
    else:
        count_acc = [fresh("dup16", "eo.init", attrs={"value": 0}).out
                     for _ in range(5)]
        stats_acc = [fresh("dup32", "eo.init", attrs={"value": 0}).out
                     for _ in range(5)]
    for b in range(4):
        et = fresh("edge", "eo.b%d.edge" % b,
                   attrs={"block": b}).out
        masks = []
        if target == "sve2":
            count_u8 = fresh("histseg_count", "eo.b%d.hist" % b,
                             (count_u8, et),
                             attrs={"elem": "u8"}).out
        for i, val in enumerate(values):
            m = fresh("vceq", "eo.b%d.m%d" % (b, i), (et,),
                      attrs={"value": val, "elem": "s8"})
            masks.append(m)
            if target != "sve2":
                count_acc[i] = fresh("vpadal_s8", "eo.b%d.c%d" % (b, i),
                                     (count_acc[i], m.out),
                                     attrs={"elem": "s8"}).out
        for i, m in enumerate(masks):
            lo = fresh("vzip1_s8", "eo.b%d.z%d" % (b, i), (m.out, m.out),
                       attrs={"elem": "s8"})
            hi = fresh("vzip2_s8", "eo.b%d.z%d" % (b, i), (m.out, m.out),
                       attrs={"elem": "s8"})
            dl = fresh("load_diff16", "eo.b%d.dl" % b,
                       attrs={"block": b, "half": "lo"})
            dh = fresh("load_diff16", "eo.b%d.dh" % b,
                       attrs={"block": b, "half": "hi"})
            if target == "sve2":
                a0 = fresh("dot_stats", "eo.b%d.s%da" % (b, i),
                           (stats_acc[i], dl.out, lo.out),
                           attrs={"target": "sve", "half": "lo"})
                stats_acc[i] = fresh("dot_stats", "eo.b%d.s%db" % (b, i),
                                     (a0.out, dh.out, hi.out),
                                     attrs={"target": "sve",
                                            "half": "hi"}).out
            else:
                dlo = fresh("dot_stats", "eo.b%d.s%da" % (b, i),
                            (lo.out, dl.out),
                            attrs={"target": "auto", "half": "lo"})
                dhi = fresh("dot_stats", "eo.b%d.s%db" % (b, i),
                            (hi.out, dlo.out, dh.out),
                            attrs={"target": "auto", "half": "hi"})
                stats_acc[i] = fresh("vpadal_s16", "eo.b%d.t%d" % (b, i),
                                     (stats_acc[i], dlo.out, dhi.out),
                                     attrs={"elem": "s16"}).out
    # reduce_eo_stats: counts order {2,0,1,3,4}.
    if target == "sve2":
        cw = fresh("hist_count_reduce", "eo.reduce", (count_u8,),
                   attrs={"elem": "u8"})
        old_c = fresh("load32", "eo.reduce", attrs={"base": "count"})
        fresh("store_add32", "eo.reduce", (old_c.out, cw.out),
              attrs={"base": "count"})
        fresh("scalar_add_lane", "eo.reduce", (count_u8,),
              attrs={"base": "count", "index": 4})
        s01 = fresh("vmovn_combine", "eo.reduce",
                    (stats_acc[2], stats_acc[0]),
                    attrs={"elem": "s64"})
        s23 = fresh("vmovn_combine", "eo.reduce",
                    (stats_acc[1], stats_acc[3]),
                    attrs={"elem": "s64"})
        s0123 = fresh("vpadd_s32", "eo.reduce", (s01.out, s23.out),
                      attrs={"elem": "s32"})
        old_s = fresh("load32", "eo.reduce", attrs={"base": "stats"})
        fresh("store_sub32", "eo.reduce", (old_s.out, s0123.out),
              attrs={"base": "stats"})
        s4 = fresh("vaddv_s64", "eo.reduce", (stats_acc[4],),
                   attrs={"elem": "s64"})
        fresh("scalar_sub", "eo.reduce", (s4.out,),
              attrs={"base": "stats", "index": 4})
        return annotate(ops)
    c01 = fresh("vpadd_s16", "eo.reduce", (count_acc[2], count_acc[0]),
                attrs={"elem": "s16"})
    c23 = fresh("vpadd_s16", "eo.reduce", (count_acc[1], count_acc[3]),
                attrs={"elem": "s16"})
    c0123 = fresh("vpadd_s16", "eo.reduce", (c01.out, c23.out),
                  attrs={"elem": "s16"})
    cw = fresh("vpaddl_s16", "eo.reduce", (c0123.out,),
               attrs={"from": "s16", "to": "s32"})
    old_c = fresh("load32", "eo.reduce", attrs={"base": "count"})
    fresh("store_sub32", "eo.reduce", (old_c.out, cw.out),
          attrs={"base": "count"})
    c4 = fresh("vaddv_s16", "eo.reduce", (count_acc[4],),
               attrs={"elem": "s16"})
    fresh("scalar_sub", "eo.reduce", (c4.out,),
          attrs={"base": "count", "index": 4})
    s01 = fresh("vpadd_s32", "eo.reduce", (stats_acc[2], stats_acc[0]),
                attrs={"elem": "s32"})
    s23 = fresh("vpadd_s32", "eo.reduce", (stats_acc[1], stats_acc[3]),
                attrs={"elem": "s32"})
    s0123 = fresh("vpadd_s32", "eo.reduce", (s01.out, s23.out),
                  attrs={"elem": "s32"})
    old_s = fresh("load32", "eo.reduce", attrs={"base": "stats"})
    fresh("store_sub32", "eo.reduce", (old_s.out, s0123.out),
          attrs={"base": "stats"})
    s4 = fresh("vaddv_s32", "eo.reduce", (stats_acc[4],),
               attrs={"elem": "s32"})
    fresh("scalar_sub", "eo.reduce", (s4.out,),
          attrs={"base": "stats", "index": 4})
    return annotate(ops)
