#!/usr/bin/env python3
"""v0 search driver: rewrite -> codegen -> compile -> disasm -> static rank.

P0 (round-0007, 2026-08-13) permanently cancelled automatic fine ranking:
after fixing the dependency graph (MLA accumulator chains, register aliases,
pair-load destinations, stack-base array round trips) the low-parameter model
still has negative held-out Spearman on both N1 and 920B, and the static
critical path ranks upstream slowest while it measures fastest. The driver
therefore only emits a SAFE STATIC PARETO order (fewest instructions first;
identical .text bodies deduped) and every distinct body must be measured on
the target machine. --fit= is rejected.

Usage:
  python3 tools/search_driver.py <machine-ir.json> <machine:n1|920b>
      <outdir> [--rewrite widen]...
  machine only labels the target (no fitted weights are loaded).
"""

import hashlib
import json
import os
import subprocess
import sys
from itertools import combinations

from optimizer.analysis.critical_path import parse_inst
from optimizer.analysis.cost import classify, parse_disasm_hist
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


def static_score(hist):
    """Safe Pareto key: total instructions, then SIMD+load instructions."""
    cls = classify(hist)
    simd_load = sum(cls.values()) - cls.get("scalar", 0)
    return sum(hist.values()), simd_load


def main():
    args = sys.argv[1:]
    for a in list(args):
        if a.startswith("--fit="):
            print("P0: automatic fine ranking is cancelled; --fit= is no "
                  "longer supported. Use the static Pareto order and "
                  "measure every distinct .text body on the target machine.",
                  file=sys.stderr)
            return 2
    if len(args) < 4:
        print(__doc__)
        return 2
    ir_path, machine, outdir = args[0], args[1], args[2]
    rewrites = [a.split("=", 1)[1] for a in args[3:]
                if a.startswith("--rewrite=")]
    if machine not in ("n1", "920b"):
        print("machine must be n1 or 920b", file=sys.stderr)
        return 2
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
        text = dis.stdout.decode()
        hist = parse_disasm_hist(text)
        total, simd_load = static_score(hist)
        body = "\n".join(l.split("\t", 1)[-1] for l in text.splitlines()
                         if ":\t" in l)
        digest = hashlib.sha256(body.encode()).hexdigest()[:12]
        results.append((tag, combo, total, simd_load, digest))
        print("candidate %-12s rewrites=%-12s insns=%d simd+load=%d text=%s"
              % (tag, ",".join(combo) or "-", total, simd_load, digest))
    results.sort(key=lambda r: (r[2], r[3]))
    json.dump([{"tag": t, "rewrites": c, "insns": n, "simd_load": s,
                "text_sha12": d}
               for t, c, n, s, d in results],
              open(os.path.join(outdir, "ranking.json"), "w"), indent=1)
    print("static Pareto order (measure every distinct .text):")
    print("  " + " < ".join(t for t, _, _, _, _ in results))
    return 0


if __name__ == "__main__":
    sys.exit(main())
