"""Bounded cover search for dct16 (AGO M3, docs/79).

All covers share the upstream dct16 dataflow (pass1: even/odd split ->
butterfly; pass2: k-batch even/odd) and differ in the pass2 instruction
selection for the 4-element butterfly reduction:

  A neon_bridge   : SVE2 svaddl + NEON vpaddq_s32 (permute_ratio=12.0%)
  B pure_sve2     : SVE2 addp_s32 inline asm (RMW, permute_ratio=43.4%)
  C op895         : hand-written reference (permute_ratio=18.5%)

Cover A (neon_bridge) is the P2 winner (docs/79): the NEON vpaddq
avoids the addp_s32 RMW serial dependency that makes Cover B
permute-bound on 950. Cover C is the upstream hand-written baseline.
"""

from __future__ import annotations
from typing import Dict


def cover_meta() -> Dict:
    return {
        "covers": ["A", "B", "C"],
        "names": {
            "A": "neon_bridge (SVE2+NEON vpaddq, permute=12.0%)",
            "B": "pure_sve2 (addp_s32 RMW, permute=43.4%)",
            "C": "op895 (hand-written reference, permute=18.5%)",
        },
        "cp_chains": {
            "A": ["ld1", "addl_s16", "paddl_s32", "rshrnb", "st1"],
            "B": ["ld1", "addl_s16", "paddl_s32", "rshrnb", "st1"],
            "C": ["ld1", "addl_s16", "paddl_s32", "rshrnb", "st1"],
        },
        "tail_ops": {
            "A": ["paddl_s32", "rshrnb", "st1"],
            "B": ["paddl_s32", "rshrnb", "st1"],
            "C": ["paddl_s32", "rshrnb", "st1"],
        },
        "expected_permute_ratio": {
            "A": 0.120,  # measured (docs/79)
            "B": 0.434,  # measured (docs/79)
            "C": 0.185,  # measured (docs/79)
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_dct16_sve2_shared") -> str:
    import os
    import sys

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    _ir = os.path.join(_ROOT, "optimizer", "ir")
    if _ir not in sys.path:
        sys.path.insert(0, _ir)

    if cover == "A":
        from dct16_wide_sve2 import emit_candidate
        return emit_candidate("neon_bridge")
    if cover == "B":
        from dct16_wide_sve2 import emit_candidate
        return emit_candidate("pure_sve2")
    if cover == "C":
        # hand-written op895 reference
        ref_path = os.path.join(_ROOT, "kernels/dct16/candidates",
                                "best_sve2_op895.cpp")
        with open(ref_path) as f:
            return f.read()
    raise ValueError("dct16 cover %s not defined" % cover)
