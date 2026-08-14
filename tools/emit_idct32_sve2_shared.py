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


def _dup_pair_row(k, a, b):
    """16-lane constant [g_a[k], g_b[k]] repeated 8 times (sdot z.s C)."""
    return [GT32[a][k], GT32[b][k]] * 8


def cpp_sdot_constants():
    """SVE2p1 sdot z.s,z.h,z.h constant tables for IDCT32 O/EO/EEO/EEEE.

    sdot z.s,z.h,z.h semantics (VL=256): lane e = d[2e]*c[2e] +
    d[2e+1]*c[2e+1]. With D = zip1(r_a, r_b), lane e holds (r_a[e], r_b[e])
    so C[2e], C[2e+1] must be (g_a[k], g_b[k]) -- independent of column e.
    Each row-pair therefore needs a 16-lane vector with that pair repeated
    8 times; tables are indexed [k][pair][16].
    """
    o = [[_dup_pair_row(k, 4 * p + 1, 4 * p + 3) for p in range(8)]
         for k in range(16)]
    eo = [[_dup_pair_row(k, 8 * p + 2, 8 * p + 6) for p in range(4)]
          for k in range(8)]
    eeo = [[_dup_pair_row(k, 16 * p + 4, 16 * p + 12) for p in range(2)]
           for k in range(4)]
    eeeo = [[_dup_pair_row(k, 8, 24)] for k in range(2)]
    eeee = [[_dup_pair_row(k, 0, 16)] for k in range(2)]
    out = []
    for name, tab in (("CDOT_O", o), ("CDOT_EO", eo), ("CDOT_EEO", eeo),
                      ("CDOT_EEEO", eeeo), ("CDOT_EEEE", eeee)):
        groups = []
        for kk in tab:
            rows = ["        { %s }" % ", ".join(str(v) for v in pp)
                    for pp in kk]
            groups.append("    {\n%s\n    }" % ",\n".join(rows))
        out.append("static const int16_t %s[%d][%d][16] = {\n%s\n};\n"
                   % (name, len(tab), len(tab[0]), ",\n".join(groups)))
    return "\n".join(out)


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


def chunk_arithmetic_sdot(off, s, k_block=16):
    """SVE2p1 sdot z.s,z.h,z.h O/EO/EEO/EEEE/EEEO (layout == mul version).

    Rows are loaded as 16-lane s16 (low 8 lanes = this chunk's columns).
    Each row pair is interleaved once (zip1) and reused for all k; every
    sdot consumes one constant vector from the CDOT_* tables.

    2026-08-14 (round-0017 P1)：输入行**按需装入**——每行只属于一个
    分解族（O/EO/EEO/EEEO/EEEE 的 row 集合互不相交），因此逐 row-pair
    执行 load→zip→sdot(active accs)，行/d 立即死亡；峰值活跃从 ~40
    （32 行全载 + 8 d 长期存活）降到 ~16 累加器 + 1 d。整数加法可交换，
    语义逐位不变。
    """
    L = []
    L.append("    const svbool_t p8r = svwhilelt_b16((uint32_t)0, "
             "(uint32_t)8);")
    L.append("    const svint32_t z = svdup_n_s32(0);")
    # O: 8 row pairs (1,3),(5,7),...,(29,31)。k_block 把 16 个 O 累加器
    # 分成 kg 组（每组重走输入行）：更低峰值活跃换重复行 load。
    for kg in range(0, 16, k_block):
        for k in range(kg, kg + k_block):
            L.append("    svint32_t O%s%d = z;" % (s, k))
        for p in range(8):
            L.append("    svint16_t a%sO%d_%d = svld1_s16(p8r, src + %d + off);"
                     % (s, p, kg, 32 * (4 * p + 1)))
            L.append("    svint16_t b%sO%d_%d = svld1_s16(p8r, src + %d + off);"
                     % (s, p, kg, 32 * (4 * p + 3)))
            L.append("    svint16_t d%sO%d_%d = svzip1_s16(a%sO%d_%d, "
                     "b%sO%d_%d);"
                     % (s, p, kg, s, p, kg, s, p, kg))
            for k in range(kg, kg + k_block):
                L.append("    O%s%d = sdot_s32_h(O%s%d, d%sO%d_%d, "
                         "load_c(CDOT_O[%d][0], %d));"
                         % (s, k, s, k, s, p, kg, k, p))
    # EO: 4 row pairs (2,6),(10,14),(18,22),(26,30)
    for k in range(8):
        L.append("    svint32_t EO%s%d = z;" % (s, k))
    for p in range(4):
        L.append("    svint16_t a%sEO%d = svld1_s16(p8r, src + %d + off);"
                 % (s, p, 32 * (8 * p + 2)))
        L.append("    svint16_t b%sEO%d = svld1_s16(p8r, src + %d + off);"
                 % (s, p, 32 * (8 * p + 6)))
        L.append("    svint16_t d%sEO%d = svzip1_s16(a%sEO%d, b%sEO%d);"
                 % (s, p, s, p, s, p))
        for k in range(8):
            L.append("    EO%s%d = sdot_s32_h(EO%s%d, d%sEO%d, "
                     "load_c(CDOT_EO[%d][0], %d));"
                     % (s, k, s, k, s, p, k, p))
    # EEO: 2 row pairs (4,12),(20,28)
    for k in range(4):
        L.append("    svint32_t EEO%s%d = z;" % (s, k))
    for p in range(2):
        L.append("    svint16_t a%sEEO%d = svld1_s16(p8r, src + %d + off);"
                 % (s, p, 32 * (16 * p + 4)))
        L.append("    svint16_t b%sEEO%d = svld1_s16(p8r, src + %d + off);"
                 % (s, p, 32 * (16 * p + 12)))
        L.append("    svint16_t d%sEEO%d = svzip1_s16(a%sEEO%d, b%sEEO%d);"
                 % (s, p, s, p, s, p))
        for k in range(4):
            L.append("    EEO%s%d = sdot_s32_h(EEO%s%d, d%sEEO%d, "
                     "load_c(CDOT_EEO[%d][0], %d));"
                     % (s, k, s, k, s, p, k, p))
    # EEEO: rows 8,24 (k=0,1); EEEE: rows 0,16 (k=0,1)
    L.append("    svint16_t a%sEEEO = svld1_s16(p8r, src + %d + off);"
             % (s, 32 * 8))
    L.append("    svint16_t b%sEEEO = svld1_s16(p8r, src + %d + off);"
             % (s, 32 * 24))
    L.append("    svint16_t d%sEEEO = svzip1_s16(a%sEEEO, b%sEEEO);"
             % (s, s, s))
    for k in range(2):
        acc = "EEEO%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEEO, "
                 "load_c(CDOT_EEEO[%d][0], 0));" % (acc, s, k))
    L.append("    svint16_t a%sEEEE = svld1_s16(p8r, src + %d + off);"
             % (s, 32 * 0))
    L.append("    svint16_t b%sEEEE = svld1_s16(p8r, src + %d + off);"
             % (s, 32 * 16))
    L.append("    svint16_t d%sEEEE = svzip1_s16(a%sEEEE, b%sEEEE);"
             % (s, s, s))
    for k in range(2):
        acc = "EEEE%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEEE, "
                 "load_c(CDOT_EEEE[%d][0], 0));" % (acc, s, k))
    # Butterfly (identical to the mul version: same 8-lane column layout)
    for name, n in (("EEEE", 2), ("EEEO", 2)):
        pass
    for k in range(4):
        pass
    return L + _butterfly_s32(s)


def chunk_arithmetic_sdot_split(off, s):
    """sdot-s32 with accumulator splitting: O 8 链 -> 2x4 链、EO 4 链 ->
    2x2 链，各自求和后相加。链深减半（latency 32->16），fused +192
    （16+8 adds per chunk x4 chunks x2 stages）；由搜索/MCA 裁决是否
    值得（docs/27 §8.11，NP1 减半门需要继续压 cycle）。"""
    L = []
    L.append("    const svbool_t p16 = svptrue_b16();")
    L.append("    const svint32_t z = svdup_n_s32(0);")
    for m in range(32):
        L.append("    svint16_t r%s%d = svld1_s16(p16, src + %d + off);"
                 % (s, m, 32 * m))
    for p in range(8):
        L.append("    svint16_t d%sO%d = svzip1_s16(r%s%d, r%s%d);"
                 % (s, p, s, 4 * p + 1, s, 4 * p + 3))
    for k in range(16):
        acc = "O%s%d" % (s, k)
        L.append("    svint32_t %s_a = z;" % acc)
        for p in range(4):
            L.append("    %s_a = sdot_s32_h(%s_a, d%sO%d, "
                     "load_c(CDOT_O[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
        L.append("    svint32_t %s_b = z;" % acc)
        for p in range(4, 8):
            L.append("    %s_b = sdot_s32_h(%s_b, d%sO%d, "
                     "load_c(CDOT_O[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
        L.append("    svint32_t %s = svadd_s32_x(p32, %s_a, %s_b);"
                 % (acc, acc, acc))
    for p in range(4):
        L.append("    svint16_t d%sEO%d = svzip1_s16(r%s%d, r%s%d);"
                 % (s, p, s, 8 * p + 2, s, 8 * p + 6))
    for k in range(8):
        acc = "EO%s%d" % (s, k)
        L.append("    svint32_t %s_a = z;" % acc)
        for p in range(2):
            L.append("    %s_a = sdot_s32_h(%s_a, d%sEO%d, "
                     "load_c(CDOT_EO[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
        L.append("    svint32_t %s_b = z;" % acc)
        for p in range(2, 4):
            L.append("    %s_b = sdot_s32_h(%s_b, d%sEO%d, "
                     "load_c(CDOT_EO[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
        L.append("    svint32_t %s = svadd_s32_x(p32, %s_a, %s_b);"
                 % (acc, acc, acc))
    for p in range(2):
        L.append("    svint16_t d%sEEO%d = svzip1_s16(r%s%d, r%s%d);"
                 % (s, p, s, 16 * p + 4, s, 16 * p + 12))
    for k in range(4):
        acc = "EEO%s%d" % (s, k)
        L.append("    svint32_t %s = z;" % acc)
        for p in range(2):
            L.append("    %s = sdot_s32_h(%s, d%sEEO%d, "
                     "load_c(CDOT_EEO[%d][0], %d));"
                     % (acc, acc, s, p, k, p))
    L.append("    svint16_t d%sEEEO = svzip1_s16(r%s8, r%s24);" % (s, s, s))
    for k in range(2):
        acc = "EEEO%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEEO, "
                 "load_c(CDOT_EEEO[%d][0], 0));" % (acc, s, k))
    L.append("    svint16_t d%sEEEE = svzip1_s16(r%s0, r%s16);" % (s, s, s))
    for k in range(2):
        acc = "EEEE%s%d" % (s, k)
        L.append("    svint32_t %s = sdot_s32_h(z, d%sEEEE, "
                 "load_c(CDOT_EEEE[%d][0], 0));" % (acc, s, k))
    return L + _butterfly_s32(s)


def chunk_arithmetic_sdot_pair(off, s):
    """SVE2p1 sdot z.s,z.h,z.h over a chunk PAIR (16 columns), sharing the
    CDOT constant vectors across both chunks: 8 ld1h per k instead of 16
    (docs/27 §8.11 experiment; constant reuse halves load count at the cost
    of 2x accumulator liveness)."""
    L = []
    L.append("    const svbool_t p16 = svptrue_b16();")
    L.append("    const svint32_t z = svdup_n_s32(0);")
    for c in (0, 1):
        for m in range(32):
            L.append("    svint16_t r%s%d_%d = svld1_s16(p16, src + %d + off);"
                     % (s, m, c, 32 * m + 8 * c))
    # D vectors per chunk
    for c in (0, 1):
        for p in range(8):
            L.append("    svint16_t d%sO%d_%d = svzip1_s16(r%s%d_%d, r%s%d_%d);"
                     % (s, p, c, s, 4 * p + 1, c, s, 4 * p + 3, c))
        for p in range(4):
            L.append("    svint16_t d%sEO%d_%d = svzip1_s16(r%s%d_%d, r%s%d_%d);"
                     % (s, p, c, s, 8 * p + 2, c, s, 8 * p + 6, c))
        for p in range(2):
            L.append("    svint16_t d%sEEO%d_%d = "
                     "svzip1_s16(r%s%d_%d, r%s%d_%d);"
                     % (s, p, c, s, 16 * p + 4, c, s, 16 * p + 12, c))
        L.append("    svint16_t d%sEEEO_%d = svzip1_s16(r%s8_%d, r%s24_%d);"
                 % (s, c, s, c, s, c))
        L.append("    svint16_t d%sEEEE_%d = svzip1_s16(r%s0_%d, r%s16_%d);"
                 % (s, c, s, c, s, c))
    # O: 16 k, C loaded once per k, both chunks share it
    for k in range(16):
        for p in range(8):
            L.append("    svint16_t C%sO%d_%d = load_c(CDOT_O[%d][0], %d);"
                     % (s, k, p, k, p))
        for c in (0, 1):
            acc = "O%s%d" % ("_%d" % c, k)
            L.append("    svint32_t %s = z;" % acc)
            for p in range(8):
                L.append("    %s = sdot_s32_h(%s, d%sO%d_%d, C%sO%d_%d);"
                         % (acc, acc, s, p, c, s, k, p))
    # EO
    for k in range(8):
        for p in range(4):
            L.append("    svint16_t C%sEO%d_%d = load_c(CDOT_EO[%d][0], %d);"
                     % (s, k, p, k, p))
        for c in (0, 1):
            acc = "EO%s%d" % ("_%d" % c, k)
            L.append("    svint32_t %s = z;" % acc)
            for p in range(4):
                L.append("    %s = sdot_s32_h(%s, d%sEO%d_%d, C%sEO%d_%d);"
                         % (acc, acc, s, p, c, s, k, p))
    # EEO
    for k in range(4):
        for p in range(2):
            L.append("    svint16_t C%sEEO%d_%d = load_c(CDOT_EEO[%d][0], %d);"
                     % (s, k, p, k, p))
        for c in (0, 1):
            acc = "EEO%s%d" % ("_%d" % c, k)
            L.append("    svint32_t %s = z;" % acc)
            for p in range(2):
                L.append("    %s = sdot_s32_h(%s, d%sEEO%d_%d, C%sEEO%d_%d);"
                         % (acc, acc, s, p, c, s, k, p))
    # EEEO / EEEE (no reuse, only 2 k)
    for k in range(2):
        for c in (0, 1):
            L.append("    svint32_t EEEO%s%d = sdot_s32_h(z, d%sEEEO_%d, "
                     "load_c(CDOT_EEEO[%d][0], 0));"
                     % ("_%d" % c, k, s, c, k))
            L.append("    svint32_t EEEE%s%d = sdot_s32_h(z, d%sEEEE_%d, "
                     "load_c(CDOT_EEEE[%d][0], 0));"
                     % ("_%d" % c, k, s, c, k))
    L.extend(_butterfly_s32("_0"))
    L.extend(_butterfly_s32("_1"))
    return L


def _butterfly_s32(s):
    """Shared EE/EEE/E/t/u butterfly after O/EO/EEO/EEEE/EEEO are ready."""
    L = []
    L.append("    svint32_t EEE%s0 = svadd_s32_x(p32, EEEE%s0, EEEO%s0);"
             % (s, s, s))
    L.append("    svint32_t EEE%s3 = svsub_s32_x(p32, EEEE%s0, EEEO%s0);"
             % (s, s, s))
    L.append("    svint32_t EEE%s1 = svadd_s32_x(p32, EEEE%s1, EEEO%s1);"
             % (s, s, s))
    L.append("    svint32_t EEE%s2 = svsub_s32_x(p32, EEEE%s1, EEEO%s1);"
             % (s, s, s))
    for k in range(4):
        L.append("    svint32_t EE%s%d = svadd_s32_x(p32, EEE%s%d, EEO%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(4):
        L.append("    svint32_t EE%s%d = svsub_s32_x(p32, EEE%s%d, EEO%s%d);"
                 % (s, k + 4, s, 3 - k, s, 3 - k))
    for k in range(8):
        L.append("    svint32_t E%s%d = svadd_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(8):
        L.append("    svint32_t E%s%d = svsub_s32_x(p32, EE%s%d, EO%s%d);"
                 % (s, k + 8, s, 7 - k, s, 7 - k))
    for k in range(16):
        L.append("    svint32_t t%s%d = svadd_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, k, s, k))
    for k in range(16):
        L.append("    svint32_t u%s%d = svsub_s32_x(p32, E%s%d, O%s%d);"
                 % (s, k, s, 15 - k, s, 15 - k))
    return L


def chunk_store_scalar(L, pref="", off_expr="off"):
    L.append("    int16_t o%s[32][16];" % pref)
    for i in range(32):
        srcv = "t%s%d" % (pref, i) if i < 16 else "u%s%d" % (pref, i - 16)
        L.extend(_round_s16("out%s%d" % (pref, i), srcv))
        L.append("    svst1_s16(p8h, o%s[%d], out%s%d);" % (pref, i, pref, i))
    L.append("    for (int j = 0; j < 8; j++)")
    L.append("        for (int k = 0; k < 32; k++)")
    L.append("            dst[(%s + j) * stride + k] = o%s[k][j];"
             % (off_expr, pref))


def chunk_store_scatter(L, pref="", off_expr="off"):
    L.append("    const svbool_t p8s%s = svwhilelt_b32((uint32_t)0, "
             "(uint32_t)8);" % pref)
    L.append("    const svint32_t offs%s = svindex_s32(0, (int32_t)stride);"
             % pref)
    for i in range(32):
        srcv = "t%s%d" % (pref, i) if i < 16 else "u%s%d" % (pref, i - 16)
        L.extend(_round_s16("n%s%d" % (pref, i), srcv))
        L.append("    svint32_t d%s%d = svunpklo_s32(n%s%d);"
                 % (pref, i, pref, i))
        L.append("    svst1h_scatter_s32index_s32(p8s%s, "
                 "dst + (intptr_t)(%d + (%s) * stride), offs%s, d%s%d);"
                 % (pref, i, off_expr, pref, pref, i))


def chunk_store_zip32(L, pref, off_expr, fuse_round=False):
    """32 columns x 8 rows -> 8 rows x 32 columns register transpose +
    contiguous stores, same memory addresses as the scatter writeback
    (docs/27 §8.11 写回路径轴). Pattern found by optimizer/ir/
    permute_search.py: splice column pairs into 16-lane vectors, then
    uzp butterfly order (1,2,4).
    fuse_round (round-0017 zip-fuse 轴): 逐对窄化 n[2p]/n[2p+1] 后
    立即 splice 成 w[p]，n 立即死亡，降低中间活跃；n 变量由调用方
    提供（fuse 模式不再提前生成全部 n）。"""
    L.append("    const svbool_t p8z%s = svwhilelt_b16((uint32_t)0, "
             "(uint32_t)8);" % pref)
    for p in range(16):
        if fuse_round:
            for q in (2 * p, 2 * p + 1):
                srcv = ("t%s%d" % (pref, q) if q < 16
                        else "u%s%d" % (pref, q - 16))
                L.extend(_round_s16("n%s%d" % (pref, q), srcv))
        L.append("    svint16_t w%s%d = svsplice_s16(p8z%s, n%s%d, n%s%d);"
                 % (pref, p, pref, pref, 2 * p, pref, 2 * p + 1))
    cur = ["w%s%d" % (pref, i) for i in range(16)]
    for lev, d in enumerate((1, 2, 4)):
        nxt = list(cur)
        for i in range(16):
            j = i ^ d
            if i < j:
                nxt[i] = "z%s%d_%d" % (pref, lev, i)
                nxt[j] = "z%s%d_%d" % (pref, lev, j)
                L.append("    svint16_t %s = svuzp1_s16(%s, %s);"
                         % (nxt[i], cur[i], cur[j]))
                L.append("    svint16_t %s = svuzp2_s16(%s, %s);"
                         % (nxt[j], cur[i], cur[j]))
        cur = nxt
    for half in range(2):
        for r in range(8):
            # off 是行组下标：地址 = ((off + r) * stride) + 16*half。
            # 早期写成 (off + r*stride)，chunk1-3 会覆盖第 0-7 行的
            # 8-31 列（docs/27 §8.11 zip32 修复，2026-08-14）。
            L.append("    svst1_s16(p16, dst + (intptr_t)((%d + %d) * "
                     "stride) + %d, %s);"
                     % (off_expr, r, 16 * half, cur[r + 8 * half]))


def stage_src(store, compute, k_block=16, zip_fuse=False):
    if store == "zip32":
        L = []
        L.append("template <int SHIFT>")
        L.append("static inline __attribute__((always_inline)) void "
                 "idct32_stage(const int16_t* src, int16_t* dst, "
                 "intptr_t stride)")
        L.append("{")
        L.append("    const svbool_t p32 = svptrue_b32();")
        L.append("    const svbool_t p16 = svptrue_b16();")
        L.append("    const svbool_t p8h = svwhilelt_b16((uint32_t)0, "
                 "(uint32_t)8);")
        for off, s in ((0, "_0"), (8, "_1"), (16, "_2"), (24, "_3")):
            L.append("    {")
            L.append("        const int off = %d;" % off)
            if compute == "mul":
                L.extend(chunk_arithmetic(0, s))
            elif compute == "sdot-s32":
                L.extend(chunk_arithmetic_sdot(0, s, k_block))
            elif compute == "sdot-s32-split":
                L.extend(chunk_arithmetic_sdot_split(0, s))
            else:
                raise ValueError("unknown compute %r for zip32 store"
                                 % compute)
            if not zip_fuse:
                for i in range(32):
                    srcv = ("t%s%d" % (s, i) if i < 16
                            else "u%s%d" % (s, i - 16))
                    L.extend(_round_s16("n%s%d" % (s, i), srcv))
            chunk_store_zip32(L, s, off, fuse_round=zip_fuse)
            L.append("    }")
        L.append("}")
        return "\n".join(L)
    L = []
    L.append("template <int SHIFT>")
    L.append("static inline __attribute__((always_inline)) void "
             "idct32_chunk(const int16_t* src, int16_t* dst, "
             "intptr_t stride, int off)")
    L.append("{")
    L.append("    const svbool_t p32 = svptrue_b32();")
    L.append("    const svbool_t p8h = svwhilelt_b16((uint32_t)0, "
             "(uint32_t)8);")
    if compute == "mul":
        L.extend(chunk_arithmetic(0, ""))
    elif compute == "sdot-s32":
        L.extend(chunk_arithmetic_sdot(0, "", k_block))
    elif compute == "sdot-s32-split":
        L.extend(chunk_arithmetic_sdot_split(0, ""))
    elif compute == "sdot-s32-pair":
        L.extend(chunk_arithmetic_sdot_pair(0, ""))
        if store == "scalar":
            chunk_store_scalar(L, "_0", "off")
            chunk_store_scalar(L, "_1", "off + 8")
        elif store == "scatter":
            chunk_store_scatter(L, "_0", "off")
            chunk_store_scatter(L, "_1", "off + 8")
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
        L.append("    idct32_chunk<SHIFT>(src, dst, stride, 16);")
        L.append("}")
        return "\n".join(L)
    else:
        raise ValueError("unknown compute %r" % compute)
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


def emit(func_name="dynopt_idct32_sve2_shared", store="scatter",
         compute="mul", k_block=16, zip_fuse=False):
    consts = (cpp_sdot_constants()
              if compute in ("sdot-s32", "sdot-s32-split", "sdot-s32-pair")
              else cpp_constants())
    if compute in ("sdot-s32", "sdot-s32-split", "sdot-s32-pair"):
        helper = (
            "static inline __attribute__((always_inline)) svint32_t\n"
            "sdot_s32_h(svint32_t acc, svint16_t a, svint16_t b)\n"
            "{\n"
            "    asm volatile(\"sdot %0.s, %1.h, %2.h\"\n"
            "                 : \"+w\"(acc) : \"w\"(a), \"w\"(b));\n"
            "    return acc;\n"
            "}\n"
            "\n"
            "// volatile: prevents cross-chunk CSE of constant vectors,\n"
            "// which kept 8 C regs alive across chunks and caused ~1650\n"
            "// spill ld/str (docs/27 §8.11). One ld1h per sdot wins.\n"
            "// [base, #vnum, MUL VL] immediate addressing kills the\n"
            "// per-load adrp/add (was ~944 adrp + ~400 addvl, round-0017).\n"
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
    else:
        helper = ""
    return """\
// Generated by tools/emit_idct32_sve2_shared.py -- do not edit by hand.
// IDCT32 SVE2%s (VL=256), bit-exact with x265::idct32_c (docs/27 §8).
#include <arm_sve.h>

%s

%s

%s

extern "C" void %s(const int16_t* src, int16_t* dst, intptr_t dstStride)
{
    int16_t coef[32 * 32];
    idct32_stage<7>(src, coef, 32);
    idct32_stage<12>(coef, dst, dstStride);
}
    """ % ("/SVE2p1" if compute in ("sdot-s32", "sdot-s32-split",
                                   "sdot-s32-pair") else "",
           consts, helper, stage_src(store, compute, k_block, zip_fuse),
           func_name)


def main():
    import argparse
    ap = argparse.ArgumentParser()
    ap.add_argument("out", default="generated/idct32/sve2.cpp")
    ap.add_argument("--store", default="scatter",
                    choices=("scalar", "scatter", "zip32"))
    ap.add_argument("--compute", default="mul",
                    choices=("mul", "sdot-s32", "sdot-s32-split",
                             "sdot-s32-pair"))
    ap.add_argument("--k-block", type=int, default=16,
                    choices=(8, 16),
                    help="O 累加器 k_block（8=半块重走输入行，低峰值活跃）")
    ap.add_argument("--zip-fuse", action="store_true",
                    help="zip32 写回逐对 round+splice 融合（round-0017 "
                         "zip-fuse 轴）")
    args = ap.parse_args()
    with open(args.out, "w") as f:
        f.write(emit(store=args.store, compute=args.compute,
                     k_block=args.k_block, zip_fuse=args.zip_fuse))
    print("wrote %s" % args.out)


if __name__ == "__main__":
    main()
