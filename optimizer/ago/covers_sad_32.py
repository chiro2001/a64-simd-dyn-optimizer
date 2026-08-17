"""Bounded cover search for sad-32 (AGO M3 extension).

Covers (export dynopt_sad_32x32_sve2):

  A : best_sve2.cpp (existing candidate, per-row svaddv reduction;
      round-34 920B-derived finding: this pattern is the weak spot)
  B : best_sve2_adalp.cpp (round-34 uadalp wide-accumulate: one UADALP
      per 32B row -> 16 u16 accumulator, final svaddv_u16; SVE2-only)
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_sve2_adalp.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "add_s16", "tbl_s16", "st1_u8"]
    return {
        "covers": ["A", "B"],
        "names": {
            "A": "best_sve2 (per-row svaddv reduction)",
            "B": "best_sve2_adalp (uadalp wide-accumulate)",
        },
        "cp_chains": {"A": cp, "B": cp},
        "tail_ops": {"A": cp, "B": cp},
        "expected_permute_ratio": {"A": 0.0, "B": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_sad_32x32_sve2") -> str:
    if cover not in _FILES:
        raise ValueError("sad-32 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "sad-32", "candidates", _FILES[cover])
    with open(p) as f:
        return f.read()
