"""SAD 16x16 width-independent op DAG (asm-family first member).

Mirrors upstream pixel-prim.cpp sad_pp_neon (vabal chains + vaddlv):
per row load two u8x16 planes, absolute-difference accumulate into
two u16x8 accumulators (low/high halves), final vaddlv + scalar add.
The asm family (sad-a.S / sad-neon-dotprod.S) is the same graph with
different dot/accumulate instructions.
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
        op = Op("sad%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def sad16x16_dag() -> List[Op]:
    ops, fresh = _builder()
    acc_lo = fresh("dup16", "sad.init", attrs={"value": 0}).out
    acc_hi = fresh("dup16", "sad.init", attrs={"value": 0}).out
    for y in range(16):
        p1 = fresh("load_u8x16", "sad.r%d.p1" % y,
                   attrs={"base": "pix1", "row": y})
        p2 = fresh("load_u8x16", "sad.r%d.p2" % y,
                   attrs={"base": "pix2", "row": y})
        lo1 = fresh("vget", "sad.r%d.lo1" % y, (p1.out,),
                    attrs={"which": "lo", "elem": "u8"})
        lo2 = fresh("vget", "sad.r%d.lo2" % y, (p2.out,),
                    attrs={"which": "lo", "elem": "u8"})
        hi1 = fresh("vget", "sad.r%d.hi1" % y, (p1.out,),
                    attrs={"which": "hi", "elem": "u8"})
        hi2 = fresh("vget", "sad.r%d.hi2" % y, (p2.out,),
                    attrs={"which": "hi", "elem": "u8"})
        acc_lo = fresh("vabal", "sad.r%d.lo" % y,
                       (acc_lo, lo1.out, lo2.out),
                       attrs={"elem": "u8"}).out
        acc_hi = fresh("vabal", "sad.r%d.hi" % y,
                       (acc_hi, hi1.out, hi2.out),
                       attrs={"elem": "u8"}).out
    s_lo = fresh("vaddlv", "sad.reduce", (acc_lo,),
                 attrs={"from": "u16", "to": "s32"})
    s_hi = fresh("vaddlv", "sad.reduce", (acc_hi,),
                 attrs={"from": "u16", "to": "s32"})
    fresh("scalar_add2", "sad.reduce", (s_lo.out, s_hi.out),
          attrs={"to": "s32"})
    return annotate(ops)
