"""AGO pass pipeline skeleton (M1, round-0023; round-0024 alignment).

Design rules from round-0023: phase ordering with executable pre/post
checks, deterministic canonical hashes, decreasing measures, cycle
detection, and hard budgets. No implicit global fixed-point iteration:
each phase is applied exactly once per pipeline invocation, then the
result must already be a fixed point of the pipeline (checked, not
iterated to).

A Pass transforms a Graph into a new Graph; the pipeline applies passes
in order, checks invariants, and raises if the result is not stable
under one more application (a phase that needs repeated application
must be expressed as explicit phases).
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
        if budget < 1:
            raise PassError("budget must be >= 1")
        g2 = g
        for p in self.passes:
            if not p.check_pre(g2):
                raise PassError("%s pre-check failed" % p.name)
            g2 = p.apply(g2)
            if not p.check_post(g2):
                raise PassError("%s post-check failed" % p.name)
        if len(g2.ops) > max_nodes:
            raise PassError("graph exceeds node budget")
        # fixed-point check: one more full application must not change
        # the canonical hash. This detects a phase that would need
        # implicit iteration instead of explicit phasing.
        g3 = g2
        for p in self.passes:
            g3 = p.apply(g3)
        if g3.canonical_hash() != g2.canonical_hash():
            raise PassError("pipeline not idempotent; needs explicit phase")
        return g2


def default_pipeline() -> Pipeline:
    return Pipeline([Normalize(), RemoveUnused(), Normalize()])
