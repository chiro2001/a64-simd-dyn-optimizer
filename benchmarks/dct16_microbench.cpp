// DCT16 real-machine microbenchmark (Yitian710 VL=128): upstream x265
// dct16 SVE (SVE1, used by dispatch) vs dct16 NEON (asm), CNTVCT ticks.
//
// Usage: dct16_microbench <impl> <latency|throughput> <samples> <batch>
//   impl: sve | neon
// Verify mode: dct16_microbench verify <cases>  (vs dct16_sve)
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

namespace x265 {
void dct16_sve(const int16_t*, int16_t*, intptr_t);
}

extern "C" void x265_dct16_neon(const int16_t*, int16_t*, intptr_t);

static const int N = 16;
static const int STRIDE = 32;
static const int CORPUS = 1024;

typedef void (*dct_fn)(const int16_t*, int16_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static dct_fn pick(const char* impl)
{
    if (!strcmp(impl, "sve"))
        return x265::dct16_sve;
    if (!strcmp(impl, "neon"))
        return x265_dct16_neon;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0xD16Cu);
    dct_fn fn = pick(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        int16_t src[N * STRIDE], want[N * N], got[N * N];
        for (int i = 0; i < N * STRIDE; i++)
            src[i] = (int16_t)((int)(rng() % 511) - 255);
        x265::dct16_sve(src, want, STRIDE);
        fn(src, got, STRIDE);
        for (int i = 0; i < N * N; i++)
            if (want[i] != got[i])
                mism++;
    }
    printf("verify,%s,%d,%ld\n", impl, cases, mism);
    return mism != 0;
}

static int bench(const char* impl, const char* mode, int samples, int batch)
{
    dct_fn fn = pick(impl);
    std::mt19937 rng(0xD16Cu);
    static int16_t src[CORPUS * STRIDE];
    static int16_t dst[CORPUS * N];
    for (int i = 0; i < CORPUS * STRIDE; i++)
        src[i] = (int16_t)((int)(rng() % 511) - 255);
    std::vector<uint64_t> ts(samples);
    for (int s = 0; s < samples; s++)
    {
        uint64_t t0 = read_cntvct();
        for (int b = 0; b < batch; b++)
        {
            int idx = (s * batch + b) % CORPUS;
            fn(src + idx * STRIDE, dst + idx * N, STRIDE);
        }
        ts[s] = read_cntvct() - t0;
    }
    std::sort(ts.begin(), ts.end());
    uint64_t med = ts[samples / 2];
    double per = (double)med / batch;
    printf("%s,%s,%d,%d,%.2f\n", impl, mode, samples, batch, per);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <sve|neon> <latency|throughput> "
                        "<samples> <batch> | verify <cases>\n", argv[0]);
        return 2;
    }
    if (!strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    return bench(argv[1], argv[2], atoi(argv[3]), atoi(argv[4]));
}
