// Probe: can pack(O) (the E-pack-style 2-level zip) directly produce the
// odd path's 4 slices? Compare build_slices' zip variant X0..X3 against
// the pack outputs q0/q1/q2r/q3r for 4 rows of O.
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

// pack: same as dct32_op_ir k0 pack
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

// odd zip slices (same as dct32_op_ir build_slices, slice_kind=zip)
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
    // fixed mapping: r_i[j] = 1000*i + j
    int16_t b0[16], b1[16], b2[16], b3[16];
    for (int j = 0; j < 16; j++)
    {
        b0[j] = (int16_t)(1000 * 0 + j);
        b1[j] = (int16_t)(1000 * 1 + j);
        b2[j] = (int16_t)(1000 * 2 + j);
        b3[j] = (int16_t)(1000 * 3 + j);
    }
    svint16_t r0 = svld1_s16(svptrue_b16(), b0);
    svint16_t r1 = svld1_s16(svptrue_b16(), b1);
    svint16_t r2 = svld1_s16(svptrue_b16(), b2);
    svint16_t r3 = svld1_s16(svptrue_b16(), b3);
    svint16_t X0, X1, X2, X3;
    odd_slices(r0, r1, r2, r3, X0, X1, X2, X3);
    svint16_t q0, q1, q2r, q3r;
    pack(r0, r1, r2, r3, q0, q1, q2r, q3r);
    print16("X0", X0);
    print16("q0", q0);
    print16("X1", X1);
    print16("q1", q1);
    print16("X2", X2);
    print16("q2r", q2r);
    print16("X3", X3);
    print16("q3r", q3r);
    return 0;
}
