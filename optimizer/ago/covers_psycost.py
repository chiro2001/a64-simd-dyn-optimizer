"""Bounded cover search for psy-cost 16x16 (AGO M3, docs/82 下一步 #4).

Covers wrap the existing candidates:

  A best_sve2     : hand-written NEON/SVE2 (permute_ratio=30.8%, fused=176)
  B best_ir_sve16 : dual-group 16-lane IR (permute_ratio=42.6%, fused=577,
                    expected loser on 950)
  C best_cadd     : SVE2 cadd-butterfly port of the upstream u8 structure
                    (fused=89, tbl=32 vs trn=96, cp_lat 23 vs 44) — beats
                    the hand-written best on every static axis

Manifest (kernels/psy-cost-16x16/manifest.yaml, 2026-08-18): kind=psy_cost
reuses the gen_verify sad harness (identical signature: two u8 planes +
two strides -> int). Candidates bit-exact vs upstream x265::psyCost_pp_sve2<2>
(QEMU 500x6 manual + 2000-case funnel gate; C is a verbatim algorithm port,
re-verified through the same gate). Cover-B defines a different symbol
(pixel_var) so it LINK-FAILs in the full pipeline — recorded by scan only.
"""

from __future__ import annotations

from typing import Dict

_FILES = {
    "A": "best_sve2.cpp",
    "B": "best_ir_sve16.cpp",
    "C": "best_cadd.cpp",
}


def cover_meta() -> Dict:
    # psy-cost 16x16 dataflow (all covers): load src/recon -> abd/sub ->
    # abs -> 4x4 block sums -> per-block penalty add -> total.
    cp = ["ld1_u8", "abd_u8", "abs_s16", "add_u16", "paddl_u16",
          "add_u16"]
    tail = (["ld1_u8"] * 32 + ["abd_u8"] * 16 + ["abs_s16"] * 16 +
            ["paddl_u16"] * 4 + ["add_u16"] * 4)
    # Cover C: cadd-butterfly horizontal hadamard replaces the trn chain.
    cp_c = ["ld1_u8", "uaddl_s16", "cadd_s16", "tbl_s16", "cadd_s16",
            "abd_s16", "abs_s16", "umax_u16", "add_u16", "addp_u32"]
    tail_c = (["ld1_u8"] * 32 + ["uaddl_s16"] * 8 + ["cadd_s16"] * 16 +
              ["tbl_s16"] * 8 + ["cadd_s16"] * 16 + ["abd_s16"] * 8 +
              ["abs_s16"] * 8 + ["umax_u16"] * 4 + ["add_u16"] * 4 +
              ["addp_u32"] * 2)
    return {
        "covers": ["A", "B", "C"],
        "names": {
            "A": "best_sve2 (SVE2, permute=30.8%)",
            "B": "best_ir_sve16 (dual-group, permute=42.6%)",
            "C": "best_cadd (SVE2 cadd butterfly, permute=0.0%)",
        },
        "cp_chains": {"A": cp, "B": cp, "C": cp_c},
        "tail_ops": {"A": tail, "B": tail, "C": tail_c},
        "expected_permute_ratio": {
            "A": 0.308,  # measured (reports/scan-permute-all-20260818.txt)
            "B": 0.426,  # measured
            "C": 0.0,    # measured (static model: 0 tbl on CP)
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
