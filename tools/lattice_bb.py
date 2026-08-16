#!/usr/bin/env python3
"""Generic axis-lattice B&B engine (docs/74 §2/§4).

The lattice is defined implicitly by the measured combo table
(combo: tuple of axis values -> cost).  A partial assignment's
children expand the next unassigned axis with the values that actually
appear in combos matching the partial.  The admissible lower bound is
the minimum measured cost over all combos matching the partial
(trivially <= any leaf below it).

Usage:
  from lattice_bb import bb_search, acceptance
  best, explored, pruned = bb_search(combos)
  report = acceptance(combos, min_reduction=2.0)
"""

import heapq


def bb_search(combos):
    """combos: {tuple-of-axis-values: cost}.  Returns
    (best, explored, pruned)."""
    if not combos:
        return None, 0, 0
    n_axes = len(next(iter(combos)))
    start = (None,) * n_axes

    def lb(partial):
        best_c = None
        for combo, fused in combos.items():
            if all(v is None or combo[i] == v
                   for i, v in enumerate(partial)):
                if best_c is None or fused < best_c:
                    best_c = fused
        return best_c

    heap = [(lb(start), 0, start)]
    counter = 1
    best = None
    explored = 0
    pruned = 0
    while heap:
        l, _, partial = heapq.heappop(heap)
        if best is not None and l >= best:
            pruned += 1
            continue
        explored += 1
        if all(v is not None for v in partial):
            if best is None or combos[partial] < best:
                best = combos[partial]
            continue
        idx = partial.index(None)
        seen = {c[idx] for c in combos
                if all(v is None or c[i] == v
                       for i, v in enumerate(partial))}
        for v in sorted(seen):
            child = list(partial)
            child[idx] = v
            child = tuple(child)
            nlb = lb(child)
            if best is not None and nlb >= best:
                pruned += 1
                continue
            heapq.heappush(heap, (nlb, counter, child))
            counter += 1
    return best, explored, pruned


def acceptance(combos, min_reduction=2.0):
    """Full acceptance report (docs/74 §4)."""
    full_best = min(combos.values())
    bb, explored, pruned = bb_search(combos)
    return {
        "candidates": len(combos),
        "full_best": full_best,
        "bb_best": bb,
        "same_best": bb == full_best,
        "explored": explored,
        "pruned": pruned,
        "node_reduction": len(combos) / max(1, explored),
        "gate_met": bb == full_best and
                    len(combos) / max(1, explored) >= min_reduction,
    }
