"""AGO rule/template protocol (round-0024 interface, M3).

The smallest composable interface, with one shared proof object:

    Pattern.match(region) -> bindings | no-match
    RewriteRule.apply(region, bindings) -> new_region + ProofObligations
    CoverTemplate.emit(region, bindings, target) -> source + obligations
    Verifier.check(contract, artifact, obligations) -> evidence

Rules/templates declare id, phase, effect summary, shape/alias
preconditions, a decreasing/bounded measure, canonical parameter
serialization, and a fallback. A "region" here is a typed symbolic
expression/loop fragment (DSL or IR graph); state-machine kernels use
explicit templates (M3) rather than automatic discovery.
"""

from __future__ import annotations

import json
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Tuple


@dataclass(frozen=True)
class ProofObligation:
    id: str
    kind: str                  # exhaustive_table | differential | guard
    spec: Dict = field(default_factory=dict)

    def to_json(self) -> str:
        return json.dumps({"id": self.id, "kind": self.kind,
                           "spec": self.spec}, sort_keys=True)


@dataclass(frozen=True)
class RuleBinding:
    values: Dict[str, Any] = field(default_factory=dict)


class Pattern:
    """Typed pattern with a fail-closed match predicate."""

    name = "pattern"

    def match(self, region: Any) -> Optional[RuleBinding]:
        raise NotImplementedError


class RewriteRule:
    """Semantic rewrite: region -> new region + proof obligations."""

    id = "rule"
    phase = "rewrite"
    effect = ""
    measure = ""                 # decreasing/bounded measure description

    def preconditions(self, region: Any, bindings: RuleBinding) -> bool:
        return True

    def apply(self, region: Any,
              bindings: RuleBinding) -> Tuple[Any, List[ProofObligation]]:
        raise NotImplementedError

    def fallback(self, region: Any) -> Any:
        return region


class CoverTemplate:
    """Target implementation template: region -> source + obligations."""

    id = "template"
    target = "neon"              # neon | sve1 | sve2 | scalar

    def preconditions(self, region: Any, bindings: RuleBinding) -> bool:
        return True

    def emit(self, region: Any, bindings: RuleBinding,
             target: str = "") -> Tuple[str, List[ProofObligation]]:
        raise NotImplementedError


class Verifier:
    """Checks obligations against a compiled artifact."""

    name = "verifier"

    def check(self, contract: str, artifact: str,
              obligations: List[ProofObligation]) -> Dict:
        """Returns evidence dict; raises on unfulfilled obligation."""
        raise NotImplementedError
