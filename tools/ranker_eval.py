#!/usr/bin/env python3
"""P3 ranker evaluation harness (family held-out, stdlib only).

Baselines on data/ranker-training.csv:
  A) MCA rank: order candidates within (family, machine, label_type) by
     mca_fused_uop ascending.
  B) residual OLS: log1p(mca) linear model trained on all other
     families, applied to the held-out family.
Metrics: pair accuracy, Kendall tau-b, top-1 regret (pp; positive =
predicted best is slower than actual best). Rows without MCA features
are abstained (coverage reported).

Usage:
  python3 tools/ranker_eval.py [report.txt]
"""

import csv
import itertools
import math
import os
import sys
import statistics

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "data", "ranker-training.csv")
REPORT = sys.argv[1] if len(sys.argv) > 1 else os.path.join(
    ROOT, "reports", "ranker-baseline-20260816.txt")


def to_num(v):
    try:
        return float(v)
    except (TypeError, ValueError):
        return None


def log1p(x):
    return math.log1p(max(x, 0.0))


def kendall_tau_b(x, y):
    n = len(x)
    if n < 2:
        return 0.0
    concord = discord = tx = ty = 0
    for i in range(n):
        for j in range(i + 1, n):
            sx = (x[i] > x[j]) - (x[i] < x[j])
            sy = (y[i] > y[j]) - (y[i] < y[j])
            concord += sx * sy > 0
            discord += sx * sy < 0
            tx += sx == 0 and sy != 0
            ty += sy == 0 and sx != 0
    denom = math.sqrt((n * (n - 1) / 2 - tx) *
                      (n * (n - 1) / 2 - ty))
    return (concord - discord) / denom if denom else 0.0


def pair_stats(pred_vals, meas_vals):
    """pred/meas: lower = better (fewer ops / more negative E2E %)."""
    n = len(pred_vals)
    acc_num = acc_den = 0
    for i in range(n):
        for j in range(i + 1, n):
            dp = (pred_vals[i] > pred_vals[j]) - (pred_vals[i] < pred_vals[j])
            dm = (meas_vals[i] > meas_vals[j]) - (meas_vals[i] < meas_vals[j])
            if dp == 0 or dm == 0:
                continue
            acc_den += 1
            acc_num += dp == dm
    acc = acc_num / acc_den if acc_den else None
    tau = kendall_tau_b(pred_vals, meas_vals)
    ib = min(range(n), key=lambda k: meas_vals[k])
    ip = min(range(n), key=lambda k: pred_vals[k])
    regret = meas_vals[ip] - meas_vals[ib]
    return acc, tau, regret, acc_den


def ols(features, labels):
    """Least squares with intercept on feature rows (list of lists)."""
    n, p = len(features), len(features[0]) + 1
    if n < p:
        return None
    X = [[1.0] + list(f) for f in features]
    Xt = [[X[i][j] for i in range(n)] for j in range(p)]
    A = [[sum(Xt[k][i] * X[i][j] for i in range(n)) for j in range(p)]
         for k in range(p)]
    b = [sum(Xt[k][i] * labels[i] for i in range(n)) for k in range(p)]
    # Gaussian elimination
    M = [A[i] + [b[i]] for i in range(p)]
    for col in range(p):
        piv = max(range(col, p), key=lambda r: abs(M[r][col]))
        if abs(M[piv][col]) < 1e-12:
            return None
        M[col], M[piv] = M[piv], M[col]
        for r in range(col + 1, p):
            f = M[r][col] / M[col][col]
            for c in range(col, p + 1):
                M[r][c] -= f * M[col][c]
    coef = [0.0] * p
    for r in range(p - 1, -1, -1):
        coef[r] = (M[r][p] - sum(M[r][c] * coef[c]
                                 for c in range(r + 1, p))) / M[r][r]
    return coef


def main():
    rows = list(csv.DictReader(open(SRC)))
    used = []
    KERNEL_METRICS = {"ticks_pct", "ratio_neon_cand", "ratio_vs_sve",
                      "ratio_vs_neon", "replay_ratio"}
    for r in rows:
        lt = r["label_type"]
        if lt not in ("e2e_100f", "e2e_30f") and not (
                lt == "kernel" and r.get("kernel_metric") in KERNEL_METRICS):
            continue
        mca = to_num(r.get("mca_fused_uop"))
        tot = to_num(r.get("mca_total"))
        if mca is None or tot is None:
            continue
        if lt == "kernel" and (
                r.get("kernel_metric", "").startswith("ratio") or
                r.get("kernel_metric") == "replay_ratio"):
            # ratio metrics: >1 = faster; negate so lower = better.
            r["label"] = str(-to_num(r["label"]))
        used.append(r)
    def key(r):
        if r["label_type"] == "kernel":
            return (r["family"], r["machine"], r["label_type"],
                    r.get("kernel_metric"))
        return (r["family"], r["machine"], r["label_type"])
    groups = {}
    for r in used:
        groups.setdefault(key(r), []).append(r)
    groups = {k: v for k, v in groups.items() if len(v) >= 2}

    out = []
    out.append("# Ranker baseline (round-0026 P3a, 2026-08-16)")
    out.append("")
    out.append("Data: data/ranker-training.csv; rows with label and "
               "MCA features (incl. kernel metrics): %d/%d; groups: %d"
               % (len(used), len(rows), len(groups)))
    out.append("")

    # Baseline A: MCA rank (fewer fused_uop = better)
    accs, taus, regs = [], [], []
    for k, grp in groups.items():
        pred = [to_num(r["mca_fused_uop"]) for r in grp]
        meas = [to_num(r["label"]) for r in grp]
        acc, tau, regret, npairs = pair_stats(pred, meas)
        if acc is not None:
            accs.append(acc); taus.append(tau); regs.append(regret)
    out.append("## A) MCA rank baseline")
    out.append("")
    if accs:
        out.append("groups=%d pair_acc=%.3f tau=%.3f top1_regret=%.2f pp"
                   % (len(accs), statistics.mean(accs),
                      statistics.mean(taus), statistics.mean(regs)))
    else:
        out.append("no evaluable groups: need >=2 candidates with MCA + "
                   "E2E label per (family, machine, label_type)")
    out.append("")

    # Baseline B: residual OLS, family held-out
    fams = sorted({r["family"] for r in used})
    out.append("## B) residual OLS (family held-out)")
    out.append("")
    out.append("| held-out family | groups | pair_acc | tau | top1_regret pp |")
    out.append("| --- | --- | ---: | ---: | ---: |")
    all_acc, all_tau, all_reg, all_grp = [], [], [], 0
    for fam in fams:
        train = [r for r in used if r["family"] != fam]
        if len(train) < 3:
            continue
        X = [[log1p(to_num(r["mca_fused_uop"])),
              log1p(to_num(r["mca_total"]))] for r in train]
        y = [to_num(r["label"]) for r in train]
        coef = ols(X, y)
        if coef is None:
            continue
        accs2, taus2, regs2, ng = [], [], [], 0
        for k, grp in groups.items():
            if k[0] != fam:
                continue
            pred = [coef[0] + coef[1] * log1p(to_num(r["mca_fused_uop"])) +
                    coef[2] * log1p(to_num(r["mca_total"])) for r in grp]
            meas = [to_num(r["label"]) for r in grp]
            acc, tau, regret, npairs = pair_stats(pred, meas)
            if acc is not None:
                accs2.append(acc); taus2.append(tau); regs2.append(regret)
                ng += 1
        if accs2:
            out.append("| %s | %d | %.3f | %.3f | %.2f |"
                       % (fam, ng, statistics.mean(accs2),
                          statistics.mean(taus2), statistics.mean(regs2)))
            all_acc += accs2; all_tau += taus2; all_reg += regs2
            all_grp += ng
    if all_acc:
        out.append("")
        out.append("aggregate: groups=%d pair_acc=%.3f tau=%.3f "
                   "top1_regret=%.2f pp"
                   % (all_grp, statistics.mean(all_acc),
                      statistics.mean(all_tau), statistics.mean(all_reg)))
    else:
        out.append("no held-out groups evaluable on this seed corpus")
    out.append("")
    out.append("Gate (round-0026): family-held-out acc>=0.80, tau>=0.70, "
               "top-1 regret<=2.0 pp - NOT met yet on this seed corpus.")
    text = "\n".join(out) + "\n"
    os.makedirs(os.path.dirname(REPORT), exist_ok=True)
    with open(REPORT, "w") as f:
        f.write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
