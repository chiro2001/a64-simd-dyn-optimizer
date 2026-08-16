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
