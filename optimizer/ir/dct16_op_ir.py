"""DCT16 op IR (cross-kernel migration, first slice).

Design (docs/25): lower DCT16 into the same Op DAG as DCT32 so the
rewrite engine and sequence search can be reused. This module currently
holds the kernel constants and the lowering contract; the first concrete
slice will lower pass1-quarter + pass2-odd-quarter (legacy best 704) with
provenance, then compare counts against the grouped emitter.
"""

from __future__ import annotations

from typing import Dict, List

from op_ir import Op


# DCT16 k families (16x16): odd k=1..15, k2=2,6,10,14, k4=4,12, k0=0,8.
ODD_K = tuple(range(1, 16, 2))
K2_K = tuple(range(2, 16, 4))
K4_K = tuple(range(4, 16, 8))
K0_K = (0, 8)


def lower_pass1_quarter(plan) -> List[Op]:
    """TODO(first slice): lower DCT16 pass1 quarter into an op DAG.

    Acceptance (docs/25 Go #1): provenance_report passes and the emitted
    full-call fused_uop equals the grouped emitter's count for the same
    config (start with the upstream pass1 + upstream pass2 baseline, then
    the legacy best 704 combo).
    """
    raise NotImplementedError("dct16 op IR first slice not yet implemented")


def dct16_constants() -> Dict[str, object]:
    """DCT16 butterfly/constant metadata consumed by the lowering."""
    return {
        "n": 16,
        "passes": 2,
        "k_families": {"odd": ODD_K, "k2": K2_K, "k4": K4_K, "k0": K0_K},
    }
