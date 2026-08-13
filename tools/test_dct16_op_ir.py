#!/usr/bin/env python3
"""First-slice tests for the DCT16 op IR (pass1 E/O leaf)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_op_ir import (  # noqa: E402
    dct16_leaf_provenance, dct16_pass1_provenance, lower_pass1_leaf,
    lower_pass1_odd)


def main():
    ops, leaves = lower_pass1_leaf()
    r = dct16_leaf_provenance(ops, leaves)
    assert r["ok"], r["issues"]
    assert len(ops) == 16 * 4  # load + rev + E + O per row
    assert len(leaves) == 16
    all_ops = ops + lower_pass1_odd(leaves)
    r2 = dct16_pass1_provenance(all_ops)
    assert r2["ok"], r2["issues"]
    assert r2["odd_dots"] == 8 * 16
    print("DCT16 pass1 slice OK: ops=%d rows=%d odd_dots=%d"
          % (len(all_ops), len(leaves), r2["odd_dots"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
