"""SATD 8x4 / 8x16 / 16x8 semantic contracts (AGO M2-expanded corpus).

Same semantic authority pattern as satd8 8x8: x265 C reference
(satd_8x4 bands / satd8<W,H>) plus the upstream NEON target forms.
"""

from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class SatdShapeContract:
    name: str
    rows: int
    cols: int
    bands: int          # number of 8x4 bands in the C reference
    oracle: str = ""

    def canonical(self) -> str:
        return (
            "%s: d[i][j]=s16(p1[i][j])-s16(p2[i][j]); "
            "satd=sum over 4x4 blocks of sum(|H4(d_block)|); "
            "C ref = %d x satd_8x4" % (self.name, self.bands)
        )


SATD8X4 = SatdShapeContract("satd8x4_u8", 4, 8, 1,
    oracle="x265::satd8<8,4> (one satd_8x4 band); "
           "NEON pixel_satd_8x4_neon (20k differential)")
SATD8X16 = SatdShapeContract("satd8x16_u8", 16, 8, 4,
    oracle="x265::satd8<8,16> (four satd_8x4 bands); "
           "NEON pixel_satd_8x16_neon (20k differential)")
SATD16X8 = SatdShapeContract("satd16x8_u8", 8, 16, 2,
    oracle="x265::satd8<16,8> (two satd_8x4 bands x two column groups); "
           "NEON 16x8 target (20k differential)")
