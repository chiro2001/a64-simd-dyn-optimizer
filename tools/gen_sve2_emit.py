"""Generic MachineIR -> SVE2 candidate emitter (docs/40 M3, /goal).

Recipe registry: each recipe declares (a) a MachineIR op-signature
detector and (b) an SVE2 ACLE lowering. The emitter consumes only the
imported MachineIR JSON of the seed -- no per-kernel hand-written emitter.
The search layer consumes the emitted source through the normal
verify/trace/MCA funnel (`search_sve2_layouts.py --backend gen`).

Recipes so far:
  diff-sum   (sad 16/16/32): uabd + uaddlv per row -> svld1/svabd/svaddv.

Adding a recipe = register a (name, detect, emit) triple; family members
covered by the same recipe need no emitter code at all.
"""

import json
import os
import re
import sys

try:
    import yaml
except ImportError:
    yaml = None

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# kernel name -> seed recipe name (kernel dirs may cover several shapes).
_RECIPE_ALIAS = {
    "sad": "sad-16x16",
    "sad-32": "sad-32x32",
    "sa8d": "sa8d-8x8",
    "sa8d16": "sa8d-16x16",
    "interp8": "interp8-8x8",
    "interp8-16": "interp8-16x16",
    "interp8-32": "interp8-32x32",
    "interp4": "interp4-16x16",
    "interp4-8": "interp4-8x8",
    "interp4-32": "interp4-32x32",
    "satd-8": "satd-8x8",
    "satd-4": "satd-4x4",
    "satd-16": "satd-16x16",
    "satd-4x8": "satd-4x8",
    "satd-8x4": "satd-8x4",
    "satd-16x8": "satd-16x8",
    "satd-16x4": "satd-16x4",
    "interp8vpp-16": "interp8vpp-16",
    "interp8vpp-8": "interp8vpp-8",
}


def _load_machine_ir(kernel):
    """Load the seed MachineIR JSON declared by seeds/<kernel>.yaml."""
    recipe_name = _RECIPE_ALIAS.get(kernel, kernel)
    recipe_path = os.path.join(ROOT, "seeds", recipe_name + ".yaml")
    if yaml is None or not os.path.exists(recipe_path):
        # fall back to the canonical m30 layout for known kernels
        alt = os.path.join(
            ROOT, "experiments", "m30-%s-search" % kernel,
            "imported", "machine-ir.json")
        if os.path.exists(alt):
            return json.load(open(alt))
        raise ValueError("no MachineIR for kernel %r" % kernel)
    recipe = yaml.safe_load(open(recipe_path))
    out = recipe["output"]["json"]
    path = out if os.path.isabs(out) else os.path.join(ROOT, out)
    if not os.path.exists(path):
        raise ValueError("MachineIR not found: %s" % path)
    return json.load(open(path))


def detect_diff_sum(machine_ir):
    """Diff-sum signature: uabd+uaddlv (sad 16/32)."""
    intr = {n.get("intrinsic") for n in machine_ir["nodes"]
            if n.get("op") == "intrinsic"}
    if "uabd" in intr and "uaddlv" in intr:
        return True
    return False


def detect_hadamard(machine_ir):
    """Hadamard butterfly signature: sabd+abs+umax+uaddlv (sa8d 8x8).
    16x16 reduces with uaddlp + vecreduce_add instead of uaddlv."""
    intr = {n.get("intrinsic") for n in machine_ir["nodes"]
            if n.get("op") == "intrinsic"}
    if {"sabd", "abs", "umax"} <= intr:
        if "uaddlv" in intr or ("uaddlp" in intr and
                                "vecreduce_add" in intr):
            return True
    return False


def _fir_ps_derived(machine_ir):
    """Derive pixel->short hps facts from the stripped seed. LLVM emits
    i16 GEPs whose byte offsets are not row indices, so shape comes from
    the wrapper function name interp_horiz_ps_neon<N,W,H>; rows=H and
    groups=W/8 (the emitter's 8-output unit width)."""
    nodes = machine_ir["nodes"]
    fn = machine_ir.get("function") or ""
    is_ext = "_ext" in fn
    m = re.search(r"interp_horiz_ps_neon<\d+,\s*(\d+),\s*(\d+)>", fn)
    if m:
        width, height = int(m.group(1)), int(m.group(2))
    else:
        m = re.search(r"(\d+)x(\d+)", fn)
        if m:
            width, height = int(m.group(1)), int(m.group(2))
        else:
            stores = [n for n in nodes if n.get("op") == "store"
                      and n.get("type") == "<8 x i16>"]
            width, height = 8, len(stores)
    if width % 8:
        raise ValueError("fir-ps: width %d is not a multiple of 8" % width)
    filter_name = "g_lumaFilter"
    for n in nodes:
        if n.get("op") == "addr" and "g_chromaFilter" in (n.get("rhs")
                                                           or ""):
            filter_name = "g_chromaFilter"
    # isRowExt == 1 adds N_TAPS-1 output rows and shifts the source by
    # -(N_TAPS/2-1) rows (the column -3 offset is separate).
    rows = height + (7 if is_ext else 0)
    row_off = -3 if is_ext else 0
    return rows, width // 8, 6, 8, -3, filter_name, row_off


def detect_vertical_ps(machine_ir):
    """Vertical pixel->short FIR signature: umull with <8 x i16> stores
    and a vertical wrapper function name (no sqrshrun/sdot)."""
    fn = machine_ir.get("function") or ""
    if "vert_ps" not in fn and "vps" not in fn:
        return False
    nodes = machine_ir["nodes"]
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    stores = [n.get("type") for n in nodes if n.get("op") == "store"]
    return ("umull" in intr and "<8 x i16>" in stores
            and "sqrshrun" not in intr and "sdot" not in intr)


def detect_fir_ps(machine_ir):
    """Pixel->short FIR signature: umull (NEON hps) and <8 x i16> stores,
    with no sqrshrun/sdot (those are the pp hpp paths)."""
    nodes = machine_ir["nodes"]
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    stores = [n.get("type") for n in nodes if n.get("op") == "store"]
    return ("umull" in intr and "<8 x i16>" in stores
            and "sqrshrun" not in intr and "sdot" not in intr)


def detect_fir(machine_ir):
    """FIR signature: dot-product / tbl / narrowing (interp8/4).
    Recognized but not yet lowered (recipe gap)."""
    intr = {n.get("intrinsic") for n in machine_ir["nodes"]
            if n.get("op") == "intrinsic"}
    return "sdot" in intr or "sqrshrn" in intr


def detect_vertical_fir(machine_ir):
    """Vertical 8-tap FIR signature: umull + sqrshrun without sdot/tbl
    (interp8 vpp; docs/40 §16)."""
    intr = {n.get("intrinsic") for n in machine_ir["nodes"]
            if n.get("op") == "intrinsic"}
    return "umull" in intr and "sqrshrun" in intr and \
        "sdot" not in intr and "tbl1" not in intr


def detect_family(machine_ir):
    """Return the first matching recipe name, or None."""
    for name, rec in RECIPES.items():
        if rec["detect"](machine_ir):
            return name
    return None


def _row_offset(addr_rhs, row_vars):
    """Parse `getelementptr ... i8, ptr %base, i64 %expr` and return the
    expression as a C string over row variables (r), or None."""
    m = re.search(r"i64\s+%([A-Za-z0-9._]+)", addr_rhs)
    if not m:
        return None
    return m.group(1)


def emit_diff_sum(machine_ir, func_name, combo=None):
    """Emit SVE2 ACLE for the diff-sum family (sad shape: 4 args)."""
    nodes = machine_ir["nodes"]
    uabd_rows = 0
    max_row = -1
    row_offs = set()
    for n in nodes:
        if n.get("op") == "intrinsic" and n.get("intrinsic") == "uabd":
            uabd_rows += 1
    # derive the row count from the row-offset expression magnitudes:
    # seeds unroll r*stride as shl/mul chains; take the max constant
    # multiplier seen in shl/mul nodes feeding addr nodes.
    for n in nodes:
        if n.get("op") in ("shl", "mul") and n.get("amt") is not None:
            max_row = max(max_row, n.get("amt"))
        if n.get("op") == "mul" and n.get("const") is not None:
            max_row = max(max_row, n.get("const"))
    # row count comes from the max row-offset multiplier (the seed may
    # process several uabd groups per row, e.g. 32x32 halves); fall back
    # to the uabd count only when no offset constants are visible.
    rows = max_row + 1 if max_row >= 0 else uabd_rows
    if rows <= 0:
        raise ValueError("diff-sum emitter: could not derive row count")
    groups = max(1, uabd_rows // rows)
    width = 16 * groups
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic diff-sum recipe)",
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "extern \"C\" int %s(const uint8_t* a, intptr_t sa,"
        " const uint8_t* b, intptr_t sb)" % func_name,
        "{",
        "    const svbool_t p = svwhilelt_b8((uint32_t)0,"
        " (uint32_t)%d);" % width,
        "    uint64_t total = 0;",
        "    for (int r = 0; r < %d; r++)" % rows,
        "    {",
        "        svuint8_t x = svld1_u8(p, a + r * sa);",
        "        svuint8_t y = svld1_u8(p, b + r * sb);",
        "        svuint8_t d = svabd_u8_x(p, x, y);",
        "        total += svaddv_u8(p, d);",
    ]
    lines.extend([
        "    }",
        "    return (int)total;",
        "}",
    ])
    return "\n".join(lines) + "\n"


def _fir_derived(machine_ir):
    """Derive (rows, groups, prec, taps, load_off, filter_name) from the
    FIR MachineIR.

    rows = max dst row-stride multiplier + 1 (from store addr chains);
    groups = stores / rows (each store is one 8-output group); prec from
    the sqrshrun immediate; taps from the coefficient load type;
    load_off from the first src addr constant; filter from the global."""
    nodes = machine_ir["nodes"]
    stores = [n for n in nodes if n.get("op") == "store"]
    addrs = {n["dst"]: n for n in nodes if n.get("op") == "addr"}
    env = {"1": ("sa", 1), "3": ("sb", 1),
           "i_pix1": ("sa", 1), "i_pix2": ("sb", 1)}
    ptr_off = {}
    for n in nodes:
        if n.get("op") in ("shl", "mul"):
            src = n["src"][0]
            if src in env:
                sym, coef = env[src]
                amt = n.get("amt") if n.get("op") == "shl" \
                    else n.get("const")
                if amt is not None:
                    env[n["dst"]] = (sym, coef * (1 << amt)
                                     if n.get("op") == "shl"
                                     else coef * amt)
        elif n.get("op") == "addr":
            mb = re.search(r"ptr\s+%([A-Za-z0-9._]+),", n["rhs"])
            mi = re.search(r"i64\s+%([A-Za-z0-9._]+)", n["rhs"])
            mc = re.search(r"i64\s+(-?\d+)\s*$", n["rhs"])
            if not mb:
                continue
            base = mb.group(1)
            root, prev, prevb = ptr_off.get(base, (base, 0, 0))
            if mc:
                ptr_off[n["dst"]] = (root, prev, prevb + int(mc.group(1)))
            elif mi and mi.group(1) in env:
                ptr_off[n["dst"]] = (root, prev + env[mi.group(1)][1],
                                     prevb)
    maxrow = -1
    for s in stores:
        base, coef, byte = ptr_off.get(s["ptr"], (s["ptr"], 0, 0))
        if base in ("2", "dst"):
            maxrow = max(maxrow, coef)
    rows = maxrow + 1 if maxrow >= 0 else len(stores)
    store_lanes = 8
    for s in stores:
        m = re.match(r"<(\d+) x i\d+>", s.get("type", ""))
        if m:
            store_lanes = max(store_lanes, int(m.group(1)))
    groups = (store_lanes // 8) * (len(stores) // rows if rows else 1)
    prec = 6
    taps = 8
    load_off = -3
    filter_name = "g_lumaFilter"
    for n in nodes:
        if n.get("op") == "intrinsic" and n.get("intrinsic") == "sqrshrun":
            imm = next((a.get("imm") for a in n.get("args", [])
                        if isinstance(a, dict) and "imm" in a), prec)
            prec = int(imm)
        if n.get("op") == "load" and n.get("type") == "<4 x i16>":
            taps = 4
        if n.get("op") == "addr" and "g_chromaFilter" in n.get("rhs", ""):
            filter_name = "g_chromaFilter"
        if n.get("op") == "addr":
            moff = re.search(r"i8,\s*ptr\s+%[0-9A-Za-z._]+,\s*i64\s+(-?\d+)",
                             n["rhs"])
            if moff and n.get("id", 0) < 8:
                load_off = int(moff.group(1))
    return rows, groups, prec, taps, load_off, filter_name


_FIR_LUMA_SDOTH_TEMPLATE = r"""\
// Generated by tools/gen_sve2_emit.py (generic fir recipe, SVE2p3
// sdot.h path-B lowering for 8-tap luma)
#include <arm_sve.h>

static const int8_t CB0[32] =
    { -1, 4, -10, 58, -1, 4, -10, 58, -1, 4, -10, 58, -1, 4, -10, 58,
      -1, 4, -10, 58, -1, 4, -10, 58, -1, 4, -10, 58, -1, 4, -10, 58 };
static const int8_t CB1[32] =
    { 17, -5, 1, 0, 17, -5, 1, 0, 17, -5, 1, 0, 17, -5, 1, 0,
      17, -5, 1, 0, 17, -5, 1, 0, 17, -5, 1, 0, 17, -5, 1, 0 };
static const int8_t CB2[32] =
    { -1, 4, -11, 40, -1, 4, -11, 40, -1, 4, -11, 40, -1, 4, -11, 40,
      -1, 4, -11, 40, -1, 4, -11, 40, -1, 4, -11, 40, -1, 4, -11, 40 };
static const int8_t CB3[32] =
    { 40, -11, 4, -1, 40, -11, 4, -1, 40, -11, 4, -1, 40, -11, 4, -1,
      40, -11, 4, -1, 40, -11, 4, -1, 40, -11, 4, -1, 40, -11, 4, -1 };
static const int8_t CB4[32] =
    { 0, 1, -5, 17, 0, 1, -5, 17, 0, 1, -5, 17, 0, 1, -5, 17,
      0, 1, -5, 17, 0, 1, -5, 17, 0, 1, -5, 17, 0, 1, -5, 17 };
static const int8_t CB5[32] =
    { 58, -10, 4, -1, 58, -10, 4, -1, 58, -10, 4, -1, 58, -10, 4, -1,
      58, -10, 4, -1, 58, -10, 4, -1, 58, -10, 4, -1, 58, -10, 4, -1 };
static const uint8_t IX0B[32] =
    { 0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6,
      4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10 };
static const uint8_t IX1B[32] =
    { 4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10,
      8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14 };
static const uint8_t IX0B8[32] =
    { 8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14,
      12, 13, 14, 15, 13, 14, 15, 16, 14, 15, 16, 17, 15, 16, 17, 18 };
static const uint8_t IX1B8[32] =
    { 12, 13, 14, 15, 13, 14, 15, 16, 14, 15, 16, 17, 15, 16, 17, 18,
      16, 17, 18, 19, 17, 18, 19, 20, 18, 19, 20, 21, 19, 20, 21, 22 };
static const uint8_t IX0B16[32] =
    { 16, 17, 18, 19, 17, 18, 19, 20, 18, 19, 20, 21, 19, 20, 21, 22,
      20, 21, 22, 23, 21, 22, 23, 24, 22, 23, 24, 25, 23, 24, 25, 26 };
static const uint8_t IX1B16[32] =
    { 20, 21, 22, 23, 21, 22, 23, 24, 22, 23, 24, 25, 23, 24, 25, 26,
      24, 25, 26, 27, 25, 26, 27, 28, 26, 27, 28, 29, 27, 28, 29, 30 };

static inline svint16_t sdot_h(svint16_t acc, svint8_t a, svint8_t b)
{
    asm volatile("sdot %0.h, %1.b, %2.b"
                 : "+w"(acc) : "w"(a), "w"(b));
    return acc;
}

static inline svint16_t sdot_h_acc(svint16_t acc, svint8_t a, svint8_t b)
{
    svint16_t out;
    asm volatile("movprfx %0, %1\n\tsdot %0.h, %2.b, %3.b"
                 : "=&w"(out) : "w"(acc), "w"(a), "w"(b));
    return out;
}

static inline svint16_t addp_h(svint16_t a, svbool_t pg)
{
    asm volatile("addp %0.h, %1/m, %0.h, %0.h"
                 : "+w"(a) : "Upl"(pg));
    return a;
}

static inline void interp8_unit8(
    svint8_t W, svuint8_t ix0, svuint8_t ix1,
    svint8_t c0, svint8_t c1, svint16_t off4096,
    uint8_t* dstp, svbool_t p8h8)
{
    svint8_t X0 = svtbl_s8(W, ix0);
    svint8_t X1 = svtbl_s8(W, ix1);
    svint16_t t = sdot_h_acc(off4096, X0, c0);
    t = sdot_h(t, X1, c1);
    __PAIRSUM__
    svuint8_t u = svqrshrunb_n_s16(pixels, 6);
    svuint8_t uz = svuzp1_u8(u, u);
    svst1_u8(p8h8, dstp, uz);
}

extern "C" void __FUNC__(const uint8_t* src, intptr_t srcStride,
                   uint8_t* dst, intptr_t dstStride, int coeffIdx)
{
    const svbool_t p32 = svptrue_b8();
    const svbool_t p8h8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);
    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ? coeffIdx : 2;
    const svint8_t c0 = svld1_s8(p32, (const int8_t*)
        (ph == 1 ? CB0 : (ph == 3 ? CB4 : CB2)));
    const svint8_t c1 = svld1_s8(p32, (const int8_t*)
        (ph == 1 ? CB1 : (ph == 3 ? CB5 : CB3)));
    const svuint8_t ix0 = svld1_u8(p32, IX0B);
    const svuint8_t ix1 = svld1_u8(p32, IX1B);
    const svuint8_t ix0_8 = svld1_u8(p32, IX0B8);
    const svuint8_t ix1_8 = svld1_u8(p32, IX1B8);
    const svuint8_t ix0_16 = svld1_u8(p32, IX0B16);
    const svuint8_t ix1_16 = svld1_u8(p32, IX1B16);
    const svint16_t off4096 = svdup_n_s16(4096);

    __UNROLL__
    for (int r = 0; r < __N__; r++)
    {
        const uint8_t* row = src + r * srcStride - 3;
        svuint8_t W32 = svld1_u8(p32, row);
        svint8_t W = svreinterpret_s8_u8(
            svsub_n_u8_x(svptrue_b8(), W32, 128));
        uint8_t* drow = dst + r * dstStride;
        interp8_unit8(W, ix0, ix1, c0, c1, off4096, drow, p8h8);
        if (__N__ >= 16)
            interp8_unit8(W, ix0_8, ix1_8, c0, c1, off4096, drow + 8, p8h8);
        if (__N__ >= 32)
        {
            interp8_unit8(W, ix0_16, ix1_16, c0, c1, off4096,
                          drow + 16, p8h8);
            svuint8_t W32b = svld1_u8(p32, row + 24);
            svint8_t Wb = svreinterpret_s8_u8(
                svsub_n_u8_x(svptrue_b8(), W32b, 128));
            interp8_unit8(Wb, ix0, ix1, c0, c1, off4096, drow + 24, p8h8);
        }
    }
}
"""


_FIR_CHROMA_SDOTH_TEMPLATE = r"""\
// Generated by tools/gen_sve2_emit.py (generic fir recipe, SVE2p3
// sdot.h path lowering for 4-tap chroma)
#include <arm_sve.h>

__COEFFS__

static const uint8_t IX_A[32] =
    { 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8,
      8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16 };
static const uint8_t IX_B[32] =
    { 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10,
      10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16, 16, 17, 17, 18 };

static inline svint16_t sdot_h(svint16_t acc, svint8_t a, svint8_t b)
{
    asm volatile("sdot %0.h, %1.b, %2.b"
                 : "+w"(acc) : "w"(a), "w"(b));
    return acc;
}

static inline svint16_t sdot_h_acc(svint16_t acc, svint8_t a, svint8_t b)
{
    svint16_t out;
    asm volatile("movprfx %0, %1\n\tsdot %0.h, %2.b, %3.b"
                 : "=&w"(out) : "w"(acc), "w"(a), "w"(b));
    return out;
}

extern "C" void __FUNC__(const uint8_t* src, intptr_t srcStride,
                   uint8_t* dst, intptr_t dstStride, int coeffIdx)
{
    const svbool_t p32 = svptrue_b8();
    const svbool_t p16b = svwhilelt_b8((uint32_t)0, (uint32_t)16);
    const svbool_t p8b = svwhilelt_b8((uint32_t)0, (uint32_t)8);
    const int ph = coeffIdx & 7;
    const int8_t* cf = (const int8_t*)CHROMA_C[ph];
    const svint8_t c01 = svdupq_n_s8(cf[0], cf[1], cf[0], cf[1],
        cf[0], cf[1], cf[0], cf[1], cf[0], cf[1], cf[0], cf[1],
        cf[0], cf[1], cf[0], cf[1]);
    const svint8_t c23 = svdupq_n_s8(cf[2], cf[3], cf[2], cf[3],
        cf[2], cf[3], cf[2], cf[3], cf[2], cf[3], cf[2], cf[3],
        cf[2], cf[3], cf[2], cf[3]);
    const svuint8_t ix_a = svld1_u8(p32, IX_A);
    const svuint8_t ix_b = svld1_u8(p32, IX_B);
    const svint16_t zero = svdup_n_s16(0);

    for (int r = 0; r < __N__; r++)
    {
        const uint8_t* row = src + r * srcStride - 1;
        uint8_t* drow = dst + r * dstStride;
        for (int u = 0; u < __UNITS__; u++)
        {
            svuint8_t W32 = svld1_u8(p32, row + u * 16);
            svint8_t W = svreinterpret_s8_u8(
                svsub_n_u8_x(p32, W32, 128));
            svint8_t X = svtbl_s8(W, ix_a);
            svint8_t X2 = svtbl_s8(W, ix_b);
            svint16_t t = sdot_h_acc(zero, X, c01);
            t = sdot_h(t, X2, c23);
            t = svadd_n_s16_x(svptrue_b16(), t, 8192);
            svuint8_t u8 = svqrshrunb_n_s16(t, 6);
            svuint8_t uz = svuzp1_u8(u8, u8);
            svst1_u8(__N__ < 16 ? p8b : p16b, drow + u * 16, uz);
        }
    }
}
"""


def _emit_fir_luma_sdoth(func_name, n, unroll=False, pairsum="addp"):
    """SVE2p3 sdot.h lowering for 8-tap luma hpp (n = 8/16/32 square)."""
    if pairsum == "addp":
        pairsum_src = ("svint16_t d = addp_h(t, svptrue_b16());\n"
                       "    svint16_t pixels = svuzp1_s16(d, d);")
    else:
        pairsum_src = ("svint16_t pixels = svadd_s16_x(\n"
                       "        svptrue_b16(), svuzp1_s16(t, t), "
                       "svuzp2_s16(t, t));")
    return (_FIR_LUMA_SDOTH_TEMPLATE
            .replace("__FUNC__", func_name)
            .replace("__N__", str(n))
            .replace("__UNROLL__", ("    #pragma clang loop unroll(full)"
                                    if unroll else
                                    "    // (loop unroll left to compiler)"))
            .replace("__PAIRSUM__", pairsum_src))


def _emit_fir_chroma_sdoth(func_name, n, phases):
    """SVE2p3 sdot.h lowering for 4-tap chroma hpp (n = 8/16/32 square).
    Coefficients come from the same g_chromaFilter parse as the generic
    fir recipe, embedded as the 8x4 CHROMA_C table."""
    coeff_lines = ["static const int8_t CHROMA_C[%d][4] = {" % len(phases)]
    for row in phases:
        coeff_lines.append("    { %s }," % ", ".join(str(v) for v in row))
    coeff_lines.append("};")
    return (_FIR_CHROMA_SDOTH_TEMPLATE
            .replace("__FUNC__", func_name)
            .replace("__N__", str(n))
            .replace("__UNITS__", str(max(1, n // 16)))
            .replace("__COEFFS__", "\n".join(coeff_lines)))


def emit_fir(machine_ir, func_name, combo=None):
    """Generic 8-tap FIR (interp8 hpp) transliteration to SVE2 ACLE.

    Mirrors x265 interp8_horiz_pp_dotprod semantics:
      out[c] = sat_u8(round(SUM_k coeff[phase][k] * (src[c-3+k]-128) / 2^prec
                            + 64*128))
    via the shared sliding-window permute + 4-way svdot_s32 structure.
    Coefficients come from the x265 source constant tables (generic).
    """
    rows, groups, prec, taps, load_off, filter_name = _fir_derived(
        machine_ir)
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from extract_x265_constants import parse_int16_tables  # noqa: E402
    cpp = os.path.join(ROOT, "third_party/x265/source/common/constants.cpp")
    tables = parse_int16_tables(open(cpp).read())
    gf = tables[filter_name]["rows"]
    if filter_name == "g_chromaFilter":
        phases = gf
    else:
        phases = gf[1:4]
    ctable = ",\n".join(
        "        { %s }" % ", ".join(str(v) for v in row) for row in phases)

    compute = (combo or {}).get("compute")
    if compute == "sdot-h":
        n = int(rows)
        if filter_name == "g_lumaFilter":
            if n not in (8, 16, 32):
                raise ValueError(
                    "fir: sdot-h luma lowering expects square 8/16/32")
            return _emit_fir_luma_sdoth(
                func_name, n,
                unroll=bool((combo or {}).get("unroll") == "full"),
                pairsum=(combo or {}).get("pairsum", "addp"))
        if filter_name == "g_chromaFilter":
            if n not in (8, 16, 32):
                raise ValueError(
                    "fir: sdot-h chroma lowering expects square 8/16/32")
            return _emit_fir_chroma_sdoth(func_name, n, phases)
        raise ValueError("fir: sdot-h lowering has no recipe for %r"
                         % filter_name)

    # sliding-window index patterns for 4-output groups:
    # taps=8 -> 3 perm vectors (X0/X1/X2); taps=4 -> 2 (X0/X1).
    if taps == 8:
        idx = [
            [0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6],
            [4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10],
            [8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14],
        ]
        bs = [[0, 1, 2, 3] * 4, [4, 5, 6, 7] * 4]
    else:
        idx = [
            [0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6],
            [4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10],
        ]
        bs = [[0, 1, 2, 3] * 4]

    def c16(name, vals):
        return ("static const uint8_t %s[16] = { %s };" %
                (name, ", ".join(str(v) for v in vals)))

    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic fir recipe)",
        "#include <arm_sve.h>",
        "#include <arm_neon.h>",
        "#include <arm_neon_sve_bridge.h>",
        "#include <stdint.h>",
        "",
        "static const int16_t CTBL[%d][%d] = {" % (len(phases), taps),
        ctable,
        "};",
        c16("IDX0", idx[0]),
        c16("IDX1", idx[1]),
    ]
    if taps == 8:
        lines.append(c16("IDX2", idx[2]))
    lines.extend([
        c16("IDX_B0", bs[0]),
    ])
    if taps == 8:
        lines.append(c16("IDX_B1", bs[1]))
    lines.extend([
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        " uint8_t* dst, intptr_t dstStride, int coeffIdx)" % func_name,
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t pg16b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const svbool_t pg8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg8h = svwhilelt_b16((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg4 = svwhilelt_b16((uint32_t)0, (uint32_t)4);",
    ])
    if filter_name == "g_chromaFilter":
        lines.append(
            "    const int ph = (coeffIdx >= 0 && coeffIdx <= 7) ?"
            " coeffIdx : 0;")
    else:
        lines.append(
            "    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ?"
            " coeffIdx : 2;")
    if filter_name == "g_chromaFilter":
        lines.append("    const svint16_t f16 = svld1_s16(pg8h, CTBL[ph]);")
    else:
        lines.append(
            "    const svint16_t f16 = svld1_s16(pg8h, CTBL[ph - 1]);")
    lines.extend([
        "    const svint8_t f8 = svset_neonq_s8(svundef_s8(),",
        "        vcombine_s8(vmovn_s16(svget_neonq_s16(f16)),"
        " vdup_n_s8(0)));",
        "    const svint8_t b0 = svtbl_s8(f8,"
        " svld1_u8(svptrue_b8(), IDX_B0));",
        "    const svuint8_t ix0 = svld1_u8(svptrue_b8(), IDX0);",
        "    const svuint8_t ix1 = svld1_u8(svptrue_b8(), IDX1);",
        "    const svint32_t c8192 = svdup_n_s32(64 * 128);",
    ])
    if taps == 8:
        lines.extend([
            "    const svint8_t b1 = svtbl_s8(f8,"
            " svld1_u8(svptrue_b8(), IDX_B1));",
            "    const svuint8_t ix2 = svld1_u8(svptrue_b8(), IDX2);",
        ])
    lines.extend([
        "    for (int r = 0; r < %d; r++)" % rows,
        "    {",
        "        for (int g = 0; g < %d; g++)" % groups,
        "        {",
        "            svuint8_t s = svld1_u8(pg16b,"
        " src + r * srcStride %s + g * 8);" % load_off,
        "            svint8_t s8 = svreinterpret_s8_u8(",
        "                svsub_u8_x(pg16b, s, svdup_n_u8(128)));",
        "            svint8_t p0 = svtbl_s8(s8, ix0);",
        "            svint8_t p1 = svtbl_s8(s8, ix1);",
        "            svint32_t lo = svdot_s32(c8192, p0, b0);",
        "            svint32_t hi = svdot_s32(c8192, p1, b0);",
    ])
    if taps == 8:
        lines.extend([
            "            svint8_t p2 = svtbl_s8(s8, ix2);",
            "            lo = svdot_s32(lo, p1, b1);",
            "            hi = svdot_s32(hi, p2, b1);",
        ])
    lines.extend([
        "            int16x8_t dot = vcombine_s16(",
        "                vmovn_s32(svget_neonq_s32(lo)),",
        "                vmovn_s32(svget_neonq_s32(hi)));",
        "            uint8x8_t out = vqrshrun_n_s16(dot, %d);" % prec,
        "            svuint8_t outv = svset_neonq_u8(svundef_u8(),"
        " vcombine_u8(out, vdup_n_u8(0)));",
        "            svst1_u8(pg8, dst + r * dstStride + g * 8, outv);",
        "        }",
        "    }",
        "}",
    ])
    return "\n".join(lines) + "\n"


def emit_fir_ps(machine_ir, func_name, combo=None):
    """Generic 8-tap FIR pixel->short (interp8 hps) transliteration.

    Same sliding-window svdot_s32 structure as interp8 hpp, but the
    accumulator starts at zero (the -IF_INTERNAL_OFFS constant cancels
    the 128 bias) and the narrowed s16 lanes are stored directly.
    Contract is isRowExt == 0 (the extracted seed path)."""
    rows, groups, prec, taps, load_off, filter_name, row_off = \
        _fir_ps_derived(machine_ir)
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from extract_x265_constants import parse_int16_tables  # noqa: E402
    cpp = os.path.join(ROOT, "third_party/x265/source/common/constants.cpp")
    tables = parse_int16_tables(open(cpp).read())
    gf = tables[filter_name]["rows"]
    if filter_name == "g_chromaFilter":
        phases = gf
    else:
        phases = gf[1:4]
    ctable = ",\n".join(
        "        { %s }" % ", ".join(str(v) for v in row) for row in phases)

    if (combo or {}).get("compute") == "sdot-h":
        raise ValueError("fir-ps: sdot-h ps lowering not implemented yet")

    # sliding-window index patterns for 4-output groups:
    # taps=8 -> 3 perm vectors (X0/X1/X2); taps=4 -> 2 (X0/X1).
    if taps == 8:
        idx = [
            [0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6],
            [4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10],
            [8, 9, 10, 11, 9, 10, 11, 12, 10, 11, 12, 13, 11, 12, 13, 14],
        ]
        bs = [[0, 1, 2, 3] * 4, [4, 5, 6, 7] * 4]
    else:
        idx = [
            [0, 1, 2, 3, 1, 2, 3, 4, 2, 3, 4, 5, 3, 4, 5, 6],
            [4, 5, 6, 7, 5, 6, 7, 8, 6, 7, 8, 9, 7, 8, 9, 10],
        ]
        bs = [[0, 1, 2, 3] * 4]

    def c16(name, vals):
        return ("static const uint8_t %s[16] = { %s };" %
                (name, ", ".join(str(v) for v in vals)))

    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic fir recipe)",
        "#include <arm_sve.h>",
        "#include <arm_neon.h>",
        "#include <arm_neon_sve_bridge.h>",
        "#include <stdint.h>",
        "",
        "static const int16_t CTBL[%d][%d] = {" % (len(phases), taps),
        ctable,
        "};",
        c16("IDX0", idx[0]),
        c16("IDX1", idx[1]),
    ]
    if taps == 8:
        lines.append(c16("IDX2", idx[2]))
    lines.extend([
        c16("IDX_B0", bs[0]),
    ])
    if taps == 8:
        lines.append(c16("IDX_B1", bs[1]))
    lines.extend([
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        " int16_t* dst, intptr_t dstStride, int coeffIdx, int isRowExt)"
        % func_name,
        "{",
        "    (void)isRowExt;  // extracted contract: isRowExt == 0",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t pg16b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const svbool_t pg8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg8h = svwhilelt_b16((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg4 = svwhilelt_b16((uint32_t)0, (uint32_t)4);",
    ])
    if filter_name == "g_chromaFilter":
        lines.append(
            "    const int ph = (coeffIdx >= 0 && coeffIdx <= 7) ?"
            " coeffIdx : 0;")
    else:
        lines.append(
            "    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ?"
            " coeffIdx : 2;")
    if filter_name == "g_chromaFilter":
        lines.append("    const svint16_t f16 = svld1_s16(pg8h, CTBL[ph]);")
    else:
        lines.append(
            "    const svint16_t f16 = svld1_s16(pg8h, CTBL[ph - 1]);")
    lines.extend([
        "    const svint8_t f8 = svset_neonq_s8(svundef_s8(),",
        "        vcombine_s8(vmovn_s16(svget_neonq_s16(f16)),"
        " vdup_n_s8(0)));",
        "    const svint8_t b0 = svtbl_s8(f8,"
        " svld1_u8(svptrue_b8(), IDX_B0));",
        "    const svuint8_t ix0 = svld1_u8(svptrue_b8(), IDX0);",
        "    const svuint8_t ix1 = svld1_u8(svptrue_b8(), IDX1);",
        "    const svint32_t czero = svdup_n_s32(0);",
    ])
    if taps == 8:
        lines.extend([
            "    const svint8_t b1 = svtbl_s8(f8,"
            " svld1_u8(svptrue_b8(), IDX_B1));",
            "    const svuint8_t ix2 = svld1_u8(svptrue_b8(), IDX2);",
        ])
    lines.extend([
        "    for (int r = 0; r < %d; r++)" % rows,
        "    {",
        "        for (int g = 0; g < %d; g++)" % groups,
        "        {",
        "            svuint8_t s = svld1_u8(pg16b,"
        " src + (r + %d) * srcStride %s + g * 8);" % (row_off, load_off),
        "            svint8_t s8 = svreinterpret_s8_u8(",
        "                svsub_u8_x(pg16b, s, svdup_n_u8(128)));",
        "            svint8_t p0 = svtbl_s8(s8, ix0);",
        "            svint8_t p1 = svtbl_s8(s8, ix1);",
        "            svint32_t lo = svdot_s32(czero, p0, b0);",
        "            svint32_t hi = svdot_s32(czero, p1, b0);",
    ])
    if taps == 8:
        lines.extend([
            "            svint8_t p2 = svtbl_s8(s8, ix2);",
            "            lo = svdot_s32(lo, p1, b1);",
            "            hi = svdot_s32(hi, p2, b1);",
        ])
    lines.extend([
        "            int16x8_t dot = vcombine_s16(",
        "                vmovn_s32(svget_neonq_s32(lo)),",
        "                vmovn_s32(svget_neonq_s32(hi)));",
        "            vst1q_s16(dst + r * dstStride + g * 8, dot);",
        "        }",
        "    }",
        "}",
    ])
    return "\n".join(lines) + "\n"


def _hadamard_natural_sa8d_rows(machine_ir):
    """Structural signature for SA8D 16x16 extracted as four 8x8
    quadrants: 64 <8 x i8> loads (16 rows x 2 planes x 2 column halves),
    uaddlp+vecreduce_add tail reduction. This is the shape for which the
    natural 16-lane-row lowering (pack=2) reproduces the hand-optimal
    candidate; other shapes keep the DAG transliteration (pack=1)."""
    nodes = machine_ir["nodes"]
    loads = [n for n in nodes if n.get("op") == "load"
             and str(n.get("type", "")).startswith("<")]
    if len(loads) != 64 or any(n.get("type") != "<8 x i8>" for n in loads):
        return None
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    if "uaddlp" not in intr or "vecreduce_add" not in intr:
        return None
    return len(loads) // 4  # 16


def _emit_hadamard_sa8d_natural(func_name, rows, reduce_tail="saddv"):
    """pack=2 lowering for natural 16-lane-row SA8D: each 16-pixel row is
    one z.h register, and every cadd/tbl/sums step processes the left and
    right 8x8 quadrants simultaneously, halving the upstream 128-bit
    instruction count (hand-optimal shape for sa8d16, 186 fused/MCA 73).

    Derived from the same Hadamard facts as the generic DAG path, but
    using the complex-add/tbl row transform and predicated max/accumulate
    instead of per-node NEON-bridge translation."""
    rows = int(rows)
    groups = rows // 8
    if groups < 1 or rows % 8:
        raise ValueError("hadamard natural lowering expects rows % 8 == 0")
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic hadamard recipe,",
        "// pack=2 natural 16-lane-row lowering)",
        "#include <arm_sve.h>",
        "",
        "static const uint16_t HAD_IDX16[16] =",
        "    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };",
        "",
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t sp1," % func_name,
        "                  const uint8_t* pix2, intptr_t sp2)",
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);",
        "",
        "    #define LD(r) svreinterpret_s16_u16(svsub_u16_x(                     \\",
        "        p16,                                                              \\",
        "        svld1ub_u16(p16, pix1 + (r) * sp1),                               \\",
        "        svld1ub_u16(p16, pix2 + (r) * sp2)))",
        "    #define ROWH(p)                                                       \\",
        "        p = svcadd_s16(p, p, 90);                                         \\",
        "        p = svtbl_s16(p, had_idx);                                        \\",
        "        p = svcadd_s16(p, p, 90);                                         \\",
        "        p = svtbl_s16(p, had_idx);                                        \\",
        "        p = svcadd_s16(p, p, 90);                                         \\",
        "        (void)0",
        "    #define SUMSUB(s, u, a, b) do {                                       \\",
        "        s = svadd_s16_x(p16, a, b);                                       \\",
        "        u = svsub_s16_x(p16, a, b);                                       \\",
        "    } while (0)",
        "    #define ABSSUB(s, u, a, b) do {                                       \\",
        "        s = svabs_s16_x(p16, svadd_s16_x(p16, a, b));                     \\",
        "        u = svabd_s16_x(p16, a, b);                                       \\",
        "    } while (0)",
    ]
    for r in range(rows):
        lines.append("    svint16_t r%d = LD(%d); ROWH(r%d);" % (r, r, r))
    lines.append("")
    lines.append("    svint16_t %s;" % ", ".join(
        "s%d" % i for i in range(rows)))
    lines.append("    svint16_t %s;" % ", ".join(
        "a%d" % i for i in range(rows)))
    lines.append("")
    lines.append("    // Column H level 1 (both quadrants per instruction).")
    for i in range(0, rows, 2):
        lines.append("    SUMSUB(s%d, s%d, r%d, r%d);"
                     % (i, i + 1, i, i + 1))
    lines.append("")
    lines.append("    // Column H levels 2+3 with abs (upstream pairing).")
    for g in range(groups):
        base = g * 8
        for lo, hi in ((0, 2), (1, 3), (4, 6), (5, 7)):
            lines.append("    ABSSUB(a%d, a%d, s%d, s%d);"
                         % (base + lo, base + hi, base + lo, base + hi))
    lines.append("")
    lines.append("    // max/accumulate: |x+y|+|x-y| = 2*max(|x|,|y|).")
    for g in range(groups):
        base = g * 8
        for i in range(4):
            lines.append("    svint16_t m%d = svmax_s16_x(p16, a%d, a%d);"
                         % (g * 4 + i, base + i, base + i + 4))
    lines.append("")
    lines.append("    // Per 8-row group: two t's pair the four maxima.")
    for g in range(groups):
        for i in range(2):
            lines.append("    svint16_t t%d = svadd_s16_x(p16, m%d, m%d);"
                         % (g * 2 + i, g * 4 + 2 * i,
                            g * 4 + 2 * i + 1))
    lines.append("")
    lines.append("    // Group totals, then one 16-lane across-sum.")
    for g in range(groups):
        lines.append("    svint16_t g%d = svadd_s16_x(p16, t%d, t%d);"
                     % (g, g * 2, g * 2 + 1))
    lines.append("")
    if reduce_tail == "saddv":
        lines.append("    // Per-group 16-lane sums (s32 scalar; lane values")
        lines.append("    // are non-negative and well below s32 overflow).")
        lines.append("    int32_t total = svaddv_s16(p16, g0);")
        for g in range(1, groups):
            lines.append("    total += svaddv_s16(p16, g%d);" % g)
    else:
        total_expr = "g0"
        for g in range(1, groups):
            total_expr = "svadd_s16_x(p16, %s, g%d)" % (total_expr, g)
        lines.append("    svint16_t s = %s;" % total_expr)
        lines.append("")
        lines.append("""\
    svuint64_t dot = svdot_u64(svdup_n_u64(0),
                               svreinterpret_u16_s16(s), svdup_n_u16(1));
    uint64_t total = svaddv_u64(svptrue_b64(), dot);
    return (int)((total + 1) >> 1);
}
""")
        return "\n".join(lines)
    lines.append("    return (int)((total + 1) >> 1);")
    lines.append("}")
    return "\n".join(lines) + "\n"


_HADAMARD_8X8_PACKED_PRE = r"""\
// Generated by tools/gen_sve2_emit.py (generic hadamard recipe,
// packed two-row SA8D 8x8 lowering)
#include <arm_sve.h>
#include <arm_neon.h>
#include <arm_neon_sve_bridge.h>

namespace {

static inline uint64x2_t udotq_u16(uint64x2_t acc, uint16x8_t a, uint16x8_t b)
{
    return svget_neonq_u64(svdot_u64(
        svset_neonq_u64(svundef_u64(), acc),
        svset_neonq_u16(svundef_u16(), a),
        svset_neonq_u16(svundef_u16(), b)));
}

static inline void sumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                               const int16x8_t a, const int16x8_t b)
{
    *sum = vaddq_s16(a, b);
    *sub = vsubq_s16(a, b);
}

static inline void abssumsubq_s16(int16x8_t *sum, int16x8_t *sub,
                                  const int16x8_t a, const int16x8_t b)
{
    *sum = vabsq_s16(vaddq_s16(a, b));
    *sub = vabdq_s16(a, b);
}

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };
static const uint16_t HAD_IDX_HI[16] =
    { 8, 9, 10, 11, 12, 13, 14, 15, 8, 9, 10, 11, 12, 13, 14, 15 };
static const uint16_t TBL_IDX02[16] =
    { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
static const uint16_t TBL_IDX13[16] =
    { 8, 9, 10, 11, 12, 13, 14, 15, 24, 25, 26, 27, 28, 29, 30, 31 };
static const uint16_t ROT_IDX[16] =
    { 8, 9, 10, 11, 12, 13, 14, 15, 0, 1, 2, 3, 4, 5, 6, 7 };

} // namespace

extern "C" int __FUNC__(const uint8_t* pix1, intptr_t stride_pix1,
                       const uint8_t* pix2, intptr_t stride_pix2)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t pg8 = svwhilelt_b16(0, 8);
    const svbool_t pg_hi = svnot_b_z(svptrue_b16(), pg8);
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);
    const svuint16_t hi_idx = svld1_u16(p16, HAD_IDX_HI);
    const svuint16_t idx02 = svld1_u16(p16, TBL_IDX02);
    const svuint16_t idx13 = svld1_u16(p16, TBL_IDX13);
    const svuint16_t rot_idx = svld1_u16(p16, ROT_IDX);

    // Two rows per 16-lane register. Predicated ld1ub addresses active
    // lanes by byte offset, so the high-half load points 8 bytes before
    // the target row to land pixels 0..7 in lanes 8..15.
    #define PACK(px, s, lo, hi)                                           \
        svsel_u16(pg_hi,                                                   \
                  svld1ub_u16(pg_hi, (px) + (hi) * (s) - 8),               \
                  svld1ub_u16(pg8, (px) + (lo) * (s)))
    #define ROW_H(pname, a_expr, b_expr)                                  \
        svint16_t pname = svreinterpret_s16_u16(                          \
            svsub_u16_x(p16, (a_expr), (b_expr)));                        \
        pname = svcadd_s16(pname, pname, 90);                             \
        pname = svtbl_s16(pname, had_idx);                                \
        pname = svcadd_s16(pname, pname, 90);                             \
        pname = svtbl_s16(pname, had_idx);                                \
        pname = svcadd_s16(pname, pname, 90);                             \
        (void)0

"""


_HADAMARD_8X8_ROW_PAIR = r"""\
    ROW_H(p0, PACK(pix1, stride_pix1, 0, 1), PACK(pix2, stride_pix2, 0, 1));
    ROW_H(p1, PACK(pix1, stride_pix1, 2, 3), PACK(pix2, stride_pix2, 2, 3));
    ROW_H(p2, PACK(pix1, stride_pix1, 4, 5), PACK(pix2, stride_pix2, 4, 5));
    ROW_H(p3, PACK(pix1, stride_pix1, 6, 7), PACK(pix2, stride_pix2, 6, 7));

"""


_HADAMARD_8X8_ROW_EVENPAIR = r"""\
    ROW_H(p0, PACK(pix1, stride_pix1, 0, 2), PACK(pix2, stride_pix2, 0, 2));
    ROW_H(p1, PACK(pix1, stride_pix1, 1, 3), PACK(pix2, stride_pix2, 1, 3));
    ROW_H(p2, PACK(pix1, stride_pix1, 4, 6), PACK(pix2, stride_pix2, 4, 6));
    ROW_H(p3, PACK(pix1, stride_pix1, 5, 7), PACK(pix2, stride_pix2, 5, 7));

"""


_HADAMARD_8X8_REDUCE_NEON_PAIR = r"""\
    int16x8_t diff0, diff1, diff2, diff3, diff4, diff5, diff6, diff7;
    diff0 = svget_neonq_s16(p0);
    diff1 = svget_neonq_s16(svtbl_s16(p0, hi_idx));
    diff2 = svget_neonq_s16(p1);
    diff3 = svget_neonq_s16(svtbl_s16(p1, hi_idx));
    diff4 = svget_neonq_s16(p2);
    diff5 = svget_neonq_s16(svtbl_s16(p2, hi_idx));
    diff6 = svget_neonq_s16(p3);
    diff7 = svget_neonq_s16(svtbl_s16(p3, hi_idx));

"""


_HADAMARD_8X8_REDUCE_NEON_EVENPAIR = r"""\
    int16x8_t diff0, diff1, diff2, diff3, diff4, diff5, diff6, diff7;
    diff0 = svget_neonq_s16(p0);
    diff1 = svget_neonq_s16(p1);
    diff2 = svget_neonq_s16(svtbl_s16(p0, hi_idx));
    diff3 = svget_neonq_s16(svtbl_s16(p1, hi_idx));
    diff4 = svget_neonq_s16(p2);
    diff5 = svget_neonq_s16(p3);
    diff6 = svget_neonq_s16(svtbl_s16(p2, hi_idx));
    diff7 = svget_neonq_s16(svtbl_s16(p3, hi_idx));

"""


_HADAMARD_8X8_REDUCE_NEON_TAIL = r"""\
    int16x8_t a0, a1, a2, a3, a4, a5, a6, a7;
    int16x8_t b0, b1, b2, b3, b4, b5, b6, b7;
    sumsubq_s16(&b0, &b1, diff0, diff1);
    sumsubq_s16(&b2, &b3, diff2, diff3);
    sumsubq_s16(&b4, &b5, diff4, diff5);
    sumsubq_s16(&b6, &b7, diff6, diff7);

    abssumsubq_s16(&a0, &a2, b0, b2);
    abssumsubq_s16(&a1, &a3, b1, b3);
    abssumsubq_s16(&a4, &a6, b4, b6);
    abssumsubq_s16(&a5, &a7, b5, b7);

    uint16x8_t max0 = vmaxq_u16(vreinterpretq_u16_s16(a0),
                                vreinterpretq_u16_s16(a4));
    uint16x8_t max1 = vmaxq_u16(vreinterpretq_u16_s16(a1),
                                vreinterpretq_u16_s16(a5));
    uint16x8_t max2 = vmaxq_u16(vreinterpretq_u16_s16(a2),
                                vreinterpretq_u16_s16(a6));
    uint16x8_t max3 = vmaxq_u16(vreinterpretq_u16_s16(a3),
                                vreinterpretq_u16_s16(a7));

    uint16x8_t sum0 = vaddq_u16(max0, max1);
    uint16x8_t sum1 = vaddq_u16(max2, max3);
    uint64x2_t sum = vdupq_n_u64(0);
    sum = udotq_u16(sum, sum0, vdupq_n_u16(1));
    sum = udotq_u16(sum, sum1, vdupq_n_u16(1));

    return (vaddvq_u64(sum) + 1) >> 1;
}
"""


_HADAMARD_8X8_REDUCE_SVE_LEVEL1_PAIR = r"""\
    svint16_t s0 = svtbl2_s16(svcreate2_s16(p0, p1), idx02);  // [r0 | r2]
    svint16_t s1 = svtbl2_s16(svcreate2_s16(p0, p1), idx13);  // [r1 | r3]
    svint16_t t01 = svadd_s16_x(p16, s0, s1);   // [b0 | b2]
    svint16_t u01 = svsub_s16_x(p16, s0, s1);   // [b1 | b3]
    svint16_t s2 = svtbl2_s16(svcreate2_s16(p2, p3), idx02);  // [r4 | r6]
    svint16_t s3 = svtbl2_s16(svcreate2_s16(p2, p3), idx13);  // [r5 | r7]
    svint16_t t23 = svadd_s16_x(p16, s2, s3);   // [b4 | b6]
    svint16_t u23 = svsub_s16_x(p16, s2, s3);   // [b5 | b7]

"""


_HADAMARD_8X8_REDUCE_SVE_LEVEL1_EVENPAIR = r"""\
    svint16_t t01 = svadd_s16_x(p16, p0, p1);   // [b0 | b2]
    svint16_t u01 = svsub_s16_x(p16, p0, p1);   // [b1 | b3]
    svint16_t t23 = svadd_s16_x(p16, p2, p3);   // [b4 | b6]
    svint16_t u23 = svsub_s16_x(p16, p2, p3);   // [b5 | b7]

"""


_HADAMARD_8X8_REDUCE_SVE_TAIL = r"""\
    svint16_t e0 = svtbl2_s16(svcreate2_s16(t01, t23), idx02); // [b0 | b4]
    svint16_t e1 = svtbl2_s16(svcreate2_s16(t01, t23), idx13); // [b2 | b6]
    svint16_t aabs = svabs_s16_x(p16, svadd_s16_x(p16, e0, e1));
    svint16_t ad = svabd_s16_x(p16, e0, e1);
    svint16_t f0 = svtbl2_s16(svcreate2_s16(u01, u23), idx02); // [b1 | b5]
    svint16_t f1 = svtbl2_s16(svcreate2_s16(u01, u23), idx13); // [b3 | b7]
    svint16_t babs = svabs_s16_x(p16, svadd_s16_x(p16, f0, f1));
    svint16_t bd = svabd_s16_x(p16, f0, f1);

    svint16_t m0 = svmax_s16_x(p16, aabs, svtbl_s16(aabs, rot_idx));
    svint16_t m2 = svmax_s16_x(p16, ad, svtbl_s16(ad, rot_idx));
    svint16_t m1 = svmax_s16_x(p16, babs, svtbl_s16(babs, rot_idx));
    svint16_t m3 = svmax_s16_x(p16, bd, svtbl_s16(bd, rot_idx));

    svint16_t s = svadd_s16_x(p16, svadd_s16_x(p16, m0, m1),
                              svadd_s16_x(p16, m2, m3));
    uint32_t total = svaddv_u32(svptrue_b32(),
                                svunpklo_u32(svreinterpret_u16_s16(s)));
    return (int)((total + 1) >> 1);
}
"""


def _hadamard_packed_8x8_shape(machine_ir):
    """SA8D 8x8 full-Hadamard seed shape: 16 <8 x i8> loads, uaddlv tail,
    and the <2 x i64> shuffle stage that distinguishes the full 8x8
    SA8D DAG from the 4x4-quad SATD DAG."""
    nodes = machine_ir["nodes"]
    loads = [n for n in nodes if n.get("op") == "load"
             and str(n.get("type", "")).startswith("<")]
    if len(loads) != 16 or any(n.get("type") != "<8 x i8>" for n in loads):
        return False
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    if "uaddlv" not in intr:
        return False
    return any(n.get("op") == "shuffle" and n.get("type") == "<2 x i64>"
               for n in nodes)


def _emit_hadamard_sa8d_8x8_packed(func_name, pack="pair", reduce="sve"):
    """pack=pair/evenpair lowering for the SA8D 8x8 seed. Two rows share
    one 16-lane z.h register; the selected tail either extracts to NEON
    (reduce=neon) or keeps rows packed and re-packs with svtbl2
    (reduce=sve)."""
    row = (_HADAMARD_8X8_ROW_EVENPAIR if pack == "evenpair"
           else _HADAMARD_8X8_ROW_PAIR)
    if reduce == "sve":
        level1 = (_HADAMARD_8X8_REDUCE_SVE_LEVEL1_EVENPAIR
                  if pack == "evenpair"
                  else _HADAMARD_8X8_REDUCE_SVE_LEVEL1_PAIR)
        tail = level1 + _HADAMARD_8X8_REDUCE_SVE_TAIL
    else:
        extract = (_HADAMARD_8X8_REDUCE_NEON_EVENPAIR
                   if pack == "evenpair"
                   else _HADAMARD_8X8_REDUCE_NEON_PAIR)
        tail = extract + _HADAMARD_8X8_REDUCE_NEON_TAIL
    return (_HADAMARD_8X8_PACKED_PRE + row + tail
            ).replace("__FUNC__", func_name)


def _hadamard_natural_satd16_rows(machine_ir):
    """SATD 16x16 seed shape: 32 <16 x i8> loads (16 rows x 2 planes),
    uaddlp + vecreduce_add tail, no <8 x i8> loads. This is the 4x4-quad
    SATD DAG for which the natural 16-lane lowering is well-formed."""
    nodes = machine_ir["nodes"]
    loads = [n for n in nodes if n.get("op") == "load"
             and str(n.get("type", "")).startswith("<")]
    if len(loads) != 32 or any(n.get("type") != "<16 x i8>" for n in loads):
        return None
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    if "uaddlp" not in intr or "vecreduce_add" not in intr:
        return None
    return len(loads) // 2  # 16


def _hadamard_natural_satd_wide8_rows(machine_ir):
    """SATD 16x4/16x8 seed shape: rows x 2 planes x 2 column halves all
    emitted as <8 x i8> loads (4 per row), with the uaddlv tail. The
    pack=2 axis is only present on width-16 SATD manifests, so this is
    not reachable from the 8-wide satd shapes."""
    nodes = machine_ir["nodes"]
    loads = [n for n in nodes if n.get("op") == "load"
             and str(n.get("type", "")).startswith("<")]
    if len(loads) not in (16, 32) or \
            any(n.get("type") != "<8 x i8>" for n in loads):
        return None
    intr = {n.get("intrinsic") for n in nodes
            if n.get("op") == "intrinsic"}
    if "uaddlv" not in intr:
        return None
    return len(loads) // 4  # 4 or 8


def _emit_hadamard_satd_wide_natural(func_name, rows=16):
    """pack=2 natural 16-lane lowering for SATD 16x{4,8,16}.

    Upstream processes groups of four rows as two 8-column halves. With
    one 16-lane z.h per row the same 4-point row transform (two
    svcadd+suffle stages) runs lane-wise across the full row; the column
    collapse becomes abs(sum)/abd pairs, svmax, and a per-group 16-lane
    sum. Group sums are added in u16 (diff +/-255 -> collapsed max
    <= 2040 per lane; rows/4 groups keep the total <= 8160) and reduced
    with svaddv_u16."""
    groups = max(1, int(rows) // 4)
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic hadamard recipe,",
        "// pack=2 natural SATD 16x%d lowering)" % rows,
        "#include <arm_sve.h>",
        "",
        "static const uint16_t HAD_IDX16[16] =",
        "    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };",
        "",
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t sp1," % func_name,
        "                  const uint8_t* pix2, intptr_t sp2)",
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);",
        "",
        "    #define LD(r) svreinterpret_s16_u16(svsub_u16_x(               \\",
        "        p16,                                                      \\",
        "        svld1ub_u16(p16, pix1 + (r) * sp1),                       \\",
        "        svld1ub_u16(p16, pix2 + (r) * sp2)))",
        "    #define ROWH4(p)                                               \\",
        "        p = svcadd_s16(p, p, 90);                                 \\",
        "        p = svtbl_s16(p, had_idx);                                \\",
        "        p = svcadd_s16(p, p, 90);                                 \\",
        "        (void)0",
        "",
        "    svuint16_t total = svdup_n_u16(0);",
        "    for (int g = 0; g < %d; g++)" % groups,
        "    {",
        "        svint16_t r0 = LD(g * 4 + 0); ROWH4(r0);",
        "        svint16_t r1 = LD(g * 4 + 1); ROWH4(r1);",
        "        svint16_t r2 = LD(g * 4 + 2); ROWH4(r2);",
        "        svint16_t r3 = LD(g * 4 + 3); ROWH4(r3);",
        "        svint16_t a0 = svabs_s16_x(p16, svadd_s16_x(p16, r0, r1));",
        "        svint16_t d0 = svabd_s16_x(p16, r0, r1);",
        "        svint16_t a1 = svabs_s16_x(p16, svadd_s16_x(p16, r2, r3));",
        "        svint16_t d1 = svabd_s16_x(p16, r2, r3);",
        "        svint16_t m0 = svmax_s16_x(p16, a0, a1);",
        "        svint16_t m1 = svmax_s16_x(p16, d0, d1);",
        "        svint16_t gs = svadd_s16_x(p16, m0, m1);",
        "        total = svadd_u16_x(p16, total,",
        "                            svreinterpret_u16_s16(gs));",
        "    }",
        "    return (int)svaddv_u16(p16, total);",
        "}",
    ]
    return "\n".join(lines) + "\n"


_HADAMARD_SATD8_PACKED_TEMPLATE = r"""\
// Generated by tools/gen_sve2_emit.py (generic hadamard recipe,
// pack=2 packed SATD 8x__ROWS__ lowering)
#include <arm_sve.h>

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

extern "C" int __FUNC__(const uint8_t* pix1, intptr_t sp1,
                  const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svbool_t pg8 = svwhilelt_b16(0, 8);
    const svbool_t pg_hi = svnot_b_z(svptrue_b16(), pg8);
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);

    #define PACK(px, s, lo, hi)                                           \
        svsel_u16(pg_hi,                                                   \
                  svld1ub_u16(pg_hi, (px) + (hi) * (s) - 8),               \
                  svld1ub_u16(pg8, (px) + (lo) * (s)))
    #define PD(pname, lo, hi)                                             \
        svint16_t pname = svreinterpret_s16_u16(                          \
            svsub_u16_x(p16, PACK(pix1, sp1, lo, hi),                     \
                         PACK(pix2, sp2, lo, hi)));                       \
        ROWH4(pname)
    #define ROWH4(p)                                                      \
        p = svcadd_s16(p, p, 90);                                        \
        p = svtbl_s16(p, had_idx);                                       \
        p = svcadd_s16(p, p, 90);                                        \
        (void)0

    svuint16_t total = svdup_n_u16(0);
__STAGES__
    return (int)svaddv_u16(p16, total);
}
"""


def _hadamard_satd_template_shape(machine_ir):
    """Parse satd8_neon<W,H> from the seed function name (present for all
    current satd MachineIR seeds). Used to route width-8 packed lowering
    vs width-16 natural-row lowering without colliding on load counts."""
    m = re.search(r"satd8_neon<(\d+),\s*(\d+)>",
                  machine_ir.get("function") or "")
    if not m:
        return None
    return int(m.group(1)), int(m.group(2))


def _emit_hadamard_satd8_packed_natural(func_name, rows=8):
    """pack=2 lowering for SATD 8x{8,16}: pack two vertical 4-row groups
    into the low/high halves of one z.h register, run the 4-point row
    transform lane-wise in each half (HAD_IDX16 has no cross-half moves),
    collapse columns with abs(sum)/abd + svmax, and reduce the packed
    per-group sums with svaddv_u16."""
    stages = rows // 8
    stage_lines = []
    for q in range(stages):
        lo = q * 4
        hi = rows // 2 + q * 4
        stage_lines.append("    {")
        stage_lines.append(
            "        // rows %d..%d in lanes 0..7, rows %d..%d in 8..15"
            % (lo, lo + 3, hi, hi + 3))
        for k in range(4):
            stage_lines.append("        PD(p%d, %d, %d);"
                               % (k, lo + k, hi + k))
        stage_lines += [
            "        svint16_t a0 = svabs_s16_x(p16, svadd_s16_x(p16, p0, p1));",
            "        svint16_t d0 = svabd_s16_x(p16, p0, p1);",
            "        svint16_t a1 = svabs_s16_x(p16, svadd_s16_x(p16, p2, p3));",
            "        svint16_t d1 = svabd_s16_x(p16, p2, p3);",
            "        svint16_t m0 = svmax_s16_x(p16, a0, a1);",
            "        svint16_t m1 = svmax_s16_x(p16, d0, d1);",
            "        svint16_t gs = svadd_s16_x(p16, m0, m1);",
            "        total = svadd_u16_x(p16, total,",
            "                            svreinterpret_u16_s16(gs));",
            "    }",
        ]
    return (_HADAMARD_SATD8_PACKED_TEMPLATE
            .replace("__FUNC__", func_name)
            .replace("__ROWS__", str(rows))
            .replace("__STAGES__", "\n".join(stage_lines)))


_HADAMARD_SATD_WIDE32_TEMPLATE = r"""\
// Generated by tools/gen_sve2_emit.py (generic hadamard recipe,
// pack=2 natural SATD 32x__ROWS__ lowering)
#include <arm_sve.h>

static const uint16_t HAD_IDX16[16] =
    { 0, 2, 4, 6, 1, 3, 5, 7, 8, 10, 12, 14, 9, 11, 13, 15 };

extern "C" int __FUNC__(const uint8_t* pix1, intptr_t sp1,
                  const uint8_t* pix2, intptr_t sp2)
{
    const svbool_t p16 = svptrue_b16();
    const svuint16_t had_idx = svld1_u16(p16, HAD_IDX16);

    #define LD(cg, r) svreinterpret_s16_u16(svsub_u16_x(                \
        p16,                                                            \
        svld1ub_u16(p16, pix1 + (r) * sp1 + (cg) * 16),                 \
        svld1ub_u16(p16, pix2 + (r) * sp2 + (cg) * 16)))
    #define ROWH4(p)                                                    \
        p = svcadd_s16(p, p, 90);                                      \
        p = svtbl_s16(p, had_idx);                                     \
        p = svcadd_s16(p, p, 90);                                      \
        (void)0

    uint32_t total = 0;
    for (int cg = 0; cg < __UNITS__; cg++)
    {
        for (int g = 0; g < __GROUPS__; g++)
        {
            svint16_t r0 = LD(cg, g * 4 + 0); ROWH4(r0);
            svint16_t r1 = LD(cg, g * 4 + 1); ROWH4(r1);
            svint16_t r2 = LD(cg, g * 4 + 2); ROWH4(r2);
            svint16_t r3 = LD(cg, g * 4 + 3); ROWH4(r3);
            svint16_t a0 = svabs_s16_x(p16, svadd_s16_x(p16, r0, r1));
            svint16_t d0 = svabd_s16_x(p16, r0, r1);
            svint16_t a1 = svabs_s16_x(p16, svadd_s16_x(p16, r2, r3));
            svint16_t d1 = svabd_s16_x(p16, r2, r3);
            svint16_t m0 = svmax_s16_x(p16, a0, a1);
            svint16_t m1 = svmax_s16_x(p16, d0, d1);
            svint16_t gs = svadd_s16_x(p16, m0, m1);
            total += svaddv_u16(p16, svreinterpret_u16_s16(gs));
        }
    }
    return (int)total;
}
"""


def _emit_hadamard_satd_multiunit_natural(func_name, rows, units):
    """pack=2 natural lowering for SATD (16*units)xH: each 16-lane column
    group is reduced per 4-row group into a scalar u32 accumulator, so
    the total is exact for any registered height."""
    return (_HADAMARD_SATD_WIDE32_TEMPLATE
            .replace("__FUNC__", func_name)
            .replace("__ROWS__", str(rows))
            .replace("__UNITS__", str(units))
            .replace("__GROUPS__", str(max(1, rows // 4))))


def emit_hadamard(machine_ir, func_name, combo=None):
    """Straight-line transliteration of the sa8d 8x8 Hadamard DAG to SVE2
    ACLE (docs/40 §7 recipe protocol; naive pack=1, correctness first).

    Data is kept in the low 8 lanes of 16-lane s16 registers (inactive
    lanes are zeroed by predicated loads); only the final reduction is
    predicated to the 8 active lanes. NEON 8-lane trn1/trn2 maps to
    svzip1/svtrn2 of the 16-lane SVE vectors (low-8-lane equivalence).

    Layout axis `pack`: 1 = per-node DAG transliteration (correctness
    anchor); 2 = natural 16-lane-row SA8D lowering for the detected
    16x16 four-quadrant shape (hand-optimal candidate shape).
    """
    pack = (combo or {}).get("pack", 1)
    if isinstance(pack, str) and pack.isdigit():
        pack = int(pack)
    if pack in ("pair", "evenpair"):
        if not _hadamard_packed_8x8_shape(machine_ir):
            raise ValueError(
                "hadamard: pack=pair/evenpair lowering requires the sa8d "
                "8x8 full-Hadamard MachineIR shape")
        return _emit_hadamard_sa8d_8x8_packed(
            func_name, pack, (combo or {}).get("reduce", "sve"))
    if pack == 2:
        rows = _hadamard_natural_sa8d_rows(machine_ir)
        if rows is not None:
            return _emit_hadamard_sa8d_natural(
                func_name, rows, (combo or {}).get("reduce_tail", "saddv"))
        rows = _hadamard_natural_satd16_rows(machine_ir)
        if rows is not None:
            return _emit_hadamard_satd_wide_natural(func_name, rows)
        shape = _hadamard_satd_template_shape(machine_ir)
        if shape is not None:
            width, height = shape
            if width == 16 and height in (4, 8, 16, 32, 64):
                return _emit_hadamard_satd_wide_natural(func_name, height)
            if width in (32, 48, 64) and height in (8, 16, 24, 32, 48, 64):
                return _emit_hadamard_satd_multiunit_natural(
                    func_name, height, width // 16)
            if width == 8 and height in (8, 16, 32):
                return _emit_hadamard_satd8_packed_natural(
                    func_name, height)
        raise ValueError(
            "hadamard: pack=2 natural lowering requires a detected "
            "sa8d 16x16, satd 16x16, width-16 satd, or width-8 satd "
            "8x8/8x16 MachineIR shape")
    nodes = machine_ir["nodes"]
    nd = {}
    for n in nodes:
        nd[n.get("dst")] = n

    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic hadamard recipe)",
        "#include <arm_sve.h>",
        "#include <arm_neon.h>",
        "#include <arm_neon_sve_bridge.h>",
        "#include <stdint.h>",
        "",
        "extern \"C\" int %s(const uint8_t* pix1, intptr_t sa,"
        " const uint8_t* pix2, intptr_t sb)" % func_name,
        "{",
        "    const svbool_t pg8 = svwhilelt_b8((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg16b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const svbool_t pg8h = svwhilelt_b16((uint32_t)0, (uint32_t)8);",
        "    const svbool_t pg4w = svwhilelt_b32((uint32_t)0, (uint32_t)4);",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t pg4 = svwhilelt_b16((uint32_t)0, (uint32_t)4);",
        "    static const uint16_t ROT4[16] ="
        " { 4, 5, 6, 7, 0, 1, 2, 3, 4, 5, 6, 7, 0, 1, 2, 3 };",
        "    const svuint16_t rot4 = svld1_u16(p16, ROT4);",
    ]
    env = {}
    vtypes = {}
    counter = [0]

    def var(dst):
        if dst not in env:
            env[dst] = "v%d" % counter[0]
            counter[0] += 1
        return env[dst]

    def setvar(dst, ctype):
        vtypes[var(dst)] = ctype

    def as_s16(v):
        return v if vtypes.get(v) == "svint16_t" \
            else "svreinterpret_s16_u16(%s)" % v

    def as_u16(v):
        return v if vtypes.get(v) == "svuint16_t" \
            else "svreinterpret_u16_s16(%s)" % v

    def as_s32(v):
        return v if vtypes.get(v) == "svint32_t" \
            else "svreinterpret_s32_u32(%s)" % v

    def as_u32(v):
        return v if vtypes.get(v) == "svuint32_t" \
            else "svreinterpret_u32_s32(%s)" % v

    def emit(node, line):
        lines.append("    %s" % line)

    # scalar address env: (var, coef) over the stride symbols.
    for name, sym in (("i_pix1", "sa"), ("i_pix2", "sb"),
                      ("%i_pix1", "sa"), ("%i_pix2", "sb")):
        env[name] = (sym, 1)

    def stride_env(src):
        if src in ("i_pix1", "%i_pix1", "1"):
            return ("sa", 1)
        if src in ("i_pix2", "%i_pix2", "3"):
            return ("sb", 1)
        return None

    ptr_off = {}

    for n in nodes:
        op = n["op"]
        dst = n.get("dst")
        if op == "load":
            ptr = n["ptr"]
            base, coef, byte = ptr_off.get(ptr, (ptr, 0, 0))
            if base not in ("pix1", "pix2", "0", "2"):
                raise ValueError(
                    "hadamard: unknown load base %r" % base)
            abi = "pix1" if base in ("pix1", "0") else "pix2"
            stride = "sa" if abi == "pix1" else "sb"
            if n.get("type") in ("i8", "i16", "i32", "i64"):
                ctyp = {"i8": "uint8_t", "i16": "uint16_t",
                        "i32": "uint32_t",
                        "i64": "uint64_t"}[n["type"]]
                emit(n, "%s %s = *(const %s*)((const uint8_t*)%s +"
                     " %d * %s + %d);"
                     % (ctyp, var(dst), ctyp, abi, coef, stride, byte))
                setvar(dst, ctyp)
                continue
            t = "svuint8_t"
            pg = "pg8" if n.get("type") == "<8 x i8>" else "pg16b"
            if byte:
                emit(n, "%s %s = svld1_u8(%s, %s + %d * %s + %d);"
                     % (t, var(dst), pg, abi, coef, stride, byte))
            else:
                emit(n, "%s %s = svld1_u8(%s, %s + %d * %s);"
                     % (t, var(dst), pg, abi, coef, stride))
            setvar(dst, t)
        elif op == "addr":
            mi = re.search(r"i64\s+%([A-Za-z0-9._]+)", n["rhs"])
            mb = re.search(r"ptr\s+%([A-Za-z0-9._]+),", n["rhs"])
            mc = re.search(r"i64\s+(-?\d+)\s*$", n["rhs"])
            if not mb:
                raise ValueError("hadamard: non-dynamic addr %r" % n["rhs"])
            base = mb.group(1)
            root, prev, prevb = ptr_off.get(base, (base, 0, 0))
            if mc:
                ptr_off[dst] = (root, prev, prevb + int(mc.group(1)))
            else:
                if not mi:
                    raise ValueError("hadamard: addr without offset %r"
                                     % n["rhs"])
                coef = env.get(mi.group(1)) or stride_env(mi.group(1))
                if not isinstance(coef, tuple):
                    raise ValueError("hadamard: unresolved addr index %r"
                                     % mi.group(1))
                ptr_off[dst] = (root, prev + coef[1], prevb)
        elif op in ("shl", "mul"):
            src = n["src"][0]
            sv = env.get(src) or stride_env(src)
            if isinstance(sv, tuple):
                sym, coef = sv
                amt = n.get("amt") if op == "shl" else n.get("const")
                if amt is None:
                    raise ValueError("hadamard: non-const %s" % op)
                env[dst] = (sym, coef * (1 << amt) if op == "shl"
                            else coef * amt)
            else:
                raise ValueError("hadamard: unexpected %s on %r" % (op, src))
        elif op == "zext" and n.get("type") == "<8 x i16>":
            emit(n, "svuint16_t %s = svunpklo_u16(%s);"
                 % (var(dst), var(n["src"])))
            setvar(dst, "svuint16_t")
        elif op == "insertelement":
            srcs = n.get("src") or []
            idx = n.get("index", 0)
            if not srcs:
                raise ValueError("hadamard: empty insertelement")
            val = var(srcs[-1])
            if len(srcs) == 1:
                prev = "vdupq_n_u32(0)"
            else:
                prev = "svget_neonq_u32(%s)" % var(srcs[0])
            emit(n, "svuint32_t %s = svset_neonq_u32(svundef_u32(),"
                 " vsetq_lane_u32((uint32_t)%s, %s, %d));"
                 % (var(dst), val, prev, idx))
            setvar(dst, "svuint32_t")
        elif op in ("add", "sub") and str(n.get("type", "")).startswith("<"):
            vtype = n["type"]
            if vtype == "<8 x i16>":
                f = "svadd_s16_x(p16, %s, %s)" if op == "add" \
                    else "svsub_s16_x(p16, %s, %s)"
                t = "svint16_t"
            elif vtype == "<4 x i32>":
                f = "svadd_s32_x(p16, %s, %s)" if op == "add" \
                    else "svsub_s32_x(p16, %s, %s)"
                t = "svint32_t"
            else:
                raise ValueError("hadamard: unsupported vec %s %s"
                                 % (op, vtype))
            if vtype == "<4 x i32>":
                a, b = as_s32(var(n["src"][0])), as_s32(var(n["src"][1]))
            else:
                a, b = as_s16(var(n["src"][0])), as_s16(var(n["src"][1]))
            emit(n, "%s %s = %s;" % (t, var(dst), f % (a, b)))
            setvar(dst, t)
        elif op == "shuffle":
            vtype = n["type"]
            mask = n["mask"]
            if vtype == "<8 x i8>" and len(n.get("src") or []) == 1:
                src = var(n["src"][0])
                if tuple(mask) == (0, 1, 2, 3, 4, 5, 6, 7):
                    emit(n, "svuint8_t %s = svset_neonq_u8(svundef_u8(),"
                         " vcombine_u8(vget_low_u8(svget_neonq_u8(%s)),"
                         " vdup_n_u8(0)));" % (var(dst), src))
                    setvar(dst, "svuint8_t")
                    continue
                if tuple(mask) == (8, 9, 10, 11, 12, 13, 14, 15):
                    emit(n, "svuint8_t %s = svset_neonq_u8(svundef_u8(),"
                         " vcombine_u8(vget_high_u8(svget_neonq_u8(%s)),"
                         " vdup_n_u8(0)));" % (var(dst), src))
                    setvar(dst, "svuint8_t")
                    continue
            a, b = var(n["src"][0]), var(n["src"][1])
            fn = {
                "<8 x i16>": {
                    (0, 8, 2, 10, 4, 12, 6, 14): ("svtrn1_s16", "svint16_t"),
                    (1, 9, 3, 11, 5, 13, 7, 15): ("svtrn2_s16", "svint16_t"),
                },
                "<4 x i32>": {
                    (0, 4, 2, 6): ("svtrn1_s32", "svint32_t"),
                    (1, 5, 3, 7): ("svtrn2_s32", "svint32_t"),
                },
                "<2 x i64>": {
                    (0, 2): None,
                    (1, 3): None,
                },
            }.get(vtype, {})
            key = tuple(mask)
            if vtype == "<8 x i16>" and key == (0, 1, 2, 3, 8, 9, 10, 11):
                # concat low halves: [a0..a3, b0..b3]
                emit(n, "svint16_t %s = svsplice_s16(pg4, %s, %s);"
                     % (var(dst), a, b))
                setvar(dst, "svint16_t")
                continue
            if vtype == "<2 x i64>" and key in fn:
                # NEON 2x i64 trn = 4-s16 chunk moves; in SVE 8-of-16 lane
                # layout this is splice of the low 4 lanes (trn1) or of
                # lanes rotated by 4 (trn2).
                a64, b64 = a, b
                a16 = "svreinterpret_s16_s64(%s)" % a64
                b16 = "svreinterpret_s16_s64(%s)" % b64
                if key == (1, 3):
                    a16 = "svtbl_s16(%s, rot4)" % a16
                    b16 = "svtbl_s16(%s, rot4)" % b16
                emit(n, "svint64_t %s = svreinterpret_s64_s16("
                     "svsplice_s16(pg4, %s, %s));"
                     % (var(dst), a16, b16))
                setvar(dst, "svint64_t")
                continue
            if key not in fn or fn[key] is None:
                raise ValueError("hadamard: unhandled shuffle %s %r"
                                 % (vtype, mask))
            name, t = fn[key]
            emit(n, "%s %s = %s(%s, %s);"
                 % (t, var(dst), name, a, b))
            setvar(dst, t)
        elif op == "bitcast":
            st, dt = n.get("src_type"), n["type"]
            src = var(n["src"])
            if (st, dt) == ("<8 x i16>", "<2 x i64>"):
                emit(n, "svint64_t %s = svreinterpret_s64_s16(%s);"
                     % (var(dst), src))
                setvar(dst, "svint64_t")
            elif (st, dt) == ("<2 x i64>", "<8 x i16>"):
                emit(n, "svint16_t %s = svreinterpret_s16_s64(%s);"
                     % (var(dst), src))
                setvar(dst, "svint16_t")
            elif (st, dt) == ("<8 x i16>", "<4 x i32>"):
                emit(n, "svint32_t %s = svreinterpret_s32_s16(%s);"
                     % (var(dst), src))
                setvar(dst, "svint32_t")
            elif (st, dt) == ("<4 x i32>", "<8 x i16>"):
                emit(n, "svint16_t %s = svreinterpret_s16_s32(%s);"
                     % (var(dst), src))
                setvar(dst, "svint16_t")
            elif (st, dt) == ("<2 x i32>", "<8 x i8>"):
                emit(n, "svuint8_t %s = svreinterpret_u8_u32(%s);"
                     % (var(dst), src))
                setvar(dst, "svuint8_t")
            else:
                raise ValueError("hadamard: unhandled bitcast %s -> %s"
                                 % (st, dt))
        elif op == "intrinsic":
            name = n["intrinsic"]
            src = [var(s) for s in n["src"]]
            if name == "sabd":
                emit(n, "svint16_t %s = svabd_s16_x(p16, %s, %s);"
                     % (var(dst), as_s16(src[0]), as_s16(src[1])))
                setvar(dst, "svint16_t")
            elif name == "abs":
                emit(n, "svint16_t %s = svabs_s16_x(p16, %s);"
                     % (var(dst), as_s16(src[0])))
                setvar(dst, "svint16_t")
            elif name == "umax":
                emit(n, "svuint16_t %s = svmax_u16_x(p16,"
                     " svreinterpret_u16_s16(%s), svreinterpret_u16_s16(%s));"
                     % (var(dst), src[0], src[1]))
                setvar(dst, "svuint16_t")
            elif name == "uaddlv":
                emit(n, "uint16_t %s = svaddv_u16(pg8h,"
                     " %s);" % (var(dst), as_u16(src[0])))
                setvar(dst, "uint16_t")
            elif name == "uaddlp":
                emit(n, "svuint32_t %s = svset_neonq_u32(svundef_u32(),"
                     " vpaddlq_u16(svget_neonq_u16("
                     "svreinterpret_u16_s16(%s))));" % (var(dst), src[0]))
                setvar(dst, "svuint32_t")
            elif name == "vecreduce_add":
                emit(n, "uint32_t %s = svaddv_u32(pg4w, %s);"
                     % (var(dst), as_u32(src[0])))
                setvar(dst, "uint32_t")
            else:
                raise ValueError("hadamard: unhandled intrinsic %r" % name)
        elif op == "add" and n.get("type") == "i32":
            if n.get("const") is not None:
                emit(n, "uint32_t %s = %s + %d;"
                     % (var(dst), var(n["src"][0]), n["const"]))
            else:
                emit(n, "uint32_t %s = %s + %s;"
                     % (var(dst), var(n["src"][0]), var(n["src"][1])))
            setvar(dst, "uint32_t")
        elif op == "lshr" and n.get("type") == "i32":
            emit(n, "uint32_t %s = %s >> %d;"
                 % (var(dst), var(n["src"][0]), n.get("amt", 0)))
        elif op == "ret":
            emit(n, "return (int)%s;" % var(n["operand"]))
        else:
            raise ValueError("hadamard: unhandled op %r" % n)
    lines.append("}")
    return "\n".join(lines) + "\n"


def _emit_vertical_fir_native(rows, units, phases, func_name, acc_split):
    """sliding=3: the hand-optimal vertical pipeline, derived from the
    recipe facts only (16-lane rows, 8 taps, g_lumaFilter phases 1..3).

    Rows are loaded once into (rows+7) z.h registers with a widening
    svld1ub_u16 + sub 128; coefficient vectors are pre-built with svdup
    and shared by all rows. Two/four accumulators split the DC offset
    (8192/n_accs) and shorten the MLA dependency chain. Narrowing uses
    the native SVE2 svqrshrunb + svuzp1 pair (QEMU VL=256-correct for
    this shape; the NEON-bridge path remains for other recipes).
    """
    acc_split = int(acc_split or 1)
    n_accs = 2 if acc_split == 1 else 4
    n_rows = rows + 7
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic vertical-fir recipe,",
        "// sliding=3 native-softpipe lowering)",
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "static inline svint16_t vrow(const uint8_t* p, intptr_t st, int k,",
        "                             int u, svbool_t p16)",
        "{",
        "    svuint16_t w = svld1ub_u16(p16, p + k * st + u * 16);",
        "    // (b - 128) keeps 4-product s16 sums in range.",
        "    return svreinterpret_s16_u16(svsub_n_u16_x(p16, w, 128));",
        "}",
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        % func_name,
        "                   uint8_t* dst, intptr_t dstStride, int coeffIdx)",
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t p8b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ? coeffIdx : 2;",
    ]
    for k in range(8):
        lines.append("    const svint16_t c%d = svdup_n_s16("
                     "ph == 1 ? %d : (ph == 3 ? %d : %d));"
                     % (k, phases[0][k], phases[2][k], phases[1][k]))
    lines.append("    // DC offset 8192 split across the accumulators")
    lines.append("    // (%d accs -> %d each)." % (n_accs, 8192 // n_accs))
    lines.append("    const svint16_t off = svdup_n_s16(%d);"
                 % (8192 // n_accs))
    lines.append("    const uint8_t* rb = src - 3 * srcStride;")
    for i in range(min(8, n_rows)):
        for u in range(units):
            lines.append("    svint16_t v%d_%d = vrow(rb, srcStride, %d, %d,"
                         " p16);" % (i, u, i, u))
    lines.append("")
    for i in range(rows):
        if i + 8 < n_rows:
            for u in range(units):
                lines.append("    svint16_t v%d_%d = vrow(rb, srcStride,"
                             " %d, %d, p16);" % (i + 8, u, i + 8, u))
        for u in range(units):
            lines.append("    {")
            if acc_split == 1:
                accs = [("a0", (0, 2, 4, 6)), ("a1", (1, 3, 5, 7))]
            else:
                accs = [("a0", (0, 4)), ("a1", (1, 5)),
                        ("a2", (2, 6)), ("a3", (3, 7))]
            for name, taps in accs:
                lines.append("        svint16_t %s = off;" % name)
                for k in taps:
                    lines.append("        %s = svmla_s16_x(p16, %s, v%d_%d,"
                                 " c%d);" % (name, name, i + k, u, k))
            lines.append("        svint16_t pixels = %s;" % accs[0][0])
            for name, _ in accs[1:]:
                lines.append("        pixels = svadd_s16_x(p16, pixels, %s);"
                             % name)
            lines.append("        svuint8_t u8 = svqrshrunb_n_s16(pixels, 6);")
            lines.append("        svuint8_t uz = svuzp1_u8(u8, u8);")
            lines.append("        svst1_u8(p8b, dst + %d * dstStride + %d, uz);"
                         % (i, u * 16))
            lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def _emit_vertical_ps_native(rows, units, phases, func_name, acc_split):
    """Vertical pixel->short lowering: the hand-optimal vertical pipeline
    without the DC offset or u8 narrowing. The -IF_INTERNAL_OFFS constant
    cancels the 128 bias, so accumulators start at zero and the s16 lanes
    are stored directly."""
    acc_split = int(acc_split or 1)
    n_accs = 2 if acc_split == 1 else 4
    n_rows = rows + 7
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic vertical-ps recipe,",
        "// sliding native lowering)",
        "#include <arm_sve.h>",
        "#include <stdint.h>",
        "",
        "static inline svint16_t vrow(const uint8_t* p, intptr_t st, int k,",
        "                             int u, svbool_t p16)",
        "{",
        "    svuint16_t w = svld1ub_u16(p16, p + k * st + u * 16);",
        "    // (b - 128) keeps 4-product s16 sums in range.",
        "    return svreinterpret_s16_u16(svsub_n_u16_x(p16, w, 128));",
        "}",
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        % func_name,
        "                   int16_t* dst, intptr_t dstStride, int coeffIdx)",
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t p8b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const int ph = (coeffIdx >= 1 && coeffIdx <= 3) ? coeffIdx : 2;",
    ]
    for k in range(8):
        lines.append("    const svint16_t c%d = svdup_n_s16("
                     "ph == 1 ? %d : (ph == 3 ? %d : %d));"
                     % (k, phases[0][k], phases[2][k], phases[1][k]))
    lines.append("    const svint16_t off = svdup_n_s16(0);")
    lines.append("    const uint8_t* rb = src - 3 * srcStride;")
    for i in range(min(8, n_rows)):
        for u in range(units):
            lines.append("    svint16_t v%d_%d = vrow(rb, srcStride, %d, %d,"
                         " p16);" % (i, u, i, u))
    lines.append("")
    for i in range(rows):
        if i + 8 < n_rows:
            for u in range(units):
                lines.append("    svint16_t v%d_%d = vrow(rb, srcStride,"
                             " %d, %d, p16);" % (i + 8, u, i + 8, u))
        for u in range(units):
            lines.append("    {")
            if acc_split == 1:
                accs = [("a0", (0, 2, 4, 6)), ("a1", (1, 3, 5, 7))]
            else:
                accs = [("a0", (0, 4)), ("a1", (1, 5)),
                        ("a2", (2, 6)), ("a3", (3, 7))]
            for name, taps in accs:
                lines.append("        svint16_t %s = off;" % name)
                for k in taps:
                    lines.append("        %s = svmla_s16_x(p16, %s, v%d_%d,"
                                 " c%d);" % (name, name, i + k, u, k))
            lines.append("        svint16_t pixels = %s;" % accs[0][0])
            for name, _ in accs[1:]:
                lines.append("        pixels = svadd_s16_x(p16, pixels, %s);"
                             % name)
            lines.append("        svst1_s16(p16, dst + %d * dstStride + %d,"
                         " pixels);" % (i, u * 16))
            lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def _emit_vertical_fir_chroma_native(rows, units, phases, func_name):
    """sliding=3 native lowering for chroma 4-tap vertical (interp4vpp).

    Full-width 16-lane rows are rebuilt from the two 8-byte stores the
    seed emits per row. The 4-product s16 chain fits one accumulator; the
    hand-optimal 16x16 candidate (171 fused / MCA 96) is reproduced when
    units=1. `units` keeps the width=32 generalization well-formed."""
    taps = 4
    n_rows = rows + taps - 1
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic vertical-fir recipe,",
        "// sliding=3 chroma native lowering)",
        "#include <arm_sve.h>",
        "",
        "static const int8_t CHROMA_C[%d][%d] = {" % (len(phases), taps),
    ]
    for row in phases:
        lines.append("    { %s }," % ", ".join(str(v) for v in row))
    lines += [
        "};",
        "",
        "static inline svint16_t vrow(const uint8_t* p, intptr_t st, int k,",
        "                             int u, svbool_t p16)",
        "{",
        "    svuint16_t w = svld1ub_u16(p16, p + k * st + u * 16);",
        "    return svreinterpret_s16_u16(svsub_n_u16_x(p16, w, 128));",
        "}",
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride," % func_name,
        "                   uint8_t* dst, intptr_t dstStride, int coeffIdx)",
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t p16b = svwhilelt_b8((uint32_t)0, (uint32_t)16);",
        "    const int ph = coeffIdx & %d;" % (len(phases) - 1),
        "    const int8_t* cf = (const int8_t*)CHROMA_C[ph];",
    ]
    for k in range(taps):
        lines.append("    const svint16_t c%d = svdup_n_s16(cf[%d]);" % (k, k))
    lines += [
        "    const svint16_t zero = svdup_n_s16(0);",
        "    const uint8_t* rb = src - srcStride;",
    ]
    for k in range(taps + 1):
        for u in range(units):
            lines.append("    svint16_t v%d_%d = vrow(rb, srcStride, %d, %d, p16);"
                         % (k, u, k, u))
    for r in range(rows):
        if r + taps + 1 < n_rows:
            for u in range(units):
                lines.append("    svint16_t v%d_%d = vrow(rb, srcStride, %d, %d,"
                             " p16);" % (r + taps + 1, u, r + taps + 1, u))
        for u in range(units):
            lines.append("    {")
            lines.append("        svint16_t acc0 = svmla_s16_x(p16, zero, v%d_%d, c0);"
                         % (r, u))
            for k in range(1, taps):
                lines.append("        svint16_t acc%d = svmla_s16_x(p16, acc%d,"
                             " v%d_%d, c%d);" % (k, k - 1, r + k, u, k))
            lines.append("        svint16_t acc = svadd_n_s16_x(p16, acc%d, 8192);"
                         % (taps - 1))
            lines.append("        svuint8_t u8 = svqrshrunb_n_s16(acc, 6);")
            lines.append("        svuint8_t uz = svuzp1_u8(u8, u8);")
            lines.append("        svst1_u8(p16b, dst + %d * dstStride + %d, uz);"
                         % (r, u * 16))
            lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


def emit_vertical_ps(machine_ir, func_name, combo=None):
    """Generic vertical pixel->short 8-tap luma (interp8 vps) -> SVE2 ACLE.

    The seed wrapper name encodes WxH (constant-shape wrapper pattern,
    docs/40 §35); rows=H and units=W/16."""
    fn = machine_ir.get("function") or ""
    m = re.search(r"(\d+)x(\d+)", fn)
    if not m:
        m = re.search(r"interp_vert_ps_neon<\d+,\s*(\d+),\s*(\d+)>", fn)
        if not m:
            raise ValueError("vertical-ps: cannot derive shape from %r" % fn)
        width, height = int(m.group(1)), int(m.group(2))
    else:
        width, height = int(m.group(1)), int(m.group(2))
    if width % 16:
        raise ValueError("vertical-ps: width %d is not 16-lane aligned" % width)
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from extract_x265_constants import parse_int16_tables  # noqa: E402
    cpp = os.path.join(ROOT, "third_party/x265/source/common/constants.cpp")
    tables = parse_int16_tables(open(cpp).read())
    phases = tables["g_lumaFilter"]["rows"][1:4]
    return _emit_vertical_ps_native(
        height, width // 16, phases, func_name,
        (combo or {}).get("acc_split", 1))


def emit_vertical_fir(machine_ir, func_name, combo=None):
    """Generic vertical 8-tap FIR (interp8 vpp) -> SVE2 ACLE.

    Per output row the filter is lane-wise (all columns share the same
    vertical taps), so 16-lane s16 accumulators cover the row in 16-column
    groups. Taps: sum += sign(c_t) * widen(row_{y-3+t}) * |c_t|, then
    saturating rounding narrow (vqrshrun, NEON bridge) and 16-byte stores.
    Coefficients come from g_lumaFilter phases 1..3 (generic source) with
    runtime coeffIdx dispatch. Layout axis `sliding`: 0 = per-tap loads,
    1 = hoist all rows, 2 = 4-row-group rotating 11-register window.
    """
    nodes = machine_ir["nodes"]
    stores = [n for n in nodes if n.get("op") == "store"]
    addrs = {n["dst"]: n for n in nodes if n.get("op") == "addr"}
    aenv = {"1": ("sa", 1), "3": ("sb", 1)}
    aoff = {}
    for n in nodes:
        if n.get("op") in ("shl", "mul") and n.get("src") and \
                n["src"][0] in aenv:
            sym, coef = aenv[n["src"][0]]
            amt = n.get("amt") if n.get("op") == "shl" else n.get("const")
            if amt is not None:
                aenv[n["dst"]] = (sym, coef * (1 << amt)
                                  if n.get("op") == "shl" else coef * amt)
        elif n.get("op") == "addr":
            mb = re.search(r"ptr\s+%([A-Za-z0-9._]+),", n["rhs"])
            mi = re.search(r"i64\s+%([A-Za-z0-9._]+)", n["rhs"])
            if mb:
                base = mb.group(1)
                prev = aoff.get(base, (base, 0))[1]
                if mi and mi.group(1) in aenv:
                    aoff[n["dst"]] = (base, prev + aenv[mi.group(1)][1])
    maxrow = -1
    for s in stores:
        coef = aoff.get(s.get("ptr"), (s.get("ptr"), 0))[1]
        maxrow = max(maxrow, coef)
    rows = maxrow + 1 if maxrow >= 0 else len(stores)
    store_lanes = 8
    for s in stores:
        mm = re.match(r"<(\d+) x i\d+>", s.get("type", ""))
        if mm:
            store_lanes = max(store_lanes, int(mm.group(1)))
    lanes = store_lanes if store_lanes in (8, 16) else 8
    groups = max(1, store_lanes // 16)
    if rows > 0 and len(stores) % rows == 0:
        groups = len(stores) // rows
    if lanes == 8 and groups == 1:
        groups = 1  # 8-wide rows stored in one 8-byte store
    sys.path.insert(0, os.path.join(ROOT, "tools"))
    from extract_x265_constants import parse_int16_tables  # noqa: E402
    cpp = os.path.join(ROOT, "third_party/x265/source/common/constants.cpp")
    tables = parse_int16_tables(open(cpp).read())
    ir_text = json.dumps(machine_ir) if False else ""
    # 4-tap chroma (g_chromaFilterAbs8) vs 8-tap luma (g_lumaFilter).
    is_chroma = any("g_chromaFilter" in (n.get("rhs") or "")
                    for n in nodes)
    taps = 4 if is_chroma else 8
    off = taps // 2 - 1
    if is_chroma:
        phases = tables["g_chromaFilter"]["rows"]
    else:
        phases = tables["g_lumaFilter"]["rows"][1:4]
    ctable = ",\n".join(
        "        { %s }" % ", ".join(str(v) for v in row) for row in phases)
    sliding = int((combo or {}).get("sliding", 1) or 0)
    if is_chroma and sliding == 2:
        sliding = 1  # rotation window generalized for luma 8-tap only
    if sliding == 3:
        if is_chroma:
            if taps != 4:
                raise ValueError(
                    "vertical-fir: sliding=3 chroma native expects 4 taps")
            full_lanes = store_lanes * groups
            if full_lanes <= 0 or full_lanes % 16 != 0:
                raise ValueError(
                    "vertical-fir: sliding=3 chroma native expects "
                    "16-lane full rows (store_lanes=%d groups=%d)"
                    % (store_lanes, groups))
            return _emit_vertical_fir_chroma_native(
                rows, full_lanes // 16, phases, func_name)
        if taps != 8 or lanes != 16:
            raise ValueError(
                "vertical-fir: sliding=3 native softpipe is only defined "
                "for 8-tap luma with 16-lane row units")
        return _emit_vertical_fir_native(
            rows, groups, phases, func_name,
            (combo or {}).get("acc_split", 1))
    col = " + cg * %d" % lanes if groups > 1 else ""
    lines = [
        "// Generated by tools/gen_sve2_emit.py (generic vertical-fir recipe)",
        "#include <arm_sve.h>",
        "#include <arm_neon.h>",
        "#include <arm_neon_sve_bridge.h>",
        "#include <stdint.h>",
        "",
        "static const int16_t CTBL[%d][%d] = {" % (len(phases), taps),
        ctable,
        "};",
        "static const uint16_t IDX_HI8[16] ="
        " { 8, 9, 10, 11, 12, 13, 14, 15,"
        " 8, 9, 10, 11, 12, 13, 14, 15 };",
        "",
        "extern \"C\" void %s(const uint8_t* src, intptr_t srcStride,"
        " uint8_t* dst, intptr_t dstStride, int coeffIdx)" % func_name,
        "{",
        "    const svbool_t p16 = svptrue_b16();",
        "    const svbool_t pg = svwhilelt_b8((uint32_t)0, (uint32_t)%d);" % lanes,
        "    const int ph = %s;"
        % ("(coeffIdx >= 0 && coeffIdx <= %d) ? coeffIdx : 0"
           % (len(phases)-1) if is_chroma else
           "(coeffIdx >= 1 && coeffIdx <= 3) ? coeffIdx : 2"),
        "    const int16_t* cf = CTBL[ph %s];"
        % ("" if is_chroma else "- 1"),
        "    const svuint16_t hi8 = svld1_u16(p16, IDX_HI8);",
    ]
    if groups > 1:
        lines.append("    for (int cg = 0; cg < %d; cg++)" % groups)
        lines.append("    {")
    ind = "    " if groups > 1 else ""
    if sliding == 2 and rows % 4 == 0 and not is_chroma:
        rgroups = rows // 4
        for k in range(11):
            lines.extend([
                ind + "svuint8_t rr%d = svld1_u8(pg," % k,
                ind + "    src + (%d) * srcStride%s);" % (k - off, col),
                ind + "svint16_t w%d = svreinterpret_s16_u16(" % k,
                ind + "    svunpklo_u16(rr%d));" % k,
            ])
        for g in range(rgroups):
            lines.append(ind + "{")
            for o in range(4):
                lines.append(ind + "    svint16_t sum%d = svdup_n_s16(0);"
                             % o)
                for t in range(8):
                    lines.extend([
                        ind + "    int c%d_%d = cf[%d];" % (o, t, t),
                        ind + "    if (c%d_%d > 0)" % (o, t),
                        ind + "        sum%d = svmla_s16_x(p16, sum%d,"
                        " w%d, svdup_n_s16(c%d_%d));" % (o, o, o + t, o, t),
                        ind + "    else if (c%d_%d < 0)" % (o, t),
                        ind + "        sum%d = svmls_s16_x(p16, sum%d,"
                        " w%d, svdup_n_s16(-c%d_%d));" % (o, o, o + t, o, t),
                    ])
            for o in range(4):
                lines.extend([
                    ind + "    int16x8_t lo%d = svget_neonq_s16(sum%d);"
                    % (o, o),
                    ind + "    int16x8_t hi%d = svget_neonq_s16("
                    "svtbl_s16(sum%d, hi8));" % (o, o),
                    ind + "    uint8x16_t out%d = vcombine_u8("
                    "vqrshrun_n_s16(lo%d, 6),"
                    " vqrshrun_n_s16(hi%d, 6));" % (o, o, o),
                    ind + "    svst1_u8(pg, dst + %d * dstStride%s,"
                    " svset_neonq_u8(svundef_u8(), out%d));"
                    % (4 * g + o, col, o),
                ])
            if g < rgroups - 1:
                lines.extend([
                    ind + "    rr0 = rr4; rr1 = rr5; rr2 = rr6;"
                    " rr3 = rr7; rr4 = rr8; rr5 = rr9; rr6 = rr10;",
                    ind + "    w0 = w4; w1 = w5; w2 = w6; w3 = w7;"
                    " w4 = w8; w5 = w9; w6 = w10;",
                ])
                for k in range(7, 11):
                    lines.extend([
                        ind + "    rr%d = svld1_u8(pg,"
                        " src + (%d) * srcStride%s);"
                        % (k, 4 * g + 8 + k - 7, col),
                        ind + "    w%d = svreinterpret_s16_u16("
                        "svunpklo_u16(rr%d));" % (k, k),
                    ])
            lines.append(ind + "}")
    elif sliding:
        nrows = rows + taps - 1
        for k in range(nrows):
            lines.extend([
                ind + "svuint8_t rr%d = svld1_u8(pg," % k,
                ind + "    src + (%d) * srcStride%s);" % (k - off, col),
                ind + "svint16_t w%d = svreinterpret_s16_u16(" % k,
                ind + "    svunpklo_u16(rr%d));" % k,
            ])
        for r in range(rows):
            lines.append(ind + "{")
            lines.append(ind + "    svint16_t sum = svdup_n_s16(0);")
            for t in range(taps):
                lines.extend([
                    ind + "    int c%d = cf[%d];" % (t, t),
                    ind + "    if (c%d > 0)" % t,
                    ind + "        sum = svmla_s16_x(p16, sum, w%d,"
                    " svdup_n_s16(c%d));" % (r + t, t),
                    ind + "    else if (c%d < 0)" % t,
                    ind + "        sum = svmls_s16_x(p16, sum, w%d,"
                    " svdup_n_s16(-c%d));" % (r + t, t),
                ])
            lines.extend([
                ind + "    %s" % (
                    "uint8x16_t out = vcombine_u8("
                    "vqrshrun_n_s16(svget_neonq_s16(sum), 6),"
                    " vqrshrun_n_s16(svget_neonq_s16("
                    "svtbl_s16(sum, hi8)), 6));" if lanes == 16 else
                    "uint8x8_t out = vqrshrun_n_s16("
                    "svget_neonq_s16(sum), 6);"),
                ind + "    svst1_u8(pg, dst + %d * dstStride%s,"
                " svset_neonq_u8(svundef_u8(), %s));"
                % (r, col, "out" if lanes == 16 else
                   "vcombine_u8(out, vdup_n_u8(0))"),
                ind + "}",
            ])
    else:
        lines.append(ind + "for (int r = 0; r < %d; r++)" % rows)
        lines.append(ind + "{")
        lines.append(ind + "    svint16_t sum = svdup_n_s16(0);")
        lines.append(ind + "    for (int t = 0; t < %d; t++)" % taps)
        lines.append(ind + "    {")
        lines.append(ind + "        svint16_t w = svreinterpret_s16_u16(")
        lines.append(ind + "            svunpklo_u16(svld1_u8(pg,")
        lines.append(ind + "                src + (r - %d + t) * srcStride"
                     "%s)));" % (off, col))
        lines.append(ind + "        int c = cf[t];")
        lines.append(ind + "        if (c > 0)")
        lines.append(ind + "            sum = svmla_s16_x(p16, sum, w,")
        lines.append(ind + "                svdup_n_s16(c));")
        lines.append(ind + "        else if (c < 0)")
        lines.append(ind + "            sum = svmls_s16_x(p16, sum, w,")
        lines.append(ind + "                svdup_n_s16(-c));")
        lines.append(ind + "    }")
        lines.extend([
            ind + "    %s" % (
                "uint8x16_t out = vcombine_u8("
                "vqrshrun_n_s16(svget_neonq_s16(sum), 6),"
                " vqrshrun_n_s16(svget_neonq_s16("
                "svtbl_s16(sum, hi8)), 6));" if lanes == 16 else
                "uint8x8_t out = vqrshrun_n_s16("
                "svget_neonq_s16(sum), 6);"),
            ind + "    svst1_u8(pg, dst + r * dstStride%s,"
            " svset_neonq_u8(svundef_u8(), %s));"
            % (col, "out" if lanes == 16 else
               "vcombine_u8(out, vdup_n_u8(0))"),
            ind + "}",
        ])
    if groups > 1:
        lines.append("    }")
    lines.append("}")
    return "\n".join(lines) + "\n"


RECIPES = {
    "diff-sum": {
        "detect": detect_diff_sum,
        "emit": emit_diff_sum,
    },
    "hadamard": {"detect": detect_hadamard, "emit": emit_hadamard},
    "fir": {"detect": detect_fir, "emit": emit_fir},
    "vertical-fir": {"detect": detect_vertical_fir,
                     "emit": emit_vertical_fir},
    "vertical-ps": {"detect": detect_vertical_ps,
                    "emit": emit_vertical_ps},
    "fir-ps": {"detect": detect_fir_ps, "emit": emit_fir_ps},
}


def make_generic_emitter(kernel):
    """Return emit(combo) that derives the candidate from the MachineIR.
    Family detection is per-kernel but recipe-driven: no kernel-specific
    emitter code is written for a new member of a known family."""
    mi = _load_machine_ir(kernel)
    family = detect_family(mi)
    recipe = RECIPES.get(family)
    if recipe is None or recipe["emit"] is None:
        raise ValueError(
            "generic emitter: family %r has no lowering yet (kernel %s);"
            " add a recipe in tools/gen_sve2_emit.py RECIPES"
            % (family, kernel))

    manifest_path = os.path.join(ROOT, "kernels", kernel, "manifest.yaml")
    symbol = None
    if os.path.exists(manifest_path):
        man = yaml.safe_load(open(manifest_path))
        symbol = man.get("candidate", {}).get("symbol")

    def emit(combo):
        return recipe["emit"](mi, symbol or "dynopt_%s_sve2" % kernel, combo)
    return emit


def list_recipes():
    return sorted(RECIPES)
