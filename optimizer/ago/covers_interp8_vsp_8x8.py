"""Bounded cover search for interp8-vsp-8x8 (AGO M3 extension).

Covers (export dynopt_interp8_vsp_8x8_sve2):

  A : existing candidate (gate-arbitrated bit-exact vs the interp8-vsp-8x8
      reference).
"""

from __future__ import annotations

from typing import Dict

import os
import glob as _g

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": os.path.basename(_g.glob(os.path.join(
    _ROOT, "kernels", "interp8-vsp-8x8", "candidates", "*.cpp"))[0])}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "add_s16", "tbl_s16", "qxtun_s16", "st1_u8"]
    return {
        "covers": ["A"],
        "names": {"A": "best candidate"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": cp},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_interp8_vsp_8x8_sve2") -> str:
    if cover != "A":
        raise ValueError("interp8-vsp-8x8 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "interp8-vsp-8x8", "candidates", _FILES["A"])
    with open(p) as f:
        return f.read()
