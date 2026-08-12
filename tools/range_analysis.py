#!/usr/bin/env python3
"""Static value-range overflow scan for a MachineIR kernel.

Usage:
  python3 tools/range_analysis.py <machine-ir.json> [--contract LO,HI]

Flags every op whose propagated range cannot fit its storage type. On the
dct8 seed this must include the eight pass-2 s16 subtractions (the upstream
wrap bug); pass-1 narrowing may be over-approximated by naive interval
arithmetic, which is reported with a note.
"""

import json
import sys

from optimizer.analysis.range import analyze
from optimizer.ir.machine_ir import MachineIR

# g_t8 rows (x265 constants.cpp, pinned commit) for resolving constant loads
G_T8 = [
    64, 64, 64, 64, 64, 64, 64, 64,
    89, 75, 50, 18, -18, -50, -75, -89,
    83, 36, -36, -83, -83, -36, 36, 83,
    75, -18, -89, -50, 50, 89, 18, -75,
    64, -64, -64, 64, 64, -64, -64, 64,
    50, -89, 18, 75, -75, -18, 89, -50,
    36, -83, 83, -36, -36, 83, -83, 36,
    18, -50, 75, -89, 89, -75, 50, -18,
]


def main():
    if len(sys.argv) < 2:
        print(__doc__)
        return 2
    lo, hi = -255, 255
    if "--contract" in sys.argv:
        i = sys.argv.index("--contract")
        lo, hi = (int(x) for x in sys.argv[i + 1].split(","))
    doc = json.load(open(sys.argv[1]))
    ir = MachineIR(function=doc.get("function"), nodes=doc["nodes"])
    ranges, risks = analyze(
        ir, input_range=(lo, hi),
        constants={"@_ZN4x2654g_t8E": G_T8})
    print("nodes=%d risks=%d" % (len(ir.nodes), len(risks)))
    for r in risks:
        print("  id=%-4d op=%-6s type=%-10s range=%s"
              % (r["id"], r["op"], r["type"], r["range"]))
    if "--json-out" in sys.argv:
        out = sys.argv[sys.argv.index("--json-out") + 1]
        json.dump({"risks": risks}, open(out, "w"), indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
