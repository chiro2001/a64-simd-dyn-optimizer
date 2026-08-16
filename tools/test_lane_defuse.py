#!/usr/bin/env python3
"""Tests for lane-granular def-use provenance on the fused8 DAGs."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_op_ir import lower_pass1_fused8, lower_pass2_fused8  # noqa: E402
from dct32_fused8_op_ir import (  # noqa: E402
    lower_pass1_fused8 as d32_p1, lower_pass2_fused8 as d32_p2)
from lane_defuse import defuse_report, lane_semantics  # noqa: E402
from op_ir import Op  # noqa: E402


def main():
    for tag, ops in (
            ("dct16 pass1", lower_pass1_fused8()),
            ("dct16 pass2", lower_pass2_fused8()),
            ("dct16 full", lower_pass1_fused8() + lower_pass2_fused8()),
            ("dct32 pass1", d32_p1()),
            ("dct32 pass2", d32_p2()),
            ("dct32 full", d32_p1() + d32_p2())):
        assert all("n_out" in o.attrs and "lane_in" in o.attrs
                   for o in ops), "missing explicit lane attrs (%s)" % tag
        r = defuse_report(ops)
        assert r["ok"], (tag, r["issues"][:5])
        assert r["stores"] > 0
        print("lane def-use %s OK: ops=%d stores=%d"
              % (tag, r["ops"], r["stores"]))

    # Negative: an op consuming an undefined input must be reported.
    bad = [Op("bad1", "neon_padd", "p1.x", "out", ("ghost", "x"),
              {"elem": "s32"}),
           Op("bad2", "load", "p1.x", "x", (),
              {"arch": "neon", "elem": "s16", "row": 0, "half": "lo",
               "base": "src", "index": "r*stride"}),
           Op("bad3", "store", "p1.x", "", ("out",),
              {"arch": "neon", "base": "dst", "index": "16*k + 0",
               "lanes": ((1, 0, 0), (1, 0, 1), (1, 0, 2), (1, 0, 3)),
               "topology": "contiguous", "n_lanes": 4})]
    r = defuse_report(bad)
    assert not r["ok"] and any("undefined" in i for i in r["issues"])
    print("lane def-use negative OK")
    return 0


if __name__ == "__main__":
    sys.exit(main())
