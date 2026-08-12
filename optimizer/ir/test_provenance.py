#!/usr/bin/env python3
"""Regression: linearity guard for the SA8D 8x8 seed PackIR."""

import json
import sys

from optimizer.ir.provenance import LaneEvaluator


def main():
    path = sys.argv[1] if len(sys.argv) > 1 else \
        "experiments/m2-seed/imported/pack-ir.json"
    with open(path) as f:
        doc = json.load(f)
    ev = LaneEvaluator(doc["values"])
    fails = []
    nonlinear_inputs = set()
    for v in doc["values"]:
        for lane in v["lanes"]:
            # abs/sabd are the first nonlinear ops: their inputs must be
            # linear; umax legitimately operates on abs/sabd results.
            if lane.get("arith") in ("abs", "sabd"):
                for key in ("a", "b"):
                    if key in lane:
                        nonlinear_inputs.add(lane[key]["from"])
    for vid in sorted(nonlinear_inputs):
        if not ev.is_linear(vid):
            fails.append(vid)
    print("nonlinear-op inputs:", sorted(nonlinear_inputs))
    print("fails:", fails)
    return 1 if fails else 0


if __name__ == "__main__":
    sys.exit(main())
