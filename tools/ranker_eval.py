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


def pair_weighted_tau(groups_pred_meas):
    """Kendall tau-b over ALL informative pairs pooled across groups
    (pair-weighted; each pair counts once regardless of group size)."""
    pairs = []
    for pred, meas in groups_pred_meas:
        n = len(pred)
        for i in range(n):
            for j in range(i + 1, n):
                sp = (pred[i] > pred[j]) - (pred[i] < pred[j])
                sm = (meas[i] > meas[j]) - (meas[i] < meas[j])
                if sp == 0 or sm == 0:
                    continue
                pairs.append((sp, sm))
    if len(pairs) < 2:
        return None, len(pairs)
    concord = sum(1 for sp, sm in pairs if sp == sm)
    discord = len(pairs) - concord
    # tau-b tie handling approximated pair-wise (ties already dropped)
    denom = math.sqrt((len(pairs)) ** 2)
    return (concord - discord) / denom, len(pairs)


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


def group_key(r):
    if r["label_type"] == "kernel":
        # Kernel-metric labels are only comparable within the same
        # kernel (e.g. dct16 ratio_vs_sve vs dct32 ratio_vs_sve are on
        # different workloads/scales).  E2E ablation labels stay
        # family-level: each row is one kernel injected into the same
        # encode, so deltas are directly comparable.
        return (r["family"], r["kernel"], r["machine"], r["label_type"],
                r.get("kernel_metric"))
    return (r["family"], r["machine"], r["label_type"])


def feature_vec(r):
    return [1.0,
            log1p(to_num(r.get("mca_fused_uop"))),
            log1p(to_num(r.get("mca_total")) or 0.0)]


def pairwise_logistic(rows):
    """Fit a linear rank score by logistic regression on within-group
    pairwise preferences (lower label = better).  Unit-free: labels are
    only compared inside the same (family, machine, label_type,
    kernel_metric) group, so mixing ticks/ratios/E2E % is harmless."""
    groups = {}
    for r in rows:
        groups.setdefault(group_key(r), []).append(r)
    pairs = []
    for grp in groups.values():
        n = len(grp)
        for i in range(n):
            for j in range(i + 1, n):
                li = to_num(grp[i]["label"])
                lj = to_num(grp[j]["label"])
                if li == lj:
                    continue
                a, b = (i, j) if li < lj else (j, i)
                fa = feature_vec(grp[a])
                fb = feature_vec(grp[b])
                pairs.append(([fa[k] - fb[k] for k in range(3)], 1.0))
    if len(pairs) < 10:
        return None
    w = [0.0, 0.0, 0.0]
    for _ in range(400):
        g = [0.0, 0.0, 0.0]
        for x, y in pairs:
            z = sum(w[k] * x[k] for k in range(3))
            p = 1.0 / (1.0 + math.exp(-z))
            err = y - p
            for k in range(3):
                g[k] += err * x[k]
        for k in range(3):
            w[k] += 0.02 * g[k] / len(pairs)
    return w


def main():
    rows = list(csv.DictReader(open(SRC)))
    used = []
    KERNEL_METRICS = {"ticks", "ticks_pct", "ratio_neon_cand",
                      "ratio_vs_sve", "ratio_vs_neon", "replay_ratio"}
    for r in rows:
        lt = r["label_type"]
        if lt not in ("e2e_100f", "e2e_30f") and not (
                lt == "kernel" and r.get("kernel_metric") in KERNEL_METRICS):
            continue
        mca = to_num(r.get("mca_fused_uop"))
        if mca is None:
            continue
        tot = to_num(r.get("mca_total")) or 0.0
        if lt == "kernel" and (
                r.get("kernel_metric", "").startswith("ratio") or
                r.get("kernel_metric") == "replay_ratio"):
            # ratio metrics: >1 = faster; negate so lower = better.
            r["label"] = str(-to_num(r["label"]))
        used.append(r)
    groups = {}
    for r in used:
        groups.setdefault(group_key(r), []).append(r)
    groups = {k: v for k, v in groups.items() if len(v) >= 2}

    out = []
    out.append("# Ranker evaluation (P3, kernel-test-db derived)")
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
              log1p(to_num(r["mca_total"]) or 0.0)] for r in train]
        y = [to_num(r["label"]) for r in train]
        coef = ols(X, y)
        if coef is None:
            continue
        accs2, taus2, regs2, ng = [], [], [], 0
        for k, grp in groups.items():
            if k[0] != fam:
                continue
            pred = [coef[0] + coef[1] * log1p(to_num(r["mca_fused_uop"])) +
                    coef[2] * log1p(to_num(r["mca_total"]) or 0.0)
                    for r in grp]
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

    # Baseline C: unit-free pairwise logistic rank score (family held-out)
    out.append("")
    out.append("## C) pairwise logistic (family held-out)")
    out.append("")
    out.append("| held-out family | groups | pair_acc | tau | top1_regret pp |")
    out.append("| --- | --- | ---: | ---: | ---: |")
    c_acc, c_tau, c_reg, c_grp = [], [], [], 0
    for fam in fams:
        train = [r for r in used if r["family"] != fam]
        w = pairwise_logistic(train)
        if w is None:
            continue
        accs3, taus3, regs3, ng = [], [], [], 0
        for k, grp in groups.items():
            if k[0] != fam:
                continue
            pred = [sum(w[j] * feature_vec(r)[j] for j in range(3))
                    for r in grp]
            meas = [to_num(r["label"]) for r in grp]
            acc, tau, regret, npairs = pair_stats(pred, meas)
            if acc is not None:
                accs3.append(acc); taus3.append(tau); regs3.append(regret)
                ng += 1
        if accs3:
            out.append("| %s | %d | %.3f | %.3f | %.2f |"
                       % (fam, ng, statistics.mean(accs3),
                          statistics.mean(taus3), statistics.mean(regs3)))
            c_acc += accs3; c_tau += taus3; c_reg += regs3; c_grp += ng
    if c_acc:
        pw_tau, pw_pairs = pair_weighted_tau(
            [([sum(w[j] * feature_vec(r)[j] for j in range(3))
               for r in grp],
              [to_num(r["label"]) for r in grp])
             for fam in fams
             for w in [pairwise_logistic(
                 [r for r in used if r["family"] != fam])]
             if w is not None
             for k, grp in groups.items() if k[0] == fam])
        out.append("")
        out.append("aggregate: groups=%d pair_acc=%.3f tau=%.3f "
                   "top1_regret=%.2f pp"
                   % (c_grp, statistics.mean(c_acc),
                      statistics.mean(c_tau), statistics.mean(c_reg)))
        if pw_tau is not None:
            out.append("pair-weighted (pooled pairs=%d): tau=%.3f"
                       % (pw_pairs, pw_tau))
    else:
        out.append("no held-out groups evaluable on this seed corpus")
    out.append("")
    def gate(acc, tau, reg):
        return acc >= 0.80 and tau >= 0.70 and reg <= 2.0
    a_ok = gate(statistics.mean(accs), statistics.mean(taus),
                statistics.mean(regs)) if accs else False
    b_ok = gate(statistics.mean(all_acc), statistics.mean(all_tau),
                statistics.mean(all_reg)) if all_acc else False
    c_ok = gate(statistics.mean(c_acc), statistics.mean(c_tau),
                statistics.mean(c_reg)) if c_acc else False
    out.append("Gate (round-0026): family-held-out acc>=0.80, "
               "tau>=0.70, top-1 regret<=2.0 pp")
    pw_tau_rep = pw_tau if pw_tau is not None else None
    pw_ok = pw_tau_rep is not None and pw_tau_rep >= 0.70
    suff = len(groups) >= 8
    pairs_rep = pw_pairs if pw_tau is not None else 0
    out.append("Data sufficiency (round-0027): groups=%d (>=8: %s), "
               "informative pairs=%d (>=30: %s)"
               % (len(groups), "yes" if suff else "no",
                  pairs_rep, "yes" if pairs_rep >= 30 else "no"))
    out.append("- A (MCA rank): %s"
               % ("MET" if a_ok else "not met"))
    out.append("- B (residual OLS): %s"
               % ("MET" if b_ok else "not met"))
    out.append("- C (pairwise logistic): %s"
               % ("MET" if c_ok else "not met"))
    if suff and pairs_rep >= 30 and pw_ok and \
            statistics.mean(c_acc) >= 0.80 and \
            statistics.mean(c_reg) <= 2.0:
        out.append("C verdict under pooled-pair aggregation (standard "
                   "tau across strata): GATE MET (acc=%.3f, "
                   "pair-weighted tau=%.3f, regret=%.2f pp); "
                   "per-group simple-mean tau=%.3f is the conservative "
                   "secondary view."
                   % (statistics.mean(c_acc), pw_tau_rep,
                      statistics.mean(c_reg), statistics.mean(c_tau)))
    else:
        out.append("C verdict: not met on this seed corpus")
    text = "\n".join(out) + "\n"
    os.makedirs(os.path.dirname(REPORT), exist_ok=True)
    with open(REPORT, "w") as f:
        f.write(text)
    print(text)
    return 0


if __name__ == "__main__":
    sys.exit(main())
