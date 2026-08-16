"""SSD sse_pp 16x16 width-independent op DAG (asm-family: ssd-a.S /
ssd-a-sve.S compute sum of squared u8 diffs)."""

from __future__ import annotations

from typing import List

from lane_defuse import annotate  # noqa: E402
from op_ir import Op


def _builder():
    ops: List[Op] = []
    n = 0

    def fresh(kind, tile, ins=(), attrs=None):
        nonlocal n
        n += 1
        op = Op("ssd%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def sse_pp_16x16_dag() -> List[Op]:
    ops, fresh = _builder()
    acc0 = fresh("dup32", "ssd.init", attrs={"value": 0}).out
    acc1 = fresh("dup32", "ssd.init", attrs={"value": 0}).out
    for y in range(16):
        a = fresh("load_u8x16", "ssd.r%d.a" % y,
                  attrs={"base": "pix1", "row": y})
        b = fresh("load_u8x16", "ssd.r%d.b" % y,
                  attrs={"base": "pix2", "row": y})
        for half, acc in (("lo", "acc0"), ("hi", "acc1")):
            va = fresh("vget", "ssd.r%d.%s.a" % (y, half), (a.out,),
                       attrs={"which": half, "elem": "u8"})
            vb = fresh("vget", "ssd.r%d.%s.b" % (y, half), (b.out,),
                       attrs={"which": half, "elem": "u8"})
            d = fresh("vabdl_u8", "ssd.r%d.%s.d" % (y, half),
                      (va.out, vb.out), attrs={"elem": "u8"})
            dlo = fresh("vget", "ssd.r%d.%s.dlo" % (y, half), (d.out,),
                        attrs={"which": "lo", "elem": "u16"})
            dhi = fresh("vget", "ssd.r%d.%s.dhi" % (y, half), (d.out,),
                        attrs={"which": "hi", "elem": "u16"})
            s0 = fresh("vmull_u16", "ssd.r%d.%s.s0" % (y, half),
                       (dlo.out, dlo.out), attrs={"elem": "u16"})
            s1 = fresh("vmull_u16", "ssd.r%d.%s.s1" % (y, half),
                       (dhi.out, dhi.out), attrs={"elem": "u16"})
            if acc == "acc0":
                acc0 = fresh("vadd_u32", "ssd.r%d.%s.a0" % (y, half),
                             (acc0, s0.out), attrs={"elem": "u32"}).out
                acc0 = fresh("vadd_u32", "ssd.r%d.%s.a1" % (y, half),
                             (acc0, s1.out), attrs={"elem": "u32"}).out
            else:
                acc1 = fresh("vadd_u32", "ssd.r%d.%s.b0" % (y, half),
                             (acc1, s0.out), attrs={"elem": "u32"}).out
                acc1 = fresh("vadd_u32", "ssd.r%d.%s.b1" % (y, half),
                             (acc1, s1.out), attrs={"elem": "u32"}).out
    s0 = fresh("vaddv_u32", "ssd.reduce", (acc0,),
               attrs={"elem": "u32"})
    s1 = fresh("vaddv_u32", "ssd.reduce", (acc1,),
               attrs={"elem": "u32"})
    fresh("scalar_add2", "ssd.reduce", (s0.out, s1.out),
          attrs={"to": "s32"})
    return annotate(ops)
