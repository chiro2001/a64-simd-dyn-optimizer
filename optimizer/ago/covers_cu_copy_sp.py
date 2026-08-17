"""Bounded cover search for cu-copy-sp (AGO M3 extension).

Covers (export dynopt_cu_copy_sp_16x16_sve2):

  A : existing candidate (gate-arbitrated bit-exact vs the cu-copy-sp
      reference).
"""

from __future__ import annotations

from typing import Dict

import os
import glob as _g

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": os.path.basename(_g.glob(os.path.join(
    _ROOT, "kernels", "cu-copy-sp", "candidates", "*.cpp"))[0])}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "st1_u8"]
    return {
        "covers": ["A"],
        "names": {"A": "best candidate"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": ["ld1_u8", "st1_u8"]},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_cu_copy_sp_16x16_sve2") -> str:
    if cover != "A":
        raise ValueError("cu-copy-sp cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "cu-copy-sp", "candidates", _FILES["A"])
    with open(p) as f:
        return f.read()
