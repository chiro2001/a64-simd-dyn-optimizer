// Standalone DCT8 microbenchmark + differential harness (tier a: NEON->NEON).
//
// Exposes four implementations in one binary:
//   c     - x265 scalar C reference (setupCPrimitives)
//   neon  - x265 upstream NEON dispatch baseline (setupIntrinsic+Assembly)
//   empty - loop-only harness with identical call shape, returns 0
//   cand  - DYNOPT_CANDIDATE macro symbol (8x8 only, link required)
//
// Usage:
//   dct8_microbench <8x8|16x16|32x32|64x64> <c|neon|empty|cand>
//                   <latency|throughput> <samples> <batch> [--verify-only|--noverify]
//
// Output: one CSV line per sample (ticks column feeds the paired-cycles
// runner when no hardware PMU is available):
//   shape,impl,mode,sample,batch,ns,ticks,checksum
#include "primitives.h"

#include <chrono>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <string>
#include <vector>

using namespace X265_NS;

#ifndef DYNOPT_CANDIDATE
#define DYNOPT_CANDIDATE dynopt_dct8_neon_candidate
#endif
extern "C" void DYNOPT_CANDIDATE(
    const int16_t*, int16_t*, intptr_t) __attribute__((weak));

static const int BUFSZ = 64;
static const int STRIDE = BUFSZ;
static const int CORPUS = 1024;

typedef void (*dct_fn)(const int16_t*, int16_t*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static void empty_dct(const int16_t*, int16_t*, intptr_t)
{
}

struct Corpus
{
    std::vector<int16_t> data;         // CORPUS * 64*64
    std::vector<int> offs;
    std::vector<const int16_t*> p;

    Corpus(int shape)
    {
        std::mt19937 rng(0xD8C8u + shape);
        const int maxOff = BUFSZ - shape;
        data.resize((size_t)CORPUS * BUFSZ * BUFSZ);
        offs.resize(CORPUS);
        p.resize(CORPUS);
        for (int i = 0; i < CORPUS; i++)
        {
            int16_t* a = &data[(size_t)i * BUFSZ * BUFSZ];
            for (int j = 0; j < BUFSZ * BUFSZ; j++)
                a[j] = (int16_t)((int)(rng() & 0x1FF) - 255);   // [-255,255]
            offs[i] = (int)(rng() % (maxOff * maxOff + 1));
            p[i] = a;
        }
    }

    const int16_t* a(int i) const { return p[i]; }
    int off(int i) const { return offs[i]; }
};

static int c_vs_neon_divergence(const EncoderPrimitives& cprim,
                                const EncoderPrimitives& neon, int shape)
{
    const LumaCU idx = shape == 8 ? BLOCK_8x8
                     : shape == 16 ? BLOCK_16x16
                     : shape == 32 ? BLOCK_32x32
                                   : BLOCK_64x64;
    const int maxOff = BUFSZ - shape;
    std::mt19937 rng(0xC8C0u + shape);
    int mismatches = 0;
    for (int t = 0; t < 20000 && mismatches < 5; t++)
    {
        int16_t a[64 * 64], want[64 * 64], got[64 * 64];
        for (int i = 0; i < BUFSZ * BUFSZ; i++)
            a[i] = (int16_t)((int)(rng() & 0x1FF) - 255);
        const int off = (int)(rng() % (maxOff * maxOff + 1));
        const int ox = off % maxOff;
        const int oy = off / maxOff;
        const int16_t* pa = a + (size_t)oy * STRIDE + ox;
        cprim.cu[idx].dct(pa, want, STRIDE);
        neon.cu[idx].dct(pa, got, STRIDE);
        if (memcmp(want, got, (size_t)shape * shape * sizeof(int16_t)) != 0)
        {
            fprintf(stderr, "MISMATCH shape=%d off=(%d,%d)\n", shape, ox, oy);
            mismatches++;
        }
    }
    return mismatches;
}

static bool verify_candidate(dct_fn fn, const EncoderPrimitives& cprim,
                             int shape)
{
    const LumaCU idx = BLOCK_8x8;
    const int maxOff = BUFSZ - shape;
    std::mt19937 rng(0xDCA0u + shape);
    int mismatches = 0;
    for (int t = 0; t < 20000 && mismatches < 5; t++)
    {
        int16_t a[64 * 64], want[64 * 64], got[64 * 64];
        for (int i = 0; i < BUFSZ * BUFSZ; i++)
            a[i] = (int16_t)((int)(rng() & 0x1FF) - 255);
        const int off = (int)(rng() % (maxOff * maxOff + 1));
        const int ox = off % maxOff;
        const int oy = off / maxOff;
        const int16_t* pa = a + (size_t)oy * STRIDE + ox;
        fn(pa, got, STRIDE);
        cprim.cu[idx].dct(pa, want, STRIDE);
        if (memcmp(want, got, (size_t)shape * shape * sizeof(int16_t)) != 0)
        {
        fprintf(stderr, "CAND MISMATCH shape=%d off=(%d,%d)\n",
                shape, ox, oy);
            mismatches++;
        }
    }
    return mismatches == 0;
}

static int64_t run_batch(dct_fn fn, const Corpus& corpus, int shape,
                         int batch, bool latency, uint64_t* ticksOut)
{
    const uint64_t mask = CORPUS - 1;
    const uint64_t t0 = read_cntvct();
    int16_t out[64 * 64];
    int64_t checksum = 0;
    if (latency)
    {
        uint64_t sel = 0x9E3779B97F4A7C15ull;
        for (int i = 0; i < batch; i++)
        {
            const size_t idx = (sel + (uint64_t)i) & mask;
            fn(corpus.a((int)idx) + corpus.off((int)idx), out, STRIDE);
            for (int k = 0; k < shape * shape; k++)
                checksum += out[k];
            sel = (uint64_t)checksum;
        }
    }
    else
    {
        for (int i = 0; i < batch; i++)
        {
            const size_t idx = (uint64_t)i & mask;
            fn(corpus.a((int)idx) + corpus.off((int)idx), out, STRIDE);
            for (int k = 0; k < shape * shape; k++)
                checksum += out[k];
        }
    }
    *ticksOut = read_cntvct() - t0;
    return checksum;
}

int main(int argc, char** argv)
{
    if (argc < 6)
    {
        fprintf(stderr,
                "usage: %s <8x8|16x16|32x32|64x64> <c|neon|empty|cand> "
                "<latency|throughput> <samples> <batch> [--verify-only]\n",
                argv[0]);
        return 2;
    }
    const std::string shapeS = argv[1];
    const std::string implS = argv[2];
    const std::string modeS = argv[3];
    const int samples = atoi(argv[4]);
    const int batch = atoi(argv[5]);
    const bool verifyOnly = argc > 6 && std::string(argv[6]) == "--verify-only";
    const bool skipVerify = argc > 6 && std::string(argv[6]) == "--noverify";

    int shape = 0;
    if (shapeS == "8x8") shape = 8;
    else if (shapeS == "16x16") shape = 16;
    else if (shapeS == "32x32") shape = 32;
    else if (shapeS == "64x64") shape = 64;
    else { fprintf(stderr, "bad shape\n"); return 2; }

    EncoderPrimitives cprim, neon;
    std::memset(&cprim, 0, sizeof(cprim));
    std::memset(&neon, 0, sizeof(neon));
    setupCPrimitives(cprim);
    setupAliasPrimitives(cprim);
    const int cpu = cpu_detect(false);
    setupIntrinsicPrimitives(neon, cpu);
    setupAssemblyPrimitives(neon, cpu);
    setupAliasPrimitives(neon);

    if (!skipVerify)
    {
        const int shapes[] = { 8, 16, 32, 64 };
        int diverged = 0;
        for (size_t i = 0; i < sizeof(shapes) / sizeof(shapes[0]); i++)
            diverged += c_vs_neon_divergence(cprim, neon, shapes[i]);
        fprintf(stderr,
                "c-vs-neon divergence report: %d/80000 cases differ "
                "(upstream NEON is not bit-exact with C on all in-range "
                "inputs; x265 TestBench still passes it).\n", diverged);
        if (verifyOnly && implS != "cand")
            return 0;
    }

    dct_fn fn = 0;
    if (implS == "c") fn = cprim.cu[shape == 8 ? BLOCK_8x8 : shape == 16 ? BLOCK_16x16 : shape == 32 ? BLOCK_32x32 : BLOCK_64x64].dct;
    else if (implS == "neon") fn = neon.cu[shape == 8 ? BLOCK_8x8 : shape == 16 ? BLOCK_16x16 : shape == 32 ? BLOCK_32x32 : BLOCK_64x64].dct;
    else if (implS == "empty") fn = empty_dct;
    else if (implS == "cand")
    {
        if (shape != 8) { fprintf(stderr, "cand impl only supports 8x8\n"); return 2; }
        fn = DYNOPT_CANDIDATE;
    }
    else { fprintf(stderr, "bad impl\n"); return 2; }
    if (!fn) { fprintf(stderr, "impl pointer is NULL\n"); return 2; }

    if (!skipVerify && implS == "cand")
    {
        if (!verify_candidate(fn, cprim, shape))
        {
            fprintf(stderr, "candidate differential verification FAILED\n");
            return 1;
        }
        fprintf(stderr, "candidate verification OK (cand == C reference on 20k random cases)\n");
        if (verifyOnly)
            return 0;
    }

    const bool latency = modeS == "latency";
    if (modeS != "latency" && modeS != "throughput")
    { fprintf(stderr, "bad mode\n"); return 2; }

    const Corpus corpus(shape);
    uint64_t dummyTicks = 0;
    for (int i = 0; i < 64; i++)
        run_batch(fn, corpus, shape, 512, latency, &dummyTicks);

    printf("shape,impl,mode,sample,batch,ns,ticks,checksum\n");
    for (int s = 0; s < samples; s++)
    {
        const auto t0 = std::chrono::steady_clock::now();
        uint64_t ticks = 0;
        const int64_t sum = run_batch(fn, corpus, shape, batch, latency, &ticks);
        const auto t1 = std::chrono::steady_clock::now();
        const double ns = std::chrono::duration_cast<std::chrono::nanoseconds>(t1 - t0).count();
        printf("%s,%s,%s,%d,%d,%.0f,%llu,%lld\n",
               shapeS.c_str(), implS.c_str(), modeS.c_str(), s, batch, ns,
               (unsigned long long)ticks, (long long)sum);
    }
    return 0;
}
