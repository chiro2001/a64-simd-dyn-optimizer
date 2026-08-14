#!/usr/bin/env python3
"""CLI for optimizer/ir/loop_ir.py (docs/15 step 5)."""

import argparse
import json
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.ir.loop_ir import recover_trace, to_json


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--trace-log", required=True)
    ap.add_argument("--start", required=True)
    ap.add_argument("--end", required=True)
    ap.add_argument("--json", default=None)
    ap.add_argument("--full", action="store_true",
                    help="include instruction bodies in the output")
    args = ap.parse_args()

    loops, total = recover_trace(args.trace_log, args.start, args.end)
    out = to_json(loops, total, include_body=args.full)
    print(json.dumps({k: v for k, v in out.items() if k != "loops"}
                     or out, indent=1)[:200])
    for l in loops:
        ind = ",".join("%s%s%+d" % (i.op, i.reg, i.step)
                       for i in l.induction) or "-"
        mem = ",".join("%s[%s]" % (m.kind, m.base) for m in l.mem) or "-"
        print("loop@0x%x trip=%d period=%d depth=%d induction=%s mem=%s"
              % (l.branch, l.trip, l.period, l.depth, ind, mem))
    if args.json:
        json.dump(out, open(args.json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
