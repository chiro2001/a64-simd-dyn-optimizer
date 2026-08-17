"""Bounded cover search for sao-stats-e0 (AGO M3 extension).

Covers (all export dynopt_sao_stats_e0_64_sve2):

  A best_ir      : IR-generated (fused=213, permute=9.5%, cp_lat 39)
  B best_ir_sve2 : IR SVE2 (fused=167, permute=11.1%, cp_lat 33)
  C best_sve2    : hand-written SVE2 (fused=165, permute=11.1%, 33)
  D block16_sve2 : 16-row block variant (fused=165, same as C)
  E block32_sve2 : 32-row block variant (fused=102, permute=15.9%)

The auto-search ranks all five on the 950 table (uop-light E vs
permute-light A: the predictor decides).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_ir.cpp",
    "B": "best_ir_sve2.cpp",
    "C": "best_sve2.cpp",
    "D": "block16_sve2.cpp",
    "E": "block32_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "add_u8", "abd_u8", "add_u16", "hist_u8"]
    tail = (["ld1_u8"] * 64 + ["add_u8"] * 32 + ["abd_u8"] * 32 +
            ["add_u16"] * 16 + ["hist_u8"] * 8)
    return {
        "covers": ["A", "B", "C", "D", "E"],
        "names": {
            "A": "best_ir (fused=213, permute=9.5%)",
            "B": "best_ir_sve2 (fused=167, permute=11.1%)",
            "C": "best_sve2 (fused=165, permute=11.1%)",
            "D": "block16_sve2 (fused=165)",
            "E": "block32_sve2 (fused=102, permute=15.9%)",
        },
        "cp_chains": {"A": cp, "B": cp, "C": cp, "D": cp, "E": cp},
        "tail_ops": {"A": tail, "B": tail, "C": tail, "D": tail, "E": tail},
        "expected_permute_ratio": {
            "A": 0.095,  # measured
            "B": 0.111,  # measured
            "C": 0.111,  # measured
            "D": 0.111,  # measured
            "E": 0.159,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_stats_e0_64_sve2") -> str:
    """Return an existing sao-stats-e0 candidate source (symbol in file)."""
    if cover not in _FILES:
        raise ValueError("sao-e0 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-stats-e0", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
