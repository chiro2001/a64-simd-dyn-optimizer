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


def stage_src():
    """Generate idct16_half (8 columns per half) + idct16_stage wrapper.

    VL=256: svint32_t has 8 lanes, so 16 columns run as two 8-column
    halves (off=0 / off=8)."""
    L = []
    L.append("template <int SHIFT>")
    L.append("static inline __attribute__((always_inline)) svint16_t "
             "rndn(svint32_t v)")
    L.append("{")
    L.append("    const svbool_t p32 = svptrue_b32();")
    L.append("    v = svadd_s32_x(p32, v, svdup_n_s32(1 << (SHIFT - 1)));")
    L.append("    v = svasr_n_s32_x(p32, v, SHIFT);")
    L.append("    return svuzp1_s16(svqxtnb_s32(v), svqxtnb_s32(v));")
    L.append("}")
    L.append("")
    L.append("template <int SHIFT>")
    L.append("static inline __attribute__((always_inline)) void "
             "idct16_half(const int16_t* src, int16_t* dst, "
             "intptr_t stride, int off)")
    L.append("{")
    L.append("    const svbool_t p32 = svptrue_b32();")
    L.append("    const svbool_t p16 = svptrue_b16();")
    for m in range(16):
        L.append("    svint32_t r%d = svld1sh_s32(p32, src + %d + off);"
                 % (m, 16 * m))
    # O[0..7] = sum over odd rows 2m+1 of GT16[2m+1][k] * r_{2m+1}
    for k in range(8):
        odd = [2 * m + 1 for m in range(8)]
        L.append("    svint32_t O%d = svmul_s32_x(p32, r%d, "
                 "svdup_n_s32(GT16[%d][%d]));"
                 % (k, odd[0], odd[0], k))
        for m in range(1, 8):
            L.append("    O%d = svmla_s32_x(p32, O%d, r%d, "
                     "svdup_n_s32(GT16[%d][%d]));"
                     % (k, k, odd[m], odd[m], k))
    # EO[0..3] = sum over rows 4m+2 of GT16[4m+2][k]
    for k in range(4):
        ev = [4 * m + 2 for m in range(4)]
        L.append("    svint32_t EO%d = svmul_s32_x(p32, r%d, "
                 "svdup_n_s32(GT16[%d][%d]));"
                 % (k, ev[0], ev[0], k))
        for m in range(1, 4):
            L.append("    EO%d = svmla_s32_x(p32, EO%d, r%d, "
                     "svdup_n_s32(GT16[%d][%d]));"
                     % (k, k, ev[m], ev[m], k))
    L.append("    svint32_t EEE0 = svmul_s32_x(p32, r0, svdup_n_s32(GT16[0][0]));")
    L.append("    EEE0 = svmla_s32_x(p32, EEE0, r8, svdup_n_s32(GT16[8][0]));")
    L.append("    svint32_t EEE1 = svmul_s32_x(p32, r0, svdup_n_s32(GT16[0][1]));")
    L.append("    EEE1 = svmla_s32_x(p32, EEE1, r8, svdup_n_s32(GT16[8][1]));")
    L.append("    svint32_t EEO0 = svmul_s32_x(p32, r4, svdup_n_s32(GT16[4][0]));")
    L.append("    EEO0 = svmla_s32_x(p32, EEO0, r12, svdup_n_s32(GT16[12][0]));")
    L.append("    svint32_t EEO1 = svmul_s32_x(p32, r4, svdup_n_s32(GT16[4][1]));")
    L.append("    EEO1 = svmla_s32_x(p32, EEO1, r12, svdup_n_s32(GT16[12][1]));")
    L.append("    svint32_t EE0 = svadd_s32_x(p32, EEE0, EEO0);")
    L.append("    svint32_t EE1 = svadd_s32_x(p32, EEE1, EEO1);")
    L.append("    svint32_t EE2 = svsub_s32_x(p32, EEE1, EEO1);")
    L.append("    svint32_t EE3 = svsub_s32_x(p32, EEE0, EEO0);")
    L.append("    svint32_t E0 = svadd_s32_x(p32, EE0, EO0);")
    L.append("    svint32_t E1 = svadd_s32_x(p32, EE1, EO1);")
    L.append("    svint32_t E2 = svadd_s32_x(p32, EE2, EO2);")
    L.append("    svint32_t E3 = svadd_s32_x(p32, EE3, EO3);")
    L.append("    svint32_t E4 = svsub_s32_x(p32, EE3, EO3);")
    L.append("    svint32_t E5 = svsub_s32_x(p32, EE2, EO2);")
    L.append("    svint32_t E6 = svsub_s32_x(p32, EE1, EO1);")
    L.append("    svint32_t E7 = svsub_s32_x(p32, EE0, EO0);")
    for k in range(8):
        L.append("    svint32_t t%d = svadd_s32_x(p32, E%d, O%d);"
                 % (k, k, k))
    for k in range(8):
        L.append("    svint32_t u%d = svsub_s32_x(p32, E%d, O%d);"
                 % (k, 7 - k, 7 - k))
    for i in range(16):
        srcv = "t%d" % i if i < 8 else "u%d" % (i - 8)
        L.append("    svint16_t out%d = rndn<SHIFT>(%s);" % (i, srcv))
    # scalar transpose store: dst[j*stride + k] = out_k lane j
    L.append("    int16_t o[16][16];")
    for k in range(16):
        L.append("    svst1_s16(p16, o[%d], out%d);" % (k, k))
    L.append("    for (int j = 0; j < 8; j++)")
    L.append("        for (int k = 0; k < 16; k++)")
    L.append("            dst[(off + j) * stride + k] = o[k][j];")
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
    return "\n".join(L)


def emit(func_name="dynopt_idct16_sve2_shared"):
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
""" % (cpp_constants(), stage_src(), func_name)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/idct16/sve2.cpp")
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit())
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
