"""DCT32 width-native SVE2 emitter (VL=256).

Reproduces opbase bit-exact, but with loop-based k-sections to give
the compiler more scheduling freedom (same approach as dct16 neon_bridge
which achieved 12.0% vs 18.5% permute_ratio for op895).

opbase structure:
  - pass1 (op_pass_4): 8 groups x 4 rows butterfly, shift=4
    - k=0,8,16,24: scalar K0 multiply (k=0,16 use EEEE; k=8,24 use EEEO)
    - k=1,3,...,31: svdot with CODD (16 iterations, unrolled in opbase)
    - k=2,6,...,30: svmul+svaddv with K2 (8 iterations)
    - k=4,12,20,28: svmul+svaddv with K4 (4 iterations)
  - pass2 (op_pass_11): same structure, shift=11
  - shared: op_pass_4(src, coef, stride) -> op_pass_11(coef, dst, 32)

Constants are extracted directly from the opbase source file to avoid
transcription errors.
"""

from __future__ import annotations

import os
import re

ROOT = os.path.dirname(os.path.dirname(os.path.dirname(
    os.path.abspath(__file__))))
OPBASE_PATH = os.path.join(ROOT, "kernels", "dct32", "candidates",
                           "best_sve2_opbase.cpp")


def _extract_constants(src_text):
    """Extract raw constant definitions from opbase source."""
    # Find each static const definition and extract it
    consts = {}
    for name in ['IDX_REV4S', 'IDX_04', 'IDX_47', 'IDX_8B', 'IDX_CF',
                 'IDX_LO8', 'C32', 'K4', 'K0', 'K2', 'CODD']:
        # Match: static const <type> <name>[...] = { ... };
        pattern = rf'(static const \w+ {name}\[[\d\]\[\s]*\]\s*=\s*\{{[^;]*\}};)'
        m = re.search(pattern, src_text, re.DOTALL)
        if m:
            consts[name] = m.group(1).strip()
        else:
            raise ValueError(f"Cannot extract constant {name} from opbase")
    return consts


def _get_constants():
    """Read and extract all constant blocks from opbase source."""
    with open(OPBASE_PATH) as f:
        src = f.read()
    return _extract_constants(src)


# --- Helper functions (same as opbase) ---
HELPERS = """\
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

static inline svint64_t revw_d64(svint64_t x)
{
    svint64_t r;
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


def emit_butterfly_row(row_idx, pass_num):
    """Emit butterfly computation for one row in a group."""
    p = f"_p{pass_num}"
    r = row_idx
    lines = []
    lines.append(f"    svint16_t lo_{r}{p} = svld1_s16(p16, src + (g * 4 + {r}) * stride);")
    lines.append(f"    svint16_t hi_{r}{p} = svld1_s16(p16, src + (g * 4 + {r}) * stride + 16);")
    lines.append(f"    svint16_t rv_{r}{p} = svrev_s16(hi_{r}{p});")
    lines.append(f"    svint16_t O_{r}{p} = svsub_s16_x(p16, lo_{r}{p}, rv_{r}{p});")
    lines.append(f"    svint32_t loa_{r}{p} = svunpklo_s32(lo_{r}{p});")
    lines.append(f"    svint32_t lob_{r}{p} = svunpkhi_s32(lo_{r}{p});")
    lines.append(f"    svint32_t rva_{r}{p} = svunpklo_s32(rv_{r}{p});")
    lines.append(f"    svint32_t rvb_{r}{p} = svunpkhi_s32(rv_{r}{p});")
    lines.append(f"    svint32_t Ea_{r}{p} = svadd_s32_x(p8s, loa_{r}{p}, rva_{r}{p});")
    lines.append(f"    svint32_t Eb_{r}{p} = svadd_s32_x(p8s, lob_{r}{p}, rvb_{r}{p});")
    lines.append(f"    svint32_t Erb_{r}{p} = svrev_s32(Eb_{r}{p});")
    lines.append(f"    svint32_t EE_{r}{p} = svadd_s32_x(p8s, Ea_{r}{p}, Erb_{r}{p});")
    lines.append(f"    svint32_t EO_{r}{p} = svsub_s32_x(p8s, Ea_{r}{p}, Erb_{r}{p});")
    lines.append(f"    svint16_t E16_{r}{p} = svadd_s16_x(p16, lo_{r}{p}, rv_{r}{p});")
    lines.append(f"    svint16_t E16r_{r}{p} = svrev_s16(E16_{r}{p});")
    lines.append(f"    svint16_t EO16_{r}{p} = svsub_s16_x(p16, E16_{r}{p}, E16r_{r}{p});")
    lines.append(f"    svint32_t EEr_{r}{p} = svrev_s32(EE_{r}{p});")
    lines.append(f"    svint32_t EEE_{r}{p} = svadd_s32_x(p8s, EE_{r}{p}, EEr_{r}{p});")
    lines.append(f"    svint32_t EEO_{r}{p} = svsub_s32_x(p8s, EE_{r}{p}, EEr_{r}{p});")
    lines.append(f"    svint32_t EEEr_{r}{p} = svtbl_s32(EEE_{r}{p}, rev4s);")
    lines.append(f"    svint32_t EEEE_{r}{p} = svadd_s32_x(p8s, EEE_{r}{p}, EEEr_{r}{p});")
    lines.append(f"    svint32_t EEEO_{r}{p} = svsub_s32_x(p8s, EEE_{r}{p}, EEEr_{r}{p});")
    return "\n".join(lines)


def emit_pass(shift, pass_num):
    """Emit a full pass function with loop-based k-sections."""
    p = f"_p{pass_num}"
    func_name = "op_pass_4" if pass_num == 1 else "op_pass_11"
    add_val = 8 if pass_num == 1 else 1024

    lines = []
    lines.append(f"static __attribute__((noinline)) void {func_name}(const int16_t* src, int16_t* dst, intptr_t stride)")
    lines.append("{")
    lines.append("    const svbool_t p16 = svptrue_b16();")
    lines.append("    const svbool_t p8s = svptrue_b32();")
    lines.append("    const svbool_t p64 = svptrue_b64();")
    lines.append("    const svbool_t pg4s = svwhilelt_b32(0, 4);")
    lines.append("    const svbool_t pg4h = svwhilelt_b16(0, 4);")
    lines.append("    const svbool_t pg2s = svwhilelt_b32(0, 2);")
    lines.append("    const svbool_t pg1s = svwhilelt_b32(0, 1);")
    lines.append("    const svint64_t zero64 = svdup_n_s64(0);")
    lines.append(f"    int add = {add_val};")
    lines.append("    const svuint32_t rev4s = svld1_u32(p8s, IDX_REV4S);")
    lines.append("    const svuint16_t i0 = svld1_u16(p16, IDX_04);")
    lines.append("    const svuint16_t i1 = svld1_u16(p16, IDX_47);")
    lines.append("    const svuint16_t i2 = svld1_u16(p16, IDX_8B);")
    lines.append("    const svuint16_t i3 = svld1_u16(p16, IDX_CF);")
    lines.append("    const svuint16_t ilo = svld1_u16(p16, IDX_LO8);")
    lines.append("")
    lines.append("    for (int g = 0; g < 8; g++)")
    lines.append("    {")
    for r in range(4):
        lines.append(emit_butterfly_row(r, pass_num))
        lines.append("")

    # k=0,8,16,24: scalar extraction + K0 multiply
    # k=0,16 use k0e (EEEE even); k=8,24 use k0o (EEEO odd)
    lines.append(f"        // k=0,8,16,24 (scalar K0, shift={shift})")
    for r in range(4):
        lines.append(f"        int32_t k0e_{r}{p} = svlastb_s32(pg1s, EEEE_{r}{p});")
        lines.append(f"        int32_t k0e_{r}{p}_1 = svlastb_s32(pg2s, EEEE_{r}{p});")
        lines.append(f"        int32_t k0o_{r}{p} = svlastb_s32(pg1s, EEEO_{r}{p});")
        lines.append(f"        int32_t k0o_{r}{p}_1 = svlastb_s32(pg2s, EEEO_{r}{p});")
    for ki in range(4):
        k_row = ki * 8  # 0, 8, 16, 24
        for r in range(4):
            if ki % 2 == 0:
                ev = f"k0e_{r}{p}"
                ev2 = f"k0e_{r}{p}_1"
            else:
                ev = f"k0o_{r}{p}"
                ev2 = f"k0o_{r}{p}_1"
            lines.append(
                f"        dst[{k_row} * 32 + g * 4 + {r}] = "
                f"(int16_t)((((int64_t)K0[{ki}][0] * {ev} + "
                f"(int64_t)K0[{ki}][1] * {ev2}) + add) >> {shift});"
            )
    lines.append("")

    # Odd-k (k=1,3,...,31): svtbl2 + svdot loop
    lines.append(f"        // k=1,3,...,31 (svdot with CODD, shift={shift})")
    lines.append(f"        svint16_t p0 = svtbl2_s16(svcreate2_s16(O_0{p}, O_1{p}), i0);")
    lines.append(f"        svint16_t q0 = svtbl2_s16(svcreate2_s16(O_2{p}, O_3{p}), i0);")
    lines.append(f"        svint16_t X0 = svtbl2_s16(svcreate2_s16(p0, q0), ilo);")
    lines.append(f"        svint16_t p1 = svtbl2_s16(svcreate2_s16(O_0{p}, O_1{p}), i1);")
    lines.append(f"        svint16_t q1 = svtbl2_s16(svcreate2_s16(O_2{p}, O_3{p}), i1);")
    lines.append(f"        svint16_t X1 = svtbl2_s16(svcreate2_s16(p1, q1), ilo);")
    lines.append(f"        svint16_t p2 = svtbl2_s16(svcreate2_s16(O_0{p}, O_1{p}), i2);")
    lines.append(f"        svint16_t q2 = svtbl2_s16(svcreate2_s16(O_2{p}, O_3{p}), i2);")
    lines.append(f"        svint16_t X2 = svtbl2_s16(svcreate2_s16(p2, q2), ilo);")
    lines.append(f"        svint16_t p3 = svtbl2_s16(svcreate2_s16(O_0{p}, O_1{p}), i3);")
    lines.append(f"        svint16_t q3 = svtbl2_s16(svcreate2_s16(O_2{p}, O_3{p}), i3);")
    lines.append(f"        svint16_t X3 = svtbl2_s16(svcreate2_s16(p3, q3), ilo);")
    lines.append("")
    lines.append("        for (int ki = 0; ki < 16; ki++)")
    lines.append("        {")
    lines.append("            svint16_t c0 = svld1_s16(p16, CODD[ki][0]);")
    lines.append("            svint16_t c1 = svld1_s16(p16, CODD[ki][1]);")
    lines.append("            svint16_t c2 = svld1_s16(p16, CODD[ki][2]);")
    lines.append("            svint16_t c3 = svld1_s16(p16, CODD[ki][3]);")
    lines.append("            svint64_t t0 = svdot_s64(zero64, X0, c0);")
    lines.append("            svint64_t t1 = svdot_s64(zero64, X1, c1);")
    lines.append("            svint64_t t2 = svdot_s64(zero64, X2, c2);")
    lines.append("            svint64_t t3 = svdot_s64(zero64, X3, c3);")
    lines.append("            svint64_t acc = svadd_s64_x(p64, t0, t1);")
    lines.append("            acc = svadd_s64_x(p64, acc, t2);")
    lines.append("            acc = svadd_s64_x(p64, acc, t3);")
    lines.append(f"            svint16_t rnd = svrshrnb_n_s32(svuzp1_s32(svreinterpret_s32_s64(acc), svreinterpret_s32_s64(acc)), {shift});")
    lines.append("            svint16_t nar = svuzp1_s16(rnd, rnd);")
    lines.append("            svst1_s16(pg4h, dst + (2 * ki + 1) * 32 + g * 4, nar);")
    lines.append("        }")
    lines.append("")

    # EO-k (k=2,6,...,30): svmul+svaddv loop
    lines.append(f"        // k=2,6,...,30 (EO x K2, shift={shift})")
    lines.append("        for (int ki = 0; ki < 8; ki++)")
    lines.append("        {")
    lines.append("            svint32_t kc = svld1_s32(p8s, K2[ki]);")
    for r in range(4):
        lines.append(
            f"            dst[(2 + 4 * ki) * 32 + g * 4 + {r}] = "
            f"(int16_t)((svaddv_s32(p8s, svmul_s32_x(p8s, EO_{r}{p}, kc)) + add) >> {shift});"
        )
    lines.append("        }")
    lines.append("")

    # EEO-k (k=4,12,20,28): svmul+svaddv loop
    lines.append(f"        // k=4,12,20,28 (EEO x K4, shift={shift})")
    lines.append("        for (int ki = 0; ki < 4; ki++)")
    lines.append("        {")
    lines.append("            svint32_t kc = svld1_s32(pg4s, K4[ki]);")
    for r in range(4):
        lines.append(
            f"            dst[(4 + 8 * ki) * 32 + g * 4 + {r}] = "
            f"(int16_t)((svaddv_s32(pg4s, svmul_s32_x(p8s, EEO_{r}{p}, kc)) + add) >> {shift});"
        )
    lines.append("        }")
    lines.append("    }")
    lines.append("}")

    return "\n".join(lines)


def emit_candidate():
    """Assemble full C++ file."""
    consts = _get_constants()

    parts = []
    parts.append("// Generated by optimizer/ir/dct32_wide_sve2.py -- do not edit by hand.")
    parts.append("// Loop-based k-sections for compiler scheduling freedom.")
    parts.append("// Constants extracted from best_sve2_opbase.cpp to ensure bit-exactness.")
    parts.append("#include <arm_sve.h>")
    parts.append("#include <cstdint>")
    parts.append("")

    # Emit index arrays
    for name in ['IDX_REV4S', 'IDX_04', 'IDX_47', 'IDX_8B', 'IDX_CF', 'IDX_LO8']:
        parts.append(consts[name])
    parts.append("")

    # Helpers
    parts.append(HELPERS)

    # Coefficient tables
    for name in ['C32', 'K4', 'K0', 'K2', 'CODD']:
        parts.append(consts[name])
    parts.append("")

    # Pass functions
    parts.append(emit_pass(4, 1))
    parts.append("")
    parts.append(emit_pass(11, 2))
    parts.append("")

    # Entry point
    parts.append("""extern "C" void dynopt_dct32_sve2_shared(const int16_t* src, int16_t* dst, intptr_t stride)
{
    int16_t coef[32 * 32];
    op_pass_4(src, coef, stride);
    op_pass_11(coef, dst, 32);
}""")

    return "\n".join(parts)


if __name__ == "__main__":
    out = os.path.join(ROOT, "kernels", "dct32", "candidates",
                       "best_wide_sve2_loop.cpp")
    with open(out, "w") as f:
        f.write(emit_candidate())
    print(f"wrote {out}")
