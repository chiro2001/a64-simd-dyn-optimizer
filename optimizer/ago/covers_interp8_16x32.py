"""Bounded cover search for interp8-16x32 (AGO M3 extension).

Covers (export dynopt_interp8_16x32_sve2):

  A best_ir : IR-generated hpp (fused unrolled, permute 0%) — the
              manifest-exporting candidate; gate-arbitrated bit-exact
              vs the 16x32 interp8 reference.

(best_ir_sve16 / best_sve2_i8mm export dynopt_interp8_hpp_* symbols -
LINK FAIL in the full pipeline, scan-only.)
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_ir.cpp",
}


def cover_meta() -> Dict:
    cp = ["ld1_u8", "addl_s16", "mla_s16", "tbl_s16", "add_s16",
          "qxtun_s16", "uzp1_u8", "st1_u8"]
    tail = (["ld1_u8"] * 2048 + ["addl_s16"] * 1024 +
            ["mla_s16"] * 1024 + ["tbl_s16"] * 256 +
            ["qxtun_s16"] * 512 + ["uzp1_u8"] * 512 +
            ["st1_u8"] * 512)
    return {
        "covers": ["A"],
        "names": {
            "A": "best_ir (hpp 16x32, permute=0%)",
        },
        "cp_chains": {"A": cp},
        "tail_ops": {"A": tail},
        "expected_permute_ratio": {
            "A": 0.0,  # measured
        },
    }


def emit_cover(cover: str, func_name: str = "dynopt_interp8_16x32_sve2") -> str:
    """Return the interp8-16x32 candidate source (symbol defined in file)."""
    if cover not in _FILES:
        raise ValueError("interp8-16x32 cover %s not defined" % cover)
    import os

    _ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
        os.path.abspath(__file__))))
    p = os.path.join(_ROOT, "kernels", "interp8-16x32", "candidates",
                     _FILES[cover])
    with open(p) as f:
        return f.read()
