// IDCT32 real-machine microbenchmark (950/960): upstream x265 idct32
// NEON / C vs tool-generated SVE2p1 candidate, CNTVCT ticks.
//
// Usage: idct32_microbench <impl> <latency|throughput> <samples> <batch>
//   impl: c | neon | cand
// Verify mode: idct32_microbench verify <cases>
//
// Contract for cand is bit-exact vs x265::idct32_c; output is
// checksummed so timing loops cannot be optimized away.
#include <algorithm>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

namespace x265 {
void idct32_neon(const int16_t*, int16_t*, intptr_t);
void idct32_c(const int16_t*, int16_t*, intptr_t);
}

extern "C" void dynopt_idct32_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

static const int N = 32;
static const int STRIDE = 64;
static const int CORPUS = 1024;

typedef void (*idct_fn)(const int16_t*, int16_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static idct_fn pick(const char* impl)
{
    if (!strcmp(impl, "c"))
        return x265::idct32_c;
    if (!strcmp(impl, "neon"))
        return x265::idct32_neon;
    if (!strcmp(impl, "cand"))
        return dynopt_idct32_sve2_shared;
    fprintf(stderr, "unknown impl %s\n", impl);
    exit(2);
}

static int verify(const char* impl, int cases)
{
    std::mt19937 rng(0xD32Cu);
    idct_fn fn = pick(impl);
    long mism = 0;
    for (int t = 0; t < cases; t++)
    {
        int16_t src[N * STRIDE], want[N * N], got[N * N];
        for (int i = 0; i < N * STRIDE; i++)
            src[i] = (int16_t)((int)(rng() % 65536) - 32768);
        x265::idct32_c(src, want, STRIDE);
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
    idct_fn fn = pick(impl);
    std::mt19937 rng(0xB32Cu);
    std::vector<int16_t> data((size_t)CORPUS * N * STRIDE);
    std::vector<const int16_t*> ptr(CORPUS);
    for (int i = 0; i < CORPUS; i++)
    {
        int16_t* a = &data[(size_t)i * N * STRIDE];
        for (int j = 0; j < N * STRIDE; j++)
            a[j] = (int16_t)((int)(rng() % 65536) - 32768);
        ptr[i] = a;
    }
    std::vector<int16_t> dst((size_t)batch * N * N);
    uint64_t acc = 0;
    std::vector<uint64_t> ticks;
    ticks.reserve(samples);

    for (int s = 0; s < samples; s++)
    {
        const int16_t* src = ptr[s % CORPUS];
        uint64_t t0, t1;
        if (!strcmp(mode, "throughput"))
        {
            t0 = read_cntvct();
            for (int b = 0; b < batch; b++)
                fn(src, &dst[(size_t)b * N * N], STRIDE);
            t1 = read_cntvct();
            ticks.push_back((t1 - t0) / (uint64_t)batch);
        }
        else
        {
            t0 = read_cntvct();
            fn(src, &dst[0], STRIDE);
            t1 = read_cntvct();
            ticks.push_back(t1 - t0);
        }
        acc += (uint64_t)dst[(size_t)(s * 7 + 13) % ((size_t)batch * N * N)];
    }
    std::sort(ticks.begin(), ticks.end());
    uint64_t sum = 0;
    for (uint64_t t : ticks)
        sum += t;
    printf("bench,%s,%s,%d,%d,min=%llu,p50=%llu,p99=%llu,avg=%.1f,sum=%llu\n",
           impl, mode, samples, batch,
           (unsigned long long)ticks.front(),
           (unsigned long long)ticks[samples / 2],
           (unsigned long long)ticks[(samples * 99) / 100],
           (double)sum / samples, (unsigned long long)acc);
    return 0;
}

int main(int argc, char** argv)
{
    if (argc >= 3 && !strcmp(argv[1], "verify"))
        return verify(argv[2], argc > 3 ? atoi(argv[3]) : 20000);
    if (argc < 5)
    {
        fprintf(stderr, "usage: idct32_microbench <impl> "
                        "<latency|throughput> <samples> <batch>\n");
        return 2;
    }
    return bench(argv[1], argv[2], atoi(argv[3]), atoi(argv[4]));
}
