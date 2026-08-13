// Probe: odd slices X0..X3 of O = lo - rv can be computed as
// L_q - R_q where L/R are the k0 packs of lo and rv (X0=L0-R0,
// X1=L1-R1, X2=L2r-R2r, X3=L3r-R3r with reversed constants for
// slices 2/3). Also verify pack(rv) reproduces the k0 e-chain pairing
// (L0,R0) == (L0,H3) and (L3,R3r) == (L3,H0).
// VL=256: qemu-aarch64 -cpu max,sve-max-vq=2
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
#include <random>

static inline svint16_t revh_d(svint16_t x)
{
    svint16_t r;
    asm volatile("revh %[r].d, %[p]/m, %[x].d"
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

static void odd_slices(svint16_t r0, svint16_t r1, svint16_t r2,
                       svint16_t r3, svint16_t& X0, svint16_t& X1,
                       svint16_t& X2, svint16_t& X3)
{
    svint64_t o0 = svreinterpret_s64_s16(r0);
    svint64_t o1 = svreinterpret_s64_s16(r1);
    svint64_t o2 = svreinterpret_s64_s16(r2);
    svint64_t o3 = svreinterpret_s64_s16(r3);
    svint64_t p01 = svzip1_s64(o0, o2);
    svint64_t p02 = svzip1_s64(o1, o3);
    svint64_t t11 = svtrn1_s64(o0, o2);
    svint64_t t12 = svtrn1_s64(o1, o3);
    svint64_t t21 = svtrn2_s64(o0, o2);
    svint64_t t22 = svtrn2_s64(o1, o3);
    X0 = svreinterpret_s16_s64(svzip1_s64(p01, p02));
    X1 = svreinterpret_s16_s64(svzip1_s64(t21, t22));
    X2 = svreinterpret_s16_s64(svzip2_s64(t11, t12));
    X3 = svreinterpret_s16_s64(svzip2_s64(t21, t22));
}

static long mism = 0;
static void chk(const char* tag, svint16_t a, svint16_t b)
{
    int16_t x[16], y[16];
    svst1_s16(svptrue_b16(), x, a);
    svst1_s16(svptrue_b16(), y, b);
    long bad = 0;
    for (int i = 0; i < 16; i++)
        if (x[i] != y[i])
            bad++;
    if (bad)
        printf("%s mism=%ld\n", tag, bad);
    mism += bad;
}

int main(int argc, char** argv)
{
    const int ncase = argc > 1 ? atoi(argv[1]) : 200;
    std::mt19937 rng(0x0DDA21u);
    for (int it = 0; it < ncase; it++)
    {
        int16_t b0[32], b1[32], b2[32], b3[32];
        for (int j = 0; j < 32; j++)
        {
            b0[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            b1[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            b2[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            b3[j] = (int16_t)((int)(rng() % 65536u) - 32768);
        }
        svint16_t lo0 = svld1_s16(svptrue_b16(), b0);
        svint16_t lo1 = svld1_s16(svptrue_b16(), b1);
        svint16_t lo2 = svld1_s16(svptrue_b16(), b2);
        svint16_t lo3 = svld1_s16(svptrue_b16(), b3);
        svint16_t hi0 = svld1_s16(svptrue_b16(), b0 + 16);
        svint16_t hi1 = svld1_s16(svptrue_b16(), b1 + 16);
        svint16_t hi2 = svld1_s16(svptrue_b16(), b2 + 16);
        svint16_t hi3 = svld1_s16(svptrue_b16(), b3 + 16);
        svint16_t rv0 = svrev_s16(hi0);
        svint16_t rv1 = svrev_s16(hi1);
        svint16_t rv2 = svrev_s16(hi2);
        svint16_t rv3 = svrev_s16(hi3);
        svint16_t O0 = svsub_s16_x(svptrue_b16(), lo0, rv0);
        svint16_t O1 = svsub_s16_x(svptrue_b16(), lo1, rv1);
        svint16_t O2 = svsub_s16_x(svptrue_b16(), lo2, rv2);
        svint16_t O3 = svsub_s16_x(svptrue_b16(), lo3, rv3);
        // reference odd slices
        svint16_t X0, X1, X2, X3;
        odd_slices(O0, O1, O2, O3, X0, X1, X2, X3);
        // k0 packs: lo and rv
        svint16_t L0, L1, L2r, L3r, R0, R1, R2r, R3r;
        pack(lo0, lo1, lo2, lo3, L0, L1, L2r, L3r);
        pack(rv0, rv1, rv2, rv3, R0, R1, R2r, R3r);
        // candidate slices
        svint16_t Y0 = svsub_s16_x(svptrue_b16(), L0, R0);
        svint16_t Y1 = svsub_s16_x(svptrue_b16(), L1, R1);
        svint16_t Y2 = svsub_s16_x(svptrue_b16(), L2r, R2r);
        svint16_t Y3 = svsub_s16_x(svptrue_b16(), L3r, R3r);
        chk("X0", X0, Y0);
        chk("X1", X1, Y1);
        // X2/X3: reversed-order slices vs reference (report only)
        chk("X2", X2, Y2);
        chk("X3", X3, Y3);
        // e-chain pairing equivalence: saddlb(L0,R0) vs saddlb(L0,H3)
        svint16_t H0, H1, H2r, H3r;
        pack(hi0, hi1, hi2, hi3, H0, H1, H2r, H3r);
        svint32_t a = svaddlb_s32(L0, R0);
        svint32_t b = svaddlb_s32(L0, H3r);
        int32_t av[8], bv[8];
        svst1_s32(svptrue_b32(), av, a);
        svst1_s32(svptrue_b32(), bv, b);
        for (int i = 0; i < 8; i++)
            if (av[i] != bv[i])
            {
                mism++;
                if (it == 0) printf("pair0 lane %d %d vs %d\n",
                                    i, av[i], bv[i]);
            }
        svint32_t c = svaddlb_s32(L3r, R3r);
        svint32_t d = svaddlb_s32(L3r, H0);
        int32_t cv[8], dv[8];
        svst1_s32(svptrue_b32(), cv, c);
        svst1_s32(svptrue_b32(), dv, d);
        for (int i = 0; i < 8; i++)
            if (cv[i] != dv[i])
                mism++;
    }
    printf("total mism=%ld\n", mism);
    return 0;
}
