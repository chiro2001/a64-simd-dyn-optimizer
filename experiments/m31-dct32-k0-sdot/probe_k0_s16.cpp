// k0_even_sdot numerical probe: compare s16 E-chain (+sdot.d) against the
// scalar DCT32 k0 formula and the validated s32 EEp/EOp chain.
// VL must be 256: qemu-aarch64 -cpu max,sve-max-vq=2
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
#include <random>

static void print16(const char* tag, svint16_t v);
static void print32(const char* tag, svint32_t v);
static void print64(const char* tag, svint64_t v);

// ---- helpers (same as dct32_op_emit.py) ----
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

// ---- scalar oracle for k0 family (mirrors partialButterfly32) ----
struct K0Ref
{
    int e0[4], e1[4];   // EEEE0/EEEE1 per row
    int f0[4], f1[4];   // EEEO0/EEEO1 per row
};

static K0Ref k0_scalar(const int16_t src[4][32])
{
    K0Ref r;
    for (int row = 0; row < 4; row++)
    {
        int E[16], EE[8], EEE[4];
        for (int j = 0; j < 16; j++)
            E[j] = src[row][j] + src[row][31 - j];
        for (int j = 0; j < 8; j++)
            EE[j] = E[j] + E[15 - j];
        for (int j = 0; j < 4; j++)
            EEE[j] = EE[j] + EE[7 - j];
        r.e0[row] = EEE[0] + EEE[3];
        r.e1[row] = EEE[1] + EEE[2];
        r.f0[row] = EEE[0] - EEE[3];
        r.f1[row] = EEE[1] - EEE[2];
    }
    return r;
}

static K0Ref k0_scalar_row(const int16_t* s)
{
    K0Ref r;
    int E[16], EE[8], EEE[4];
    for (int j = 0; j < 16; j++)
        E[j] = s[j] + s[31 - j];
    for (int j = 0; j < 8; j++)
        EE[j] = E[j] + E[15 - j];
    for (int j = 0; j < 4; j++)
        EEE[j] = EE[j] + EE[7 - j];
    r.e0[0] = EEE[0] + EEE[3];
    r.e1[0] = EEE[1] + EEE[2];
    r.f0[0] = EEE[0] - EEE[3];
    r.f1[0] = EEE[1] - EEE[2];
    return r;
}

// ---- pack: same structure as dct32_op_ir.k0es.pack ----
static void pack(svint16_t x0, svint16_t x1, svint16_t x2, svint16_t x3,
                 svint16_t& q0, svint16_t& q1,
                 svint16_t& q2r, svint16_t& q3r)
{
    svint64_t a0 = svreinterpret_s64_s16(x0);
    svint64_t a1 = svreinterpret_s64_s16(x1);
    svint64_t a2 = svreinterpret_s64_s16(x2);
    svint64_t a3 = svreinterpret_s64_s16(x3);
    svint64_t t0 = svzip1_s64(a0, a2);
    svint64_t t1 = svzip2_s64(a0, a2);
    svint64_t t2 = svzip1_s64(a1, a3);
    svint64_t t3 = svzip2_s64(a1, a3);
    svint64_t p0 = svzip1_s64(t0, t2);
    svint64_t p1 = svzip2_s64(t0, t2);
    svint64_t p2 = svzip1_s64(t1, t3);
    svint64_t p3 = svzip2_s64(t1, t3);
    q0 = svreinterpret_s16_s64(p0);
    q1 = svreinterpret_s16_s64(p1);
    q2r = revh_d(svreinterpret_s16_s64(p2));
    q3r = revh_d(svreinterpret_s16_s64(p3));
}

// ---- s32 EEp/EOp (validated bit-exact oracle for lane positions) ----
static void build_s32_ee(svint16_t L0, svint16_t L1, svint16_t L2, svint16_t L3,
                         svint16_t H0, svint16_t H1, svint16_t H2, svint16_t H3,
                         svint32_t& eep, svint32_t& eop, bool dump = false)
{
    svint32_t e0 = svadd_s32_x(svptrue_b32(),
        svaddlb_s32(L0, H3), svaddlb_s32(L3, H0));
    svint32_t e1 = svadd_s32_x(svptrue_b32(),
        svaddlt_s32(L0, H3), svaddlt_s32(L3, H0));
    svint32_t e2 = svadd_s32_x(svptrue_b32(),
        svaddlb_s32(L1, H2), svaddlb_s32(L2, H1));
    svint32_t e3 = svadd_s32_x(svptrue_b32(),
        svaddlt_s32(L1, H2), svaddlt_s32(L2, H1));
    svint32_t w0 = svzip1_s32(e0, e1);
    svint32_t w1 = svzip2_s32(e0, e1);
    svint32_t u2 = revw_d32(e2);
    svint32_t u3 = revw_d32(e3);
    svint32_t w2 = svzip1_s32(u3, u2);
    svint32_t w3 = svzip2_s32(u3, u2);
    svint32_t s0 = svsub_s32_x(svptrue_b32(), w0, w2);
    svint32_t s1 = svsub_s32_x(svptrue_b32(), w1, w3);
    svint32_t s2 = svadd_s32_x(svptrue_b32(), w0, w2);
    svint32_t s3 = svadd_s32_x(svptrue_b32(), w1, w3);
    svint64_t v0 = svuzp1_s64(svreinterpret_s64_s32(s2),
                              svreinterpret_s64_s32(s3));
    svint64_t v1 = svuzp2_s64(svreinterpret_s64_s32(s2),
                              svreinterpret_s64_s32(s3));
    svint64_t v1r = revw_d64(v1);
    eep = svadd_s32_x(svptrue_b32(),
                      svreinterpret_s32_s64(v0),
                      svreinterpret_s32_s64(v1r));
    eop = svsub_s32_x(svptrue_b32(),
                      svreinterpret_s32_s64(v0),
                      svreinterpret_s32_s64(v1r));
    if (dump)
    {
        print32("s32 e0", e0);
        print32("s32 e1", e1);
        print32("s32 e2", e2);
        print32("s32 e3", e3);
        print32("s32 w0", w0);
        print32("s32 w1", w1);
        print32("s32 u2", u2);
        print32("s32 u3", u3);
        print32("s32 w2", w2);
        print32("s32 w3", w3);
        print32("s32 s0", s0);
        print32("s32 s1", s1);
        print32("s32 s2", s2);
        print32("s32 s3", s3);
        print64("s32 v0", v0);
        print64("s32 v1", v1);
        print64("s32 v1r", v1r);
    }
}

// ---- candidate A: s16 mirror with predicated zeroing ----
static void build_s16_ee_a(svint16_t L0, svint16_t L1, svint16_t L2, svint16_t L3,
                           svint16_t H0, svint16_t H1, svint16_t H2, svint16_t H3,
                           const svbool_t plb, const svbool_t plt,
                           svint16_t& eep, svint16_t& eop)
{
    svint16_t e0 = svadd_s16_z(plb, L0, H3);
    e0 = svadd_s16_z(plb, e0, svadd_s16_z(plb, L3, H0));
    svint16_t e1 = svadd_s16_z(plt, L0, H3);
    e1 = svadd_s16_z(plt, e1, svadd_s16_z(plt, L3, H0));
    svint16_t e2 = svadd_s16_z(plb, L1, H2);
    e2 = svadd_s16_z(plb, e2, svadd_s16_z(plb, L2, H1));
    svint16_t e3 = svadd_s16_z(plt, L1, H2);
    e3 = svadd_s16_z(plt, e3, svadd_s16_z(plt, L2, H1));
    svint16_t w0 = svzip1_s16(e0, e1);
    svint16_t w1 = svzip2_s16(e0, e1);
    svint16_t u2 = svreinterpret_s16_s32(revw_d32(svreinterpret_s32_s16(e2)));
    svint16_t u3 = svreinterpret_s16_s32(revw_d32(svreinterpret_s32_s16(e3)));
    svint16_t w2 = svzip1_s16(u3, u2);
    svint16_t w3 = svzip2_s16(u3, u2);
    svint16_t s0 = svsub_s16_x(svptrue_b16(), w0, w2);
    svint16_t s1 = svsub_s16_x(svptrue_b16(), w1, w3);
    svint16_t s2 = svadd_s16_x(svptrue_b16(), w0, w2);
    svint16_t s3 = svadd_s16_x(svptrue_b16(), w1, w3);
    svint64_t v0 = svuzp1_s64(svreinterpret_s64_s16(s2),
                              svreinterpret_s64_s16(s3));
    svint64_t v1 = svuzp2_s64(svreinterpret_s64_s16(s2),
                              svreinterpret_s64_s16(s3));
    svint64_t v1r = revw_d64(v1);
    eep = svadd_s16_x(svptrue_b16(),
                      svreinterpret_s16_s64(v0),
                      svreinterpret_s16_s64(v1r));
    eop = svsub_s16_x(svptrue_b16(),
                      svreinterpret_s16_s64(v0),
                      svreinterpret_s16_s64(v1r));
}

// ---- candidate B: op-for-op mirror with same-size permute instructions ----
static void build_s16_ee_b(svint16_t L0, svint16_t L1, svint16_t L2, svint16_t L3,
                           svint16_t H0, svint16_t H1, svint16_t H2, svint16_t H3,
                           svint16_t& eep, svint16_t& eop, bool dump = false)
{
    svint16_t e0 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L0, H3),
        svadd_s16_x(svptrue_b16(), L3, H0));
    svint16_t e1 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L1, H2),
        svadd_s16_x(svptrue_b16(), L2, H1));
    svint32_t w0 = svzip1_s32(svreinterpret_s32_s16(e0),
                              svreinterpret_s32_s16(e1));
    svint32_t w1 = svzip2_s32(svreinterpret_s32_s16(e0),
                              svreinterpret_s32_s16(e1));
    svint32_t u2 = revw_d32(svreinterpret_s32_s16(e1));
    svint32_t u3 = revw_d32(svreinterpret_s32_s16(e0));
    svint32_t w2 = svzip1_s32(u3, u2);
    svint32_t w3 = svzip2_s32(u3, u2);
    svint32_t s0 = svsub_s32_x(svptrue_b32(), w0, w2);
    svint32_t s1 = svsub_s32_x(svptrue_b32(), w1, w3);
    svint32_t s2 = svadd_s32_x(svptrue_b32(), w0, w2);
    svint32_t s3 = svadd_s32_x(svptrue_b32(), w1, w3);
    svint64_t v0 = svuzp1_s64(svreinterpret_s64_s32(s2),
                              svreinterpret_s64_s32(s3));
    svint64_t v1 = svuzp2_s64(svreinterpret_s64_s32(s2),
                              svreinterpret_s64_s32(s3));
    svint64_t v1r = revw_d64(v1);
    eep = svadd_s16_x(svptrue_b16(),
                      svreinterpret_s16_s64(v0),
                      svreinterpret_s16_s64(v1r));
    eop = svsub_s16_x(svptrue_b16(),
                      svreinterpret_s16_s64(v0),
                      svreinterpret_s16_s64(v1r));
    if (dump)
    {
        print16("s16B e0all", e0);
        print16("s16B e1all", e1);
        print32("s16B w0", w0);
        print32("s16B w1", w1);
        print32("s16B u2", u2);
        print32("s16B u3", u3);
        print32("s16B w2", w2);
        print32("s16B w3", w3);
        print32("s16B s0", s0);
        print32("s16B s1", s1);
        print32("s16B s2", s2);
        print32("s16B s3", s3);
        print64("s16B v0", v0);
        print64("s16B v1", v1);
        print64("s16B v1r", v1r);
    }
}

// ---- candidate C: simplified s16 chain ----
// e0all = [w0, w1]; w2all = per-segment-rev(e1all) = [w2, w3];
// s2all = e0all + w2all = [s2, s3];
// EEp = even(s2all + revh(s2all)), EOp = even(s2all - revh(s2all)).
static void build_s16_ee_c(svint16_t L0, svint16_t L1, svint16_t L2, svint16_t L3,
                           svint16_t H0, svint16_t H1, svint16_t H2, svint16_t H3,
                           const svuint16_t& revseg, svint16_t& eep,
                           svint16_t& eop, bool dump = false)
{
    svint16_t e0 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L0, H3),
        svadd_s16_x(svptrue_b16(), L3, H0));
    svint16_t e1 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L1, H2),
        svadd_s16_x(svptrue_b16(), L2, H1));
    svint16_t w2 = revh_d(e1);
    svint16_t s2 = svadd_s16_x(svptrue_b16(), e0, w2);
    svint16_t rh = revh_d(s2);
    eep = svuzp1_s16(svadd_s16_x(svptrue_b16(), s2, rh),
                     svadd_s16_x(svptrue_b16(), s2, rh));
    svint16_t teo = svsub_s16_x(svptrue_b16(), s2, rh);
    eop = svreinterpret_s16_s32(
        svuzp1_s32(svreinterpret_s32_s16(teo),
                   svreinterpret_s32_s16(teo)));
    if (dump)
    {
        print16("s16C e0all", e0);
        print16("s16C e1all", e1);
        print16("s16C w2all", w2);
        print16("s16C s2all", s2);
        print16("s16C rh", rh);
    }
}

// ---- full k0 via sdot.d ----
// K16[k] = 16 lanes of [c0,c1,c0,c1,...] (K0EVEN row k doubled).
static const int16_t K16[4][16] = {
    { 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64 },
    { 83, 36, 83, 36, 83, 36, 83, 36, 83, 36, 83, 36, 83, 36, 83, 36 },
    { 64, -64, 64, -64, 64, -64, 64, -64, 64, -64, 64, -64, 64, -64, 64, -64 },
    { 36, -83, 36, -83, 36, -83, 36, -83, 36, -83, 36, -83, 36, -83, 36, -83 },
};

static void k0_sdot(svint16_t eep, svint16_t eop, int k, int shift,
                    int16_t out[4], bool dump = false)
{
    const uint16_t mask_idx[16] =
        { 0xFFFF, 0xFFFF, 0, 0, 0xFFFF, 0xFFFF, 0, 0,
          0xFFFF, 0xFFFF, 0, 0, 0xFFFF, 0xFFFF, 0, 0 };
    const svuint16_t mask = svld1_u16(svptrue_b16(), mask_idx);
    svint16_t src = (k == 0 || k == 16) ? eep : eop;
    svint16_t w = svand_s16_x(svptrue_b16(), src,
                              svreinterpret_s16_u16(mask));
    const svint16_t kc = svld1_s16(svptrue_b16(), K16[k / 8]);
    svint64_t dot = svdot_s64(svdup_n_s64(0), w, kc);
    // s64 dots -> low s32 halves in even lanes -> rshrnb -> compress.
    svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(dot),
                              svreinterpret_s32_s64(dot));
    svint16_t n16 = shift == 4
        ? svrshrnb_n_s32(lo, 4)
        : svrshrnb_n_s32(lo, 11);
    n16 = svuzp1_s16(n16, n16);
    svst1_s16(svptrue_b16(), out, n16);
    if (dump)
    {
        print16("k0 w", w);
        print16("k0 kc", kc);
        print64("k0 dot", dot);
        print16("k0 n16", n16);
    }
}

// ---- k0 via sdot directly from masked t_ee/t_eo ----
static void k0_sdot2(svint16_t tee, svint16_t teo, int k, int shift,
                     int16_t out[4], bool dump = false)
{
    const uint16_t mask_idx[16] =
        { 0xFFFF, 0xFFFF, 0, 0, 0xFFFF, 0xFFFF, 0, 0,
          0xFFFF, 0xFFFF, 0, 0, 0xFFFF, 0xFFFF, 0, 0 };
    const svuint16_t mask = svld1_u16(svptrue_b16(), mask_idx);
    svint16_t src = (k == 0 || k == 16) ? tee : teo;
    svint16_t w = svand_s16_x(svptrue_b16(), src,
                              svreinterpret_s16_u16(mask));
    const svint16_t kc = svld1_s16(svptrue_b16(), K16[k / 8]);
    svint64_t dot = svdot_s64(svdup_n_s64(0), w, kc);
    svint32_t lo = svuzp1_s32(svreinterpret_s32_s64(dot),
                              svreinterpret_s32_s64(dot));
    svint16_t n16 = shift == 4
        ? svrshrnb_n_s32(lo, 4)
        : svrshrnb_n_s32(lo, 11);
    n16 = svuzp1_s16(n16, n16);
    svst1_s16(svptrue_b16(), out, n16);
    if (dump)
    {
        print16("k2 tee", tee);
        print16("k2 w", w);
        print64("k2 dot", dot);
    }
}

// t_ee/t_eo (masked sdot inputs) from the simplified s16 chain
static void build_tee_teo(svint16_t L0, svint16_t L1, svint16_t L2,
                          svint16_t L3, svint16_t H0, svint16_t H1,
                          svint16_t H2, svint16_t H3,
                          svint16_t& tee, svint16_t& teo, bool dump = false)
{
    svint16_t e0 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L0, H3),
        svadd_s16_x(svptrue_b16(), L3, H0));
    svint16_t e1 = svadd_s16_x(svptrue_b16(),
        svadd_s16_x(svptrue_b16(), L1, H2),
        svadd_s16_x(svptrue_b16(), L2, H1));
    svint16_t w2 = revh_d(e1);
    svint16_t s2 = svadd_s16_x(svptrue_b16(), e0, w2);
    svint16_t rh = revh_d(s2);
    tee = svadd_s16_x(svptrue_b16(), s2, rh);
    teo = svsub_s16_x(svptrue_b16(), s2, rh);
    if (dump)
    {
        print16("k2 e0all", e0);
        print16("k2 e1all", e1);
        print16("k2 s2all", s2);
        print16("k2 tee", tee);
        print16("k2 teo", teo);
    }
}

// scalar k0 output for one row, using exact int32 E values
static int k0_scalar_out(const K0Ref& r, int row, int k, int shift)
{
    int64_t v;
    if (k == 0) v = (int64_t)64 * r.e0[row] + 64 * r.e1[row];
    else if (k == 8) v = (int64_t)83 * r.f0[row] + 36 * r.f1[row];
    else if (k == 16) v = (int64_t)64 * r.e0[row] - 64 * r.e1[row];
    else v = (int64_t)36 * r.f0[row] - 83 * r.f1[row];
    return (int)((v + (1LL << (shift - 1))) >> shift);
}

// exact scalar dct32 pass1 (int64 arithmetic, x265 partialButterfly32)
static void dct32_pass1_exact(const int16_t src[32][32], int16_t coef[32][32])
{
    static const int32_t g32[32][16] = {
        { 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64, 64 },
        { 90, 90, 88, 85, 82, 78, 73, 67, 61, 54, 46, 38, 31, 22, 13, 4 },
        { 90, 87, 80, 70, 57, 43, 25, 9, -9, -25, -43, -57, -70, -80, -87, -90 },
        { 90, 82, 67, 46, 22, -4, -31, -54, -73, -85, -90, -88, -78, -61, -38, -13 },
        { 89, 75, 50, 18, -18, -50, -75, -89, -89, -75, -50, -18, 18, 50, 75, 89 },
        { 88, 67, 31, -13, -54, -82, -90, -78, -46, -4, 38, 73, 90, 85, 61, 22 },
        { 87, 57, 9, -43, -80, -90, -70, -25, 25, 70, 90, 80, 43, -9, -57, -87 },
        { 85, 46, -13, -67, -90, -73, -22, 38, 82, 88, 54, -4, -61, -90, -78, -31 },
        { 83, 36, -36, -83, -83, -36, 36, 83, 83, 36, -36, -83, -83, -36, 36, 83 },
        { 82, 22, -54, -90, -61, 13, 78, 85, 31, -46, -90, -67, 4, 73, 88, 38 },
        { 80, 9, -70, -87, -25, 57, 90, 43, -43, -90, -57, 25, 87, 70, -9, -80 },
        { 78, -4, -82, -73, 13, 85, 67, -22, -88, -61, 31, 90, 54, -38, -90, -46 },
        { 75, -18, -89, -50, 50, 89, 18, -75, -75, 18, 89, 50, -50, -89, -18, 75 },
        { 73, -31, -90, -22, 78, 67, -38, -90, -13, 82, 61, -46, -88, -4, 85, 54 },
        { 70, -43, -87, 9, 90, 25, -80, -57, 57, 80, -25, -90, -9, 87, 43, -70 },
        { 67, -54, -78, 38, 85, -22, -90, 4, 90, 13, -88, -31, 82, 46, -73, -61 },
        { 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64, 64, -64, -64, 64 },
        { 61, -73, -46, 82, 31, -88, -13, 90, -4, -90, 22, 85, -38, -78, 54, 67 },
        { 57, -80, -25, 90, -9, -87, 43, 70, -70, -43, 87, 9, -90, 25, 80, -57 },
        { 54, -85, -4, 88, -46, -61, 82, 13, -90, 38, 67, -78, -22, 90, -31, -73 },
        { 50, -89, 18, 75, -75, -18, 89, -50, -50, 89, -18, -75, 75, 18, -89, 50 },
        { 46, -90, 38, 54, -90, 31, 61, -88, 22, 67, -85, 13, 73, -82, 4, 78 },
        { 43, -90, 57, 25, -87, 70, 9, -80, 80, -9, -70, 87, -25, -57, 90, -43 },
        { 38, -88, 73, -4, -67, 90, -46, -31, 85, -78, 13, 61, -90, 54, 22, -82 },
        { 36, -83, 83, -36, -36, 83, -83, 36, 36, -83, 83, -36, -36, 83, -83, 36 },
        { 31, -78, 90, -61, 4, 54, -88, 82, -38, -22, 73, -90, 67, -13, -46, 85 },
        { 25, -70, 90, -80, 43, 9, -57, 87, -87, 57, -9, -43, 80, -90, 70, -25 },
        { 22, -61, 85, -90, 73, -38, -4, 46, -78, 90, -82, 54, -13, -31, 67, -88 },
        { 18, -50, 75, -89, 89, -75, 50, -18, -18, 50, -75, 89, -89, 75, -50, 18 },
        { 13, -38, 61, -78, 88, -90, 85, -73, 54, -31, 4, 22, -46, 67, -82, 90 },
        { 9, -25, 43, -57, 70, -80, 87, -90, 90, -87, 80, -70, 57, -43, 25, -9 },
        { 4, -13, 22, -31, 38, -46, 54, -61, 67, -73, 78, -82, 85, -88, 90, -90 },
    };
    for (int row = 0; row < 32; row++)
    {
        const int16_t* s = src[row];
        int64_t E[16], O[16], EE[8], EO[8], EEE[4], EEO[4];
        for (int j = 0; j < 16; j++)
        {
            E[j] = (int64_t)s[j] + s[31 - j];
            O[j] = (int64_t)s[j] - s[31 - j];
        }
        for (int j = 0; j < 8; j++)
        {
            EE[j] = E[j] + E[15 - j];
            EO[j] = E[j] - E[15 - j];
        }
        for (int j = 0; j < 4; j++)
        {
            EEE[j] = EE[j] + EE[7 - j];
            EEO[j] = EE[j] - EE[7 - j];
        }
        const int64_t EEEE[2] = { EEE[0] + EEE[3], EEE[1] + EEE[2] };
        const int64_t EEEO[2] = { EEE[0] - EEE[3], EEE[1] - EEE[2] };
        coef[row][0] = (int16_t)((g32[0][0] * EEEE[0] +
                                  g32[0][1] * EEEE[1] + 8) >> 4);
        coef[row][16] = (int16_t)((g32[16][0] * EEEE[0] +
                                   g32[16][1] * EEEE[1] + 8) >> 4);
        coef[row][8] = (int16_t)((g32[8][0] * EEEO[0] +
                                  g32[8][1] * EEEO[1] + 8) >> 4);
        coef[row][24] = (int16_t)((g32[24][0] * EEEO[0] +
                                   g32[24][1] * EEEO[1] + 8) >> 4);
        for (int k = 4; k < 32; k += 8)
        {
            int64_t v = 0;
            for (int j = 0; j < 4; j++)
                v += (int64_t)g32[k][j] * EEO[j];
            coef[row][k] = (int16_t)((v + 8) >> 4);
        }
        for (int k = 2; k < 32; k += 4)
        {
            int64_t v = 0;
            for (int j = 0; j < 8; j++)
                v += (int64_t)g32[k][j] * EO[j];
            coef[row][k] = (int16_t)((v + 8) >> 4);
        }
        for (int k = 1; k < 32; k += 2)
        {
            int64_t v = 0;
            for (int j = 0; j < 16; j++)
                v += (int64_t)g32[k][j] * O[j];
            coef[row][k] = (int16_t)((v + 8) >> 4);
        }
    }
}

static void print16(const char* tag, svint16_t v)
{
    int16_t o[32];
    svst1_s16(svptrue_b16(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 16; i++) printf(" %d", o[i]);
    printf("\n");
}

static void print32(const char* tag, svint32_t v)
{
    int32_t o[16];
    svst1_s32(svptrue_b32(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 8; i++) printf(" %d", o[i]);
    printf("\n");
}

static void print64(const char* tag, svint64_t v)
{
    int64_t o[8];
    svst1_s64(svptrue_b64(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 4; i++) printf(" %ld", (long)o[i]);
    printf("\n");
}

static void print16s(const char* tag, const int16_t* o)
{
    printf("%s:", tag);
    for (int i = 0; i < 16; i++) printf(" %d", o[i]);
    printf("\n");
}

int main(int argc, char** argv)
{
    const int ncase = argc > 1 ? atoi(argv[1]) : 1000;
    const bool verbose = argc > 2;
    const bool full_range = argc > 3;
    if (full_range)
    {
        // two-pass simulation: exact pass1 -> s16-chain pass2 (shift 11)
        std::mt19937 rng(0xD32C2026u);
        long mism[4] = {0, 0, 0, 0};
        long tot = 0;
        int16_t src[32][32];
        for (int it = 0; it < ncase; it++)
        {
            for (int r = 0; r < 32; r++)
                for (int j = 0; j < 32; j++)
                    src[r][j] = (int16_t)((int)(rng() % 511) - 255);
            int16_t coef[32][32];
            dct32_pass1_exact(src, coef);
            for (int p = 0; p < 8; p++)
            {
                const int row0 = p * 4;
                svint16_t lo0 = svld1_s16(svptrue_b16(), coef[row0]);
                svint16_t lo1 = svld1_s16(svptrue_b16(), coef[row0 + 1]);
                svint16_t lo2 = svld1_s16(svptrue_b16(), coef[row0 + 2]);
                svint16_t lo3 = svld1_s16(svptrue_b16(), coef[row0 + 3]);
                svint16_t hi0 = svld1_s16(svptrue_b16(), coef[row0] + 16);
                svint16_t hi1 = svld1_s16(svptrue_b16(), coef[row0 + 1] + 16);
                svint16_t hi2 = svld1_s16(svptrue_b16(), coef[row0 + 2] + 16);
                svint16_t hi3 = svld1_s16(svptrue_b16(), coef[row0 + 3] + 16);
                svint16_t L0, L1, L2, L3, H0, H1, H2, H3;
                pack(lo0, lo1, lo2, lo3, L0, L1, L2, L3);
                pack(hi0, hi1, hi2, hi3, H0, H1, H2, H3);
                svint16_t tee, teo;
                build_tee_teo(L0, L1, L2, L3, H0, H1, H2, H3, tee, teo);
                for (int kk = 0; kk < 4; kk++)
                {
                    int k = kk * 8;
                    int16_t vo[16];
                    k0_sdot2(tee, teo, k, 11, vo);
                    for (int r = 0; r < 4; r++)
                    {
                        K0Ref ref = k0_scalar_row(coef[row0 + r]);
                        int want = k0_scalar_out(ref, 0, k, 11);
                        if (vo[r] != (int16_t)want)
                        {
                            mism[kk]++;
                            if (it == 0 && verbose)
                                printf("tp k=%d pack=%d row=%d want=%d got=%d\n",
                                       k, p, r, want, vo[r]);
                        }
                        tot++;
                    }
                }
            }
        }
        for (int k = 0; k < 4; k++)
            printf("twopass k=%d mism=%ld/%ld (%.4f%%)\n",
                   k * 8, mism[k], tot / 4,
                   100.0 * mism[k] / (tot / 4));
        // constant +/-255 and zero inputs
        for (int val = -255; val <= 255; val += 510)
        {
            long ck[4] = {0, 0, 0, 0};
            for (int r = 0; r < 32; r++)
                for (int j = 0; j < 32; j++)
                    src[r][j] = (int16_t)val;
            int16_t coef[32][32];
            dct32_pass1_exact(src, coef);
            for (int p = 0; p < 8; p++)
            {
                const int row0 = p * 4;
                svint16_t lo0 = svld1_s16(svptrue_b16(), coef[row0]);
                svint16_t lo1 = svld1_s16(svptrue_b16(), coef[row0 + 1]);
                svint16_t lo2 = svld1_s16(svptrue_b16(), coef[row0 + 2]);
                svint16_t lo3 = svld1_s16(svptrue_b16(), coef[row0 + 3]);
                svint16_t hi0 = svld1_s16(svptrue_b16(), coef[row0] + 16);
                svint16_t hi1 = svld1_s16(svptrue_b16(), coef[row0 + 1] + 16);
                svint16_t hi2 = svld1_s16(svptrue_b16(), coef[row0 + 2] + 16);
                svint16_t hi3 = svld1_s16(svptrue_b16(), coef[row0 + 3] + 16);
                svint16_t L0, L1, L2, L3, H0, H1, H2, H3;
                pack(lo0, lo1, lo2, lo3, L0, L1, L2, L3);
                pack(hi0, hi1, hi2, hi3, H0, H1, H2, H3);
                svint16_t tee, teo;
                build_tee_teo(L0, L1, L2, L3, H0, H1, H2, H3, tee, teo);
                for (int kk = 0; kk < 4; kk++)
                {
                    int k = kk * 8;
                    int16_t vo[16];
                    k0_sdot2(tee, teo, k, 11, vo);
                    for (int r = 0; r < 4; r++)
                    {
                        K0Ref ref = k0_scalar_row(coef[row0 + r]);
                        int want = k0_scalar_out(ref, 0, k, 11);
                        if (vo[r] != (int16_t)want)
                            ck[kk]++;
                    }
                }
            }
            long t = 0;
            for (int kk = 0; kk < 4; kk++) t += ck[kk];
            printf("const %d mism total=%ld/1024\n", val, t);
        }
        return 0;
    }
    std::mt19937 rng(0xD32C2026u);
    const svbool_t plb = svorr_b_z(svptrue_b16(), svwhilelt_b16(0, 4),
                                   svwhilelt_b16(8, 12));
    const svbool_t plt = svorr_b_z(svptrue_b16(), svwhilelt_b16(4, 8),
                                   svwhilelt_b16(12, 16));
    const uint16_t revseg_idx[16] =
        { 7,6,5,4,3,2,1,0, 15,14,13,12,11,10,9,8 };
    const svuint16_t revseg = svld1_u16(svptrue_b16(), revseg_idx);
    long mism[4] = {0, 0, 0, 0};
    long mism_eop = 0;
    long mism_sdot[4] = {0, 0, 0, 0};
    long mism_sdot2[4] = {0, 0, 0, 0};
    long k0_tot = 0;
    long tot = 0;
    for (int it = 0; it < ncase; it++)
    {
        int16_t src[4][32];
        for (int r = 0; r < 4; r++)
            for (int j = 0; j < 32; j++)
                src[r][j] = full_range
                    ? (int16_t)(int)(rng() % 65536u) - 32768
                    : (int16_t)((int)(rng() % 511) - 255);
        K0Ref ref = k0_scalar(src);
        svint16_t lo0 = svld1_s16(svptrue_b16(), src[0]);
        svint16_t lo1 = svld1_s16(svptrue_b16(), src[1]);
        svint16_t lo2 = svld1_s16(svptrue_b16(), src[2]);
        svint16_t lo3 = svld1_s16(svptrue_b16(), src[3]);
        svint16_t hi0 = svld1_s16(svptrue_b16(), src[0] + 16);
        svint16_t hi1 = svld1_s16(svptrue_b16(), src[1] + 16);
        svint16_t hi2 = svld1_s16(svptrue_b16(), src[2] + 16);
        svint16_t hi3 = svld1_s16(svptrue_b16(), src[3] + 16);
        svint16_t L0, L1, L2, L3, H0, H1, H2, H3;
        pack(lo0, lo1, lo2, lo3, L0, L1, L2, L3);
        pack(hi0, hi1, hi2, hi3, H0, H1, H2, H3);
        svint32_t eep32, eop32;
        build_s32_ee(L0, L1, L2, L3, H0, H1, H2, H3,
                     eep32, eop32, it == 0 && verbose);
        svint16_t eep16, eop16;
        build_s16_ee_a(L0, L1, L2, L3, H0, H1, H2, H3,
                       plb, plt, eep16, eop16);
        svint16_t eep16b, eop16b;
        build_s16_ee_b(L0, L1, L2, L3, H0, H1, H2, H3,
                       eep16b, eop16b, it == 0 && verbose);
        svint16_t eep16c, eop16c;
        build_s16_ee_c(L0, L1, L2, L3, H0, H1, H2, H3,
                       revseg, eep16c, eop16c, it == 0 && verbose);
        svint16_t tee, teo;
        build_tee_teo(L0, L1, L2, L3, H0, H1, H2, H3,
                      tee, teo, it == 0 && verbose);
        if (it == 0 && verbose)
        {
            printf("ref e0/e1 rows: %d/%d %d/%d %d/%d %d/%d\n",
                   ref.e0[0], ref.e1[0], ref.e0[1], ref.e1[1],
                   ref.e0[2], ref.e1[2], ref.e0[3], ref.e1[3]);
            printf("ref f0/f1 rows: %d/%d %d/%d %d/%d %d/%d\n",
                   ref.f0[0], ref.f1[0], ref.f0[1], ref.f1[1],
                   ref.f0[2], ref.f1[2], ref.f0[3], ref.f1[3]);
            print32("s32 EEp", eep32);
            print32("s32 EOp", eop32);
            print16("s16 EEp", eep16);
            print16("s16 EOp", eop16);
            print16("s16B EEp", eep16b);
            print16("s16B EOp", eop16b);
            print16("s16C EEp", eep16c);
            print16("s16C EOp", eop16c);
            int16_t l0v[16];
            svst1_s16(svptrue_b16(), l0v, L0);
            print16s("L0", l0v);
            svst1_s16(svptrue_b16(), l0v, L1);
            print16s("L1", l0v);
            svst1_s16(svptrue_b16(), l0v, L2);
            print16s("L2", l0v);
            svst1_s16(svptrue_b16(), l0v, L3);
            print16s("L3", l0v);
            svst1_s16(svptrue_b16(), l0v, H3);
            print16s("H3", l0v);
        }
        // EEp16 lanes 0..7 must equal [e0,e1,e0,e1,...] per row (mod 65536)
        int16_t e16[16];
        svst1_s16(svptrue_b16(), e16, eep16);
        const int exp[8] = { ref.e0[0], ref.e1[0], ref.e0[1], ref.e1[1],
                             ref.e0[2], ref.e1[2], ref.e0[3], ref.e1[3] };
        for (int i = 0; i < 8; i++)
        {
            int16_t want = (int16_t)exp[i];
            if (e16[i] != want)
            {
                mism[i / 2]++;
                if (it == 0)
                    printf("EEp16 lane %d want=%d got=%d\n", i, want, e16[i]);
            }
        }
        tot += 8;
        // EOp check: lanes 0..7 = [f0,f1,f0,f1,...]
        int16_t o16[16];
        svst1_s16(svptrue_b16(), o16, eop16c);
        const int expf[8] = { ref.f0[0], ref.f1[0], ref.f0[1], ref.f1[1],
                              ref.f0[2], ref.f1[2], ref.f0[3], ref.f1[3] };
        for (int i = 0; i < 8; i++)
            if (o16[i] != (int16_t)expf[i])
            {
                mism_eop++;
                if (it == 0)
                    printf("EOp16C lane %d want=%d got=%d\n",
                           i, (int16_t)expf[i], o16[i]);
            }
        // full k0 outputs via sdot for both shifts
        for (int si = 0; si < 2; si++)
        {
            int shift = si == 0 ? 4 : 11;
            for (int kk = 0; kk < 4; kk++)
            {
                int k = kk * 8;
                int16_t vo[16];
                k0_sdot(eep16c, eop16c, k, shift, vo,
                        it == 0 && verbose && kk == 0 && si == 0);
                int16_t vo2[16];
                k0_sdot2(tee, teo, k, shift, vo2,
                         it == 0 && verbose && kk == 0 && si == 0);
                for (int r = 0; r < 4; r++)
                {
                    int want = k0_scalar_out(ref, r, k, shift);
                    if (vo[r] != (int16_t)want)
                    {
                        mism_sdot[kk]++;
                        if (it == 0)
                            printf("sdot k=%d shift=%d row=%d want=%d got=%d\n",
                           k, shift, r, want, vo[r]);
                    }
                    if (vo2[r] != (int16_t)want)
                    {
                        mism_sdot2[kk]++;
                        if (it == 0)
                            printf("sdot2 k=%d shift=%d row=%d want=%d got=%d\n",
                                   k, shift, r, want, vo2[r]);
                    }
                    k0_tot++;
                }
            }
        }
        // candidate B check
        int16_t e16b[16];
        svst1_s16(svptrue_b16(), e16b, eep16b);
        for (int i = 0; i < 8; i++)
        {
            int16_t want = (int16_t)exp[i];
            if (e16b[i] != want)
            {
                if (it == 0)
                    printf("EEp16B lane %d want=%d got=%d\n",
                           i, want, e16b[i]);
            }
        }
        int16_t e16c[16];
        svst1_s16(svptrue_b16(), e16c, eep16c);
        for (int i = 0; i < 8; i++)
        {
            int16_t want = (int16_t)exp[i];
            if (e16c[i] != want)
            {
                if (it == 0)
                    printf("EEp16C lane %d want=%d got=%d\n",
                           i, want, e16c[i]);
            }
        }
    }
    for (int k = 0; k < 4; k++)
        printf("k0 k=%d EEp16 lane mism=%ld/%ld\n", k * 8, mism[k], tot / 4);
    printf("EOp16 lane mism=%ld/%ld\n", mism_eop, tot);
    for (int k = 0; k < 4; k++)
        printf("sdot k=%d mism=%ld/%ld (%.4f%%)\n",
               k * 8, mism_sdot[k], k0_tot / 4,
               100.0 * mism_sdot[k] / (k0_tot / 4));
    for (int k = 0; k < 4; k++)
        printf("sdot2 k=%d mism=%ld/%ld (%.4f%%)\n",
               k * 8, mism_sdot2[k], k0_tot / 8,
               100.0 * mism_sdot2[k] / (k0_tot / 8));
    return 0;
}
