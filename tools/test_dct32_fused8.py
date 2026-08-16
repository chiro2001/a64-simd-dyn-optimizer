#!/usr/bin/env python3
"""Tests for the DCT32 8-lane fused quarter op DAG (width-independent
spec of kernels/dct32/candidates/best_sve2_vl128.cpp)."""
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct32_fused8_op_ir import (  # noqa: E402
    fused8_provenance, lower_pass1_fused8, lower_pass2_fused8)


def main():
    p1 = lower_pass1_fused8()
    p2 = lower_pass2_fused8()
    for tag, ops in (("pass1", p1), ("pass2", p2)):
        r = fused8_provenance(ops)
        assert r["ok"], (tag, r["issues"][:5])
        assert r["store_count"] == 1024, (tag, r["store_count"])
        assert r["expected_lanes"] == 1024
        assert r["scatter_stores"] == 0
        print("DCT32 fused8 %s OK: ops=%d stores=%d"
              % (tag, len(ops), r["store_count"]))
    full = p1 + p2
    r = fused8_provenance(full)
    assert r["ok"], r["issues"][:5]
    assert r["store_count"] == 2048
    assert r["scatter_stores"] == 0
    print("DCT32 fused8 full DAG OK: ops=%d stores=%d"
          % (len(full), r["store_count"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
