"""pixel_var 16x16 width-independent op DAG (asm-family pixel-util).

Mirrors upstream pixel-prim.cpp pixel_var_neon<16> (8-bit): per 2-row
group load two u8x16 planes, vpadalq_u8 sum, vmull_u8 squares +
vpadalq_u16 accumulate; final vpaddl/vpadal sum, vaddq sqr, packed
return (sum | sumsq<<32). NEON and NEON-dotprod variants share the
graph (dotprod lowers the square/accumulate via dot instructions).
"""

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
        op = Op("var%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def pixel_var_16x16_dag() -> List[Op]:
    ops, fresh = _builder()
    sum0 = fresh("dup16", "var.init", attrs={"value": 0}).out
    sum1 = fresh("dup16", "var.init", attrs={"value": 0}).out
    sqr0 = fresh("dup32", "var.init", attrs={"value": 0}).out
    sqr1 = fresh("dup32", "var.init", attrs={"value": 0}).out
    for h in range(8):
        s0 = fresh("load_u8x16", "var.h%d.s0" % h,
                   attrs={"row": 2 * h})
        s1 = fresh("load_u8x16", "var.h%d.s1" % h,
                   attrs={"row": 2 * h + 1})
        sum0 = fresh("vpadal_u8", "var.h%d.sa" % h, (sum0, s0.out),
                     attrs={"elem": "u8"}).out
        sum1 = fresh("vpadal_u8", "var.h%d.sb" % h, (sum1, s1.out),
                     attrs={"elem": "u8"}).out
        for idx, s in ((0, s0), (1, s1)):
            lo = fresh("vget", "var.h%d.%d.lo" % (h, idx), (s.out,),
                       attrs={"which": "lo", "elem": "u8"})
            hi = fresh("vget", "var.h%d.%d.hi" % (h, idx), (s.out,),
                       attrs={"which": "hi", "elem": "u8"})
            qlo = fresh("vmull_u8", "var.h%d.%d.ql" % (h, idx),
                        (lo.out, lo.out), attrs={"elem": "u8"})
            qhi = fresh("vmull_u8", "var.h%d.%d.qh" % (h, idx),
                        (hi.out, hi.out), attrs={"elem": "u8"})
            if idx == 0:
                sqr0 = fresh("vpadal_u16", "var.h%d.0.q" % h,
                             (sqr0, qlo.out), attrs={"elem": "u16"}).out
                sqr0 = fresh("vpadal_u16", "var.h%d.0.r" % h,
                             (sqr0, qhi.out), attrs={"elem": "u16"}).out
            else:
                sqr1 = fresh("vpadal_u16", "var.h%d.1.q" % h,
                             (sqr1, qlo.out), attrs={"elem": "u16"}).out
                sqr1 = fresh("vpadal_u16", "var.h%d.1.r" % h,
                             (sqr1, qhi.out), attrs={"elem": "u16"}).out
    su = fresh("vpaddl_u16", "var.reduce", (sum0,),
               attrs={"elem": "u16"})
    su = fresh("vpadal_u16", "var.reduce", (su.out, sum1),
               attrs={"elem": "u16"}).out
    sq = fresh("vadd_u32", "var.reduce", (sqr0, sqr1),
               attrs={"elem": "u32"})
    s_sum = fresh("vaddv_u32", "var.reduce", (su,),
                  attrs={"elem": "u32"})
    s_sq = fresh("vaddlv_u32", "var.reduce", (sq.out,),
                 attrs={"elem": "u32"})
    fresh("pack_var", "var.reduce", (s_sum.out, s_sq.out),
          attrs={"to": "u64"})
    return annotate(ops)
