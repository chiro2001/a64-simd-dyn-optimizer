#!/usr/bin/env python3
"""First-slice tests for the DCT16 op IR (pass1 E/O leaf)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_op_ir import dct16_leaf_provenance, lower_pass1_leaf  # noqa: E402


def main():
    ops, leaves = lower_pass1_leaf()
    r = dct16_leaf_provenance(ops, leaves)
    assert r["ok"], r["issues"]
    assert len(ops) == 16 * 4  # load + rev + E + O per row
    assert len(leaves) == 16
    print("DCT16 leaf slice OK: ops=%d rows=%d" % (len(ops), len(leaves)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
