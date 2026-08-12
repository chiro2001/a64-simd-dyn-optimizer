#!/usr/bin/env python3
"""M2 seed importer: LLVM IR -> MachineIR -> PackIR projection scaffold.

Usage:
  python3 kernels/sa8d/import_seed.py <sa8d-8x8.ll> <outdir>

Writes:
  machine-ir.json      MachineIR nodes from the restricted IR grammar
  pack-ir.json         PackIR projection (loads/sub stage annotated;
                       deeper stages listed as provenance TODO)
"""

import json
import os
import re
import sys

from optimizer.ir.machine_ir import import_llvm_ir_text
from optimizer.ir.pack_ir import SCHEMA_VERSION, verify_pack_ir


def project_loads(machine):
    """Annotate loads and first sub stage with A/B provenance."""
    values = []
    load_by_dst = {}
    sub_count = 0
    for node in machine.nodes:
        if node["op"] == "load":
            width, bits = re.match(r"<(\d+) x i(\d+)>", node["type"]).groups()
            n = int(width)
            element = "A" if "pix1" in (node.get("ptr") or "") else "B"
            lanes = []
            for i in range(n):
                lanes.append({"element": element, "index": i,
                              "provenance": "row-col-todo"})
            values.append({"id": node["dst"], "lanes": lanes})
            load_by_dst[node["dst"]] = element
        elif node["op"] == "sub":
            if sub_count < 8:
                srcs = node.get("src", [])
                element = load_by_dst.get(srcs[0], "?")
                lanes = [{"element": "D", "row": sub_count,
                          "col": i, "a": srcs[0], "b": srcs[1]}
                         for i in range(8)]
                values.append({"id": node["dst"], "lanes": lanes})
                sub_count += 1
    return values


def main():
    if len(sys.argv) < 3:
        print(__doc__)
        return 2
    ir_path, outdir = sys.argv[1], sys.argv[2]
    os.makedirs(outdir, exist_ok=True)
    with open(ir_path) as f:
        ir = import_llvm_ir_text(f.read())
    mdoc = ir.to_dict()
    with open(os.path.join(outdir, "machine-ir.json"), "w") as f:
        json.dump(mdoc, f, indent=2, sort_keys=True)

    pack = {
        "schema_version": SCHEMA_VERSION,
        "kernel": "sa8d_8x8_neon",
        "values": project_loads(ir),
    }
    violations = verify_pack_ir(pack)
    with open(os.path.join(outdir, "pack-ir.json"), "w") as f:
        json.dump(pack, f, indent=2, sort_keys=True)
    print("machine nodes:", len(mdoc["nodes"]))
    print("pack values:", len(pack["values"]))
    print("pack violations:", violations)
    return 0 if not violations else 1


if __name__ == "__main__":
    sys.exit(main())
