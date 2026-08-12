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
from optimizer.ir.pack_ir import SCHEMA_VERSION, project_full, verify_pack_ir


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

    pack = project_full(ir)
    violations = verify_pack_ir(pack)
    with open(os.path.join(outdir, "pack-ir.json"), "w") as f:
        json.dump(pack, f, indent=2, sort_keys=True)
    print("machine nodes:", len(mdoc["nodes"]))
    print("pack values:", len(pack["values"]))
    print("pack violations:", violations)
    return 0 if not violations else 1


if __name__ == "__main__":
    sys.exit(main())
