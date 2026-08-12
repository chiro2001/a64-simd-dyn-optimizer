#!/usr/bin/env python3
"""Validate the calibrated critical-path cost model on held-out candidates.

For one machine: load the fitted mnemonic weights (tools/critical_path.py
--fit output), predict each candidate's cost as the dot product of its
longest-path mnemonic composition with the weights, and report the Spearman
rank correlation against measured ticks. A high correlation outside the
fit set means the model generalizes; a weak one means the critical-path
term needs refinement (e.g. per-lane latency groups).

Usage:
  python3 tools/validate_cost_model.py <fitted.json> \
      'name:disasm.txt:measured' ...
"""

import json
import sys

import numpy as np

from optimizer.analysis.critical_path import estimate_critical_path, \
    parse_inst


def spearman(xs, ys):
    def rank(v):
        order = sorted(range(len(v)), key=lambda i: v[i])
        r = [0] * len(v)
        for i, idx in enumerate(order):
            r[idx] = i
        return r
    rx, ry = rank(xs), rank(ys)
    n = len(xs)
    if n < 2:
        return 1.0
    d2 = sum((a - b) ** 2 for a, b in zip(rx, ry))
    return 1.0 - 6.0 * d2 / (n * (n * n - 1))


def path_composition(text):
    _, dist, lines, preds = estimate_critical_path(text)
    i = max(range(len(dist)), key=dist.__getitem__)
    comp = {}
    while True:
        mn = parse_inst(lines[i])[0]
        comp[mn] = comp.get(mn, 0) + 1
        if preds[i]:
            i = max(preds[i], key=dist.__getitem__)
        else:
            break
    return comp


def fit_weights(comps, ticks):
    mnems = sorted({m for c in comps for m in c})
    X = np.array([[c.get(m, 0) for m in mnems] for c in comps],
                 dtype=float)
    y = np.asarray(ticks, dtype=float)
    w, *_ = np.linalg.lstsq(X, y, rcond=None)
    w = np.maximum(w, 0.01)
    return mnems, w


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        return 2
    args = sys.argv[1:]
    loocv = "--loocv" in args
    args = [a for a in args if a != "--loocv"]
    fit = json.load(open(args[0]))
    w = dict(zip(fit["mnemonics"], fit["weights"]))
    names, preds, meas = [], [], []
    specs = args[1:]
    comps = []
    for spec in specs:
        name, path, ticks = spec.split(":")
        text = open(path).read()
        comp = path_composition(text)
        names.append(name)
        comps.append(comp)
        preds.append(sum(w.get(m, 0) * n for m, n in comp.items()))
        meas.append(float(ticks))
    total = [sum(parse_inst(l)[0] and 1 or 0
                 for l in open(spec.split(":")[1]).read().splitlines()
                 if parse_inst(l))
             for spec in specs]
    rho = spearman(preds, meas)
    rho_count = spearman(total, meas)
    if loocv:
        loo = []
        for k in range(len(specs)):
            idx = [j for j in range(len(specs)) if j != k]
            mnems, wv = fit_weights([comps[j] for j in idx],
                                    [meas[j] for j in idx])
            loo.append(sum(wv[mnems.index(m)] * n
                           for m, n in comps[k].items()
                           if m in mnems))
        rho_loo = spearman(loo, meas)
        r2 = 1.0 - float(np.sum((np.asarray(loo) - np.asarray(meas)) ** 2)) \
            / float(np.sum((np.asarray(meas) - np.mean(meas)) ** 2) + 1e-12)
        print("LOOCV  candidate  full_pred   loo_pred      meas total_insns")
        for n, p, q, m, t in zip(names, preds, loo, meas, total):
            print("  %-12s %10.2f %10.2f %9.2f %8d"
                  % (n, p, q, m, t))
        print("spearman(full_pred, meas)=%.3f  "
              "spearman(loo_pred, meas)=%.3f  loo_R2=%.3f  "
              "spearman(total_insns, meas)=%.3f"
              % (rho, rho_loo, r2, rho_count))
    else:
        print("candidate  pred    meas    total_insns")
        for n, p, m, t in zip(names, preds, meas, total):
            print("  %-12s %7.2f %7.2f %8d" % (n, p, m, t))
        print("spearman(pred, meas)=%.3f  spearman(total_insns, meas)=%.3f"
              % (rho, rho_count))
    return 0


if __name__ == "__main__":
    sys.exit(main())
