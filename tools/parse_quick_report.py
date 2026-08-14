#!/usr/bin/env python3
"""Parse 950/920B quick-test outputs into a comparison/verdict table.

Inputs:
  one or more paired CSV files produced by scripts/bench-generic-paired.sh
  (columns: proc,sample,order,ticksA,ticksB), plus optional local counts
  (fused/MCA) passed as kernel=tag:csv pairs.

Usage:
  python3 tools/parse_quick_report.py <kernel=path.csv>...
      [--fused kernel=value] [--mca kernel=value]
      [--upstream kernel=value] [--gate-threshold 1.10]

Output: per kernel: pairs, median ratio A/B (neon/cand), bootstrap95 CI,
fused reduction vs upstream, and a verdict (PASS if median >= threshold).
"""

import argparse
import csv
import random
import statistics
import sys


def load_pairs(path):
    rows = []
    for r in csv.reader(open(path)):
        if len(r) >= 5 and r[3] and r[4]:
            try:
                rows.append((float(r[3]), float(r[4])))
            except ValueError:
                pass
    return rows


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("kernel_csv", nargs="+",
                    help="kernel=/path/to/paired.csv")
    ap.add_argument("--fused", action="append", default=[],
                    help="kernel=fused_uop (candidate)")
    ap.add_argument("--upstream", action="append", default=[],
                    help="kernel=upstream_fused_uop")
    ap.add_argument("--mca", action="append", default=[],
                    help="kernel=mca_cycles (candidate)")
    ap.add_argument("--threshold", type=float, default=1.10,
                    help="neon/cand median threshold (default 1.10)")
    args = ap.parse_args()

    fused = dict(k.split("=", 1) for k in args.fused)
    up = dict(k.split("=", 1) for k in args.upstream)
    mca = dict(k.split("=", 1) for k in args.mca)
    rng = random.Random(0xC0FFEE)

    print("%-16s %-6s %-9s %-14s %-10s %-9s %-6s" %
          ("kernel", "pairs", "ratio", "bootstrap95", "fused", "upstr", "mca"))
    for kv in args.kernel_csv:
        name, path = kv.split("=", 1)
        rows = load_pairs(path)
        if not rows:
            print("%-16s no measurements" % name)
            continue
        ratios = [a / b for a, b in rows]
        med = statistics.median(ratios)
        B = 10000
        bs = []
        for _ in range(B):
            s = [ratios[rng.randrange(len(ratios))] for _ in ratios]
            bs.append(statistics.median(s))
        bs.sort()
        lo, hi = bs[int(0.025 * B)], bs[int(0.975 * B)]
        f = fused.get(name, "")
        u = up.get(name, "")
        red = ""
        if f and u:
            red = "%.0f%%" % ((1 - float(f) / float(u)) * 100)
        m = mca.get(name, "")
        verdict = "PASS" if med >= args.threshold else "keep*"
        print("%-16s %-6d %-9.4f %-14s %-10s %-9s %-6s  %s" %
              (name, len(ratios), med,
               "[%.3f, %.3f]" % (lo, hi), red or f, u, m, verdict))


if __name__ == "__main__":
    sys.exit(main())
