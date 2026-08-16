"""P4 full-unroll template (AGO P4; known win in dct/satd emitters).

Rewrite a bounded loop into its fully unrolled body.  The template
declares a differential proof obligation against the loop reference
(same arithmetic, same order), and the static measure is the loop
overhead removed (branch/ptr increments) at the cost of code size.
"""

from __future__ import annotations

from typing import Callable, List, Tuple

from ago.rules import (  # noqa: E402
    CoverTemplate, Pattern, ProofObligation, RewriteRule, RuleBinding)


MAX_UNROLL = 8192


class FullUnrollPattern(Pattern):
    name = "bounded-loop"

    def match(self, region):
        # region: (trip_count:int, body:str-with-{i} | callable(i)->str)
        if (isinstance(region, tuple) and len(region) == 2
                and isinstance(region[0], int) and region[0] > 0):
            return RuleBinding({"trip_count": region[0],
                                "body": region[1]})
        return None


class FullUnrollRewrite(RewriteRule):
    id = "full-unroll"
    phase = "unroll"
    effect = "bounded loop -> fully unrolled body (overhead removed)"
    measure = "loop overhead per trip; code size grows linearly"

    def preconditions(self, region, bindings):
        n = bindings.values.get("trip_count")
        return isinstance(n, int) and 0 < n <= MAX_UNROLL

    def apply(self, region, bindings):
        return _unroll(region[0], region[1]), _obligations(region[0])

    def fallback(self, region):
        return None


def _unroll(n: int, body) -> str:
    parts = []
    for i in range(n):
        parts.append(body(i) if callable(body) else body.format(i=i))
    return "\n".join(parts)


def _obligations(n: int) -> List[ProofObligation]:
    return [
        ProofObligation("unroll-full-%d" % n, "differential",
                        {"kind": "unrolled-vs-loop",
                         "domain": "same input buffer, same iteration "
                                   "order; loop body side effects "
                                   "preserved",
                         "measure": "trip count %d" % n}),
    ]


class FullUnrollTemplate(CoverTemplate):
    id = "full-unroll"
    target = "neon|sve1|sve2|scalar"

    def preconditions(self, region, bindings):
        n = bindings.values.get("trip_count")
        return isinstance(n, int) and 0 < n <= MAX_UNROLL

    def emit(self, region, bindings, target="") -> Tuple[str,
                                                          List[ProofObligation]]:
        n = bindings.values["trip_count"]
        body = bindings.values["body"]
        return _unroll(n, body), _obligations(n)
