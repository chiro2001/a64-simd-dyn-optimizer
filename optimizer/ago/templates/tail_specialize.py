"""P4 tail-specialization template (AGO P4).

Split a bounded vector loop into full-width chunks plus a partial tail.
The template emits main bodies (full vector width) and, when the count
is not a multiple of the width, a tail body that must handle the
remainder (predicated/partial load-store or scalar cleanup).  The
proof obligation is tail coverage: every index 0..count-1 is touched
exactly once, and the remainder is in [1, width-1].
"""

from __future__ import annotations

from typing import Callable, List, Tuple

from ago.rules import (  # noqa: E402
    CoverTemplate, Pattern, ProofObligation, RewriteRule, RuleBinding)


class TailSpecializePattern(Pattern):
    name = "vector-loop-with-remainder"

    def match(self, region):
        # region: (width:int, count:int, main:callable(start)->str,
        #          tail:callable(rem)->str)
        if (isinstance(region, tuple) and len(region) == 4
                and isinstance(region[0], int) and region[0] > 0
                and isinstance(region[1], int) and region[1] > 0):
            return RuleBinding({"width": region[0], "count": region[1],
                                "main_body": region[2],
                                "tail_body": region[3]})
        return None


class TailSpecializeRewrite(RewriteRule):
    id = "tail-specialize"
    phase = "loop-split"
    effect = "vector main loop + partial tail (predicate/scalar cleanup)"
    measure = "tail partial lanes <= width-1; main fully vectorized"

    def preconditions(self, region, bindings):
        w = bindings.values["width"]
        n = bindings.values["count"]
        return isinstance(w, int) and isinstance(n, int) and 0 < w <= 64 \
            and 0 < n <= 1 << 20

    def apply(self, region, bindings):
        return _split(region[0], region[1], region[2], region[3]), \
            _obligations(region[0], region[1])

    def fallback(self, region):
        return None


def _split(w: int, n: int, main: Callable[[int], str],
           tail: Callable[[int], str]) -> str:
    full = (n // w) * w
    parts = []
    for s in range(0, full, w):
        parts.append(main(s))
    rem = n - full
    if rem:
        parts.append(tail(rem))
    return "\n".join(parts)


def _obligations(w: int, n: int) -> List[ProofObligation]:
    rem = n % w
    return [
        ProofObligation("tail-cover-%d-%d" % (w, n), "differential",
                        {"kind": "main+tail coverage",
                         "domain": "indices [0,%d) touched exactly once; "
                                   "remainder %d in [1,%d)" % (n, rem, w)}),
    ]


class TailSpecializeTemplate(CoverTemplate):
    id = "tail-specialize"
    target = "neon|sve1|sve2"

    def preconditions(self, region, bindings):
        return TailSpecializeRewrite().preconditions(region, bindings)

    def emit(self, region, bindings, target="") -> Tuple[str,
                                                          List[ProofObligation]]:
        w = bindings.values["width"]
        n = bindings.values["count"]
        return _split(w, n, bindings.values["main_body"],
                      bindings.values["tail_body"]), _obligations(w, n)
