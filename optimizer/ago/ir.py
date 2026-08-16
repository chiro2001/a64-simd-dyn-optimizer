"""Minimal typed IR contract for AGO (M0, round-0023).

Semantic authority is the kernel contract expressed in the restricted
DSL / self semantics; assembly/intrinsics/traces are evidence only.
This module defines the smallest shape/op/graph vocabulary needed by the
SA8D 8x8 vertical slice. Extend deliberately, not speculatively.
"""

from __future__ import annotations

from dataclasses import dataclass, field
from hashlib import sha256
from typing import Dict, Optional, Tuple


@dataclass(frozen=True)
class Shape:
    """Element type + lanes + vector length (bits) for one value."""

    elem: str          # u8/s8/u16/s16/u32/s32
    lanes: int         # elements in this value
    vbits: int         # vector width in bits (128 = NEON lane, 256 = SVE)
    vscale: Optional[int] = None  # scalable: lanes are per 128-bit unit;
                                  # None = fixed width (NEON/128 semantics)

    def bits(self) -> int:
        return {"u8": 8, "s8": 8, "u16": 16, "s16": 16,
                "u32": 32, "s32": 32}[self.elem] * self.lanes

    def concrete_lanes(self, vl_bits: int = 128) -> int:
        """Actual lane count at a given vector length.  Scalable shapes
        (vscale set) scale with vl_bits/128; fixed shapes do not."""
        if self.vscale is None:
            return self.lanes
        return self.lanes * (vl_bits // 128)


@dataclass(frozen=True)
class Value:
    name: str
    shape: Shape
    kind: str = "tensor"   # tensor | scalar | table | state
    stride: Optional[int] = None


@dataclass(frozen=True)
class Op:
    kind: str              # load/st/add/mul/mla/hadamard/abs/perm/table/...
    inputs: Tuple[str, ...]
    out: str
    attrs: Dict = field(default_factory=dict)


@dataclass
class Graph:
    name: str
    inputs: Dict[str, Value]
    outputs: Tuple[str, ...]
    ops: Dict[str, Op]
    contract: str = ""     # canonical semantic contract (authority)
    meta: Dict = field(default_factory=dict)

    def canonical_hash(self) -> str:
        h = sha256()
        h.update(self.contract.encode())
        for n in sorted(self.inputs):
            v = self.inputs[n]
            h.update(b"i|%s|%s|%s|%s" % (
                n.encode(), v.shape.elem.encode(), str(v.shape.lanes).encode(),
                str(v.shape.vbits).encode()))
        for n in sorted(self.ops):
            op = self.ops[n]
            h.update(b"o|%s|%s|%s|%s" % (
                n.encode(), op.kind.encode(),
                ",".join(op.inputs).encode(), op.out.encode()))
            for k in sorted(op.attrs):
                h.update(b"a|%s|%s" % (k.encode(), str(op.attrs[k]).encode()))
        return h.hexdigest()
