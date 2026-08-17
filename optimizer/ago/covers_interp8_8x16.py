"""Bounded cover search for interp8-8x16 (AGO M3 extension).

Covers (export dynopt_interp8_8x16_sve2):

  A best_ir : IR-generated hpp (8x16, fused unrolled, permute 0%) —
              the manifest-exporting candidate.

Gate-arbitrated bit-exact vs the 8x16 interp8 reference.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_ir.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_s16", "mla_s16", "tbl_s16", "add_s16",
          "qxtun_s16", "uzp1_u8", "st1_u8"]
    tail = (["ld1_u8"] * 512 + ["addl_s16"] * 256 +
            ["mla_s16"] * 256 + ["tbl_s16"] * 64 +
            ["qxtun_s16"] * 128 + ["uzp1_u8"] * 128 +
            ["st1_u8"] * 128)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_ir (hpp 8x16, permute=0%)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.0,
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_interp8_8x16_sve2") -> str:
    """Return the interp8-8x16 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("interp8-8x16 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "interp8-8x16", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
