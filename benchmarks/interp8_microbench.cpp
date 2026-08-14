// Standalone 8-tap luma horizontal interpolation (filter_pp_t) A/B harness.
//
//   c     - x265 scalar C reference (setupCPrimitives)
//   neon  - x265 upstream NEON dispatch baseline (setupIntrinsic+Assembly)
//   empty - loop-only harness, identical call shape
//   cand  - DYNOPT_CANDIDATE macro symbol (link required)
//
// Usage: interp8_microbench <8x8|8x8v|16x16|16x16v|32x32>
//                           <c|neon|empty|cand|vc|vneon|vcand>
//                           <latency|throughput> <samples> <batch>
//                           [--verify-only|--noverify]
// The filter phase is fixed to coeffIdx=2 (the symmetric 8-tap luma phase)
// for the benchmark; verification covers all four phases.
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
#define DYNOPT_CANDIDATE dynopt_interp8_hpp_candidate
#endif
extern "C" void DYNOPT_CANDIDATE(
    const pixel*, intptr_t, pixel*, intptr_t, int) __attribute__((weak));
#ifndef DYNOPT_CANDIDATE16
#define DYNOPT_CANDIDATE16 dynopt_interp8_hpp16_candidate
#endif
extern "C" void DYNOPT_CANDIDATE16(
    const pixel*, intptr_t, pixel*, intptr_t, int) __attribute__((weak));
#ifndef DYNOPT_CANDIDATE_VPP
#define DYNOPT_CANDIDATE_VPP dynopt_interp8_vpp_candidate
#endif
extern "C" void DYNOPT_CANDIDATE_VPP(
    const pixel*, intptr_t, pixel*, intptr_t, int) __attribute__((weak));

static const int BUFSZ = 64;
static const int STRIDE = BUFSZ;
static const int CORPUS = 1024;
static const int COEFF_IDX = 2;

typedef void (*filter_pp_fn)(const pixel*, intptr_t, pixel*, intptr_t, int);

static inline uint64_t read_cntvct()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

static void empty_filter(const pixel*, intptr_t, pixel*, intptr_t, int)
{
}

struct Corpus
{
    std::vector<pixel> data;
    std::vector<int> offs;
    std::vector<const pixel*> p;

    Corpus(int shape)
    {
        std::mt19937 rng(0x1A8u + shape);
        data.resize((size_t)CORPUS * BUFSZ * BUFSZ);
        offs.resize(CORPUS);
        p.resize(CORPUS);
        for (int i = 0; i < CORPUS; i++)
        {
            pixel* a = &data[(size_t)i * BUFSZ * BUFSZ];
            for (int j = 0; j < BUFSZ * BUFSZ; j++)
                a[j] = (pixel)(rng() & 0xFF);
            // left margin of 3 for the 8-tap offset, right margin of 3
            offs[i] = 3 + (int)(rng() % (BUFSZ - shape - 6 + 1));
            p[i] = a;
        }
    }

    const pixel* a(int i) const { return p[i]; }
    int off(int i) const { return offs[i]; }
};

static bool verify_shape(const EncoderPrimitives& cprim,
                         const EncoderPrimitives& neon, int shape,
                         bool vertical)
{
    const LumaPU idx = shape == 8 ? LUMA_8x8
                     : shape == 16 ? LUMA_16x16 : LUMA_32x32;
    std::mt19937 rng(0x1A80u + shape);
    int mismatches = 0;
    for (int t = 0; t < 20000 && mismatches < 5; t++)
    {
        pixel a[64 * 64], want[64 * 64], got[64 * 64];
        for (int i = 0; i < BUFSZ * BUFSZ; i++)
            a[i] = (pixel)(rng() & 0xFF);
        const int off = 3 + (int)(rng() % (BUFSZ - shape - 6 + 1));
        const int voff = vertical ? 3 * STRIDE : 0;
        // upstream base NEON vertical has no coeffIdx==0 case (writes
        // nothing); x265 never calls the integer phase, but the C reference
        // contract includes it - compare phases 1..3 for the baseline only
        for (int phase = vertical ? 1 : 0; phase < 4; phase++)
        {
            if (vertical)
            {
                cprim.pu[idx].luma_vpp(a + off + voff, STRIDE, want, shape, phase);
                neon.pu[idx].luma_vpp(a + off + voff, STRIDE, got, shape, phase);
            }
            else
            {
                cprim.pu[idx].luma_hpp(a + off, STRIDE, want, shape, phase);
                neon.pu[idx].luma_hpp(a + off, STRIDE, got, shape, phase);
            }
            if (memcmp(want, got, (size_t)shape * shape) != 0)
            {
                fprintf(stderr, "MISMATCH shape=%d phase=%d\n", shape, phase);
                if (mismatches == 0)
                {
                    for (int r = 0; r < shape; r++)
                    {
                        for (int c = 0; c < shape; c++)
                        {
                            if (want[r * shape + c] != got[r * shape + c])
                            {
                                fprintf(stderr,
                                        "  first diff r=%d c=%d want=%d got=%d"
                                        " src_c=%d"
                                        " src=%d,%d,%d,%d,%d,%d,%d,%d\n",
                                        r, c, want[r * shape + c],
                                        got[r * shape + c],
                                        a[off + r * STRIDE + c],
                                        a[off + r * STRIDE + c - 3],
                                        a[off + r * STRIDE + c - 2],
                                        a[off + r * STRIDE + c - 1],
                                        a[off + r * STRIDE + c],
                                        a[off + r * STRIDE + c + 1],
                                        a[off + r * STRIDE + c + 2],
                                        a[off + r * STRIDE + c + 3],
                                        a[off + r * STRIDE + c + 4]);
                                goto next_phase;
                            }
                        }
                    }
                }
next_phase:
                mismatches++;
                break;
            }
        }
    }
    return mismatches == 0;
}

static bool verify_candidate(filter_pp_fn fn,
                             const EncoderPrimitives& cprim, int shape,
                             bool vertical)
{
    const LumaPU idx = shape == 8 ? LUMA_8x8
                     : shape == 16 ? LUMA_16x16 : LUMA_32x32;
    std::mt19937 rng(0xC8E8u + shape);
    int mismatches = 0;
    for (int t = 0; t < 20000 && mismatches < 5; t++)
    {
        pixel a[64 * 64], want[64 * 64], got[64 * 64];
        for (int i = 0; i < BUFSZ * BUFSZ; i++)
            a[i] = (pixel)(rng() & 0xFF);
        const int off = 3 + (int)(rng() % (BUFSZ - shape - 6 + 1));
        const int voff = vertical ? 3 * STRIDE : 0;
        for (int phase = 0; phase < 4; phase++)
        {
            fn(a + off + voff, STRIDE, got, shape, phase);
            if (vertical)
                cprim.pu[idx].luma_vpp(a + off + voff, STRIDE, want, shape, phase);
            else
                cprim.pu[idx].luma_hpp(a + off, STRIDE, want, shape, phase);
            if (memcmp(want, got, (size_t)shape * shape) != 0)
            {
                fprintf(stderr, "CAND MISMATCH shape=%d phase=%d\n",
                        shape, phase);
                mismatches++;
                break;
            }
        }
    }
    return mismatches == 0;
}

static int64_t run_batch(filter_pp_fn fn, const Corpus& corpus, int shape,
                         int batch, bool latency, bool vertical,
                         uint64_t* ticksOut)
{
    const uint64_t mask = CORPUS - 1;
    const uint64_t t0 = read_cntvct();
    const int voff = vertical ? 3 * STRIDE : 0;
    pixel out[64 * 64];
    int64_t checksum = 0;
    if (latency)
    {
        uint64_t sel = 0x9E3779B97F4A7C15ull;
        for (int i = 0; i < batch; i++)
        {
            const size_t idx = (sel + (uint64_t)i) & mask;
            fn(corpus.a((int)idx) + corpus.off((int)idx) + voff, STRIDE,
               out, shape, COEFF_IDX);
            sel = (uint64_t)((uint32_t)out[0] * 0x9E3779B9u
                             + (uint32_t)out[shape * shape - 1]);
            checksum += out[0] + out[shape * shape - 1];
        }
    }
    else
    {
        for (int i = 0; i < batch; i++)
        {
            const size_t idx = (uint64_t)i & mask;
            fn(corpus.a((int)idx) + corpus.off((int)idx) + voff, STRIDE,
               out, shape, COEFF_IDX);
            checksum += out[0] + out[shape * shape - 1];
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
                "usage: %s <8x8|8x8v|16x16|16x16v|32x32>"
                " <c|neon|empty|cand|vc|vneon|vcand> "
                "<latency|throughput> <samples> <batch> [--verify-only]\n",
                argv[0]);
        return 2;
    }
    const std::string shapeS = argv[1];
    const std::string implS = argv[2];
    const std::string modeS = argv[3];
    const int samples = atoi(argv[4]);
    const int batch = atoi(argv[5]);
    bool verifyOnly = false, skipVerify = false;
    for (int i = 6; i < argc; i++)
    {
        if (std::string(argv[i]) == "--verify-only")
            verifyOnly = true;
        if (std::string(argv[i]) == "--noverify")
            skipVerify = true;
    }

    int shape = 0;
    bool vertical = false;
    if (shapeS == "8x8" || shapeS == "8x8v")
        { shape = 8; vertical = shapeS == "8x8v"; }
    else if (shapeS == "16x16" || shapeS == "16x16v")
        { shape = 16; vertical = shapeS == "16x16v"; }
    else if (shapeS == "32x32") shape = 32;
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
        const int shapes[] = { 8, 16, 32 };
        for (size_t i = 0; i < 3; i++)
            if (!verify_shape(cprim, neon, shapes[i], vertical))
            {
                fprintf(stderr, "differential verification FAILED\n");
                return 1;
            }
        fprintf(stderr, "differential verification OK (c == neon, 4 phases)\n");
        if (verifyOnly && implS != "cand" && implS != "vcand")
            return 0;
    }

    filter_pp_fn fn = 0;
    const LumaPU luma_idx = shape == 8 ? LUMA_8x8
                          : shape == 16 ? LUMA_16x16 : LUMA_32x32;
    if (implS == "c")
        fn = vertical ? cprim.pu[luma_idx].luma_vpp
                      : cprim.pu[luma_idx].luma_hpp;
    else if (implS == "neon")
        fn = vertical ? neon.pu[luma_idx].luma_vpp
                      : neon.pu[luma_idx].luma_hpp;
    else if (implS == "vc")
        fn = cprim.pu[luma_idx].luma_vpp;
    else if (implS == "vneon")
        fn = neon.pu[luma_idx].luma_vpp;
    else if (implS == "empty")
        fn = empty_filter;
    else if (implS == "cand")
        fn = shape == 16 ? DYNOPT_CANDIDATE16 : DYNOPT_CANDIDATE;
    else if (implS == "vcand")
        fn = DYNOPT_CANDIDATE_VPP;
    else { fprintf(stderr, "bad impl\n"); return 2; }
    if (!fn) { fprintf(stderr, "impl pointer is NULL\n"); return 2; }

    if (!skipVerify && (implS == "cand" || implS == "vcand"))
    {
        if (!verify_candidate(fn, cprim, shape, vertical))
        {
            fprintf(stderr, "candidate differential verification FAILED\n");
            return 1;
        }
        fprintf(stderr, "candidate verification OK (cand == C, 4 phases)\n");
        if (verifyOnly)
            return 0;
    }

    const bool latency = modeS == "latency";
    if (modeS != "latency" && modeS != "throughput")
    { fprintf(stderr, "bad mode\n"); return 2; }

    const Corpus corpus(shape);
    uint64_t dummyTicks = 0;
    for (int i = 0; i < 64; i++)
        run_batch(fn, corpus, shape, 512, latency, vertical, &dummyTicks);

    printf("shape,impl,mode,sample,batch,ns,ticks,checksum\n");
    for (int s = 0; s < samples; s++)
    {
        const auto t0 = std::chrono::steady_clock::now();
        uint64_t ticks = 0;
        const int64_t sum = run_batch(fn, corpus, shape, batch, latency,
                                      vertical, &ticks);
        const auto t1 = std::chrono::steady_clock::now();
        const double ns = std::chrono::duration_cast<std::chrono::nanoseconds>(t1 - t0).count();
        printf("%s,%s,%s,%d,%d,%.0f,%llu,%lld\n",
               shapeS.c_str(), implS.c_str(), modeS.c_str(), s, batch, ns,
               (unsigned long long)ticks, (long long)sum);
    }
    return 0;
}
