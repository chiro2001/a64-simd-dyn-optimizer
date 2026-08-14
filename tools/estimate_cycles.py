#!/usr/bin/env python3
"""Estimate cycles for a dynamic QEMU trace with the resource lower-bound
cost model (optimizer/analysis/cost.py) and a measured target profile.

Usage:
  python3 tools/estimate_cycles.py <trace.log> <start_hex> <end_hex>
      [--profile k920b] [--json out.json]

Profiles: k920b (920B measured SVE1 throughput, VL=256; SVE2 ops use
proxy weights), n1 (NEON128 seed).
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.analysis.cost import (
    N1_PROFILE, K920B_PROFILE, K950_PROFILE, TargetProfile, cycles_lb)
from optimizer.mca_targets import target as mca_target
from parse_qemu_trace import is_vector, parse_exec


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace")
    ap.add_argument("start", help="symbol range start (hex)")
    ap.add_argument("end", help="symbol range end (hex)")
    ap.add_argument("--profile",
                    choices=("k920b", "k950", "n1", "920B", "NP1"),
                    default="NP1")
    ap.add_argument("--json", default=None)
    args = ap.parse_args()

    if args.profile in ("920B", "NP1"):
        tgt = mca_target(args.profile)
        profile = TargetProfile(tgt["name"], issue_rate=tgt["issue_rate"],
                                **tgt["throughput"])
    else:
        profile = {"k920b": K920B_PROFILE,
                   "k950": K950_PROFILE,
                   "n1": N1_PROFILE}[args.profile]
    insns = parse_exec(args.trace, int(args.start, 16), int(args.end, 16))
    hist = {}
    nvec = 0
    for i in insns:
        hist[i["mn"]] = hist.get(i["mn"], 0) + 1
        if is_vector(i):
            nvec += 1
    lb, bounds = cycles_lb(hist, profile)
    out = {
        "profile": profile.name,
        "total_insns": len(insns),
        "vector_insns": nvec,
        "hist": dict(sorted(hist.items(), key=lambda kv: -kv[1])),
        "class_counts": {k: v for k, v in bounds.items()},
        "resource_lb_cycles": lb,
        "frontend_bound": bounds.get("frontend", 0.0),
    }
    print(json.dumps(out, indent=1))
    if args.json:
        json.dump(out, open(args.json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
