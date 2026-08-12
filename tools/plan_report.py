#!/usr/bin/env python3
"""Coverage/plan report: MachineIR patterns vs target feature sets.

Usage: python3 tools/plan_report.py <machine-ir.json> [out.json]
"""

import json
import sys

from optimizer.ir.machine_ir import MachineIR
from optimizer.ir.patterns import extract_patterns, summarize
from optimizer.targets.aarch64.features import TargetFeatures
from optimizer.targets.aarch64.select import load_db, match


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    with open(sys.argv[1]) as f:
        doc = json.load(f)
    ir = MachineIR(function=doc["function"], nodes=doc["nodes"])
    patterns = extract_patterns(ir)
    db = load_db()
    targets = {
        "neon128": TargetFeatures.neon128(),
        "sve2-vl256": TargetFeatures.sve2_vl256(),
        "sve2p3-vl256": TargetFeatures.sve2p3_vl256(),
    }
    summary = summarize(patterns)
    report = {
        "patterns": {("%s:%sx%s" % k): v for k, v in summary.items()},
        "targets": {},
    }
    for tname, feats in targets.items():
        plan = []
        for p in patterns:
            cands = [i["id"] for i in match(db, p, feats)]
            plan.append({"pattern": p, "candidates": cands})
        gaps = [p for p, c in
                ((x["pattern"], x["candidates"]) for x in plan)
                if not c]
        report["targets"][tname] = {
            "covered_pattern_count": len(plan) - len(gaps),
            "gap_patterns": [dict(p) for p in gaps],
            "plan": plan,
        }
    if len(sys.argv) > 2:
        with open(sys.argv[2], "w") as f:
            json.dump(report, f, indent=2, sort_keys=True)
    print(json.dumps({t: {"covered": v["covered_pattern_count"],
                          "gaps": [g["op"] for g in v["gap_patterns"]]}
                      for t, v in report["targets"].items()},
                     indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
