"""Shared op DAG value type for the op-level rewrite pipeline.

DCT32/DCT16/interp8 op IRs all use this immutable Op record so the rewrite
engine (dct32_rewrites, later dct16_rewrites) and emitters can be reused
across kernels.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from typing import Dict, Tuple


@dataclass(frozen=True)
class Op:
    op_id: str
    kind: str
    tile_id: str
    out: str = ""
    inputs: Tuple[str, ...] = ()
    attrs: Dict = field(default_factory=dict)
