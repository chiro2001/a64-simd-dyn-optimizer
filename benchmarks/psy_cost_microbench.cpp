// psyCost real-machine microbenchmark (Yitian710 VL=128): upstream
// x265::psyCost_pp_sve2 vs experimental fused candidate, CNTVCT ticks.
//
// Usage: psy_cost_microbench <up16|cand16|up32> <latency|throughput>
//                            <samples> <batch>
// Verify mode: psy_cost_microbench verify <cases>
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

namespace x265 {
template <int size> int psyCost_pp_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}

extern "C" int dynopt_psycost16_v1(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

typedef int (*fn_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static fn_t pick(const char* impl)
{
    if (!strcmp(impl, "up16"))  return x265::psyCost_pp_sve2<2>;
    if (!strcmp(impl, "cand16")) return dynopt_psycost16_v1;
    if (!strcmp(impl, "up32"))  return x265::psyCost_pp_sve2<3>;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0x50594330u);
    fn_t fn = pick(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        int stride = 16 << (t % 3); // 16/32/64
        static uint8_t src[80 * 80], rec[80 * 80];
        for (int i = 0; i < 80 * 80; i++)
        {
            src[i] = (uint8_t)(rng() & 255);
            rec[i] = (uint8_t)(rng() & 255);
        }
        int wa = x265::psyCost_pp_sve2<2>(src, stride, rec, stride);
        int wb = fn(src, stride, rec, stride);
        if (wa != wb)
            mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, int samples, int batch)
{
    fn_t fn = pick(impl);
    std::mt19937 rng(0x50594330u);
    static uint8_t src[1024 * 80], rec[1024 * 80];
    for (int i = 0; i < 1024 * 80; i++)
    {
        src[i] = (uint8_t)(rng() & 255);
        rec[i] = (uint8_t)(rng() & 255);
    }
    std::vector<uint64_t> ts(samples);
    volatile int sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int b = 0; b < batch; b++)
        {
            int idx = ((s * 7 + b * 13) % 1024) * 80;
            sink += fn(src + idx, 80, rec + idx, 80);
        }
        ts[s] = read_cntvct() - t0;
    }
    (void)sink;
    std::sort(ts.begin(), ts.end());
    printf("%s,%d,%d,%.2f\n", impl, samples, batch,
           (double)ts[samples / 2] / batch);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <up16|cand16|up32> <samples> <batch> | "
                        "verify [cases]\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    return bench(argv[1], atoi(argv[2]), atoi(argv[3]));
}
