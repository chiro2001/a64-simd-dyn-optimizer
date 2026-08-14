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


def cpp_sdot_constants():
    """SVE2p1 sdot z.s,z.h,z.h constant tables for IDCT16 O/EO/EEE/EEO.

    Same semantics as idct32 (docs/27 §8.10): each 16-lane C row is
    (g_a[k], g_b[k]) repeated 8 times; sdot lane e = d[2e]*c[2e] +
    d[2e+1]*c[2e+1] with d = zip1(r_a, r_b) mixes the same column e of
    two rows. Tables indexed [k][pair][16].
    """
    def pair_row(k, a, b):
        return [GT16[a][k], GT16[b][k]] * 8
    o = [[pair_row(k, 4 * p + 1, 4 * p + 3) for p in range(4)]
         for k in range(8)]
    eo = [[pair_row(k, 8 * p + 2, 8 * p + 6) for p in range(2)]
          for k in range(4)]
    eee = [[pair_row(k, 0, 8)] for k in range(2)]
    eeo = [[pair_row(k, 4, 12)] for k in range(2)]
    out = []
    for name, tab in (("CDOT_O", o), ("CDOT_EO", eo),
                      ("CDOT_EEE", eee), ("CDOT_EEO", eeo)):
        groups = []
        for kk in tab:
            rows = ["        { %s }" % ", ".join(str(v) for v in pp)
                    for pp in kk]
            groups.append("    {\n%s\n    }" % ",\n".join(rows))
        out.append("static const int16_t %s[%d][%d][16] = {\n%s\n};\n"
                   % (name, len(tab), len(tab[0]), ",\n".join(groups)))
    return "\n".join(out)


def butterfly_s32(s):
    """Shared EE/E/t/u butterfly after O/EO/EEE/EEO are ready (idct16)."""
    L = []
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
    return L + butterfly_s32(s)


def chunk_arithmetic_sdot(off, s):
    """SVE2p1 sdot z.s,z.h,z.h O/EO/EEE/EEO (docs/27 §8.10 layout,
    mirror of idct32). 8-lane s16 row loads; vnum constant addressing."""
    L = []
    for m in range(16):
        L.append("    svint16_t r%s%d = svld1_s16(p8h, src + %d + off);"
                 % (s, m, 16 * m))
    for p in range(4):
        L.append("    svint16_t d%sO%d = svzip1_s16(r%s%d, r%s%d);"
                 % (s, p, s, 4 * p + 1, s, 4 * p + 3))
    for k in range(8):
        acc = "O%s%d" % (s, k)
        L.append("    svint32_t %s = z;" % acc)
        for p in range(4):
            L.append("    %s = sdot_s32_h(%s, d%sO%d, "
                     "load_c(CDOT_O[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
    for p in range(2):
        L.append("    svint16_t d%sEO%d = svzip1_s16(r%s%d, r%s%d);"
                 % (s, p, s, 8 * p + 2, s, 8 * p + 6))
    for k in range(4):
        acc = "EO%s%d" % (s, k)
        L.append("    svint32_t %s = z;" % acc)
        for p in range(2):
            L.append("    %s = sdot_s32_h(%s, d%sEO%d, "
                     "load_c(CDOT_EO[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
    L.append("    svint16_t d%sEEE = svzip1_s16(r%s0, r%s8);" % (s, s, s))
    for k in range(2):
        acc = "EEE%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEE, "
                 "load_c(CDOT_EEE[%d][0], 0));" % (acc, s, k))
    L.append("    svint16_t d%sEEO = svzip1_s16(r%s4, r%s12);" % (s, s, s))
    for k in range(2):
        acc = "EEO%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEO, "
                 "load_c(CDOT_EEO[%d][0], 0));" % (acc, s, k))
    return L + butterfly_s32(s)


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


def stage_src(store, round_mode="rshrnb", compute="mul"):
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
        L.append("    const svbool_t p8h = svwhilelt_b16((uint32_t)0, "
                 "(uint32_t)8);")
        L.append("    const svint32_t z = svdup_n_s32(0);")
        L.extend(chunk_arithmetic_sdot(0, "") if compute == "sdot-s32"
                 else half_arithmetic(0, ""))
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
        L.append("    const svint32_t z = svdup_n_s32(0);")
        # off is baked into the arithmetic (0 then 8)
        L.append("    int off = 0;")
        L.extend(chunk_arithmetic_sdot(0, "A") if compute == "sdot-s32"
                 else half_arithmetic(0, "A"))
        L.append("    off = 8;")
        L.extend(chunk_arithmetic_sdot(8, "B") if compute == "sdot-s32"
                 else half_arithmetic(8, "B"))
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
         round_mode="rshrnb", compute="mul"):
    consts = (cpp_sdot_constants() if compute == "sdot-s32"
              else cpp_constants())
    helper = ""
    if compute == "sdot-s32":
        helper = (
            "static inline __attribute__((always_inline)) svint32_t\n"
            "sdot_s32_h(svint32_t acc, svint16_t a, svint16_t b)\n"
            "{\n"
            "    asm volatile(\"sdot %0.s, %1.h, %2.h\"\n"
            "                 : \"+w\"(acc) : \"w\"(a), \"w\"(b));\n"
            "    return acc;\n"
            "}\n"
            "\n"
            "static inline __attribute__((always_inline)) svint16_t\n"
            "load_c(const int16_t* base, int vnum)\n"
            "{\n"
            "    svint16_t v;\n"
            "    asm volatile(\"ld1h %0.h, %1/z, [%2, #%3, MUL VL]\"\n"
            "                 : \"=w\"(v)\n"
            "                 : \"Upl\"(svptrue_b16()), \"r\"(base),\n"
            "                   \"i\"(vnum));\n"
            "    return v;\n"
            "}\n")
    return """\
// Generated by tools/emit_idct16_sve2_shared.py -- do not edit by hand.
// IDCT16 SVE2%s (VL=256), bit-exact with x265::idct16_c (docs/27).
#include <arm_sve.h>

%s

%s

%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t dstStride)
{
    int16_t coef[16 * 16];
    idct16_stage<7>(src, coef, 16);
    idct16_stage<12>(coef, dst, dstStride);
}
""" % ("/SVE2p1" if compute == "sdot-s32" else "",
       consts, helper, stage_src(store, round_mode, compute), func_name)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/idct16/sve2.cpp")
    ap.add_argument("--store", default="scalar",
                    choices=("scalar", "scatter", "zip16"))
    ap.add_argument("--round", default="rshrnb",
                    choices=("rshrnb", "addasr"))
    ap.add_argument("--compute", default="mul",
                    choices=("mul", "sdot-s32"))
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(store=args.store, round_mode=args.round,
                     compute=args.compute))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
