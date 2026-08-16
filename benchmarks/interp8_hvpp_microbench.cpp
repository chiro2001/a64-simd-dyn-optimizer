// interp8 luma_hvpp real-machine microbenchmark (Yitian710 VL=128):
// upstream x265::interp_hv_pp_i8mm (immed-buffer on GCC) vs fused
// candidate, all 49 phase combos.
//
// Usage: interp8_hvpp_microbench <upstream|cand> <samples> <batch>
// Verify mode: interp8_hvpp_microbench verify [cases]
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

namespace x265 {
template <int W, int H> void interp_hv_pp_i8mm(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int, int);
}

extern "C" void dynopt_interp_hvpp_32x32_sve2(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int, int);

typedef void (*fn_t)(const uint8_t*, intptr_t, uint8_t*, intptr_t, int, int);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static fn_t pick(const char* impl)
{
    if (!strcmp(impl, "upstream")) return x265::interp_hv_pp_i8mm<32, 32>;
    if (!strcmp(impl, "cand"))     return dynopt_interp_hvpp_32x32_sve2;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0x1DE80u);
    fn_t fn = pick(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        int stride = 32 + (t % 3) * 16;
        static uint8_t src[80 * 80], wa[64 * 64], wb[64 * 64];
        for (int i = 0; i < 80 * 80; i++)
            src[i] = (uint8_t)(rng() & 255);
        int idxX = 1 + (int)(rng() % 7);
        int idxY = 1 + (int)(rng() % 7);
        x265::interp_hv_pp_i8mm<32, 32>(src, stride, wa, stride, idxX, idxY);
        fn(src, stride, wb, stride, idxX, idxY);
        for (int i = 0; i < 32 * 32; i++)
            if (wa[i] != wb[i])
                mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, int samples, int batch)
{
    fn_t fn = pick(impl);
    std::mt19937 rng(0x1DE80u);
    static uint8_t src[1024 * 80], dst[1024 * 64];
    for (int i = 0; i < 1024 * 80; i++)
        src[i] = (uint8_t)(rng() & 255);
    std::vector<uint64_t> ts(samples);
    volatile int sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int b = 0; b < batch; b++)
        {
            int idx = ((s * 7 + b * 13) % 1024) * 80;
            fn(src + idx, 80, dst + idx, 64,
               1 + ((s + b) & 7), 1 + ((s * 3 + b) & 7));
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
        fprintf(stderr, "usage: %s <upstream|cand> <samples> <batch> | "
                        "verify [cases]\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    return bench(argv[1], atoi(argv[2]), atoi(argv[3]));
}
