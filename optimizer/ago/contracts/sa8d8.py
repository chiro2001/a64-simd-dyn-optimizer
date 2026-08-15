"""SA8D 8x8 semantic contract (AGO M0 vertical slice).

Semantic authority (round-0023): this contract + the x265 C reference
(third_party/x265/source/common/pixel.cpp `_sa8d_8x8` /
`sa8d_8x8`) is the truth. NEON intrinsics/asm are target implementations
used as evidence for lowering, not authorities.

The C reference computes, for two 8x8 u8 blocks:
    d[i][j] = s16(pix1[i][j]) - s16(pix2[i][j])
    h = 8x8 Hadamard(d)
    cost = sum(|h[i][j]|)
    satd = (cost + 2) >> 2        # sa8d_8x8

The upstream NEON kernel computes the same satd through
load_diff_u8x8x8 -> hadamard_8_v -> hadamard_8_h -> pairwise sums ->
(vaddlvq_u16 + 1) >> 1. Numerically both must match the C reference
(existing 20k differential in kernels/sa8d is the oracle).
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Sa8d8Contract:
    name: str = "sa8d8_u8"
    in_elem: str = "u8"
    out_elem: str = "s32"
    rows: int = 8
    cols: int = 8
    oracle: str = (
        "x265::sa8d_8x8 (third_party/x265/source/common/pixel.cpp; "
        "20k differential via kernels/sa8d)"
    )

    def canonical(self) -> str:
        return (
            "sa8d8_u8: d[i][j]=s16(p1[i][j])-s16(p2[i][j]); "
            "h=hadamard8x8(d); cost=sum(|h|); satd=(cost+2)>>2"
        )
