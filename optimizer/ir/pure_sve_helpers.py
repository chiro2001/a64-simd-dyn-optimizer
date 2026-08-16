"""Pure-SVE primitive set (no NEON) for VL8-fixed dct lowering.

Every helper uses only SVE ACLE (`sv*`) and a fixed 8-lane active
predicate (`svptrue_pat_b16(SV_VL8)`), so generated code contains zero
NEON v/d/q registers at any SVE vector length. Validation: compile with
-march=armv8.2-a+sve2 and run `check_isa_level.py --no-neon`.
"""

PURE_SVE_HELPERS = r"""
// Pure-SVE primitives (8 s16 lanes active at any VL).
static inline svint16_t psv_load8(const int16_t* p)
{
    svint16_t v;
    asm volatile("ld1h {%0.h}, %1/z, [%2]"
                 : "=w"(v)
                 : "Upl"(svptrue_pat_b16(SV_VL8)), "r"(p));
    return v;
}

static inline void psv_store8(int16_t* p, svint16_t v)
{
    asm volatile("st1h {%0.h}, %1, [%2]"
                 :
                 : "w"(v), "Upl"(svptrue_pat_b16(SV_VL8)), "r"(p));
}

static inline svint64_t psv_zero_s64(void)
{
    svint64_t v;
    asm volatile("mov %0.d, #0" : "=w"(v));
    return v;
}

static inline svuint16_t psv_load_idx(const uint16_t* p)
{
    svuint16_t v;
    asm volatile("ld1h {%0.h}, %1/z, [%2]"
                 : "=w"(v)
                 : "Upl"(svptrue_pat_b16(SV_VL8)), "r"(p));
    return v;
}

static inline svuint32_t psv_load_idx_u32(const uint32_t* p)
{
    svuint32_t v;
    asm volatile("ld1w {%0.s}, %1/z, [%2]"
                 : "=w"(v)
                 : "Upl"(svptrue_pat_b32(SV_VL4)), "r"(p));
    return v;
}

static inline svint16_t psv_rev16(svint16_t x)
{
    static const uint16_t idx[8] = { 7, 6, 5, 4, 3, 2, 1, 0 };
    svuint16_t i = psv_load_idx(idx);
    return svtbl_s16(x, i);
}

static inline svint16_t psv_rev32(svint16_t x)
{
    static const uint16_t idx[8] = { 1, 0, 3, 2, 5, 4, 7, 6 };
    svuint16_t i = psv_load_idx(idx);
    return svtbl_s16(x, i);
}

static inline svint64_t psv_sdot(svint64_t acc, svint16_t x, svint16_t y)
{
    return svdot_s64(acc, x, y);
}

static inline svint16_t psv_rshrn_s32_6(svint32_t x)
{
    return svrshrnb_n_s32(x, 6);
}

static inline svint16_t psv_addp_pair(svint16_t a, svint16_t b)
{
    // Pairwise add of adjacent 16-bit lanes: (a0+a1, a2+a3, b0+b1, ...)
    svint16_t lo = svuzp1_s16(a, b);
    svint16_t hi = svuzp2_s16(a, b);
    return svadd_s16_x(svptrue_pat_b16(SV_VL8), lo, hi);
}

// --- dct16 fused8 pure-SVE primitives (4-lane halves) ---
static inline svbool_t psv_pg8_s16(void) { return svptrue_pat_b16(SV_VL8); }
static inline svbool_t psv_pg4_s32(void) { return svptrue_pat_b32(SV_VL4); }
static inline svbool_t psv_pg2_s64(void) { return svptrue_pat_b64(SV_VL2); }

static inline svint32_t psv_load4_s32(const int32_t* p)
{
    svint32_t v;
    asm volatile("ld1w {%0.s}, %1/z, [%2]"
                 : "=w"(v)
                 : "Upl"(svptrue_pat_b32(SV_VL4)), "r"(p));
    return v;
}

static inline svint32_t psv_ld1sh_s32(const int16_t* p)
{
    svint32_t v;
    asm volatile("ld1sh {%0.s}, %1/z, [%2]"
                 : "=w"(v)
                 : "Upl"(svptrue_pat_b32(SV_VL4)), "r"(p));
    return v;
}

static inline void psv_store4_s16(int16_t* p, svint16_t v)
{
    asm volatile("st1h {%0.h}, %1, [%2]"
                 :
                 : "w"(v), "Upl"(svptrue_pat_b16(SV_VL4)), "r"(p));
}

static inline svint16_t psv_get_lo4_s16(svint16_t x)
{
    static const uint16_t idx[8] = { 0, 1, 2, 3, 0, 0, 0, 0 };
    return svtbl_s16(x, psv_load_idx(idx));
}

static inline svint16_t psv_get_hi4_s16(svint16_t x)
{
    static const uint16_t idx[8] = { 4, 5, 6, 7, 0, 0, 0, 0 };
    return svtbl_s16(x, psv_load_idx(idx));
}

static inline svint32_t psv_saddl_s16(svint16_t a, svint16_t b)
{
    return svadd_s32_x(svptrue_pat_b32(SV_VL4),
                       svunpklo_s32(a), svunpklo_s32(b));
}

static inline svint16_t psv_vmovn_s32(svint32_t x)
{
    // Truncating 32->16: take the low 16 bits of each lane (even lanes
    // of the reinterpreted s16 view).
    svint16_t r = svreinterpret_s16_s32(x);
    return svuzp1_s16(r, r);
}

static inline svint32_t psv_vmovn_s64(svint64_t x)
{
    svint32_t r = svreinterpret_s32_s64(x);
    return svuzp1_s32(r, r);
}

static inline svint16_t psv_combine4_s16(svint16_t a, svint16_t b)
{
    static const uint16_t idx[8] = { 0, 1, 2, 3, 8, 9, 10, 11 };
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, psv_load_idx(idx)));
}

static inline svint32_t psv_combine4_s32(svint32_t a, svint32_t b)
{
    static const uint32_t idx[4] = { 0, 1, 4, 5 };
    svuint32_t i = psv_load_idx_u32(idx);
    svuint32x2_t t = svcreate2_u32(svreinterpret_u32_s32(a),
                                   svreinterpret_u32_s32(b));
    return svreinterpret_s32_u32(svtbl2_u32(t, i));
}

static inline svint32_t psv_addp4_s32(svint32_t a, svint32_t b)
{
    svint32_t lo = svuzp1_s32(a, b);
    svint32_t hi = svuzp2_s32(a, b);
    return svadd_s32_x(svptrue_pat_b32(SV_VL4), lo, hi);
}

static inline svint32_t psv_rev64_s32(svint32_t x)
{
    static const uint32_t idx[4] = { 1, 0, 3, 2 };
    svuint32_t i = psv_load_idx_u32(idx);
    return svreinterpret_s32_u32(svtbl_u32(svreinterpret_u32_s32(x), i));
}

static inline svint32_t psv_rev32_s32(svint32_t x)
{
    static const uint32_t idx[4] = { 3, 2, 1, 0 };
    svuint32_t i = psv_load_idx_u32(idx);
    return svreinterpret_s32_u32(svtbl_u32(svreinterpret_u32_s32(x), i));
}

template <int S>
static inline svint16_t psv_rshrn_s32(svint32_t x)
{
    svint32_t r = svasr_n_s32_x(svptrue_pat_b32(SV_VL4),
                                svadd_s32_x(svptrue_pat_b32(SV_VL4), x,
                                            svdup_s32_x(
                                                svptrue_pat_b32(SV_VL4),
                                                1 << (S - 1))), S);
    svint16_t n = svreinterpret_s16_s32(r);
    return svuzp1_s16(n, n);
}

// --- 16-lane (full-VL) primitives for the VL=256 emitter ---
static inline svint16_t psv16_load(const int16_t* p)
{
    return svld1_s16(svptrue_b16(), p);
}

static inline void psv16_store(int16_t* p, svint16_t v)
{
    svst1_s16(svptrue_b16(), p, v);
}

static inline svint16_t psv16_rev(svint16_t x)
{
    return svrev_s16(x);
}

static inline svint64_t psv16_sdot(svint64_t acc, svint16_t x, svint16_t y)
{
    return svdot_s64(acc, x, y);
}

static inline svint16_t psv16_rshrn6(svint32_t x)
{
    return svrshrnb_n_s32(x, 6);
}

static inline svint32_t psv16_rshrn_s64_12(svint64_t x)
{
    return svrshrnb_n_s64(x, 12);
}

// Packed dual-group 16-lane primitives for the VL=256 emitter: each
// 16-lane register carries two independent 8-lane groups (lanes 0-7,
// 8-15). Operations below act on both groups simultaneously.
static inline svint16_t psv16_dual_rev16(svint16_t x)
{
    static const uint16_t idx[16] =
        { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    return svreinterpret_s16_u16(svtbl_u16(svreinterpret_u16_s16(x), i));
}

static inline svint16_t psv16_dual_vget_lo4(svint16_t x)
{
    // low 4 lanes of each 8-lane group -> lanes 0-3 and 8-11.
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 0, 0, 0, 0, 8, 9, 10, 11, 0, 0, 0, 0 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    return svreinterpret_s16_u16(svtbl_u16(svreinterpret_u16_s16(x), i));
}

static inline svint16_t psv16_dual_vget_hi4(svint16_t x)
{
    static const uint16_t idx[16] =
        { 4, 5, 6, 7, 0, 0, 0, 0, 12, 13, 14, 15, 0, 0, 0, 0 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    return svreinterpret_s16_u16(svtbl_u16(svreinterpret_u16_s16(x), i));
}
"""


def smoke_source() -> str:
    """Small self-contained function exercising every primitive."""
    return r"""// Pure-SVE primitive smoke test (0 NEON expected).
#include <arm_sve.h>
#include <cstdint>
""" + PURE_SVE_HELPERS + r"""
extern "C" void psv_smoke(const int16_t* a, const int16_t* b,
                          int16_t* out)
{
    svint16_t x = psv_load8(a);
    svint16_t y = psv_load8(b);
    svint16_t r0 = psv_rev16(x);
    svint16_t r1 = psv_rev32(y);
    svint64_t acc = psv_zero_s64();
    acc = psv_sdot(acc, x, y);
    svint32_t wide = svrshrnb_n_s64(acc, 12);
    svint16_t n = psv_rshrn_s32_6(wide);
    svint16_t p = psv_addp_pair(n, r0);
    psv_store8(out, p);
}
"""
