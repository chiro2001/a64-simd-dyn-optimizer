"""Per-family dual-group 16-lane (VL=256) candidate generators.

Each family reuses the generic emitter in dual_sve16.py with a small
schedule that decides how the two independent groups map to memory:
  - mc/sad/ssd          : rows y and y+1 packed into one 32-lane u8
                          register (odd rows alias the even row's dual).
  - pixel_var           : even rows populate group0, odd rows group1
                          (zero-filled opposite group), so the DAG's two
                          accumulator chains merge in the final reduce.
  - satd16 / satd 16x8  : group0 = lo half, group1 = hi half of the
                          same row (hi load aliases the lo load).
  - satd 8x16           : group0 = rows 0-7, group1 = rows 8-15.
  - sa8d16              : group0 = left 8 cols, group1 = right 8 cols
                          of each 8x8 block; blocks at xo=8 swap the
                          pair so the serial u16 accumulation produces
                          (total, total) and the final (x+1)>>1 folds
                          the doubling back to the exact result.
"""

from __future__ import annotations

import os
from typing import Dict, List

from op_ir import Op

from dual_sve16 import Schedule, emit_dual  # noqa: E402
from interp8_op_ir import interp8_hpp_dag  # noqa: E402
from mc_avg_op_ir import avg_pp_16x16_dag  # noqa: E402
from pixel_var_op_ir import pixel_var_16x16_dag  # noqa: E402
from sa8d16_op_ir import sa8d16_dag  # noqa: E402
from sad_op_ir import sad16x16_dag  # noqa: E402
from satd8_op_ir import satd16_dag, satd_rect_dag  # noqa: E402
from ssd_op_ir import sse_pp_16x16_dag  # noqa: E402


def _find_op(ops: List[Op], kind: str, **attrs) -> Op:
    for op in ops:
        if op.kind != kind:
            continue
        if all(op.attrs.get(k) == v for k, v in attrs.items()):
            return op
    raise KeyError("no %s op with %r" % (kind, attrs))


class _RowPair16(Schedule):
    """Pair rows y (g0) and y+1 (g1); odd rows alias the even load."""

    def __init__(self, ops: List[Op]):
        self.ops = ops

    def _pair(self, attrs, out, em, src_suffix=""):
        y = attrs["row"]
        if y % 2 == 1:
            prev = _find_op(self.ops, "load_u8x16", base=attrs["base"],
                            row=y - 1)
            em.alias(out, prev.out)
            return ""
        base = attrs["base"]
        s1 = "stride1" if base == "pix1" else "stride2"
        return ("psv16_ld1b_pair(%s + %d * %s, %s + %d * %s)"
                % (base, y, s1, base, y + 1, s1))

    def load_u8x16(self, em, attrs, out):
        return self._pair(attrs, out, em)


class _RowSplit16(Schedule):
    """Even rows populate group0, odd rows group1 (no double count in
    accumulator DAGs like sad/ssd)."""

    def __init__(self, base_expr="pix"):
        self.base_expr = base_expr

    def load_u8x16(self, em, attrs, out):
        y = attrs["row"]
        base = attrs["base"]
        s1 = "stride1" if base == "pix1" else "stride2"
        if y % 2 == 0:
            return "psv16_ld1b_zhi(%s + %d * %s)" % (base, y, s1)
        return "psv16_ld1b_zlo(%s + %d * %s)" % (base, y, s1)


class _McSchedule(_RowPair16):
    def store_u8x16(self, em, attrs, val):
        y = attrs["row"]
        if y % 2 == 1:
            return ""
        return ("psv16_st1b_pair(dst + %d * dstStride, "
                "dst + %d * dstStride, %s)" % (y, y + 1, val))


class _PixelVarSchedule(Schedule):
    def load_u8x16(self, em, attrs, out):
        y = attrs["row"]
        if y % 2 == 0:
            return "psv16_ld1b_zhi(pix + %d * stride)" % y
        return "psv16_ld1b_zlo(pix + %d * stride)" % y


def _diff_expr(p1a, p1b, p2a, p2b):
    return "psv16_dual_load_diff8(%s, %s, %s, %s)" % (p1a, p1b, p2a, p2b)


class _SatdLoHiSchedule(Schedule):
    """Group0 = lo half, group1 = hi half of the same row; the two
    halves are loaded into separate groups so the accumulator chains
    (sum0/sum1) do not double count."""

    def __init__(self, ops: List[Op]):
        self.ops = ops

    def load_diff(self, em, attrs, out):
        y = attrs["row"]
        if attrs.get("half") == "hi":
            return ("psv16_dual_load_diff8_split(pix1 + %d * sp1 + 8, "
                    "pix2 + %d * sp2 + 8, 1)" % (y, y))
        return ("psv16_dual_load_diff8_split(pix1 + %d * sp1, "
                "pix2 + %d * sp2, 0)" % (y, y))


class _SatdRowBlockSchedule(Schedule):
    """Group0 = rows 0-7, group1 = rows 8-15 (8x16 shape); loads for
    rows >= 8 populate group1 only."""

    def load_diff(self, em, attrs, out):
        y = attrs["row"]
        if y >= 8:
            return ("psv16_dual_load_diff8_split(pix1 + %d * sp1, "
                    "pix2 + %d * sp2, 1)" % (y, y))
        return ("psv16_dual_load_diff8_split(pix1 + %d * sp1, "
                "pix2 + %d * sp2, 0)" % (y, y))


class _Sa8dSchedule(Schedule):
    """Group0 = cols xo..xo+7, group1 = cols 8-xo..15-xo (swap at
    xo=8), so the serial 4-block accumulation yields (total, total)
    and the final (x+1)>>1 folds the duplicated sum."""

    def load_diff(self, em, attrs, out):
        y = attrs["row"]
        xo, yo = attrs["xo"], attrs["yo"]
        p1a = "pix1 + (%d + %d) * sp1 + %d" % (yo, y, xo)
        p1b = "pix1 + (%d + %d) * sp1 + %d" % (yo, y, 8 - xo)
        p2a = "pix2 + (%d + %d) * sp2 + %d" % (yo, y, xo)
        p2b = "pix2 + (%d + %d) * sp2 + %d" % (yo, y, 8 - xo)
        return _diff_expr(p1a, p1b, p2a, p2b)


class _Interp8Schedule(Schedule):
    """Two rows packed per 32-lane (u8x16) or 16-lane (u8x8) register;
    odd rows alias the even row's dual value, stores happen once per
    row pair."""

    def __init__(self, ops: List[Op]):
        self.ops = ops

    def _load(self, kind, attrs, out, em, pair_fn):
        y = attrs["row"]
        if y % 2 == 1:
            prev = _find_op(self.ops, kind, row=y - 1)
            em.alias(out, prev.out)
            return ""
        return pair_fn(y)

    def load_u8x16(self, em, attrs, out):
        return self._load("load_u8x16", attrs, out, em,
                          lambda y: "psv16_ld1b_pair(src + %d * srcStride "
                                    "+ %d + %d, src + %d * srcStride "
                                    "+ %d + %d)"
                                    % (y, attrs["col"], attrs["off"],
                                       y + 1, attrs["col"], attrs["off"]))

    def load_u8x8(self, em, attrs, out):
        return self._load("load_u8x8", attrs, out, em,
                          lambda y: "psv16_ld1b_pair8(src + %d * srcStride "
                                    "+ %d + %d, src + %d * srcStride "
                                    "+ %d + %d)"
                                    % (y, attrs["col"], attrs["off"],
                                       y + 1, attrs["col"], attrs["off"]))

    def store_u8x16(self, em, attrs, val):
        y = attrs["row"]
        if y % 2 == 1:
            return ""
        return ("psv16_st1b_pair(dst + %d * dstStride + %d, "
                "dst + %d * dstStride + %d, %s)"
                % (y, attrs["col"], y + 1, attrs["col"], val))

    def store_u8x8(self, em, attrs, val):
        y = attrs["row"]
        if y % 2 == 1:
            return ""
        return ("psv16_st1b_pair8(dst + %d * dstStride + %d, "
                "dst + %d * dstStride + %d, %s)"
                % (y, attrs["col"], y + 1, attrs["col"], val))


_SIGNATURES = {
    "mc": ("extern \"C\" void %s(uint8_t* dst, intptr_t dstStride,"
           " const uint8_t* pix1, intptr_t stride1,"
           " const uint8_t* pix2, intptr_t stride2)", "return;"),
    "sad": ("extern \"C\" int %s(const uint8_t* pix1, intptr_t stride1,"
            " const uint8_t* pix2, intptr_t stride2)", "return 0;"),
    "ssd": ("extern \"C\" unsigned int %s("
            " const uint8_t* pix1, intptr_t stride1,"
            " const uint8_t* pix2, intptr_t stride2)", "return 0;"),
    "pixel_var": ("extern \"C\" uint64_t %s(const uint8_t* pix,"
                  " intptr_t stride)", "return 0ULL;"),
    "satd": ("extern \"C\" int %s(const uint8_t* pix1, intptr_t sp1,"
             " const uint8_t* pix2, intptr_t sp2)", "return 0;"),
    "sa8d": ("extern \"C\" int %s(const uint8_t* pix1, intptr_t sp1,"
             " const uint8_t* pix2, intptr_t sp2)", "return 0;"),
}


def emit_mc_sve16(func_name: str = "dynopt_avg_pp_16x16_sve16") -> str:
    ops = avg_pp_16x16_dag()
    sig, fallback = _SIGNATURES["mc"]
    return emit_dual(ops, _McSchedule(ops), func_name, sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_sad_sve16(func_name: str = "dynopt_sad_16x16_sve16") -> str:
    ops = sad16x16_dag()
    sig, fallback = _SIGNATURES["sad"]
    return emit_dual(ops, _RowSplit16(), func_name, sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_ssd_sve16(func_name: str = "dynopt_sse_pp_16x16_sve16") -> str:
    ops = sse_pp_16x16_dag()
    sig, fallback = _SIGNATURES["ssd"]
    return emit_dual(ops, _RowSplit16(), func_name, sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_pixel_var_sve16(
        func_name: str = "dynopt_pixel_var_16x16_sve16") -> str:
    ops = pixel_var_16x16_dag()
    sig, fallback = _SIGNATURES["pixel_var"]
    return emit_dual(ops, _PixelVarSchedule(), func_name,
                     sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_satd_sve16(shape: str = "16x16",
                    func_name: str = "") -> str:
    if shape == "16x16":
        ops = satd16_dag()
        sched = _SatdLoHiSchedule(ops)
        func_name = func_name or "dynopt_satd_16x16_sve16"
    elif shape == "16x8":
        ops = satd_rect_dag("16x8")
        sched = _SatdLoHiSchedule(ops)
        func_name = func_name or "dynopt_satd_16x8_sve16"
    elif shape == "8x16":
        ops = satd_rect_dag("8x16")
        sched = _SatdRowBlockSchedule()
        func_name = func_name or "dynopt_satd_8x16_sve16"
    else:
        raise ValueError("satd shape %s" % shape)
    sig, fallback = _SIGNATURES["satd"]
    return emit_dual(ops, sched, func_name, sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_sa8d_sve16(func_name: str = "dynopt_sa8d_16x16_sve16") -> str:
    ops = sa8d16_dag()
    sig, fallback = _SIGNATURES["sa8d"]
    return emit_dual(ops, _Sa8dSchedule(), func_name, sig % func_name,
                     prologue="    if (svcntb() != 32) %s\n" % fallback)


def emit_interp8_hpp_sve16(
        width: int, height: int,
        func_name: str = "") -> str:
    ops = interp8_hpp_dag(width, height)
    func_name = func_name or "dynopt_interp8_hpp_%dx%d_sve16" % (
        width, height)
    sig = ("extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
           " uint8_t* dst, intptr_t dstStride, int coeffIdx)" % func_name)
    return emit_dual(ops, _Interp8Schedule(ops), func_name, sig,
                     prologue="    if (svcntb() != 32) return;\n",
                     phased=True)


INTERP8_SHAPES = ((8, 8), (8, 16), (16, 8), (16, 16), (16, 32),
                  (32, 16), (32, 32), (64, 32), (64, 64))

INTERP8_KERNEL_DIRS = {
    (8, 8): "interp8",
    (8, 16): "interp8-8x16",
    (16, 8): "interp8-16x8",
    (16, 16): "interp8-16",
    (16, 32): "interp8-16x32",
    (32, 16): "interp8-32x16",
    (32, 32): "interp8-32",
    (64, 32): "interp8-64x32",
    (64, 64): "interp8-64x64",
}


def emit_satd_candidates() -> str:
    return "\n".join(emit_satd_sve16(s) for s in ("16x16", "8x16", "16x8"))


def write_candidates(root: str = None) -> Dict[str, str]:
    """Write best_ir_sve16.cpp files; return {path: symbol}."""
    if root is None:
        root = os.path.join(os.path.dirname(os.path.dirname(
            os.path.abspath(__file__))), "..", "kernels")
    root = os.path.abspath(root)
    targets = {
        os.path.join("mc", "candidates", "best_ir_sve16.cpp"):
            emit_mc_sve16(),
        os.path.join("sad", "candidates", "best_ir_sve16.cpp"):
            emit_sad_sve16(),
        os.path.join("ssd", "candidates", "best_ir_sve16.cpp"):
            emit_ssd_sve16(),
        os.path.join("psy-cost-16x16", "candidates",
                     "best_ir_sve16.cpp"): emit_pixel_var_sve16(),
        os.path.join("satd-16", "candidates", "best_ir_sve16.cpp"):
            emit_satd_sve16("16x16"),
        os.path.join("satd-8x16", "candidates", "best_ir_sve16.cpp"):
            emit_satd_sve16("8x16"),
        os.path.join("satd-16x8", "candidates", "best_ir_sve16.cpp"):
            emit_satd_sve16("16x8"),
        os.path.join("sa8d16", "candidates", "best_ir_sve16.cpp"):
            emit_sa8d_sve16(),
    }
    for shape, d in INTERP8_KERNEL_DIRS.items():
        targets[os.path.join(d, "candidates", "best_ir_sve16.cpp")] = \
            emit_interp8_hpp_sve16(*shape)
    written = {}
    for rel, src in targets.items():
        p = os.path.join(root, rel)
        os.makedirs(os.path.dirname(p), exist_ok=True)
        with open(p, "w") as f:
            f.write(src)
        written[p] = len(src)
    return written


if __name__ == "__main__":
    for p, n in write_candidates().items():
        print("%8d  %s" % (n, p))
