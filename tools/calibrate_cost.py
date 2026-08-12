#!/usr/bin/env python3
"""Fit the per-class cost weights against paired measurements.

Input: a JSON file with candidates = [{name, hist: {mnemonic: count},
<machine>: ticks_per_call}]. For each machine column a linear model
  ticks ~= sum_c w_c * count_c
is fitted (non-negative least squares via projected gradient), and the fit is
compared with a count-only model. This is the v0 calibration for the
docs/09 resource lower-bound cost model, not a vendor uarch model.

Usage:
  python3 tools/calibrate_cost.py <calibration-data.json>
"""

import json
import sys

import numpy as np

from optimizer.analysis.cost import CLASSES, classify


def fit_weights(counts, y):
    """Least squares on class counts, negatives clipped (v0 NNLS proxy)."""
    classes = sorted({c for hist in counts for c in classify(hist)})
    X = np.array([[classify(hist)[c] for c in classes] for hist in counts],
                 dtype=float)
    y = np.asarray(y, dtype=float)
    w, *_ = np.linalg.lstsq(X, y, rcond=None)
    w = np.maximum(w, 0.0)
    pred = X @ w
    ss_res = float(np.sum((pred - y) ** 2))
    ss_tot = float(np.sum((y - y.mean()) ** 2)) + 1e-12
    return classes, w, 1.0 - ss_res / ss_tot, pred


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    data = json.load(open(sys.argv[1]))
    cands = data["candidates"]
    machines = [k for k in cands[0] if k not in ("name", "hist")]
    for m in machines:
        counts = [c["hist"] for c in cands]
        y = [c[m] for c in cands]
        classes, w, r2, pred = fit_weights(counts, y)
        totals = [sum(h.values()) for h in counts]
        a = np.dot(np.asarray(totals, float), np.asarray(y, float)) \
            / np.dot(np.asarray(totals, float), np.asarray(totals, float))
        count_r2 = 1.0 - float(np.sum((np.asarray(totals) * a - np.asarray(y)) ** 2)) \
            / float(np.sum((np.asarray(y) - np.mean(y)) ** 2) + 1e-12)
        print("machine=%s" % m)
        print("  class model R2=%.3f; count-only R2=%.3f"
              % (r2, count_r2))
        for cname, wv in sorted(zip(classes, w), key=lambda p: -p[1]):
            print("    %-8s w=%.3f" % (cname, wv))
        for c, p, t in zip(cands, pred, y):
            print("    %-14s pred=%.2f meas=%.2f" % (c["name"], p, t))
    return 0


if __name__ == "__main__":
    sys.exit(main())
