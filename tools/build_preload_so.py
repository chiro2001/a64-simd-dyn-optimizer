#!/usr/bin/env python3
"""Build an LD_PRELOAD shared library that patches the in-process x265
EncoderPrimitives dispatch table with this project's optimized kernels.

Two activation paths:
  * automatic: the library interposes `x265::x265_setup_primitives` and
    calls the patch after x265 has populated/aliased its primitive table;
  * manual: call `dynopt_init()` or `dynopt_patch_primitives()` from the
    host process (e.g. a test driver) after x265 setup.

`--isa` restricts which candidates are linked: only kernels whose source
compiles for the target ISA and whose object passes check_isa_level.py are
patched, so the same tool can build a 920B (sve1, VL=256) or 950 (sve2)
library. Kernels without a compatible lowering are skipped with a warning
instead of producing a SIGILL-ing binary.

Usage:
  python3 tools/build_preload_so.py --isa sve2 \
      --out build/dynopt-x265-sve2.so \
      --kernels dct8,sa8d16,interp8vpp-16,scale2d
  python3 tools/build_preload_so.py --isa sve1 --kernels dct8,dct32
"""

import argparse
import difflib
import json
import os
import re
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

ISA_MARCH = {
    "sve1": "armv8.2-a+sve",
    "sve2": "armv8.2-a+sve2",
    "sve2p1": "armv9.4-a+sve2p1",
    "sve2p3": "armv9.4-a+sve2p3",
}

# Fixed-shape candidates whose C signature omits one or more x265
# primitive arguments. The wrapper installs an adapter that forwards the
# full primitive contract and falls back to the original x265 function
# when the shape does not match the candidate's fixed 64x*/256 shape.
# The adapter body is a template with %SYM% replaced by the candidate
# symbol and %ORIG% by the saved original pointer.
ADAPTERS = {
    "quant": {
        "cand_decl": ("uint32_t %SYM%(const int16_t*, const int32_t*,"
                      " int32_t*, int16_t*, int, int)"),
        "orig_decl": "static quant_t dynopt_orig_quant = nullptr;",
        "body": """
static uint32_t dynopt_quant_adapter(
    const int16_t* coef, const int32_t* qc, int32_t* du, int16_t* qo,
    int qBits, int add, int numCoeff)
{
    if (dynopt_orig_quant && numCoeff != 256)
        return dynopt_orig_quant(coef, qc, du, qo, qBits, add, numCoeff);
    return %SYM%(coef, qc, du, qo, qBits, add);
}
""",
        "save": "dynopt_orig_quant = P->quant;",
        "adapter": "dynopt_quant_adapter",
    },
    "nquant": {
        "cand_decl": ("uint32_t %SYM%(const int16_t*, const int32_t*,"
                      " int16_t*, int, int)"),
        "orig_decl": "static nquant_t dynopt_orig_nquant = nullptr;",
        "body": """
static uint32_t dynopt_nquant_adapter(
    const int16_t* coef, const int32_t* qc, int16_t* qo,
    int qBits, int add, int numCoeff)
{
    if (dynopt_orig_nquant && numCoeff != 256)
        return dynopt_orig_nquant(coef, qc, qo, qBits, add, numCoeff);
    return %SYM%(coef, qc, qo, qBits, add);
}
""",
        "save": "dynopt_orig_nquant = P->nquant;",
        "adapter": "dynopt_nquant_adapter",
    },
    "dequant": {
        "cand_decl": ("void %SYM%(const int16_t*, int16_t*, int, int)"),
        "orig_decl": "static dequant_normal_t dynopt_orig_dequant = nullptr;",
        "body": """
static void dynopt_dequant_adapter(
    const int16_t* q, int16_t* c, int num, int scale, int shift)
{
    if (dynopt_orig_dequant && num != 256)
        return dynopt_orig_dequant(q, c, num, scale, shift);
    %SYM%(q, c, scale, shift);
}
""",
        "save": "dynopt_orig_dequant = P->dequant_normal;",
        "adapter": "dynopt_dequant_adapter",
    },
    "dequant-scaling-gt": {
        "cand_decl": ("void %SYM%(const int16_t*, const int32_t*,"
                      " int16_t*, int, int)"),
        "orig_decl": "static dequant_scaling_t dynopt_orig_dqs = nullptr;",
        "body": """
static void dynopt_dqs_adapter(
    const int16_t* q, const int32_t* dq, int16_t* c,
    int num, int per, int shift)
{
    if (dynopt_orig_dqs && num != 256)
        return dynopt_orig_dqs(q, dq, c, num, per, shift);
    %SYM%(q, dq, c, shift, per);
}
""",
        "save": "dynopt_orig_dqs = P->dequant_scaling;",
        "adapter": "dynopt_dqs_adapter",
    },
    "ssim": {
        "cand_decl": ("void %SYM%(const uint8_t*, intptr_t,"
                      " const uint8_t*, intptr_t, int32_t*)"),
        "orig_decl": None,
        "body": """
static void dynopt_ssim_adapter(
    const uint8_t* p1, intptr_t s1, const uint8_t* p2, intptr_t s2,
    int sums[2][4])
{
    %SYM%(p1, s1, p2, s2, (int32_t*)sums);
}
""",
        "save": None,
        "adapter": "dynopt_ssim_adapter",
    },
    "sao-stats-bo": {
        "cand_decl": ("void %SYM%(const int16_t*, const uint8_t*,"
                      " intptr_t, int32_t*, int32_t*)"),
        "orig_decl": "static saoCuStatsBO_t dynopt_orig_stats_bo = nullptr;",
        "body": """
static void dynopt_stats_bo_adapter(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int endX, int endY, int32_t* stats, int32_t* count)
{
    if (dynopt_orig_stats_bo && (endX != 64 || endY <= 0))
        return dynopt_orig_stats_bo(diff, rec, stride, endX, endY,
                                    stats, count);
    for (int y = 0; y < endY; y++)
        %SYM%(diff + y * 64, rec + y * stride, stride, stats, count);
}
""",
        "save": "dynopt_orig_stats_bo = P->saoCuStatsBO;",
        "adapter": "dynopt_stats_bo_adapter",
    },
    "sao-stats-e0": {
        "cand_decl": ("void %SYM%(const int16_t*, const uint8_t*,"
                      " intptr_t, int32_t*, int32_t*)"),
        "orig_decl": "static saoCuStatsE0_t dynopt_orig_stats_e0 = nullptr;",
        "body": """
static void dynopt_stats_e0_adapter(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int endX, int endY, int32_t* stats, int32_t* count)
{
    if (dynopt_orig_stats_e0 && (endX != 64 || endY <= 0))
        return dynopt_orig_stats_e0(diff, rec, stride, endX, endY,
                                    stats, count);
    for (int y = 0; y < endY; y++)
        %SYM%(diff + y * 64, rec + y * stride, stride, stats, count);
}
""",
        "save": "dynopt_orig_stats_e0 = P->saoCuStatsE0;",
        "adapter": "dynopt_stats_e0_adapter",
    },
    "sao-stats-e1": {
        "cand_decl": ("void %SYM%(const int16_t*, const uint8_t*,"
                      " intptr_t, int8_t*, int32_t*, int32_t*)"),
        "orig_decl": "static saoCuStatsE1_t dynopt_orig_stats_e1 = nullptr;",
        "body": """
static void dynopt_stats_e1_adapter(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int8_t* upBuff1, int endX, int endY,
    int32_t* stats, int32_t* count)
{
    if (dynopt_orig_stats_e1 && (endX != 64 || endY <= 0))
        return dynopt_orig_stats_e1(diff, rec, stride, upBuff1,
                                    endX, endY, stats, count);
    for (int y = 0; y < endY; y++)
        %SYM%(diff + y * 64, rec + y * stride, stride, upBuff1,
              stats, count);
}
""",
        "save": "dynopt_orig_stats_e1 = P->saoCuStatsE1;",
        "adapter": "dynopt_stats_e1_adapter",
    },
    "sao-stats-e2": {
        "cand_decl": ("void %SYM%(const int16_t*, const uint8_t*,"
                      " intptr_t, int8_t*, int8_t*, int32_t*, int32_t*)"),
        "orig_decl": "static saoCuStatsE2_t dynopt_orig_stats_e2 = nullptr;",
        "body": """
static void dynopt_stats_e2_adapter(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int8_t* upBuff1, int8_t* upBuff, int endX, int endY,
    int32_t* stats, int32_t* count)
{
    if (dynopt_orig_stats_e2 && (endX != 64 || endY <= 0))
        return dynopt_orig_stats_e2(diff, rec, stride, upBuff1, upBuff,
                                    endX, endY, stats, count);
    for (int y = 0; y < endY; y++)
        %SYM%(diff + y * 64, rec + y * stride, stride, upBuff1,
              upBuff, stats, count);
}
""",
        "save": "dynopt_orig_stats_e2 = P->saoCuStatsE2;",
        "adapter": "dynopt_stats_e2_adapter",
    },
    "sao-stats-e3": {
        "cand_decl": ("void %SYM%(const int16_t*, const uint8_t*,"
                      " intptr_t, int8_t*, int32_t*, int32_t*)"),
        "orig_decl": "static saoCuStatsE3_t dynopt_orig_stats_e3 = nullptr;",
        "body": """
static void dynopt_stats_e3_adapter(
    const int16_t* diff, const uint8_t* rec, intptr_t stride,
    int8_t* upBuff1, int endX, int endY,
    int32_t* stats, int32_t* count)
{
    if (dynopt_orig_stats_e3 && (endX != 64 || endY <= 0))
        return dynopt_orig_stats_e3(diff, rec, stride, upBuff1,
                                    endX, endY, stats, count);
    for (int y = 0; y < endY; y++)
        %SYM%(diff + y * 64, rec + y * stride, stride, upBuff1,
              stats, count);
}
""",
        "save": "dynopt_orig_stats_e3 = P->saoCuStatsE3;",
        "adapter": "dynopt_stats_e3_adapter",
    },
    "sao": {
        "cand_decl": "void %SYM%(uint8_t*, int8_t*, int8_t*, intptr_t)",
        "orig_decl": "static saoCuOrgE0_t dynopt_orig_sao_e0 = nullptr;",
        "body": """
static void dynopt_sao_e0_adapter(
    uint8_t* rec, int8_t* offsetEo, int width,
    int8_t* signLeft, intptr_t stride)
{
    if (dynopt_orig_sao_e0 && width != 64)
        return dynopt_orig_sao_e0(rec, offsetEo, width, signLeft, stride);
    %SYM%(rec, offsetEo, signLeft, stride);
}
""",
        "save": "dynopt_orig_sao_e0 = P->saoCuOrgE0;",
        "adapter": "dynopt_sao_e0_adapter",
    },
    "sao-b0": {
        "cand_decl": "void %SYM%(uint8_t*, const int8_t*, intptr_t)",
        "orig_decl": "static saoCuOrgB0_t dynopt_orig_sao_b0 = nullptr;",
        "body": """
static void dynopt_sao_b0_adapter(
    uint8_t* rec, const int8_t* offset, int width, int height,
    intptr_t stride)
{
    if (dynopt_orig_sao_b0 &&
        (width != 64 || height <= 0 || (height & 3) != 0))
        return dynopt_orig_sao_b0(rec, offset, width, height, stride);
    for (int y = 0; y < height; y += 4)
        %SYM%(rec + y * stride, offset, stride);
}
""",
        "save": "dynopt_orig_sao_b0 = P->saoCuOrgB0;",
        "adapter": "dynopt_sao_b0_adapter",
    },
    "sao-e1-2rows": {
        "cand_decl": ("void %SYM%(uint8_t*, int8_t*, int8_t*, intptr_t)"),
        "orig_decl": ("static saoCuOrgE1_t dynopt_orig_sao_e1_2 = nullptr;"),
        "body": """
static void dynopt_sao_e1_2rows_adapter(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo,
    intptr_t stride, int width)
{
    if (dynopt_orig_sao_e1_2 && width != 64)
        return dynopt_orig_sao_e1_2(rec, upBuff1, offsetEo, stride, width);
    %SYM%(rec, upBuff1, offsetEo, stride);
}
""",
        "save": "dynopt_orig_sao_e1_2 = P->saoCuOrgE1_2Rows;",
        "adapter": "dynopt_sao_e1_2rows_adapter",
    },
    "sao-e1": {
        "cand_decl": "void %SYM%(uint8_t*, int8_t*, int8_t*, intptr_t)",
        "orig_decl": "static saoCuOrgE1_t dynopt_orig_sao_e1 = nullptr;",
        "body": """
static void dynopt_sao_e1_adapter(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo,
    intptr_t stride, int width)
{
    if (dynopt_orig_sao_e1 && width != 64)
        return dynopt_orig_sao_e1(rec, upBuff1, offsetEo, stride, width);
    %SYM%(rec, upBuff1, offsetEo, stride);
}
""",
        "save": "dynopt_orig_sao_e1 = P->saoCuOrgE1;",
        "adapter": "dynopt_sao_e1_adapter",
    },
    "sao-e2": {
        "cand_decl": ("void %SYM%(uint8_t*, int8_t*, int8_t*, int8_t*,"
                      " intptr_t)"),
        "orig_decl": "static saoCuOrgE2_t dynopt_orig_sao_e2 = nullptr;",
        "body": """
static void dynopt_sao_e2_adapter(
    uint8_t* rec, int8_t* bufft, int8_t* buff1, int8_t* offsetEo,
    int width, intptr_t stride)
{
    if (dynopt_orig_sao_e2 && width != 64)
        return dynopt_orig_sao_e2(rec, bufft, buff1, offsetEo,
                                  width, stride);
    %SYM%(rec, bufft, buff1, offsetEo, stride);
}
""",
        "save": "dynopt_orig_sao_e2 = P->saoCuOrgE2[1];",
        "adapter": "dynopt_sao_e2_adapter",
    },
    "sao-e3": {
        "cand_decl": "void %SYM%(uint8_t*, int8_t*, int8_t*, intptr_t)",
        "orig_decl": "static saoCuOrgE3_t dynopt_orig_sao_e3 = nullptr;",
        "body": """
static void dynopt_sao_e3_adapter(
    uint8_t* rec, int8_t* upBuff1, int8_t* offsetEo,
    intptr_t stride, int startX, int endX)
{
    if (dynopt_orig_sao_e3 && (startX != 1 || endX != 64))
        return dynopt_orig_sao_e3(rec, upBuff1, offsetEo, stride,
                                  startX, endX);
    %SYM%(rec, upBuff1, offsetEo, stride);
}
""",
        "save": "dynopt_orig_sao_e3 = P->saoCuOrgE3[1];",
        "adapter": "dynopt_sao_e3_adapter",
    },
}

# x265 config dir that contains x265_config.h for the 8-bit build.
CONFIG_DIRS = [
    os.path.join(ROOT, "build/x265-8-cross-make"),
    os.path.join(ROOT, "build/x265-8-clang-sve"),
    os.path.join(ROOT, "build/x265-8-testbench"),
]
X265_INC = [
    os.path.join(ROOT, "third_party/x265/source"),
    os.path.join(ROOT, "third_party/x265/source/common"),
]

# Names that live in a sibling kernel's candidate dir (the square
# interp8 path-B files were archived under kernels/interp8/candidates).
SOURCE_OVERRIDES = {
    "interp8-16": "kernels/interp8/candidates/best_sve2_sdoth_16x16.cpp",
    "interp8-32": "kernels/interp8/candidates/best_sve2_sdoth_32x32.cpp",
}


def luma_pu(w, h):
    return "LUMA_%dx%d" % (w, h)


def luma_cu(n):
    return "BLOCK_%dx%d" % (n, n)


def c420_pu(w, h):
    return "CHROMA_420_%dx%d" % (w, h)


def c422_pu(w, h):
    return "CHROMA_422_%dx%d" % (w, h)


def c420_cu(w, h):
    return "BLOCK_420_%dx%d" % (w, h)


def c422_cu(w, h):
    return "BLOCK_422_%dx%d" % (w, h)


I420_PU_SHAPES = {
    (2, 2), (2, 4), (2, 8), (4, 2), (4, 4), (4, 8), (4, 16),
    (6, 8), (8, 2), (8, 4), (8, 6), (8, 8), (8, 16), (8, 32),
    (12, 16), (16, 4), (16, 8), (16, 12), (16, 16), (16, 32),
    (24, 32), (32, 8), (32, 16), (32, 24), (32, 32),
}
I422_PU_SHAPES = {
    (2, 4), (2, 8), (2, 16), (4, 4), (4, 8), (4, 16), (4, 32),
    (6, 16), (8, 4), (8, 8), (8, 12), (8, 16), (8, 32), (8, 64),
    (12, 32), (16, 8), (16, 16), (16, 24), (16, 32), (16, 64),
    (24, 64), (32, 16), (32, 32), (32, 48), (32, 64),
}
I444_PU_SHAPES = {
    (4, 4), (4, 8), (4, 16), (8, 4), (8, 8), (8, 16), (8, 32),
    (12, 16), (16, 4), (16, 8), (16, 12), (16, 16), (16, 32),
    (16, 64), (24, 32), (32, 8), (32, 16), (32, 24), (32, 32),
    (32, 64), (48, 64), (64, 16), (64, 32), (64, 48), (64, 64),
}
I420_CU_SHAPES = {(2, 2), (4, 4), (8, 8), (16, 16), (32, 32)}
I422_CU_SHAPES = {(2, 4), (4, 8), (8, 16), (16, 32), (32, 64)}
I444_CU_SIZES = {4, 8, 16, 32, 64}


def _shape_of(kernel):
    if kernel == "interp8":
        return 8, 8
    if kernel == "interp8-16":
        return 16, 16
    if kernel == "interp8-32":
        return 32, 32
    if kernel == "interp4":
        return 16, 16
    m = re.fullmatch(r"interp8-(\d+)x(\d+)", kernel)
    if m:
        return int(m.group(1)), int(m.group(2))
    m = re.fullmatch(r"interp8vpp-(\d+)(?:x(\d+))?", kernel)
    if m:
        return int(m.group(1)), int(m.group(2) or m.group(1))
    m = re.fullmatch(r"interp8-hps-(\d+)(?:x(\d+))?", kernel)
    if m:
        return int(m.group(1)), int(m.group(2) or m.group(1))
    m = re.fullmatch(r"interp8-(vps|vsp|vss)-(\d+)x(\d+)", kernel)
    if m:
        return int(m.group(2)), int(m.group(3))
    m = re.fullmatch(r"interp4-(\d+)(?:x(\d+))?", kernel)
    if m:
        return int(m.group(1)), int(m.group(2) or m.group(1))
    m = re.fullmatch(r"interp4vpp-(\d+)(?:x(\d+))?", kernel)
    if m:
        return int(m.group(1)), int(m.group(2) or m.group(1))
    m = re.fullmatch(r"satd-(\d+)(?:x(\d+))?", kernel)
    if m:
        return int(m.group(1)), int(m.group(2) or m.group(1))
    m = re.fullmatch(r"chroma-copy-pp(?:-(\d+)x(\d+))?", kernel)
    if m:
        return int(m.group(1) or 16), int(m.group(2) or 16)
    return None


def _interp_field(kernel):
    if kernel.startswith("interp8vpp"):
        return "luma_vpp"
    if kernel.startswith("interp8-hps"):
        return "luma_hps"
    if kernel.startswith("interp8-vps"):
        return "luma_vps"
    if kernel.startswith("interp8-vsp"):
        return "luma_vsp"
    if kernel.startswith("interp8-vss"):
        return "luma_vss"
    if kernel.startswith("interp8"):
        return "luma_hpp"
    if kernel.startswith("interp4vpp"):
        return "filter_vpp"
    if kernel.startswith("interp4"):
        return "filter_hpp"
    return None


def _interp_type(kernel):
    field = _interp_field(kernel)
    if field == "luma_hps":
        return ("void", "const uint8_t*, intptr_t, int16_t*, intptr_t,"
                " int, int")
    if field == "luma_vps":
        return ("void", "const uint8_t*, intptr_t, int16_t*, intptr_t, int")
    if field == "luma_vsp":
        return ("void", "const int16_t*, intptr_t, uint8_t*, intptr_t, int")
    if field == "luma_vss":
        return ("void", "const int16_t*, intptr_t, int16_t*, intptr_t, int")
    return ("void", "const uint8_t*, intptr_t, uint8_t*, intptr_t, int")


def entries_for_kernel(kernel, sym):
    """Return [(slot_expr, ret, params)] for the x265 dispatch table."""
    out = []

    def add(slot, ret, params):
        out.append((slot, ret, params))

    if kernel == "dct8":
        add("cu[BLOCK_8x8].dct", "void",
            "const int16_t*, int16_t*, intptr_t")
        return out
    if kernel == "dct16":
        add("cu[BLOCK_16x16].dct", "void",
            "const int16_t*, int16_t*, intptr_t")
        return out
    if kernel == "dct32":
        add("cu[BLOCK_32x32].dct", "void",
            "const int16_t*, int16_t*, intptr_t")
        return out
    if kernel == "idct16":
        add("cu[BLOCK_16x16].idct", "void",
            "const int16_t*, int16_t*, intptr_t")
        return out
    if kernel == "idct32":
        add("cu[BLOCK_32x32].idct", "void",
            "const int16_t*, int16_t*, intptr_t")
        return out
    if kernel == "sa8d":
        add("cu[BLOCK_8x8].sa8d", "int",
            "const uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel == "sa8d16":
        add("cu[BLOCK_16x16].sa8d", "int",
            "const uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel in ("sad", "sad-32"):
        w = 16 if kernel == "sad" else 32
        add("pu[%s].sad" % luma_pu(w, w), "int",
            "const uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel.startswith("satd"):
        shape = _shape_of(kernel)
        if shape and (shape[0], shape[1]) in I444_PU_SHAPES:
            add("pu[%s].satd" % luma_pu(*shape), "int",
                "const uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel.startswith("interp8"):
        shape = _shape_of(kernel)
        field = _interp_field(kernel)
        if shape and field and (shape[0], shape[1]) in I444_PU_SHAPES:
            ret, params = _interp_type(kernel)
            add("pu[%s].%s" % (luma_pu(*shape), field), ret, params)
        return out
    if kernel.startswith("interp4"):
        shape = _shape_of(kernel)
        field = _interp_field(kernel)
        if not shape or not field:
            return out
        ret, params = _interp_type(kernel)
        for csp, pu_set, pu_fn in (
                ("X265_CSP_I420", I420_PU_SHAPES, c420_pu),
                ("X265_CSP_I422", I422_PU_SHAPES, c422_pu),
                ("X265_CSP_I444", I444_PU_SHAPES, luma_pu)):
            if shape in pu_set:
                add("chroma[%s].pu[%s].%s"
                    % (csp, pu_fn(*shape), field), ret, params)
        return out
    if kernel in ("cu-copy-pp", "pu-copy-pp"):
        w = 32 if kernel == "cu-copy-pp" else 16
        add("cu[%s].copy_pp" % luma_cu(w), "void",
            "uint8_t*, intptr_t, const uint8_t*, intptr_t")
        add("pu[%s].copy_pp" % luma_pu(w, w), "void",
            "uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel in ("cu-copy-ps", "cu-copy-sp", "cu-copy-ss"):
        params = {
            "cu-copy-ps": "int16_t*, intptr_t, const uint8_t*, intptr_t",
            "cu-copy-sp": "uint8_t*, intptr_t, const int16_t*, intptr_t",
            "cu-copy-ss": "int16_t*, intptr_t, const int16_t*, intptr_t",
        }[kernel]
        add("cu[BLOCK_16x16].copy_%s" % kernel.split("-")[-1], "void",
            params)
        return out
    if kernel == "cu-sub-ps":
        add("cu[BLOCK_16x16].sub_ps", "void",
            "int16_t*, intptr_t, const uint8_t*, const uint8_t*,"
            " intptr_t, intptr_t")
        return out
    if kernel == "cu-add-ps":
        for align in ("NONALIGNED", "ALIGNED"):
            add("cu[BLOCK_16x16].add_ps[%s]" % align, "void",
                "uint8_t*, intptr_t, const uint8_t*, const int16_t*,"
                " intptr_t, intptr_t")
        return out
    if kernel == "pu-addavg":
        for align in ("NONALIGNED", "ALIGNED"):
            add("pu[LUMA_16x16].addAvg[%s]" % align, "void",
                "const int16_t*, const int16_t*, uint8_t*, intptr_t,"
                " intptr_t, intptr_t")
        return out
    if kernel.startswith("chroma-copy-pp"):
        shape = _shape_of(kernel)
        if shape:
            for csp, pu_set, pu_fn in (
                    ("X265_CSP_I420", I420_PU_SHAPES, c420_pu),
                    ("X265_CSP_I422", I422_PU_SHAPES, c422_pu),
                    ("X265_CSP_I444", I444_PU_SHAPES, luma_pu)):
                if shape in pu_set:
                    add("chroma[%s].pu[%s].copy_pp"
                        % (csp, pu_fn(*shape)), "void",
                        "uint8_t*, intptr_t, const uint8_t*, intptr_t")
        return out
    if kernel in ("chroma-copy-ps-16x16", "chroma-copy-sp-16x16",
                  "chroma-copy-ss-16x16"):
        kind = kernel.split("-")[2]
        params = {
            "ps": "int16_t*, intptr_t, const uint8_t*, intptr_t",
            "sp": "uint8_t*, intptr_t, const int16_t*, intptr_t",
            "ss": "int16_t*, intptr_t, const int16_t*, intptr_t",
        }[kind]
        for csp, cu_set, cu_fn in (
                ("X265_CSP_I420", I420_CU_SHAPES, c420_cu),
                ("X265_CSP_I422", I422_CU_SHAPES, c422_cu),
                ("X265_CSP_I444", {(n, n) for n in I444_CU_SIZES},
                 luma_cu)):
            if (16, 16) in cu_set:
                enum = cu_fn(16) if csp == "X265_CSP_I444" else cu_fn(16, 16)
                add("chroma[%s].cu[%s].copy_%s"
                    % (csp, enum, kind), "void", params)
        return out
    if kernel == "chroma-addavg-8x8":
        for csp, pu_set, pu_fn in (
                ("X265_CSP_I420", I420_PU_SHAPES, c420_pu),
                ("X265_CSP_I422", I422_PU_SHAPES, c422_pu),
                ("X265_CSP_I444", I444_PU_SHAPES, luma_pu)):
            if (8, 8) in pu_set:
                for align in ("NONALIGNED", "ALIGNED"):
                    add("chroma[%s].pu[%s].addAvg[%s]"
                        % (csp, pu_fn(8, 8), align), "void",
                        "const int16_t*, const int16_t*, uint8_t*,"
                        " intptr_t, intptr_t, intptr_t")
        return out
    if kernel == "scale1d":
        for align in ("NONALIGNED", "ALIGNED"):
            add("scale1D_128to64[%s]" % align, "void",
                "uint8_t*, const uint8_t*")
        return out
    if kernel == "scale2d":
        add("scale2D_64to32", "void", "uint8_t*, const uint8_t*, intptr_t")
        return out
    if kernel == "sign":
        add("sign", "void", "int8_t*, const uint8_t*, const uint8_t*, int")
        return out
    if kernel == "scan-pos-last":
        add("scanPosLast", "int",
            "const uint16_t*, const int16_t*, uint16_t*, uint16_t*,"
            " uint8_t*, int, const uint16_t*, int")
        return out
    if kernel == "find-pos-first-last":
        add("findPosFirstLast", "uint32_t",
            "const int16_t*, intptr_t, const uint16_t[16]")
        return out
    if kernel == "cost-coeff-nxn":
        add("costCoeffNxN", "uint32_t",
            "const uint16_t*, const int16_t*, intptr_t, uint16_t*,"
            " const uint8_t*, uint32_t, uint8_t*, int, int, int")
        return out
    if kernel == "pel-filter-luma-strong":
        for edge in (0, 1):
            add("pelFilterLumaStrong[%d]" % edge, "void",
                "uint8_t*, intptr_t, intptr_t, int32_t, int32_t")
        return out
    if kernel == "quant":
        add("quant", "uint32_t",
            "const int16_t*, const int32_t*, int32_t*, int16_t*,"
            " int, int, int")
        return out
    if kernel == "nquant":
        add("nquant", "uint32_t",
            "const int16_t*, const int32_t*, int16_t*, int, int, int")
        return out
    if kernel == "dequant":
        add("dequant_normal", "void",
            "const int16_t*, int16_t*, int, int, int")
        return out
    if kernel == "dequant-scaling-gt":
        add("dequant_scaling", "void",
            "const int16_t*, const int32_t*, int16_t*, int, int, int")
        return out
    if kernel == "ssim":
        add("ssim_4x4x2_core", "void",
            "const uint8_t*, intptr_t, const uint8_t*, intptr_t,"
            " int32_t*")
        return out
    if kernel == "planecopy-cp":
        add("planecopy_cp", "void",
            "const uint8_t*, intptr_t, uint8_t*, intptr_t,"
            " int, int, int")
        return out
    if kernel == "weight-pp":
        add("weight_pp", "void",
            "const uint8_t*, uint8_t*, intptr_t, int, int, int,"
            " int, int, int")
        return out
    if kernel == "sao":
        add("saoCuOrgE0", "void",
            "uint8_t*, int8_t*, int, int8_t*, intptr_t")
        return out
    if kernel == "sao-b0":
        add("saoCuOrgB0", "void",
            "uint8_t*, const int8_t*, int, int, intptr_t")
        return out
    if kernel == "sao-e1-2rows":
        add("saoCuOrgE1_2Rows", "void",
            "uint8_t*, int8_t*, int8_t*, intptr_t, int")
        return out
    if kernel == "sao-e1":
        add("saoCuOrgE1", "void",
            "uint8_t*, int8_t*, int8_t*, intptr_t, int")
        return out
    if kernel == "sao-e2":
        add("saoCuOrgE2[1]", "void",
            "uint8_t*, int8_t*, int8_t*, int8_t*, int, intptr_t")
        return out
    if kernel == "sao-e3":
        add("saoCuOrgE3[1]", "void",
            "uint8_t*, int8_t*, int8_t*, intptr_t, int, int")
        return out
    if kernel == "sao-stats-bo":
        add("saoCuStatsBO", "void",
            "const int16_t*, const uint8_t*, intptr_t, int, int,"
            " int32_t*, int32_t*")
        return out
    if kernel == "sao-stats-e0":
        add("saoCuStatsE0", "void",
            "const int16_t*, const uint8_t*, intptr_t, int, int,"
            " int32_t*, int32_t*")
        return out
    if kernel == "sao-stats-e1":
        add("saoCuStatsE1", "void",
            "const int16_t*, const uint8_t*, intptr_t, int8_t*,"
            " int, int, int32_t*, int32_t*")
        return out
    if kernel == "sao-stats-e2":
        add("saoCuStatsE2", "void",
            "const int16_t*, const uint8_t*, intptr_t, int8_t*,"
            " int8_t*, int, int, int32_t*, int32_t*")
        return out
    if kernel == "sao-stats-e3":
        add("saoCuStatsE3", "void",
            "const int16_t*, const uint8_t*, intptr_t, int8_t*,"
            " int, int, int32_t*, int32_t*")
        return out
    return out


def candidate_sources(kernel, isa):
    d = os.path.join(ROOT, "kernels", kernel, "candidates")
    if isa == "sve1" and os.path.exists(os.path.join(d, "best_sve1.cpp")):
        return [os.path.join(d, "best_sve1.cpp")]
    if kernel in SOURCE_OVERRIDES:
        p = os.path.join(ROOT, SOURCE_OVERRIDES[kernel])
        if os.path.exists(p):
            return [p]
    p = os.path.join(d, "best_sve2.cpp")
    if os.path.exists(p):
        return [p]
    return []


def _load_best_combo(kernel):
    """Best passed combo from any experiments/m30-*-search results.json."""
    best = None
    base = os.path.join(ROOT, "experiments")
    for dirpath, _, files in os.walk(base):
        if "results.json" not in files:
            continue
        if kernel not in dirpath:
            continue
        try:
            rows = json.load(open(os.path.join(dirpath, "results.json")))
        except (ValueError, OSError):
            continue
        if isinstance(rows, dict):
            rows = rows.get("results", [])
        if not isinstance(rows, list):
            continue
        for r in rows:
            if not isinstance(r, dict):
                continue
            counts = r.get("counts") or {}
            if not r.get("passed") or not counts:
                continue
            combo = {k: v for k, v in r.items()
                     if k not in ("tag", "contract", "upstream_exact",
                                  "passed", "verify_mismatches", "verify",
                                  "counts", "range", "cached", "fusion",
                                  "mca_cycles", "mca_uops")}
            score = counts.get("vector_fused_uop",
                               counts.get("vector_fused", 10 ** 9))
            if best is None or score < best[0]:
                best = (score, combo)
    return best[1] if best else None


def try_generate_source(kernel, isa, workdir):
    """Generate an ISA-restricted generic-recipe source when the kernel has
    no checked-in candidate .cpp (satd/interp4/interp8vpp and friends are
    often archived only as search results)."""
    if isa not in ("sve1", "sve2"):
        return []
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    try:
        from gen_sve2_emit import make_generic_emitter
        from kernel_manifest import load_manifest, layout_plans
    except Exception:
        return None
    try:
        man = load_manifest(kernel)
    except Exception:
        return []
    try:
        emit = make_generic_emitter(kernel, isa=isa)
    except Exception:
        return []
    combos = []
    best = _load_best_combo(kernel)
    if best:
        combos.append(dict(best))
    seen = set()
    for c in layout_plans(man):
        if len(combos) >= 32:
            break
        combos.append(c)
    paths = []
    for combo in combos:
        if isa and combo.get("compute") == "sdot-h":
            combo["compute"] = "sdot-d"
        try:
            src = emit(combo)
        except Exception:
            continue
        key = repr(sorted(combo.items()))
        if key in seen:
            continue
        seen.add(key)
        path = os.path.join(workdir,
                            kernel + "-generated-%d.cpp" % len(paths))
        with open(path, "w") as f:
            f.write(src)
        paths.append(path)
        if len(paths) >= 6:
            break
    return paths


def try_generate_specialized(kernel, isa, workdir):
    """Generate sources with the per-kernel specialized emitters (quant,
    dequant, ssim, sao, ...) for kernels without a generic-recipe seed."""
    if isa not in ("sve1", "sve2"):
        return []
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    try:
        import search_sve2_layouts as s
        from kernel_manifest import load_manifest, layout_plans
    except Exception:
        return []
    try:
        s._ISA = isa
        man = load_manifest(kernel)
    except Exception:
        return []
    if kernel == "sao-e1":
        # The x265 saoCuOrgE1 slot is a single-row primitive; emit a
        # rows=1 variant of the same 64-wide E1 kernel (default emitter
        # generates the 4-row coverage shape, which is not slot-safe).
        try:
            from emit_sao_e1_sve2_shared import emit_64x4
            sym = (man.get("candidate") or {}).get("symbol")
            src = emit_64x4(func_name=sym, rows=1)
            path = os.path.join(workdir, kernel + "-special-0.cpp")
            with open(path, "w") as f:
                f.write(src)
            return [path]
        except Exception:
            return []
    try:
        emit = s.make_emitter(kernel, "acle")
    except Exception:
        return []
    combos = []
    best = _load_best_combo(kernel)
    if best:
        combos.append(dict(best))
    for c in layout_plans(man):
        if len(combos) >= 32:
            break
        combos.append(c)
    if not combos:
        combos = [{}]
    paths = []
    seen = set()
    for combo in combos:
        try:
            src = emit(combo)
        except Exception:
            continue
        key = repr(sorted(combo.items()))
        if key in seen:
            continue
        seen.add(key)
        path = os.path.join(workdir,
                            kernel + "-special-%d.cpp" % len(paths))
        with open(path, "w") as f:
            f.write(src)
        paths.append(path)
        if len(paths) >= 6:
            break
    return paths


def run(cmd, **kw):
    return subprocess.run(cmd, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, text=True, **kw)


def write_inject_patch(outdir, decls, saves, assigns, objs, cxx, common,
                       includes, report):
    """Write the compile-in variant: a patch source that directly mutates
    x265::primitives, its object file, and a unified diff that calls
    dynopt_patch_primitives() from x265_setup_primitives."""
    os.makedirs(outdir, exist_ok=True)
    src_path = os.path.join(outdir, "dynopt_patch.cpp")
    obj_path = os.path.join(outdir, "dynopt_patch.o")
    lines = [
        "// Generated by tools/build_preload_so.py --inject-outdir -- do not",
        "// edit. Compile-in alternative to LD_PRELOAD: no dlsym/dlopen,",
        "// patches x265::primitives directly from inside the x265 build.",
        "#include \"common/primitives.h\"",
        "",
        "using namespace X265_NS;",
        "",
    ]
    lines += decls
    lines += [
        "",
        "extern \"C\" void dynopt_patch_primitives(void)",
        "{",
        "    EncoderPrimitives& P = primitives;",
        "    int n = 0;",
    ]
    lines += [s.replace("P->", "P.") for s in saves]
    for a in assigns:
        lines.append(a.replace("P->", "P."))
        lines.append("    n++;")
    lines += [
        "    fprintf(stderr, \"dynopt: patched %d x265 dispatch slot(s)\\n\","
        " n);",
        "}",
        "",
    ]
    with open(src_path, "w") as f:
        f.write("\n".join(lines))
    r = run([cxx, "-fPIC"] + common + includes +
            ["-c", src_path, "-o", obj_path], timeout=180)
    if r.returncode != 0:
        raise SystemExit("inject patch compile failed:\n" + r.stdout[-3000:])

    # Unified diff against third_party/x265/source/common/primitives.cpp.
    prim = os.path.join(ROOT, "third_party/x265/source/common",
                        "primitives.cpp")
    src = open(prim).read().splitlines()
    mod = list(src)
    for i, line in enumerate(mod):
        if line.strip() == "namespace X265_NS {" and \
                mod[i + 1].strip().startswith("// x265 private namespace"):
            mod.insert(i + 2, 'extern "C" void dynopt_patch_primitives();')
            break
    for i, line in enumerate(mod):
        if line.strip() == "setupAliasPrimitives(primitives);":
            mod.insert(i + 1, "        dynopt_patch_primitives();")
            break
    diff = difflib.unified_diff(
        src, mod,
        fromfile="a/source/common/primitives.cpp",
        tofile="b/source/common/primitives.cpp", lineterm="")
    patch_path = os.path.join(outdir, "x265-dynopt-setup.patch")
    with open(patch_path, "w") as f:
        f.write("\n".join(diff) + "\n")
    with open(os.path.join(outdir, "objects.txt"), "w") as f:
        f.write("\n".join(objs + [obj_path]) + "\n")
    report["inject"] = {
        "patch_source": src_path,
        "patch_object": obj_path,
        "diff": patch_path,
        "objects": objs + [obj_path],
    }
    print("wrote compile-in patch: %s" % patch_path)
    print("patch source: %s" % src_path)
    print("objects (%d):" % (len(objs) + 1))
    for o in objs:
        print("  " + o)
    return obj_path


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out", default="build/dynopt-x265.so")
    ap.add_argument("--isa", choices=tuple(ISA_MARCH), default=None,
                    help="restrict linked candidates to this ISA level "
                         "(sve1 for 920B, sve2 for 950); candidates that "
                         "do not compile/pass the ISA gate are skipped")
    ap.add_argument("--target", choices=("920B", "950"), default=None,
                    help="convenience alias: 920B -> --isa sve1, "
                         "950 -> --isa sve2")
    ap.add_argument("--kernels", default="",
                    help="comma-separated kernel names (default: every "
                         "kernel with a candidate source and a dispatch "
                         "mapping)")
    ap.add_argument("--cxx", default="aarch64-linux-gnu-g++")
    ap.add_argument("--opt", default="-O2",
                    help="candidate compile flags (default -O2)")
    ap.add_argument("--workdir", default="build/preload-work",
                    help="scratch dir for per-kernel objects")
    ap.add_argument("--inject-outdir", default=None,
                    help="instead of linking an LD_PRELOAD .so, write a "
                         "compile-in patch (dynopt_patch.cpp/.o + unified "
                         "diff for third_party/x265 primitives.cpp) plus "
                         "all candidate objects; use "
                         "scripts/build-x265-injected.sh to integrate")
    ap.add_argument("--no-isa-gate", action="store_true",
                    help="skip check_isa_level.py (use only for diagnosis)")
    ap.add_argument("--json", default="",
                    help="write a build report JSON")
    args = ap.parse_args()
    if args.target and not args.isa:
        args.isa = "sve1" if args.target == "920B" else "sve2"

    os.makedirs(args.workdir, exist_ok=True)
    cfg = next((d for d in CONFIG_DIRS if os.path.exists(
        os.path.join(d, "x265_config.h"))), None)
    if cfg is None:
        raise SystemExit("x265_config.h not found under build/")
    includes = ["-I" + os.path.join(ROOT, d) for d in (
        "third_party/x265/source", "third_party/x265/source/common",
        "third_party/x265/source/encoder")] + ["-I" + cfg]
    common = ["-DX265_NS=x265", "-DX265_DEPTH=8", "-DHIGH_BIT_DEPTH=0",
              "-std=c++11"]

    if args.kernels:
        wanted = [k.strip() for k in args.kernels.split(",") if k.strip()]
    else:
        wanted = []
        for kd in sorted(os.listdir(os.path.join(ROOT, "kernels"))):
            d = os.path.join(ROOT, "kernels", kd)
            if os.path.isdir(d) and os.path.exists(
                    os.path.join(d, "manifest.yaml")):
                wanted.append(kd)

    objs = []
    decls = []
    assigns = []
    saves = []
    report = {"isa": args.isa, "patched": [], "skipped": []}
    used_syms = set()

    for kernel in wanted:
        man_path = os.path.join(ROOT, "kernels", kernel, "manifest.yaml")
        if not os.path.exists(man_path):
            report["skipped"].append([kernel, "no manifest"])
            continue
        try:
            import yaml
            man = yaml.safe_load(open(man_path))
        except Exception:
            man = {}
        sym = (man.get("candidate") or {}).get("symbol")
        if not sym:
            report["skipped"].append([kernel, "no candidate symbol"])
            continue
        entries = entries_for_kernel(kernel, sym)
        if not entries:
            report["skipped"].append([kernel, "no dispatch mapping"])
            continue
        sources = candidate_sources(kernel, args.isa)
        if not sources:
            sources = try_generate_source(kernel, args.isa, args.workdir)
            if not sources:
                sources = try_generate_specialized(
                    kernel, args.isa, args.workdir)
            if not sources:
                report["skipped"].append([kernel, "no candidate source"])
                continue
        obj = os.path.join(args.workdir,
                           kernel.replace("/", "_") + ".o")
        cc = [args.cxx, "-fPIC"] + args.opt.split() + common + includes
        if args.isa:
            cc += ["-march=" + ISA_MARCH[args.isa]]
        compiled = False
        for src in sources:
            r = run(cc + ["-c", src, "-o", obj], timeout=180)
            if r.returncode == 0:
                compiled = True
                break
        if not compiled:
            gen_sources = try_generate_source(kernel, args.isa, args.workdir)
            for src in gen_sources:
                r = run(cc + ["-c", src, "-o", obj], timeout=180)
                if r.returncode == 0:
                    compiled = True
                    break
            if not compiled:
                spec_sources = try_generate_specialized(
                    kernel, args.isa, args.workdir)
                for src in spec_sources:
                    r = run(cc + ["-c", src, "-o", obj], timeout=180)
                    if r.returncode == 0:
                        compiled = True
                        break
        if not compiled:
            report["skipped"].append(
                [kernel, "compile fail: " +
                 (r.stdout.strip().splitlines() or ["?"])[-1][:160]])
            continue
        if args.isa and not args.no_isa_gate:
            g = run([sys.executable,
                     os.path.join(ROOT, "tools/check_isa_level.py"),
                     "--object", obj, "--level", args.isa, "--json",
                     "--objdump", "aarch64-linux-gnu-objdump"], timeout=120)
            try:
                gj = json.loads(g.stdout)
                viol = gj.get("violations") or []
            except (ValueError, KeyError):
                viol = [{"mnemonic": "unknown"}]
            if viol:
                report["skipped"].append(
                    [kernel, "ISA violation (%d)" % len(viol)])
                continue
        if sym in used_syms:
            # e.g. sao vs sao-e0 may share a symbol/source; keep the first.
            continue
        used_syms.add(sym)
        objs.append(obj)
        adapter = ADAPTERS.get(kernel)
        slot_sym = adapter["adapter"] if adapter else sym
        if adapter:
            decls.append("extern \"C\" " +
                         adapter["cand_decl"].replace("%SYM%", sym) + ";")
            if adapter.get("orig_decl"):
                decls.append(adapter["orig_decl"])
            decls.append(adapter["body"].replace("%SYM%", sym))
            if adapter.get("save"):
                saves.append("    " + adapter["save"])
        for slot, ret, params in entries:
            if not adapter:
                decls.append("extern \"C\" %s %s(%s);" % (ret, sym, params))
            assigns.append("    P->%s = %s;" % (slot, slot_sym))
        report["patched"].append(
            {"kernel": kernel, "symbol": sym,
             "slots": [s for s, _, _ in entries]})

    if not objs:
        raise SystemExit("no candidates survived the ISA/source filters")

    if args.inject_outdir:
        write_inject_patch(args.inject_outdir, decls, saves, assigns,
                           objs, args.cxx, common, includes, report)
        if args.json:
            with open(args.json, "w") as f:
                json.dump(report, f, indent=1)
        return 0

    wrapper = os.path.join(args.workdir, "dynopt_patch.cpp")
    lines = [
        "// Generated by tools/build_preload_so.py -- do not edit.",
        "#include <dlfcn.h>",
        "#include <link.h>",
        "#include <stdint.h>",
        "#include <stdio.h>",
        "#include <string.h>",
        "#include \"common/primitives.h\"",
        "",
        "using namespace X265_NS;",
        "",
        "// Weak fallback for hosts whose dynamic loader does not expose",
        "// the executable's `primitives` object to dlsym(RTLD_DEFAULT)",
        "// (observed under qemu-user); the strong x265 definition wins",
        "// when it is already loaded.",
        "namespace X265_NS {",
        "extern EncoderPrimitives primitives __attribute__((weak));",
        "}",
        "",
    ]
    lines += decls
    lines += [
        "",
        "static int dynopt_find_x265_cb(struct dl_phdr_info* info,",
        "                               size_t, void* ctx)",
        "{",
        "    const char* name = info->dlpi_name ? info->dlpi_name : \"\";",
        "    if (!strstr(name, \"libx265\"))",
        "        return 0;",
        "    void* h = dlopen(name, RTLD_NOW | RTLD_LOCAL | RTLD_NOLOAD);",
        "    if (!h)",
        "        return 0;",
        "    void* sym = dlsym(h, \"_ZN4x26510primitivesE\");",
        "    if (sym)",
        "    {",
        "        *(void**)ctx = sym;",
        "        return 1;",
        "    }",
        "    return 0;",
        "}",
        "",
        "static EncoderPrimitives* dynopt_primitives(void)",
        "{",
        "    void* p = nullptr;",
        "    dl_iterate_phdr(dynopt_find_x265_cb, &p);",
        "    if (!p)",
        "        p = dlsym(RTLD_DEFAULT, \"_ZN4x26510primitivesE\");",
        "    if (!p && &X265_NS::primitives)",
        "        p = &X265_NS::primitives;",
        "    return reinterpret_cast<EncoderPrimitives*>(p);",
        "}",
        "",
        "extern \"C\" int dynopt_patch_primitives(void)",
        "{",
        "    EncoderPrimitives* P = dynopt_primitives();",
        "    if (!P || !P->pu[0].sad)",
        "        return -1;",
        "    int n = 0;",
    ]
    lines += saves
    for a in assigns:
        lines.append(a)
        lines.append("    n++;")
    lines += [
        "    fprintf(stderr, \"dynopt: patched %d x265 dispatch slot(s)\\n\","
        " n);",
        "    return 0;",
        "}",
        "",
        "extern \"C\" void dynopt_init(void)",
        "{",
        "    dynopt_patch_primitives();",
        "}",
        "",
        "namespace X265_NS {",
        "void x265_setup_primitives(x265_param* param);",
        "}",
        "",
        "namespace X265_NS {",
        "void x265_setup_primitives(x265_param* param)",
        "{",
        "    typedef void (*setup_t)(x265_param*);",
        "    static setup_t orig = nullptr;",
        "    if (!orig)",
        "        orig = reinterpret_cast<setup_t>(dlsym(",
        "            RTLD_NEXT,"
        " \"_ZN4x26521x265_setup_primitivesEP10x265_param\"));",
        "    if (orig)",
        "        orig(param);",
        "    if (param && param->internalBitDepth == 8)",
        "        dynopt_patch_primitives();",
        "}",
        "}",
        "",
        "__attribute__((constructor)) static void dynopt_ctor(void)",
        "{",
        "    // No-op before x265 setup (table is zero-initialized); the",
        "    // x265_setup_primitives interposer performs the real patch.",
        "    dynopt_patch_primitives();",
        "}",
        "",
    ]
    with open(wrapper, "w") as f:
        f.write("\n".join(lines))

    out = os.path.join(ROOT, args.out)
    os.makedirs(os.path.dirname(out), exist_ok=True)
    link = ([args.cxx, "-shared", "-fPIC", "-o", out, wrapper] + common +
            includes + objs + ["-ldl"])
    r = run(link, timeout=300)
    if r.returncode != 0:
        print(r.stdout[-4000:])
        raise SystemExit("shared library link failed")

    print("wrote %s" % out)
    print("patched kernels: %d" % len(report["patched"]))
    for p in report["patched"]:
        print("  %-28s %-46s %s"
              % (p["kernel"], p["symbol"], "; ".join(p["slots"])))
    if report["skipped"]:
        print("skipped: %d" % len(report["skipped"]))
        for k, why in report["skipped"]:
            print("  %-28s %s" % (k, why))
    if args.json:
        with open(args.json, "w") as f:
            json.dump(report, f, indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main())
