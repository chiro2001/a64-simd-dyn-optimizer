"""Width-native SVE2 dct16 lowering (VL=256, single-group full-width).

Unlike dual_sve16.py which uses dual-group 16-lane layout (causing
187 tbl instructions and 48% permute-on-critical-path), this emitter
uses single-group full-width s16x16/s32x8 layout.

Based on reverse-engineering op895:
  - pass1 (op_pass_4): already pure SVE2, kept as-is
  - pass2 (op_pass_11): even-k section with configurable lowering
  - pass2 odd-k section: already pure SVE2, kept as-is

Search axes:
  even_k_mode: "width_native" (default) | "neon_bridge" (op895 original)
  reduce_mode: "addp" (default) | "uzp"
    - "addp": use addp_s32 (non-permute, 1 inst per level)
    - "uzp":  use uzp1+uzp2+add (3 insts, 2 permutes per level)
"""

from __future__ import annotations

GT16_S32 = [
    [89, 75, 50, 18],
    [75, -18, -89, -50],
    [50, -89, 18, 75],
    [18, -50, 75, -89],
]

T8E = [
    [64, 64, 64, 64],
    [83, 36, 83, 36],
    [64, -64, 64, -64],
    [36, -83, 36, -83],
]

C8 = [
    [64, 64, 64, 64, 64, 64, 64, 64],
    [90, 87, 80, 70, 57, 43, 25, 9],
    [89, 75, 50, 18, -18, -50, -75, -89],
    [87, 57, 9, -43, -80, -90, -70, -25],
    [83, 36, -36, -83, -83, -36, 36, 83],
    [80, 9, -70, -87, -25, 57, 90, 43],
    [75, -18, -89, -50, 50, 89, 18, -75],
    [70, -43, -87, 9, 90, 25, -80, -57],
    [64, -64, -64, 64, 64, -64, -64, 64],
    [57, -80, -25, 90, -9, -87, 43, 70],
    [50, -89, 18, 75, -75, -18, 89, -50],
    [43, -90, 57, 25, -87, 70, 9, -80],
    [36, -83, 83, -36, -36, 83, -83, 36],
    [25, -70, 90, -80, 43, 9, -57, 87],
    [18, -50, 75, -89, 89, -75, 50, -18],
    [9, -25, 43, -57, 70, -80, 87, -90],
]

CQ_LO = []
CQ_HI = []
for r in range(16):
    lo = []
    hi = []
    for blk in range(4):
        for i in range(4):
            lo.append(C8[r][i])
            hi.append(C8[r][4 + i])
    CQ_LO.append(lo)
    CQ_HI.append(hi)

HELPERS = r"""
static const uint8_t rev32_tbl[16] =
    { 12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3 };

static inline int32x4_t rev32(const int32x4_t a)
{
    return vreinterpretq_s32_s8(vqtbx1q_s8(
        vreinterpretq_s8_s32(a), vreinterpretq_s8_s32(a),
        vld1q_u8(rev32_tbl)));
}

static inline int64x2_t sdotq_s16(int64x2_t acc, int16x8_t x, int16x8_t y)
{
    return svget_neonq_s64(svdot_s64(
        svset_neonq_s64(svundef_s64(), acc),
        svset_neonq_s16(svundef_s16(), x),
        svset_neonq_s16(svundef_s16(), y)));
}

static inline svint16_t revh_d(svint16_t x)
{
    svint16_t r;
    asm volatile("revh %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t revw_d32(svint32_t x)
{
    svint32_t r;
    asm volatile("revw %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t addp_s32(svint32_t a, svint32_t b)
{
    svint32_t r = a;
    asm volatile("addp %[r].s, %[p]/m, %[r].s, %[b].s"
                 : [r] "+w" (r)
                 : [b] "w" (b), [p] "Upl" (svptrue_b32()));
    return r;
}
"""

SVE_HELPERS = r"""
static inline svint16_t revh_d(svint16_t x)
{
    svint16_t r;
    asm volatile("revh %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t revw_d32(svint32_t x)
{
    svint32_t r;
    asm volatile("revw %[r].d, %[p]/m, %[x].d"
                 : [r] "=w" (r)
                 : [x] "w" (x), [p] "Upl" (svptrue_b64()));
    return r;
}

static inline svint32_t addp_s32(svint32_t a, svint32_t b)
{
    svint32_t r = a;
    asm volatile("addp %[r].s, %[p]/m, %[r].s, %[b].s"
                 : [r] "+w" (r)
                 : [b] "w" (b), [p] "Upl" (svptrue_b32()));
    return r;
}
"""


def _emit_constants() -> str:
    lines = []
    lines.append("static const int32_t GT16_S32[4][4] = {")
    for row in GT16_S32:
        lines.append("    { %s }," % ", ".join(str(v) for v in row))
    lines.append("};")
    lines.append("")
    lines.append("static const int32_t T8E[4][4] = {")
    for row in T8E:
        lines.append("    { %s }," % ", ".join(str(v) for v in row))
    lines.append("};")
    lines.append("")
    lines.append("static const int16_t CQ_LO[16][16] = {")
    for row in CQ_LO:
        lines.append("    { %s }," % ", ".join(str(v) for v in row))
    lines.append("};")
    lines.append("static const int16_t CQ_HI[16][16] = {")
    for row in CQ_HI:
        lines.append("    { %s }," % ", ".join(str(v) for v in row))
    lines.append("};")
    return "\n".join(lines)


def emit_pass1() -> str:
    """Emit op_pass_4 — pure SVE2 pass1, from op895."""
    lines = []
    lines.append("static __attribute__((noinline)) void op_pass_4(")
    lines.append("    const int16_t* src, int16_t* dst, intptr_t stride)")
    lines.append("{")
    lines.append("    const svbool_t p16 = svptrue_b16();")
    lines.append("    const svbool_t p8 = svwhilelt_b16(0, 8);")
    lines.append("    const svint64_t zero64 = svdup_n_s64(0);")
    for b in range(4):
        base = b * 4
        lines.append("    // ---- batch %d (rows %d-%d) ----" % (b, base, base + 3))
        for i in range(4):
            r = base + i
            lines.append("    svint16_t z_%d = svld1_s16(p16, src + %d * stride);" % (r, r))
        for i in range(4):
            r = base + i
            lines.append("    svint64_t pa%d_%d = svreinterpret_s64_s16(z_%d);" % (i, b, r))
        lines.append("    svint64_t pt0_%d = svzip1_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt1_%d = svzip2_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt2_%d = svzip1_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pt3_%d = svzip2_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pp0_%d = svzip1_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint64_t pp1_%d = svzip2_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint64_t pp2_%d = svzip1_s64(pt1_%d, pt3_%d);" % (b, b, b))
        lines.append("    svint64_t pp3_%d = svzip2_s64(pt1_%d, pt3_%d);" % (b, b, b))
        lines.append("    svint16_t q0_%d = svreinterpret_s16_s64(pp0_%d);" % (b, b))
        lines.append("    svint16_t q1_%d = svreinterpret_s16_s64(pp1_%d);" % (b, b))
        lines.append("    svint16_t v2_%d = svreinterpret_s16_s64(pp2_%d);" % (b, b))
        lines.append("    svint16_t q2_%d = revh_d(v2_%d);" % (b, b))
        lines.append("    svint16_t v3_%d = svreinterpret_s16_s64(pp3_%d);" % (b, b))
        lines.append("    svint16_t q3_%d = revh_d(v3_%d);" % (b, b))
        lines.append("    svint16_t QO0_%d = svsub_s16_x(p16, q0_%d, q3_%d);" % (b, b, b))
        lines.append("    svint16_t QO1_%d = svsub_s16_x(p16, q1_%d, q2_%d);" % (b, b, b))
        lines.append("    svint16_t QE0_%d = svadd_s16_x(p16, q0_%d, q3_%d);" % (b, b, b))
        lines.append("    svint16_t QE1_%d = svadd_s16_x(p16, q1_%d, q2_%d);" % (b, b, b))
        lines.append("    svint16_t QR1_%d = revh_d(QE1_%d);" % (b, b))
        lines.append("    svint16_t EEF_%d = svadd_s16_x(p16, QE0_%d, QR1_%d);" % (b, b, b))
        lines.append("    svint16_t EOF_%d = svsub_s16_x(p16, QE0_%d, QR1_%d);" % (b, b, b))
    even_k_rows = [0, 4, 8, 12]
    for k_idx, k in enumerate(even_k_rows):
        coeff_arr = "CQ_LO"
        data_arr = "EEF"
        lines.append("    const svint16_t ck_clo_%d = svld1_s16(p16, %s[%d]);" % (k, coeff_arr, k))
        for b in range(4):
            lines.append("    svint64_t d_%d_%d = svdot_s64(zero64, %s_%d, ck_clo_%d);"
                         % (k, b, data_arr, b, k))
        lines.append("    {")
        lines.append("        const svint32_t w0 = svuzp1_s32("
                     "svreinterpret_s32_s64(d_%d_0), svreinterpret_s32_s64(d_%d_1));" % (k, k))
        lines.append("        const svint32_t w1 = svuzp1_s32("
                     "svreinterpret_s32_s64(d_%d_2), svreinterpret_s32_s64(d_%d_3));" % (k, k))
        lines.append("        svint16_t nn0 = svrshrnb_n_s32(w0, 3);")
        lines.append("        nn0 = svuzp1_s16(nn0, nn0);")
        lines.append("        svst1_s16(p8, dst + 16 * %d + 0, nn0);" % k)
        lines.append("        svint16_t nn1 = svrshrnb_n_s32(w1, 3);")
        lines.append("        nn1 = svuzp1_s16(nn1, nn1);")
        lines.append("        svst1_s16(p8, dst + 16 * %d + 8, nn1);" % k)
        lines.append("    }")
    odd_k_rows = [2, 6, 10, 14]
    for k in odd_k_rows:
        lines.append("    const svint16_t ck_clo_%d = svld1_s16(p16, CQ_LO[%d]);" % (k, k))
        for b in range(4):
            lines.append("    svint64_t d_%d_%d = svdot_s64(zero64, EOF_%d, ck_clo_%d);"
                         % (k, b, b, k))
        lines.append("    {")
        lines.append("        const svint32_t w0 = svuzp1_s32("
                     "svreinterpret_s32_s64(d_%d_0), svreinterpret_s32_s64(d_%d_1));" % (k, k))
        lines.append("        const svint32_t w1 = svuzp1_s32("
                     "svreinterpret_s32_s64(d_%d_2), svreinterpret_s32_s64(d_%d_3));" % (k, k))
        lines.append("        svint16_t nn0 = svrshrnb_n_s32(w0, 3);")
        lines.append("        nn0 = svuzp1_s16(nn0, nn0);")
        lines.append("        svst1_s16(p8, dst + 16 * %d + 0, nn0);" % k)
        lines.append("        svint16_t nn1 = svrshrnb_n_s32(w1, 3);")
        lines.append("        nn1 = svuzp1_s16(nn1, nn1);")
        lines.append("        svst1_s16(p8, dst + 16 * %d + 8, nn1);" % k)
        lines.append("    }")
    odd_k_rows2 = [1, 3, 5, 7, 9, 11, 13, 15]
    for k in odd_k_rows2:
        lines.append("    const svint16_t c_clo_%d = svld1_s16(p16, CQ_LO[%d]);" % (k, k))
        lines.append("    const svint16_t c_chi_%d = svld1_s16(p16, CQ_HI[%d]);" % (k, k))
        for b in range(4):
            lines.append("    svint64_t d0_%d_%d = svdot_s64(zero64, QO0_%d, c_clo_%d);"
                         % (k, b, b, k))
            lines.append("    svint64_t d1_%d_%d = svdot_s64(d0_%d_%d, QO1_%d, c_chi_%d);"
                         % (k, b, k, b, b, k))
        lines.append("    {")
        lines.append("        const svint32_t w01 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_0), svreinterpret_s32_s64(d1_%d_1));" % (k, k))
        lines.append("        const svint32_t w23 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_2), svreinterpret_s32_s64(d1_%d_3));" % (k, k))
        lines.append("        const svint16_t nb = svrshrnb_n_s32(w01, 3);")
        lines.append("        const svint16_t nt = svrshrnb_n_s32(w23, 3);")
        lines.append("        svint16_t nn = svuzp1_s16(nb, nt);")
        lines.append("        svst1_s16(p16, dst + 16 * %d + 0, nn);" % k)
        lines.append("    }")
    lines.append("}")
    return "\n".join(lines)


def emit_pass2_pure_sve2() -> str:
    """Emit op_pass_11 — pure SVE2 pass2 with validated cross-row butterfly.

    Uses svrev_s32 + svzip1_s64 + svext_s32 + revw_d32 for the butterfly,
    matching op895's NEON vzip1q/vzip2q/vrev64q pattern but with ZERO NEON.
    Reduction uses addp_s32 (SVE2 non-permute) + rshrnb + uzp1 for store.
    """
    lines = []
    lines.append("static __attribute__((noinline)) void op_pass_11(")
    lines.append("    const int16_t* src, int16_t* dst)")
    lines.append("{")
    lines.append("    const int line = 16;")
    lines.append("    const svbool_t p16 = svptrue_b16();")
    lines.append("    const svbool_t p8s = svptrue_b32();")
    lines.append("    const svbool_t pg4s = svwhilelt_b32(0, 4);")
    lines.append("    const svbool_t pg4h = svwhilelt_b16(0, 4);")
    lines.append("    const svint64_t zero64 = svdup_n_s64(0);")
    lines.append("    static const uint32_t swap_idx[8] = {0, 2, 1, 3, 4, 6, 5, 7};")
    lines.append("    svuint32_t swp = svld1_u32(p8s, swap_idx);")
    lines.append("")

    for b in range(4):
        base = b * 4
        lines.append("    // ---- batch %d (rows %d-%d) ----" % (b, base, base + 3))
        for i in range(4):
            r = base + i
            lines.append("    svint16_t z_%d = svld1_s16(p16, src + %d * line);" % (r, r))
            lines.append("    svint16_t r_%d = svrev_s16(z_%d);" % (r, r))
        for i in range(4):
            r = base + i
            lines.append("    svint32_t E_%d = svadd_s32_x(p8s, "
                         "svunpklo_s32(z_%d), svunpklo_s32(r_%d));" % (r, r, r))
            lines.append("    svint32_t rev_E_%d = svrev_s32(E_%d);" % (r, r))
            lines.append("    svint32_t EE_%d = svadd_s32_x(p8s, E_%d, rev_E_%d);"
                         % (r, r, r))
            lines.append("    svint32_t EO_%d = svsub_s32_x(p8s, E_%d, rev_E_%d);"
                         % (r, r, r))
            lines.append("    svint16_t zO_%d = svsub_s16_x(p16, z_%d, r_%d);"
                         % (r, r, r))
        for pair in range(2):
            r0 = base + pair * 2
            r1 = base + pair * 2 + 1
            eee_idx = b * 2 + pair
            lines.append("    // cross-row butterfly pair %d (rows %d,%d)" % (pair, r0, r1))
            lines.append("    svint64_t ee0_%d = svreinterpret_s64_s32(EE_%d);" % (eee_idx, r0))
            lines.append("    svint64_t ee1_%d = svreinterpret_s64_s32(EE_%d);" % (eee_idx, r1))
            lines.append("    svint64_t zip_%d = svzip1_s64(ee0_%d, ee1_%d);"
                         % (eee_idx, eee_idx, eee_idx))
            lines.append("    svint32_t zip_s_%d = svreinterpret_s32_s64(zip_%d);"
                         % (eee_idx, eee_idx))
            lines.append("    svint32_t shift_%d = svext_s32(zip_s_%d, zip_s_%d, 4);"
                         % (eee_idx, eee_idx, eee_idx))
            lines.append("    svint32_t t1_%d = revw_d32(shift_%d);" % (eee_idx, eee_idx))
            lines.append("    svint32_t EEE_%d = svadd_s32_x(pg4s, zip_s_%d, t1_%d);"
                         % (eee_idx, eee_idx, eee_idx))
            lines.append("    svint32_t EEO_%d = svsub_s32_x(pg4s, zip_s_%d, t1_%d);"
                         % (eee_idx, eee_idx, eee_idx))
        lines.append("")

    for b in range(4):
        base = b * 4
        lines.append("    // ---- QO pack batch %d ----" % b)
        lines.append("    svint64_t pa0_%d = svreinterpret_s64_s16(zO_%d);" % (b, base))
        lines.append("    svint64_t pa1_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 1))
        lines.append("    svint64_t pa2_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 2))
        lines.append("    svint64_t pa3_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 3))
        lines.append("    svint64_t pt0_%d = svzip1_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt1_%d = svzip2_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt2_%d = svzip1_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pt3_%d = svzip2_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pp0_%d = svzip1_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint64_t pp1_%d = svzip2_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint16_t QO0_%d = svreinterpret_s16_s64(pp0_%d);" % (b, b))
        lines.append("    svint16_t QO1_%d = svreinterpret_s16_s64(pp1_%d);" % (b, b))
        lines.append("")

    k_eee = [(0, 0), (8, 2)]
    k_eeo = [(4, 1), (12, 3)]
    k_eo = [(2, 0), (6, 1), (10, 2), (14, 3)]

    for k, t8e_idx in k_eee + k_eeo:
        data_name = "EEE" if (k, t8e_idx) in k_eee else "EEO"
        t8e = T8E[t8e_idx]
        uniform_c = (len(set(t8e)) == 1)
        lines.append("    // k=%d: %s * T8E[%d]%s" % (
            k, data_name, t8e_idx,
            " (uniform c)" if uniform_c else " (non-uniform c)"))
        lines.append("    svint32_t c_%d = svld1_s32(pg4s, T8E[%d]);" % (k, t8e_idx))
        lines.append("    svint32_t c_bcast_%d = svsplice_s32(p8s, c_%d, c_%d);"
                     % (k, k, k))
        for b in range(4):
            eee_lo = b * 2
            eee_hi = b * 2 + 1
            if uniform_c:
                lines.append("    svint32_t pp_%d_%d = addp_s32(%s_%d, %s_%d);"
                             % (k, b, data_name, eee_lo, data_name, eee_hi))
                lines.append("    pp_%d_%d = svreinterpret_s32_u32("
                             "svtbl_u32(svreinterpret_u32_s32(pp_%d_%d), swp));"
                             % (k, b, k, b))
                lines.append("    svint32_t m_%d_%d = svmul_s32_x(p8s, c_bcast_%d, pp_%d_%d);"
                             % (k, b, k, k, b))
            else:
                lines.append("    svint32_t m_lo_%d_%d = svmul_s32_x(p8s, "
                             "c_bcast_%d, %s_%d);" % (k, b, k, data_name, eee_lo))
                lines.append("    svint32_t m_hi_%d_%d = svmul_s32_x(p8s, "
                             "c_bcast_%d, %s_%d);" % (k, b, k, data_name, eee_hi))
                lines.append("    svint32_t m_%d_%d = addp_s32(m_lo_%d_%d, m_hi_%d_%d);"
                             % (k, b, k, b, k, b))
                lines.append("    m_%d_%d = svreinterpret_s32_u32("
                             "svtbl_u32(svreinterpret_u32_s32(m_%d_%d), swp));"
                             % (k, b, k, b))
            lines.append("    svint16_t nn_%d_%d = svrshrnb_n_s32(m_%d_%d, 10);"
                         % (k, b, k, b))
            lines.append("    nn_%d_%d = svuzp1_s16(nn_%d_%d, nn_%d_%d);"
                         % (k, b, k, b, k, b))
            lines.append("    svst1_s16(pg4h, dst + 16 * %d + %d, nn_%d_%d);"
                         % (k, b * 4, k, b))
        lines.append("")

    for k, gt_idx in k_eo:
        lines.append("    // k=%d: EO * GT16_S32[%d]" % (k, gt_idx))
        lines.append("    svint32_t c_%d = svld1_s32(pg4s, GT16_S32[%d]);" % (k, gt_idx))
        lines.append("    svint32_t c_bcast_%d = svsplice_s32(p8s, c_%d, c_%d);"
                     % (k, k, k))
        for b in range(4):
            base = b * 4
            for j in range(4):
                r = base + j
                lines.append("    svint32_t m_%d_%d_%d = svmul_s32_x(p8s, "
                             "c_bcast_%d, EO_%d);" % (k, b, j, k, r))
            lines.append("    svint32_t l1_%d_%d = addp_s32(m_%d_%d_0, m_%d_%d_1);"
                         % (k, b, k, b, k, b))
            lines.append("    l1_%d_%d = svreinterpret_s32_u32("
                         "svtbl_u32(svreinterpret_u32_s32(l1_%d_%d), swp));"
                         % (k, b, k, b))
            lines.append("    svint32_t l2_%d_%d = addp_s32(m_%d_%d_2, m_%d_%d_3);"
                         % (k, b, k, b, k, b))
            lines.append("    l2_%d_%d = svreinterpret_s32_u32("
                         "svtbl_u32(svreinterpret_u32_s32(l2_%d_%d), swp));"
                         % (k, b, k, b))
            lines.append("    svint32_t pp_%d_%d = addp_s32(l1_%d_%d, l2_%d_%d);"
                         % (k, b, k, b, k, b))
            lines.append("    pp_%d_%d = svreinterpret_s32_u32("
                         "svtbl_u32(svreinterpret_u32_s32(pp_%d_%d), swp));"
                         % (k, b, k, b))
            lines.append("    svint16_t nn_%d_%d = svrshrnb_n_s32(pp_%d_%d, 10);"
                         % (k, b, k, b))
            lines.append("    nn_%d_%d = svuzp1_s16(nn_%d_%d, nn_%d_%d);"
                         % (k, b, k, b, k, b))
            lines.append("    svst1_s16(pg4h, dst + 16 * %d + %d, nn_%d_%d);"
                         % (k, b * 4, k, b))
        lines.append("")

    odd_k = [1, 3, 5, 7, 9, 11, 13, 15]
    for k in odd_k:
        lines.append("    // k=%d: odd-k (QO0/QO1 svdot, from op895)" % k)
        lines.append("    const svint16_t c_clo_%d = svld1_s16(p16, CQ_LO[%d]);" % (k, k))
        lines.append("    const svint16_t c_chi_%d = svld1_s16(p16, CQ_HI[%d]);" % (k, k))
        for b in range(4):
            lines.append("    svint64_t d0_%d_%d = svdot_s64(zero64, QO0_%d, c_clo_%d);"
                         % (k, b, b, k))
            lines.append("    svint64_t d1_%d_%d = svdot_s64(d0_%d_%d, QO1_%d, c_chi_%d);"
                         % (k, b, k, b, b, k))
        lines.append("    {")
        lines.append("        const svint32_t w01 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_0), svreinterpret_s32_s64(d1_%d_1));"
                     % (k, k))
        lines.append("        const svint32_t w23 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_2), svreinterpret_s32_s64(d1_%d_3));"
                     % (k, k))
        lines.append("        const svint16_t nb = svrshrnb_n_s32(w01, 10);")
        lines.append("        const svint16_t nt = svrshrnb_n_s32(w23, 10);")
        lines.append("        svint16_t nn = svuzp1_s16(nb, nt);")
        lines.append("        svst1_s16(p16, dst + 16 * %d + 0, nn);" % k)
        lines.append("    }")
        lines.append("")

    lines.append("}")
    return "\n".join(lines)


def emit_pass2_fused() -> str:
    """Emit op_pass_11 — NEON-bridged pass2 with fused k-batch loop.

    Instead of computing all 32 butterfly results (EEE_0..7, EEO_0..7,
    EO_0..15) simultaneously (causing 27 spills), this variant processes
    each batch's butterfly results immediately across all even k values,
    keeping only QO0_0..3/QO1_0..3 alive for the odd-k section.
    """
    lines = []
    lines.append("static __attribute__((noinline)) void op_pass_11(")
    lines.append("    const int16_t* src, int16_t* dst)")
    lines.append("{")
    lines.append("    const int line = 16;")
    lines.append("    const svbool_t p16 = svptrue_b16();")
    lines.append("    const svint64_t zero64 = svdup_n_s64(0);")
    lines.append("    svint16_t QO0_0, QO0_1, QO0_2, QO0_3;")
    lines.append("    svint16_t QO1_0, QO1_1, QO1_2, QO1_3;")
    lines.append("")

    for b in range(4):
        base = b * 4
        lines.append("    // ---- batch %d (rows %d-%d) ----" % (b, base, base + 3))
        lines.append("    {")
        for i in range(4):
            r = base + i
            lines.append("        svint16_t z_%d = svld1_s16(p16, src + %d * line);" % (r, r))
            lines.append("        svint16_t r_%d = svrev_s16(z_%d);" % (r, r))
            lines.append("        svint16_t zO_%d = svsub_s16_x(p16, z_%d, r_%d);" % (r, r, r))
            lines.append("        int16x8_t nlo_%d = svget_neonq_s16(z_%d);" % (r, r))
            lines.append("        int16x8_t nhi_%d = svget_neonq_s16(r_%d);" % (r, r))
            lines.append("        int16x4_t g0_%d_a = vget_low_s16(nlo_%d);" % (r, r))
            lines.append("        int16x4_t g0_%d_c = vget_low_s16(nhi_%d);" % (r, r))
            lines.append("        int32x4_t E0_%d = vaddl_s16(g0_%d_a, g0_%d_c);" % (r, r, r))
            lines.append("        int16x4_t g1_%d_a = vget_high_s16(nlo_%d);" % (r, r))
            lines.append("        int16x4_t g1_%d_c = vget_high_s16(nhi_%d);" % (r, r))
            lines.append("        int32x4_t E1_%d = vaddl_s16(g1_%d_a, g1_%d_c);" % (r, r, r))
            lines.append("        int32x4_t EEr_%d = rev32(E1_%d);" % (r, r))
            lines.append("        int32x4_t EE_%d = vaddq_s32(E0_%d, EEr_%d);" % (r, r, r))
            lines.append("        int32x4_t EO_%d = vsubq_s32(E0_%d, EEr_%d);" % (r, r, r))

        for pair in range(2):
            r0 = base + pair * 2
            r1 = base + pair * 2 + 1
            lines.append("        int32x4_t t0_%d = vreinterpretq_s32_s64("
                         "vzip1q_s64(vreinterpretq_s64_s32(EE_%d), "
                         "vreinterpretq_s64_s32(EE_%d)));" % (pair, r0, r1))
            lines.append("        int32x4_t z2_%d = vreinterpretq_s32_s64("
                         "vzip2q_s64(vreinterpretq_s64_s32(EE_%d), "
                         "vreinterpretq_s64_s32(EE_%d)));" % (pair, r0, r1))
            lines.append("        int32x4_t t1_%d = vrev64q_s32(z2_%d);" % (pair, pair))
            lines.append("        int32x4_t EEE_%d = vaddq_s32(t0_%d, t1_%d);"
                         % (pair, pair, pair))
            lines.append("        int32x4_t EEO_%d = vsubq_s32(t0_%d, t1_%d);"
                         % (pair, pair, pair))

        lines.append("        { // k=0 (EEE, uniform T8E[0])")
        lines.append("            int32x4_t pp = vpaddq_s32(EEE_0, EEE_1);")
        lines.append("            int32x4_t m = vmulq_s32(vld1q_s32(T8E[0]), pp);")
        lines.append("            int16x4_t nn = vrshrn_n_s32(m, 10);")
        lines.append("            vst1_s16(dst + 16 * 0 + %d, nn);" % (b * 4))
        lines.append("        }")
        lines.append("        { // k=8 (EEE, non-uniform T8E[2])")
        lines.append("            int32x4_t m0 = vmulq_s32(vld1q_s32(T8E[2]), EEE_0);")
        lines.append("            int32x4_t m1 = vmulq_s32(vld1q_s32(T8E[2]), EEE_1);")
        lines.append("            int32x4_t m = vpaddq_s32(m0, m1);")
        lines.append("            int16x4_t nn = vrshrn_n_s32(m, 10);")
        lines.append("            vst1_s16(dst + 16 * 8 + %d, nn);" % (b * 4))
        lines.append("        }")
        lines.append("        { // k=4 (EEO, non-uniform T8E[1])")
        lines.append("            int32x4_t m0 = vmulq_s32(vld1q_s32(T8E[1]), EEO_0);")
        lines.append("            int32x4_t m1 = vmulq_s32(vld1q_s32(T8E[1]), EEO_1);")
        lines.append("            int32x4_t m = vpaddq_s32(m0, m1);")
        lines.append("            int16x4_t nn = vrshrn_n_s32(m, 10);")
        lines.append("            vst1_s16(dst + 16 * 4 + %d, nn);" % (b * 4))
        lines.append("        }")
        lines.append("        { // k=12 (EEO, non-uniform T8E[3])")
        lines.append("            int32x4_t m0 = vmulq_s32(vld1q_s32(T8E[3]), EEO_0);")
        lines.append("            int32x4_t m1 = vmulq_s32(vld1q_s32(T8E[3]), EEO_1);")
        lines.append("            int32x4_t m = vpaddq_s32(m0, m1);")
        lines.append("            int16x4_t nn = vrshrn_n_s32(m, 10);")
        lines.append("            vst1_s16(dst + 16 * 12 + %d, nn);" % (b * 4))
        lines.append("        }")

        for k_idx, k in enumerate([2, 6, 10, 14]):
            lines.append("        { // k=%d (EO * GT16_S32[%d])" % (k, k_idx))
            lines.append("            int32x4_t c = vld1q_s32(GT16_S32[%d]);" % k_idx)
            lines.append("            int32x4_t m0 = vmulq_s32(c, EO_%d);" % base)
            lines.append("            int32x4_t m1 = vmulq_s32(c, EO_%d);" % (base + 1))
            lines.append("            int32x4_t m2 = vmulq_s32(c, EO_%d);" % (base + 2))
            lines.append("            int32x4_t m3 = vmulq_s32(c, EO_%d);" % (base + 3))
            lines.append("            int32x4_t t01 = vpaddq_s32(m0, m1);")
            lines.append("            int32x4_t t23 = vpaddq_s32(m2, m3);")
            lines.append("            int32x4_t t = vpaddq_s32(t01, t23);")
            lines.append("            int16x4_t nn = vrshrn_n_s32(t, 10);")
            lines.append("            vst1_s16(dst + 16 * %d + %d, nn);" % (k, b * 4))
            lines.append("        }")

        lines.append("        // QO pack (persist for odd-k)")
        lines.append("        svint64_t pa0 = svreinterpret_s64_s16(zO_%d);" % base)
        lines.append("        svint64_t pa1 = svreinterpret_s64_s16(zO_%d);" % (base + 1))
        lines.append("        svint64_t pa2 = svreinterpret_s64_s16(zO_%d);" % (base + 2))
        lines.append("        svint64_t pa3 = svreinterpret_s64_s16(zO_%d);" % (base + 3))
        lines.append("        svint64_t pt0 = svzip1_s64(pa0, pa2);")
        lines.append("        svint64_t pt1 = svzip2_s64(pa0, pa2);")
        lines.append("        svint64_t pt2 = svzip1_s64(pa1, pa3);")
        lines.append("        svint64_t pt3 = svzip2_s64(pa1, pa3);")
        lines.append("        svint64_t pp0 = svzip1_s64(pt0, pt2);")
        lines.append("        svint64_t pp1 = svzip2_s64(pt0, pt2);")
        lines.append("        QO0_%d = svreinterpret_s16_s64(pp0);" % b)
        lines.append("        QO1_%d = svreinterpret_s16_s64(pp1);" % b)
        lines.append("    } // end batch %d" % b)
        lines.append("")

    lines.append("    // ---- odd-k (svdot, all 4 batches per k) ----")
    odd_k = [1, 3, 5, 7, 9, 11, 13, 15]
    for k in odd_k:
        lines.append("    { // k=%d" % k)
        lines.append("        const svint16_t c_clo = svld1_s16(p16, CQ_LO[%d]);" % k)
        lines.append("        const svint16_t c_chi = svld1_s16(p16, CQ_HI[%d]);" % k)
        for b in range(4):
            lines.append("        svint64_t d0_%d = svdot_s64(zero64, QO0_%d, c_clo);"
                         % (b, b))
            lines.append("        svint64_t d1_%d = svdot_s64(d0_%d, QO1_%d, c_chi);"
                         % (b, b, b))
        lines.append("        const svint32_t w01 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_0), svreinterpret_s32_s64(d1_1));")
        lines.append("        const svint32_t w23 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_2), svreinterpret_s32_s64(d1_3));")
        lines.append("        const svint16_t nb = svrshrnb_n_s32(w01, 10);")
        lines.append("        const svint16_t nt = svrshrnb_n_s32(w23, 10);")
        lines.append("        svint16_t nn = svuzp1_s16(nb, nt);")
        lines.append("        svst1_s16(p16, dst + 16 * %d, nn);" % k)
        lines.append("    }")
        lines.append("")

    lines.append("}")
    return "\n".join(lines)


def emit_pass2(even_k_mode: str = "addp") -> str:
    """Emit op_pass_11 — pass2 with configurable even-k lowering.

    even_k_mode:
      "pure_sve2":        pure SVE2 cross-row butterfly (validated, zero NEON)
      "addp":             width-native SVE2 with addp_s32 reduction (non-permute)
      "uzp":              width-native SVE2 with uzp1+uzp2+add reduction
      "neon_bridge":      op895 original (NEON-bridged even-k)
      "neon_bridge_fused": NEON-bridged with fused k-batch loop (reduced spills)
    Odd-k is always pure SVE2 (from op895 svdot).
    """
    if even_k_mode == "pure_sve2":
        return emit_pass2_pure_sve2()
    if even_k_mode == "neon_bridge_fused":
        return emit_pass2_fused()
    use_addp = (even_k_mode == "addp")
    use_neon = (even_k_mode == "neon_bridge")

    lines = []
    lines.append("static __attribute__((noinline)) void op_pass_11(")
    lines.append("    const int16_t* src, int16_t* dst)")
    lines.append("{")
    lines.append("    const int line = 16;")
    lines.append("    const svbool_t p16 = svptrue_b16();")
    lines.append("    const svbool_t p8s = svptrue_b32();")
    lines.append("    const svbool_t pg4s = svwhilelt_b32(0, 4);")
    lines.append("    const svbool_t pg4h = svwhilelt_b16(0, 4);")
    lines.append("    const svint64_t zero64 = svdup_n_s64(0);")

    if use_neon:
        lines.append("    const uint8_t rev32_tbl[16] = {12,13,14,15,8,9,10,11,4,5,6,7,0,1,2,3};")
        lines.append("    (void)rev32_tbl;")
    else:
        lines.append("    static const uint32_t idx_rev4[8] = {3, 2, 1, 0, 7, 6, 5, 4};")
        lines.append("    svuint32_t rev_idx = svld1_u32(p8s, idx_rev4);")
        if not use_addp:
            lines.append("    static const uint32_t idx_pp[8] = {0, 4, 2, 6, 0, 0, 0, 0};")
            lines.append("    svuint32_t pp_idx = svld1_u32(p8s, idx_pp);")
            lines.append("    static const uint32_t idx_k2[8] = {0, 2, 1, 3, 0, 0, 0, 0};")
            lines.append("    svuint32_t k2_idx = svld1_u32(p8s, idx_k2);")
        else:
            lines.append("    static const uint32_t idx_pp[8] = {0, 4, 2, 6, 0, 0, 0, 0};")
            lines.append("    svuint32_t pp_idx = svld1_u32(p8s, idx_pp);")
            lines.append("    static const uint32_t idx_k2[8] = {0, 2, 1, 3, 0, 0, 0, 0};")
            lines.append("    svuint32_t k2_idx = svld1_u32(p8s, idx_k2);")
    lines.append("")

    for b in range(4):
        base = b * 4
        lines.append("    // ---- batch %d (rows %d-%d) ----" % (b, base, base + 3))
        for i in range(4):
            r = base + i
            lines.append("    svint16_t z_%d = svld1_s16(p16, src + %d * line);" % (r, r))
            lines.append("    svint16_t r_%d = svrev_s16(z_%d);" % (r, r))
            lines.append("    svint16_t zO_%d = svsub_s16_x(p16, z_%d, r_%d);" % (r, r, r))
        if use_neon:
            for i in range(4):
                r = base + i
                lines.append("    int16x8_t nlo_%d = svget_neonq_s16(z_%d);" % (r, r))
                lines.append("    int16x8_t nhi_%d = svget_neonq_s16(r_%d);" % (r, r))
                lines.append("    int16x4_t g0_%d_a = vget_low_s16(nlo_%d);" % (r, r))
                lines.append("    int16x4_t g0_%d_c = vget_low_s16(nhi_%d);" % (r, r))
                lines.append("    int32x4_t E0_%d = vaddl_s16(g0_%d_a, g0_%d_c);" % (r, r, r))
                lines.append("    int16x4_t g1_%d_a = vget_high_s16(nlo_%d);" % (r, r))
                lines.append("    int16x4_t g1_%d_c = vget_high_s16(nhi_%d);" % (r, r))
                lines.append("    int32x4_t E1_%d = vaddl_s16(g1_%d_a, g1_%d_c);" % (r, r, r))
                lines.append("    int32x4_t Er_%d = rev32(E1_%d);" % (r, r))
                lines.append("    int32x4_t EO_%d = vsubq_s32(E0_%d, Er_%d);" % (r, r, r))
        else:
            for i in range(4):
                r = base + i
                lines.append("    svint32_t E_%d = svadd_s32_x(p8s, "
                             "svunpklo_s32(z_%d), svunpklo_s32(r_%d));"
                             % (r, r, r))
            for i in range(4):
                r = base + i
                lines.append("    svint32_t rev_%d = svreinterpret_s32_u32("
                             "svtbl_u32(svreinterpret_u32_s32(E_%d), rev_idx));" % (r, r))
                lines.append("    svint32_t ext_%d = svext_s32(rev_%d, rev_%d, 4);"
                             % (r, r, r))
                lines.append("    svint32_t EE_%d = svadd_s32_x(p8s, E_%d, ext_%d);"
                             % (r, r, r))
                lines.append("    svint32_t EO_%d = svsub_s32_x(p8s, E_%d, ext_%d);"
                             % (r, r, r))
        if use_neon:
            for pair in range(2):
                r0 = base + pair * 2
                r1 = base + pair * 2 + 1
                eee_idx = b * 2 + pair
                lines.append("    int32x4_t EEr_%d = rev32(E1_%d);" % (r0, r0))
                lines.append("    int32x4_t EE_%d = vaddq_s32(E0_%d, EEr_%d);" % (r0, r0, r0))
                lines.append("    int32x4_t EEr_%d = rev32(E1_%d);" % (r1, r1))
                lines.append("    int32x4_t EE_%d = vaddq_s32(E0_%d, EEr_%d);" % (r1, r1, r1))
                lines.append("    int32x4_t t0_%d = vreinterpretq_s32_s64("
                             "vzip1q_s64(vreinterpretq_s64_s32(EE_%d), "
                             "vreinterpretq_s64_s32(EE_%d)));" % (eee_idx, r0, r1))
                lines.append("    int32x4_t z2_%d = vreinterpretq_s32_s64("
                             "vzip2q_s64(vreinterpretq_s64_s32(EE_%d), "
                             "vreinterpretq_s64_s32(EE_%d)));" % (eee_idx, r0, r1))
                lines.append("    int32x4_t t1_%d = vrev64q_s32(z2_%d);" % (eee_idx, eee_idx))
                lines.append("    int32x4_t EEE_%d = vaddq_s32(t0_%d, t1_%d);"
                             % (eee_idx, eee_idx, eee_idx))
                lines.append("    int32x4_t EEO_%d = vsubq_s32(t0_%d, t1_%d);"
                             % (eee_idx, eee_idx, eee_idx))
        else:
            lines.append("    svint32_t EE_pack_lo_%d = svsplice_s32(pg4s, EE_%d, EE_%d);"
                         % (b, base, base + 1))
            lines.append("    svint32_t EE_pack_hi_%d = svsplice_s32(pg4s, EE_%d, EE_%d);"
                         % (b, base + 2, base + 3))
            lines.append("    svint32_t EE_rev_lo_%d = svreinterpret_s32_u32("
                         "svtbl_u32(svreinterpret_u32_s32(EE_pack_lo_%d), rev_idx));" % (b, b))
            lines.append("    svint32_t EE_rev_hi_%d = svreinterpret_s32_u32("
                         "svtbl_u32(svreinterpret_u32_s32(EE_pack_hi_%d), rev_idx));" % (b, b))
            lines.append("    svint32_t EEE_lo_%d = svadd_s32_x(p8s, "
                         "EE_pack_lo_%d, EE_rev_lo_%d);" % (b, b, b))
            lines.append("    svint32_t EEE_hi_%d = svadd_s32_x(p8s, "
                         "EE_pack_hi_%d, EE_rev_hi_%d);" % (b, b, b))
            lines.append("    svint32_t EEO_lo_%d = svsub_s32_x(p8s, "
                         "EE_pack_lo_%d, EE_rev_lo_%d);" % (b, b, b))
            lines.append("    svint32_t EEO_hi_%d = svsub_s32_x(p8s, "
                         "EE_pack_hi_%d, EE_rev_hi_%d);" % (b, b, b))
        lines.append("")

    for b in range(4):
        base = b * 4
        lines.append("    // ---- QO pack batch %d ----" % b)
        lines.append("    svint64_t pa0_%d = svreinterpret_s64_s16(zO_%d);" % (b, base))
        lines.append("    svint64_t pa1_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 1))
        lines.append("    svint64_t pa2_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 2))
        lines.append("    svint64_t pa3_%d = svreinterpret_s64_s16(zO_%d);" % (b, base + 3))
        lines.append("    svint64_t pt0_%d = svzip1_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt1_%d = svzip2_s64(pa0_%d, pa2_%d);" % (b, b, b))
        lines.append("    svint64_t pt2_%d = svzip1_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pt3_%d = svzip2_s64(pa1_%d, pa3_%d);" % (b, b, b))
        lines.append("    svint64_t pp0_%d = svzip1_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint64_t pp1_%d = svzip2_s64(pt0_%d, pt2_%d);" % (b, b, b))
        lines.append("    svint16_t QO0_%d = svreinterpret_s16_s64(pp0_%d);" % (b, b))
        lines.append("    svint16_t QO1_%d = svreinterpret_s16_s64(pp1_%d);" % (b, b))
        lines.append("")

    k_eee = [(0, 0), (8, 2)]
    k_eeo = [(4, 1), (12, 3)]
    k_eo = [(2, 0), (6, 1), (10, 2), (14, 3)]

    for k, t8e_idx in k_eee + k_eeo:
        data_name = "EEE" if (k, t8e_idx) in k_eee else "EEO"
        t8e = T8E[t8e_idx]
        uniform_c = (len(set(t8e)) == 1)
        lines.append("    // k=%d: %s * T8E[%d]%s" % (
            k, data_name, t8e_idx,
            " (uniform c, vpadd-first)" if uniform_c else " (mul-first)"))
        if use_neon:
            lines.append("    const int32x4_t c_%d = vld1q_s32(T8E[%d]);" % (k, t8e_idx))
            for b in range(4):
                eee_lo = b * 2
                eee_hi = b * 2 + 1
                if uniform_c:
                    lines.append("    int32x4_t pp_%d_%d = vpaddq_s32(%s_%d, %s_%d);"
                                 % (k, b, data_name, eee_lo, data_name, eee_hi))
                    lines.append("    int32x4_t m_%d_%d = vmulq_s32(c_%d, pp_%d_%d);"
                                 % (k, b, k, k, b))
                else:
                    lines.append("    int32x4_t m0_%d_%d = vmulq_s32(c_%d, %s_%d);"
                                 % (k, b, k, data_name, eee_lo))
                    lines.append("    int32x4_t m1_%d_%d = vmulq_s32(c_%d, %s_%d);"
                                 % (k, b, k, data_name, eee_hi))
                    lines.append("    int32x4_t m_%d_%d = vpaddq_s32(m0_%d_%d, m1_%d_%d);"
                                 % (k, b, k, b, k, b))
                lines.append("    int16x4_t nn_%d_%d = vrshrn_n_s32(m_%d_%d, 10);"
                             % (k, b, k, b))
                lines.append("    vst1_s16(dst + 16 * %d + %d, nn_%d_%d);"
                             % (k, b * 4, k, b))
        else:
            lines.append("    svint32_t c_%d = svld1_s32(pg4s, T8E[%d]);" % (k, t8e_idx))
            if not uniform_c:
                lines.append("    svint32_t c_bcast_%d = svsplice_s32(p8s, c_%d, c_%d);"
                             % (k, k, k))
            for b in range(4):
                if uniform_c:
                    if use_addp:
                        lines.append("    svint32_t pp_%d_%d = addp_s32(%s_lo_%d, %s_hi_%d);"
                                     % (k, b, data_name, b, data_name, b))
                    else:
                        lines.append("    svint32_t pp_%d_%d = svadd_s32_x(p8s, "
                                     "svuzp1_s32(%s_lo_%d, %s_hi_%d), "
                                     "svuzp2_s32(%s_lo_%d, %s_hi_%d));"
                                     % (k, b, data_name, b, data_name, b,
                                        data_name, b, data_name, b))
                    lines.append("    svint32_t pp_ext_%d_%d = svreinterpret_s32_u32("
                                 "svtbl_u32(svreinterpret_u32_s32(pp_%d_%d), pp_idx));"
                                 % (k, b, k, b))
                    lines.append("    svint32_t m_%d_%d = svmul_s32_x(p8s, c_%d, pp_ext_%d_%d);"
                                 % (k, b, k, k, b))
                else:
                    lines.append("    svint32_t m_lo_%d_%d = svmul_s32_x(p8s, "
                                 "c_bcast_%d, %s_lo_%d);"
                                 % (k, b, k, data_name, b))
                    lines.append("    svint32_t m_hi_%d_%d = svmul_s32_x(p8s, "
                                 "c_bcast_%d, %s_hi_%d);"
                                 % (k, b, k, data_name, b))
                    if use_addp:
                        lines.append("    svint32_t pp_%d_%d = addp_s32(m_lo_%d_%d, m_hi_%d_%d);"
                                     % (k, b, k, b, k, b))
                    else:
                        lines.append("    svint32_t pp_%d_%d = svadd_s32_x(p8s, "
                                     "svuzp1_s32(m_lo_%d_%d, m_hi_%d_%d), "
                                     "svuzp2_s32(m_lo_%d_%d, m_hi_%d_%d));"
                                     % (k, b, k, b, k, b, k, b, k, b))
                    lines.append("    svint32_t pp_ext_%d_%d = svreinterpret_s32_u32("
                                 "svtbl_u32(svreinterpret_u32_s32(pp_%d_%d), pp_idx));"
                                 % (k, b, k, b))
                lines.append("    svint16_t nn_%d_%d = svrshrnb_n_s32(pp_ext_%d_%d, 10);"
                             % (k, b, k, b))
                lines.append("    nn_%d_%d = svuzp1_s16(nn_%d_%d, nn_%d_%d);"
                             % (k, b, k, b, k, b))
                lines.append("    svst1_s16(pg4h, dst + 16 * %d + %d, nn_%d_%d);"
                             % (k, b * 4, k, b))
        lines.append("")

    for k, gt_idx in k_eo:
        lines.append("    // k=%d: EO * GT16_S32[%d]" % (k, gt_idx))
        if use_neon:
            lines.append("    const int32x4_t c_%d = vld1q_s32(GT16_S32[%d]);" % (k, gt_idx))
            for b in range(4):
                base = b * 4
                for j in range(4):
                    r = base + j
                    lines.append("    int32x4_t m_%d_%d_%d = vmulq_s32(c_%d, EO_%d);"
                                 % (k, b, j, k, r))
                lines.append("    int32x4_t t01_%d_%d = vpaddq_s32(m_%d_%d_0, m_%d_%d_1);"
                             % (k, b, k, b, k, b))
                lines.append("    int32x4_t t23_%d_%d = vpaddq_s32(m_%d_%d_2, m_%d_%d_3);"
                             % (k, b, k, b, k, b))
                lines.append("    int32x4_t t_%d_%d = vpaddq_s32(t01_%d_%d, t23_%d_%d);"
                             % (k, b, k, b, k, b))
                lines.append("    int16x4_t nn_%d_%d = vrshrn_n_s32(t_%d_%d, 10);"
                             % (k, b, k, b))
                lines.append("    vst1_s16(dst + 16 * %d + %d, nn_%d_%d);"
                             % (k, b * 4, k, b))
        else:
            lines.append("    svint32_t c_%d = svld1_s32(pg4s, GT16_S32[%d]);" % (k, gt_idx))
            lines.append("    svint32_t c_bcast_%d = svsplice_s32(p8s, c_%d, c_%d);"
                         % (k, k, k))
            for b in range(4):
                base = b * 4
                lines.append("    svint32_t EO_pack_lo_%d_%d = svsplice_s32(pg4s, "
                             "EO_%d, EO_%d);" % (k, b, base, base + 1))
                lines.append("    svint32_t EO_pack_hi_%d_%d = svsplice_s32(pg4s, "
                             "EO_%d, EO_%d);" % (k, b, base + 2, base + 3))
                lines.append("    svint32_t m_lo_%d_%d = svmul_s32_x(p8s, "
                             "c_bcast_%d, EO_pack_lo_%d_%d);"
                             % (k, b, k, k, b))
                lines.append("    svint32_t m_hi_%d_%d = svmul_s32_x(p8s, "
                             "c_bcast_%d, EO_pack_hi_%d_%d);"
                             % (k, b, k, k, b))
                if use_addp:
                    lines.append("    svint32_t l1_%d_%d = addp_s32(m_lo_%d_%d, m_hi_%d_%d);"
                                 % (k, b, k, b, k, b))
                    lines.append("    svint32_t l2_%d_%d = addp_s32(l1_%d_%d, l1_%d_%d);"
                                 % (k, b, k, b, k, b))
                else:
                    lines.append("    svint32_t l1_%d_%d = svadd_s32_x(p8s, "
                                 "svuzp1_s32(m_lo_%d_%d, m_hi_%d_%d), "
                                 "svuzp2_s32(m_lo_%d_%d, m_hi_%d_%d));"
                                 % (k, b, k, b, k, b, k, b, k, b))
                    lines.append("    svint32_t l2_%d_%d = svadd_s32_x(p8s, "
                                 "svuzp1_s32(l1_%d_%d, l1_%d_%d), "
                                 "svuzp2_s32(l1_%d_%d, l1_%d_%d));"
                                 % (k, b, k, b, k, b, k, b, k, b))
                lines.append("    svint32_t pp_ext_%d_%d = svreinterpret_s32_u32("
                             "svtbl_u32(svreinterpret_u32_s32(l2_%d_%d), k2_idx));"
                             % (k, b, k, b))
                lines.append("    svint16_t nn_%d_%d = svrshrnb_n_s32(pp_ext_%d_%d, 10);"
                             % (k, b, k, b))
                lines.append("    nn_%d_%d = svuzp1_s16(nn_%d_%d, nn_%d_%d);"
                             % (k, b, k, b, k, b))
                lines.append("    svst1_s16(pg4h, dst + 16 * %d + %d, nn_%d_%d);"
                             % (k, b * 4, k, b))
        lines.append("")

    odd_k = [1, 3, 5, 7, 9, 11, 13, 15]
    for k in odd_k:
        lines.append("    // k=%d: odd-k (QO0/QO1 svdot, from op895)" % k)
        lines.append("    const svint16_t c_clo_%d = svld1_s16(p16, CQ_LO[%d]);" % (k, k))
        lines.append("    const svint16_t c_chi_%d = svld1_s16(p16, CQ_HI[%d]);" % (k, k))
        for b in range(4):
            lines.append("    svint64_t d0_%d_%d = svdot_s64(zero64, QO0_%d, c_clo_%d);"
                         % (k, b, b, k))
            lines.append("    svint64_t d1_%d_%d = svdot_s64(d0_%d_%d, QO1_%d, c_chi_%d);"
                         % (k, b, k, b, b, k))
        lines.append("    {")
        lines.append("        const svint32_t w01 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_0), svreinterpret_s32_s64(d1_%d_1));"
                     % (k, k))
        lines.append("        const svint32_t w23 = svuzp1_s32("
                     "svreinterpret_s32_s64(d1_%d_2), svreinterpret_s32_s64(d1_%d_3));"
                     % (k, k))
        lines.append("        const svint16_t nb = svrshrnb_n_s32(w01, 10);")
        lines.append("        const svint16_t nt = svrshrnb_n_s32(w23, 10);")
        lines.append("        svint16_t nn = svuzp1_s16(nb, nt);")
        lines.append("        svst1_s16(p16, dst + 16 * %d + 0, nn);" % k)
        lines.append("    }")
        lines.append("")

    lines.append("}")
    return "\n".join(lines)


def emit_candidate(even_k_mode: str = "addp") -> str:
    is_pure_sve2 = (even_k_mode == "pure_sve2")
    is_fused = (even_k_mode == "neon_bridge_fused")
    lines = []
    lines.append("// Generated by optimizer/ir/dct16_wide_sve2.py -- do not edit by hand.")
    lines.append("// Width-native SVE2 dct16 (VL=256, single-group full-width).")
    lines.append("// pass1: pure SVE2 (from op895)")
    lines.append("// pass2 even-k: %s" % even_k_mode)
    lines.append("// pass2 odd-k:  pure SVE2 (from op895 svdot)")
    lines.append("#include <arm_sve.h>")
    if not is_pure_sve2:
        lines.append("#include <arm_neon.h>")
        lines.append("#include <arm_neon_sve_bridge.h>")
    lines.append("#include <cstdint>")
    lines.append("")
    if is_pure_sve2:
        lines.append(SVE_HELPERS)
    else:
        lines.append(HELPERS)
    lines.append("")
    lines.append(_emit_constants())
    lines.append("")
    lines.append(emit_pass1())
    lines.append("")
    lines.append(emit_pass2(even_k_mode))
    lines.append("")
    lines.append('extern "C" void dynopt_dct16_sve2_shared('
                 'const int16_t* src, int16_t* dst, intptr_t srcStride)')
    lines.append("{")
    lines.append("    int16_t coef[256];")
    lines.append("    op_pass_4(src, coef, srcStride);")
    lines.append("    op_pass_11(coef, dst);")
    lines.append("}")
    lines.append("")
    lines.append('extern "C" void dynopt_dct16_op_pass1(')
    lines.append("    const int16_t* src, int16_t* dst, intptr_t srcStride)")
    lines.append("{")
    lines.append("    op_pass_4(src, dst, srcStride);")
    lines.append("}")
    lines.append("")
    lines.append('extern "C" void dynopt_dct16_op_pass2(')
    lines.append("    const int16_t* src, int16_t* dst)")
    lines.append("{")
    lines.append("    op_pass_11(src, dst);")
    lines.append("}")
    lines.append("")
    return "\n".join(lines)


if __name__ == "__main__":
    import sys
    mode = "addp"
    out_path = None
    for arg in sys.argv[1:]:
        if arg.startswith("--mode="):
            mode = arg.split("=", 1)[1]
        elif not arg.startswith("-"):
            out_path = arg
    out = emit_candidate(mode)
    if out_path:
        with open(out_path, "w") as f:
            f.write(out)
        print("Wrote %d lines to %s (mode=%s)" % (len(out.splitlines()), out_path, mode))
    else:
        sys.stdout.write(out)
