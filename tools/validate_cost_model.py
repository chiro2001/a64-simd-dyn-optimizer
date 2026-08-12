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


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        return 2
    fit = json.load(open(sys.argv[1]))
    w = dict(zip(fit["mnemonics"], fit["weights"]))
    names, preds, meas = [], [], []
    for spec in sys.argv[2:]:
        name, path, ticks = spec.split(":")
        text = open(path).read()
        comp = path_composition(text)
        names.append(name)
        preds.append(sum(w.get(m, 0) * n for m, n in comp.items()))
        meas.append(float(ticks))
    total = [sum(parse_inst(l)[0] and 1 or 0
                 for l in open(spec.split(":")[1]).read().splitlines()
                 if parse_inst(l))
             for spec in sys.argv[2:]]
    rho = spearman(preds, meas)
    rho_count = spearman(total, meas)
    print("candidate  pred    meas    total_insns")
    for n, p, m, t in zip(names, preds, meas, total):
        print("  %-12s %7.2f %7.2f %8d" % (n, p, m, t))
    print("spearman(pred, meas)=%.3f  spearman(total_insns, meas)=%.3f"
          % (rho, rho_count))
    return 0


if __name__ == "__main__":
    sys.exit(main())
