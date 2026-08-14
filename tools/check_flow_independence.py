#!/usr/bin/env python3
"""Verify dynamic-instruction-count invariance across random inputs
(docs/29 §1 判定条件).

用户 2026-08-14：判断 kernel 的数据流/控制流是否与具体指令无关——
在先前随机测试中动态指令数保持不变。满足该条件时，才能把暂不支持
的指令替换为相同寄存器依赖类型的指令，用 920B/950 预估 SVE 2×256
性能（替换误差 <5% 的前提）。

Usage:
  python3 tools/check_flow_independence.py <idct16|idct32>
      [--seeds 1,2,3,4,5] [--driver /tmp/drv]
"""

import argparse
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, ROOT)
sys.path.insert(0, os.path.join(ROOT, "tools"))

from parse_qemu_trace import parse_exec  # noqa: E402
from parse_qemu_trace import is_vector  # noqa: E402

QEMU = ["qemu-aarch64", "-L", "/usr/aarch64-linux-gnu",
        "-cpu", "max,sve-max-vq=2"]


def build_driver(kernel, out):
    src = os.path.join(ROOT, "kernels", kernel, "trace_driver.cpp")
    obj = os.path.join(ROOT, "kernels", kernel, "candidates",
                       "best_sve2.o")
    subprocess.run(
        ["aarch64-linux-gnu-g++", "-O2", "-no-pie", "-static",
         "-std=c++11", src, obj, "-o", out],
        check=True, capture_output=True)


def symbol_range(binary, sym):
    out = subprocess.run(["aarch64-linux-gnu-nm", "-S", binary],
                         capture_output=True, text=True, check=True).stdout
    addrs = []
    for line in out.splitlines():
        parts = line.split()
        if len(parts) >= 4 and parts[3] == sym:
            addrs.append(int(parts[0], 16))
            addrs.append(int(parts[0], 16) + int(parts[1], 16))
    return (min(addrs), max(addrs)) if addrs else None


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("kernel", choices=("idct16", "idct32"))
    ap.add_argument("--seeds", default="1,2,3,4,5")
    ap.add_argument("--driver", default=None)
    args = ap.parse_args()
    sym = "dynopt_%s_sve2_shared" % args.kernel
    driver = args.driver or "/tmp/%s_flow_driver" % args.kernel
    if args.driver is None or not os.path.exists(driver):
        build_driver(args.kernel, driver)
    rng = symbol_range(driver, sym)
    if rng is None:
        print("no symbol %s" % sym, file=sys.stderr)
        return 1
    counts = []
    vec_counts = []
    for s in args.seeds.split(","):
        s = s.strip()
        log = "/tmp/%s_flow_%s.log" % (args.kernel, s)
        subprocess.run(
            QEMU + ["-one-insn-per-tb", "-d", "exec,in_asm",
                    "-dfilter", "0x%x..0x%x" % rng,
                    "-D", log, driver, s],
            timeout=120, check=True, capture_output=True)
        insns = parse_exec(log, rng[0], rng[1])
        counts.append(len(insns))
        vec_counts.append(sum(1 for i in insns if is_vector(i)))
    ok = len(set(counts)) == 1 and len(set(vec_counts)) == 1
    print("kernel=%s seeds=%s dynamic_counts=%s vector_counts=%s -> %s"
          % (args.kernel, args.seeds, counts,
             vec_counts,
             "PASS (flow-independent, substitution eligible)"
             if ok else "FAIL (data-dependent control flow)"))
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
