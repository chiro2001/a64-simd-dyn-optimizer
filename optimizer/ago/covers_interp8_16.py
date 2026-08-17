"""Bounded cover search for interp8-16 (AGO M3 extension).

Covers (export dynopt_interp8_16_sve2):

  A best_ir : IR-generated hpp (the manifest-exporting candidate).

Gate-arbitrated bit-exact vs the interp8-16 reference.
"""

from __future__ import annotations

from typing import Dict

import os

_ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
_FILES = {"A": "best_ir.cpp"}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_s16", "mla_s16", "tbl_s16", "qxtun_s16",
          "uzp1_u8", "st1_u8"]
    return {
        "covers": ["A"],
        "names": {"A": "best_ir (hpp)"},
        "cp_chains": {"A": cp},
        "tail_ops": {"A": cp},
        "expected_permute_ratio": {"A": 0.0},
    }


def emit_cover(cover: str, func_name: str = "dynopt_interp8_16_sve2") -> str:
    if cover != "A":
        raise ValueError("interp8-16 cover %s not defined" % cover)
    p = os.path.join(_ROOT, "kernels", "interp8-16", "candidates", _FILES["A"])
    with open(p) as f:
        return f.read()
