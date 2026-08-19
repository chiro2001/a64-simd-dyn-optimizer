"""Bounded cover search for sao (AGO M3 extension).

Covers (export dynopt_sao_e0_64_sve2):

  A : existing candidate (gate-arbitrated bit-exact vs the sao
      reference).
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_sve2_e0.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "add_s16", "tbl_s16", "st1_u8"]
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "best_sve2 (NEON-intrinsic E0, width 64)",
            "B": "best_sve2_e0 (SVE2 E0, width 64)",
        },
        "cp_chains": {"A": cp, "B": cp},
        "tail_ops": {"A": cp, "B": cp},
        "expected_permute_ratio": {"A": 0.0, "B": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_sao_e0_64_sve2") -> str:
    if cover not in _FILES:
        raise ValueError("sao cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "sao", "candidates", _FILES[cover])
    with open(p) as f:
        return f.read()
