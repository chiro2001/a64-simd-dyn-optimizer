#!/usr/bin/env python3
"""SVE2 (VL=256) emitter for IDCT16 (first correctness anchor, docs/27).

Mirrors x265::idct16_c: two partialButterflyInverse16 passes (shift 7 then
shift 4) over 16x16 coefficients, bit-exact with the C reference. The
16-lane vectorization processes all 16 columns at once (lane j = column j);
the output transpose is a scalar store loop for now (correctness anchor).
Optimization (zip transpose / dot layout / stage fusion) comes via search.
"""


GT16 = [
    [64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64],
    [90, 87, 80, 70, 57, 43, 25, 9, -9, -25, -43, -57, -70, -80, -87, -90],
    [89, 75, 50, 18, -18, -50, -75, -89, -89, -75, -50, -18, 18, 50, 75, 89],
    [87, 57, 9, -43, -80, -90, -70, -25, 25, 70, 90, 80, 43, -9, -57, -87],
    [83, 36, -36, -83, -83, -36, 36, 83, 83, 36, -36, -83, -83, -36, 36, 83],
    [80, 9, -70, -87, -25, 57, 90, 43, -43, -90, -57, 25, 87, 70, -9, -80],
    [75, -18, -89, -50, 50, 89, 18, -75, -75, 18, 89, 50, -50, -89, -18, 75],
    [70, -43, -87, 9, 90, 25, -80, -57, 57, 80, -25, -90, -9, 87, 43, -70],
    [64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64],
    [57, -80, -25, 90, -9, -87, 43, 70, -70, -43, 87, 9, -90, 25, 80, -57],
    [50, -89, 18, 75, -75, -18, 89, -50, -50, 89, -18, -75, 75, 18, -89, 50],
    [43, -90, 57, 25, -87, 70, 9, -80, 80, -9, -70, 87, -25, -57, 90, -43],
    [36, -83, 83, -36, -36, 83, -83, 36, 36, -83, 83, -36, -36, 83, -83, 36],
    [25, -70, 90, -80, 43, 9, -57, 87, -87, 57, -9, -43, 80, -90, 70, -25],
    [18, -50, 75, -89, 89, -75, 50, -18, -18, 50, -75, 89, -89, 75, -50, 18],
    [9, -25, 43, -57, 70, -80, 87, -90, 90, -87, 80, -70, 57, -43, 25, -9],
]


def cpp_constants():
    rows = ",\n".join("    { %s }" % ", ".join(str(v) for v in row)
                      for row in GT16)
    return "static const int16_t GT16[16][16] = {\n%s\n};\n" % rows


def half_arithmetic(off, s):
    """Compute the s32 t/u vectors for one 8-column half (off=0 or 8).
    Variable names get suffix `s` ("" for scalar/scatter halves, "A"/"B"
    for the merged zip16 stage)."""
    L = []
    for m in range(16):
        L.append("    svint32_t r%s%d = svld1sh_s32(p32, src + %d + off);"
                 % (s, m, 16 * m))
    for k in range(8):
        odd = [2 * m + 1 for m in range(8)]
        L.append("    svint32_t O%s%d = svmul_s32_x(p32, r%s%d, "
                 "svdup_n_s32(GT16[%d][%d]));"
                 % (s, k, s, odd[0], odd[0], k))
        for m in range(1, 8):
            L.append("    O%s%d = svmla_s32_x(p32, O%s%d, r%s%d, "
                     "svdup_n_s32(GT16[%d][%d]));"
                     % (s, k, s, k, s, odd[m], odd[m], k))
    for k in range(4):
        ev = [4 * m + 2 for m in range(4)]
        L.append("    svint32_t EO%s%d = svmul_s32_x(p32, r%s%d, "
                 "svdup_n_s32(GT16[%d][%d]));"
                 % (s, k, s, ev[0], ev[0], k))
        for m in range(1, 4):
            L.append("    EO%s%d = svmla_s32_x(p32, EO%s%d, r%s%d, "
                     "svdup_n_s32(GT16[%d][%d]));"
                     % (s, k, s, k, s, ev[m], ev[m], k))
    L.append("    svint32_t EEE%s0 = svmul_s32_x(p32, r%s0, "
             "svdup_n_s32(GT16[0][0]));" % (s, s))
    L.append("    EEE%s0 = svmla_s32_x(p32, EEE%s0, r%s8, "
             "svdup_n_s32(GT16[8][0]));" % (s, s, s))
    L.append("    svint32_t EEE%s1 = svmul_s32_x(p32, r%s0, "
             "svdup_n_s32(GT16[0][1]));" % (s, s))
    L.append("    EEE%s1 = svmla_s32_x(p32, EEE%s1, r%s8, "
             "svdup_n_s32(GT16[8][1]));" % (s, s, s))
    L.append("    svint32_t EEO%s0 = svmul_s32_x(p32, r%s4, "
             "svdup_n_s32(GT16[4][0]));" % (s, s))
    L.append("    EEO%s0 = svmla_s32_x(p32, EEO%s0, r%s12, "
             "svdup_n_s32(GT16[12][0]));" % (s, s, s))
    L.append("    svint32_t EEO%s1 = svmul_s32_x(p32, r%s4, "
             "svdup_n_s32(GT16[4][1]));" % (s, s))
    L.append("    EEO%s1 = svmla_s32_x(p32, EEO%s1, r%s12, "
             "svdup_n_s32(GT16[12][1]));" % (s, s, s))
    L.append("    svint32_t EE%s0 = svadd_s32_x(p32, EEE%s0, EEO%s0);"
             % (s, s, s))
    L.append("    svint32_t EE%s1 = svadd_s32_x(p32, EEE%s1, EEO%s1);"
             % (s, s, s))
    L.append("    svint32_t EE%s2 = svsub_s32_x(p32, EEE%s1, EEO%s1);"
             % (s, s, s))
    L.append("    svint32_t EE%s3 = svsub_s32_x(p32, EEE%s0, EEO%s0);"
             % (s, s, s))
    for k in range(4):
        L.append("    svint32_t E%s%d = svadd_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(4):
        L.append("    svint32_t E%s%d = svsub_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k + 4, s, 3 - k, s, 3 - k))
    for k in range(8):
        L.append("    svint32_t t%s%d = svadd_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(8):
        L.append("    svint32_t u%s%d = svsub_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, 7 - k, s, 7 - k))
    return L


def _round_s32(var, shift):
    """Legacy rounding: add(1<<(SHIFT-1)) + asr + (caller narrows)."""
    return [
        "    %s = svadd_s32_x(p32, %s, svdup_n_s32(1 << (SHIFT - 1)));"
        % (var, var),
        "    %s = svasr_n_s32_x(p32, %s, SHIFT);" % (var, var),
    ]


def _round_s16(var, src):
    """SVE2 saturating rounding shift-right narrow (SQRSHRNB): equivalent to
    add(2^(SHIFT-1)) + asr + saturating narrow, then deinterleave the
    even-lane results."""
    return [
        "    svint16_t %s = svuzp1_s16(svqrshrnb_n_s32(%s, SHIFT), "
        "svqrshrnb_n_s32(%s, SHIFT));" % (var, src, src),
    ]


def _scalar_store(lines):
    lines.append("    int16_t o[16][16];")
    for k in range(16):
        lines.append("    svst1_s16(p16, o[%d], out%d);" % (k, k))
    lines.append("    for (int j = 0; j < 8; j++)")
    lines.append("        for (int k = 0; k < 16; k++)")
    lines.append("            dst[(off + j) * stride + k] = o[k][j];")


def _scatter_store(lines, round_mode):
    lines.append("    const svbool_t p8s = svwhilelt_b32((uint32_t)0, "
                 "(uint32_t)8);")
    lines.append("    const svint32_t offs = svindex_s32(0, (int32_t)stride);")
    for i in range(16):
        srcv = "t%d" % i if i < 8 else "u%d" % (i - 8)
        if round_mode == "rshrnb":
            lines.extend(_round_s16("n%d" % i, srcv))
            lines.append("    svint32_t d%d = svunpklo_s32(n%d);" % (i, i))
            lines.append("    svst1h_scatter_s32index_s32(p8s, "
                         "dst + (intptr_t)(%d + off * stride), offs, d%d);"
                         % (i, i))
        else:
            lines.append("    svint32_t d%d = %s;" % (i, srcv))
            lines.extend(_round_s32("d%d" % i, "SHIFT"))
            lines.append("    d%d = svmax_s32_x(p32, d%d, "
                         "svdup_n_s32(-32768));" % (i, i))
            lines.append("    d%d = svmin_s32_x(p32, d%d, "
                         "svdup_n_s32(32767));" % (i, i))
            lines.append("    svst1h_scatter_s32index_s32(p8s, "
                         "dst + (intptr_t)(%d + off * stride), offs, d%d);"
                         % (i, i))


def _zip16_transpose(lines):
    """Butterfly found by optimizer/ir/permute_search.py (zip, order
    8,4,2,1): out[j] after the tree == column j in natural lane order."""
    cur = ["out%d" % i for i in range(16)]
    for lev, d in enumerate((8, 4, 2, 1)):
        nxt = list(cur)
        for i in range(16):
            j = i ^ d
            if i < j:
                nxt[i] = "z%d_%d" % (lev, i)
                nxt[j] = "z%d_%d" % (lev, j)
                lines.append("    svint16_t z%d_%d = "
                             "svzip1_s16(%s, %s);"
                             % (lev, i, cur[i], cur[j]))
                lines.append("    svint16_t z%d_%d = "
                             "svzip2_s16(%s, %s);"
                             % (lev, j, cur[i], cur[j]))
        cur = nxt
    for i in range(16):
        lines.append("    svst1_s16(p16, dst + (intptr_t)(%d * stride), "
                     "%s);" % (i, cur[i]))


def stage_src(store, round_mode="rshrnb"):
    """Generate the per-stage code for store in {scalar, scatter, zip16}.

    VL=256: svint32_t has 8 lanes, so the 16 columns run as two 8-column
    halves (off=0 / off=8). scalar/scatter keep the two half calls and only
    change the writeback; zip16 merges both halves into 16-lane rows,
    applies the zip butterfly transpose and stores 16 contiguous rows."""
    L = []
    if store in ("scalar", "scatter"):
        L.append("template <int SHIFT>")
        L.append("static inline __attribute__((always_inline)) void "
                 "idct16_half(const int16_t* src, int16_t* dst, "
                 "intptr_t stride, int off)")
        L.append("{")
        L.append("    const svbool_t p32 = svptrue_b32();")
        L.append("    const svbool_t p16 = svptrue_b16();")
        L.extend(half_arithmetic(0, ""))
        if store == "scalar":
            for i in range(16):
                srcv = "t%d" % i if i < 8 else "u%d" % (i - 8)
                if round_mode == "rshrnb":
                    L.extend(_round_s16("out%d" % i, srcv))
                else:
                    L.extend(_round_s32(srcv, "SHIFT"))
                    L.append("    svint16_t out%d = "
                             "svuzp1_s16(svqxtnb_s32(%s), "
                             "svqxtnb_s32(%s));" % (i, srcv, srcv))
            _scalar_store(L)
        else:
            _scatter_store(L, round_mode)
        L.append("}")
        L.append("")
        L.append("template <int SHIFT>")
        L.append("static inline __attribute__((always_inline)) void "
                 "idct16_stage(const int16_t* src, int16_t* dst, "
                 "intptr_t stride)")
        L.append("{")
        L.append("    idct16_half<SHIFT>(src, dst, stride, 0);")
        L.append("    idct16_half<SHIFT>(src, dst, stride, 8);")
        L.append("}")
    elif store == "zip16":
        L.append("template <int SHIFT>")
        L.append("static inline __attribute__((always_inline)) void "
                 "idct16_stage(const int16_t* src, int16_t* dst, "
                 "intptr_t stride)")
        L.append("{")
        L.append("    const svbool_t p32 = svptrue_b32();")
        L.append("    const svbool_t p16 = svptrue_b16();")
        L.append("    const svbool_t p8h = svwhilelt_b16((uint32_t)0, "
                 "(uint32_t)8);")
        # off is baked into the arithmetic (0 then 8)
        L.append("    int off = 0;")
        L.extend(half_arithmetic(0, "A"))
        L.append("    off = 8;")
        L.extend(half_arithmetic(8, "B"))
        for i in range(16):
            sa = "tA%d" % i if i < 8 else "uA%d" % (i - 8)
            sb = "tB%d" % i if i < 8 else "uB%d" % (i - 8)
            if round_mode == "rshrnb":
                L.extend(_round_s16("nA%d" % i, sa))
                L.extend(_round_s16("nB%d" % i, sb))
            else:
                for var in (sa, sb):
                    L.extend(_round_s32(var, "SHIFT"))
                L.append("    svint16_t nA%d = "
                         "svuzp1_s16(svqxtnb_s32(%s), svqxtnb_s32(%s));"
                         % (i, sa, sa))
                L.append("    svint16_t nB%d = "
                         "svuzp1_s16(svqxtnb_s32(%s), svqxtnb_s32(%s));"
                         % (i, sb, sb))
            L.append("    svint16_t out%d = svsplice_s16(p8h, nA%d, nB%d);"
                     % (i, i, i))
        _zip16_transpose(L)
        L.append("}")
    else:
        raise ValueError("unknown store mode %r" % store)
    return "\n".join(L)


def emit(func_name="dynopt_idct16_sve2_shared", store="scalar",
         round_mode="rshrnb"):
    return """\
// Generated by tools/emit_idct16_sve2_shared.py -- do not edit by hand.
// IDCT16 SVE2 (VL=256), bit-exact with x265::idct16_c (docs/27).
#include <arm_sve.h>

%s

%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t dstStride)
{
    int16_t coef[16 * 16];
    idct16_stage<7>(src, coef, 16);
    idct16_stage<12>(coef, dst, dstStride);
}
""" % (cpp_constants(), stage_src(store, round_mode), func_name)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/idct16/sve2.cpp")
    ap.add_argument("--store", default="scalar",
                    choices=("scalar", "scatter", "zip16"))
    ap.add_argument("--round", default="rshrnb",
                    choices=("rshrnb", "addasr"))
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(store=args.store, round_mode=args.round))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
