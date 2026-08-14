#!/usr/bin/env python3
"""Substitute unsupported SVE2p1/SVE2p3 instructions for shape-equivalent
ones that run on older targets (docs/29).

Purpose (用户 2026-08-14)：大部分 kernel 控制流/数据流与具体指令
无关；对暂时不支持的指令，用**相同寄存器依赖类型**（相同读/写
寄存器数、同类流水行为）的指令替换，可以在 950(SVE2)/920B(SVE1)
上直接跑 CNTVCT 微基准，预估 SVE 2×256 性能（误差预期 <5%）。
替换后数值**不保真**，只用于性能预估，禁止用作正确性验收。

目标替换表：
  --target sve2（950）：
    sdot zD.s, zA.h, zB.h  -> sdot zD.s, zA.b, zB.b   (SVE1 SDOT BtoS,
      同 3 寄存器 / 32-bit 累加 dot 形状)
  --target sve1（920B）：在 sve2 基础上追加
    sqrshrnb zD.h, zS.s, #imm -> asr zS.s, zS.s, #imm
                                 uzp1 zD.h, zS.h, zS.h
      （SVE1 无饱和窄化；asr 保移位依赖，uzp1 保 1 def/2 use 形状，
       值不保真）

同时把 GCC 生成的 `.arch armv9.4-a+crc` 改写为目标 ISA，避免汇编器
被文件内 .arch 覆盖。

Usage:
  python3 tools/substitute_unsupported.py <in.s> <out.s> --target sve2|sve1
"""

import argparse
import re


SDOT_HTO_S = re.compile(
    r"^(\s*)sdot\s+(z\d+)\.s,\s*(z\d+)\.h,\s*(z\d+)\.h(.*)$")
SDOT_BTOH_TO_S = re.compile(
    r"^(\s*)sdot\s+(z\d+)\.h,\s*(z\d+)\.b,\s*(z\d+)\.b(.*)$")
SQRHSHRNB = re.compile(
    r"^(\s*)sqrshrnb\s+(z\d+)\.h,\s*(z\d+)\.s,\s*#(\d+)(.*)$")
SQRHSHRUNB = re.compile(
    r"^(\s*)sqrshrunb\s+(z\d+)\.b,\s*(z\d+)\.h,\s*#(\d+)(.*)$")
ARCH = re.compile(r"^\s*\.arch\s+.*$")


def substitute(lines, target):
    out = []
    for line in lines:
        m = ARCH.match(line)
        if m:
            out.append("\t.arch armv8.2-a+%s"
                       % ("sve" if target == "sve1" else "sve2"))
            continue
        m = SDOT_HTO_S.match(line)
        if m:
            ind, zd, za, zb, tail = m.groups()
            out.append("%ssdot %s.s, %s.b, %s.b%s"
                       % (ind, zd, za, zb, tail))
            continue
        m = SDOT_BTOH_TO_S.match(line)
        if m:
            # SVE2p3 sdot zD.h,zA.b,zB.b (8->16, 2-way): same 3-register
            # 1-def/2-use dot shape as SVE1 sdot zD.s,zA.b,zB.b (BtoS).
            # Dest width differs (h vs s) -- dependency shape preserved,
            # numeric values NOT (docs/29 substitution rules).
            ind, zd, za, zb, tail = m.groups()
            out.append("%ssdot %s.s, %s.b, %s.b%s"
                       % (ind, zd, za, zb, tail))
            continue
        m = SQRHSHRNB.match(line)
        if m and target == "sve1":
            ind, zd, zs, imm, tail = m.groups()
            out.append("%sasr %s.s, %s.s, #%s%s" % (ind, zs, zs, imm, tail))
            out.append("%suzp1 %s.h, %s.h, %s.h%s" % (ind, zd, zs, zs, tail))
            continue
        m = SQRHSHRUNB.match(line)
        if m and target == "sve1":
            # SVE2 sqrshrunb (s16->u8 bottom-narrow): SVE1 has no saturating
            # narrow; asr preserves the shift edge, uzp1 the 1-def/2-use
            # narrow shape (same treatment as sqrshrnb, docs/29 §2).
            ind, zd, zs, imm, tail = m.groups()
            out.append("%sasr %s.h, %s.h, #%s%s" % (ind, zs, zs, imm, tail))
            out.append("%suzp1 %s.b, %s.b, %s.b%s" % (ind, zd, zs, zs, tail))
            continue
        out.append(line)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("in_s")
    ap.add_argument("out_s")
    ap.add_argument("--target", choices=("sve2", "sve1"), required=True)
    args = ap.parse_args()
    lines = open(args.in_s).read().splitlines()
    out = substitute(lines, args.target)
    with open(args.out_s, "w") as f:
        f.write("\n".join(out) + "\n")
    n_sdot = sum(1 for l in out if re.match(r"\s*sdot", l))
    n_sub = sum(1 for l in out if "sdot" in l and ".b" in l)
    print("wrote %s (%d sdot lines, %d substituted BtoS)"
          % (args.out_s, n_sdot, n_sub))
    return 0


if __name__ == "__main__":
    import sys
    sys.exit(main())
