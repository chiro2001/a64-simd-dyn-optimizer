"""Emit the full multi-shape SATD candidate from width-independent DAGs.

Shapes: 8x8, 8x16, 16x8, 16x16 (direct DAGs) + 32x32/64x64 wrappers
over the 16x16 impl (mirrors kernels/satd-8/candidates/best_sve1.cpp).
"""

from __future__ import annotations

from satd8_emit import emit_satd8
from satd8_op_ir import satd8_dag, satd16_dag, satd_rect_dag


def emit_satd_candidates() -> str:
    parts = [
        emit_satd8(satd8_dag(), func_name="dynopt_satd_8x8_sve2"),
        emit_satd8(satd_rect_dag("8x16"),
                   func_name="dynopt_satd_8x16_sve2"),
        emit_satd8(satd_rect_dag("16x8"),
                   func_name="dynopt_satd_16x8_sve2"),
        emit_satd8(satd16_dag(), func_name="dynopt_satd_16x16_sve2"),
    ]
    # The three larger shapes are wrappers over the 16x16 impl, which is
    # emitted inline in the 16x16 function above; reuse it via a helper.
    parts.append("""\
static int satd16_impl(const uint8_t* p1, intptr_t s1,
                       const uint8_t* p2, intptr_t s2)
{
    return dynopt_satd_16x16_sve2(p1, s1, p2, s2);
}

extern "C" int dynopt_satd_32x32_sve2(
    const uint8_t* pix1, intptr_t sp1,
    const uint8_t* pix2, intptr_t sp2)
{
    int cost = 0;
    cost += satd16_impl(pix1 + 0 * sp1 + 0, sp1, pix2 + 0 * sp2 + 0, sp2);
    cost += satd16_impl(pix1 + 0 * sp1 + 16, sp1, pix2 + 0 * sp2 + 16, sp2);
    cost += satd16_impl(pix1 + 16 * sp1 + 0, sp1, pix2 + 16 * sp2 + 0, sp2);
    cost += satd16_impl(pix1 + 16 * sp1 + 16, sp1, pix2 + 16 * sp2 + 16, sp2);
    return cost;
}

extern "C" int dynopt_satd_64x64_sve2(
    const uint8_t* pix1, intptr_t sp1,
    const uint8_t* pix2, intptr_t sp2)
{
    int cost = 0;
    for (int y = 0; y < 64; y += 16)
        for (int x = 0; x < 64; x += 16)
            cost += satd16_impl(pix1 + y * sp1 + x, sp1,
                                pix2 + y * sp2 + x, sp2);
    return cost;
}
""")
    return "\n".join(parts)
