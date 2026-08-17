"""Bounded cover search for dct32 (AGO M3, docs/79).

All covers share the upstream dct32 dataflow and differ in the
k-section schedule:

  A loop    : loop-based k-sections (permute_ratio=19.4%, fused=761)
  B opbase  : hand-written reference (permute_ratio=21.2%, fused=1129)

Cover A (loop) is the P2 winner (docs/79): the loop-based k-section
emitter generates 33% fewer fused_uop and 53% shorter critical path
than the hand-written opbase, with 8.5% lower permute_ratio.
"""

from __future__ import annotations
from typing import Dict


def cover_meta() -> Dict:
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "loop (k-sections, permute=19.4%)",
            "B": "opbase (hand-written reference, permute=21.2%)",
        },
        "cp_chains": {
            "A": ["ld1", "addl_s16", "paddl_s32", "rshrnb", "st1"],
            "B": ["ld1", "addl_s16", "paddl_s32", "rshrnb", "st1"],
        },
        "tail_ops": {
            "A": ["paddl_s32", "rshrnb", "st1"],
            "B": ["paddl_s32", "rshrnb", "st1"],
        },
        "expected_permute_ratio": {
            "A": 0.194,  # measured (docs/79)
            "B": 0.212,  # measured (docs/79)
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_dct32_sve2_shared") -> str:
    import os
    import sys

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    _ir = os.path.join(_ROOT, "optimizer", "ir")
    if _ir not in sys.path:
        sys.path.insert(0, _ir)

    if cover == "A":
        from dct32_wide_sve2 import emit_candidate
        return emit_candidate()
    if cover == "B":
        ref_path = os.path.join(_ROOT, "kernels/dct32/candidates",
                                "best_sve2_opbase.cpp")
        with open(ref_path) as f:
            return f.read()
    raise ValueError("dct32 cover %s not defined" % cover)
