// k0 E-pack probe: try packing E = lo + rev(hi) directly (one pack
// instead of lo/hi double packs) and find the chain that reproduces the
// validated s32 EEp/EOp (and hence the k0 outputs).
// VL=256: qemu-aarch64 -cpu max,sve-max-vq=2
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
#include <random>

struct K0Ref
{
    int e0[4], e1[4], f0[4], f1[4];
};

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

static int k0_scalar_out(const K0Ref& r, int k, int shift)
{
    int64_t v;
    if (k == 0) v = (int64_t)64 * r.e0[0] + 64 * r.e1[0];
    else if (k == 8) v = (int64_t)83 * r.f0[0] + 36 * r.f1[0];
    else if (k == 16) v = (int64_t)64 * r.e0[0] - 64 * r.e1[0];
    else v = (int64_t)36 * r.f0[0] - 83 * r.f1[0];
    return (int)((v + (1LL << (shift - 1))) >> shift);
}

static void dct32_pass1_exact(const int16_t src[32][32],
                              int16_t coef[32][32]);

static void dct32_pass1_exact(const int16_t src[32][32],
                              int16_t coef[32][32])
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

// current (validated) s32 EEp/EOp chain from lo/hi packs
static void build_s32_ee(svint16_t L0, svint16_t L1, svint16_t L2,
                         svint16_t L3, svint16_t H0, svint16_t H1,
                         svint16_t H2, svint16_t H3,
                         svint32_t& eep, svint32_t& eop)
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
}

// candidate C1: mirror the s32 chain on the E-pack
static void build_epack_c1(svint16_t E0, svint16_t E1, svint16_t E2,
                           svint16_t E3, svint32_t& eep, svint32_t& eop)
{
    svint16_t q0, q1, q2r, q3r;
    pack(E0, E1, E2, E3, q0, q1, q2r, q3r);
    svint32_t e0 = svaddlb_s32(q0, q3r);
    svint32_t e1 = svaddlt_s32(q0, q3r);
    svint32_t e2 = svaddlb_s32(q1, q2r);
    svint32_t e3 = svaddlt_s32(q1, q2r);
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
}

static void print32(const char* tag, svint32_t v)
{
    int32_t o[16];
    svst1_s32(svptrue_b32(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 8; i++) printf(" %d", o[i]);
    printf("\n");
}

static void print16(const char* tag, svint16_t v)
{
    int16_t o[32];
    svst1_s16(svptrue_b16(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 16; i++) printf(" %d", o[i]);
    printf("\n");
}

int main(int argc, char** argv)
{
    const int ncase = argc > 1 ? atoi(argv[1]) : 200;
    const bool two_pass = argc > 2;
    std::mt19937 rng(0xE9A6C21u);
    if (argc > 3 && two_pass)
    {
        // structured-input regression: constant / extreme rows.
        // The full-pass E-pack passed 20k random but FAILED TestBenchLite
        // on these (pass2 E = coef+coef wraps at ~+-65k); the pass1-only
        // variant must stay exact here.
        const int vals[] = { -255, 255, -32768, 32767, -1000, 1000 };
        long bad = 0;
        for (int v : vals)
        {
            int16_t src[32][32], coef[32][32];
            for (int r = 0; r < 32; r++)
                for (int j = 0; j < 32; j++)
                    src[r][j] = (int16_t)v;
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
                svint16_t E0 = svadd_s16_x(svptrue_b16(), lo0,
                                           svrev_s16(hi0));
                svint16_t E1 = svadd_s16_x(svptrue_b16(), lo1,
                                           svrev_s16(hi1));
                svint16_t E2 = svadd_s16_x(svptrue_b16(), lo2,
                                           svrev_s16(hi2));
                svint16_t E3 = svadd_s16_x(svptrue_b16(), lo3,
                                           svrev_s16(hi3));
                svint32_t eep, eop;
                build_epack_c1(E0, E1, E2, E3, eep, eop);
                int32_t ep[8], op[8];
                svst1_s32(svptrue_b32(), ep, eep);
                svst1_s32(svptrue_b32(), op, eop);
                for (int kk = 0; kk < 4; kk++)
                {
                    int k = kk * 8;
                    for (int r = 0; r < 4; r++)
                    {
                        int got;
                        if (k == 0)
                            got = (int)(((int64_t)ep[2 * r] * 64 +
                                         (int64_t)ep[2 * r + 1] * 64 +
                                         1024) >> 11);
                        else if (k == 16)
                            got = (int)(((int64_t)ep[2 * r] * 64 +
                                         (int64_t)ep[2 * r + 1] * -64 +
                                         1024) >> 11);
                        else if (k == 8)
                            got = (int)(((int64_t)op[2 * r] * 83 +
                                         (int64_t)op[2 * r + 1] * 36 +
                                         1024) >> 11);
                        else
                            got = (int)(((int64_t)op[2 * r] * 36 +
                                         (int64_t)op[2 * r + 1] * -83 +
                                         1024) >> 11);
                        K0Ref ref = k0_scalar_row(coef[row0 + r]);
                        int want = k0_scalar_out(ref, k, 11);
                        if (got != want)
                            bad++;
                    }
                }
            }
        }
        printf("structured-input mism=%ld (must be 0 for pass1-only)\n",
               bad);
        return 0;
    }
    if (two_pass)
    {
        long mism[4] = {0, 0, 0, 0};
        long ewrap = 0;
        long etot = 0;
        int32_t emax = 0;
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
                svint16_t E0 = svadd_s16_x(svptrue_b16(), lo0,
                                           svrev_s16(hi0));
                svint16_t E1 = svadd_s16_x(svptrue_b16(), lo1,
                                           svrev_s16(hi1));
                svint16_t E2 = svadd_s16_x(svptrue_b16(), lo2,
                                           svrev_s16(hi2));
                svint16_t E3 = svadd_s16_x(svptrue_b16(), lo3,
                                           svrev_s16(hi3));
                // quantify the pass2 E-wrap condition (full-pass E-pack
                // failure mode): count E values beyond s16 and max |E|.
                int16_t el[16];
                svst1_s16(svptrue_b16(), el, E0);
                for (int i = 0; i < 16; i++)
                {
                    if (abs((int)el[i]) > emax)
                        emax = abs((int)el[i]);
                    etot++;
                }
                svst1_s16(svptrue_b16(), el, E1);
                for (int i = 0; i < 16; i++)
                {
                    if (abs((int)el[i]) > emax)
                        emax = abs((int)el[i]);
                    etot++;
                }
                svst1_s16(svptrue_b16(), el, E2);
                for (int i = 0; i < 16; i++)
                {
                    if (abs((int)el[i]) > emax)
                        emax = abs((int)el[i]);
                    etot++;
                }
                svst1_s16(svptrue_b16(), el, E3);
                for (int i = 0; i < 16; i++)
                {
                    if (abs((int)el[i]) > emax)
                        emax = abs((int)el[i]);
                    etot++;
                }
                svint32_t eep, eop;
                build_epack_c1(E0, E1, E2, E3, eep, eop);
                int32_t ep[8], op[8];
                svst1_s32(svptrue_b32(), ep, eep);
                svst1_s32(svptrue_b32(), op, eop);
                // E-wrap indicator: exact E would need >16 bits; detect
                // by comparing s16 E with the exact s32 E per lane.
                {
                    svint32_t e0x = svadd_s32_x(svptrue_b32(),
                        svunpklo_s32(lo0), svunpklo_s32(svrev_s16(hi0)));
                    int32_t a[8];
                    svst1_s32(svptrue_b32(), a, e0x);
                    int16_t el[16];
                    svst1_s16(svptrue_b16(), el, E0);
                    for (int i = 0; i < 8; i++)
                        if (el[i] != (int16_t)a[i])
                            ewrap++;
                }
                for (int kk = 0; kk < 4; kk++)
                {
                    int k = kk * 8;
                    for (int r = 0; r < 4; r++)
                    {
                        int got;
                        if (k == 0)
                            got = (int)(((int64_t)ep[2 * r] * 64 +
                                         (int64_t)ep[2 * r + 1] * 64 +
                                         1024) >> 11);
                        else if (k == 16)
                            got = (int)(((int64_t)ep[2 * r] * 64 +
                                         (int64_t)ep[2 * r + 1] * -64 +
                                         1024) >> 11);
                        else if (k == 8)
                            got = (int)(((int64_t)op[2 * r] * 83 +
                                         (int64_t)op[2 * r + 1] * 36 +
                                         1024) >> 11);
                        else
                            got = (int)(((int64_t)op[2 * r] * 36 +
                                         (int64_t)op[2 * r + 1] * -83 +
                                         1024) >> 11);
                        K0Ref ref = k0_scalar_row(coef[row0 + r]);
                        int want = k0_scalar_out(ref, k, 11);
                        if (got != want)
                            mism[kk]++;
                        tot++;
                    }
                }
            }
        }
        for (int k = 0; k < 4; k++)
            printf("twopass k=%d mism=%ld/%ld (%.4f%%)\n",
                   k * 8, mism[k], tot / 4, 100.0 * mism[k] / (tot / 4));
        printf("pass2 E wrap lanes=%ld/%ld, max|E|=%d\n",
               ewrap, etot, emax);
        return 0;
    }
    long mism = 0;
    for (int it = 0; it < ncase; it++)
    {
        int16_t src[4][32];
        for (int r = 0; r < 4; r++)
            for (int j = 0; j < 32; j++)
                src[r][j] = (int16_t)((int)(rng() % 511) - 255);
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
        svint32_t eep, eop;
        build_s32_ee(L0, L1, L2, L3, H0, H1, H2, H3, eep, eop);
        // E-pack
        svint16_t E0 = svadd_s16_x(svptrue_b16(), lo0, svrev_s16(hi0));
        svint16_t E1 = svadd_s16_x(svptrue_b16(), lo1, svrev_s16(hi1));
        svint16_t E2 = svadd_s16_x(svptrue_b16(), lo2, svrev_s16(hi2));
        svint16_t E3 = svadd_s16_x(svptrue_b16(), lo3, svrev_s16(hi3));
        svint32_t eep1, eop1;
        build_epack_c1(E0, E1, E2, E3, eep1, eop1);
        if (it == 0)
        {
            print32("ref EEp", eep);
            print32("c1  EEp", eep1);
            print32("ref EOp", eop);
            print32("c1  EOp", eop1);
        }
        int32_t a[8], b[8], c[8], d[8];
        svst1_s32(svptrue_b32(), a, eep);
        svst1_s32(svptrue_b32(), b, eep1);
        svst1_s32(svptrue_b32(), c, eop);
        svst1_s32(svptrue_b32(), d, eop1);
        for (int i = 0; i < 8; i++)
            if (a[i] != b[i] || c[i] != d[i])
                mism++;
    }
    printf("mism=%ld/%d\n", mism, ncase * 16);
    return 0;
}
