#!/usr/bin/env python3
"""v0 search driver: rewrite -> codegen -> compile -> disasm -> cost -> rank.

The P6' validation showed the calibrated critical-path model generalizes only
WITHIN the fitted family (920B DCT8 R2=0.98). This driver is therefore
family-scoped: it enumerates MachineIR rewrites for one contract, generates
C++, cross-compiles, disassembles, and ranks candidates with the fitted
per-machine weights. Cross-family ranking stays gated (m19).

Usage:
  python3 tools/search_driver.py <machine-ir.json> <machine:n1|920b>
      <outdir> [--rewrite widen]...
  machine selects experiments/m16-dct8-protoc/fitted-{n1,920b}.json
"""

import json
import os
import subprocess
import sys
from itertools import combinations

from optimizer.analysis.critical_path import estimate_critical_path, parse_inst
from optimizer.ir.codegen import emit_dct8_c_intrinsics
from optimizer.ir.machine_ir import MachineIR
from optimizer.ir.rewrites import (
    mul64_to_shift, tree_to_mla, wide_loads, widen_overflows)


def apply_rewrites(ir, names):
    for name in names:
        if name == "widen":
            widen_overflows(ir)
        elif name == "shift64":
            mul64_to_shift(ir)
        elif name == "wide_load":
            wide_loads(ir)
        elif name == "tree_to_mla":
            tree_to_mla(ir)
        elif name == "nop":
            pass
        else:
            raise ValueError("unknown rewrite %r" % name)
    return ir


def path_cost(text, weights):
    _, dist, lines, preds = estimate_critical_path(text)
    i = max(range(len(dist)), key=dist.__getitem__)
    cost = 0.0
    while True:
        cost += weights.get(parse_inst(lines[i])[0], 0.0)
        if preds[i]:
            i = max(preds[i], key=dist.__getitem__)
        else:
            break
    return cost


def main():
    if len(sys.argv) < 4:
        print(__doc__)
        return 2
    ir_path, machine, outdir = sys.argv[1], sys.argv[2], sys.argv[3]
    rewrites = [a.split("=", 1)[1] for a in sys.argv[4:]
                if a.startswith("--rewrite=")]
    if machine not in ("n1", "920b"):
        print("machine must be n1 or 920b", file=sys.stderr)
        return 2
    fit = json.load(open(
        "experiments/m16-dct8-protoc/fitted-%s.json" % machine))
    weights = dict(zip(fit["mnemonics"], fit["weights"]))
    doc = json.load(open(ir_path))
    os.makedirs(outdir, exist_ok=True)

    results = []
    combos = [()] + [c for r in range(1, len(rewrites) + 1)
                     for c in combinations(rewrites, r)]
    for combo in combos:
        tag = "-".join(combo) or "baseline"
        ir = MachineIR(function=doc.get("function"),
                       nodes=[dict(n) for n in doc["nodes"]])
        apply_rewrites(ir, combo)
        cpp = emit_dct8_c_intrinsics(ir, func_name="dynopt_search_candidate")
        src = os.path.join(outdir, "%s.cpp" % tag)
        obj = os.path.join(outdir, "%s.o" % tag)
        with open(src, "w") as f:
            f.write(cpp)
        subprocess.run(["aarch64-linux-gnu-g++", "-O2", "-DNDEBUG",
                        "-march=armv8-a", "-c", src, "-o", obj], check=True)
        dis = subprocess.run(["aarch64-linux-gnu-objdump", "-d", obj],
                             stdout=subprocess.PIPE, check=True)
        cost = path_cost(dis.stdout.decode(), weights)
        total = sum(1 for l in dis.stdout.decode().splitlines()
                    if parse_inst(l))
        results.append((tag, combo, cost, total))
        print("candidate %-12s rewrites=%-12s cost=%.2f insns=%d"
              % (tag, ",".join(combo) or "-", cost, total))
    results.sort(key=lambda r: r[2])
    json.dump([{"tag": t, "rewrites": c, "cost": k, "insns": n}
               for t, c, k, n in results],
              open(os.path.join(outdir, "ranking.json"), "w"), indent=1)
    print("ranked: " + " < ".join(t for t, _, _, _ in results))
    return 0


if __name__ == "__main__":
    sys.exit(main())
