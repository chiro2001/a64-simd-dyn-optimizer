#!/usr/bin/env python3
"""扫描全部 kernel 候选，计算 permute_depth_ratio 并输出排名。

用法:
  python3 tools/scan_permute_ratio.py [--march armv8.2-a+sve2]
                                      [--filter interp8]
                                      [--threshold 0.30]
                                      [--out reports/scan-*.txt]

输出按 permute_depth_ratio 降序排列的表格，标记超过阈值的候选
（需要 950 实测验证的优先目标）。
"""

import argparse
import os
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tools"))

from static_counts import static_counts  # noqa: E402

CC = os.environ.get("CROSS_CC", "aarch64-linux-gnu-g++")
OBJDUMP = os.environ.get("OBJDUMP", "aarch64-linux-gnu-objdump")


def find_candidates(filter_str=None):
    """查找全部 kernel 候选 best_*.cpp 文件（跳过 proto_ 等原型）。"""
    cands_dir = ROOT / "kernels"
    results = []
    for path in sorted(cands_dir.rglob("candidates/best_*.cpp")):
        rel = str(path.relative_to(ROOT))
        if filter_str and filter_str not in rel:
            continue
        results.append((rel, str(path)))
    return results


def compile_and_count(cpp_path, march, tmpdir):
    """编译候选并计算 static_counts。返回 dict 或 None（编译失败）。"""
    obj_path = os.path.join(tmpdir, "scan.o")
    try:
        r = subprocess.run(
            [CC, "-O3", "-march=" + march, "-c", cpp_path, "-o", obj_path],
            capture_output=True, text=True, timeout=120)
    except subprocess.TimeoutExpired:
        return {"compile_error": "timeout (>120s)"}
    if r.returncode != 0:
        return {"compile_error": r.stderr.strip()[:200]}
    try:
        counts = static_counts(obj_path)
        return counts
    except Exception as e:
        return {"compile_error": str(e)[:200]}


def main():
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--march", default="armv8.2-a+sve2",
                    help="-march 值（默认 armv8.2-a+sve2）")
    ap.add_argument("--filter", default=None,
                    help="路径过滤字符串（如 interp8、dct）")
    ap.add_argument("--threshold", type=float, default=0.30,
                    help="permute_ratio 告警阈值（默认 0.30）")
    ap.add_argument("--out", default=None,
                    help="输出文件路径（默认 stdout）")
    args = ap.parse_args()

    cands = find_candidates(args.filter)
    if not cands:
        print("未找到候选文件", file=sys.stderr)
        return 1

    print("[scan] 扫描 %d 个候选（march=%s, 阈值=%.0f%%）"
          % (len(cands), args.march, args.threshold * 100))

    rows = []
    with tempfile.TemporaryDirectory(prefix="scan-permute-") as tmpdir:
        for i, (rel, full) in enumerate(cands):
            parts = rel.split("/")
            kernel = parts[1] if len(parts) > 1 else parts[0]
            variant = Path(rel).stem
            c = compile_and_count(full, args.march, tmpdir)
            if c is None or "compile_error" in c:
                err = c.get("compile_error", "unknown") if c else "unknown"
                rows.append({
                    "kernel": kernel, "variant": variant,
                    "permute_ratio": None,
                    "fused_uop": None, "cp_lat": None,
                    "perm_cp": None, "spill": None,
                    "status": "COMPILE_FAIL: %s" % err[:80],
                })
            else:
                rows.append({
                    "kernel": kernel, "variant": variant,
                    "permute_ratio": c.get("permute_depth_ratio"),
                    "fused_uop": c.get("vector_fused_uop"),
                    "cp_lat": c.get("critical_path_latency"),
                    "perm_cp": c.get("permute_on_critical"),
                    "spill": c.get("spill_reload"),
                    "status": "OK",
                })
            if (i + 1) % 10 == 0:
                print("[scan] %d/%d..." % (i + 1, len(cands)),
                      file=sys.stderr)

    # 按 permute_ratio 降序排列（None 排最后）
    rows.sort(key=lambda r: (r["permute_ratio"] is None,
                             -(r["permute_ratio"] or 0)))

    lines = []
    lines.append("=" * 100)
    lines.append("permute_depth_ratio 全量扫描报告")
    lines.append("march=%s  阈值=%.0f%%  候选数=%d" % (
        args.march, args.threshold * 100, len(rows)))
    lines.append("=" * 100)
    lines.append("%-30s %-25s %6s %6s %6s %6s %5s  %s" % (
        "kernel", "variant", "fused", "cp_la", "perm", "ratio", "spill",
        "status"))
    lines.append("-" * 100)

    n_alert = 0
    n_ok = 0
    n_fail = 0
    for r in rows:
        if r["permute_ratio"] is None:
            ratio_str = "  N/A"
            status = r["status"][:40]
            n_fail += 1
        else:
            ratio_str = "%5.1f%%" % (r["permute_ratio"] * 100)
            if r["permute_ratio"] >= args.threshold:
                status = "*** 超阈值 ***"
                n_alert += 1
            else:
                status = "OK"
                n_ok += 1
        lines.append("%-30s %-25s %6s %6s %6s %6s %5s  %s" % (
            r["kernel"][:30], r["variant"][:25],
            str(r["fused_uop"] or "-"),
            str(r["cp_lat"] or "-"),
            str(r["perm_cp"] or "-"),
            ratio_str,
            str(r["spill"] or "-"),
            status))

    lines.append("-" * 100)
    lines.append("汇总: OK=%d  超阈值=%d  编译失败=%d" % (
        n_ok, n_alert, n_fail))
    if n_alert > 0:
        lines.append("")
        lines.append("超阈值候选（需 950 实测验证）:")
        for r in rows:
            if r["permute_ratio"] is not None and \
                    r["permute_ratio"] >= args.threshold:
                lines.append("  %s/%s  ratio=%.1f%%  fused=%s  cp_lat=%s"
                             % (r["kernel"], r["variant"],
                                r["permute_ratio"] * 100,
                                r["fused_uop"], r["cp_lat"]))

    output = "\n".join(lines) + "\n"
    if args.out:
        with open(args.out, "w") as f:
            f.write(output)
        print("[scan] 报告写入 %s" % args.out, file=sys.stderr)
    else:
        print(output)
    return 0


if __name__ == "__main__":
    sys.exit(main())
