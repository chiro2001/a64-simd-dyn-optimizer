#!/usr/bin/env python3
"""SVE2 (VL=256) emitter for IDCT32 (docs/27 §8).

Mirrors x265::idct32_c: two partialButterflyInverse32 passes (shift 7 then
12) over a 32x32 coefficient block. VL=256 s32 has 8 lanes, so the 32
input columns run as four 8-column chunks (off=0/8/16/24); each chunk
produces 8 output rows of 32 columns. Store modes: scalar (o[][] roundtrip)
and scatter (svst1h_scatter_s32index_s32, one instruction per output
column); rounding uses SQRSHRNB (svqrshrnb_n_s32, docs/27 §7.1b).
"""

import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CONSTANTS_CPP = os.path.join(ROOT, "third_party", "x265", "source",
                             "common", "constants.cpp")


def parse_gt32(path=CONSTANTS_CPP):
    """Extract g_t32[32][32] int16 values from the x265 constants.cpp."""
    text = open(path).read()
    m = re.search(r"const int16_t g_t32\[32\]\[32\]\s*=\s*\{(.*?)\};",
                  text, re.S)
    if not m:
        raise RuntimeError("g_t32 not found in %s" % path)
    rows = []
    for line in m.group(1).splitlines():
        nums = re.findall(r"-?\d+", line)
        if nums:
            rows.append([int(x) for x in nums])
    if len(rows) != 32 or any(len(r) != 32 for r in rows):
        raise RuntimeError("g_t32 parse failed: %d rows" % len(rows))
    return rows


GT32 = parse_gt32()


def cpp_constants():
    rows = ",\n".join("    { %s }" % ", ".join(str(v) for v in row)
                      for row in GT32)
    return "static const int16_t GT32[32][32] = {\n%s\n};\n" % rows


def _round_s16(var, src):
    return [
        "    svint16_t %s = svuzp1_s16(svqrshrnb_n_s32(%s, SHIFT), "
        "svqrshrnb_n_s32(%s, SHIFT));" % (var, src, src),
    ]


def chunk_arithmetic(off, s):
    """Compute O/EO/EEO/EEEE/EEEO/EEE/EE/E/t/u (s32 8-lane) for one
    8-column chunk. `off` is baked in; names get suffix `s`."""
    L = []
    for m in range(32):
        L.append("    svint32_t r%s%d = svld1sh_s32(p32, src + %d + off);"
                 % (s, m, 32 * m))
    # O[0..15] = sum over 16 odd rows of GT32[2m+1][k] * r_{2m+1}
    for k in range(16):
        odd = [2 * m + 1 for m in range(16)]
        L.append("    svint32_t O%s%d = svmul_s32_x(p32, r%s%d, "
                 "svdup_n_s32(GT32[%d][%d]));"
                 % (s, k, s, odd[0], odd[0], k))
        for m in range(1, 16):
            L.append("    O%s%d = svmla_s32_x(p32, O%s%d, r%s%d, "
                     "svdup_n_s32(GT32[%d][%d]));"
                     % (s, k, s, k, s, odd[m], odd[m], k))
    # EO[0..7] = sum over 8 rows 4m+2
    for k in range(8):
        ev = [4 * m + 2 for m in range(8)]
        L.append("    svint32_t EO%s%d = svmul_s32_x(p32, r%s%d, "
                 "svdup_n_s32(GT32[%d][%d]));"
                 % (s, k, s, ev[0], ev[0], k))
        for m in range(1, 8):
            L.append("    EO%s%d = svmla_s32_x(p32, EO%s%d, r%s%d, "
                     "svdup_n_s32(GT32[%d][%d]));"
                     % (s, k, s, k, s, ev[m], ev[m], k))
    # EEO[0..3] = sum over 4 rows 8m+4
    for k in range(4):
        qv = [8 * m + 4 for m in range(4)]
        L.append("    svint32_t EEO%s%d = svmul_s32_x(p32, r%s%d, "
                 "svdup_n_s32(GT32[%d][%d]));"
                 % (s, k, s, qv[0], qv[0], k))
        for m in range(1, 4):
            L.append("    EEO%s%d = svmla_s32_x(p32, EEO%s%d, r%s%d, "
                     "svdup_n_s32(GT32[%d][%d]));"
                     % (s, k, s, k, s, qv[m], qv[m], k))
    # EEEO/EEEE (2 terms each)
    L.append("    svint32_t EEEO%s0 = svmul_s32_x(p32, r%s8, "
             "svdup_n_s32(GT32[8][0]));" % (s, s))
    L.append("    EEEO%s0 = svmla_s32_x(p32, EEEO%s0, r%s24, "
             "svdup_n_s32(GT32[24][0]));" % (s, s, s))
    L.append("    svint32_t EEEO%s1 = svmul_s32_x(p32, r%s8, "
             "svdup_n_s32(GT32[8][1]));" % (s, s))
    L.append("    EEEO%s1 = svmla_s32_x(p32, EEEO%s1, r%s24, "
             "svdup_n_s32(GT32[24][1]));" % (s, s, s))
    L.append("    svint32_t EEEE%s0 = svmul_s32_x(p32, r%s0, "
             "svdup_n_s32(GT32[0][0]));" % (s, s))
    L.append("    EEEE%s0 = svmla_s32_x(p32, EEEE%s0, r%s16, "
             "svdup_n_s32(GT32[16][0]));" % (s, s, s))
    L.append("    svint32_t EEEE%s1 = svmul_s32_x(p32, r%s0, "
             "svdup_n_s32(GT32[0][1]));" % (s, s))
    L.append("    EEEE%s1 = svmla_s32_x(p32, EEEE%s1, r%s16, "
             "svdup_n_s32(GT32[16][1]));" % (s, s, s))
    # EEE
    L.append("    svint32_t EEE%s0 = svadd_s32_x(p32, EEEE%s0, EEEO%s0);"
             % (s, s, s))
    L.append("    svint32_t EEE%s3 = svsub_s32_x(p32, EEEE%s0, EEEO%s0);"
             % (s, s, s))
    L.append("    svint32_t EEE%s1 = svadd_s32_x(p32, EEEE%s1, EEEO%s1);"
             % (s, s, s))
    L.append("    svint32_t EEE%s2 = svsub_s32_x(p32, EEEE%s1, EEEO%s1);"
             % (s, s, s))
    # EE
    for k in range(4):
        L.append("    svint32_t EE%s%d = svadd_s32_x(p32, EEE%s%d, EEO%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(4):
        L.append("    svint32_t EE%s%d = svsub_s32_x(p32, EEE%s%d, EEO%s%d);"
                 % (s, k + 4, s, 3 - k, s, 3 - k))
    # E
    for k in range(8):
        L.append("    svint32_t E%s%d = svadd_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(8):
        L.append("    svint32_t E%s%d = svsub_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k + 8, s, 7 - k, s, 7 - k))
    # t/u (16 outputs each side)
    for k in range(16):
        L.append("    svint32_t t%s%d = svadd_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(16):
        L.append("    svint32_t u%s%d = svsub_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, 15 - k, s, 15 - k))
    return L


def chunk_store_scalar(L):
    L.append("    int16_t o[32][16];")
    for i in range(32):
        srcv = "t%d" % i if i < 16 else "u%d" % (i - 16)
        L.extend(_round_s16("out%d" % i, srcv))
        L.append("    svst1_s16(p8h, o[%d], out%d);" % (i, i))
    L.append("    for (int j = 0; j < 8; j++)")
    L.append("        for (int k = 0; k < 32; k++)")
    L.append("            dst[(off + j) * stride + k] = o[k][j];")


def chunk_store_scatter(L):
    L.append("    const svbool_t p8s = svwhilelt_b32((uint32_t)0, "
             "(uint32_t)8);")
    L.append("    const svint32_t offs = svindex_s32(0, (int32_t)stride);")
    for i in range(32):
        srcv = "t%d" % i if i < 16 else "u%d" % (i - 16)
        L.extend(_round_s16("n%d" % i, srcv))
        L.append("    svint32_t d%d = svunpklo_s32(n%d);" % (i, i))
        L.append("    svst1h_scatter_s32index_s32(p8s, "
                 "dst + (intptr_t)(%d + off * stride), offs, d%d);"
                 % (i, i))


def stage_src(store):
    L = []
    L.append("template <int SHIFT>")
    L.append("static inline __attribute__((always_inline)) void "
             "idct32_chunk(const int16_t* src, int16_t* dst, "
             "intptr_t stride, int off)")
    L.append("{")
    L.append("    const svbool_t p32 = svptrue_b32();")
    L.append("    const svbool_t p8h = svwhilelt_b16((uint32_t)0, "
             "(uint32_t)8);")
    L.extend(chunk_arithmetic(0, ""))
    if store == "scalar":
        chunk_store_scalar(L)
    elif store == "scatter":
        chunk_store_scatter(L)
    else:
        raise ValueError("unknown store %r" % store)
    L.append("}")
    L.append("")
    L.append("template <int SHIFT>")
    L.append("static inline __attribute__((always_inline)) void "
             "idct32_stage(const int16_t* src, int16_t* dst, "
             "intptr_t stride)")
    L.append("{")
    L.append("    idct32_chunk<SHIFT>(src, dst, stride, 0);")
    L.append("    idct32_chunk<SHIFT>(src, dst, stride, 8);")
    L.append("    idct32_chunk<SHIFT>(src, dst, stride, 16);")
    L.append("    idct32_chunk<SHIFT>(src, dst, stride, 24);")
    L.append("}")
    return "\n".join(L)


def emit(func_name="dynopt_idct32_sve2_shared", store="scatter"):
    return """\
// Generated by tools/emit_idct32_sve2_shared.py -- do not edit by hand.
// IDCT32 SVE2 (VL=256), bit-exact with x265::idct32_c (docs/27 §8).
#include <arm_sve.h>

%s

%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t dstStride)
{
    int16_t coef[32 * 32];
    idct32_stage<7>(src, coef, 32);
    idct32_stage<12>(coef, dst, dstStride);
}
""" % (cpp_constants(), stage_src(store), func_name)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/idct32/sve2.cpp")
    ap.add_argument("--store", default="scatter",
                    choices=("scalar", "scatter"))
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(store=args.store))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
