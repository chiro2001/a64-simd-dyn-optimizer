#!/usr/bin/env python3
"""Calibrate per-instruction-class MCA weights against 950 real ratios.

Model: cycles_k = SUM_c w_c * count_kc (dynamic stream, VL=256).
Real data (docs/35): ivpp16 1.123, ivpp32 1.132, dct8 1.483 (neon/cand).
Weights start from the NV2 latency profile (optimizer/mca_targets.py) and
fit multiplicative class factors with L2 regularization toward 1.

Usage:
  python3 tools/calibrate_mca_950.py --json samples.json [--out profile.json]

samples.json:
  {"ivpp16": {"cand": {"log": "...", "start": "0x...", "end": "0x..."},
              "up": {...}, "ratio": 1.123}, ...}
"""

import argparse
import json
import math
import re
import subprocess
import sys

sys.path.insert(0, ".")
from optimizer.analysis.cost import CLASSES  # noqa: E402
from optimizer.mca_targets import NV2_LATENCY  # noqa: E402


def objdump_map(binary, start, end):
    out = subprocess.run(["aarch64-linux-gnu-objdump", "-d", binary],
                         capture_output=True, text=True).stdout
    table = {}
    for line in out.splitlines():
        m = re.match(r"\s+([0-9a-f]+):\s+[0-9a-f]+\s+([a-z0-9.]+)", line)
        if m:
            a = int(m.group(1), 16)
            if start <= a < end:
                table[a] = m.group(2)
    return table


def hist_from_trace(log, binary, start, end):
    table = objdump_map(binary, start, end)
    tr = re.compile(r"^Trace \d+: .*\[[^\]/]*/([0-9a-f]+)/")
    hist = {}
    for line in open(log):
        m = tr.match(line)
        if m:
            a = int(m.group(1), 16)
            mn = table.get(a)
            if mn:
                hist[mn] = hist.get(mn, 0) + 1
    return hist


def classify(hist):
    out = {}
    for mn, n in hist.items():
        for cls, mns in CLASSES.items():
            if mn in mns:
                out[cls] = out.get(cls, 0) + n
                break
        else:
            out["scalar"] = out.get("scalar", 0) + n
    return out


BASE = {
    "dot": NV2_LATENCY["dot"],
    "mul": NV2_LATENCY["mul"],
    "add": NV2_LATENCY["add"],
    "permute": NV2_LATENCY["permute"],
    "narrow": NV2_LATENCY["narrow"],
    "load": NV2_LATENCY["load"],
    "store": NV2_LATENCY["store"],
    "shift": NV2_LATENCY["shift"],
    "scalar": 1.0,
}
CLASSES_USED = list(BASE)


def predict(hist, weights):
    return sum(weights.get(c, 1.0) * hist.get(c, 0) for c in CLASSES_USED)


def fit(samples, groups):
    """Fit multiplicative factors per weight group (L2-reg via simple
    coordinate/grid search; dataset is tiny)."""
    # grid over group factors on log scale
    best = None
    best_err = 1e18
    import itertools
    vals = [round(10 ** (i / 4.0), 3) for i in range(-8, 9)]  # 0.1..10
    for combo in itertools.product(vals, repeat=len(groups)):
        f = dict(zip(groups, combo))
        weights = {}
        for c in CLASSES_USED:
            if c == "scalar":
                weights[c] = 1.0
                continue
            g = next(g for g, members in groups.items() if c in members)
            weights[c] = BASE[c] * f[g]
        err = 0.0
        for k, s in samples.items():
            cc = predict(s["cand_hist"], weights)
            cu = predict(s["up_hist"], weights)
            if cc <= 0 or cu <= 0:
                err += 1e9
                continue
            pred = cu / cc
            err += (math.log(pred) - math.log(s["ratio"])) ** 2
        # regularization toward 1
        err += 0.01 * sum((math.log(f[g])) ** 2 for g in groups)
        if err < best_err:
            best_err = err
            best = f
    return best, best_err


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--json", required=True)
    ap.add_argument("--out", default="build/mca-950-profile.json")
    args = ap.parse_args()
    cfg = json.load(open(args.json))
    samples = {}
    for k, s in cfg.items():
        cand = hist_from_trace(s["cand"]["log"], s["cand"]["bin"],
                               int(s["cand"]["start"], 16),
                               int(s["cand"]["end"], 16))
        up = hist_from_trace(s["up"]["log"], s["up"]["bin"],
                             int(s["up"]["start"], 16),
                             int(s["up"]["end"], 16))
        samples[k] = {"cand_hist": classify(cand), "up_hist": classify(up),
                      "ratio": s["ratio"]}
    print("%-8s %8s %8s %8s" % ("kernel", "base", "real", "resid%"))
    for k, s in samples.items():
        pred = (predict(s["up_hist"], BASE) /
                max(predict(s["cand_hist"], BASE), 1e-9))
        print("%-8s %8.3f %8.3f %7.1f%%"
              % (k, pred, s["ratio"], (pred / s["ratio"] - 1) * 100))
    # Fit 3 groups: compute(dot/mul/add/narrow/shift), permute, mem(load/store),
    # scalar fixed.
    groups = {
        "compute": ["dot", "mul", "add", "narrow", "shift"],
        "permute": ["permute"],
        "mem": ["load", "store"],
    }
    f, err = fit(samples, groups)
    print("fitted factors:", f, "err=%.5f" % err)
    weights = {}
    for c in CLASSES_USED:
        if c == "scalar":
            continue  # scalar weight stays 1.0
        g = next(g for g, members in groups.items() if c in members)
        weights[c] = BASE[c] * f[g]
    weights["scalar"] = 1.0
    print("fitted weights:", weights)
    print("%-8s %8s %8s %8s" % ("kernel", "fitted", "real", "resid%"))
    for k, s in samples.items():
        pred = (predict(s["up_hist"], weights) /
                max(predict(s["cand_hist"], weights), 1e-9))
        print("%-8s %8.3f %8.3f %7.1f%%"
              % (k, pred, s["ratio"], (pred / s["ratio"] - 1) * 100))
    json.dump({"base": BASE, "factors": f, "weights": weights,
               "samples": list(samples)},
              open(args.out, "w"), indent=1)
    print("wrote", args.out)


if __name__ == "__main__":
    sys.exit(main())
