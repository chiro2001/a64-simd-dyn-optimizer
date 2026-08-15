"""SATD 8x8 semantic contract (AGO M2 second dataflow anchor).

Semantic authority (round-0023): this contract + the x265 C reference
(third_party/x265/source/common/pixel.cpp `satd_8x4` / `satd8<8,8>`) is
the truth. The upstream NEON implementation
(`pixel_satd_8x8_neon`) is a target implementation used as evidence.

The C reference computes, for an 8x8 u8 block, four 4x4 SATDs (two
4-row bands x two 4-column halves):
    d[i][j] = s16(pix1[i][j]) - s16(pix2[i][j])
    satd = sum over 4x4 blocks of sum(|H4(d_block)|)
    # per 8x4 band the C SWAR version packs two 4x4 blocks and halves
    # the packed sum: ((low16 + high16) >> 1); two bands are summed.

The upstream NEON kernel computes the same value through
load_diff_u8x8x8 -> hadamard_4x4_quad (two 4x4 quadrants at once) ->
out[0] += out[1] -> vaddlvq_u16 (no final shift). Numeric identity
C vs NEON was confirmed by simulation (20k random cases, 0 mismatches);
the 20k differential in scripts/verify-ago-satd8.sh is the oracle.
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class Satd8Contract:
    name: str = "satd8_u8"
    in_elem: str = "u8"
    out_elem: str = "s32"
    rows: int = 8
    cols: int = 8
    oracle: str = (
        "x265::satd8<8,8> (third_party/x265/source/common/pixel.cpp "
        "satd_8x4; 20k differential via scripts/verify-ago-satd8.sh)"
    )

    def canonical(self) -> str:
        return (
            "satd8_u8: d[i][j]=s16(p1[i][j])-s16(p2[i][j]); "
            "satd=sum over four 4x4 blocks of sum(|H4(d_block)|)"
        )
