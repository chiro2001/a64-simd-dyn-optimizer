"""SA8D 8x8 AGO IR graph, imported from the upstream NEON dataflow
(M0 vertical slice, round-0023).

This is the hand/import anchor: the graph mirrors
load_diff_u8x8x8 -> hadamard_8_v -> hadamard_8_h -> reduce so the
upstream NEON instruction sequence is always selectable.
"""

from __future__ import annotations

import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(
    os.path.dirname(os.path.abspath(__file__)))))

from ago.contracts.sa8d8 import Sa8d8Contract  # noqa: E402
from ago.ir import Graph, Op, Shape, Value  # noqa: E402


def build_sa8d8_graph() -> Graph:
    c = Sa8d8Contract()
    g = Graph(
        name="sa8d8",
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
    # vertical 8-point Hadamard (hadamard_8_v): diff rows -> temp rows
    for i in range(8):
        ins = tuple("d%d" % j for j in range(8))
        g.ops["h_v_%d" % i] = Op("hadamard_v", ins, "t%d" % i,
                                 {"n": 8, "idx": i})
    # horizontal 8-point Hadamard with abs sums (hadamard_8_h -> sum[4])
    for i in range(4):
        g.ops["h_h_%d" % i] = Op("hadamard_h_abs", ("t0", "t1", "t2", "t3"),
                                 "s%d" % i, {"group": i})
    # out0 = s0+s1, out1 = s2+s3
    g.ops["sum01"] = Op("add", ("s0", "s1"), "o0")
    g.ops["sum23"] = Op("add", ("s2", "s3"), "o1")
    # acc = o0+o1; satd = (vaddlvq(acc) + 1) >> 1
    g.ops["acc"] = Op("add", ("o0", "o1"), "accv")
    g.ops["hsum"] = Op("reduce_addv", ("accv",), "scalar")
    g.ops["satd"] = Op("shift_rnd", ("scalar",), "satd", {"imm": 1})
    return g


if __name__ == "__main__":
    g = build_sa8d8_graph()
    print("nodes:", len(g.ops), "hash:", g.canonical_hash()[:16])
