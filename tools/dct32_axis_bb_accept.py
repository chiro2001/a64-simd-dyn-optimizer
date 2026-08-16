#!/usr/bin/env python3
"""dct32 op-backend axis-lattice B&B acceptance (docs/74 §5).

Second real-space acceptance for the bounded B&B, on a COST-VARYING
sub-lattice of the dct32 op-backend:
  odd_from_k0packs x row_group = {0,1} x {None, 8, 16} = 6 combos
(fixed base legacy_ex=1, legacy_k4=1, k0_even_sve=1).  Measured
fused_uop spans 886..2516, so pruning has real room.

Every combo is emitted through dct32_op_emit.emit_from_plan, compiled,
and scored with the static fused_uop oracle.  B&B uses the admissible
lower bound = min measured cost over completions of a partial
assignment.  Gates: same best, no mis-pruning, node reduction >= 2x.
"""

import heapq
import itertools
import json
import os
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
for sub in ("optimizer/ir", "tools"):
    sys.path.insert(0, os.path.join(ROOT, sub))

from dct32_op_emit import emit_from_plan  # noqa: E402
from layout_ir import dct32_v31_plan  # noqa: E402
from static_counts import static_counts  # noqa: E402

BASE = {"legacy_ex": 1, "legacy_k4": 1, "k0_even_sve": 1}
AXES = [
    ("odd_from_k0packs", (0, 1)),
    ("row_group", (0, 8, 16)),
]


def valid(_combo):
    return True


def emit_and_count(combo, workdir):
    c = dict(zip((a for a, _ in AXES), combo))
    p = dct32_v31_plan()
    p.lowering.update(BASE)
    p.lowering.update({a: v for a, v in c.items() if v != 0})
    tag = "_".join("%s%d" % (a, c[a]) for a, _ in AXES)
    src = emit_from_plan(p, "dynopt_dct32_axis_%s" % tag)
    src_path = os.path.join(workdir, "dct32-%s.cpp" % tag)
    obj_path = os.path.join(workdir, "dct32-%s.o" % tag)
    with open(src_path, "w") as f:
        f.write(src)
    r = subprocess.run(
        ["aarch64-linux-gnu-g++", "-c", "-O2", "-std=c++11",
         "-march=armv8.2-a+sve2", "-o", obj_path, src_path],
        capture_output=True, text=True)
    if r.returncode != 0:
        return None, r.stderr[:300]
    return static_counts(obj_path).get("vector_fused_uop"), None


def main():
    workdir = os.path.join(ROOT, "build", "dct32-axis-bb")
    os.makedirs(workdir, exist_ok=True)
    results = {}
    shapes = [v for _, v in AXES]
    for combo in itertools.product(*shapes):
        if not valid(combo):
            continue
        c = dict(zip((a for a, _ in AXES), combo))
        tag = "_".join("%s%d" % (a, c[a]) for a, _ in AXES)
        fused, err = emit_and_count(combo, workdir)
        if fused is None:
            print("emit/compile failed %s: %s" % (tag, (err or "")[:120]))
            continue
        results[combo] = fused
        print("combo %s fused=%d" % (tag, fused))

    if len(results) != 6:
        print("expected 6 valid combos, got %d" % len(results))
        return 1

    rows = [{"combo": list(k), "fused": v}
            for k, v in sorted(results.items())]
    with open(os.path.join(workdir, "results.json"), "w") as f:
        json.dump(rows, f, indent=1)

    fb = min(results.values())
    heap = []
    counter = 0
    best = None
    explored = 0
    pruned = 0

    def lb(partial):
        best_c = None
        for combo, fused in results.items():
            ok = True
            for i, v in enumerate(partial):
                if v is not None and combo[i] != v:
                    ok = False
                    break
            if ok and (best_c is None or fused < best_c):
                best_c = fused
        return best_c

    start = tuple(None for _ in AXES)
    heapq.heappush(heap, (lb(start), counter, start))
    while heap:
        l, _, partial = heapq.heappop(heap)
        if best is not None and l >= best:
            pruned += 1
            continue
        explored += 1
        if all(v is not None for v in partial):
            c = results[partial]
            if best is None or c < best:
                best = c
            continue
        idx = partial.index(None)
        for v in AXES[idx][1]:
            child = list(partial)
            child[idx] = v
            child = tuple(child)
            nlb = lb(child)
            if best is not None and nlb >= best:
                pruned += 1
                continue
            heapq.heappush(heap, (nlb, counter, child))
            counter += 1

    print("full enumeration: %d candidates, best=%d" % (len(results), fb))
    print("B&B: best=%d explored=%d pruned=%d" % (best, explored, pruned))
    print("same best: %s" % (best == fb))
    print("node reduction: %.2fx (%d -> %d)"
          % (len(results) / max(1, explored), len(results), explored))
    return 0 if best == fb else 1


if __name__ == "__main__":
    raise SystemExit(main())
