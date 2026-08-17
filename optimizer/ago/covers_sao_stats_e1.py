"""Bounded cover search for sao-stats-e1 (AGO M3 extension).

Covers (all export dynopt_sao_stats_e1_64_sve2):

  A best_sve2.cpp : best_sve2.cpp (fused=)
  B block16_sve2.cpp : block16_sve2.cpp (fused=)
  C block32_sve2.cpp : block32_sve2.cpp (fused=)

Gate-arbitrated bit-exact vs the saoCuStatsE1_neon reference.
"""

from __future__ import annotations

from typing import Dict

_FILES = {'A': 'best_sve2.cpp', 'B': 'block16_sve2.cpp', 'C': 'block32_sve2.cpp'}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "add_u8", "abd_u8", "add_u16", "hist_u8"]
    tail = (["ld1_u8"] * 64 + ["add_u8"] * 32 + ["abd_u8"] * 32 +
            ["add_u16"] * 16 + ["hist_u8"] * 8)
    return {
        "covers": ['A', 'B', 'C'],
        "names": {'A': 'best_sve2.cpp (fused=)', 'B': 'block16_sve2.cpp (fused=)', 'C': 'block32_sve2.cpp (fused=)'},
        "cp_chains": {c: cp for c in ['A', 'B', 'C']},
        "tail_ops": {c: tail for c in ['A', 'B', 'C']},
        "expected_permute_ratio": {
            c: 0.12 for c in ['A', 'B', 'C']
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_stats_e1_64_sve2") -> str:
    """Return an existing sao-stats-e1 candidate source."""
    if cover not in _FILES:
        raise ValueError("sao-stats-e1 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "sao-stats-e1", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
