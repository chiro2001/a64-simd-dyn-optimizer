"""Bounded cover search for psy-cost 64x64 (AGO, docs/86).

Wraps kernels/psy-cost-64x64/candidates/best_sve2.cpp.
920B measured: ratio_vs_dispatch=0.992 (0.8% slower, within noise).
Symbol: dynopt_psy_cost_pp_64x64_sve2
"""

from __future__ import annotations

from typing import Dict

_FILES = {"A": "best_sve2.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "abs_s16", "add_u16", "paddl_u16",
          "add_u16"]
    tail = (["ld1_u8"] * 512 + ["abd_u8"] * 256 + ["abs_s16"] * 256 +
            ["paddl_u16"] * 64 + ["add_u16"] * 64)
    return {
        "covers": ["A"],
        "names": {"A": "best_sve2 (NEON hadamard 64x64)"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str,
               func_name: str = "dynopt_psy_cost_pp_64x64_sve2") -> str:
    if cover not in _FILES:
        raise ValueError("psy-cost-64x64 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "psy-cost-64x64", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
