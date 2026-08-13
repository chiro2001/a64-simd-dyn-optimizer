"""Range-aware per-target cost model (docs/09 resource lower bound, v0).

The M14-M16 measurements showed that raw instruction count does not predict
cycles (proto_b: -34% insns but slower on N1). This module implements the
resource lower-bound model from docs/09:

    cycles_lb = max over resource classes of (uops / rate)

Instruction mnemonics are classified into the resource classes that dominate
AArch64 SIMD kernels (mul, add, permute, narrow, load, store, scalar); each
TargetProfile supplies per-class weights (cycles per instruction) and an
issue rate, so different machines can prefer different candidates.

KNOWN LIMITATION (calibrated 2026-08-13): the linear throughput form cannot
predict LATENCY-mode measurements (tools/calibrate_cost.py fits R2 < 0 on the
M14-M16 data). Latency on these kernels is dominated by the dependency-chain
critical path (e.g. the 4-deep mla chain on N1), which the docs/09
`critical_path_latency` term must model. The next increment adds a
dependency-graph critical-path estimator; this module supplies only the
resource/frontend terms today.
"""

import collections
import re


# Resource classes by mnemonic. A mnemonic may appear in several classes only
# when it is genuinely ambiguous; here the classes are chosen to be disjoint
# for the DCT8 op family.
CLASSES = {
    "mul": {"mul", "mla", "mls", "smull", "umull", "sqdmulh", "sqrdmulh",
            "fmla", "fmls", "fmul", "sqdmull", "sqdmull2"},
    "add": {"add", "sub", "saddl", "ssubl", "saddw", "ssubw", "addp",
            "sadalp", "uadalp", "addv", "saddv", "uaddv", "addhn", "raddhn"},
    "permute": {"trn1", "trn2", "zip1", "zip2", "uzp1", "uzp2", "ext", "tbl",
                "tbx", "rev16", "rev32", "rev64", "dup", "mov"},
    "narrow": {"rshrn", "sqrshrn", "uqrshrn", "shrn", "sqshrn", "uqrshl",
               "sqxtn", "uqxtn", "sxtl", "uxtl"},
    "load": {"ld1", "ld2", "ld3", "ld4", "ldr", "ldp", "ldur", "ld1r"},
    "store": {"st1", "st2", "st3", "st4", "str", "stp", "stur"},
    "shift": {"shl", "sshr", "ushr", "sli", "sri"},
    "fused": {"movprfx"},   # hardware-fused with the next instruction
    "scalar": set(),   # anything not matched above
}


class TargetProfile:
    """Per-class cycles-per-instruction weights and issue width."""

    def __init__(self, name, issue_rate=4.0, **weights):
        self.name = name
        self.issue_rate = issue_rate
        self.weights = weights

    def weight(self, cls):
        return self.weights.get(cls, 1.0)


def classify(hist):
    """hist: mnemonic -> count. Returns resource-class counts."""
    out = collections.Counter()
    for mn, n in hist.items():
        for cls, mns in CLASSES.items():
            if mn in mns:
                out[cls] += n
                break
        else:
            out["scalar"] += n
    return out


def cycles_lb(hist, profile):
    """Resource lower bound (max over classes, plus the frontend bound)."""
    cls = classify(hist)
    per_class = {c: cls[c] * profile.weight(c)
                 for c in cls if c != "fused"}
    # movprfx is fused with the next instruction (docs/09 §1.5): it neither
    # occupies a resource slot nor a frontend slot.
    frontend = sum(cls[c] for c in cls if c != "fused") \
        / max(profile.issue_rate, 1e-9)
    bounds = dict(per_class)
    bounds["frontend"] = frontend
    return max(bounds.values(), default=0.0), bounds


def parse_disasm_hist(text):
    """Parse GNU objdump output text into a mnemonic histogram."""
    hist = collections.Counter()
    for line in text.splitlines():
        m = re.match(r"\s*[0-9a-f]+:\s+(?:[0-9a-f]{8}\s+)([a-z0-9]+)", line)
        if m:
            hist[m.group(1)] += 1
    return hist


# Seed profiles: rough per-class cycles for two measured machines. These are
# v0 seeds to be fitted against the M14-M16 paired measurements by
# tools/calibrate_cost.py; they are not vendor numbers.
N1_PROFILE = TargetProfile(
    "n1-neon128",
    issue_rate=4.0,
    mul=2.0, add=1.0, permute=1.0, narrow=1.0,
    load=1.0, store=1.0, shift=1.0, scalar=1.0)

K920B_PROFILE = TargetProfile(
    "kunpeng-920b",
    issue_rate=4.0,
    mul=1.0, add=1.0, permute=1.0, narrow=1.0,
    load=1.0, store=1.0, shift=1.0, scalar=1.0)
