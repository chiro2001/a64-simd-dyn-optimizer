#!/usr/bin/env python3
"""Reproducible operator-average audit for the AGO goal.

Three measures (docs/56):
  item-level : simple average over per-shape measured gains
  kernel-level: simple average over one representative gain per kernel
  weighted   : share-weighted average (shares from a perf profile)

Usage:
  python3 tools/operator_avg_audit.py [--best9]
"""

import argparse

# (kernel, representative gain, 920B perf share %)
# Gains: best8-era replay/microbench values (docs/56); shares from
# reports/e2e-best6b-perf-20260816.txt best8 injected 920B profile.
# The original 21.1% share table was not archived; the shares below are
# the best reconstruction (labeled RECON).
KERNEL_TABLE = [
    ("satd-8",         0.40, 2.21),
    ("interp8-vps",    0.55, 0.90),
    ("cost-c1c2-flag", 0.30, 0.60),
    ("cost-coeff-remain", 0.20, 0.40),
    ("cost-coeff-nxn", 0.097, 3.60),
    ("scan-pos-last",  0.27, 1.71),
    ("sa8d16",         0.00, 2.28),
]

# item-level: 39.1% is the archived aggregate from the 2026-08-16 audit
# (14 measured items: satd shapes / vps shapes / entropy family). The
# per-item gain table was not archived, so it is reported as-is.
ITEM_LEVEL_ARCHIVED = 0.391

# best9-era microbench updates (2026-08-16):
# cost-coeff-nxn: non-unroll 2.28 vs upstream 2.51 on 920B -> +10.1%
# (Yitian unroll 1.11 vs 1.23 -> +9.8%); sa8d16 vaddlv_seq ties.
KERNEL_TABLE_BEST9 = [
    ("satd-8",         0.40, 2.21),
    ("interp8-vps",    0.55, 0.90),
    ("cost-c1c2-flag", 0.30, 0.60),
    ("cost-coeff-remain", 0.20, 0.40),
    ("cost-coeff-nxn", 0.101, 3.60),
    ("scan-pos-last",  0.27, 1.71),
    ("sa8d16",         0.005, 2.28),
]


def report(table):
    kernel = [g for _, g, _ in table]
    shares = [s for _, _, s in table]
    kernel_avg = sum(kernel) / len(kernel)
    weighted = sum(g * s for (_, g, s), s in zip(table, shares)) / sum(shares)
    return kernel_avg, weighted


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--best9", action="store_true")
    args = ap.parse_args()
    table = KERNEL_TABLE_BEST9 if args.best9 else KERNEL_TABLE
    kernel_avg, weighted = report(table)
    print("kernel-level: %.1f%%" % (kernel_avg * 100))
    print("item-level:   %.1f%% (archived aggregate)" %
          (ITEM_LEVEL_ARCHIVED * 100))
    print("weighted:     %.1f%%" % (weighted * 100))
    print("\nper-kernel (gain, share%%, gain*share):")
    for name, g, s in table:
        print("  %-18s %5.1f%%  %4.2f  %6.3f"
              % (name, g * 100, s, g * s))


if __name__ == "__main__":
    main()
