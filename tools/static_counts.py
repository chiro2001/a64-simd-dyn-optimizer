#!/usr/bin/env python3
"""Static instruction counts from objdump for loop-free SVE kernels.

QEMU 11.0.3's in_asm disassembler does not recognize SVE2p1
`sdot z.s, z.h, z.h` and prints it as `.byte`, so dynamic-trace counts
silently miss sdot candidates (docs/27 §8.10). Our kernels are fully
unrolled (static stream == dynamic stream), so objdump is authoritative.

Usage:
    from static_counts import static_insns, static_counts
    insns = static_insns(obj_path)          # [{addr,mn,ops}]
    counts = static_counts(obj_path, vl_bytes=32)
"""

import re
import subprocess


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
    """Same schema as parse_qemu_trace.stream_counts, from the static
    (fully unrolled) instruction stream."""
    from parse_qemu_trace import (is_vector, scatter_gather_count,
                                  scatter_gather_uops, stack_vector_count)
    insns = static_insns(obj_path)
    vec = [i for i in insns if is_vector(i)]
    sg = scatter_gather_count(vec)
    sg_uops = scatter_gather_uops(sg, vl_bytes)
    stack_v = stack_vector_count(insns)
    fused_adj = len(vec) - sum(1 for i in vec if i["mn"] == "movprfx")
    fused_uop = fused_adj + (sg_uops - sg)
    return {"total": len(insns), "vector": len(vec),
            "movprfx": sum(1 for i in vec if i["mn"] == "movprfx"),
            "vector_fused": fused_adj,
            "scatter_gather": sg,
            "scatter_gather_uops": sg_uops,
            "stack_vector": stack_v,
            "vector_fused_uop": fused_uop}


def static_hist(obj_path):
    """Mnemonic histogram of the static stream (for cost-model inputs)."""
    import collections
    return collections.Counter(i["mn"] for i in static_insns(obj_path))


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
    if len(sys.argv) > 2:
        json.dump(d, open(sys.argv[2], "w"), indent=1)
