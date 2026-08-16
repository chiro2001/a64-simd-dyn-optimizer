#!/usr/bin/env python3
"""Four-machine cost model calibration (long-term goal item).

Fits per-machine linear cost models (log1p(fused_uop) -> ticks /
ticks_pct) from the kernel-test-db: the M2 17-cover corpus supplies
per-instance ticks + fused_uop on N1/920B (34 rows), and the dct rows
supply ticks_pct on N1/710/920B.  Reports Spearman/R2/LOOCV honestly
(small-sample: no overclaim), and writes a per-machine cost table.

Usage: python3 tools/calibrate_machine_cost.py
"""

from __future__ import annotations

import csv
import math
import os
import statistics

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB = os.path.join(ROOT, "data", "kernel-test-db.csv")
OUT_MD = os.path.join(ROOT, "data", "machine-cost-model.md")
REPORT = os.path.join(ROOT, "reports", "machine-cost-calibration-20260817.txt")


def to_num(v):
    try:
        return float(v)
    except (TypeError, ValueError):
        return None


def spearman(x, y):
    n = len(x)
    if n < 3:
        return None
    def ranks(v):
        idx = sorted(range(n), key=lambda i: v[i])
        r = [0.0] * n
        i = 0
        while i < n:
            j = i
            while j + 1 < n and v[idx[j + 1]] == v[idx[i]]:
                j += 1
            avg = (i + j) / 2.0 + 1.0
            for k in range(i, j + 1):
                r[idx[k]] = avg
            i = j + 1
        return r
    rx, ry = ranks(x), ranks(y)
    mx, my = sum(rx) / n, sum(ry) / n
    num = sum((rx[i] - mx) * (ry[i] - my) for i in range(n))
    d1 = math.sqrt(sum((rx[i] - mx) ** 2 for i in range(n)))
    d2 = math.sqrt(sum((ry[i] - my) ** 2 for i in range(n)))
    return num / (d1 * d2) if d1 and d2 else None


def ols(x, y):
    n = len(x)
    if n < 3:
        return None
    mx, my = sum(x) / n, sum(y) / n
    num = sum((x[i] - mx) * (y[i] - my) for i in range(n))
    den = sum((x[i] - mx) ** 2 for i in range(n))
    if den == 0:
        return None
    b = num / den
    a = my - b * mx
    ss_tot = sum((y[i] - my) ** 2 for i in range(n))
    ss_res = sum((y[i] - (a + b * x[i])) ** 2 for i in range(n))
    r2 = 1 - ss_res / ss_tot if ss_tot else None
    return a, b, r2


def main():
    rows = list(csv.DictReader(open(DB)))
    ticks = {}   # machine -> (uop, ticks)
    pct = {}     # machine -> (uop, ticks_pct)
    for r in rows:
        uop = to_num(r.get("mca_fused_uop"))
        if uop is None:
            continue
        if r.get("kernel_metric") == "ticks":
            v = to_num(r.get("kernel_value"))
            if v is not None:
                ticks.setdefault(r["machine"], []).append((uop, v))
        elif r.get("kernel_metric") == "ticks_pct":
            v = to_num(r.get("kernel_value"))
            if v is not None:
                pct.setdefault(r["machine"], []).append((uop, v))

    lines = ["# 四机成本模型校准（2026-08-17）", "",
             "拟合：log1p(fused_uop) -> ticks / ticks_pct（OLS + "
             "Spearman + LOOCV）。数据：M2 17 cover（N1/920B ticks）"
             "与 dct 各机 kernel ticks_pct。小样本，仅作排序参考，"
             "不做绝对值承诺。", ""]
    md = ["# 机器成本表（2026-08-17）", "",
          "| machine | metric | rows | slope | intercept | R2 | "
          "Spearman | LOOCV-Spearman |", "| --- | --- | ---: | ---: | "
          "---: | ---: | ---: | ---: |"]
    for machine in sorted(set(list(ticks) + list(pct))):
        for metric, data in (("ticks", ticks.get(machine, [])),
                             ("ticks_pct", pct.get(machine, []))):
            if len(data) < 3:
                continue
            data.sort()
            x = [math.log1p(u) for u, _ in data]
            y = [v for _, v in data]
            fit = ols(x, y)
            sp = spearman(x, y)
            loo = []
            for i in range(len(x)):
                xs = x[:i] + x[i + 1:]
                ys = y[:i] + y[i + 1:]
                f = ols(xs, ys)
                if f:
                    pred = f[0] + f[1] * x[i]
                    loo.append((pred, y[i]))
            loo_sp = spearman([p for p, _ in loo], [v for _, v in loo]) \
                if len(loo) >= 3 else None
            line = ("%s | %s | %d | %.3f | %.3f | %.3f | %.3f | %s"
                    % (machine, metric, len(data),
                       fit[1] if fit else float("nan"),
                       fit[0] if fit else float("nan"),
                       fit[2] if fit else float("nan"),
                       sp if sp is not None else float("nan"),
                       "%.3f" % loo_sp if loo_sp is not None else "-"))
            md.append("| " + line + " |")
            lines.append("## %s / %s" % (machine, metric))
            lines.append("rows=%d slope=%.3f intercept=%.3f R2=%s "
                         "Spearman=%s LOOCV-Spearman=%s"
                         % (len(data),
                            fit[1] if fit else float("nan"),
                            fit[0] if fit else float("nan"),
                            "%.3f" % fit[2] if fit and fit[2] is not None
                            else "-",
                            "%.3f" % sp if sp is not None else "-",
                            "%.3f" % loo_sp if loo_sp is not None else "-"))
            lines.append("")
    lines += ["## 结论", "",
              "1. N1/920B 的 M2 ticks 语料给出每机成本斜率（正 = 更多 "
              "uop 更慢）与 LOOCV 排序质量；",
              "2. 710/920B 的 dct ticks_pct 行数少（3-4），仅报告 "
              "Spearman 不作拟合承诺；",
              "3. 950 缺 ticks 实测，待用户侧 950 数据后补表。",
              ""]
    os.makedirs(os.path.dirname(OUT_MD), exist_ok=True)
    os.makedirs(os.path.dirname(REPORT), exist_ok=True)
    with open(OUT_MD, "w") as f:
        f.write("\n".join(md) + "\n")
    with open(REPORT, "w") as f:
        f.write("\n".join(lines) + "\n")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
