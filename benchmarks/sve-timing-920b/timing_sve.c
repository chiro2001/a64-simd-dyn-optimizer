/* SVE latency/throughput microbenchmark for Kunpeng 920 (hip09, VL=256).
 *
 * 2026-08-14: 供 docs/26 "方案 A" 使用 —— 920B 没有公开的 SVE 指令时延
 * 表（LLVM tsv110 显式 unsupported，GCC hip09.md 只有 NEON/FP），所以
 * 用 CNTVCT + 依赖链/独立链实测，产物是机器可读的 timing JSON。
 *
 * 口径：
 *   latency     = 单条依赖链的 cycles/iter（扣掉空循环开销）
 *   throughput  = 8 条独立链并行时的 cycles/op
 *   min-of-7    = 每组测 7 次取最小（抗调度/频率噪声；920B 无 PMU）
 */

#include <arm_sve.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define REPS 7
#define ITERS 2000000
#define NCHAIN 8

static uint64_t rdtsc(void) {
    uint64_t t;
    asm volatile("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static uint64_t read_cntfrq(void) {
    uint64_t f;
    asm volatile("mrs %0, cntfrq_el0" : "=r"(f));
    return f;
}

static volatile uint64_t sink;
static uint64_t last_lat_diff;
static uint64_t last_thr_diff;

static double run_lat(uint64_t (*fn)(uint64_t, uint64_t)) {
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, ITERS);
        uint64_t t1 = rdtsc();
        sink = v;
        last_lat_diff = t1 - t0;
        double cyc = (double)(t1 - t0) / ITERS;
        if (cyc < best) best = cyc;
    }
    return best;
}

static double run_thr(uint64_t (*fn)(uint64_t, uint64_t)) {
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, ITERS / 8);
        uint64_t t1 = rdtsc();
        sink = v;
        last_thr_diff = t1 - t0;
        double cyc = (double)(t1 - t0) / (ITERS / 8) / NCHAIN;
        if (cyc < best) best = cyc;
    }
    return best;
}

/* ---- helpers: scalar timing of an empty loop (overhead) ---- */
static uint64_t empty_lat(uint64_t acc, uint64_t n) {
    for (uint64_t i = 0; i < n; i++) acc += i;
    return acc;
}

/* 1-cycle dependent integer add chain (x=x+x); calibrates CNTVCT ticks
 * -> CPU cycles on this VM (dependent add latency is 1 cyc by design). */
static uint64_t calib_dbl(uint64_t acc, uint64_t n) {
    uint64_t x = acc ? acc : 1;
    for (uint64_t i = 0; i < n; i++) x = x + x;
    return x;
}

/* ---- add s32: dependent chain ---- */
static uint64_t add_s32_lat(uint64_t acc, uint64_t n) {
    svint32_t a = svdup_s32((int32_t)(acc & 0xffff));
    svbool_t pg = svptrue_b32();
    svint32_t b = svdup_s32(1);
    svint32_t one = svdup_s32(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svadd_s32_x(pg, a, b);
        b = svadd_s32_x(pg, b, one);   /* varying operand: no closed form */
    }
    return (uint64_t)svaddv_s32(pg, a);
}

static uint64_t add_s32_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b32();
    svint32_t b = svdup_s32(1);
    svint32_t a0 = svdup_s32((int32_t)(acc + 0));
    svint32_t a1 = svdup_s32((int32_t)(acc + 1));
    svint32_t a2 = svdup_s32((int32_t)(acc + 2));
    svint32_t a3 = svdup_s32((int32_t)(acc + 3));
    svint32_t a4 = svdup_s32((int32_t)(acc + 4));
    svint32_t a5 = svdup_s32((int32_t)(acc + 5));
    svint32_t a6 = svdup_s32((int32_t)(acc + 6));
    svint32_t a7 = svdup_s32((int32_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svadd_s32_x(pg, a0, b); a1 = svadd_s32_x(pg, a1, b);
        a2 = svadd_s32_x(pg, a2, b); a3 = svadd_s32_x(pg, a3, b);
        a4 = svadd_s32_x(pg, a4, b); a5 = svadd_s32_x(pg, a5, b);
        a6 = svadd_s32_x(pg, a6, b); a7 = svadd_s32_x(pg, a7, b);
    }
    return (uint64_t)svaddv_s32(pg, a0) + (uint64_t)svaddv_s32(pg, a1)
         + (uint64_t)svaddv_s32(pg, a2) + (uint64_t)svaddv_s32(pg, a3)
         + (uint64_t)svaddv_s32(pg, a4) + (uint64_t)svaddv_s32(pg, a5)
         + (uint64_t)svaddv_s32(pg, a6) + (uint64_t)svaddv_s32(pg, a7);
}

/* ---- mul s64 (smulh not used; plain vector mul of s64) ---- */
static uint64_t mul_s64_lat(uint64_t acc, uint64_t n) {
    svint64_t a = svdup_s64((int64_t)acc + 1);
    svbool_t pg = svptrue_b64();
    svint64_t b = svdup_s64(0x10001);
    svint64_t one = svdup_s64(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svmul_s64_x(pg, a, b);
        b = svadd_s64_x(pg, b, one);   /* varying operand: no closed form */
    }
    return (uint64_t)svaddv_s64(pg, a);
}

static uint64_t mul_s64_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b64();
    svint64_t b = svdup_s64(0x10001);
    svint64_t a0 = svdup_s64((int64_t)(acc + 1));
    svint64_t a1 = svdup_s64((int64_t)(acc + 2));
    svint64_t a2 = svdup_s64((int64_t)(acc + 3));
    svint64_t a3 = svdup_s64((int64_t)(acc + 4));
    svint64_t a4 = svdup_s64((int64_t)(acc + 5));
    svint64_t a5 = svdup_s64((int64_t)(acc + 6));
    svint64_t a6 = svdup_s64((int64_t)(acc + 7));
    svint64_t a7 = svdup_s64((int64_t)(acc + 8));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svmul_s64_x(pg, a0, b); a1 = svmul_s64_x(pg, a1, b);
        a2 = svmul_s64_x(pg, a2, b); a3 = svmul_s64_x(pg, a3, b);
        a4 = svmul_s64_x(pg, a4, b); a5 = svmul_s64_x(pg, a5, b);
        a6 = svmul_s64_x(pg, a6, b); a7 = svmul_s64_x(pg, a7, b);
    }
    return (uint64_t)svaddv_s64(pg, a0) + (uint64_t)svaddv_s64(pg, a1)
         + (uint64_t)svaddv_s64(pg, a2) + (uint64_t)svaddv_s64(pg, a3)
         + (uint64_t)svaddv_s64(pg, a4) + (uint64_t)svaddv_s64(pg, a5)
         + (uint64_t)svaddv_s64(pg, a6) + (uint64_t)svaddv_s64(pg, a7);
}

/* ---- sdot indexed (s64 acc, s16 lanes), the dct32 workhorse ---- */
static uint64_t sdot_idx_lat(uint64_t acc, uint64_t n) {
    svint64_t a = svdup_s64((int64_t)acc + 1);
    svint16_t x = svdup_s16(0x0102);
    svint16_t y = svdup_s16(0x0201);
    svint16_t one = svdup_s16(1);
    for (uint64_t i = 0; i < n; i++) {
        a = svdot_lane_s64(a, x, y, 0);
        y = svadd_s16_x(svptrue_b16(), y, one);  /* varying operand */
    }
    return (uint64_t)svaddv_s64(svptrue_b64(), a);
}

static uint64_t sdot_idx_thr(uint64_t acc, uint64_t n) {
    svint16_t x = svdup_s16(0x0102);
    svint16_t y = svdup_s16(0x0201);
    svint64_t a0 = svdup_s64((int64_t)(acc + 1));
    svint64_t a1 = svdup_s64((int64_t)(acc + 2));
    svint64_t a2 = svdup_s64((int64_t)(acc + 3));
    svint64_t a3 = svdup_s64((int64_t)(acc + 4));
    svint64_t a4 = svdup_s64((int64_t)(acc + 5));
    svint64_t a5 = svdup_s64((int64_t)(acc + 6));
    svint64_t a6 = svdup_s64((int64_t)(acc + 7));
    svint64_t a7 = svdup_s64((int64_t)(acc + 8));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svdot_lane_s64(a0, x, y, 0); a1 = svdot_lane_s64(a1, x, y, 0);
        a2 = svdot_lane_s64(a2, x, y, 0); a3 = svdot_lane_s64(a3, x, y, 0);
        a4 = svdot_lane_s64(a4, x, y, 0); a5 = svdot_lane_s64(a5, x, y, 0);
        a6 = svdot_lane_s64(a6, x, y, 0); a7 = svdot_lane_s64(a7, x, y, 0);
    }
    return (uint64_t)svaddv_s64(svptrue_b64(), a0)
         + (uint64_t)svaddv_s64(svptrue_b64(), a1)
         + (uint64_t)svaddv_s64(svptrue_b64(), a2)
         + (uint64_t)svaddv_s64(svptrue_b64(), a3)
         + (uint64_t)svaddv_s64(svptrue_b64(), a4)
         + (uint64_t)svaddv_s64(svptrue_b64(), a5)
         + (uint64_t)svaddv_s64(svptrue_b64(), a6)
         + (uint64_t)svaddv_s64(svptrue_b64(), a7);
}

/* ---- smullb s16->s32 (SVE2 per GCC intrinsic mapping; guard) ---- */
#if defined(__ARM_FEATURE_SVE2)
static uint64_t smullb_lat(uint64_t acc, uint64_t n) {
    svint16_t x = svdup_s16(0x0102);
    svint16_t y = svdup_s16(0x0201);
    svint32_t a = svdup_s32((int32_t)acc + 1);
    for (uint64_t i = 0; i < n; i++)
        a = svadd_s32_x(svptrue_b32(), a, svmullb_s32(x, y));
    return (uint64_t)svaddv_s32(svptrue_b32(), a);
}

static uint64_t smullb_thr(uint64_t acc, uint64_t n) {
    svint16_t x = svdup_s16(0x0102);
    svint16_t y = svdup_s16(0x0201);
    svint32_t a0 = svdup_s32((int32_t)(acc + 1));
    svint32_t a1 = svdup_s32((int32_t)(acc + 2));
    svint32_t a2 = svdup_s32((int32_t)(acc + 3));
    svint32_t a3 = svdup_s32((int32_t)(acc + 4));
    svint32_t a4 = svdup_s32((int32_t)(acc + 5));
    svint32_t a5 = svdup_s32((int32_t)(acc + 6));
    svint32_t a6 = svdup_s32((int32_t)(acc + 7));
    svint32_t a7 = svdup_s32((int32_t)(acc + 8));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svadd_s32_x(svptrue_b32(), a0, svmullb_s32(x, y));
        a1 = svadd_s32_x(svptrue_b32(), a1, svmullb_s32(x, y));
        a2 = svadd_s32_x(svptrue_b32(), a2, svmullb_s32(x, y));
        a3 = svadd_s32_x(svptrue_b32(), a3, svmullb_s32(x, y));
        a4 = svadd_s32_x(svptrue_b32(), a4, svmullb_s32(x, y));
        a5 = svadd_s32_x(svptrue_b32(), a5, svmullb_s32(x, y));
        a6 = svadd_s32_x(svptrue_b32(), a6, svmullb_s32(x, y));
        a7 = svadd_s32_x(svptrue_b32(), a7, svmullb_s32(x, y));
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
#endif

/* ---- rshrnb s32->s16 (SVE2; 920B 上跳过，需要 hip12/倚天710) ---- */
#if defined(__ARM_FEATURE_SVE2)
static uint64_t rshrnb_lat(uint64_t acc, uint64_t n) {
    svint32_t x = svdup_s32((int32_t)(acc & 0xffff) + 0x10000);
    svint16_t a = svdup_s16(0);
    svint32_t sh = svdup_s32(4);
    for (uint64_t i = 0; i < n; i++)
        a = svuzp1_s16(svrshrnb_n_s32(x, 4), a);
    return (uint64_t)svaddv_s16(svptrue_b16(), a) + (uint64_t)svaddv_s32(svptrue_b32(), sh);
}

static uint64_t rshrnb_thr(uint64_t acc, uint64_t n) {
    svint32_t x = svdup_s32(0x10001);
    svint16_t a0 = svdup_s16((int16_t)(acc + 0));
    svint16_t a1 = svdup_s16((int16_t)(acc + 1));
    svint16_t a2 = svdup_s16((int16_t)(acc + 2));
    svint16_t a3 = svdup_s16((int16_t)(acc + 3));
    svint16_t a4 = svdup_s16((int16_t)(acc + 4));
    svint16_t a5 = svdup_s16((int16_t)(acc + 5));
    svint16_t a6 = svdup_s16((int16_t)(acc + 6));
    svint16_t a7 = svdup_s16((int16_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svuzp1_s16(svrshrnb_n_s32(x, 4), a0);
        a1 = svuzp1_s16(svrshrnb_n_s32(x, 4), a1);
        a2 = svuzp1_s16(svrshrnb_n_s32(x, 4), a2);
        a3 = svuzp1_s16(svrshrnb_n_s32(x, 4), a3);
        a4 = svuzp1_s16(svrshrnb_n_s32(x, 4), a4);
        a5 = svuzp1_s16(svrshrnb_n_s32(x, 4), a5);
        a6 = svuzp1_s16(svrshrnb_n_s32(x, 4), a6);
        a7 = svuzp1_s16(svrshrnb_n_s32(x, 4), a7);
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
#endif

/* ---- uzp1 s16 ---- */
static uint64_t uzp1_lat(uint64_t acc, uint64_t n) {
    svint16_t a = svdup_s16((int16_t)(acc & 0xffff));
    svint16_t b = svdup_s16(1);
    for (uint64_t i = 0; i < n; i++) a = svuzp1_s16(a, b);
    return (uint64_t)svaddv_s16(svptrue_b16(), a);
}

static uint64_t uzp1_thr(uint64_t acc, uint64_t n) {
    svint16_t b = svdup_s16(1);
    svint16_t a0 = svdup_s16((int16_t)(acc + 0));
    svint16_t a1 = svdup_s16((int16_t)(acc + 1));
    svint16_t a2 = svdup_s16((int16_t)(acc + 2));
    svint16_t a3 = svdup_s16((int16_t)(acc + 3));
    svint16_t a4 = svdup_s16((int16_t)(acc + 4));
    svint16_t a5 = svdup_s16((int16_t)(acc + 5));
    svint16_t a6 = svdup_s16((int16_t)(acc + 6));
    svint16_t a7 = svdup_s16((int16_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svuzp1_s16(a0, b); a1 = svuzp1_s16(a1, b);
        a2 = svuzp1_s16(a2, b); a3 = svuzp1_s16(a3, b);
        a4 = svuzp1_s16(a4, b); a5 = svuzp1_s16(a5, b);
        a6 = svuzp1_s16(a6, b); a7 = svuzp1_s16(a7, b);
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

/* ---- tbl s16 ---- */
static uint64_t tbl_lat(uint64_t acc, uint64_t n) {
    svint16_t a = svdup_s16((int16_t)(acc & 0xffff));
    svuint16_t idx = svindex_u16(0, 1);
    for (uint64_t i = 0; i < n; i++) a = svtbl_s16(a, idx);
    return (uint64_t)svaddv_s16(svptrue_b16(), a);
}

static uint64_t tbl_thr(uint64_t acc, uint64_t n) {
    svuint16_t idx = svindex_u16(0, 1);
    svint16_t a0 = svdup_s16((int16_t)(acc + 0));
    svint16_t a1 = svdup_s16((int16_t)(acc + 1));
    svint16_t a2 = svdup_s16((int16_t)(acc + 2));
    svint16_t a3 = svdup_s16((int16_t)(acc + 3));
    svint16_t a4 = svdup_s16((int16_t)(acc + 4));
    svint16_t a5 = svdup_s16((int16_t)(acc + 5));
    svint16_t a6 = svdup_s16((int16_t)(acc + 6));
    svint16_t a7 = svdup_s16((int16_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svtbl_s16(a0, idx); a1 = svtbl_s16(a1, idx);
        a2 = svtbl_s16(a2, idx); a3 = svtbl_s16(a3, idx);
        a4 = svtbl_s16(a4, idx); a5 = svtbl_s16(a5, idx);
        a6 = svtbl_s16(a6, idx); a7 = svtbl_s16(a7, idx);
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

/* ---- zip1 s16 ---- */
static uint64_t zip1_lat(uint64_t acc, uint64_t n) {
    svint16_t a = svdup_s16((int16_t)(acc & 0xffff));
    svint16_t b = svdup_s16(1);
    for (uint64_t i = 0; i < n; i++) a = svzip1_s16(a, b);
    return (uint64_t)svaddv_s16(svptrue_b16(), a);
}

static uint64_t zip1_thr(uint64_t acc, uint64_t n) {
    svint16_t b = svdup_s16(1);
    svint16_t a0 = svdup_s16((int16_t)(acc + 0));
    svint16_t a1 = svdup_s16((int16_t)(acc + 1));
    svint16_t a2 = svdup_s16((int16_t)(acc + 2));
    svint16_t a3 = svdup_s16((int16_t)(acc + 3));
    svint16_t a4 = svdup_s16((int16_t)(acc + 4));
    svint16_t a5 = svdup_s16((int16_t)(acc + 5));
    svint16_t a6 = svdup_s16((int16_t)(acc + 6));
    svint16_t a7 = svdup_s16((int16_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++)
    {
        a0 = svzip1_s16(a0, b); a1 = svzip1_s16(a1, b);
        a2 = svzip1_s16(a2, b); a3 = svzip1_s16(a3, b);
        a4 = svzip1_s16(a4, b); a5 = svzip1_s16(a5, b);
        a6 = svzip1_s16(a6, b); a7 = svzip1_s16(a7, b);
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

/* ---- st1h (throughput only; stores are fire-and-forget) ---- */
static volatile int16_t mem[8192];
static uint64_t st1h_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    svint16_t v = svdup_s16((int16_t)acc);
    int16_t *base = (int16_t *)mem;
    int16_t *p = base;
    int16_t *end = base + 8192;
    for (uint64_t i = 0; i < n; i++) {
        svst1_s16(pg, p, v);
        p += 16;
        if (p >= end) p = base;          /* streaming, no hoisting */
    }
    asm volatile("" ::: "memory");
    return (uint64_t)(p - base);
}

/* ---- ld1h (throughput + load-use latency via dependent add) ---- */
static uint64_t ld1h_thr(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    int16_t *base = (int16_t *)mem;
    int16_t *p = base;
    int16_t *end = base + 8192;
    svint16_t v0 = svdup_s16((int16_t)acc);
    svint16_t v1 = svdup_s16((int16_t)(acc + 1));
    svint16_t v2 = svdup_s16((int16_t)(acc + 2));
    svint16_t v3 = svdup_s16((int16_t)(acc + 3));
    svint16_t v4 = svdup_s16((int16_t)(acc + 4));
    svint16_t v5 = svdup_s16((int16_t)(acc + 5));
    svint16_t v6 = svdup_s16((int16_t)(acc + 6));
    svint16_t v7 = svdup_s16((int16_t)(acc + 7));
    for (uint64_t i = 0; i < n; i++) {
        v0 = svld1_s16(pg, p);
        v1 = svld1_s16(pg, p + 16);
        v2 = svld1_s16(pg, p + 32);
        v3 = svld1_s16(pg, p + 48);
        v4 = svld1_s16(pg, p + 64);
        v5 = svld1_s16(pg, p + 80);
        v6 = svld1_s16(pg, p + 96);
        v7 = svld1_s16(pg, p + 112);
        p += 128;
        if (p + 112 >= end) p = base;
    }
    return (uint64_t)svaddv_s16(pg, v0) + (uint64_t)svaddv_s16(pg, v1)
         + (uint64_t)svaddv_s16(pg, v2) + (uint64_t)svaddv_s16(pg, v3)
         + (uint64_t)svaddv_s16(pg, v4) + (uint64_t)svaddv_s16(pg, v5)
         + (uint64_t)svaddv_s16(pg, v6) + (uint64_t)svaddv_s16(pg, v7);
}

static uint64_t ld1h_use_lat(uint64_t acc, uint64_t n) {
    svbool_t pg = svptrue_b16();
    int16_t *base = (int16_t *)mem;
    int16_t *p = base;
    int16_t *end = base + 8192;
    svint16_t v = svdup_s16((int16_t)acc);
    for (uint64_t i = 0; i < n; i++) {
        v = svadd_s16_x(pg, v, svld1_s16(pg, p));
        p += 16;
        if (p >= end) p = base;
    }
    return (uint64_t)svaddv_s16(pg, v) + (uint64_t)(p - base);
}

typedef struct { const char *name; uint64_t (*lat)(uint64_t, uint64_t); uint64_t (*thr)(uint64_t, uint64_t); int ops; } bench_t;

int main(void) {
    uint64_t cntfrq = read_cntfrq();
    double calib = run_lat(calib_dbl);
    double freq_hz = (double)cntfrq / calib;
    printf("{\n \"cntfrq\": %lu,\n"
           " \"calib_add_ticks_per_cyc\": %.4f,\n"
           " \"freq_hz_est\": %.0f,\n",
           (unsigned long)cntfrq, calib, freq_hz);
    bench_t bs[] = {
        {"empty", empty_lat, empty_lat, 1},
        {"add_s32", add_s32_lat, add_s32_thr, 8},
        {"mul_s64", mul_s64_lat, mul_s64_thr, 8},
        {"sdot_indexed_s64", sdot_idx_lat, sdot_idx_thr, 8},
#if defined(__ARM_FEATURE_SVE2)
        {"smullb_s32", smullb_lat, smullb_thr, 8},
        {"rshrnb_uzp1_s16", rshrnb_lat, rshrnb_thr, 8},
#endif
        {"uzp1_s16", uzp1_lat, uzp1_thr, 8},
        {"tbl_s16", tbl_lat, tbl_thr, 8},
        {"zip1_s16", zip1_lat, zip1_thr, 8},
        {"st1h_s16", NULL, st1h_thr, 1},
        {"ld1h_s16", NULL, ld1h_thr, 8},
        {"ld1h_use_add", ld1h_use_lat, NULL, 1},
    };
    int first = 1;
    for (size_t i = 0; i < sizeof(bs) / sizeof(bs[0]); i++) {
        double lat = bs[i].lat ? run_lat(bs[i].lat) : 0.0;
        double thr = bs[i].thr ? run_thr(bs[i].thr) : 0.0;
        if (bs[i].thr) thr *= 8.0 / bs[i].ops;   /* normalize per-op */
#ifdef TIMING_DEBUG
        fprintf(stderr, "DBG %s lat_diff=%lu thr_diff=%lu\n",
                bs[i].name, last_lat_diff, last_thr_diff);
#endif
        const char* pre = first ? " " : ",";
        if (bs[i].lat && bs[i].thr)
            printf("%s\"%s\": {\"latency_cyc\": %.2f, "
                   "\"throughput_cyc_per_op\": %.2f}\n",
                   pre, bs[i].name, lat / calib, thr / calib);
        else if (bs[i].lat)
            printf("%s\"%s\": {\"latency_cyc\": %.2f, "
                   "\"throughput_cyc_per_op\": null}\n",
                   pre, bs[i].name, lat / calib);
        else if (bs[i].thr)
            printf("%s\"%s\": {\"latency_cyc\": null, "
                   "\"throughput_cyc_per_op\": %.2f}\n",
                   pre, bs[i].name, thr / calib);
        else
            printf("%s\"%s\": null\n", pre, bs[i].name);
        first = 0;
    }
    printf("}\n");
    return 0;
}
