"""Width-native SVE2 interp8 hpp emitter (VL=256, svdot_s32 s8->s32).

Unlike best_sve2.cpp (svdot_s64 s16xs16->s64, requires u8->u16
widening + 3 svtbl_u16 + 2 svuzp1_s32 + svtbl2_s32 merge), this
emitter uses svdot_s32 (s8xs8->s32, 8 groups @ VL=256) which
directly outputs 8 pixels per unit -- eliminating the addp pair-sum
step (the RMW bottleneck of pure_sve2 dct16) and halving the
permute count.

Key insight: svdot_s32's 8 s32 outputs map 1:1 to 8 output pixels,
so no addp/uzp2 pair-sum is needed (unlike sdoth's s16 accumulator
which packs 2 tap-pairs per lane requiring addp+uzp1).

DC offset trick (docs/22 Sec 5): subtract 128 from u8 to get s8,
sum f*(s-128) = sum f*s - 8192, re-add 8192 via acc init. The
8192 fits in a single s32 lane (no split needed, unlike sdoth's
s16 which needs 4096+4096 across paired lanes).

Search axes:
  shift_init: "rshrnb6_vqmovun" (default) -- svrshrnb_n_s32(6) +
    vqmovun_s16 (NEON-bridge saturating narrow, same as best_sve2)
"""

from __future__ import annotations

COEFFS = {
    1: [-1, 4, -10, 58, 17, -5, 1, 0],
    2: [-1, 4, -11, 40, 40, -11, 4, -1],
    3: [0, 1, -5, 17, 58, -10, 4, -1],
}

# Base index vectors for unit 0 (offset 0). For unit u (offset u*8),
# add u*8 to each element. group p (p=0..7) = 4 consecutive samples
# [s[p-3+o], s[p-2+o], s[p-1+o], s[p+o]] for tap-pair 0-3 (IX0) or
# 4-7 (IX1).
IX0B_BASE = [
    0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6,
    4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10,
]
IX1B_BASE = [
    4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10,
    8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14,
]


def _shift_ix(ix, off):
    return [min(255, x + off) for x in ix]


def _emit_constants(width, height):
    """Emit int8 coefficient tables (CB0..CB5) and index vectors."""
    units = max(1, width // 8)
    lines = []
    for ph in (1, 2, 3):
        c = COEFFS[ph]
        c0 = c[0:4]
        c1 = c[4:8]
        lines.append("static const int8_t CB%d_%d[32] = {" % (ph, 0))
        body0 = ", ".join(str(v) for v in c0)
        lines.append("    %s, %s, %s, %s, %s, %s, %s, %s"
                     % (body0, body0, body0, body0, body0, body0, body0, body0))
        lines.append("};")
        lines.append("static const int8_t CB%d_%d[32] = {" % (ph, 1))
        body1 = ", ".join(str(v) for v in c1)
        lines.append("    %s, %s, %s, %s, %s, %s, %s, %s"
                     % (body1, body1, body1, body1, body1, body1, body1, body1))
        lines.append("};")
    for u in range(units):
        # offset within the 32-byte window (cyclic every 3 units).
        # unit u uses window q=u//3 (at row + 24*q); within that window
        # the 8-pixel group starts at byte (u%3)*8.
        off = (u % 3) * 8
        ix0 = _shift_ix(IX0B_BASE, off)
        ix1 = _shift_ix(IX1B_BASE, off)
        lines.append("static const uint8_t IX0B_U%d[32] = {" % u)
        lines.append("    " + ", ".join(str(x) for x in ix0))
        lines.append("};")
        lines.append("static const uint8_t IX1B_U%d[32] = {" % u)
        lines.append("    " + ", ".join(str(x) for x in ix1))
        lines.append("};")
    return "\n".join(lines)


def emit_svdot32(func_name=None, width=8, height=8):
    """SVE2 (VL=256) interp8 hpp via svdot_s32 (s8xs8->s32).

    Per row: load 32-byte u8 window, sub 128 -> s8, svtbl_s8 x2,
    svdot_s32 x2 (acc init 8192 for DC offset), svrshrnb_n_s32(6) +
    svuzp1_s16 + vqmovun_s16 + vst1_u8 per unit.
    """
    if width % 8:
        raise ValueError("emit_svdot32: width must be a multiple of 8")
    if func_name is None:
        func_name = "dynopt_interp8_%dx%d_sve2" % (width, height)
    units = max(1, width // 8)
    n_windows = (units + 2) // 3

    ix_loads = []
    for u in range(units):
        ix_loads.append("    const svuint8_t ix0_u%d = svld1_u8(p8, IX0B_U%d);"
                        % (u, u))
        ix_loads.append("    const svuint8_t ix1_u%d = svld1_u8(p8, IX1B_U%d);"
                        % (u, u))

    window_lines = []
    for q in range(n_windows):
        addr = "row" if q == 0 else "row + %d" % (24 * q)
        window_lines.append(
            "        svuint8_t W32_%d = svld1_u8(p8, %s);" % (q, addr))
        window_lines.append(
            "        svint8_t W_%d = svreinterpret_s8_u8("
            "svsub_n_u8_x(p8, W32_%d, 128));" % (q, q))

    unit_calls = []
    for u in range(units):
        q = u // 3
        o = (u % 3) * 8
        unit_calls.append("        { // unit %d (offset %d)" % (u, o))
        unit_calls.append(
            "            svint8_t X0 = svtbl_s8(W_%d, ix0_u%d);" % (q, u))
        unit_calls.append(
            "            svint8_t X1 = svtbl_s8(W_%d, ix1_u%d);" % (q, u))
        unit_calls.append(
            "            svint32_t t = svdot_s32(off8192, X0, c0);")
        unit_calls.append(
            "            t = svdot_s32(t, X1, c1);")
        unit_calls.append(
            "            svint16_t rr = svrshrnb_n_s32(t, 6);")
        unit_calls.append(
            "            svint16_t rz = svuzp1_s16(rr, rr);")
        unit_calls.append(
            "            uint8x8_t u8 = vqmovun_s16(svget_neonq_s16(rz));")
        unit_calls.append(
            "            vst1_u8(drow + %d, u8);" % (8 * u))
        unit_calls.append("        }")

    return """\
// Generated by optimizer/ir/interp8_wide_sve2.py -- do not edit by hand.
// 8-bit horizontal 8-tap luma filter %(width)dx%(height)d (SVE2, VL=256),
// svdot_s32 path (s8xs8->s32, 8 groups, 1 pixel per lane).
#include <arm_sve.h>
#include <arm_neon.h>
#include <arm_neon_sve_bridge.h>

%(constants)s

extern "C" void %(func_name)s(const uint8_t* src, intptr_t srcStride,
                   uint8_t* dst, intptr_t dstStride, int coeffIdx)
{
    const svbool_t p8 = svptrue_b8();
    const svbool_t p8h8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);
    const svint32_t off8192 = svdup_n_s32(8192);
    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ? coeffIdx : 2;
    const svint8_t c0 = svld1_s8(p8, (const int8_t*)
        (ph == 1 ? CB1_0 : (ph == 3 ? CB3_0 : CB2_0)));
    const svint8_t c1 = svld1_s8(p8, (const int8_t*)
        (ph == 1 ? CB1_1 : (ph == 3 ? CB3_1 : CB2_1)));
%(ix_loads)s

    for (int r = 0; r < %(height)d; r++)
    {
        const uint8_t* row = src + r * srcStride - 3;
%(window_loads)s
        uint8_t* drow = dst + r * dstStride;
%(unit_calls)s
    }
}
""" % {"func_name": func_name, "width": width, "height": height,
       "constants": _emit_constants(width, height),
       "ix_loads": "\n".join(ix_loads),
       "window_loads": "\n".join(window_lines),
       "unit_calls": "\n".join(unit_calls)}


def emit_svdot32_8x8(func_name="dynopt_interp8_8x8_sve2"):
    return emit_svdot32(func_name, 8, 8)


def emit_svdot32_16x16(func_name="dynopt_interp8_16x16_sve2"):
    return emit_svdot32(func_name, 16, 16)


def emit_svdot32_32x32(func_name="dynopt_interp8_32x32_sve2"):
    return emit_svdot32(func_name, 32, 32)


if __name__ == "__main__":
    import sys
    shape = "8x8"
    out_path = None
    for arg in sys.argv[1:]:
        if arg.startswith("--shape="):
            shape = arg.split("=", 1)[1]
        elif not arg.startswith("-"):
            out_path = arg
    w, h = shape.split("x")[:2]
    w, h = int(w), int(h)
    out = emit_svdot32(width=w, height=h)
    if out_path:
        with open(out_path, "w") as f:
            f.write(out)
        print("Wrote %d lines to %s (%s)" % (
            len(out.splitlines()), out_path, shape))
    else:
        sys.stdout.write(out)
