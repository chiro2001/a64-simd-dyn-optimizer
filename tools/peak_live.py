#!/usr/bin/env python3
"""Peak Z-register liveness of a dynamic SVE stream (round-0017 P1).

Reports peak concurrent live Z registers and live-area over the executed
kernel body, using a simple use-then-def model (predicates excluded).

Usage:
  python3 tools/peak_live.py <trace.log> <start_hex> <end_hex>
      [--fix-driver <driver>] [--json out.json]
"""

import argparse
import json
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from fix_dynamic_trace import parse_exec_fixed  # noqa: E402


ZRE = re.compile(r"\bz(\d+)")

READ_ONLY_FIRST = {"st1h", "st1w", "st1d", "str", "stp"}
LOAD_MN = {"ld1h", "ld1w", "ld1d", "ld1sh", "ld1sw", "ldr", "ld1b",
           "ld1sb", "ld2h", "ld2w", "ld2d", "ld1rqh", "ld1rqw", "ld1rqd"}
MOVPRFX = {"movprfx"}


def z_operands(ops):
    return [int(m) for m in ZRE.findall(ops)]


def peak_live(insns):
    live = set()
    peak = 0
    area = 0
    per_mn = {}
    for i in insns:
        mn = i["mn"]
        zs = z_operands(i["ops"])
        if mn in READ_ONLY_FIRST:
            uses, defs = zs, []
        elif mn in LOAD_MN:
            uses, defs = zs[1:], zs[:1]
        elif mn in MOVPRFX:
            uses, defs = [], zs[:1]
        else:
            uses, defs = zs[1:], zs[:1]
        for u in uses:
            live.discard(u)
        for d in defs:
            live.add(d)
        n = len(live)
        peak = max(peak, n)
        area += n
        per_mn[mn] = max(per_mn.get(mn, 0), n)
    return peak, area, per_mn


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace")
    ap.add_argument("start")
    ap.add_argument("end")
    ap.add_argument("--fix-driver", default=None)
    ap.add_argument("--json", default=None)
    args = ap.parse_args()
    start, end = int(args.start, 16), int(args.end, 16)
    if args.fix_driver:
        insns, _ = parse_exec_fixed(args.trace, start, end,
                                    args.fix_driver)
    else:
        from parse_qemu_trace import parse_exec
        insns = parse_exec(args.trace, start, end)
    peak, area, per_mn = peak_live(insns)
    out = {"insns": len(insns), "peak_live_z": peak,
           "live_area": area, "per_mn_peak": per_mn}
    print(json.dumps(out, indent=1))
    if args.json:
        json.dump(out, open(args.json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
