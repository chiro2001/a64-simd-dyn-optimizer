"""Generic dual-group 16-lane (VL=256) SVE2 lowering for width-
independent op DAGs.

Layout (at svcntb()==32):
  s16/u16 x8  : svint16_t/svuint16_t, 16 lanes: group0 = lanes 0-7,
                group1 = lanes 8-15.
  u16 x4      : svuint16_t, 8 active lanes (lanes 0-3 = g0, 4-7 = g1).
  s32/u32 x4  : svint32_t/svuint32_t, 8 lanes (g0 = 0-3, g1 = 4-7).
  s64 x2      : svint64_t, 4 lanes (g0 = 0-1, g1 = 2-3).
  u8 x16      : svuint8_t, 32 lanes (g0 = 0-15, g1 = 16-31).
  u8 x8       : svuint8_t, 16 active lanes (g0 = 0-7, g1 = 8-15).

Every DAG op is lowered to an SVE2 ACLE sequence that performs the same
operation on both groups simultaneously.  The final scalar reductions
(vaddv / vaddlv) sum over the whole register, which is exactly
g0 + g1, so the two groups can be independent computations (two rows,
two blocks, or lo/hi halves of one row).
"""

from __future__ import annotations

from typing import Callable, Dict, List, Optional, Tuple

from op_ir import Op


DUAL16_HELPERS = r"""
// ---- dual-group predicates (VL=256 fixed) ----
static inline svbool_t pg16_s16(void) { return svptrue_b16(); }
static inline svbool_t pg8_s16(void) { return svptrue_pat_b16(SV_VL8); }
static inline svbool_t pg16_u8(void) { return svptrue_pat_b8(SV_VL16); }
static inline svbool_t pg8_u8(void) { return svptrue_pat_b8(SV_VL8); }
static inline svbool_t pg32_u8(void) { return svptrue_b8(); }
static inline svbool_t pg_hi8_of16(void)
{
    return svnot_b_z(svptrue_pat_b8(SV_VL16), svptrue_pat_b8(SV_VL8));
}
static inline svbool_t pg_hi16_u8(void)
{
    return svnot_b_z(svptrue_b8(), svptrue_pat_b8(SV_VL16));
}
static inline svbool_t pg8_s32(void) { return svptrue_b32(); }
static inline svbool_t pg4_s64(void) { return svptrue_b64(); }

// Zero materialisation without NEON movi/fmov.
static inline svuint32_t psv16_zero_u32(void)
{
    svuint32_t v;
    asm volatile("mov %0.d, #0" : "=w"(v));
    return v;
}

static inline svint32_t psv16_zero_s32(void)
{
    svint32_t v;
    asm volatile("mov %0.d, #0" : "=w"(v));
    return v;
}

static inline svuint16_t psv16_zero_u16(void)
{
    return svreinterpret_u16_u32(psv16_zero_u32());
}

static inline svint16_t psv16_zero_s16(void)
{
    return svreinterpret_s16_s32(psv16_zero_s32());
}

static inline svuint8_t psv16_zero_u8(void)
{
    return svreinterpret_u8_u32(psv16_zero_u32());
}

// Full-register reductions without svaddv (which the compiler lowers to
// NEON UADDV): pairwise uzp1/uzp2 + add trees, final scalar via LASTA.
static inline uint32_t psv16_reduce_u32(svuint32_t x)
{
    svuint32_t p1 = svadd_u32_x(svptrue_b32(), svuzp1_u32(x, x),
                                svuzp2_u32(x, x));
    svuint32_t p2 = svadd_u32_x(svptrue_b32(), svuzp1_u32(p1, p1),
                                svuzp2_u32(p1, p1));
    svuint32_t p3 = svadd_u32_x(svptrue_b32(), svuzp1_u32(p2, p2),
                                svuzp2_u32(p2, p2));
    uint32_t total;
    __asm__("lasta %w0, %1, %2.s"
            : "=r"(total)
            : "Upl"(svptrue_b32()), "w"(p3));
    return total;
}

static inline int32_t psv16_reduce_s32(svint32_t x)
{
    svint32_t p1 = svadd_s32_x(svptrue_b32(), svuzp1_s32(x, x),
                               svuzp2_s32(x, x));
    svint32_t p2 = svadd_s32_x(svptrue_b32(), svuzp1_s32(p1, p1),
                               svuzp2_s32(p1, p1));
    svint32_t p3 = svadd_s32_x(svptrue_b32(), svuzp1_s32(p2, p2),
                               svuzp2_s32(p2, p2));
    int32_t total;
    __asm__("lasta %w0, %1, %2.s"
            : "=r"(total)
            : "Upl"(svptrue_b32()), "w"(p3));
    return total;
}

static inline uint32_t psv16_reduce_u16_u32(svuint16_t x)
{
    svuint32_t lo = svunpklo_u32(x);
    svuint32_t hi = svunpkhi_u32(x);
    return psv16_reduce_u32(svadd_u32_x(svptrue_b32(), lo, hi));
}

static inline int32_t psv16_reduce_s16_s32(svint16_t x)
{
    svint32_t lo = svunpklo_s32(x);
    svint32_t hi = svunpkhi_s32(x);
    return psv16_reduce_s32(svadd_s32_x(svptrue_b32(), lo, hi));
}

static inline int64_t psv16_reduce_s64(svint64_t x)
{
    svint64_t p1 = svadd_s64_x(svptrue_b64(), svuzp1_s64(x, x),
                               svuzp2_s64(x, x));
    svint64_t p2 = svadd_s64_x(svptrue_b64(), svuzp1_s64(p1, p1),
                               svuzp2_s64(p1, p1));
    int64_t total;
    __asm__("lasta %x0, %1, %2.d"
            : "=r"(total)
            : "Upl"(svptrue_b64()), "w"(p2));
    return total;
}

// Load 16 bytes from a into lanes 0-15 and 16 bytes from b into
// lanes 16-31 (two 16-lane groups in one 32-lane register).
static inline svuint8_t psv16_ld1b_pair(const uint8_t* a,
                                        const uint8_t* b)
{
    svuint8_t la = svld1_u8(pg16_u8(), a);
    svuint8_t lb = svld1_u8(pg16_u8(), b);
    // Second 32-byte table register starts at byte index 32.
    svuint8_t i = svadd_u8_x(svptrue_b8(), svindex_u8(0, 1),
                             svsel_u8(pg_hi16_u8(), svindex_u8(16, 0),
                                      psv16_zero_u8()));
    svuint8x2_t t = svcreate2_u8(la, lb);
    return svtbl2_u8(t, i);
}

static inline void psv16_st1b_pair(uint8_t* a, uint8_t* b, svuint8_t v)
{
    svst1_u8(pg16_u8(), a, v);
    svuint8_t i = svindex_u8(16, 1);
    svuint8_t hi = svtbl_u8(v, i);
    svst1_u8(pg16_u8(), b, hi);
}

// Load 16 bytes into lanes 0-15 and leave lanes 16-31 zero (single
// group populated).
static inline svuint8_t psv16_ld1b_zhi(const uint8_t* a)
{
    svuint8_t v = psv16_zero_u8();
    return svsel_u8(svptrue_pat_b8(SV_VL16),
                    svld1_u8(svptrue_pat_b8(SV_VL16), a), v);
}

// Load 16 bytes into lanes 16-31 with lanes 0-15 zero.
static inline svuint8_t psv16_ld1b_zlo(const uint8_t* b)
{
    // SVE predicated loads address element i at base + i; load the
    // row's 16 bytes into lanes 16-31 by using base = b - 16.
    const uint8_t* bp = (const uint8_t*)((uintptr_t)b - 16);
    return svsel_u8(pg_hi16_u8(), svld1_u8(pg_hi16_u8(), bp),
                    psv16_zero_u8());
}

// Load 8 bytes from a into lanes 0-7 and 8 bytes from b into lanes
// 8-15 (two 8-lane groups in one 16-active-lane u8 register).
static inline svuint8_t psv16_ld1b_pair8(const uint8_t* a,
                                         const uint8_t* b)
{
    // Inline-asm 8-lane loads: GCC lowers svld1(pg8) to NEON D
    // loads + NEON mov, which violates the zero-NEON gate.
    svuint8_t la, lb;
    asm volatile("ld1b {%0.b}, %1/z, [%2]"
                 : "=w"(la) : "Upl"(pg8_u8()), "r"(a));
    asm volatile("ld1b {%0.b}, %1/z, [%2]"
                 : "=w"(lb) : "Upl"(pg8_u8()), "r"(b));
    svuint8_t idx = svsel_u8(pg_hi8_of16(), svindex_u8(-8, 1),
                             psv16_zero_u8());
    svuint8_t shb = svtbl_u8(lb, idx);
    return svsel_u8(pg_hi8_of16(), shb, la);
}

static inline void psv16_st1b_pair8(uint8_t* a, uint8_t* b, svuint8_t v)
{
    svst1_u8(pg8_u8(), a, v);
    svuint8_t i = svsel_u8(pg8_u8(), svindex_u8(8, 1),
                           psv16_zero_u8());
    svuint8_t hi = svtbl_u8(v, i);
    svst1_u8(pg8_u8(), b, hi);
}

// Saturating narrowing of both s16 groups to u8 groups
// (explicit widening + rounding shift + clamp + low-byte extraction;
// QEMU's sqrshrunb/sqrshrunt .h->.b semantics duplicate lanes).
template <int S>
static inline svuint8_t psv16_dual_vqrshrun(svint16_t x)
{
    svint32_t lo = svunpklo_s32(x);
    svint32_t hi = svunpkhi_s32(x);
    svint32_t rnd = svindex_s32(1 << (S - 1), 0);
    svint32_t lo_r = svasr_n_s32_x(svptrue_b32(),
                                   svadd_s32_x(svptrue_b32(), lo, rnd), S);
    svint32_t hi_r = svasr_n_s32_x(svptrue_b32(),
                                   svadd_s32_x(svptrue_b32(), hi, rnd), S);
    svint32_t lo_c = svmin_s32_x(svptrue_b32(),
                                 svmax_s32_x(svptrue_b32(), lo_r,
                                             psv16_zero_s32()),
                                 svindex_s32(255, 0));
    svint32_t hi_c = svmin_s32_x(svptrue_b32(),
                                 svmax_s32_x(svptrue_b32(), hi_r,
                                             psv16_zero_s32()),
                                 svindex_s32(255, 0));
    svuint8_t idx = svindex_u8(0, 4);
    svuint8x2_t t = svcreate2_u8(svreinterpret_u8_s32(lo_c),
                                 svreinterpret_u8_s32(hi_c));
    return svtbl2_u8(t, idx);
}

// Safe 8-lane dual load: exactly 8 s16 lanes from a and from b, packed
// as group0 = a[0..7], group1 = b[0..7] (no full-VL over-read).
static inline svint16_t psv16_dual_load8_safe(const int16_t* a,
                                               const int16_t* b)
{
    svint16_t la = psv_load8(a);
    svint16_t lb = psv_load8(b);
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 4, 5, 6, 7, 16, 17, 18, 19, 20, 21, 22, 23 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(la),
                                   svreinterpret_u16_s16(lb));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

// Dual u8 diff load: group0 = p1a[0..7]-p2a[0..7], group1 =
// p1b[0..7]-p2b[0..7], widened to s16 (exactly 8 lanes per group, no
// full-VL over-read).
static inline svint16_t psv16_dual_load_diff8(const uint8_t* p1a,
                                               const uint8_t* p1b,
                                               const uint8_t* p2a,
                                               const uint8_t* p2b)
{
    // a1 lives in table register 0 (bytes 0-7), a2 in register 1
    // (bytes 32-39); lanes 8-15 need index 32..39.
    svuint8_t pi = svadd_u8_x(pg16_u8(), svindex_u8(0, 1),
                              svsel_u8(pg_hi8_of16(), svindex_u8(24, 0),
                                       psv16_zero_u8()));
    svuint8_t a1 = svld1_u8(pg8_u8(), p1a);
    svuint8_t a2 = svld1_u8(pg8_u8(), p1b);
    svuint8_t b1 = svld1_u8(pg8_u8(), p2a);
    svuint8_t b2 = svld1_u8(pg8_u8(), p2b);
    svuint8_t a = svtbl2_u8(svcreate2_u8(a1, a2), pi);
    svuint8_t b = svtbl2_u8(svcreate2_u8(b1, b2), pi);
    return svsub_s16_x(pg16_s16(),
                       svreinterpret_s16_u16(svunpklo_u16(a)),
                       svreinterpret_s16_u16(svunpklo_u16(b)));
}

// Load 8 bytes into only group0 (lanes 0-7), rest zero.
static inline svuint8_t psv16_split8_lo(const uint8_t* p)
{
    return svsel_u8(pg8_u8(), svld1_u8(pg8_u8(), p), psv16_zero_u8());
}

// Load 8 bytes into only group1 (lanes 8-15), rest zero.
static inline svuint8_t psv16_split8_hi(const uint8_t* p)
{
    svuint8_t t = svld1_u8(pg8_u8(), p);
    svuint8_t i = svsel_u8(pg_hi8_of16(), svindex_u8(-8, 1),
                           psv16_zero_u8());
    svuint8_t s = svtbl_u8(t, i);
    return svsel_u8(pg_hi8_of16(), s, psv16_zero_u8());
}

// Dual diff load that populates a single group (hi=0 -> g0, hi=1 ->
// g1), leaving the other group zero.
static inline svint16_t psv16_dual_load_diff8_split(const uint8_t* p1,
                                                     const uint8_t* p2,
                                                     int hi)
{
    svuint8_t a = hi ? psv16_split8_hi(p1) : psv16_split8_lo(p1);
    svuint8_t b = hi ? psv16_split8_hi(p2) : psv16_split8_lo(p2);
    return svsub_s16_x(pg16_s16(),
                       svreinterpret_s16_u16(svunpklo_u16(a)),
                       svreinterpret_s16_u16(svunpklo_u16(b)));
}

// Compact a 32-lane u8x16 dual value to a 16-active u8x8 dual value:
// out[0-7] = x[0-7] (g0 lo), out[8-15] = x[16-23] (g1 lo).
static inline svuint8_t psv16_vget_lo8_u8(svuint8_t x)
{
    svuint8_t i = svadd_u8_x(pg16_u8(), svindex_u8(0, 1),
                             svsel_u8(pg_hi8_of16(), svindex_u8(8, 0),
                                      psv16_zero_u8()));
    return svtbl_u8(x, i);
}

static inline svuint8_t psv16_vget_hi8_u8(svuint8_t x)
{
    svuint8_t i = svadd_u8_x(pg16_u8(), svindex_u8(0, 1),
                             svsel_u8(pg_hi8_of16(), svindex_u8(16, 0),
                                      svindex_u8(8, 0)));
    return svtbl_u8(x, i);
}

// Widen each 8-lane u8 group to u16 (svunpklo widens the low 16 lanes
// of the 32-lane u8 register, which are exactly both groups).
static inline svuint16_t psv16_dual_vabal_u8(svuint16_t acc,
                                             svuint8_t a, svuint8_t b)
{
    svuint16_t aw = svunpklo_u16(a);
    svuint16_t bw = svunpklo_u16(b);
    svuint16_t d = svabd_u16_x(pg16_s16(), aw, bw);
    return svadd_u16_x(pg16_s16(), acc, d);
}

static inline svuint16_t psv16_dual_vabdl_u8(svuint8_t a, svuint8_t b)
{
    svuint16_t aw = svunpklo_u16(a);
    svuint16_t bw = svunpklo_u16(b);
    return svabd_u16_x(pg16_s16(), aw, bw);
}

static inline svuint16_t psv16_dual_vmull_u8(svuint8_t a, svuint8_t b)
{
    return svmul_u16_x(pg16_s16(), svunpklo_u16(a), svunpklo_u16(b));
}

// Widening add/sub/mla for u8x8 dual values (explicit widening, since
// SVE svsubl/svmlal would only consume even lanes).
static inline svuint16_t psv16_dual_vsubl_u8(svuint8_t a, svuint8_t b)
{
    return svsub_u16_x(pg16_s16(), svunpklo_u16(a), svunpklo_u16(b));
}

static inline svuint16_t psv16_dual_vaddl_u8(svuint8_t a, svuint8_t b)
{
    return svadd_u16_x(pg16_s16(), svunpklo_u16(a), svunpklo_u16(b));
}

static inline svuint16_t psv16_dual_vmlal_u8(svuint16_t acc,
                                             svuint8_t a, svuint8_t b)
{
    return svadd_u16_x(pg16_s16(), acc,
                       svmul_u16_x(pg16_s16(), svunpklo_u16(a),
                                   svunpklo_u16(b)));
}

static inline svuint16_t psv16_dual_vmlsl_u8(svuint16_t acc,
                                             svuint8_t a, svuint8_t b)
{
    return svsub_u16_x(pg16_s16(), acc,
                       svmul_u16_x(pg16_s16(), svunpklo_u16(a),
                                   svunpklo_u16(b)));
}

// Combine two u8x8 dual values into one u8x16 dual (32-lane) value:
// out[0-7]=a.g0, out[8-15]=b.g0, out[16-23]=a.g1, out[24-31]=b.g1.
static inline svuint8_t psv16_combine_u8(svuint8_t a, svuint8_t b)
{
    // Table registers are 32 bytes at VL=256: a bytes 0-31, b bytes
    // 32-63.  out[0-7]=a.g0 (0..7), out[8-15]=b.g0 (32..39),
    // out[16-23]=a.g1 (8..15), out[24-31]=b.g1 (40..47).
    svbool_t p0 = svptrue_pat_b8(SV_VL8);
    svbool_t p8 = svnot_b_z(pg16_u8(), p0);
    // Comparison predicates: pattern-predicate ANDs miscompile under
    // GCC 16 / QEMU, comparisons are reliable.
    svuint8_t ix = svindex_u8(0, 1);
    svbool_t ge16 = svcmpge_u8(svptrue_b8(), ix, svindex_u8(16, 0));
    svbool_t lt24 = svcmplt_u8(svptrue_b8(), ix, svindex_u8(24, 0));
    svbool_t p16 = svand_b_z(svptrue_b8(), ge16, lt24);
    svbool_t p24 = svand_b_z(svptrue_b8(),
                             svcmpge_u8(svptrue_b8(), ix,
                                        svindex_u8(24, 0)),
                             pg_hi16_u8());
    svuint8_t i = svindex_u8(0, 1);
    i = svadd_u8_x(svptrue_b8(), i,
                   svsel_u8(p8, svindex_u8(24, 0), psv16_zero_u8()));
    i = svadd_u8_x(svptrue_b8(), i,
                   svsel_u8(p16, svindex_u8(-8, 0), psv16_zero_u8()));
    i = svadd_u8_x(svptrue_b8(), i,
                   svsel_u8(p24, svindex_u8(16, 0), psv16_zero_u8()));
    svuint8x2_t t = svcreate2_u8(a, b);
    return svtbl2_u8(t, i);
}

// u16x8 dual -> scalar: sum over both groups.
static inline uint32_t psv16_dual_vaddlv_u16(svuint16_t x)
{
    svuint32_t lo = svunpklo_u32(x);
    svuint32_t hi = svunpkhi_u32(x);
    return svaddv_u32(svptrue_b32(), lo)
         + svaddv_u32(svptrue_b32(), hi);
}

// u32x4 dual (8 active lanes) -> scalar u64: sum over both groups.
static inline uint64_t psv16_dual_vaddv_u32_u64(svuint32_t x)
{
    return (uint64_t)svaddv_u32(svptrue_b32(), x);
}

// u16x8 dual -> u32x4 dual via low-half widening (both groups).
static inline svuint32_t psv16_dual_vpaddl_u16(svuint16_t x)
{
    svuint32_t lo = svunpklo_u32(x);
    svuint32_t hi = svunpkhi_u32(x);
    svuint32_t plo = svadd_u32_x(svptrue_b32(), svuzp1_u32(lo, lo),
                                 svuzp2_u32(lo, lo));
    svuint32_t phi = svadd_u32_x(svptrue_b32(), svuzp1_u32(hi, hi),
                                 svuzp2_u32(hi, hi));
    static const uint32_t idx[8] = { 0, 1, 2, 3, 8, 9, 10, 11 };
    svuint32_t i = svld1_u32(svptrue_b32(), idx);
    svuint32x2_t t = svcreate2_u32(plo, phi);
    return svtbl2_u32(t, i);
}

// u16x8 dual + u16x8 dual -> u32x4 dual accumulate.
static inline svuint32_t psv16_dual_vpadal_u16(svuint32_t acc,
                                               svuint16_t x)
{
    return svadd_u32_x(svptrue_b32(), acc,
                       psv16_dual_vpaddl_u16(x));
}

// u8x16 dual (32 lanes) pairwise-accumulate into u16x8 dual.
static inline svuint16_t psv16_dual_vpadal_u8(svuint16_t acc,
                                              svuint8_t x)
{
    return svadalp_u16_x(pg16_s16(), acc, x);
}

// s8x16 dual pairwise-accumulate into s16x8 dual.
static inline svint16_t psv16_dual_vpadal_s8(svint16_t acc, svint8_t x)
{
    return svadalp_s16_x(pg16_s16(), acc, x);
}

// u16x4 dual (8 active lanes) -> u32x4 dual.
static inline svuint32_t psv16_dual_vmull_u16(svuint16_t a,
                                              svuint16_t b)
{
    return svmul_u32_x(svptrue_b32(), svunpklo_u32(a),
                       svunpklo_u32(b));
}

// Compact u16x8 dual to u16x4 dual: out[0-3]=x[0-3], out[4-7]=x[8-11].
static inline svuint16_t psv16_dual_vget_lo4_u16(svuint16_t x)
{
    // out[0-3]=x[0..3], out[4-7]=x[8..11].
    svuint16_t i = svadd_u16_x(
        pg8_s16(),
        svsel_u16(svnot_b_z(pg8_s16(), svptrue_pat_b16(SV_VL4)),
                  svindex_u16(-4, 1), svindex_u16(0, 1)),
        svsel_u16(svnot_b_z(pg8_s16(), svptrue_pat_b16(SV_VL4)),
                  svindex_u16(8, 0), psv16_zero_u16()));
    return svtbl_u16(x, i);
}

static inline svuint16_t psv16_dual_vget_hi4_u16(svuint16_t x)
{
    // out[0-3]=x[4..7], out[4-7]=x[12..15].
    svuint16_t i = svadd_u16_x(
        pg8_s16(),
        svsel_u16(svnot_b_z(pg8_s16(), svptrue_pat_b16(SV_VL4)),
                  svindex_u16(-4, 1), svindex_u16(0, 1)),
        svsel_u16(svnot_b_z(pg8_s16(), svptrue_pat_b16(SV_VL4)),
                  svindex_u16(12, 0), svindex_u16(4, 0)));
    return svtbl_u16(x, i);
}

// s16x8 dual trn helpers (group-local NEON TRN semantics).
static inline svint16_t psv16_dual_trn1_s16(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 0, 16, 2, 18, 4, 20, 6, 22,
          8, 24, 10, 26, 12, 28, 14, 30 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

static inline svint16_t psv16_dual_trn2_s16(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 1, 17, 3, 19, 5, 21, 7, 23,
          9, 25, 11, 27, 13, 29, 15, 31 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

static inline svint16_t psv16_dual_trn1_s32(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 0, 1, 16, 17, 4, 5, 20, 21,
          8, 9, 24, 25, 12, 13, 28, 29 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

static inline svint16_t psv16_dual_trn2_s32(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 2, 3, 18, 19, 6, 7, 22, 23,
          10, 11, 26, 27, 14, 15, 30, 31 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

static inline svint16_t psv16_dual_trn1_s64(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 0, 1, 2, 3, 16, 17, 18, 19,
          8, 9, 10, 11, 24, 25, 26, 27 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

static inline svint16_t psv16_dual_trn2_s64(svint16_t a, svint16_t b)
{
    static const uint16_t idx[16] =
        { 4, 5, 6, 7, 20, 21, 22, 23,
          12, 13, 14, 15, 28, 29, 30, 31 };
    svuint16_t i = svld1_u16(svptrue_b16(), idx);
    svuint16x2_t t = svcreate2_u16(svreinterpret_u16_s16(a),
                                   svreinterpret_u16_s16(b));
    return svreinterpret_s16_u16(svtbl2_u16(t, i));
}

// s16x8 dual pairwise add (a pairs in lanes 0-3, b pairs in 4-7,
// per group; the natural uzp1+uzp2+add already gives this layout).
static inline svint16_t psv16_dual_vpadd_s16(svint16_t a, svint16_t b)
{
    return svadd_s16_x(pg16_s16(), svuzp1_s16(a, b), svuzp2_s16(a, b));
}

// s32x4 dual pairwise add, then reorder to group layout.
static inline svint32_t psv16_dual_vpadd_s32(svint32_t a, svint32_t b)
{
    svint32_t s = svadd_s32_x(svptrue_b32(), svuzp1_s32(a, b),
                              svuzp2_s32(a, b));
    static const uint32_t idx[8] = { 0, 1, 4, 5, 2, 3, 6, 7 };
    svuint32_t i = svld1_u32(svptrue_b32(), idx);
    return svreinterpret_s32_u32(
        svtbl_u32(svreinterpret_u32_s32(s), i));
}

// s16x8 dual pairwise widen-add (vpaddl_s16 -> s32x4 dual).
static inline svint32_t psv16_dual_vpaddl_s16(svint16_t x)
{
    svint32_t lo = svunpklo_s32(x);
    svint32_t hi = svunpkhi_s32(x);
    svint32_t plo = svadd_s32_x(svptrue_b32(), svuzp1_s32(lo, lo),
                                svuzp2_s32(lo, lo));
    svint32_t phi = svadd_s32_x(svptrue_b32(), svuzp1_s32(hi, hi),
                                svuzp2_s32(hi, hi));
    static const uint32_t idx[8] = { 0, 1, 2, 3, 8, 9, 10, 11 };
    svuint32_t i = svld1_u32(svptrue_b32(), idx);
    svuint32x2_t t = svcreate2_u32(svreinterpret_u32_s32(plo),
                                   svreinterpret_u32_s32(phi));
    return svreinterpret_s32_u32(svtbl2_u32(t, i));
}

static inline svint32_t psv16_dual_vpadal_s16(svint32_t acc,
                                              svint16_t x)
{
    return svadd_s32_x(svptrue_b32(), acc,
                       psv16_dual_vpaddl_s16(x));
}
"""


class Schedule:
    """Per-family mapping from DAG loads/stores to dual memory pairs.

    Subclasses override the callbacks that are meaningful for their
    kernel; the generic emitter handles all compute ops.
    """

    def load_diff(self, em, attrs: Dict, out: str) -> str:
        raise NotImplementedError("load_diff schedule")

    def load_u8x16(self, em, attrs: Dict, out: str) -> str:
        raise NotImplementedError("load_u8x16 schedule")

    def load_u8x8(self, em, attrs: Dict, out: str) -> str:
        raise NotImplementedError("load_u8x8 schedule")

    def load32(self, em, attrs: Dict, out: str) -> str:
        raise NotImplementedError("load32 schedule")

    def store_u8x16(self, em, attrs: Dict, val: str) -> str:
        raise NotImplementedError("store_u8x16 schedule")

    def store_u8x8(self, em, attrs: Dict, val: str) -> str:
        raise NotImplementedError("store_u8x8 schedule")

    def store_sub32(self, em, attrs: Dict, vals: Tuple[str, str]) -> str:
        raise NotImplementedError("store_sub32 schedule")

    def store_add32(self, em, attrs: Dict, vals: Tuple[str, str]) -> str:
        raise NotImplementedError("store_add32 schedule")


_PERMUTE_HELPERS = {
    "trn1q_s16": "psv16_dual_trn1_s16",
    "trn2q_s16": "psv16_dual_trn2_s16",
    "trn1q_s32": "psv16_dual_trn1_s32",
    "trn2q_s32": "psv16_dual_trn2_s32",
    "trn1q_s64": "psv16_dual_trn1_s64",
    "trn2q_s64": "psv16_dual_trn2_s64",
}


def phase_of(op: Op) -> Optional[int]:
    """coeffIdx phase marker from the op tile id (interp8 family)."""
    for part in op.tile_id.split("."):
        if part.startswith("ph") and part[2:].isdigit():
            return int(part[2:])
    return None


class DualSve16Emitter:
    """Walk an annotated op DAG and emit dual-group SVE2 statements."""

    def __init__(self, ops: List[Op], schedule: Schedule):
        self.ops = ops
        self.sched = schedule
        self.env: Dict[str, Tuple[str, str]] = {}
        self.body: List[str] = []

    def _emit(self, op: Op, ctype: str, expr: str):
        self.body.append("    %s %s = %s;" % (ctype, op.out, expr))
        self.env[op.out] = (ctype, op.out)

    def _input(self, op: Op, i: int) -> str:
        return self.env[op.inputs[i]][1]

    def _cast_u16(self, name: str) -> str:
        ct, ex = self.env[name]
        if ct == "svint16_t":
            return "svreinterpret_u16_s16(%s)" % ex
        return ex

    def _cast_s16(self, name: str) -> str:
        ct, ex = self.env[name]
        if ct == "svuint16_t":
            return "svreinterpret_s16_u16(%s)" % ex
        return ex

    def alias(self, out: str, src: str):
        """Map op output to an existing dual value (no new statement)."""
        self.env[out] = self.env[src]

    def emit(self) -> str:
        for op in self.ops:
            kind = op.kind
            attrs = op.attrs
            ins = list(op.inputs)
            out = op.out
            if kind == "load_diff":
                expr = self.sched.load_diff(self, attrs, out)
                if out not in self.env:
                    self._emit(op, "svint16_t", expr)
            elif kind == "load_u8x16":
                expr = self.sched.load_u8x16(self, attrs, out)
                if out not in self.env:
                    self._emit(op, "svuint8_t", expr)
            elif kind == "load_u8x8":
                expr = self.sched.load_u8x8(self, attrs, out)
                if out not in self.env:
                    self._emit(op, "svuint8_t", expr)
            elif kind == "load32":
                expr = self.sched.load32(self, attrs, out)
                if out not in self.env:
                    self._emit(op, "svint32_t", expr)
            elif kind == "dup16":
                if attrs["value"] == 0:
                    expr = "psv16_zero_u16()"
                else:
                    expr = "svdup_u16_x(pg16_s16(), %d)" % attrs["value"]
                self._emit(op, "svuint16_t", expr)
            elif kind == "dup_u8":
                if attrs["value"] == 0:
                    expr = "psv16_zero_u8()"
                else:
                    expr = "svdup_u8_x(pg16_u8(), %d)" % attrs["value"]
                self._emit(op, "svuint8_t", expr)
            elif kind == "dup8":
                if attrs["value"] == 0:
                    expr = "psv16_zero_u8()"
                else:
                    expr = "svdup_u8_x(svptrue_b8(), %d)" % attrs["value"]
                self._emit(op, "svuint8_t", expr)
            elif kind == "dup32":
                if attrs["value"] == 0:
                    expr = "psv16_zero_u32()"
                else:
                    expr = "svdup_u32_x(svptrue_b32(), %d)" % attrs["value"]
                self._emit(op, "svuint32_t", expr)
            elif kind == "dup64":
                if attrs["value"] == 0:
                    expr = "psv_zero_s64()"
                else:
                    expr = "svdup_s64_x(svptrue_b64(), %d)" % attrs["value"]
                self._emit(op, "svint64_t", expr)
            elif kind == "vget":
                if attrs.get("elem") == "u16":
                    fn = ("psv16_dual_vget_lo4_u16"
                          if attrs["which"] == "lo"
                          else "psv16_dual_vget_hi4_u16")
                    self._emit(op, "svuint16_t", "%s(%s)"
                               % (fn, self._input(op, 0)))
                else:
                    fn = ("psv16_vget_lo8_u8"
                          if attrs["which"] == "lo"
                          else "psv16_vget_hi8_u8")
                    self._emit(op, "svuint8_t", "%s(%s)"
                               % (fn, self._input(op, 0)))
            elif kind in ("add", "sub", "vadd_u16", "vadd_u32"):
                elem = attrs.get("elem")
                if elem in ("u16",) or kind == "vadd_u16":
                    ct, fn = "svuint16_t", ("svadd_u16_x"
                                            if kind in ("add", "vadd_u16")
                                            else "svsub_u16_x")
                    pg = "pg16_s16()"
                    a = self._cast_u16(ins[0])
                    b = self._cast_u16(ins[1])
                elif elem == "u32" or kind == "vadd_u32":
                    ct, fn = "svuint32_t", "svadd_u32_x"
                    pg = "svptrue_b32()"
                    a, b = self._input(op, 0), self._input(op, 1)
                elif elem in ("s16",):
                    ct, fn = "svint16_t", ("svadd_s16_x"
                                           if kind == "add"
                                           else "svsub_s16_x")
                    pg = "pg16_s16()"
                    a, b = self._input(op, 0), self._input(op, 1)
                else:
                    raise ValueError("add/sub elem %s" % elem)
                self._emit(op, ct, "%s(%s, %s, %s)" % (fn, pg, a, b))
            elif kind == "permute":
                pk = attrs["kind"]
                helper = _PERMUTE_HELPERS.get(pk)
                if helper is None:
                    raise ValueError("dual permute %s" % pk)
                self._emit(op, "svint16_t", "%s(%s, %s)"
                           % (helper, self._input(op, 0),
                              self._input(op, 1)))
            elif kind == "abs":
                self._emit(op, "svint16_t", "svabs_s16_x(pg16_s16(), %s)"
                           % self._input(op, 0))
            elif kind == "abd":
                self._emit(op, "svint16_t",
                           "svabd_s16_x(pg16_s16(), %s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "max":
                self._emit(op, "svuint16_t",
                           "svmax_u16_x(pg16_s16(), %s, %s)"
                           % (self._cast_u16(ins[0]),
                              self._cast_u16(ins[1])))
            elif kind == "vabal":
                self._emit(op, "svuint16_t",
                           "psv16_dual_vabal_u8(%s, %s, %s)"
                           % (self._input(op, 0), self._input(op, 1),
                              self._input(op, 2)))
            elif kind == "vabdl_u8":
                self._emit(op, "svuint16_t",
                           "psv16_dual_vabdl_u8(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vmull_u8":
                self._emit(op, "svuint16_t",
                           "psv16_dual_vmull_u8(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vmull_u16":
                self._emit(op, "svuint32_t",
                           "psv16_dual_vmull_u16(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vpaddl":
                self._emit(op, "svuint32_t",
                           "psv16_dual_vpaddl_u16(%s)"
                           % self._cast_u16(ins[0]))
            elif kind == "vpaddl_u16":
                self._emit(op, "svuint32_t",
                           "psv16_dual_vpaddl_u16(%s)"
                           % self._cast_u16(ins[0]))
            elif kind == "vpaddl_s16":
                self._emit(op, "svint32_t",
                           "psv16_dual_vpaddl_s16(%s)"
                           % self._input(op, 0))
            elif kind == "vpadal":
                self._emit(op, "svuint32_t",
                           "psv16_dual_vpadal_u16(%s, %s)"
                           % (self._input(op, 0),
                              self._cast_u16(ins[1])))
            elif kind == "vpadal_u16":
                self._emit(op, "svuint32_t",
                           "psv16_dual_vpadal_u16(%s, %s)"
                           % (self._input(op, 0),
                              self._cast_u16(ins[1])))
            elif kind == "vpadal_s16":
                self._emit(op, "svint32_t",
                           "psv16_dual_vpadal_s16(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vpadal_u8":
                self._emit(op, "svuint16_t",
                           "psv16_dual_vpadal_u8(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vpadal_s8":
                self._emit(op, "svint16_t",
                           "psv16_dual_vpadal_s8(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vpadd_s16":
                self._emit(op, "svint16_t",
                           "psv16_dual_vpadd_s16(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "vpadd_s32":
                self._emit(op, "svint32_t",
                           "psv16_dual_vpadd_s32(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind in ("vaddv", "vaddv_u32"):
                self._emit(op, "uint32_t", "psv16_reduce_u32(%s)"
                           % self._input(op, 0))
            elif kind == "vaddv_s16":
                self._emit(op, "int32_t", "psv16_reduce_s16_s32(%s)"
                           % self._input(op, 0))
            elif kind == "vaddv_s32":
                self._emit(op, "int32_t", "psv16_reduce_s32(%s)"
                           % self._input(op, 0))
            elif kind == "vaddv_s64":
                self._emit(op, "int64_t", "psv16_reduce_s64(%s)"
                           % self._input(op, 0))
            elif kind == "vaddlv":
                expr = "psv16_reduce_u16_u32(%s)" % self._cast_u16(ins[0])
                if attrs.get("add1_shift1"):
                    # The sa8d dual schedule carries (total, total), so
                    # the reduction is 2x the single-group sum; the
                    # reference's (s+1)>>1 folds as (2s+2)>>2.
                    expr = "((%s + 2) >> 2)" % expr
                self._emit(op, "int32_t", expr)
            elif kind == "vaddlv_u32":
                self._emit(op, "uint64_t", "psv16_reduce_u32(%s)"
                           % self._input(op, 0))
            elif kind == "scalar_add2":
                self._emit(op, "int32_t", "%s + %s"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "pack_var":
                self._emit(op, "uint64_t",
                           "(uint64_t)(uint32_t)%s | ((uint64_t)%s << 32)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "rhadd":
                self._emit(op, "svuint8_t",
                           "svrhadd_u8_x(svptrue_b8(), %s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind == "store_u8x16":
                stmt = self.sched.store_u8x16(self, attrs,
                                              self._input(op, 0))
                if stmt:
                    self.body.append("    " + stmt + ";")
            elif kind == "store_u8x8":
                stmt = self.sched.store_u8x8(self, attrs,
                                             self._input(op, 0))
                if stmt:
                    self.body.append("    " + stmt + ";")
            elif kind == "store_sub32":
                stmt = self.sched.store_sub32(
                    self, attrs, (self._input(op, 0),
                                  self._input(op, 1)))
                if stmt:
                    self.body.append("    " + stmt + ";")
            elif kind == "store_add32":
                stmt = self.sched.store_add32(
                    self, attrs, (self._input(op, 0),
                                  self._input(op, 1)))
                if stmt:
                    self.body.append("    " + stmt + ";")
            elif kind in ("vsubl_u8", "vaddl_u8"):
                fn = ("psv16_dual_vsubl_u8" if kind == "vsubl_u8"
                      else "psv16_dual_vaddl_u8")
                self._emit(op, "svuint16_t", "%s(%s, %s)"
                           % (fn, self._input(op, 0), self._input(op, 1)))
            elif kind in ("vmlal_u8", "vmlsl_u8"):
                fn = ("psv16_dual_vmlal_u8" if kind == "vmlal_u8"
                      else "psv16_dual_vmlsl_u8")
                self._emit(op, "svuint16_t",
                           "%s(%s, %s, %s)"
                           % (fn, self._input(op, 0), self._input(op, 1),
                              self._input(op, 2)))
            elif kind == "reinterpret_s16":
                self._emit(op, "svint16_t",
                           "svreinterpret_s16_u16(%s)"
                           % self._input(op, 0))
            elif kind == "vmlaq_n_s16":
                self._emit(op, "svint16_t",
                           "svmla_n_s16_x(pg16_s16(), %s, %s, %d)"
                           % (self._input(op, 0),
                              self._cast_s16(ins[1]),
                              attrs["const"]))
            elif kind == "vqrshrun":
                self._emit(op, "svuint8_t",
                           "psv16_dual_vqrshrun<%d>(%s)"
                           % (attrs["shift"], self._input(op, 0)))
            elif kind == "combine_u8":
                self._emit(op, "svuint8_t",
                           "psv16_combine_u8(%s, %s)"
                           % (self._input(op, 0), self._input(op, 1)))
            elif kind in ("edge", "vceq", "vzip1_s8", "vzip2_s8",
                          "dot_stats", "histseg_count",
                          "hist_count_reduce", "vmovn_combine",
                          "load_diff16", "scalar_sub",
                          "scalar_add_lane"):
                raise NotImplementedError(
                    "dual emit: %s (sao family pending)" % kind)
            else:
                raise ValueError("dual emit: unknown kind %s" % kind)
        return "\n".join(self.body)

    def emit_phased(self) -> str:
        """Emit loads first, then per-coeffIdx phase blocks (interp8)."""
        loads = [op for op in self.ops if phase_of(op) is None]
        phases = {1: [], 2: [], 3: []}
        for op in self.ops:
            p = phase_of(op)
            if p is not None:
                phases[p].append(op)
        self._run(loads)
        out = "\n".join(self.body)
        blocks = []
        for i, p in enumerate((1, 2, 3)):
            em = DualSve16Emitter(phases[p], self.sched)
            em.env = dict(self.env)
            inner = em.emit()
            indented = "\n".join("    " + ln if ln else ln
                                 for ln in inner.splitlines())
            if i == 0:
                head = "    if (coeffIdx == 1)"
            elif i == 1:
                head = "    else if (coeffIdx == 2)"
            else:
                head = "    else"
            blocks.append("%s\n    {\n%s\n    }" % (head, indented))
        return out + ("\n" if out else "") + "\n".join(blocks)

    def _run(self, ops: List[Op]):
        saved = self.ops
        self.ops = ops
        try:
            self.emit()
        finally:
            self.ops = saved


def final_value(ops: List[Op]) -> Optional[str]:
    """Name of the terminal scalar/vector value for the function body."""
    produced = {op.out for op in ops if op.out}
    consumed = {name for op in ops for name in op.inputs if name}
    roots = [op.out for op in ops
             if op.out and op.out not in consumed]
    if not roots:
        scalar_kinds = {"vaddv", "vaddv_u32", "vaddlv", "vaddlv_u32",
                        "vaddv_s16", "vaddv_s32", "vaddv_s64",
                        "scalar_add2", "pack_var"}
        for op in reversed(ops):
            if op.kind in scalar_kinds:
                return op.out
    return roots[-1] if roots else None


def emit_dual(ops: List[Op], schedule: Schedule,
              func_name: str, signature: str,
              helpers: str = DUAL16_HELPERS,
              prologue: str = "",
              epilogue: str = "",
              phased: bool = False,
              includes: str = "#include <arm_sve.h>\n"
                              "#include <stdint.h>\n"
                              "#include <stddef.h>\n") -> str:
    """Assemble a full C++ candidate from the DAG + dual schedule."""
    from pure_sve_helpers import PURE_SVE_HELPERS
    em = DualSve16Emitter(ops, schedule)
    body = em.emit_phased() if phased else em.emit()
    ret = final_value(ops)
    lines = ["// Generated by optimizer/ir/dual_sve16.py -- do not edit.",
             "// Dual-group 16-lane SVE2 (VL=256, zero NEON).",
             includes, PURE_SVE_HELPERS, helpers]
    src = "\n".join(lines) + "\n\n" + signature + "\n{\n"
    if prologue:
        src += prologue
    if body:
        src += body + "\n"
    if epilogue:
        src += epilogue
    if ret and ret in em.env:
        src += "    return %s;\n" % ret
    src += "}\n"
    return src


def make_schedule(load_diff=None, load_u8x16=None, load_u8x8=None,
                  load32=None, store_u8x16=None, store_u8x8=None,
                  store_sub32=None, store_add32=None) -> Schedule:
    """Convenience factory for simple schedules."""
    s = Schedule()
    for name, fn in (("load_diff", load_diff), ("load_u8x16", load_u8x16),
                     ("load_u8x8", load_u8x8), ("load32", load32),
                     ("store_u8x16", store_u8x16),
                     ("store_u8x8", store_u8x8),
                     ("store_sub32", store_sub32),
                     ("store_add32", store_add32)):
        if fn is not None:
            setattr(s, name, fn)
    return s
