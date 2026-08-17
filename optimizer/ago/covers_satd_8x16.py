"""Bounded cover search for satd 8x16 (AGO M3, docs/82 下一步 #4 扩展).

Wraps the NEON A/B/C covers from covers_satd_shapes.py (same dataflow,
different reduction instruction selection). The only existing candidate
is best_ir_sve16 (dual-group, permute_ratio=50.7% — over the 30%
threshold), so the NEON covers are the first sub-threshold alternatives
for this family (trn-based, expected ~0% permute).
"""

from __future__ import annotations

from typing import Dict

from optimizer.ago.covers_satd_shapes import emit_cover as _emit
from optimizer.ago.covers_satd_shapes import shape_meta as _shape_meta

_SHAPE = "8x16"


def cover_meta() -> Dict:
    return _shape_meta(_SHAPE)


def emit_cover(cover: str, func_name: str = "dynopt_satd_8x16_sve2") -> str:
    return _emit(_SHAPE, cover, func_name)
