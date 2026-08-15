/* SVE1 instruction latency/throughput microbenchmark for the AGO
 * predictor (2026-08-16). Classes are the ones the gen backend
 * actually emits for satd/sa8d/dct/interp candidates:
 *   add_s16 sub_s16 mul_s16 abs_s16 sabd_s16 mla_s16
 *   uaddv_s32 (reduce) tbl_s16 ld1b_s8 (256-bit load)
 *   sdot_s32_8b (SDOT 8-bit -> 32-bit, SVE1)
 * Protocol: min-of-7 CNTVCT; dependent-chain latency with a varying
 * operand; 8 independent chains for throughput; calib_dbl converts
 * ticks to cycles (dependent scalar add = 1 cyc/iter by design).
 */
#include <arm_sve.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define REPS 7
#define ITERS 2000000
#define NCHAIN 8

static uint64_t rdtsc(void) {
    uint64_t t;
    asm volatile("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static volatile uint64_t sink;

static double run_lat(uint64_t (*fn)(uint64_t, uint64_t), uint64_t n) {
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, n);
        uint64_t t1 = rdtsc();
        sink = v;
        double cyc = (double)(t1 - t0) / n;
        if (cyc < best) best = cyc;
    }
    return best;
}

static double run_thr(uint64_t (*fn)(uint64_t, uint64_t), uint64_t n) {
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, n / NCHAIN);
        uint64_t t1 = rdtsc();
        sink = v;
        double cyc = (double)(t1 - t0) / (n / NCHAIN) / NCHAIN;
        if (cyc < best) best = cyc;
    }
    return best;
}

static uint64_t empty_lat(uint64_t acc, uint64_t n) {
    for (uint64_t i = 0; i < n; i++) acc += i;
    return acc;
}

static uint64_t calib_dbl(uint64_t acc, uint64_t n) {
    uint64_t x = acc ? acc : 1;
    for (uint64_t i = 0; i < n; i++) x = x + x;
    return x;
}

/* ---- generic 8-chain throughput body via macro ---- */
#define THR_BODY(OP, T, TYPE, DUP, ACC, ADDV)                                 \
    svbool_t pg = svptrue_##T();                                              \
    TYPE b = DUP(1);                                                          \
    TYPE a0 = DUP(acc + 0); TYPE a1 = DUP(acc + 1);                           \
    TYPE a2 = DUP(acc + 2); TYPE a3 = DUP(acc + 3);                           \
    TYPE a4 = DUP(acc + 4); TYPE a5 = DUP(acc + 5);                           \
    TYPE a6 = DUP(acc + 6); TYPE a7 = DUP(acc + 7);                           \
    for (uint64_t i = 0; i < n; i++) {                                        \
        a0 = OP(pg, a0, b); a1 = OP(pg, a1, b); a2 = OP(pg, a2, b);           \
        a3 = OP(pg, a3, b); a4 = OP(pg, a4, b); a5 = OP(pg, a5, b);           \
        a6 = OP(pg, a6, b); a7 = OP(pg, a7, b);                               \
    }                                                                         \
    return (uint64_t)ADDV(pg, a0) + (uint64_t)ADDV(pg, a1)                    \
         + (uint64_t)ADDV(pg, a2) + (uint64_t)ADDV(pg, a3)                    \
         + (uint64_t)ADDV(pg, a4) + (uint64_t)ADDV(pg, a5)                    \
         + (uint64_t)ADDV(pg, a6) + (uint64_t)ADDV(pg, a7);

#define LAT_BODY(OP, T, TYPE, DUP, ACC, ADDV, ONE)                            \
    svbool_t pg = svptrue_##T();                                              \
    TYPE a = DUP(acc & 0xffff);                                               \
    TYPE b = DUP(1);                                                          \
    TYPE one = DUP(1);                                                        \
    for (uint64_t i = 0; i < n; i++) {                                        \
        a = OP(pg, a, b);                                                     \
        b = OP(pg, b, one);   /* varying operand: no closed form */           \
    }                                                                         \
    return (uint64_t)ADDV(pg, a);

#define DEF_BINOP(NAME, OP, T, TYPE, DUP, ADDV)                               \
static uint64_t NAME##_lat(uint64_t acc, uint64_t n) {                        \
    LAT_BODY(OP, T, TYPE, DUP, acc, ADDV, 1)                                  \
}                                                                             \
static uint64_t NAME##_thr(uint64_t acc, uint64_t n) {                        \
    THR_BODY(OP, T, TYPE, DUP, acc, ADDV)                                     \
}

DEF_BINOP(add_s16, svadd_s16_x, b16, svint16_t, svdup_s16, svaddv_s16)
DEF_BINOP(sub_s16, svsub_s16_x, b16, svint16_t, svdup_s16, svaddv_s16)
DEF_BINOP(mul_s16, svmul_s16_x, b16, svint16_t, svdup_s16, svaddv_s16)
DEF_BINOP(sabd_s16, svabd_s16_x, b16, svint16_t, svdup_s16, svaddv_s16)

/* abs is unary: chain a = abs(a - 1) (abs + sub per iter) */
static uint64_t abs_s16_lat(uint64_t acc, uint64_t n) {
    svint16_t a = svdup_s16((int16_t)(acc & 0x7fff) | 0x8000);
    svint16_t one = svdup_s16(1);
    svbool_t pg = svptrue_b16();
    for (uint64_t i = 0; i < n; i++)
        a = svabs_s16_x(pg, svsub_s16_x(pg, a, one));
    return (uint64_t)svaddv_s16(pg, a);
}

static uint64_t abs_s16_thr(uint64_t acc, uint64_t n) {
    svint16_t one = svdup_s16(1);
    svbool_t pg = svptrue_b16();
    svint16_t a0 = svdup_s16(acc + 0); svint16_t a1 = svdup_s16(acc + 1);
    svint16_t a2 = svdup_s16(acc + 2); svint16_t a3 = svdup_s16(acc + 3);
    svint16_t a4 = svdup_s16(acc + 4); svint16_t a5 = svdup_s16(acc + 5);
    svint16_t a6 = svdup_s16(acc + 6); svint16_t a7 = svdup_s16(acc + 7);
    for (uint64_t i = 0; i < n; i++) {
        a0 = svabs_s16_x(pg, svsub_s16_x(pg, a0, one));
        a1 = svabs_s16_x(pg, svsub_s16_x(pg, a1, one));
        a2 = svabs_s16_x(pg, svsub_s16_x(pg, a2, one));
        a3 = svabs_s16_x(pg, svsub_s16_x(pg, a3, one));
        a4 = svabs_s16_x(pg, svsub_s16_x(pg, a4, one));
        a5 = svabs_s16_x(pg, svsub_s16_x(pg, a5, one));
        a6 = svabs_s16_x(pg, svsub_s16_x(pg, a6, one));
        a7 = svabs_s16_x(pg, svsub_s16_x(pg, a7, one));
    }
    return (uint64_t)svaddv_s16(svptrue_b16(), a0)
         + (uint64_t)svaddv_s16(svptrue_b16(), a1)
         + (uint64_t)svaddv_s16(svptrue_b16(), a2)
         + (uint64_t)svaddv_s16(svptrue_b16(), a3)
         + (uint64_t)svaddv_s16(svptrue_b16(), a4)
         + (uint64_t)svaddv_s16(svptrue_b16(), a5)
         + (uint64_t)svaddv_s16(svptrue_b16(), a6)
         + (uint64_t)svaddv_s16(svptrue_b16(), a7);
}

/* mla has 3 operands (addend, x, y): separate body */
static uint64_t mla_s16_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    svint16_t a = svdup_s16((int16_t)(acc & 0xffff));
    svint16_t x = svdup_s16(1);
    svint16_t y = svdup_s16(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svmla_s16_x(pg, a, x, y);
        x = svadd_s16_x(pg, x, svdup_s16(1));   /* varying operand */
    }
    return (uint64_t)svaddv_s16(pg, a);
}

static uint64_t mla_s16_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    svint16_t x = svdup_s16(1);
    svint16_t y = svdup_s16(1);
    svint16_t a0 = svdup_s16(acc + 0); svint16_t a1 = svdup_s16(acc + 1);
    svint16_t a2 = svdup_s16(acc + 2); svint16_t a3 = svdup_s16(acc + 3);
    svint16_t a4 = svdup_s16(acc + 4); svint16_t a5 = svdup_s16(acc + 5);
    svint16_t a6 = svdup_s16(acc + 6); svint16_t a7 = svdup_s16(acc + 7);
    for (uint64_t i = 0; i < n; i++) {
        a0 = svmla_s16_x(pg, a0, x, y); a1 = svmla_s16_x(pg, a1, x, y);
        a2 = svmla_s16_x(pg, a2, x, y); a3 = svmla_s16_x(pg, a3, x, y);
        a4 = svmla_s16_x(pg, a4, x, y); a5 = svmla_s16_x(pg, a5, x, y);
        a6 = svmla_s16_x(pg, a6, x, y); a7 = svmla_s16_x(pg, a7, x, y);
    }
    return (uint64_t)svaddv_s16(pg, a0) + (uint64_t)svaddv_s16(pg, a1)
         + (uint64_t)svaddv_s16(pg, a2) + (uint64_t)svaddv_s16(pg, a3)
         + (uint64_t)svaddv_s16(pg, a4) + (uint64_t)svaddv_s16(pg, a5)
         + (uint64_t)svaddv_s16(pg, a6) + (uint64_t)svaddv_s16(pg, a7);
}

/* ---- uaddv reduce: vector -> scalar dependent chain ---- */
static uint64_t uaddv_s32_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b32();
    svuint32_t a = svdup_u32((uint32_t)(acc & 0xffff));
    for (uint64_t i = 0; i < n; i++) {
        const uint32_t s = svaddv_u32(pg, a);
        a = svdup_u32(s + 1);   /* dependent on the reduction result */
    }
    return (uint64_t)svaddv_u32(pg, a);
}

static uint64_t uaddv_s32_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b32();
    svuint32_t a0 = svdup_u32(acc + 0); svuint32_t a1 = svdup_u32(acc + 1);
    svuint32_t a2 = svdup_u32(acc + 2); svuint32_t a3 = svdup_u32(acc + 3);
    svuint32_t a4 = svdup_u32(acc + 4); svuint32_t a5 = svdup_u32(acc + 5);
    svuint32_t a6 = svdup_u32(acc + 6); svuint32_t a7 = svdup_u32(acc + 7);
    for (uint64_t i = 0; i < n; i++) {
        uint32_t s0 = svaddv_u32(pg, a0); uint32_t s1 = svaddv_u32(pg, a1);
        uint32_t s2 = svaddv_u32(pg, a2); uint32_t s3 = svaddv_u32(pg, a3);
        uint32_t s4 = svaddv_u32(pg, a4); uint32_t s5 = svaddv_u32(pg, a5);
        uint32_t s6 = svaddv_u32(pg, a6); uint32_t s7 = svaddv_u32(pg, a7);
        a0 = svdup_u32(s0 + 1); a1 = svdup_u32(s1 + 1);
        a2 = svdup_u32(s2 + 1); a3 = svdup_u32(s3 + 1);
        a4 = svdup_u32(s4 + 1); a5 = svdup_u32(s5 + 1);
        a6 = svdup_u32(s6 + 1); a7 = svdup_u32(s7 + 1);
    }
    return (uint64_t)svaddv_u32(pg, a0) + (uint64_t)svaddv_u32(pg, a1)
         + (uint64_t)svaddv_u32(pg, a2) + (uint64_t)svaddv_u32(pg, a3)
         + (uint64_t)svaddv_u32(pg, a4) + (uint64_t)svaddv_u32(pg, a5)
         + (uint64_t)svaddv_u32(pg, a6) + (uint64_t)svaddv_u32(pg, a7);
}

/* ---- tbl s16: vector permute dependent chain ---- */
static uint64_t tbl_s16_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    svint16_t a = svdup_s16((int16_t)(acc & 0xffff));
    svuint16_t idx = svdup_u16(1);
    svuint16_t one = svdup_u16(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svtbl_s16(a, idx);
        idx = svadd_u16_x(pg, idx, one);
    }
    return (uint64_t)svaddv_s16(pg, a);
}

static uint64_t tbl_s16_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    svuint16_t idx = svdup_u16(1);
    svint16_t a0 = svdup_s16(acc + 0); svint16_t a1 = svdup_s16(acc + 1);
    svint16_t a2 = svdup_s16(acc + 2); svint16_t a3 = svdup_s16(acc + 3);
    svint16_t a4 = svdup_s16(acc + 4); svint16_t a5 = svdup_s16(acc + 5);
    svint16_t a6 = svdup_s16(acc + 6); svint16_t a7 = svdup_s16(acc + 7);
    for (uint64_t i = 0; i < n; i++) {
        a0 = svtbl_s16(a0, idx); a1 = svtbl_s16(a1, idx);
        a2 = svtbl_s16(a2, idx); a3 = svtbl_s16(a3, idx);
        a4 = svtbl_s16(a4, idx); a5 = svtbl_s16(a5, idx);
        a6 = svtbl_s16(a6, idx); a7 = svtbl_s16(a7, idx);
        idx = svadd_u16_x(pg, idx, svdup_u16(1));
    }
    return (uint64_t)svaddv_s16(pg, a0) + (uint64_t)svaddv_s16(pg, a1)
         + (uint64_t)svaddv_s16(pg, a2) + (uint64_t)svaddv_s16(pg, a3)
         + (uint64_t)svaddv_s16(pg, a4) + (uint64_t)svaddv_s16(pg, a5)
         + (uint64_t)svaddv_s16(pg, a6) + (uint64_t)svaddv_s16(pg, a7);
}

/* ---- ld1b 256-bit: load->use dependent chain ---- */
static uint8_t g_buf[4096];
static uint64_t ld1b_s8_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b8();
    const uint8_t* p = g_buf + ((acc * 37) & 2047);
    svuint8_t a = svdup_u8(0);
    for (uint64_t i = 0; i < n; i++) {
        svuint8_t v = svld1_u8(pg, p);
        a = svadd_u8_x(pg, a, v);      /* use the loaded value */
        p = g_buf + ((uint64_t)svaddv_u8(pg, a) & 2047);
    }
    return (uint64_t)svaddv_u8(pg, a);
}

/* ---- sdot 8-bit -> 32-bit (SVE1) ---- */
static uint64_t sdot_s32_8b_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b32();
    svint32_t a = svdup_s32((int32_t)(acc & 0xffff));
    svint8_t x = svdup_s8(1);
    svint8_t y = svdup_s8(2);
    svint8_t one = svdup_s8(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svdot_s32(a, x, y);
        y = svadd_s8_x(svptrue_b8(), y, one);   /* varying operand */
    }
    return (uint64_t)svaddv_s32(pg, a);
}

static uint64_t sdot_s32_8b_thr(uint64_t acc, uint64_t n) {
    svint8_t x = svdup_s8(1);
    svint8_t y = svdup_s8(2);
    svint32_t a0 = svdup_s32(acc + 0); svint32_t a1 = svdup_s32(acc + 1);
    svint32_t a2 = svdup_s32(acc + 2); svint32_t a3 = svdup_s32(acc + 3);
    svint32_t a4 = svdup_s32(acc + 4); svint32_t a5 = svdup_s32(acc + 5);
    svint32_t a6 = svdup_s32(acc + 6); svint32_t a7 = svdup_s32(acc + 7);
    for (uint64_t i = 0; i < n; i++) {
        a0 = svdot_s32(a0, x, y); a1 = svdot_s32(a1, x, y);
        a2 = svdot_s32(a2, x, y); a3 = svdot_s32(a3, x, y);
        a4 = svdot_s32(a4, x, y); a5 = svdot_s32(a5, x, y);
        a6 = svdot_s32(a6, x, y); a7 = svdot_s32(a7, x, y);
    }
    return (uint64_t)svaddv_s32(svptrue_b32(), a0)
         + (uint64_t)svaddv_s32(svptrue_b32(), a1)
         + (uint64_t)svaddv_s32(svptrue_b32(), a2)
         + (uint64_t)svaddv_s32(svptrue_b32(), a3)
         + (uint64_t)svaddv_s32(svptrue_b32(), a4)
         + (uint64_t)svaddv_s32(svptrue_b32(), a5)
         + (uint64_t)svaddv_s32(svptrue_b32(), a6)
         + (uint64_t)svaddv_s32(svptrue_b32(), a7);
}

int main(void) {
    uint64_t freq;
    asm volatile("mrs %0, cntfrq_el0" : "=r"(freq));
    printf("cntfrq=%llu\n", (unsigned long long)freq);
    const double calib = run_lat(calib_dbl, ITERS);
    /* calib = ticks per dependent scalar add = ticks per cycle
     * (x=x+x is a 1-cycle chain by design; loop overhead is included
     * in both calib and every measurement, matching timing_sve.c). */
    printf("calib_ticks_per_cyc=%.4f\n", calib);
    const struct { const char* name; uint64_t (*lat)(uint64_t, uint64_t);
                   uint64_t (*thr)(uint64_t, uint64_t); } T[] = {
        {"add_s16", add_s16_lat, add_s16_thr},
        {"sub_s16", sub_s16_lat, sub_s16_thr},
        {"mul_s16", mul_s16_lat, mul_s16_thr},
        {"abs_s16", abs_s16_lat, abs_s16_thr},
        {"sabd_s16", sabd_s16_lat, sabd_s16_thr},
        {"mla_s16", mla_s16_lat, mla_s16_thr},
        {"uaddv_s32", uaddv_s32_lat, uaddv_s32_thr},
        {"tbl_s16", tbl_s16_lat, tbl_s16_thr},
        {"ld1b_s8", ld1b_s8_lat, NULL},
        {"sdot_s32_8b", sdot_s32_8b_lat, sdot_s32_8b_thr},
    };
    for (size_t i = 0; i < sizeof(T) / sizeof(T[0]); i++) {
        const double l = run_lat(T[i].lat, ITERS) / calib;
        double t = 0.0;
        if (T[i].thr)
            t = run_thr(T[i].thr, ITERS) / calib;
        printf("%s latency_cyc=%.3f throughput_cyc_per_op=%.3f\n",
               T[i].name, l, t);
    }
    return 0;
}
