#!/usr/bin/env python3
"""Static instruction counts from objdump for loop-free SVE kernels.

QEMU 11.0.3's in_asm disassembler does not recognize SVE2p1
`sdot z.s, z.h, z.h` and prints it as `.byte`, so dynamic-trace counts
silently miss sdot candidates (docs/27 §8.10). Our kernels are fully
unrolled (static stream == dynamic stream), so objdump is authoritative.

Usage:
    from static_counts import static_insns, static_counts
    insns = static_insns(obj_path)          # [{addr,mn,ops}]
    counts = static_counts(obj_path)

    # Critical-path features (docs/78 P1):
    from static_counts import critical_path_features
    feat = critical_path_features(obj_path)  # permute depth, load-use, spill
"""

import os
import re
import subprocess
import sys

# Ensure the project root is importable when run as `python3 tools/...`.
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


def static_insns(obj_path):
    """objdump -d -> list of {addr, mn, ops} (labels/branch targets intact
    in ops; comments stripped)."""
    out = subprocess.run(
        ["aarch64-linux-gnu-objdump", "-d", obj_path],
        capture_output=True, text=True, check=True).stdout
    insns = []
    for line in out.splitlines():
        m = re.match(r"\s+([0-9a-f]+):\s+[0-9a-f]+\s+([a-z0-9.]+)\s+(.*)",
                     line)
        if not m:
            continue
        ops = m.group(3).split("//")[0].strip()
        insns.append({"addr": int(m.group(1), 16), "mn": m.group(2),
                      "ops": ops})
    return insns


def static_counts(obj_path, vl_bytes=32):
    """Same schema as parse_qemu_trace_stream_counts, from the static
    (fully unrolled) instruction stream.

    Extended (2026-08-17, docs/78 P1) with critical-path features:
    critical_path_latency, permute_on_critical, load_use_avg, spill_reload.
    """
    from parse_qemu_trace import (is_vector, scatter_gather_count,
                                   scatter_gather_uops, stack_vector_count)
    insns = static_insns(obj_path)
    vec = [i for i in insns if is_vector(i)]
    sg = scatter_gather_count(vec)
    sg_uops = scatter_gather_uops(sg, vl_bytes)
    stack_v = stack_vector_count(insns)
    fused_adj = len(vec) - sum(1 for i in vec if i["mn"] == "movprfx")
    fused_uop = fused_adj + (sg_uops - sg)
    d = {"total": len(insns), "vector": len(vec),
         "movprfx": sum(1 for i in vec if i["mn"] == "movprfx"),
         "vector_fused": fused_adj,
         "scatter_gather": sg,
         "scatter_gather_uops": sg_uops,
         "stack_vector": stack_v,
         "vector_fused_uop": fused_uop}
    d.update(critical_path_features(obj_path))
    return d


def static_hist(obj_path):
    """Mnemonic histogram of the static stream (for cost-model inputs)."""
    import collections
    return collections.Counter(i["mn"] for i in static_insns(obj_path))


# Permute-class mnemonics for critical-path analysis (docs/78 root cause #1).
# Pure lane-rearrangement ops that add latency without useful computation:
# the dual-group tbl2/uzp/zip/unpk/combine overhead that makes sve16
# slower than op895 on 950 despite fewer total fused_uop.
# Excludes mov/movi/mvni/dup (register setup, not lane rearrangement).
PERMUTE_MN = {
    # Table lookup (the dominant sve16 overhead: 187 tbl vs 0 in op895)
    "tbl", "tbx",
    # Interleave / deinterleave
    "zip1", "zip2", "uzp1", "uzp2", "trn1", "trn2",
    # Extract
    "ext",
    # Reverse
    "rev", "revh", "revw", "rev16", "rev32", "rev64",
    # Unpack (widen, pure sign/zero extend — no arithmetic)
    "sunpklo", "sunpkhi", "uunpklo", "uunpkhi", "unpklo", "unpkhi",
    # Narrow extract (no arithmetic)
    "xtn", "xtn2",
    # SVE predicated select / splice (lane conditional move)
    "sel", "splice",
    # SVE move prefix (overhead for predicated combine patterns)
    "movprfx",
}


def critical_path_features(obj_path):
    """Critical-path features for ranking SVE2 candidates (docs/78 P1).

    The linear throughput (fused_uop) model cannot distinguish sve16
    (640 uop, real-slow) from op895 (952 uop, real-fast) because it
    ignores the dependency chain. This function adds:

    - critical_path_latency: longest forward latency (cycles, from
      optimizer.analysis.critical_path with SVE2 latency table)
    - critical_path_len: number of instructions on any critical path
    - permute_on_critical: count of permute-class ops on critical path
      (the tbl2/uzp/zip/unpk chain — root cause #1)
    - permute_depth_ratio: fraction of critical path that is permute
    - load_use_avg: average instructions between load and first consumer
      (short = latency-bound, long = ILP available)
    - load_use_min: minimum load-to-first-consumer distance
    - spill_reload: count of stack store+load pairs (register pressure)
    """
    from optimizer.analysis.critical_path import (
        estimate_critical_path, parse_inst, MNEMONIC_LATENCY,
        LOAD_MN)

    out = subprocess.run(
        ["aarch64-linux-gnu-objdump", "-d", obj_path],
        capture_output=True, text=True, check=True).stdout

    best, dist, _lines, preds = estimate_critical_path(out)

    # Re-parse to get per-instruction mnemonic + latency + operands.
    insts = []
    for line in out.splitlines():
        p = parse_inst(line)
        if p:
            mn, dsts, reads, mems = p
            insts.append({"mn": mn, "dsts": dsts, "reads": reads,
                          "mems": mems,
                          "lat": MNEMONIC_LATENCY.get(mn, 1)})

    n = len(insts)
    if n == 0 or best == 0:
        return {"critical_path_latency": 0, "critical_path_len": 0,
                "permute_on_critical": 0, "permute_depth_ratio": 0,
                "load_use_avg": 0, "load_use_min": 0, "spill_reload": 0}

    # Build successor edges from preds (forward dep graph).
    succs = [[] for _ in range(n)]
    for i, ps in enumerate(preds):
        for p in ps:
            succs[p].append(i)

    # Backward pass: rdist[i] = longest path from i to any sink (inclusive).
    rdist = [0.0] * n
    for i in range(n - 1, -1, -1):
        rdist[i] = insts[i]["lat"] + max(
            (rdist[s] for s in succs[i]), default=0)

    # Critical-path instructions: dist[i] + rdist[i] - lat[i] == best.
    # (dist and rdist both include lat[i]; subtract one copy.)
    on_crit = [i for i in range(n)
               if abs(dist[i] + rdist[i] - insts[i]["lat"] - best) < 0.01]

    permute_on = sum(1 for i in on_crit if insts[i]["mn"] in PERMUTE_MN)

    # Load-use distance: for each load, distance to its first consumer.
    last_writer = {}   # reg -> instruction index
    load_dists = []
    for i in range(n):
        reads = insts[i]["reads"]
        for r in reads:
            producer = last_writer.get(r)
            if producer is not None and insts[producer]["mn"] in LOAD_MN:
                load_dists.append(i - producer)
        for d in insts[i]["dsts"]:
            last_writer[d] = i

    # Stack spills: slots that are both stored and reloaded (register
    # pressure proxy). Track sp-derived base registers, same as
    # estimate_critical_path.
    stack_bases = {"sp"}
    for i in range(n):
        mn = insts[i]["mn"]
        if mn in ("add", "sub", "mov", "addvl") and "sp" in \
                insts[i]["reads"] and insts[i]["dsts"]:
            for d in insts[i]["dsts"]:
                if d != "sp":
                    stack_bases.add(d)
    stack_written = set()
    stack_read = set()
    for i in range(n):
        for base, disp, is_store in insts[i]["mems"]:
            if base in stack_bases:
                slot = "%s#%d" % (base, disp)
                if is_store:
                    stack_written.add(slot)
                else:
                    stack_read.add(slot)
    spill_reload = len(stack_written & stack_read)

    return {
        "critical_path_latency": round(best, 1),
        "critical_path_len": len(on_crit),
        "permute_on_critical": permute_on,
        "permute_depth_ratio": round(
            permute_on / max(len(on_crit), 1), 3),
        "load_use_avg": round(
            sum(load_dists) / max(len(load_dists), 1), 2)
            if load_dists else 0,
        "load_use_min": min(load_dists) if load_dists else 0,
        "spill_reload": spill_reload,
    }


if __name__ == "__main__":
    import json
    import sys
    obj = sys.argv[1]
    d = static_counts(obj)
    print("dynamic instructions: %d (vector %d, movprfx %d, fused_adj "
          "%d, scatter_gather %d, sg_uops %d, stack_vector %d, "
          "fused_uop %d)"
          % (d["total"], d["vector"], d["movprfx"], d["vector_fused"],
             d["scatter_gather"], d["scatter_gather_uops"],
             d["stack_vector"], d["vector_fused_uop"]))
    print("critical path: latency=%.1f len=%d permute_on_cp=%d "
          "(%.1f%%) load_use_avg=%.1f load_use_min=%d spill=%d"
          % (d["critical_path_latency"], d["critical_path_len"],
             d["permute_on_critical"],
             d["permute_depth_ratio"] * 100,
             d["load_use_avg"], d["load_use_min"],
             d["spill_reload"]))
    if len(sys.argv) > 2:
        json.dump(d, open(sys.argv[2], "w"), indent=1)
