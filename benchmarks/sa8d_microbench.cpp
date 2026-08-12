// Standalone SA8D microbenchmark + differential harness.
//
// Exposes three implementations in one binary:
//   c     - x265 scalar C reference (setupCPrimitives)
//   neon  - x265 upstream NEON dispatch baseline (setupIntrinsic+Assembly)
//   empty - loop-only harness with identical call shape, returns 0
//   rt    - generated seed-roundtrip candidate (8x8 only, link required)
//
// Usage:
//   sa8d_microbench <8x8|16x16|32x32|64x64> <c|neon|empty> <latency|throughput>
//                  <samples> <batch> [--verify-only|--noverify]
//
// Output: one CSV line per sample:
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

extern "C" int dynopt_sa8d_8x8_neon_roundtrip(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static const int BUFSZ = 64;          // 64x64 pixel buffer per image
static const int STRIDE = BUFSZ;
static const int CORPUS = 1024;

typedef int (*sa8d_fn)(const pixel*, intptr_t, const pixel*, intptr_t);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static int empty_sa8d(const pixel*, intptr_t, const pixel*, intptr_t)
{
    return 0;
}

struct Corpus
{
    std::vector<pixel> data;          // CORPUS * 2 * 64*64
    std::vector<int>   offs;          // CORPUS block offsets
    std::vector<const pixel*> pa, pb;

    Corpus(int shape)
    {
        std::mt19937 rng(0x5A8D2026u);
        const int s = shape;
        const int maxOff = BUFSZ - s;
        data.resize(CORPUS * 2 * BUFSZ * BUFSZ);
        offs.resize(CORPUS);
        pa.resize(CORPUS);
        pb.resize(CORPUS);
        for (int i = 0; i < CORPUS; i++)
        {
            pixel* a = &data[(size_t)i * 2 * BUFSZ * BUFSZ];
            pixel* b = a + BUFSZ * BUFSZ;
            for (int j = 0; j < BUFSZ * BUFSZ; j++)
            {
                a[j] = (pixel)(rng() & 0xFF);
                b[j] = (pixel)(rng() & 0xFF);
            }
            offs[i] = (int)(rng() % (maxOff * maxOff + 1));
            pa[i] = a;
            pb[i] = b;
        }
    }

    const pixel* a(int i) const { return pa[i]; }
    const pixel* b(int i) const { return pb[i]; }
    int off(int i) const { return offs[i]; }
};

static bool verify_shape(const EncoderPrimitives& cprim,
                         const EncoderPrimitives& neon,
                         int shape)
{
    const LumaCU idx = shape == 8 ? BLOCK_8x8
                     : shape == 16 ? BLOCK_16x16
                     : shape == 32 ? BLOCK_32x32
                                   : BLOCK_64x64;
    const int maxOff = BUFSZ - shape;
    std::mt19937 rng(0xC0FFEEu + shape);
    int mismatches = 0;
    for (int t = 0; t < 20000 && mismatches < 5; t++)
    {
        // Build a small fresh pair of blocks in stack buffers to cover
        // unaligned and varied offsets without a full corpus round trip.
        pixel a[64 * 64], b[64 * 64];
        for (int i = 0; i < BUFSZ * BUFSZ; i++)
        {
            a[i] = (pixel)(rng() & 0xFF);
            b[i] = (pixel)(rng() & 0xFF);
        }
        const int off = (int)(rng() % (maxOff * maxOff + 1));
        const int ox = off % maxOff;
        const int oy = off / maxOff;
        const pixel* pa = a + (size_t)oy * STRIDE + ox;
        const pixel* pb = b + (size_t)oy * STRIDE + ox;
        const int rc = cprim.cu[idx].sa8d(pa, STRIDE, pb, STRIDE);
        const int rn = neon.cu[idx].sa8d(pa, STRIDE, pb, STRIDE);
        if (rc != rn)
        {
            fprintf(stderr,
                    "MISMATCH shape=%d off=(%d,%d) c=%d neon=%d\n",
                    shape, ox, oy, rc, rn);
            mismatches++;
        }
    }
    return mismatches == 0;
}

static int64_t run_batch(sa8d_fn fn, const Corpus& corpus, int batch,
                         bool latency, uint64_t* ticksOut)
{
    const uint64_t mask = CORPUS - 1;
    const uint64_t t0 = read_cntvct();
    if (latency)
    {
        uint64_t checksum = 0x9E3779B97F4A7C15ull;
        for (int i = 0; i < batch; i++)
        {
            const size_t idx = (checksum + (uint64_t)i) & mask;
            checksum += (uint64_t)fn(corpus.a((int)idx) + corpus.off((int)idx), STRIDE,
                                     corpus.b((int)idx) + corpus.off((int)idx), STRIDE);
        }
        *ticksOut = read_cntvct() - t0;
        return (int64_t)(checksum & 0xFFFFFFFFull);
    }
    else
    {
        int64_t acc[4] = { 0, 0, 0, 0 };
        for (int i = 0; i + 4 <= batch; i += 4)
        {
            const size_t i0 = (size_t)(i + 0) & mask;
            const size_t i1 = (size_t)(i + 1) & mask;
            const size_t i2 = (size_t)(i + 2) & mask;
            const size_t i3 = (size_t)(i + 3) & mask;
            acc[0] += fn(corpus.a(i0) + corpus.off(i0), STRIDE, corpus.b(i0) + corpus.off(i0), STRIDE);
            acc[1] += fn(corpus.a(i1) + corpus.off(i1), STRIDE, corpus.b(i1) + corpus.off(i1), STRIDE);
            acc[2] += fn(corpus.a(i2) + corpus.off(i2), STRIDE, corpus.b(i2) + corpus.off(i2), STRIDE);
            acc[3] += fn(corpus.a(i3) + corpus.off(i3), STRIDE, corpus.b(i3) + corpus.off(i3), STRIDE);
        }
        *ticksOut = read_cntvct() - t0;
        return acc[0] + acc[1] + acc[2] + acc[3];
    }
}

int main(int argc, char** argv)
{
    if (argc < 6)
    {
        fprintf(stderr,
                "usage: %s <8x8|16x16|32x32|64x64> <c|neon|empty> <latency|throughput> "
                "<samples> <batch> [--verify-only]\n",
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
        bool allOk = true;
        const int shapes[] = { 8, 16, 32, 64 };
        for (size_t i = 0; i < sizeof(shapes) / sizeof(shapes[0]); i++)
            allOk = verify_shape(cprim, neon, shapes[i]) && allOk;
        if (!allOk)
        {
            fprintf(stderr, "differential verification FAILED\n");
            return 1;
        }
        fprintf(stderr, "differential verification OK (c == neon on 20k random cases per shape)\n");
        if (verifyOnly)
            return 0;
    }

    sa8d_fn fn = 0;
    if (implS == "c")       fn = cprim.cu[shape == 8 ? BLOCK_8x8 : shape == 16 ? BLOCK_16x16 : shape == 32 ? BLOCK_32x32 : BLOCK_64x64].sa8d;
    else if (implS == "neon") fn = neon.cu[shape == 8 ? BLOCK_8x8 : shape == 16 ? BLOCK_16x16 : shape == 32 ? BLOCK_32x32 : BLOCK_64x64].sa8d;
    else if (implS == "empty") fn = empty_sa8d;
    else if (implS == "rt")
    {
        if (shape != 8) { fprintf(stderr, "rt impl only supports 8x8\n"); return 2; }
        fn = dynopt_sa8d_8x8_neon_roundtrip;
    }
    else { fprintf(stderr, "bad impl\n"); return 2; }
    if (!fn) { fprintf(stderr, "impl pointer is NULL\n"); return 2; }

    const bool latency = modeS == "latency";
    if (modeS != "latency" && modeS != "throughput")
    { fprintf(stderr, "bad mode\n"); return 2; }

    const Corpus corpus(shape);

    // Warmup
    uint64_t dummyTicks = 0;
    for (int i = 0; i < 64; i++)
        run_batch(fn, corpus, 512, latency, &dummyTicks);

    printf("shape,impl,mode,sample,batch,ns,ticks,checksum\n");
    for (int s = 0; s < samples; s++)
    {
        const auto t0 = std::chrono::steady_clock::now();
        uint64_t ticks = 0;
        const int64_t sum = run_batch(fn, corpus, batch, latency, &ticks);
        const auto t1 = std::chrono::steady_clock::now();
        const double ns = std::chrono::duration_cast<std::chrono::nanoseconds>(t1 - t0).count();
        printf("%s,%s,%s,%d,%d,%.0f,%llu,%lld\n",
               shapeS.c_str(), implS.c_str(), modeS.c_str(), s, batch, ns,
               (unsigned long long)ticks, (long long)sum);
    }
    return 0;
}
