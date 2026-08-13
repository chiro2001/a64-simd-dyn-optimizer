#!/usr/bin/env python3
"""Parse QEMU logs into the executed instruction stream of one kernel.

Usage:
  python3 tools/parse_qemu_trace.py <trace.log> <start_hex> <end_hex>
      [--json out.json] [--vector-only]
      [--exec]   # combined `-d exec,in_asm` log: real per-execution stream

`-d in_asm` alone logs each TB at translation time (once per address), so a
looped kernel is undercounted. `--exec` merges the per-execution `Trace ...`
lines with the per-address disassembly from the `IN:` blocks, giving the
true dynamic instruction stream (loop iterations included).

Each `IN:` block logs one executed instruction as
`0xADDR:  encoding  mnemonic operands`.
"""

import json
import os
import re
import sys

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


INS = re.compile(r"^\s*0x([0-9a-f]+):\s+[0-9a-f]+\s+([a-z][a-z0-9.]*)\s*(.*)$")
TRACE = re.compile(r"^Trace \d+: .*\[[^\]/]*/([0-9a-f]+)/")


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


def parse_exec(path, start, end):
    """Merge per-execution Trace lines with per-address IN: disassembly."""
    disasm = {}
    for line in open(path):
        m = INS.match(line)
        if m:
            disasm[int(m.group(1), 16)] = {
                "mn": m.group(2), "ops": m.group(3).strip()}
    insns = []
    for line in open(path):
        m = TRACE.match(line)
        if not m:
            continue
        addr = int(m.group(1), 16)
        if not (start <= addr < end):
            continue
        d = disasm.get(addr)
        if d is None:
            continue
        insns.append({"addr": addr, "mn": d["mn"], "ops": d["ops"]})
    return insns


def is_vector(insn):
    ops = insn["ops"]
    if re.search(r"\bv\d+", ops) or re.search(r"\bz\d+", ops):
        return True
    if insn["mn"].startswith("ld") and re.search(r"\{.*v\d", ops):
        return True
    return False


def fused_adjust(vector):
    """movprfx is hardware-fused with the next instruction on real SVE
    pipelines (docs/09 §1.5): it does not occupy a separate issue slot.
    Returns (count, fused_adj)."""
    movprfx = sum(1 for n in vector if n["mn"] == "movprfx")
    return movprfx, len(vector) - movprfx


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
    counts_only = "--counts" in args
    exec_mode = "--exec" in args
    if "--json" in args:
        out_json = args[args.index("--json") + 1]

    insns = parse_exec(path, start, end) if exec_mode else parse(path, start, end)
    vec = [i for i in insns if is_vector(i)]
    movprfx, fused_adj = fused_adjust(vec)
    if counts_only:
        from optimizer.ir.asm_ir import dynamic_counts, import_asm_trace

        nodes, _ = import_asm_trace(insns)
        print(json.dumps(dynamic_counts(nodes)))
        return 0
    print("dynamic instructions: %d (vector %d, movprfx %d, fused_adj %d)"
          % (len(insns), len(vec), movprfx, fused_adj))
    if out_json:
        json.dump({"instructions": insns, "vector": vec,
                   "counts": {"vector_raw": len(vec), "movprfx": movprfx,
                              "vector_fused": fused_adj}},
                  open(out_json, "w"), indent=1)
    if vector_only:
        insns = vec
    for i in insns:
        print("0x%08x %-8s %s" % (i["addr"], i["mn"], i["ops"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
