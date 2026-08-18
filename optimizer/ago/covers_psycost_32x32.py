"""Bounded cover search for psy-cost 32x32 (AGO, docs/86).

Wraps kernels/psy-cost-32x32/candidates/best_sve2.cpp.
920B measured: ratio_vs_dispatch=1.004 (0.4% faster, within noise).
Symbol: dynopt_psy_cost_pp_32x32_sve2
"""

from __future__ import annotations

from typing import Dict

_FILES = {"A": "best_sve2.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "abs_s16", "add_u16", "paddl_u16",
          "add_u16"]
    tail = (["ld1_u8"] * 128 + ["abd_u8"] * 64 + ["abs_s16"] * 64 +
            ["paddl_u16"] * 16 + ["add_u16"] * 16)
    return {
        "covers": ["A"],
        "names": {"A": "best_sve2 (NEON hadamard 32x32)"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str,
               func_name: str = "dynopt_psy_cost_pp_32x32_sve2") -> str:
    if cover not in _FILES:
        raise ValueError("psy-cost-32x32 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "psy-cost-32x32", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
