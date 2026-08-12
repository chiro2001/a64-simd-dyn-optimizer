"""Semantic-pattern -> instruction selector.

Given a list of semantic patterns (from the current algorithm's IR) and a
TargetFeatures gate, returns per-pattern candidate instructions from the
registry. Candidates carry a provisional static cost of 1 each; cost model
refinement (latency/throughput, spills) plugs in later.
"""

import yaml


OP_ALIASES = {
    "uaddlv": {"uaddv"},
    "uaddv": {"uaddlv"},
    "sabd": {"abd"},
    "abd": {"sabd"},
}


def load_db(path="isa/aarch64/instructions.yaml"):
    with open(path) as f:
        return yaml.safe_load(f)["instructions"]


def _pattern_compatible(insn_pattern, want):
    if "op" in insn_pattern and "op" in want:
        iop, wop = insn_pattern["op"], want["op"]
        if iop != wop and wop not in OP_ALIASES.get(iop, set()):
            return False
    for key in ("op", "lanes", "bits"):
        if key in insn_pattern and key in want and \
           insn_pattern[key] != want[key]:
            return False
    return True


def match(db, pattern, features):
    out = []
    for insn in db:
        if not features.allows(insn["feature"]):
            continue
        if not _pattern_compatible(insn["pattern"], pattern):
            continue
        out.append(insn)
    return out


def plan(db, patterns, features):
    result = {}
    for pat in patterns:
        result[tuple(sorted(pat.items()))] = match(db, pat, features)
    return result


def covered(db, features):
    return [i["id"] for i in db if features.allows(i["feature"])]
