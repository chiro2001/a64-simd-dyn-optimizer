#!/usr/bin/env python3
"""Parse a QEMU `-one-insn-per-tb -d in_asm` log into the executed
instruction stream of one kernel, and report the vector-instruction part.

Usage:
  python3 tools/parse_qemu_trace.py <trace.log> <start_hex> <end_hex>
      [--json out.json] [--vector-only]

Each `IN:` block logs one executed instruction as
`0xADDR:  encoding  mnemonic operands`. This is the dynamic flow: loops are
unrolled by EXECUTION, not by a compiler flag.
"""

import json
import re
import sys


INS = re.compile(r"^\s*0x([0-9a-f]+):\s+[0-9a-f]+\s+([a-z][a-z0-9.]*)\s*(.*)$")


def parse(path, start, end):
    insns = []
    for line in open(path):
        m = INS.match(line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if start <= addr < end:
            insns.append({"addr": addr, "mn": m.group(2),
                          "ops": m.group(3).strip()})
    return insns


def is_vector(insn):
    ops = insn["ops"]
    if re.search(r"\bv\d+", ops) or re.search(r"\bz\d+", ops):
        return True
    if insn["mn"].startswith("ld") and re.search(r"\{.*v\d", ops):
        return True
    return False


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        return 2
    path = sys.argv[1]
    start = int(sys.argv[2], 16)
    end = int(sys.argv[3], 16)
    args = sys.argv[4:]
    out_json = None
    vector_only = "--vector-only" in args
    if "--json" in args:
        out_json = args[args.index("--json") + 1]

    insns = parse(path, start, end)
    vec = [i for i in insns if is_vector(i)]
    print("dynamic instructions: %d (vector %d)"
          % (len(insns), len(vec)))
    if out_json:
        json.dump({"instructions": insns, "vector": vec},
                  open(out_json, "w"), indent=1)
    if vector_only:
        insns = vec
    for i in insns:
        print("0x%08x %-8s %s" % (i["addr"], i["mn"], i["ops"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
