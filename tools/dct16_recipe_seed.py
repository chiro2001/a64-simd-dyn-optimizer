#!/usr/bin/env python3
"""M1a/M1b: MachineIR 线共享常量矩阵检测 + 蝶形配方轴种子（dct16 试点）。

输入：m30 seed（experiments/m30-dct16-search/imported/machine-ir.json）。
常量源：配方库 G16（load 节点 const_name/const_off -> G16 行；试点实现，
通用版后续改 ELF/rodata 符号解析，见 docs/40 M1a2）。

输出：recipe-seed.json
  - hits：共享常量矩阵命中（consts/leaves）
  - rows：命中的 G16 行号与匹配变体（exact/rev/neg/revneg）
  - axis_seed：由检测事实推导的布局轴建议 + 每条证据

验收（docs/40 M1a/M1b）：命中数与 asm 线报告（39）一致或超集；轴种子
覆盖 699 组合的关键取值（pass1-quarter/legacy_semantics/narrow_merge/
even_sve）。
"""

import argparse
import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "analysis"))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from linearize import (  # noqa: E402
    lane_forms,
    resolve_const_loads,
    shared_constant_matrix_outputs,
)
from machine_ir import MachineIR  # noqa: E402
from dct16_op_ir import G16  # noqa: E402


def build_g16_tables():
    """g_t16 row k starts at byte offset 32*k; first half is G16[k]."""
    return {"_ZN4x2655g_t16E": {32 * k: list(G16[k]) for k in range(16)}}


def row_matches(c):
    """Return (row_k, variant) if c matches G16 row k."""
    n = len(c)
    for k in range(16):
        row = G16[k][:n]
        if c == row:
            return k, "exact"
        if c == [-x for x in reversed(row)]:
            return k, "revneg"
        if c == [-x for x in row]:
            return k, "neg"
        if c == list(reversed(row)):
            return k, "rev"
    return None, None


def classify_hit(hit):
    rows = []
    for c in hit["consts"]:
        k, var = row_matches(c)
        if k is not None:
            rows.append({"row": k, "variant": var, "const": c})
    splat = all(len(set(v)) == 1 for v in hit["consts"])
    kind = "odd" if any(r["row"] % 2 == 1 for r in rows) else (
        "even" if rows else "splat" if splat else "other")
    return rows, kind, splat


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--machine-ir", required=True,
                    help="imported machine-ir.json (m30 seed)")
    ap.add_argument("--out", required=True, help="recipe-seed.json path")
    ap.add_argument("--asm-report", default=None,
                    help="optional asm-line discovery report for comparison")
    args = ap.parse_args()

    doc = json.load(open(args.machine_ir))
    ir = MachineIR(function=doc.get("function"),
                   nodes=[dict(n) for n in doc["nodes"]])
    const_values = resolve_const_loads(ir, build_g16_tables())
    forms, symbolic = lane_forms(ir, const_values)
    hits = shared_constant_matrix_outputs(ir.nodes, forms)

    classified = []
    odd_rows = set()
    even_rows = set()
    splat_count = 0
    for h in hits:
        rows, kind, splat = classify_hit(h)
        if splat:
            splat_count += 1
        for r in rows:
            (odd_rows if r["row"] % 2 == 1 else even_rows).add(r["row"])
        classified.append({
            "node_id": h["node_id"],
            "mn": h["mn"],
            "consts": h["consts"],
            "rows": rows,
            "kind": kind,
            "splat": splat,
            "n_leaves": len(h["leaves"]),
        })

    axis_seed = {}
    evidence = []
    if odd_rows:
        axis_seed.update({
            "pass1": "quarter",
            "pass1_k_tile": 2,
            "pass2": "odd-quarter",
            "pass2_k_tile": 1,
            "legacy_semantics": 1,
        })
        evidence.append({
            "axis": "legacy_semantics=1/pass1-quarter",
            "reason": "detected %d odd-row shared-constant-matrix hits, rows %s"
                      % (len(odd_rows), sorted(odd_rows)),
            "hits": [c["node_id"] for c in classified if c["kind"] == "odd"],
        })
    if even_rows or splat_count:
        axis_seed.update({"narrow_merge": 1, "even_sve": 1})
        evidence.append({
            "axis": "narrow_merge=1/even_sve=1",
            "reason": "detected even-row/splat shared sums (rows %s, splat %d)"
                      % (sorted(even_rows), splat_count),
            "hits": [c["node_id"] for c in classified
                     if c["kind"] in ("even", "splat")],
        })

    report = {
        "kernel": "dct16",
        "family": "butterfly",
        "source": "machine-ir-line",
        "machine_ir": args.machine_ir,
        "hit_count": len(hits),
        "odd_rows": sorted(odd_rows),
        "even_rows": sorted(even_rows),
        "splat_count": splat_count,
        "axis_seed": axis_seed,
        "evidence": evidence,
        "hits": classified,
    }
    if args.asm_report:
        d = json.load(open(args.asm_report))
        report["asm_report"] = {
            "path": args.asm_report,
            "hit_count": len(d.get("hits", [])),
            "summary": d.get("summary", {}),
        }

    os.makedirs(os.path.dirname(os.path.abspath(args.out)), exist_ok=True)
    with open(args.out, "w") as f:
        json.dump(report, f, indent=1)

    print("hits=%d odd_rows=%s even_rows=%s splat=%d"
          % (len(hits), sorted(odd_rows), sorted(even_rows), splat_count))
    print("axis_seed=%s" % json.dumps(axis_seed, ensure_ascii=False))
    if args.asm_report:
        print("asm_report_hits=%d" % len(json.load(
            open(args.asm_report)).get("hits", [])))


if __name__ == "__main__":
    main()
