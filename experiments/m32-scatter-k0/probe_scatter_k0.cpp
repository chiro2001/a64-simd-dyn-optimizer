// Probe: dct32 k0-family scatter store lane math (VL=256, SVE2).
//
// Emitter chain (k0 family, docs/20 §6.6):
//   k0m = mul(src, const)           8 x s32
//   k0p = addp_s32(k0m, k0m)        [m0+m1, m0+m1, m2+m3, m2+m3, ...]
//   k0x = uzp1_s32(k0p, k0p)        [x0, x1, x2, x3, x0, x1, x2, x3]
//   where xj = m[2j]+m[2j+1] is one output column.
//
// Reference store: tbl2 merge (2 packs -> 8 s32) -> rshrnb -> uzp1_s16
// -> st1h(8).
//
// Scatter candidate: per row per pack
//   rshrnb(k0x) -> uzp1_s16  (64-bit group = row's 4 outputs, duplicated
//                             across all 4 s64 lanes)
//   combine 4 rows with 3x uzp1_s64:
//     A = uzp1_s64(u0, u1) = [u0,u0,u1,u1]
//     B = uzp1_s64(u2, u3) = [u2,u2,u3,u3]
//     C = uzp1_s64(A, B)   = [u0,u1,u2,u3]
//   one scatter st1d (unscaled byte offsets) writes the 4 rows at
//   x265 dct32 row stride 64 bytes.

#include <arm_sve.h>
#include <cstdint>
#include <cstdio>
#include <cstring>

static inline svint32_t addp_s32(svint32_t a, svint32_t b)
{
    svint32_t r = a;
    asm volatile("addp %[r].s, %[p]/m, %[r].s, %[b].s"
                 : [r] "+w" (r)
                 : [b] "w" (b), [p] "Upl" (svptrue_b32()));
    return r;
}

static inline void st1d_scatter_s16(int16_t* base, svint64_t offs,
                                    svint16_t data)
{
    asm volatile("st1d {%[d].d}, %[p], [%[b], %[o].d]"
                 :
                 : [d] "w" (data), [b] "r" (base), [o] "w" (offs),
                   [p] "Upl" (svptrue_b64())
                 : "memory");
}

// Mimic emitter k0x: m = [v0..v3, w0..w3], k0x = [m0+m1, m2+m3, m4+m5,
// m6+m7] duplicated.
static svint32_t k0x_from_vals(const int m[8])
{
    svint32_t mv = svld1_s32(svptrue_b32(), m);
    svint32_t p = addp_s32(mv, mv);
    return svuzp1_s32(p, p);
}

static svint32_t k0p_from_vals(const int m[8])
{
    svint32_t mv = svld1_s32(svptrue_b32(), m);
    return addp_s32(mv, mv);
}

static void ref_store_pair(svint32_t pa, svint32_t pb, int16_t* dst_row,
                           int pi, svuint32_t idx8, svbool_t p8h)
{
    svint32_t mg = svtbl2_s32(svcreate2_s32(pa, pb), idx8);
    svint16_t na = svrshrnb_n_s32(mg, 4);
    svint16_t nc = svuzp1_s16(na, na);
    svst1_s16(p8h, dst_row + 8 * pi, nc);
}

static void scatter_pack(svint32_t p0, svint32_t p1, svint32_t p2,
                         svint32_t p3, int16_t* dst_base, svint64_t offs)
{
    svint16_t na0 = svrshrnb_n_s32(p0, 4);
    svint16_t na1 = svrshrnb_n_s32(p1, 4);
    svint16_t na2 = svrshrnb_n_s32(p2, 4);
    svint16_t na3 = svrshrnb_n_s32(p3, 4);
    svint16_t u0 = svuzp1_s16(na0, na0);
    svint16_t u1 = svuzp1_s16(na1, na1);
    svint16_t u2 = svuzp1_s16(na2, na2);
    svint16_t u3 = svuzp1_s16(na3, na3);
    svint64_t A = svuzp1_s64(svreinterpret_s64_s16(u0),
                             svreinterpret_s64_s16(u1));
    svint64_t B = svuzp1_s64(svreinterpret_s64_s16(u2),
                             svreinterpret_s64_s16(u3));
    svint64_t C = svuzp1_s64(A, B);
    st1d_scatter_s16(dst_base, offs, svreinterpret_s16_s64(C));
}

// Contiguous-16 variant: per row, uzp1_s32(packA, packB) concatenates the
// two 4-lane groups (no tbl2), one rshrnb each, then
// uzp1_s16(na0, na1) concatenates the 8+8 narrowed outputs into 16
// contiguous lanes -> one p16 st1h.
static void contig16_row(svint32_t q0, svint32_t q1, svint32_t q2,
                         svint32_t q3, int16_t* dst_row)
{
    // k0p lanes: [x0,x0,x1,x1,x2,x2,x3,x3] -> uzp1_s32(k0p_a, k0p_b)
    // concatenates the two 4-output groups without tbl2/k0x.
    svint32_t mg0 = svuzp1_s32(q0, q1);
    svint32_t mg1 = svuzp1_s32(q2, q3);
    svint16_t na0 = svrshrnb_n_s32(mg0, 4);
    svint16_t na1 = svrshrnb_n_s32(mg1, 4);
    svint16_t n16 = svuzp1_s16(na0, na1);
    svst1_s16(svptrue_b16(), dst_row, n16);
}

int main()
{
    const int shift = 4;
    const int add = 8;              // rshrnb rounding term: 2^(shift-1)
    const int rows[4] = {0, 8, 16, 24};
    int16_t ref[32 * 32];
    int16_t got[32 * 32];
    memset(ref, 0, sizeof(ref));
    memset(got, 0, sizeof(got));

    svbool_t p8h = svptrue_pat_b16(SV_VL8);
    svbool_t p64 = svptrue_b64();

    // Four rows; each row has 16 outputs = 4 packs of 4 columns.
    // Pack b of row i: outputs = adjacent-pair sums of
    // [1000*row + 16b + j (j=0..3), 9000*row + 16b + j].
    int16_t expect[4][16];
    int m[4][4][8];
    for (int i = 0; i < 4; i++) {
        for (int b = 0; b < 4; b++) {
            int v[4], w[4];
            for (int j = 0; j < 4; j++) {
                v[j] = 1000 * rows[i] + 16 * b + j;
                w[j] = 9000 * rows[i] + 16 * b + j;
                m[i][b][j] = v[j];
                m[i][b][j + 4] = w[j];
            }
            // k0x outputs are adjacent-pair sums of the 8-lane m vector:
            // x0 = m0+m1, x1 = m2+m3, x2 = m4+m5, x3 = m6+m7.
            expect[i][4 * b + 0] = (int16_t)((v[0] + v[1] + add) >> shift);
            expect[i][4 * b + 1] = (int16_t)((v[2] + v[3] + add) >> shift);
            expect[i][4 * b + 2] = (int16_t)((w[0] + w[1] + add) >> shift);
            expect[i][4 * b + 3] = (int16_t)((w[2] + w[3] + add) >> shift);
        }
    }
    svint32_t r0b0 = k0x_from_vals(m[0][0]), r0b1 = k0x_from_vals(m[0][1]);
    svint32_t r0b2 = k0x_from_vals(m[0][2]), r0b3 = k0x_from_vals(m[0][3]);
    svint32_t r1b0 = k0x_from_vals(m[1][0]), r1b1 = k0x_from_vals(m[1][1]);
    svint32_t r1b2 = k0x_from_vals(m[1][2]), r1b3 = k0x_from_vals(m[1][3]);
    svint32_t r2b0 = k0x_from_vals(m[2][0]), r2b1 = k0x_from_vals(m[2][1]);
    svint32_t r2b2 = k0x_from_vals(m[2][2]), r2b3 = k0x_from_vals(m[2][3]);
    svint32_t r3b0 = k0x_from_vals(m[3][0]), r3b1 = k0x_from_vals(m[3][1]);
    svint32_t r3b2 = k0x_from_vals(m[3][2]), r3b3 = k0x_from_vals(m[3][3]);
    svint32_t q0b0 = k0p_from_vals(m[0][0]), q0b1 = k0p_from_vals(m[0][1]);
    svint32_t q0b2 = k0p_from_vals(m[0][2]), q0b3 = k0p_from_vals(m[0][3]);
    svint32_t q1b0 = k0p_from_vals(m[1][0]), q1b1 = k0p_from_vals(m[1][1]);
    svint32_t q1b2 = k0p_from_vals(m[1][2]), q1b3 = k0p_from_vals(m[1][3]);
    svint32_t q2b0 = k0p_from_vals(m[2][0]), q2b1 = k0p_from_vals(m[2][1]);
    svint32_t q2b2 = k0p_from_vals(m[2][2]), q2b3 = k0p_from_vals(m[2][3]);
    svint32_t q3b0 = k0p_from_vals(m[3][0]), q3b1 = k0p_from_vals(m[3][1]);
    svint32_t q3b2 = k0p_from_vals(m[3][2]), q3b3 = k0p_from_vals(m[3][3]);
    int16_t got16[32 * 32];
    memset(got16, 0, sizeof(got16));
    contig16_row(q0b0, q0b1, q0b2, q0b3, got16 + 0 * 32);
    contig16_row(q1b0, q1b1, q1b2, q1b3, got16 + 8 * 32);
    contig16_row(q2b0, q2b1, q2b2, q2b3, got16 + 16 * 32);
    contig16_row(q3b0, q3b1, q3b2, q3b3, got16 + 24 * 32);

    // Reference: current emitter chain for one row, one pair of packs.
    static const uint32_t IDX_S8[8] = {0, 1, 2, 3, 8, 9, 10, 11};
    svuint32_t idx8 = svld1_u32(svptrue_b32(), IDX_S8);
    ref_store_pair(r0b0, r0b1, ref + 0 * 32, 0, idx8, p8h);
    ref_store_pair(r0b2, r0b3, ref + 0 * 32, 1, idx8, p8h);
    ref_store_pair(r1b0, r1b1, ref + 8 * 32, 0, idx8, p8h);
    ref_store_pair(r1b2, r1b3, ref + 8 * 32, 1, idx8, p8h);
    ref_store_pair(r2b0, r2b1, ref + 16 * 32, 0, idx8, p8h);
    ref_store_pair(r2b2, r2b3, ref + 16 * 32, 1, idx8, p8h);
    ref_store_pair(r3b0, r3b1, ref + 24 * 32, 0, idx8, p8h);
    ref_store_pair(r3b2, r3b3, ref + 24 * 32, 1, idx8, p8h);

    // Scatter candidate.
    static const int64_t OFF_P1[4] = {0, 512, 1024, 1536};
    svint64_t offs = svld1_s64(p64, OFF_P1);
    scatter_pack(r0b0, r1b0, r2b0, r3b0, got + 0, offs);
    scatter_pack(r0b1, r1b1, r2b1, r3b1, got + 4, offs);
    scatter_pack(r0b2, r1b2, r2b2, r3b2, got + 8, offs);
    scatter_pack(r0b3, r1b3, r2b3, r3b3, got + 12, offs);

    int bad = 0;
    for (int r = 0; r < 32; r++) {
        for (int c = 0; c < 32; c++) {
            int ri = -1;
            for (int i = 0; i < 4; i++)
                if (rows[i] == r) ri = i;
            int16_t want = (ri >= 0 && c < 16) ? expect[ri][c] : 0;
            if (ref[r * 32 + c] != want) {
                printf("REF mismatch r=%d c=%d got=%d want=%d\n",
                       r, c, ref[r * 32 + c], want);
                bad++;
            }
            if (got[r * 32 + c] != want) {
                printf("GOT mismatch r=%d c=%d got=%d want=%d\n",
                       r, c, got[r * 32 + c], want);
                bad++;
            }
            if (got16[r * 32 + c] != want) {
                printf("GOT16 mismatch r=%d c=%d got=%d want=%d\n",
                       r, c, got16[r * 32 + c], want);
                bad++;
            }
        }
    }
    printf("scatter/contig16 k0 probe: %s (%d mismatches)\n",
           bad ? "FAIL" : "PASS", bad);
    return bad ? 1 : 0;
}
