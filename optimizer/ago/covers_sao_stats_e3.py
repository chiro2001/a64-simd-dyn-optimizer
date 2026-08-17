"""Bounded cover search for sao-stats-e3 (AGO M3 extension).

Covers (export dynopt_sao_stats_e3_64_sve2):

  A block32_sve2 : 32-row block variant, 45deg-diagonal edge class
                   (fused=102, permute=10.9%) — the family-winning
                   block32 pattern applied to E3 (sign_down compares
                   rec[x] vs rec[x+stride-1], E1 used +stride)

Gate-arbitrated bit-exact vs saoCuStatsE3_neon (64x1, upBuff carry).
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "block32_sve2.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "abd_u8", "sub_s8", "add_u16", "hist_u8"]
    tail = (["ld1_u8"] * 64 + ["abd_u8"] * 32 + ["sub_s8"] * 16 +
            ["add_u16"] * 16 + ["hist_u8"] * 8)
    return {
        "covers": ["A"],
        "names": {
            "A": "block32_sve2 (fused=102, permute=10.9%)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.109,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_stats_e3_64_sve2") -> str:
    """Return an existing sao-stats-e3 candidate source."""
    if cover not in _FILES:
        raise ValueError("sao-stats-e3 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-stats-e3", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
