#!/usr/bin/env python3
"""Classify AArch64 disassembly text into static instruction categories.

Usage: python3 tools/classify_disasm.py <file.asm> [<file.asm> ...]
Prints a JSON report per file (total, categories, per-mnemonic counts).
"""

import collections
import json
import re
import sys


SIMD_COMPUTE = {"add", "sub", "abs", "sabd", "umax", "smax", "umin", "smin",
                "mul", "mla", "mls", "saba", "uaba", "adalp", "adalp", "uadalp",
                "uaddlp", "saddlp", "addv", "saddv", "uaddv", "smaxv", "umaxv",
                "sminv", "uminv", "absv", "sabdv", "uabd", "uabd", "ssubl",
                "usubl", "saddl", "uaddl", "ssubw", "usubw", "saddw", "uaddw"}
SIMD_PERMUTE = {"trn1", "trn2", "zip1", "zip2", "uzp1", "uzp2", "ext", "tbl",
                "tbx", "rev16", "rev32", "rev64", "mov", "dup"}
VECTOR_LOAD = {"ld1", "ld2", "ld3", "ld4", "ldr", "ldp", "ldur", "ld1r",
               "ld2r", "ld3r", "ld4r"}
VECTOR_STORE = {"st1", "st2", "st3", "st4", "str", "stp", "stur"}
SCALAR_LOAD = {"ldr", "ldp", "ldur"}
SCALAR_STORE = {"str", "stp", "stur"}
BRANCH_RET = {"b", "bl", "br", "blr", "ret", "cbz", "cbnz", "tbz", "tbnz"}


def classify(path):
    counts = collections.Counter()
    total = 0
    code_bytes = 0
    with open(path) as f:
        for line in f:
            m = re.match(r"\s*([0-9a-f]+):\s+([0-9a-f]{8})\s+([a-z0-9]+)", line)
            if not m:
                continue
            total += 1
            code_bytes += 4
            mn = m.group(3)
            counts[mn] += 1
    cat = collections.Counter()
    for mn, n in counts.items():
        if mn in SIMD_COMPUTE:
            cat["simd_compute"] += n
        elif mn in SIMD_PERMUTE:
            cat["simd_permute"] += n
        elif mn in VECTOR_LOAD or mn in SCALAR_LOAD:
            cat["vector_load_store" if mn in VECTOR_LOAD else "scalar_load"] += n
        elif mn in VECTOR_STORE or mn in SCALAR_STORE:
            cat["vector_load_store" if mn in VECTOR_STORE else "scalar_store"] += n
        elif mn in BRANCH_RET:
            cat["branch_return"] += n
        else:
            cat["scalar_address_control"] += n
    return {
        "file": path,
        "total_instructions": total,
        "code_bytes": code_bytes,
        "categories": dict(cat),
        "mnemonics": dict(counts),
    }


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    for path in sys.argv[1:]:
        print(json.dumps(classify(path), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    sys.exit(main())
