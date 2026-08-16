#!/usr/bin/env python3
"""Export kernel-test-db rows as a flat ranker training set (P3 prep).

One training row per machine measurement label: a DB row may carry an
E2E 100f %, an E2E 30f % AND a kernel metric at once; each numeric
label becomes its own training row (E2E 100f first, then 30f, then
kernel).  Rows marked INVALID are skipped.
Output: data/ranker-training.csv.

Usage:
  python3 tools/export_ranker_data.py
"""

import csv
import os
import re
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
SRC = os.path.join(ROOT, "data", "kernel-test-db.csv")
OUT = os.path.join(ROOT, "data", "ranker-training.csv")

FEATURES = ["family", "kernel", "variant", "input_isa", "output_isa",
            "mca_fused_uop", "mca_total", "machine"]


def to_num(v):
    if not v:
        return None
    m = re.search(r"[-+]?\d+(?:\.\d+)?", v)
    return float(m.group(0)) if m else None


def main():
    rows = list(csv.DictReader(open(SRC)))
    out = []
    for r in rows:
        if "INVALID" in (r.get("e2e_ci_ms") or "").upper():
            continue
        if not r.get("machine"):
            continue
        emitted = False
        for ltype, key in (("e2e_100f", "e2e_100f_pct"),
                           ("e2e_30f", "e2e_30f_pct"),
                           ("kernel", "kernel_value")):
            if ltype.startswith("e2e") and \
                    "INVALID" in (r.get("e2e_ci_ms") or "").upper():
                continue
            v = to_num(r.get(key))
            if v is None:
                continue
            row = {f: (r.get(f) or "") for f in FEATURES}
            row.update(label=v, label_type=ltype,
                       kernel_metric=r.get("kernel_metric") or "",
                       bit_exact=r.get("bit_exact") or "",
                       report=r.get("report") or "")
            out.append(row)
            emitted = True
        if not emitted and r.get("machine") and \
                any(to_num(r.get(k)) is not None
                    for k in ("e2e_100f_pct", "e2e_30f_pct",
                              "kernel_value")):
            # machine row with no parseable label: keep it out, but
            # let the count reflect the skip reason in the caller.
            pass
    os.makedirs(os.path.dirname(OUT), exist_ok=True)
    fields = FEATURES + ["label", "label_type", "kernel_metric",
                         "bit_exact", "report"]
    with open(OUT, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields, extrasaction="ignore")
        w.writeheader()
        w.writerows(out)
    print("wrote %s (%d rows)" % (OUT, len(out)))
    return 0


if __name__ == "__main__":
    sys.exit(main())
