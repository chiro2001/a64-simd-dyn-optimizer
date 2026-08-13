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
from dct32_rewrites import apply_rewrites  # noqa: E402
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

    # Op-level rewrite: tbl2 slices -> zip/trn permutes.
    ops5 = apply_rewrites(ops, ["tbl2_to_zip"])
    r5 = provenance_report(plan, ops5)
    assert r5["ok"], r5["issues"]
    left_tbl2 = [o for o in ops5
                 if o.kind == "permute" and o.attrs.get("kind") == "tbl2"
                 and o.attrs.get("idx") == "ilo"]
    assert not left_tbl2, "tbl2 ilo chains should be rewritten"
    assert any(o.attrs.get("kind") == "zip1d" for o in ops5)

    # Op-level rewrite: legacy_k2 (pass2 k2 mul -> EX sdot).
    ops6 = apply_rewrites(ops, ["legacy_k2"])
    r6 = provenance_report(plan, ops6)
    assert r6["ok"], r6["issues"]
    left_mul = [o for o in ops6
                if o.kind == "mul_reduce"
                and o.tile_id.startswith("p2.k2.k")]
    assert not left_mul, "pass2 k2 mul_reduce should be rewritten"

    # Op-level rewrite: legacy_k4 (both passes k4 mul -> EEO16 sdot).
    ops7 = apply_rewrites(ops, ["legacy_k4"])
    r7 = provenance_report(plan, ops7)
    assert r7["ok"], r7["issues"]
    left_k4 = [o for o in ops7
               if o.kind == "mul_reduce"
               and ".k4.k" in o.tile_id]
    assert not left_k4, "k4 mul_reduce should be rewritten"

    # Op-level rewrite: merge_narrow8 (odd dual-bank, row4 -> row8).
    ops8 = apply_rewrites(ops, ["merge_narrow8"])
    r8 = provenance_report(plan, ops8)
    assert r8["ok"], r8["issues"]
    max_g = max(o.attrs.get("g", 0) for o in ops8)
    assert max_g == 3, "row8 rewrite must re-tag g into 0..3"
    odd8 = [o for o in ops8
            if o.kind == "store" and ".odd.k" in o.tile_id
            and len(o.attrs.get("lanes", ())) == 8]
    assert odd8, "odd stores should be 8-lane after merge"
    print("OpIR slice OK: %d ops, coverage %.2f, negatives detected"
          % (r["op_count"], r["coverage"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
