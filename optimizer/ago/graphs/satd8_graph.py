"""SATD 8x8 AGO IR graph, imported from the upstream NEON dataflow
(AGO M2 second dataflow anchor).

The graph mirrors
load_diff_u8x8x8 -> hadamard_4_v (two 4-row quadrants) ->
hadamard_abs_4_h -> vmax pairs -> vadd -> vaddlvq so the upstream
NEON instruction sequence is always selectable. Unlike sa8d8 this is a
4x4-quadrant dataflow (two half-planes), not a single 8-point
Hadamard; the two quadrants must stay distinct.
"""

from __future__ import annotations

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))

from ago.contracts.satd8 import Satd8Contract  # noqa: E402
from ago.ir import Graph, Op, Shape, Value  # noqa: E402


def build_satd8_graph() -> Graph:
    c = Satd8Contract()
    g = Graph(
        name="satd8",
        inputs={
            "pix1": Value("pix1", Shape("u8", 8, 64), stride=8),
            "pix2": Value("pix2", Shape("u8", 8, 64), stride=8),
        },
        outputs=("satd",),
        ops={},
        contract=c.canonical(),
        meta={"oracle": c.oracle, "rows": c.rows, "cols": c.cols},
    )
    # 8 rows of u8x8 -> s16x8 diff (load_diff_u8x8x8)
    for i in range(8):
        g.ops["ld1_%d" % i] = Op("load", ("pix1",), "p1r%d" % i,
                                 {"row": i})
        g.ops["ld2_%d" % i] = Op("load", ("pix2",), "p2r%d" % i,
                                 {"row": i})
        g.ops["diff_%d" % i] = Op("sub_ext", ("p1r%d" % i, "p2r%d" % i),
                                  "d%d" % i, {"elem": "s16"})
    # two 4-point vertical Hadamard quadrants (rows 0-3, rows 4-7)
    for q in (0, 1):
        base = 4 * q
        rows = tuple("d%d" % j for j in range(base, base + 4))
        for k in range(4):
            g.ops["h_v_%d" % (base + k)] = Op(
                "hadamard_v", rows,
                ("t" if q == 0 else "tB") + str(k),
                {"n": 4, "idx": k, "quad": q})
    # horizontal 4-point Hadamard with abs per quadrant -> s0..s3 / sB0..sB3
    for q in (0, 1):
        base = 4 * q
        ins = tuple(("t" if q == 0 else "tB") + str(k)
                    for k in range(4))
        for k in range(4):
            g.ops["h_h_%d" % (base + k)] = Op(
                "hadamard_h_abs", ins,
                ("s" if q == 0 else "sB") + str(k),
                {"n": 4, "group": base + k, "quad": q})
    # max-pair dedup per quadrant (upstream vmaxq_u16)
    for k in range(4):
        q = k // 2
        p = ("s" if q == 0 else "sB")
        g.ops["max_%d" % k] = Op(
            "max", (p + str(2 * (k % 2)), p + str(2 * (k % 2) + 1)),
            "m%d" % k, {"elem": "u16"})
    g.ops["o0"] = Op("add", ("m0", "m1"), "o0")
    g.ops["o1"] = Op("add", ("m2", "m3"), "o1")
    g.ops["accv"] = Op("add", ("o0", "o1"), "accv")
    g.ops["satd"] = Op("reduce_addv", ("accv",), "satd")
    return g


if __name__ == "__main__":
    g = build_satd8_graph()
    print("nodes:", len(g.ops), "hash:", g.canonical_hash()[:16])
