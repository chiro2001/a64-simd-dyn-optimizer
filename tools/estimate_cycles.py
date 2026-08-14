#!/usr/bin/env python3
"""Estimate cycles for a dynamic QEMU trace with the resource lower-bound
cost model (optimizer/analysis/cost.py) and a measured target profile.

Usage:
  python3 tools/estimate_cycles.py <trace.log> <start_hex> <end_hex>
      [--profile k920b] [--json out.json]

Profiles: k920b (920B measured SVE1 throughput, VL=256; SVE2 ops use
proxy weights), n1 (NEON128 seed).
"""

import argparse
import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from optimizer.analysis.cost import (
    N1_PROFILE, K920B_PROFILE, K950_PROFILE, TargetProfile, cycles_lb)
from optimizer.mca_targets import target as mca_target
from parse_qemu_trace import is_vector, parse_exec


def _parse(args):
    if args.fix_driver:
        # QEMU 11.0.3 把 SVE2p1 sdot 反汇编成 .byte，先用 objdump 修复
        # 动态流再统计/MCA（docs/26 §5）。
        from fix_dynamic_trace import parse_exec_fixed
        insns, _ = parse_exec_fixed(args.trace, int(args.start, 16),
                                    int(args.end, 16), args.fix_driver)
        return insns
    return parse_exec(args.trace, int(args.start, 16), int(args.end, 16))


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("trace")
    ap.add_argument("start", help="symbol range start (hex)")
    ap.add_argument("end", help="symbol range end (hex)")
    ap.add_argument("--profile",
                    choices=("k920b", "k950", "n1", "920B", "NP1"),
                    default="NP1")
    ap.add_argument("--fix-driver", default=None,
                    help="trace driver binary; objdump-repair SVE2p1 "
                         ".byte instructions before counting (sdot, "
                         "docs/26 §5)")
    ap.add_argument("--json", default=None)
    args = ap.parse_args()

    if args.profile in ("920B", "NP1"):
        tgt = mca_target(args.profile)
        profile = TargetProfile(tgt["name"], issue_rate=tgt["issue_rate"],
                                **tgt["throughput"])
    else:
        profile = {"k920b": K920B_PROFILE,
                   "k950": K950_PROFILE,
                   "n1": N1_PROFILE}[args.profile]
    insns = _parse(args)
    hist = {}
    nvec = 0
    sve = neon = 0
    for i in insns:
        hist[i["mn"]] = hist.get(i["mn"], 0) + 1
        if is_vector(i):
            nvec += 1
            if re.search(r"\b[z]\d+", i["ops"]):
                sve += 1
            else:
                neon += 1
    lb, bounds = cycles_lb(hist, profile)
    # Width-aware vector throughput lower bound (用户 2026-08-14 双目标
    # 口径): 920B = SVE 2x256 / NEON 4x128, NP1(960) = SVE 4x256 /
    # NEON 4x128。纯 SVE256 kernel 与纯 NEON128 kernel 用各自 pipe 数
    # 计；混合 kernel 取 max（保守，NEON/SVE 大概率共享向量 pipe）。
    vector_lb = None
    if args.profile in ("920B", "NP1"):
        tgt = mca_target(args.profile)
        vlb = []
        if sve:
            vlb.append(sve / tgt["sve_pipes"])
        if neon:
            vlb.append(neon / tgt["neon_pipes"])
        vector_lb = max(vlb) if vlb else 0.0
    out = {
        "profile": profile.name,
        "total_insns": len(insns),
        "vector_insns": nvec,
        "sve_vector_insns": sve,
        "neon_vector_insns": neon,
        "vector_lb_cycles": vector_lb,
        "hist": dict(sorted(hist.items(), key=lambda kv: -kv[1])),
        "class_counts": {k: v for k, v in bounds.items()},
        "resource_lb_cycles": lb,
        "frontend_bound": bounds.get("frontend", 0.0),
    }
    print(json.dumps(out, indent=1))
    if args.json:
        json.dump(out, open(args.json, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
