"""Bounded cover search for psy-cost 8x8 (AGO, docs/86).

Wraps the existing candidate (kernels/psy-cost-8x8/candidates/best_sve2.cpp).
The 8x8 shape is the 920B's biggest stable win (14.7% faster than hand-written
dispatch; docs/83 round 35). The candidate is a NEON implementation (vaddq/
vsubq/vtrn1q hadamard + vabd absolute difference), not SVE2 — the win comes
from tighter instruction scheduling on small blocks where x265's hand-written
code is suboptimal.

Single cover A = best_sve2 (the only candidate).
Symbol: dynopt_psy_cost_pp_8x8_sve2
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "abs_s16", "add_u16", "paddl_u16",
          "add_u16"]
    tail = (["ld1_u8"] * 8 + ["abd_u8"] * 4 + ["abs_s16"] * 4 +
            ["paddl_u16"] * 1 + ["add_u16"] * 1)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_sve2 (NEON hadamard 8x8, 920B win 14.7%)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str,
               func_name: str = "dynopt_psy_cost_pp_8x8_sve2") -> str:
    if cover not in _FILES:
        raise ValueError("psy-cost-8x8 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "psy-cost-8x8", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
