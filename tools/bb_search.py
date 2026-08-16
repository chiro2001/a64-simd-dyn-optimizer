#!/usr/bin/env python3
"""Bounded branch-and-bound prototype over a reduction-tree grammar.

Round-0028 search direction #3: "有限 B&B 加主动测量".  This prototype
validates the B&B machinery (admissible lower bound, canonical-state
dedup, optimality against full enumeration, node reduction) on a small
synthetic grammar that models vector reduction lowering (satd/sa8d
style): a set of leaf values is merged into one result, each step picks
one combine op (arity + cost), and the cost is additive.

The state is a canonical multiset of partial-group sizes, so the
exhaustive baseline is the full DFS over all op sequences (state-deduped
by visited set).  B&B explores the same tree but prunes any state whose
admissible lower bound is not better than the incumbent.

Usage:
  python3 tools/bb_search.py --instances 200          # random validation
  python3 tools/bb_search.py --n 16 --ops pair,quad    # one instance
"""

import argparse
import heapq
import random
from collections import Counter


OPS = {
    # name: (arity, cost)
    "pair": (2, 1),
    "quad": (4, 2),
    "oct": (8, 3),
}


def canonical(groups):
    """Groups as a sorted tuple (largest first) -> canonical state key."""
    return tuple(sorted(groups, reverse=True))


def merge(groups, arity):
    """Merge the `arity` largest groups (Huffman-style canonical rule)."""
    g = list(groups)
    picked = g[:arity]
    rest = g[arity:]
    rest.append(sum(picked))
    return canonical(rest)


def lower_bound(groups, ops):
    """Admissible remaining-cost bound.

    Each combine reduces the group count by (arity-1); with m groups the
    cheapest way to reach 1 needs at least ceil((m-1)/(amax-1)) ops, each
    costing at least cmin.  True cost is always >= this bound.
    """
    m = len(groups)
    if m <= 1:
        return 0
    amax = max(a for a, _ in ops)
    cmin = min(c for _, c in ops)
    return ((m - 1 + (amax - 2)) // (amax - 1)) * cmin


def exhaustive(n, ops):
    """Full DFS with visited-state dedup.  Returns (best_cost, states)."""
    start = canonical((1,) * n)
    best = [None]
    seen = {}
    stack = [(start, 0)]
    while stack:
        state, cost = stack.pop()
        if state in seen and cost >= seen[state]:
            continue
        seen[state] = cost
        if len(state) == 1:
            if best[0] is None or cost < best[0]:
                best[0] = cost
            continue
        for _, (arity, c) in ops.items():
            if len(state) >= arity:
                stack.append((merge(state, arity), cost + c))
    return best[0], len(seen)


def bb_search(n, ops):
    """Best-first B&B with admissible lower bound.  Returns
    (best_cost, explored_states, pruned_states)."""
    start = canonical((1,) * n)
    # heap entries: (priority, counter, state, cost)
    counter = 0
    heap = [(lower_bound(start, list(ops.values())), counter, start, 0)]
    counter += 1
    best_cost = None
    explored = 0
    pruned = 0
    best_at = {start: 0}
    while heap:
        lb, _, state, cost = heapq.heappop(heap)
        if best_cost is not None and lb >= best_cost:
            pruned += 1
            continue
        explored += 1
        if len(state) == 1:
            if best_cost is None or cost < best_cost:
                best_cost = cost
            continue
        for _, (arity, c) in ops.items():
            if len(state) >= arity:
                nc = cost + c
                nstate = merge(state, arity)
                if nstate in best_at and nc >= best_at[nstate]:
                    pruned += 1
                    continue
                best_at[nstate] = nc
                nlb = nc + lower_bound(
                    nstate, list(ops.values()))
                if best_cost is not None and nlb >= best_cost:
                    pruned += 1
                    continue
                heapq.heappush(heap, (nlb, counter, nstate, nc))
                counter += 1
    return best_cost, explored, pruned


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--n", type=int, default=16)
    ap.add_argument("--ops", default="pair,quad,oct",
                    help="comma-separated op names from %s" % list(OPS))
    ap.add_argument("--instances", type=int, default=0,
                    help="random-instance validation count (seeded)")
    args = ap.parse_args()

    ops = {k: OPS[k] for k in args.ops.split(",") if k in OPS}
    if len(ops) < 2:
        raise SystemExit("need at least two ops for a non-trivial space")

    if args.instances:
        rng = random.Random(7)
        mismatch = 0
        total_nodes_ex = 0
        total_nodes_bb = 0
        for i in range(args.instances):
            n = rng.randint(8, 24)
            cost_ops = {
                name: (a, rng.randint(1, 3))
                for name, (a, _) in ops.items()
            }
            ex, nodes_ex = exhaustive(n, cost_ops)
            bb, nodes_bb, pruned = bb_search(n, cost_ops)
            total_nodes_ex += nodes_ex
            total_nodes_bb += nodes_bb
            if ex != bb:
                mismatch += 1
                print("MISMATCH n=%d ops=%s ex=%s bb=%s" %
                      (n, cost_ops, ex, bb))
        print("instances=%d mismatches=%d" % (args.instances, mismatch))
        print("exhaustive states=%d bb states=%d reduction=%.2fx" %
              (total_nodes_ex, total_nodes_bb,
               total_nodes_ex / max(1, total_nodes_bb)))
        return 1 if mismatch else 0

    ex, nodes_ex = exhaustive(args.n, ops)
    bb, nodes_bb, pruned = bb_search(args.n, ops)
    print("n=%d ops=%s" % (args.n, ops))
    print("exhaustive: cost=%s states=%d" % (ex, nodes_ex))
    print("bb:         cost=%s states=%d pruned=%d" %
          (bb, nodes_bb, pruned))
    print("reduction=%.2fx" % (nodes_ex / max(1, nodes_bb)))
    return 0 if ex == bb else 1


if __name__ == "__main__":
    raise SystemExit(main())
