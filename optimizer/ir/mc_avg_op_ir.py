"""MC avg_pp 16x16 width-independent op DAG (asm-family: mc-a.S /
mc-a-sve2.S both compute (a+b+1)>>1, NEON urhadd / SVE2 svrhadd)."""

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
        op = Op("avg%04d" % n, kind, tile, "v%04d" % n, tuple(ins),
                dict(attrs if attrs is not None else {}))
        ops.append(op)
        return op

    return ops, fresh


def avg_pp_16x16_dag() -> List[Op]:
    ops, fresh = _builder()
    for y in range(16):
        a = fresh("load_u8x16", "avg.r%d.a" % y,
                  attrs={"base": "pix1", "row": y})
        b = fresh("load_u8x16", "avg.r%d.b" % y,
                  attrs={"base": "pix2", "row": y})
        r = fresh("rhadd", "avg.r%d" % y, (a.out, b.out),
                  attrs={"elem": "u8"})
        fresh("store_u8x16", "avg.r%d.st" % y, (r.out,),
              attrs={"base": "dst", "row": y})
    return annotate(ops)
