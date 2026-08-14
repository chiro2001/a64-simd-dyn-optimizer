#!/usr/bin/env python3
"""M1a/M1b/M3a: MachineIR 线结构检测 + 族识别 + 配方轴种子。

输入：m30 seed（experiments/m30-dct16-search/imported/machine-ir.json）。
常量源（M1a2）：x265 源码 constants.cpp 解析出的 int16 常量表
（tools/extract_x265_constants.py），按 load 节点 const_name/const_off
取行并切片到 lane 数；不再依赖 dct16 专属 G16 硬编码。

输出：recipe-seed.json
  - family_hint：由引用的常量符号/指令形态推断结构族
    （butterfly / fir / diff-sum）
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
import re
import sys
from collections import Counter

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "analysis"))
sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))

from linearize import (  # noqa: E402
    lane_forms,
    resolve_const_loads,
    shared_constant_matrix_outputs,
)
from machine_ir import MachineIR  # noqa: E402
from extract_x265_constants import parse_int16_tables  # noqa: E402


def build_tables(tables):
    """{symbol: {byte_offset: [values]}} with x265 mangled symbol names."""
    out = {}
    for name, t in tables.items():
        mangled = "_ZN4x265%d%sE" % (len(name), name)
        out[mangled] = t["offsets"]
    return out


def row_matches(c, rows):
    """Return (row_k, variant) if c matches a row (prefix/reverse/neg)."""
    n = len(c)
    for k, row in enumerate(rows):
        row = row[:n]
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
        k, var = row_matches(c, _ROW_SOURCE)
        if k is not None:
            rows.append({"row": k, "variant": var, "const": c})
    splat = all(len(set(v)) == 1 for v in hit["consts"])
    kind = "odd" if any(r["row"] % 2 == 1 for r in rows) else (
        "even" if rows else "splat" if splat else "other")
    return rows, kind, splat


def family_hint(nodes):
    """Infer the structure family from referenced constants + intrinsics.

    butterfly: g_t8/g_t16/g_t32 referenced (const_name or addr GEP);
    fir: g_lumaFilter/g_chromaFilter referenced or sdot+sqrshrun mix;
    diff-sum: sabd/abs/uaddlv/saddlv/umax without filter constants.
    """
    const_names = [n.get("const_name") for n in nodes if n.get("const_name")]
    addr_text = " ".join(n.get("rhs", "") for n in nodes
                         if n.get("op") == "addr")
    intr = Counter(n.get("intrinsic") for n in nodes
                   if n.get("op") == "intrinsic")
    all_text = " ".join(const_names) + " " + addr_text
    families = []
    if any(s in all_text for s in ("g_t16", "g_t8", "g_t32")):
        families.append("butterfly")
    if any(s in all_text for s in ("g_lumaFilter", "g_chromaFilter")):
        families.append("fir")
    if intr.get("umull") and intr.get("sqrshrun") and \
            not any(i in intr for i in ("sabd", "abs", "uaddlv")):
        families.append("fir-vertical")
    if any(i in intr for i in ("sabd", "abs", "uaddlv", "saddlv", "umax")):
        families.append("diff-sum")
    if intr.get("sdot") and intr.get("sqrshrun"):
        families.append("fir")
    return sorted(set(families)), dict(intr)


def detect_fir(nodes, tables):
    """FIR sliding-window facts: taps, phases, sdot/tbl/narrow counts."""
    intr = Counter(n.get("intrinsic") for n in nodes
                   if n.get("op") == "intrinsic")
    addr_text = " ".join(n.get("rhs", "") for n in nodes
                         if n.get("op") == "addr")
    filter_sym = "g_lumaFilter" if "g_lumaFilter" in addr_text else (
        "g_chromaFilter" if "g_chromaFilter" in addr_text else None)
    phases = taps = None
    if filter_sym and filter_sym in tables:
        t = tables[filter_sym]
        phases, taps = t["n_rows"], t["row_len"]
    # window rows: distinct byte offsets in GEPs on the src base
    offs = set()
    for n in nodes:
        if n.get("op") == "addr" and "%0" in n.get("rhs", ""):
            m = re.search(r"i64\s+(-?\d+)", n["rhs"])
            if m:
                offs.add(int(m.group(1)))
    return {
        "filter": filter_sym,
        "phases": phases,
        "taps": taps,
        "sdot": intr.get("sdot", 0),
        "udot": intr.get("udot", 0),
        "tbl": intr.get("tbl1", 0),
        "narrow": next((k for k in ("sqrshrun", "rshrn", "sqrshrunb")
                        if intr.get(k)), None),
        "src_offsets": sorted(offs),
        "window_rows": len(offs),
    }


def detect_diff_sum(nodes):
    """Abs-diff + reduction facts: diff/abs/reduce ops."""
    intr = Counter(n.get("intrinsic") for n in nodes
                   if n.get("op") == "intrinsic")
    reduce = next((k for k in ("uaddlv", "saddlv", "addv", "addp")
                   if intr.get(k)), None)
    return {
        "diff": intr.get("sabd", 0) or intr.get("abd", 0),
        "abs": intr.get("abs", 0),
        "max": intr.get("umax", 0),
        "reduce": reduce,
        "sve_reduce": intr.get("uaddv", 0) or intr.get("saddv", 0),
    }


def axis_seed_for(family, structure):
    """Knowledge-layer mapping: structure facts -> search axes."""
    if family == "butterfly":
        return {"pass1": "quarter", "pass1_k_tile": 2,
                "pass2": "odd-quarter", "pass2_k_tile": 1,
                "legacy_semantics": 1, "narrow_merge": 1, "even_sve": 1}
    if family == "fir":
        seed = {"compute": ["sdot-h"], "pairsum": ["addp"]}
        if structure.get("taps") == 4:
            seed["compute"] = ["sdot-h"]
        return seed
    if family == "fir-vertical":
        return {"acc_split": [1, 2]}
    if family == "diff-sum":
        if structure.get("sve_reduce"):
            return {"reduce": ["sve"], "reduce_tail": ["saddv"]}
        return {"reduce": ["sve"], "reduce_tail": ["saddv", "dot-uaddv"]}
    return {}


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--machine-ir", required=True,
                    help="imported machine-ir.json (m30 seed)")
    ap.add_argument("--out", required=True, help="recipe-seed.json path")
    ap.add_argument("--asm-report", default=None,
                    help="optional asm-line discovery report for comparison")
    ap.add_argument("--const-tables", default=None,
                    help="JSON from tools/extract_x265_constants.py; "
                         "default: auto-parse x265 constants.cpp")
    ap.add_argument("--x265-cpp", default=None,
                    help="path to x265 constants.cpp (auto-detected)")
    args = ap.parse_args()

    global _ROW_SOURCE
    if args.const_tables:
        tables = json.load(open(args.const_tables))
    else:
        cpp = args.x265_cpp or os.path.join(
            ROOT, "third_party/x265/source/common/constants.cpp")
        tables = parse_int16_tables(open(cpp).read())
    g16 = tables.get("g_t16", {})
    _ROW_SOURCE = g16.get("rows", [])
    doc = json.load(open(args.machine_ir))
    ir = MachineIR(function=doc.get("function"),
                   nodes=[dict(n) for n in doc["nodes"]])
    fam, intr = family_hint(ir.nodes)
    structure = {}
    if "fir" in fam:
        structure = detect_fir(ir.nodes, tables)
    elif "diff-sum" in fam:
        structure = detect_diff_sum(ir.nodes)
    const_values = resolve_const_loads(ir, build_tables(tables))
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
    if not axis_seed and fam:
        axis_seed = axis_seed_for(fam[0], structure)

    report = {
        "kernel": "dct16",
        "family": "butterfly",
        "family_hint": fam,
        "structure": structure,
        "intrinsics": intr,
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
    print("family_hint=%s" % fam)
    if structure:
        print("structure=%s" % json.dumps(structure, ensure_ascii=False))
    print("axis_seed=%s" % json.dumps(axis_seed, ensure_ascii=False))
    if args.asm_report:
        print("asm_report_hits=%d" % len(json.load(
            open(args.asm_report)).get("hits", [])))


if __name__ == "__main__":
    main()
