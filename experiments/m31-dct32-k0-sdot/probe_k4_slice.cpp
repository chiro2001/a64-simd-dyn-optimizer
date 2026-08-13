// Probe: does slice(rev8(EE16)) == revh_d(slice(EE16)) for the k4 zip
// slice construction? If yes, EEO16's per-row rev8 tbl can be replaced by
// a revh on the slice (per-slice 2 ops vs per-row 2 ops -> half the ops).
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

// k4 zip slice for 4 rows (same as dct32_op_ir k4 slice, slice_kind=zip)
static svint16_t k4_slice(svint16_t r0, svint16_t r1, svint16_t r2,
                          svint16_t r3)
{
    svint64_t a0 = svreinterpret_s64_s16(r0);
    svint64_t a1 = svreinterpret_s64_s16(r1);
    svint64_t a2 = svreinterpret_s64_s16(r2);
    svint64_t a3 = svreinterpret_s64_s16(r3);
    svint64_t z1 = svzip1_s64(a0, a2);
    svint64_t z2 = svzip1_s64(a1, a3);
    return svreinterpret_s16_s64(svzip1_s64(z1, z2));
}

static const uint16_t IDX_REV8[16] =
    { 7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8 };

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
    if (argc > 2)
    {
        // fixed mapping probe: r_i[j] = 1000*i + j
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
        const svuint16_t rev8 = svld1_u16(svptrue_b16(), IDX_REV8);
        print16("slice(r)", k4_slice(r0, r1, r2, r3));
        print16("slice(rev8)", k4_slice(svtbl_s16(r0, rev8),
                                        svtbl_s16(r1, rev8),
                                        svtbl_s16(r2, rev8),
                                        svtbl_s16(r3, rev8)));
        return 0;
    }
    const int ncase = argc > 1 ? atoi(argv[1]) : 200;
    std::mt19937 rng(0x5A7E21u);
    const svuint16_t rev8 = svld1_u16(svptrue_b16(), IDX_REV8);
    long mism = 0;
    for (int it = 0; it < ncase; it++)
    {
        int16_t buf0[16], buf1[16], buf2[16], buf3[16];
        for (int j = 0; j < 16; j++)
        {
            buf0[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            buf1[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            buf2[j] = (int16_t)((int)(rng() % 65536u) - 32768);
            buf3[j] = (int16_t)((int)(rng() % 65536u) - 32768);
        }
        svint16_t r0 = svld1_s16(svptrue_b16(), buf0);
        svint16_t r1 = svld1_s16(svptrue_b16(), buf1);
        svint16_t r2 = svld1_s16(svptrue_b16(), buf2);
        svint16_t r3 = svld1_s16(svptrue_b16(), buf3);
        // A: slice of rev8 rows
        svint16_t A = k4_slice(svtbl_s16(r0, rev8), svtbl_s16(r1, rev8),
                               svtbl_s16(r2, rev8), svtbl_s16(r3, rev8));
        // B: revh of slice
        svint16_t S = k4_slice(r0, r1, r2, r3);
        svint16_t B = revh_d(S);
        if (it == 0)
        {
            print16("A slice(rev8)", A);
            print16("B revh(slice)", B);
        }
        int16_t a[16], b[16];
        svst1_s16(svptrue_b16(), a, A);
        svst1_s16(svptrue_b16(), b, B);
        for (int i = 0; i < 16; i++)
            if (a[i] != b[i])
                mism++;
    }
    printf("mism=%ld/%d\n", mism, ncase * 16);
    return 0;
}
