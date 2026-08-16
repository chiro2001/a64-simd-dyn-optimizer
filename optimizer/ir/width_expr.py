"""Width-scalable permute index expressions (IR width parameterization).

The op IR names permutes symbolically ("rev8"/"rev16"/"rev32"/"rev64").
This module resolves those names to concrete per-128-bit-segment lane
index tables as a function of the vector length, so the same graph can
be re-lowered for NEON (1 segment), SVE1/2 VL=128 (1 segment), VL=256
(2 segments), etc. It also documents the 8-lane decomposition used by
the validated fused emitters (tools/emit_dct16_vl128.py: rev16 at VL=128
is identity(low) + rev8(high), matching E = lo + rev(hi)).
"""

from __future__ import annotations

from typing import Callable, Dict, List, Tuple


def _reverse(n: int) -> Tuple[int, ...]:
    return tuple(range(n - 1, -1, -1))


def _identity(n: int) -> Tuple[int, ...]:
    return tuple(range(n))


# name -> (logical element count, element bits, table builder)
PERMUTES: Dict[str, Tuple[int, int, Callable[[int], Tuple[int, ...]]]] = {
    "rev8": (8, 16, _reverse),
    "rev16": (16, 16, _reverse),
    "rev32": (4, 32, _reverse),
    "rev64": (2, 64, _reverse),
}


def resolve(name: str, vl_bits: int = 128) -> List[Tuple[int, ...]]:
    """Concrete per-segment lane index tables for a named permute.

    Returns one table per 128-bit segment (1 table at VL=128, 2 at
    VL=256, ...). Segment tables use local lane indices.

    Special cases:
      - rev16 at 8 s16 lanes/segment (VL=128): the 16-lane row is
        lowered as identity(low half) + reverse(high half), which is
        the pair-reversal E/O leaf the fused 8-lane kernel uses.
      - rev8 at VL=256: applied independently inside each 8-lane
        segment, i.e. [7..0, 15..8] for the full 16-lane vector.
    """
    if name not in PERMUTES:
        raise KeyError("unknown permute %r (known: %s)"
                       % (name, sorted(PERMUTES)))
    n, elem_bits, fn = PERMUTES[name]
    lanes_per_seg = vl_bits // elem_bits
    if n == lanes_per_seg:
        return [fn(n)]
    if name == "rev16" and n == 16 and lanes_per_seg == 8:
        return [_identity(8), _reverse(8)]
    if name in ("rev8", "rev32", "rev64") and n < lanes_per_seg:
        segs = lanes_per_seg // n
        return [tuple(seg * n + i for i in fn(n))
                for seg in range(segs)]
    raise ValueError("no %s lowering for %d lanes/segment (n=%d)"
                     % (name, lanes_per_seg, n))


def leaf_tables(vl_bits: int = 128) -> Dict[str, List[Tuple[int, ...]]]:
    """Tables for the DCT16 pass1 E/O leaf (upstream-exact forms)."""
    return {
        "rev8": resolve("rev8", vl_bits),
        "rev16": resolve("rev16", vl_bits),
    }


def rev16_neon_helper() -> Tuple[int, ...]:
    """s16-lane index table of the NEON rev16 helper (8 lanes)."""
    return _reverse(8)
