"""SVE2 SAO E1, 2 rows (64x2), VL=256 (docs/45). Reuses the E1 emitter."""

from emit_sao_e1_sve2_shared import emit_64x4


def emit_64x2(func_name="dynopt_sao_e1_2rows_64x2_sve2"):
    return emit_64x4(func_name=func_name, rows=2)


def emit_combo(combo):
    return emit_64x2()
