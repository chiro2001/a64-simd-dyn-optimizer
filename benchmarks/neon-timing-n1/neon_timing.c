/* NEON latency/throughput microbenchmark for Neoverse-N1 (round-0023
 * M0 cost model): CNTVCT + dependency-chain / 8-independent-chain, same
 * protocol as benchmarks/sve-timing-920b/timing_sve.c. N1 has PMU, but
 * the program keeps CNTVCT for symmetry; outer perf stat can be used
 * for whole-run calibration.
 *
 * 2026-08-16: first table, NEON subset needed by the SA8D 8x8 slice
 * (load/add/abs/sub/long-add/pairwise/reduce/dot).
 */

#include <arm_neon.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

#define REPS 7
#define ITERS 2000000
#define NCHAIN 8

static uint64_t rdtsc(void)
{
    uint64_t t;
    asm volatile("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static uint64_t read_cntfrq(void)
{
    uint64_t f;
    asm volatile("mrs %0, cntfrq_el0" : "=r"(f));
    return f;
}

static volatile uint64_t sink;

static double run_lat(uint64_t (*fn)(uint64_t, uint64_t))
{
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, ITERS);
        uint64_t t1 = rdtsc();
        sink = v;
        double cyc = (double)(t1 - t0) / ITERS;
        if (cyc < best) best = cyc;
    }
    return best;
}

static double run_thr(uint64_t (*fn)(uint64_t, uint64_t))
{
    double best = 1e30;
    for (int r = 0; r < REPS; r++) {
        uint64_t t0 = rdtsc();
        uint64_t v = fn(0, ITERS / 8);
        uint64_t t1 = rdtsc();
        sink = v;
        double cyc = (double)(t1 - t0) / (ITERS / 8) / NCHAIN;
        if (cyc < best) best = cyc;
    }
    return best;
}

static uint64_t calib_dbl(uint64_t acc, uint64_t n)
{
    uint64_t x = acc ? acc : 1;
    for (uint64_t i = 0; i < n; i++) x = x + x;
    return x;
}

#define VEC_LAT(name, vtype, init, op, cast)                             \
    static uint64_t name##_lat(uint64_t acc, uint64_t n) {               \
        vtype a = init((int32_t)(acc & 0xffff));                         \
        vtype b = init((int32_t)((acc & 0xff) + 1));                     \
        for (uint64_t i = 0; i < n; i++) {                               \
            a = op(a, b);                                                \
            b = op(b, init((int32_t)(i & 0xff)));                        \
        }                                                                \
        return (uint64_t)cast(a, 0);                                     \
    }

#define VEC_THR(name, vtype, init, op, cast)                             \
    static uint64_t name##_thr(uint64_t acc, uint64_t n) {               \
        vtype a[NCHAIN], b[NCHAIN];                                      \
        for (int c = 0; c < NCHAIN; c++) {                               \
            a[c] = init((int32_t)(acc + c));                             \
            b[c] = init((int32_t)(c + 1));                               \
        }                                                                \
        uint64_t s = 0;                                                  \
        for (uint64_t i = 0; i < n; i++)                                 \
            for (int c = 0; c < NCHAIN; c++)                             \
                a[c] = op(a[c], b[c]);                                   \
        for (int c = 0; c < NCHAIN; c++) s += (uint64_t)cast(a[c], 0);   \
        return s;                                                        \
    }

#define BENCH_OP(name, vtype, init, op, cast) \
    VEC_LAT(name, vtype, init, op, cast)      \
    VEC_THR(name, vtype, init, op, cast)

BENCH_OP(add_u8, uint8x16_t, vdupq_n_u8, vaddq_u8, vgetq_lane_u8)
BENCH_OP(add_u16, uint16x8_t, vdupq_n_u16, vaddq_u16, vgetq_lane_u16)
BENCH_OP(abd_u8, uint8x16_t, vdupq_n_u8, vabdq_u8, vgetq_lane_u8)
BENCH_OP(sub_u8, uint8x16_t, vdupq_n_u8, vsubq_u8, vgetq_lane_u8)

static uint64_t addl_u8_lat(uint64_t acc, uint64_t n)
{
    uint16x8_t a = vdupq_n_u16((uint16_t)(acc & 0xffff));
    uint8x8_t b = vdup_n_u8(1);
    for (uint64_t i = 0; i < n; i++) {
        a = vaddl_u8(vmovn_u16(a), b);
        b = vadd_u8(b, vdup_n_u8(1));
    }
    return vgetq_lane_u16(a, 0);
}
static uint64_t addl_u8_thr(uint64_t acc, uint64_t n)
{
    uint16x8_t a[NCHAIN];
    uint8x8_t b[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) {
        a[c] = vdupq_n_u16((uint16_t)(acc + c));
        b[c] = vdup_n_u8((uint8_t)(c + 1));
    }
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++)
            a[c] = vaddl_u8(vmovn_u16(a[c]), b[c]);
    for (int c = 0; c < NCHAIN; c++) s += vgetq_lane_u16(a[c], 0);
    return s;
}

static uint64_t abs_s16_lat(uint64_t acc, uint64_t n)
{
    int16x8_t a = vdupq_n_s16((int16_t)(acc & 0x7fff));
    for (uint64_t i = 0; i < n; i++)
        a = vabsq_s16(a);
    return (uint64_t)vgetq_lane_s16(a, 0);
}
static uint64_t abs_s16_thr(uint64_t acc, uint64_t n)
{
    int16x8_t a[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) a[c] = vdupq_n_s16((int16_t)(acc + c));
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++)
            a[c] = vabsq_s16(a[c]);
    for (int c = 0; c < NCHAIN; c++) s += (uint64_t)vgetq_lane_s16(a[c], 0);
    return s;
}

/* pairwise add: vpaddq_u8 (16B -> 16B, adjacent pairs) */
static uint64_t padd_u8_lat(uint64_t acc, uint64_t n)
{
    uint8x16_t a = vdupq_n_u8((uint8_t)(acc & 0xff));
    uint8x16_t b = vdupq_n_u8(1);
    for (uint64_t i = 0; i < n; i++) {
        a = vpaddq_u8(a, b);
        b = vpaddq_u8(b, a);
    }
    return vgetq_lane_u8(a, 0);
}
static uint64_t padd_u8_thr(uint64_t acc, uint64_t n)
{
    uint8x16_t a[NCHAIN], b[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) {
        a[c] = vdupq_n_u8((uint8_t)(acc + c));
        b[c] = vdupq_n_u8((uint8_t)(c + 1));
    }
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++)
            a[c] = vpaddq_u8(a[c], b[c]);
    for (int c = 0; c < NCHAIN; c++) s += vgetq_lane_u8(a[c], 0);
    return s;
}

/* vpaddlq_u16 (16B u16 -> 8x u32 pairs), long pairwise */
static uint64_t paddl_u16_lat(uint64_t acc, uint64_t n)
{
    uint16x8_t a = vdupq_n_u16((uint16_t)(acc & 0xffff));
    uint16x8_t b = vdupq_n_u16(1);
    for (uint64_t i = 0; i < n; i++) {
        uint32x4_t t = vpaddlq_u16(a);
        a = vcombine_u16(vmovn_u32(t), vget_low_u16(b));
        b = vdupq_n_u16(1);
    }
    return vgetq_lane_u16(a, 0);
}
static uint64_t paddl_u16_thr(uint64_t acc, uint64_t n)
{
    uint16x8_t a[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) a[c] = vdupq_n_u16((uint16_t)(acc + c));
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++)
            a[c] = vreinterpretq_u16_u32(vpaddlq_u16(a[c]));
    for (int c = 0; c < NCHAIN; c++) s += vgetq_lane_u16(a[c], 0);
    return s;
}

/* vmaxvq_u8 / vaddvq_u8 horizontal reductions */
static uint64_t maxv_u8_lat(uint64_t acc, uint64_t n)
{
    uint8x16_t a = vdupq_n_u8((uint8_t)(acc & 0xff));
    uint8x16_t b = vdupq_n_u8(1);
    for (uint64_t i = 0; i < n; i++) {
        uint8_t m = vmaxvq_u8(a);
        a = vsetq_lane_u8(m, b, 0);
        b = vaddq_u8(b, vdupq_n_u8(1));
    }
    return vgetq_lane_u8(a, 0);
}
static uint64_t maxv_u8_thr(uint64_t acc, uint64_t n)
{
    uint8x16_t a[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) a[c] = vdupq_n_u8((uint8_t)(acc + c));
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++) {
            uint8_t m = vmaxvq_u8(a[c]);
            a[c] = vdupq_n_u8(m);
        }
    for (int c = 0; c < NCHAIN; c++) s += vgetq_lane_u8(a[c], 0);
    return s;
}

/* vdotq_s32 (BtoS dotprod, 4x4 products) */
static uint64_t sdot_lat(uint64_t acc, uint64_t n)
{
    int8x16_t a = vdupq_n_s8((int8_t)(acc & 0x7f));
    int8x16_t b = vdupq_n_s8(2);
    int32x4_t d = vdupq_n_s32(0);
    for (uint64_t i = 0; i < n; i++) {
        d = vdotq_s32(d, a, b);
        a = vdupq_n_s8((int8_t)(i & 0x7f));
    }
    return (uint64_t)vgetq_lane_s32(d, 0);
}
static uint64_t sdot_thr(uint64_t acc, uint64_t n)
{
    int8x16_t a[NCHAIN], b[NCHAIN];
    int32x4_t d[NCHAIN];
    for (int c = 0; c < NCHAIN; c++) {
        a[c] = vdupq_n_s8((int8_t)(acc + c));
        b[c] = vdupq_n_s8(2);
        d[c] = vdupq_n_s32(0);
    }
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++)
        for (int c = 0; c < NCHAIN; c++)
            d[c] = vdotq_s32(d[c], a[c], b[c]);
    for (int c = 0; c < NCHAIN; c++) s += (uint64_t)vgetq_lane_s32(d[c], 0);
    return s;
}

/* stream loads (fixed buffer, no hoisting) */
static uint8_t g_buf[8192];
static uint64_t ld1_u8_thr(uint64_t acc, uint64_t n)
{
    uint64_t off = acc & 0x1ff0;
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++) {
        uint8x16_t v = vld1q_u8(g_buf + off);
        off = (off + 16) & 0x1ff0;
        s += vgetq_lane_u8(v, 0);
    }
    return s;
}
static uint64_t st1_u8_thr(uint64_t acc, uint64_t n)
{
    uint64_t off = acc & 0x1ff0;
    uint8x16_t v = vdupq_n_u8((uint8_t)(acc & 0xff));
    uint64_t s = 0;
    for (uint64_t i = 0; i < n; i++) {
        vst1q_u8(g_buf + off, v);
        off = (off + 16) & 0x1ff0;
        s += off;
    }
    return s;
}

int main(void)
{
    uint64_t cntfrq = read_cntfrq();
    double calib = run_lat(calib_dbl);
    printf("{\n \"cntfrq\": %lu,\n"
           " \"calib_add_ticks_per_cyc\": %.4f,\n"
           " \"freq_hz_est\": %.0f,\n",
           (unsigned long)cntfrq, calib, (double)cntfrq / calib);
    struct { const char* name; uint64_t (*lat)(uint64_t, uint64_t);
             uint64_t (*thr)(uint64_t, uint64_t); } bs[] = {
        {"empty", calib_dbl, calib_dbl},
        {"add_u8", add_u8_lat, add_u8_thr},
        {"add_u16", add_u16_lat, add_u16_thr},
        {"abd_u8", abd_u8_lat, abd_u8_thr},
        {"sub_u8", sub_u8_lat, sub_u8_thr},
        {"abs_s16", abs_s16_lat, abs_s16_thr},
        {"addl_u8", addl_u8_lat, addl_u8_thr},
        {"padd_u8", padd_u8_lat, padd_u8_thr},
        {"paddl_u16", paddl_u16_lat, paddl_u16_thr},
        {"maxv_u8", maxv_u8_lat, maxv_u8_thr},
        {"sdot", sdot_lat, sdot_thr},
        {"ld1_u8", NULL, ld1_u8_thr},
        {"st1_u8", NULL, st1_u8_thr},
    };
    int first = 1;
    for (size_t i = 0; i < sizeof(bs) / sizeof(bs[0]); i++) {
        double lat = bs[i].lat ? run_lat(bs[i].lat) : 0.0;
        double thr = bs[i].thr ? run_thr(bs[i].thr) : 0.0;
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
