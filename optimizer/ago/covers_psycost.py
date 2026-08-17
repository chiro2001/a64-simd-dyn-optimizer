"""Bounded cover search for psy-cost 16x16 (AGO M3, docs/82 下一步 #4).

psy-cost has no search manifest yet (NEON upstream cost function), so
this module is used via the manifest-free ago_auto_search path (direct
emit -> compile -> static_counts -> rank), not search_sve2_layouts.

Covers wrap the existing candidates:

  A best_sve2     : hand-written SVE2 (permute_ratio=30.8%, fused=176)
  B best_ir_sve16 : dual-group 16-lane IR (permute_ratio=42.6%, fused=577,
                    expected loser on 950)

Both are near/above the 30% soft threshold (docs/81: psy-cost is the
family with the most permute-bound variants after interp8-hpp), so the
auto-search ranks A first; a width-native lowering is a future cover.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_ir_sve16.cpp",
}


def cover_meta() -> Dict:
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "best_sve2 (SVE2, permute=30.8%)",
            "B": "best_ir_sve16 (dual-group, permute=42.6%)",
        },
        "expected_permute_ratio": {
            "A": 0.308,  # measured (reports/scan-permute-all-20260818.txt)
            "B": 0.426,  # measured
        },
    }


def emit_cover(cover: str,
               func_name: str = "dynopt_psy_cost_pp_16x16_sve2") -> str:
    """Return an existing psy-cost candidate source (symbol in file)."""
    if cover not in _FILES:
        raise ValueError("psy-cost cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "psy-cost-16x16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
