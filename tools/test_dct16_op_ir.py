#!/usr/bin/env python3
"""Tests for the DCT16 op IR (leaf / odd slice / upstream full DAG)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct16_op_ir import (  # noqa: E402
    dct16_leaf_provenance, dct16_pass1_provenance,
    dct16_upstream_provenance, lower_pass1_leaf, lower_pass1_odd,
    lower_pass1_perrow, lower_pass2_upstream)


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
    # Full upstream DAG: pass1 per-row + pass2 upstream.
    full = lower_pass1_perrow() + lower_pass2_upstream()
    r3 = dct16_upstream_provenance(full)
    assert r3["ok"], r3["issues"]
    assert r3["store_count"] == 512   # output-lane count (pass1+pass2)
    assert r3["expected_lanes"] == 512
    n1 = len([o for o in full if o.tile_id.startswith("p1.")])
    n2 = len([o for o in full if o.tile_id.startswith("p2.")])
    print("DCT16 upstream DAG OK: pass1_ops=%d pass2_ops=%d stores=%d"
          % (n1, n2, r3["store_count"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
