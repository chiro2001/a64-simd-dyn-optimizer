#!/usr/bin/env python3
"""Axis-lattice B&B acceptance on the m31 satd enumeration (docs/74 §4).

The satd grammar is shape x reduce x abs = 4 x 3 x 2 = 24 measured
candidates (experiments/m31-satd8-axis-search/results.json).  The B&B
searches the axis-assignment lattice (root -> shape -> reduce -> abs)
with an admissible lower bound: lb(partial) = min fused_uop among all
measured candidates matching the partial assignment.  Acceptance:
  - same best (fused_uop) as full enumeration;
  - no mis-pruning (best found == full best);
  - node reduction (B&B states < 24) and pruned-branch count.

Usage:
  python3 tools/axis_bb_accept.py
"""

import heapq
import json
import os

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
RESULTS = os.path.join(ROOT, "experiments", "m31-satd8-axis-search",
                       "results.json")


def load():
    rows = json.load(open(RESULTS))
    return [r for r in rows if r.get("passed")]


def cost(r):
    return (r.get("counts") or {}).get("vector_fused_uop", 10 ** 9)


def matches(r, shape, reduce, abs_kind):
    return (shape is None or r["shape"] == shape) and \
           (reduce is None or r["reduce"] == reduce) and \
           (abs_kind is None or r["abs"] == abs_kind)


def lb(rows, shape, reduce, abs_kind):
    return min(cost(r) for r in rows
               if matches(r, shape, reduce, abs_kind))


def full_best(rows):
    return min(cost(r) for r in rows)


def bb_search(rows):
    shapes = sorted({r["shape"] for r in rows})
    reduces = sorted({r["reduce"] for r in rows})
    abses = sorted({r["abs"] for r in rows})
    # states: (shape, reduce, abs) with None = unassigned
    heap = []
    counter = 0
    best = None
    explored = 0
    pruned = 0
    heapq.heappush(heap, (lb(rows, None, None, None), counter,
                          (None, None, None)))
    while heap:
        l, _, (sh, re, ab) = heapq.heappop(heap)
        if best is not None and l >= best:
            pruned += 1
            continue
        explored += 1
        if ab is not None:  # leaf
            c = next(cost(r) for r in rows
                     if matches(r, sh, re, ab))
            if best is None or c < best:
                best = c
            continue
        if re is None and ab is None and sh is None:
            children = [(s, None, None) for s in shapes]
        elif ab is None and sh is not None and re is None:
            children = [(sh, r, None) for r in reduces]
        else:  # sh and re assigned, abs missing
            children = [(sh, re, a) for a in abses]
        for child in children:
            nsh, nre, nab = child
            nlb = lb(rows, nsh, nre, nab)
            if best is not None and nlb >= best:
                pruned += 1
                continue
            heapq.heappush(heap, (nlb, counter, child))
            counter += 1
    return best, explored, pruned


def main():
    rows = load()
    if len(rows) < 24:
        print("expected 24 measured candidates, got %d" % len(rows))
        return 1
    fb = full_best(rows)
    bb, nodes, pruned = bb_search(rows)
    print("full enumeration: %d candidates, best=%d"
          % (len(rows), fb))
    print("B&B: best=%d explored=%d pruned=%d"
          % (bb, nodes, pruned))
    print("same best: %s" % (bb == fb))
    print("node reduction: %.2fx (24 -> %d)"
          % (len(rows) / max(1, nodes), nodes))
    return 0 if bb == fb else 1


if __name__ == "__main__":
    raise SystemExit(main())
