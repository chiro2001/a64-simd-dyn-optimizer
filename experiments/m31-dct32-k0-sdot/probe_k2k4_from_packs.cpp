// Probe: k2/k4 slices can derive from the k0 lo/rv packs:
//   E16 = L+R; rev(E16) slices = the q3r/q2r slices of (L+R);
//   k2 EX0 = (L0+R0) - (L3r+R3r), EX1 = (L1+R1) - (L2r+R2r);
//   EE16 = E16 + rev(E16): slice_X0 = (L0+R0)+(L3r+R3r),
//                           slice_X1 = (L1+R1)+(L2r+R2r);
//   rev8(EE16) slice_X0 = revh(slice_X1(EE16));
//   k4 EX0 = slice_X0(EE16) - revh(slice_X1(EE16)).
// Compare against the current zip constructions on eo16/eeo16.
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

// current k2 slice (zip): EX0/EX1 from eo16 rows
static void k2_slice(svint16_t r0, svint16_t r1, svint16_t r2, svint16_t r3,
                     svint16_t& EX0, svint16_t& EX1)
{
    svint64_t a0 = svreinterpret_s64_s16(r0);
    svint64_t a1 = svreinterpret_s64_s16(r1);
    svint64_t a2 = svreinterpret_s64_s16(r2);
    svint64_t a3 = svreinterpret_s64_s16(r3);
    EX0 = svreinterpret_s16_s64(
        svzip1_s64(svzip1_s64(a0, a2), svzip1_s64(a1, a3)));
    EX1 = svreinterpret_s16_s64(
        svzip1_s64(svtrn2_s64(a0, a2), svtrn2_s64(a1, a3)));
}

// current k4 slice (zip): Xk4 from eeo16 rows
static svint16_t k4_slice(svint16_t r0, svint16_t r1, svint16_t r2,
                          svint16_t r3)
{
    svint64_t a0 = svreinterpret_s64_s16(r0);
    svint64_t a1 = svreinterpret_s64_s16(r1);
    svint64_t a2 = svreinterpret_s64_s16(r2);
    svint64_t a3 = svreinterpret_s64_s16(r3);
    return svreinterpret_s16_s64(
        svzip1_s64(svzip1_s64(a0, a2), svzip1_s64(a1, a3)));
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
    const int ncase = argc > 1 ? atoi(argv[1]) : 300;
    std::mt19937 rng(0x2A44B1u);
    const uint16_t rev8i[16] =
        { 7,6,5,4,3,2,1,0, 15,14,13,12,11,10,9,8 };
    const svuint16_t rev8 = svld1_u16(svptrue_b16(), rev8i);
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
        svint16_t rv0 = svrev_s16(svld1_s16(svptrue_b16(), b0 + 16));
        svint16_t rv1 = svrev_s16(svld1_s16(svptrue_b16(), b1 + 16));
        svint16_t rv2 = svrev_s16(svld1_s16(svptrue_b16(), b2 + 16));
        svint16_t rv3 = svrev_s16(svld1_s16(svptrue_b16(), b3 + 16));
        svint16_t L0, L1, L2r, L3r, R0, R1, R2r, R3r;
        pack(lo0, lo1, lo2, lo3, L0, L1, L2r, L3r);
        pack(rv0, rv1, rv2, rv3, R0, R1, R2r, R3r);
        // per-row leaf values
        svint16_t E0 = svadd_s16_x(svptrue_b16(), lo0, rv0);
        svint16_t E1 = svadd_s16_x(svptrue_b16(), lo1, rv1);
        svint16_t E2 = svadd_s16_x(svptrue_b16(), lo2, rv2);
        svint16_t E3 = svadd_s16_x(svptrue_b16(), lo3, rv3);
        svint16_t EO0 = svsub_s16_x(svptrue_b16(), E0, svrev_s16(E0));
        svint16_t EO1 = svsub_s16_x(svptrue_b16(), E1, svrev_s16(E1));
        svint16_t EO2 = svsub_s16_x(svptrue_b16(), E2, svrev_s16(E2));
        svint16_t EO3 = svsub_s16_x(svptrue_b16(), E3, svrev_s16(E3));
        // k2 reference
        svint16_t EX0, EX1;
        k2_slice(EO0, EO1, EO2, EO3, EX0, EX1);
        // k2 candidate: (L0+R0)-(L3r+R3r), (L1+R1)-(L2r+R2r)
        svint16_t Y0 = svsub_s16_x(svptrue_b16(),
            svadd_s16_x(svptrue_b16(), L0, R0),
            svadd_s16_x(svptrue_b16(), L3r, R3r));
        svint16_t Y1 = svsub_s16_x(svptrue_b16(),
            svadd_s16_x(svptrue_b16(), L1, R1),
            svadd_s16_x(svptrue_b16(), L2r, R2r));
        chk("k2 EX0", EX0, Y0);
        chk("k2 EX1", EX1, Y1);
        // k4 reference
        svint16_t EE0 = svadd_s16_x(svptrue_b16(), E0, svrev_s16(E0));
        svint16_t EE1 = svadd_s16_x(svptrue_b16(), E1, svrev_s16(E1));
        svint16_t EE2 = svadd_s16_x(svptrue_b16(), E2, svrev_s16(E2));
        svint16_t EE3 = svadd_s16_x(svptrue_b16(), E3, svrev_s16(E3));
        svint16_t EEO0 = svsub_s16_x(svptrue_b16(), EE0,
                                     svtbl_s16(EE0, rev8));
        svint16_t EEO1 = svsub_s16_x(svptrue_b16(), EE1,
                                     svtbl_s16(EE1, rev8));
        svint16_t EEO2 = svsub_s16_x(svptrue_b16(), EE2,
                                     svtbl_s16(EE2, rev8));
        svint16_t EEO3 = svsub_s16_x(svptrue_b16(), EE3,
                                     svtbl_s16(EE3, rev8));
        svint16_t Xk4 = k4_slice(EEO0, EEO1, EEO2, EEO3);
        // k4 candidate:
        // sX0 = (L0+R0)+(L3r+R3r); sX1 = (L1+R1)+(L2r+R2r)
        // Xk4 = sX0 - revh(sX1)
        svint16_t sX0 = svadd_s16_x(svptrue_b16(),
            svadd_s16_x(svptrue_b16(), L0, R0),
            svadd_s16_x(svptrue_b16(), L3r, R3r));
        svint16_t sX1 = svadd_s16_x(svptrue_b16(),
            svadd_s16_x(svptrue_b16(), L1, R1),
            svadd_s16_x(svptrue_b16(), L2r, R2r));
        svint16_t Yk4 = svsub_s16_x(svptrue_b16(), sX0, revh_d(sX1));
        chk("k4 Xk4", Xk4, Yk4);
    }
    printf("total mism=%ld\n", mism);
    return 0;
}
