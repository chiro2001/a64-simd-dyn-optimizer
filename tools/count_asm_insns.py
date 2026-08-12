#!/usr/bin/env python3
"""Count instructions (total and SIMD-class) in an AArch64 object file.

Usage: python3 tools/count_asm_insns.py <object> [--function <name>]
"""

import argparse
import os
import re
import subprocess
from collections import Counter


SIMD_OP_RE = re.compile(r"\b[zpv][0-9]")
FUNC_RE = re.compile(r"^[0-9a-f]+ <([^>]+)>:")
INSN_RE = re.compile(
    r"^\s*[0-9a-f]+:\s+(?:[0-9a-f]{8}\s+)?([a-z0-9.]+)(?:\s+(.*))?$")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("object")
    ap.add_argument("--function", default=None)
    args = ap.parse_args()

    objdump = os.environ.get("OBJDUMP", "objdump")
    text = subprocess.check_output([objdump, "-d", args.object], text=True)
    total = simd = 0
    by_mnemonic = Counter()
    simd_by_mnemonic = Counter()
    in_func = args.function is None
    for line in text.splitlines():
        m = FUNC_RE.match(line)
        if m:
            in_func = args.function is None or m.group(1) == args.function
            continue
        m = INSN_RE.match(line)
        if not m or not in_func:
            continue
        mnem, ops = m.group(1), m.group(2) or ""
        total += 1
        by_mnemonic[mnem] += 1
        if SIMD_OP_RE.search(ops):
            simd += 1
            simd_by_mnemonic[mnem] += 1

    print("total=%d simd=%d" % (total, simd))
    for mnem, cnt in by_mnemonic.most_common():
        print("  %-10s %4d%s" % (mnem, cnt,
                                 "  [SIMD]" if simd_by_mnemonic[mnem] else ""))


if __name__ == "__main__":
    main()
