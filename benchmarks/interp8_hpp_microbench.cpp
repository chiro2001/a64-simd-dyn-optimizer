// interp8 luma_hpp real-machine microbenchmark (Yitian710 VL=128):
// upstream x265 interp8_horiz_pp_dotprod vs AGO sdoth candidates.
//
// Usage: interp8_hpp_microbench <up16|cand16|up32|cand32>
//                               <samples> <batch>
// Verify mode: interp8_hpp_microbench verify <cases>
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

namespace x265 {
template <int W, int H> void interp8_horiz_pp_dotprod(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
template <int N, int W, int H> void interp_horiz_pp_neon(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
template <int W, int H> void interp8_horiz_pp_i8mm(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
}

extern "C" void dynopt_interp8_16x16_sve2(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);
extern "C" void dynopt_interp8_32x32_sve2(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

typedef void (*fn_t)(const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static fn_t pick(const char* impl)
{
    if (!strcmp(impl, "up16"))  return x265::interp8_horiz_pp_dotprod<16, 16>;
    if (!strcmp(impl, "up16n")) return x265::interp_horiz_pp_neon<8, 16, 16>;
    if (!strcmp(impl, "cand16")) return dynopt_interp8_16x16_sve2;
    if (!strcmp(impl, "up32"))  return x265::interp8_horiz_pp_dotprod<32, 32>;
    if (!strcmp(impl, "up32n")) return x265::interp_horiz_pp_neon<8, 32, 32>;
    if (!strcmp(impl, "up32i")) return x265::interp8_horiz_pp_i8mm<32, 32>;
    if (!strcmp(impl, "up16i")) return x265::interp8_horiz_pp_i8mm<16, 16>;
    if (!strcmp(impl, "cand32")) return dynopt_interp8_32x32_sve2;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int shape(const char* impl)
{
    return strstr(impl, "32") ? 32 : 16;
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0x1DE80u);
    fn_t fn = pick(impl);
    int n = shape(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        int stride = n << 1;
        static uint8_t src[80 * 80 + 16], wa[80 * 80], wb[80 * 80];
        for (int i = 0; i < 80 * 80 + 16; i++)
            src[i] = (uint8_t)(rng() & 255);
        int ph = (int)(rng() % 8);
        int off = (int)(rng() % 16);
        if (n == 32)
            x265::interp_horiz_pp_neon<8, 32, 32>(src + off, stride,
                                                  wa, stride, ph);
        else
            x265::interp_horiz_pp_neon<8, 16, 16>(src + off, stride,
                                                  wa, stride, ph);
        fn(src + off, stride, wb, stride, ph);
        for (int i = 0; i < n * n; i++)
            if (wa[i] != wb[i])
                mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, int samples, int batch)
{
    fn_t fn = pick(impl);
    int n = shape(impl);
    std::mt19937 rng(0x1DE80u);
    static uint8_t src[1024 * 80 + 16], dst[1024 * 80];
    for (int i = 0; i < 1024 * 80 + 16; i++)
        src[i] = (uint8_t)(rng() & 255);
    std::vector<uint64_t> ts(samples);
    volatile int sink = 0;
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int b = 0; b < batch; b++)
        {
            int idx = ((s * 7 + b * 13) % 1024) * 80;
            fn(src + idx, 80, dst + idx, 80, (s + b) & 7);
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
        fprintf(stderr, "usage: %s <up16|cand16|up32|cand32> "
                        "<samples> <batch> | verify [cases]\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    return bench(argv[1], atoi(argv[2]), atoi(argv[3]));
}
