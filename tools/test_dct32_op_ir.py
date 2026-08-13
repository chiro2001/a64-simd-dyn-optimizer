#!/usr/bin/env python3
"""Positive/negative checks for the DCT32 OpIR vertical slice.

Run: python3 tools/test_dct32_op_ir.py
"""
import copy
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from dct32_op_ir import lower_plan_to_ops, provenance_report  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402


def main():
    plan = dct32_v31_plan()
    ops = lower_plan_to_ops(plan)
    r = provenance_report(plan, ops)
    assert r["ok"], r["issues"]
    assert r["coverage"] == 1.0
    assert r["store_count"] == 2048

    # Negative: delete one odd dot family -> term coverage must fail.
    ops2 = [o for o in ops
            if not (o.kind == "dot_segment" and o.tile_id == "p1.odd.k1")]
    r2 = provenance_report(plan, ops2)
    assert not r2["ok"] and any("covers 0/16" in i for i in r2["issues"])

    # Negative: scatter store must be rejected.
    ops3 = copy.deepcopy(ops)
    for o in ops3:
        if o.kind == "store":
            o.attrs["topology"] = "scatter"
            break
    r3 = provenance_report(plan, ops3)
    assert not r3["ok"] and any("non-contiguous" in i for i in r3["issues"])

    # Negative: round epoch shift mismatch must be reported.
    ops4 = copy.deepcopy(ops)
    for o in ops4:
        if o.kind == "round_shift" and o.attrs.get("epoch") == 1:
            o.attrs["shift"] = 11
            break
    r4 = provenance_report(plan, ops4)
    assert not r4["ok"] and any("round shift 11 at epoch 1" in i
                                for i in r4["issues"])
    print("OpIR slice OK: %d ops, coverage %.2f, negatives detected"
          % (r["op_count"], r["coverage"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
