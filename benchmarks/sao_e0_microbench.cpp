// 920B (SVE1, VL=256) real-machine microbenchmark: SAO stats E0 64x1
// cover E (block32_sve2.cpp, svdot_s64 wide accumulate) vs the machine's
// dispatched path (primitives.saoCuStatsE0, NEON on 920B).
//
// Contract matches manifest verify: endX=64, endY=1, stats/count[5].
// Usage: sao_e0_microbench [samples] [batch]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>
#include <vector>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" void dynopt_sao_stats_e0_64_sve2(
    const int16_t*, const uint8_t*, intptr_t, int32_t*, int32_t*);

typedef void (*ref_fn_t)(const int16_t*, const uint8_t*, intptr_t,
                         int, int, int32_t*, int32_t*);
typedef void (*cand_fn_t)(const int16_t*, const uint8_t*, intptr_t,
                          int32_t*, int32_t*);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static uint64_t bench_ref(ref_fn_t fn, const int16_t* diff,
                          const uint8_t* rec, intptr_t stride,
                          int32_t* stats, int32_t* count,
                          int samples, int batch)
{
    volatile int sink = 0;
    for (int i = 0; i < 1000; i++)
    {
        fn(diff, rec, stride, 64, 1, stats, count);
        sink += stats[0] + count[0];
    }
    std::vector<uint64_t> ticks(samples);
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int i = 0; i < batch; i++)
        {
            fn(diff, rec, stride, 64, 1, stats, count);
            sink += stats[0] + count[0];
        }
        ticks[s] = read_cntvct() - t0;
    }
    std::sort(ticks.begin(), ticks.end());
    if (sink == 0x7fffffff)
        printf("sink=%d\n", sink);
    return ticks[samples / 2];
}

static uint64_t bench_cand(cand_fn_t fn, const int16_t* diff,
                           const uint8_t* rec, intptr_t stride,
                           int32_t* stats, int32_t* count,
                           int samples, int batch)
{
    volatile int sink = 0;
    for (int i = 0; i < 1000; i++)
    {
        fn(diff, rec, stride, stats, count);
        sink += stats[0] + count[0];
    }
    std::vector<uint64_t> ticks(samples);
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int i = 0; i < batch; i++)
        {
            fn(diff, rec, stride, stats, count);
            sink += stats[0] + count[0];
        }
        ticks[s] = read_cntvct() - t0;
    }
    std::sort(ticks.begin(), ticks.end());
    if (sink == 0x7fffffff)
        printf("sink=%d\n", sink);
    return ticks[samples / 2];
}

int main(int argc, char** argv)
{
    const int samples = argc > 1 ? atoi(argv[1]) : 40;
    const int batch = argc > 2 ? atoi(argv[2]) : 8192;

    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    ref_fn_t ref = primitives.saoCuStatsE0;

    std::mt19937 rng(0x5A0E00u);
    std::vector<int16_t> diff(80);
    std::vector<uint8_t> buf(2 * 128 + 32);
    for (int j = 0; j < 80; j++)
        diff[j] = (int16_t)(rng() % (2 * 4096 + 1)) - 4096 - 1;
    for (size_t j = 0; j < buf.size(); j++)
        buf[j] = (uint8_t)(rng() & 0xFF);
    const intptr_t stride = 64;
    buf[16 - 1] = buf[16];  // rec[-1] = left neighbor of rec[0]
    const uint8_t* rec = buf.data() + 16;

    // correctness
    int32_t ws[5] = { 0 }, wc[5] = { 0 }, gs[5] = { 0 }, gc[5] = { 0 };
    int mism = 0;
    for (int i = 0; i < 1000; i++)
    {
        std::memset(ws, 0, sizeof(ws)); std::memset(wc, 0, sizeof(wc));
        std::memset(gs, 0, sizeof(gs)); std::memset(gc, 0, sizeof(gc));
        ref(diff.data(), rec, stride, 64, 1, ws, wc);
        dynopt_sao_stats_e0_64_sve2(diff.data(), rec, stride, gs, gc);
        for (int k = 0; k < 5; k++)
            if (ws[k] != gs[k] || wc[k] != gc[k])
            {
                if (mism < 3)
                    fprintf(stderr, "mismatch[%d]: s=%d/%d c=%d/%d\n",
                            k, ws[k], gs[k], wc[k], gc[k]);
                mism++;
                break;
            }
    }
    printf("[sao-e0] correctness mism=%d/1000\n", mism);

    uint64_t tr = bench_ref(ref, diff.data(), rec, stride, ws, wc,
                            samples, batch);
    uint64_t tc = bench_cand(dynopt_sao_stats_e0_64_sve2, diff.data(),
                             rec, stride, gs, gc, samples, batch);
    double per_call = 1.0 / batch;
    printf("[sao-e0] samples=%d batch=%d\n", samples, batch);
    printf("[sao-e0] ref : median %llu ticks (%.2f/call)\n",
           (unsigned long long)tr, tr * per_call);
    printf("[sao-e0] cand: median %llu ticks (%.2f/call)\n",
           (unsigned long long)tc, tc * per_call);
    printf("[sao-e0] ratio cand/ref = %.4f\n", (double)tc / tr);
    return 0;
}
