#!/usr/bin/env python3
"""Compare the official ARM A64 ISA catalog with the project's semantic
instruction DB and produce a per-feature coverage report.

Usage:
    python3 tools/isa_coverage_report.py \
        --catalog experiments/m7-isa-coverage/isa-catalog.json \
        --db isa/aarch64/instructions.yaml \
        --out experiments/m7-isa-coverage
"""

import argparse
import json
import re
from collections import Counter, defaultdict
from pathlib import Path

import yaml


SIMD_CLASSES = {"advsimd", "sve", "sve2"}
LEVELS = ["neon", "dotprod", "i8mm", "sve", "sve_i8mm", "sve2",
          "sve2p1", "sve2p2", "sve2p3", "sve2_bitperm"]


def load_catalog(path):
    return json.loads(Path(path).read_text())


def load_db(path):
    return yaml.safe_load(Path(path).read_text())["instructions"]


def simd_filtered(insns):
    out = []
    for i in insns:
        if i["instr_class"] in SIMD_CLASSES:
            out.append(i)
    return out


def missing_groups(insns):
    """Group out-of-model SIMD instructions by the features they require."""
    groups = defaultdict(list)
    for i in insns:
        if i["feature_level"] != "needs-other-features":
            continue
        unknown = i.get("unknown_features") or []
        key = " + ".join(unknown)
        groups[key].append(i)
    return groups


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--catalog", required=True)
    ap.add_argument("--db", required=True)
    ap.add_argument("--out", required=True)
    args = ap.parse_args()

    catalog = load_catalog(args.catalog)
    db = load_db(args.db)
    simd = simd_filtered(catalog["instructions"])

    # DB index: (feature, mnemonic) -> entries.
    db_index = defaultdict(list)
    for insn in db:
        asm = (insn.get("asm") or "").upper()
        if asm and asm != "NULL":
            requires = insn.get("requires", {})
            if insn["feature"] == "sve" and requires.get("i8mm"):
                level = "sve_i8mm"
            else:
                level = insn["feature"]
            db_index[(level, asm)].append(insn)

    by_level = defaultdict(list)
    for i in simd:
        by_level[i["feature_level"]].append(i)

    covered_ids = set()
    covered_mnemonics = defaultdict(set)
    missing_ids = defaultdict(list)
    for level in LEVELS:
        for insn in by_level.get(level, []):
            mnem = (insn["mnemonic"] or "").upper()
            hits = db_index.get((level, mnem), [])
            if hits:
                covered_ids.add(insn["id"])
                covered_mnemonics[level].add(mnem)
            else:
                missing_ids[level].append(insn)

    rows = []
    for level in LEVELS:
        total = len(by_level.get(level, []))
        mnems = sorted({(i["mnemonic"] or "").upper()
                        for i in by_level.get(level, [])})
        rows.append({
            "level": level,
            "official_instructions": total,
            "official_mnemonics": len(mnems),
            "db_mnemonics_covered": len(covered_mnemonics.get(level, set())),
            "ids_covered": len([x for x in by_level.get(level, [])
                                if x["id"] in covered_ids]),
            "ids_missing": len(missing_ids.get(level, [])),
        })

    other_groups = missing_groups(simd)
    other_rows = []
    for key in sorted(other_groups):
        other_rows.append({"requires": key, "count": len(other_groups[key])})

    out_dir = Path(args.out)
    out_dir.mkdir(parents=True, exist_ok=True)

    # JSON report.
    report = {
        "source": catalog.get("source", "unknown"),
        "db": str(args.db),
        "scoped_simd_count": len(simd),
        "by_level": rows,
        "out_of_model_simd": other_rows,
        "missing": {
            level: [
                {"id": i["id"], "mnemonic": i["mnemonic"], "asm": i["asm"]}
                for i in missing_ids.get(level, [])
            ]
            for level in LEVELS
        },
    }
    (out_dir / "coverage-report.json").write_text(
        json.dumps(report, indent=1))

    # Markdown report.
    lines = [
        "# AArch64 SIMD 指令覆盖报告（vs 官方 ISA XML）",
        "",
        f"数据源：`{report['source']}`（A64 A-profile）",
        f"解析范围：`instr-class ∈ advsimd / sve / sve2`，共 {len(simd)} 条指令。",
        "",
        "## 按特性级别统计",
        "",
        "| 级别 | 官方指令数 | 官方助记符数 | 语义库覆盖助记符 | 语义库覆盖指令 | 缺口指令 |",
        "|---|---:|---:|---:|---:|---:|",
    ]
    for r in rows:
        lines.append(
            f"| {r['level']} | {r['official_instructions']} | "
            f"{r['official_mnemonics']} | {r['db_mnemonics_covered']} | "
            f"{r['ids_covered']} | {r['ids_missing']} |")

    lines += [
        "",
        "> “语义库覆盖指令”目前按助记符（asm）匹配；同一助记符（如 ADD、TRN1）",
        "> 的多种 lane/元素布局尚未逐条绑定，因此该数字是上界。",
        "",
        "## 当前模型之外的 SIMD 指令",
        "",
        "这些指令因特性不在 TargetFeatures 中（FP16/BF16/加密/SME 等）而被归类为",
        "“needs-other-features”，不影响 NEON/SVE/SVE2 整数优化，但扩展目标模型时需覆盖：",
        "",
        "| 所需特性组合 | 指令数 |",
        "|---|---:|",
    ]
    for r in other_rows:
        lines.append(f"| {r['requires']} | {r['count']} |")

    lines += [
        "",
        "## 各级别缺口明细",
        "",
    ]
    for level in LEVELS:
        miss = missing_ids.get(level, [])
        lines.append(f"### {level}（缺口 {len(miss)} 条）")
        lines.append("")
        if not miss:
            lines.append("无缺口。")
            lines.append("")
            continue
        lines.append("| 官方 id | 助记符 | 汇编形式 |")
        lines.append("|---|---|---|")
        for i in miss[:200]:
            asm = (i["asm"] or "").replace("|", "\\|")
            lines.append(f"| `{i['id']}` | {i['mnemonic']} | `{asm}` |")
        lines.append("")

    (out_dir / "coverage-report.md").write_text("\n".join(lines))
    print(f"report written to {out_dir}")
    for r in rows:
        print(f"{r['level']:14s} official={r['official_instructions']:4d} "
              f"mnemonics={r['official_mnemonics']:4d} "
              f"db_mnemonics={r['db_mnemonics_covered']:3d} "
              f"missing={r['ids_missing']:4d}")


if __name__ == "__main__":
    main()
