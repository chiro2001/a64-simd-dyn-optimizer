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
    if re.search(r"\b[zv]\d+", ops):
        return True
    # GNU/NEON disassembly uses qN/dN notation for vector loads/stores
    # (ldr q24, str d23, ldp q28,q23, stp d8,d9, ...) that v/z misses.
    if re.search(r"\b[qd]\d+", ops):
        return True
    return False


def fused_adjust(vector):
    """movprfx is hardware-fused with the next instruction on real SVE
    pipelines (docs/09 §1.5): it does not occupy a separate issue slot.
    Returns (count, fused_adj)."""
    movprfx = sum(1 for n in vector if n["mn"] == "movprfx")
    return movprfx, len(vector) - movprfx


def scatter_gather_count(vector):
    """Count gather loads / scatter stores (SVE ld1/st1 with a vector
    offset register). Returns the instruction count; the decomposed-uop
    accounting is done by `scatter_gather_uops`."""
    n = 0
    for ins in vector:
        m = ins["mn"]
        if m.startswith(("ld1", "st1")) and re.search(
                r"\[[^\]]*,\s*z\d+", ins["ops"]):
            n += 1
    return n


def scatter_gather_uops(n, vl_bytes=32):
    """Decomposed-uop model for gather loads / scatter stores.

    2026-08-14 用户口径修订（docs/17）：ARM 实现将 SVE gather/scatter 拆为
    多个 ldst uops，拆分数按其处理的 64-bit 组数计（ld1d/st1d 每元素一组，
    ld1w/ld1h/ld1b 每 64-bit 一组），即每条指令 vl_bytes/8 个 uops。
    VL=256 时每条 = 4 uops（旧口径 +3 是该特例）；VL=128 时每条 = 2 uops。
    """
    return n * max(1, vl_bytes // 8)


def stack_vector_count(insns):
    """Vector ldr/str traffic (spilled z/q registers). GCC usually computes
    sp+offset into a base register first, so direct `[sp]` matching would
    miss spills; ldr/str with z/q operands is the reliable proxy (vector
    loads of constants use ld1h/ld1w instead).
    Round-0011: partial slices must report stack vector accesses, not only
    removed uaddv/saddv/fmov counts."""
    n = 0
    for i in insns:
        if i["mn"] in ("ldr", "str", "ldp", "stp") and re.search(
                r"\b[zq]\d+", i["ops"]):
            n += 1
    return n


def stream_counts(path, start, end, vl_bytes=32):
    """Two-pass streaming counts with the same metric schema as the full
    parser, without materializing the instruction list (P3 fast path).

    Pass 1 builds the per-address disassembly table from IN: blocks; pass 2
    walks the Trace lines and accumulates counters. Must produce exactly the
    same counts as parse_exec + fused_adjust/scatter_gather_count/
    stack_vector_count (verified against full-mode JSON outputs).
    """
    disasm = {}
    for line in open(path):
        m = INS.match(line)
        if m:
            disasm[int(m.group(1), 16)] = (m.group(2), m.group(3).strip())
    total = vector = movprfx = sg = stack_v = 0
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
        total += 1
        mn, ops = d
        if is_vector({"mn": mn, "ops": ops}):
            vector += 1
            if mn == "movprfx":
                movprfx += 1
            if mn.startswith(("ld1", "st1")) and re.search(
                    r"\[[^\]]*,\s*z\d+", ops):
                sg += 1
        if mn in ("ldr", "str", "ldp", "stp") and re.search(
                r"\b[zq]\d+", ops):
            stack_v += 1
    fused_adj = vector - movprfx
    sg_uops = scatter_gather_uops(sg, vl_bytes)
    fused_uop = fused_adj + (sg_uops - sg)
    return {"total": total, "vector": vector,
            "counts": {"vector_raw": vector, "movprfx": movprfx,
                       "vector_fused": fused_adj, "scatter_gather": sg,
                       "scatter_gather_uops": sg_uops,
                       "stack_vector": stack_v,
                       "vector_fused_uop": fused_uop}}


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
    stream_mode = "--stream" in args
    exec_mode = "--exec" in args
    vl_bytes = 32
    if "--vl-bytes" in args:
        vl_bytes = int(args[args.index("--vl-bytes") + 1])
    if "--json" in args:
        out_json = args[args.index("--json") + 1]

    if stream_mode:
        d = stream_counts(path, start, end, vl_bytes)
        c = d["counts"]
        print("dynamic instructions: %d (vector %d, movprfx %d, fused_adj "
              "%d, scatter_gather %d, sg_uops %d, stack_vector %d, "
              "fused_uop %d)"
              % (d["total"], d["vector"], c["movprfx"], c["vector_fused"],
                 c["scatter_gather"], c["scatter_gather_uops"],
                 c["stack_vector"],
                 c["vector_fused_uop"]))
        if out_json:
            json.dump({"counts": c, "total": d["total"],
                       "vector": d["vector"]},
                      open(out_json, "w"), indent=1)
        return 0

    insns = parse_exec(path, start, end) if exec_mode else parse(path, start, end)
    vec = [i for i in insns if is_vector(i)]
    movprfx, fused_adj = fused_adjust(vec)
    sg = scatter_gather_count(vec)
    sg_uops = scatter_gather_uops(sg, vl_bytes)
    stack_v = stack_vector_count(insns)
    # uop-honest metric: scatter/gather count as vl_bytes/8 ldst uops each
    # (VL=256 => 4 uops/instruction, docs/17 2026-08-14 修订口径).
    fused_uop = fused_adj + (sg_uops - sg)
    if counts_only:
        from optimizer.ir.asm_ir import dynamic_counts, import_asm_trace

        nodes, _ = import_asm_trace(insns)
        print(json.dumps(dynamic_counts(nodes)))
        return 0
    print("dynamic instructions: %d (vector %d, movprfx %d, fused_adj %d, "
          "scatter_gather %d, sg_uops %d, stack_vector %d, fused_uop %d)"
          % (len(insns), len(vec), movprfx, fused_adj, sg, sg_uops,
             stack_v, fused_uop))
    if out_json:
        json.dump({"instructions": insns, "vector": vec,
                   "counts": {"vector_raw": len(vec), "movprfx": movprfx,
                              "vector_fused": fused_adj,
                              "scatter_gather": sg,
                              "scatter_gather_uops": sg_uops,
                              "stack_vector": stack_v,
                              "vector_fused_uop": fused_uop}},
                  open(out_json, "w"), indent=1)
    if vector_only:
        insns = vec
    for i in insns:
        print("0x%08x %-8s %s" % (i["addr"], i["mn"], i["ops"]))
    return 0


if __name__ == "__main__":
    sys.exit(main())
