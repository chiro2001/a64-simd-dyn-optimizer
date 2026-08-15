#!/usr/bin/env python3
"""Paired median-difference bootstrap CI for two time series.

Usage: paired_ci.py baseline_ms.txt optimized_ms.txt [runs]
Input files: one measurement per line (ms). Prints median diff and 95% CI.
"""
import random
import statistics
import sys


def load(p):
    return [float(x) for x in open(p) if x.strip()]


def main():
    if len(sys.argv) < 3:
        sys.exit("usage: paired_ci.py base.txt opt.txt [runs=10000]")
    base = load(sys.argv[1])
    opt = load(sys.argv[2])
    runs = int(sys.argv[3]) if len(sys.argv) > 3 else 10000
    if len(base) != len(opt) or len(base) < 3:
        sys.exit("need equal-length series with >=3 samples")
    n = len(base)
    diffs = [b - o for b, o in zip(base, opt)]
    md = statistics.median(diffs)
    rng = random.Random(0xB057)
    bs = []
    for _ in range(runs):
        s = [diffs[rng.randrange(n)] for _ in diffs]
        bs.append(statistics.median(s))
    bs.sort()
    lo, hi = bs[int(0.025 * runs)], bs[int(0.975 * runs)]
    base_m, opt_m = statistics.median(base), statistics.median(opt)
    print("base_median=%.1f opt_median=%.1f diff_ms=%.1f (%.2f%%) "
          "bootstrap95=[%.1f, %.1f] ms" %
          (base_m, opt_m, md, 100.0 * md / base_m, lo, hi))
    return 0


if __name__ == "__main__":
    sys.exit(main())
