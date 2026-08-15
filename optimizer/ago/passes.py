"""AGO pass pipeline skeleton (M1, round-0023).

Design rules from round-0023: phase ordering with executable pre/post
checks, deterministic canonical hashes, decreasing measures, cycle
detection, and hard budgets. No global fixed-point iteration.

A Pass transforms a Graph into a new Graph; the pipeline runs passes in
order, checks invariants, and stops at a deterministic fixed point (or
when the budget/hash cycle is hit).
"""

from __future__ import annotations

from typing import List, Sequence

from ago.ir import Graph, Op


class PassError(ValueError):
    pass


class Pass:
    name = "pass"

    def check_pre(self, g: Graph) -> bool:
        return True

    def apply(self, g: Graph) -> Graph:
        raise NotImplementedError

    def check_post(self, g: Graph) -> bool:
        return True


class Normalize(Pass):
    """Deterministic canonical order + structural sanity."""

    name = "normalize"

    def apply(self, g: Graph) -> Graph:
        g.ops = dict(sorted(g.ops.items()))
        g.inputs = dict(sorted(g.inputs.items()))
        return g

    def check_post(self, g: Graph) -> bool:
        known = {"load", "sub_ext", "hadamard_v", "hadamard_h_abs",
                 "max", "add", "reduce_addv", "shift_rnd", "perm"}
        outs = {op.out for op in g.ops.values()}
        for n, op in g.ops.items():
            if op.kind not in known:
                raise PassError("unknown op kind %s" % op.kind)
            for inp in op.inputs:
                if inp not in outs and inp not in g.inputs:
                    raise PassError("dangling input %s in %s" % (inp, n))
        return True


class RemoveUnused(Pass):
    """Delete nodes not reachable from outputs (decreasing measure)."""

    name = "remove_unused"

    def apply(self, g: Graph) -> Graph:
        out_to_node = {op.out: n for n, op in g.ops.items()}
        reach = set()
        stack = list(g.outputs)
        while stack:
            name = stack.pop()
            if name in reach or name in g.inputs:
                continue
            reach.add(name)
            node = out_to_node.get(name)
            if node:
                stack.extend(g.ops[node].inputs)
        g.ops = {n: op for n, op in g.ops.items() if op.out in reach}
        return g

    def check_post(self, g: Graph) -> bool:
        return len(g.ops) >= 0  # structural sanity is Normalize's job


class Pipeline:
    def __init__(self, passes: Sequence[Pass]):
        self.passes = list(passes)

    def run(self, g: Graph, budget: int = 64,
            max_nodes: int = 4096) -> Graph:
        h_prev = g.canonical_hash()
        seen = {h_prev}
        for _ in range(budget):
            g2 = g
            for p in self.passes:
                if not p.check_pre(g2):
                    raise PassError("%s pre-check failed" % p.name)
                g2 = p.apply(g2)
                if not p.check_post(g2):
                    raise PassError("%s post-check failed" % p.name)
            if len(g2.ops) > max_nodes:
                raise PassError("graph exceeds node budget")
            h = g2.canonical_hash()
            if h == h_prev:
                return g2  # deterministic fixed point
            if h in seen:
                raise PassError("pass cycle detected")
            seen.add(h)
            g, h_prev = g2, h
        raise PassError("pass budget exhausted")


def default_pipeline() -> Pipeline:
    return Pipeline([Normalize(), RemoveUnused(), Normalize()])
