#!/usr/bin/env python3
"""Critical-path latency estimate over a dynamic QEMU trace.

Uses the register/stack dependency graph from
optimizer/analysis/critical_path.py, but consumes the dynamic --exec trace
(loop iterations included) instead of static objdump, and takes per-class
latency from the 920B/NP1 MCA targets (Neoverse-V2 reference, docs/26).

Usage:
  python3 tools/critical_path_dynamic.py <trace.log> <start_hex> <end_hex>
      [--target 920B|NP1] [--json out.json]
"""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.analysis.cost import CLASSES
from optimizer.analysis.critical_path import (
    MNEMONIC_LATENCY, estimate_critical_path)
from optimizer.mca_targets import target as mca_target
from parse_qemu_trace import parse_exec


def fmt_insns(insns):
    """Format dynamic insns like objdump without the 0x prefix (the
    dependency-graph parser expects `address: encoding mnemonic ops`)."""
    return "\n".join("%08x: 00000000  %s %s"
                     % (i["addr"], i["mn"], i["ops"]) for i in insns)


def latency_table(tgt):
    lat = dict(MNEMONIC_LATENCY)
    for cls, mns in CLASSES.items():
        if cls in tgt["latency"]:
            for mn in mns:
                lat[mn] = tgt["latency"][cls]
    return lat


def critical_path(trace, start, end, tgt):
    insns = parse_exec(trace, int(start, 16), int(end, 16))
    best, _, lines, _ = estimate_critical_path(
        fmt_insns(insns), latency_table(tgt))
    return best, len(insns), len(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace")
    ap.add_argument("start")
    ap.add_argument("end")
    ap.add_argument("--target", choices=("920B", "NP1"), default="NP1")
    ap.add_argument("--json", default=None)
    args = ap.parse_args()
    tgt = mca_target(args.target)
    cp, total, parsed = critical_path(args.trace, args.start, args.end, tgt)
    out = {"target": tgt["name"], "cp_cycles": cp,
           "total_insns": total, "parsed_insns": parsed}
    print(json.dumps(out, indent=1))
    if args.json:
        json.dump(out, open(args.json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
