#!/usr/bin/env python3
"""M4 independent declaration checker (round-0026 gate).

Gate: AGO bundle (best9-minus-remain + dct IR, docs/73) does not
regress on any of the four machines (N1/920B/710/950), AND at least
two machines show an extra >=0.5pp over best9-noremain, both with
bootstrap95 CI excluding 0.

Reads kernel-test-db rows (frozen-set e2e_100f_pct + increment rows);
950 is pending until the user runs scripts/freeze-950-dct.sh.  A
missing machine is reported as pending, not as a pass/fail.

Usage: python3 tools/m4_declaration.py [--require-950]
"""

from __future__ import annotations

import argparse
import csv
import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DB = os.path.join(ROOT, "data", "kernel-test-db.csv")
OUT = os.path.join(ROOT, "reports", "m4-declaration-20260817.txt")

MACHINES = ["N1", "920B", "710", "950"]


def to_num(v):
    try:
        return float(v)
    except (TypeError, ValueError):
        return None


def parse_ci(s):
    """Parse 'a..b' (ms) into (lo, hi) or None."""
    m = re.match(r"\s*(-?[\d.]+)\s*\.\.\s*(-?[\d.]+)", s or "")
    if not m:
        return None
    return float(m.group(1)), float(m.group(2))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--require-950", action="store_true")
    args = ap.parse_args()
    rows = list(csv.DictReader(open(DB)))

    freeze = {}   # machine -> (pct, ci)
    incr = {}     # machine -> (pct, ci)
    for r in rows:
        if r.get("kernel") == "best9-noremain-ir-dct" and \
                r.get("e2e_100f_pct"):
            m = r["machine"]
            if m and m not in freeze:
                freeze[m] = (to_num(r["e2e_100f_pct"]),
                             parse_ci(r.get("e2e_ci_ms")))
        if r.get("kernel") == "ir-dct-on-noremain" and \
                r.get("e2e_100f_pct"):
            m = r["machine"]
            if m and m not in incr:
                incr[m] = (to_num(r["e2e_100f_pct"]),
                           parse_ci(r.get("e2e_ci_ms")))

    lines = ["# M4 独立声明核验（2026-08-17）", "",
             "门：四机冻结集均不回退（e2e% < 0 且 CI 不含 0），且至少"
             "两机相对 best9-noremain 额外 >=0.5pp（CI 不含 0）。",
             "",
             "| machine | 冻结集 e2e% | CI(ms) | 不回退 | 增量% | "
             "CI(ms) | >=0.5pp |", "| --- | ---: | --- | --- | ---: | "
             "--- | --- |"]
    ok_no_regress = []
    ok_extra = []
    pending = []
    for m in MACHINES:
        f = freeze.get(m)
        i = incr.get(m)
        if not f:
            pending.append(m)
            lines.append("| %s | - | - | 待测 | - | - | - |" % m)
            continue
        pct, ci = f
        noreg = pct < 0 and ci is not None and not (ci[0] <= 0 <= ci[1])
        if noreg:
            ok_no_regress.append(m)
        epct, eci = (i if i else (None, None))
        extra = (epct is not None and epct <= -0.5 and
                 eci is not None and not (eci[0] <= 0 <= eci[1]))
        if extra:
            ok_extra.append(m)
        lines.append("| %s | %.2f%% | [%.1f, %.1f] | %s | %s | %s | %s |"
                     % (m, pct, ci[0], ci[1], "yes" if noreg else "NO",
                        "%.2f%%" % epct if epct is not None else "-",
                        "[%.1f, %.1f]" % eci if eci else "-",
                        "yes" if extra else "no"))

    lines += ["", "不回退机器：%s (%d/4)" %
              (", ".join(ok_no_regress), len(ok_no_regress)),
              "额外>=0.5pp 机器：%s (%d/2)" %
              (", ".join(ok_extra), len(ok_extra)),
              "待测：%s" % (", ".join(pending) if pending else "-"), ""]
    if pending and not args.require_950:
        verdict = ("INCOMPLETE: %s 待用户侧 950 运行"
                   "（FROZEN=1 scripts/freeze-950-dct.sh）后重新核验"
                   % ", ".join(pending))
    elif len(ok_no_regress) == 4 and len(ok_extra) >= 2:
        verdict = "M4 GATE MET: 四机不回退 + 至少两机额外 >=0.5pp"
    else:
        verdict = "M4 GATE NOT MET"
    lines.append("判定：" + verdict)
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    with open(OUT, "w") as f:
        f.write("\n".join(lines) + "\n")
    print("\n".join(lines))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
