"""SA8D 16x16 + 32x32/64x64 wrappers from width-independent DAG."""

from __future__ import annotations

from sa8d16_op_ir import sa8d16_dag
from satd8_emit import emit_satd8


def emit_sa8d_candidates() -> str:
    core = emit_satd8(sa8d16_dag(), func_name="dynopt_sa8d_16x16_sve2")
    wrappers = """\

extern "C" int dynopt_sa8d_32x32_sve2(
    const uint8_t* pix1, intptr_t sp1,
    const uint8_t* pix2, intptr_t sp2)
{
    int cost = 0;
    cost += dynopt_sa8d_16x16_sve2(pix1 + 0 * sp1 + 0, sp1,
                                   pix2 + 0 * sp2 + 0, sp2);
    cost += dynopt_sa8d_16x16_sve2(pix1 + 0 * sp1 + 16, sp1,
                                   pix2 + 0 * sp2 + 16, sp2);
    cost += dynopt_sa8d_16x16_sve2(pix1 + 16 * sp1 + 0, sp1,
                                   pix2 + 16 * sp2 + 0, sp2);
    cost += dynopt_sa8d_16x16_sve2(pix1 + 16 * sp1 + 16, sp1,
                                   pix2 + 16 * sp2 + 16, sp2);
    return cost;
}

extern "C" int dynopt_sa8d_64x64_sve2(
    const uint8_t* pix1, intptr_t sp1,
    const uint8_t* pix2, intptr_t sp2)
{
    int cost = 0;
    for (int y = 0; y < 64; y += 16)
        for (int x = 0; x < 64; x += 16)
            cost += dynopt_sa8d_16x16_sve2(pix1 + y * sp1 + x, sp1,
                                           pix2 + y * sp2 + x, sp2);
    return cost;
}
"""
    return core + wrappers
