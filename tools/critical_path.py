#!/usr/bin/env python3
"""Print the critical-path latency estimate for a disassembly text file.

Usage:
  aarch64-linux-gnu-objdump -d f.o | python3 tools/critical_path.py -
  python3 tools/critical_path.py <disasm.txt> [<disasm2.txt> ...]
  python3 tools/critical_path.py --fit 'name:tick,name:tick' <disasm...>

--fit fits per-mnemonic latencies so that each candidate's longest-path cost
approximates its measured ticks; this calibrates the seed table per machine.
"""

import collections
import sys

import numpy as np

from optimizer.analysis.critical_path import MNEMONIC_LATENCY, parse_inst, \
    estimate_critical_path, load_mnemonic_hist


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    chain = "--chain" in sys.argv
    fit = None
    out_path = None
    argv = sys.argv[1:]
    for a in sys.argv[1:]:
        if a.startswith("--fit="):
            fit = a.split("=", 1)[1]
        elif a == "--out":
            out_path = sys.argv[sys.argv.index(a) + 1]
    paths = [p for p in argv
             if not p.startswith("--") and p != "-"
             and p != out_path]
    if "-" in argv:
        paths.insert(0, "-")
    if fit:
        specs = [s.split(":") for s in fit.split(",")]
        ticks = {name: float(t) for name, t in specs}
        texts = {}
        for path, (name, t) in zip(paths, specs):
            texts[name] = sys.stdin.read() if path == "-" \
                else open(path).read()
        # longest-path mnemonic composition per candidate
        rows = {}
        mnems = set()
        for name, text in texts.items():
            _, dist, lines, preds = estimate_critical_path(text)
            i = max(range(len(dist)), key=dist.__getitem__)
            comp = collections.Counter()
            while True:
                comp[parse_inst(lines[i])[0]] += 1
                if preds[i]:
                    i = max(preds[i], key=dist.__getitem__)
                else:
                    break
            rows[name] = comp
            mnems |= set(comp)
        mnems = sorted(mnems)
        names = [n for n, _ in specs]
        X = np.array([[rows[n].get(m, 0) for m in mnems] for n in names],
                     dtype=float)
        y = np.array([ticks[n] for n in names], dtype=float)
        w, *_ = np.linalg.lstsq(X, y, rcond=None)
        w = np.maximum(w, 0.01)
        pred = X @ w
        print("fitted latencies:")
        for m, wv in sorted(zip(mnems, w), key=lambda p: -p[1]):
            print("   %-8s %.2f (seed %.1f)" % (m, wv,
                                                MNEMONIC_LATENCY.get(m, 1)))
        print("pred/meas:")
        for n, p, t in zip(names, pred, y):
            print("   %-14s pred=%.2f meas=%.2f" % (n, p, t))
        ss = float(np.sum((pred - y) ** 2))
        sst = float(np.sum((y - y.mean()) ** 2)) + 1e-9
        print("R2=%.3f" % (1 - ss / sst))
        import json
        if out_path:
            json.dump({"mnemonics": mnems,
                       "weights": [float(x) for x in w],
                       "names": names, "pred": [float(x) for x in pred],
                       "meas": [float(x) for x in y],
                       "r2": float(1 - ss / sst)},
                      open(out_path, "w"), indent=1)
        return 0
    for path in paths:
        text = sys.stdin.read() if path == "-" else open(path).read()
        cp, dist, lines, preds = estimate_critical_path(text)
        hist = load_mnemonic_hist(text)
        print("%-24s critical_path=%.1f instructions=%d"
              % (path, cp, sum(hist.values())))
        if chain:
            i = max(range(len(dist)), key=dist.__getitem__)
            path = []
            while True:
                path.append(lines[i].strip())
                if preds[i]:
                    i = max(preds[i], key=dist.__getitem__)
                else:
                    break
            for step in reversed(path[:24]):
                print("   ", step)
    return 0


if __name__ == "__main__":
    sys.exit(main())
