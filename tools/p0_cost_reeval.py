#!/usr/bin/env python3
"""P0 one-shot cost-model credibility revalidation (round-0007).

With the fixed dependency graph (MLA accumulator chains, d/q/v/s/h/b and
w/x register aliasing, ldp double destinations), compute four low-level
features per candidate:

    cp       - longest forward latency path (seed mnemonic latencies)
    issue    - resource-class weighted op count (mul/add/permute/narrow/...)
    frontend - total decoded instructions / issue width
    spill    - stack-relative vector/scalar store+load instruction count

Fit a small non-negative linear combination per machine and report
leave-one-out and leave-one-structure-out Spearman plus top-3 hit rate.

Gate (round-0007 decision): both machines must reach Spearman >= 0.7 on the
held-out protocol and top-3 predicted must contain >= 2 measured top-3.
Failure means the automatic fine ranking is permanently cancelled and the
search falls back to safe/static Pareto coarse filtering + measure-all.

Usage:
  python3 tools/p0_cost_reeval.py <measurements.json> name:disasm:struct ...
"""

import json
import sys

import numpy as np

from optimizer.analysis.cost import CLASSES, classify, parse_disasm_hist
from optimizer.analysis.critical_path import estimate_critical_path


ISSUE_WIDTH = 4.0


def spearman(xs, ys):
    if len(xs) < 2:
        return 0.0
    rx = np.argsort(np.argsort(np.asarray(xs, dtype=float)))
    ry = np.argsort(np.argsort(np.asarray(ys, dtype=float)))
    return float(np.corrcoef(rx, ry)[0, 1])


def features(text):
    cp, _, _, _ = estimate_critical_path(text)
    hist = parse_disasm_hist(text)
    cls = classify(hist)
    issue = sum(cls.values())
    frontend = sum(hist.values()) / ISSUE_WIDTH
    spill = 0
    for line in text.splitlines():
        if "sp," in line and ("[sp" in line or ", [sp" in line):
            mn = line.split()[2] if len(line.split()) > 2 else ""
            if mn.startswith(("str", "stp", "stur", "st1",
                              "ldr", "ldp", "ldur", "ld1")):
                spill += 1
    return [cp, issue, frontend, spill]


def fit(feats, y):
    X = np.asarray(feats, dtype=float)
    y = np.asarray(y, dtype=float)
    w, *_ = np.linalg.lstsq(X, y, rcond=None)
    return np.maximum(w, 0.0)


def top3_hit(preds, meas):
    top = set(np.argsort(np.asarray(meas, dtype=float))[:3])
    return len(set(np.argsort(np.asarray(preds, dtype=float))[:3]) & top)


def main():
    if len(sys.argv) < 5:
        print(__doc__)
        return 2
    data = json.load(open(sys.argv[1]))
    cands = data["candidates"]
    specs = sys.argv[2:]

    names = []
    structs = []
    texts = {}
    for spec in specs:
        name, path, struct = spec.split(":")
        names.append(name)
        structs.append(struct)
        texts[name] = open(path).read()

    # dedupe final .text: identical instruction streams share one structure
    sig = {}
    for n, t in texts.items():
        body = "\n".join(l.split("\t", 1)[-1] for l in t.splitlines()
                         if ":\t" in l)
        sig.setdefault(body, []).append(n)
    print("distinct .text bodies: %d" % len(sig))
    for k, ns in sig.items():
        if len(ns) > 1:
            print("  identical: %s" % ", ".join(ns))

    for machine in ("n1", "920b"):
        meas = [float(cands[n][machine]) for n in names]
        feats = [features(texts[n]) for n in names]
        w = fit(feats, meas)
        full_pred = np.asarray(feats) @ w
        print("machine=%s weights=%s" % (machine, np.round(w, 3)))
        print("  full  spearman=%.3f top3hit=%d"
              % (spearman(full_pred, meas), top3_hit(full_pred, meas)))

        loo_pred, loo_struct_pred = [], []
        for k in range(len(names)):
            idx = [j for j in range(len(names)) if j != k]
            loo_pred.append(np.asarray(feats[k]) @ fit([feats[j] for j in idx],
                                                       [meas[j] for j in idx]))
            grp = [j for j in range(len(names)) if structs[j] != structs[k]]
            loo_struct_pred.append(
                np.asarray(feats[k]) @ fit([feats[j] for j in grp],
                                           [meas[j] for j in grp]))
        print("  loocv spearman=%.3f top3hit=%d"
              % (spearman(loo_pred, meas), top3_hit(loo_pred, meas)))
        print("  struct-out spearman=%.3f top3hit=%d"
              % (spearman(loo_struct_pred, meas),
                 top3_hit(loo_struct_pred, meas)))
        for n, p, q, m in zip(names, full_pred, loo_pred, meas):
            print("    %-12s full=%8.1f loo=%8.1f meas=%8.1f"
                  % (n, p, q, m))

    return 0


if __name__ == "__main__":
    sys.exit(main())
