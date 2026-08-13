/*
 * testbench-lite: fast functional gate for tool-generated x265 kernels.
 *
 * Reuses x265's own MBDstHarness (transforms): identical random-buffer
 * generation (TEST_CASES=3 patterns, ITERS=128, INCR=16 stride) and the same
 * check_dct_primitive memcmp loop against the same C reference (dct16_c),
 * but only wires up the kernel slot(s) under test. A candidate can therefore
 * be gated in seconds without building the full TestBench or libx265.
 *
 * The full x265 TestBench run (scripts/build-testbench-inject.sh,
 * `--testbench transforms --nobench`) remains the acceptance golden standard
 * for DCT16; for SA8D the lite gate IS the acceptance gate (user decision
 * 2026-08-13). Extend the slot table below when new kernels
 * (dct8/dct32/interp8_hpp) need gating.
 */
#include <cstdio>
#include <cstring>
#include <ctime>
#include <cstdlib>

#include "mbdstharness.h"
#include "pixelharness.h"

namespace X265_NS {
/* C reference for DCT16 (defined in x265 common/dct.cpp, no header decl). */
void dct16_c(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

using namespace X265_NS;

/* Part-name tables used by PixelHarness for error reports (testbench.cpp). */
const char* lumaPartStr[NUM_PU_SIZES] =
{
    "  4x4", "  8x8", "16x16", "32x32", "64x64",
    "  8x4", "  4x8",
    " 16x8", " 8x16",
    "32x16", "16x32",
    "64x32", "32x64",
    "16x12", "12x16", " 16x4", " 4x16",
    "32x24", "24x32", " 32x8", " 8x32",
    "64x48", "48x64", "64x16", "16x64",
};

const char* chromaPartStr420[NUM_PU_SIZES] =
{
    "  2x2", "  4x4", "  8x8", "16x16", "32x32",
    "  4x2", "  2x4",
    "  8x4", "  4x8",
    " 16x8", " 8x16",
    "32x16", "16x32",
    "  8x6", "  6x8", "  8x2", "  2x8",
    "16x12", "12x16", " 16x4", " 4x16",
    "32x24", "24x32", " 32x8", " 8x32",
};

const char* chromaPartStr422[NUM_PU_SIZES] =
{
    "  2x4", "  4x8", " 8x16", "16x32", "32x64",
    "  4x4", "  2x8",
    "  8x8", " 4x16",
    "16x16", " 8x32",
    "32x32", "16x64",
    " 8x12", " 6x16", "  8x4", " 2x16",
    "16x24", "12x32", " 16x8", " 4x32",
    "32x48", "24x64", "32x16", " 8x64",
};

const char* const* chromaPartStr[X265_CSP_COUNT] =
{
    lumaPartStr,
    chromaPartStr420,
    chromaPartStr422,
    lumaPartStr
};

/* ---- x265 C reference for SA8D 8x8 (common/pixel.cpp, copied verbatim so
 * the lite gate compares against exactly what the full TestBench uses;
 * the real symbol is hidden in an anonymous namespace of libx265.a). The
 * sum_t/sum2_t types come from common.h (8-bit: uint16_t/uint32_t). ---- */
#define BITS_PER_SUM (8 * sizeof(sum_t))
#define HADAMARD4(d0, d1, d2, d3, s0, s1, s2, s3) { \
    sum2_t t0 = s0 + s1; \
    sum2_t t1 = s0 - s1; \
    sum2_t t2 = s2 + s3; \
    sum2_t t3 = s2 - s3; \
    d0 = t0 + t2; \
    d2 = t0 - t2; \
    d1 = t1 + t3; \
    d3 = t1 - t3; \
}
// in: a pseudo-simd number of the form x+(y<<16)
// return: abs(x)+(abs(y)<<16)
inline sum2_t abs2(sum2_t a)
{
    sum2_t s = ((a >> (BITS_PER_SUM - 1)) &
                (((sum2_t)1 << BITS_PER_SUM) + 1)) * ((sum_t)-1);
    return (a + s) ^ s;
}

static int sa8d_8x8_ref(const pixel* pix1, intptr_t i_pix1,
                        const pixel* pix2, intptr_t i_pix2)
{
    sum2_t tmp[8][4];
    sum2_t a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3;
    sum2_t sum = 0;

    for (int i = 0; i < 8; i++, pix1 += i_pix1, pix2 += i_pix2)
    {
        a0 = pix1[0] - pix2[0];
        a1 = pix1[1] - pix2[1];
        b0 = (a0 + a1) + ((a0 - a1) << BITS_PER_SUM);
        a2 = pix1[2] - pix2[2];
        a3 = pix1[3] - pix2[3];
        b1 = (a2 + a3) + ((a2 - a3) << BITS_PER_SUM);
        a4 = pix1[4] - pix2[4];
        a5 = pix1[5] - pix2[5];
        b2 = (a4 + a5) + ((a4 - a5) << BITS_PER_SUM);
        a6 = pix1[6] - pix2[6];
        a7 = pix1[7] - pix2[7];
        b3 = (a6 + a7) + ((a6 - a7) << BITS_PER_SUM);
        HADAMARD4(tmp[i][0], tmp[i][1], tmp[i][2], tmp[i][3], b0, b1, b2, b3);
    }

    for (int i = 0; i < 4; i++)
    {
        HADAMARD4(a0, a1, a2, a3, tmp[0][i], tmp[1][i], tmp[2][i], tmp[3][i]);
        HADAMARD4(a4, a5, a6, a7, tmp[4][i], tmp[5][i], tmp[6][i], tmp[7][i]);
        b0  = abs2(a0 + a4) + abs2(a0 - a4);
        b0 += abs2(a1 + a5) + abs2(a1 - a5);
        b0 += abs2(a2 + a6) + abs2(a2 - a6);
        b0 += abs2(a3 + a7) + abs2(a3 - a7);
        sum += (sum_t)b0 + (b0 >> BITS_PER_SUM);
    }

    return (int)((sum + 2) >> 2);
}

/* Tool-generated kernel(s), linked in by scripts/build-testbench-lite.sh. */
extern "C" void dynopt_dct16_sve2_shared(
    const int16_t* src, int16_t* dst, intptr_t stride);
extern "C" int dynopt_sa8d_8x8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);

static int gate_dct16(unsigned int seed)
{
    srand(seed);

    EncoderPrimitives ref;
    memset(&ref, 0, sizeof(ref));
    ref.cu[BLOCK_16x16].dct = dct16_c;

    EncoderPrimitives opt;
    memset(&opt, 0, sizeof(opt));
    opt.cu[BLOCK_16x16].dct = dynopt_dct16_sve2_shared;

    if (!opt.cu[BLOCK_16x16].dct)
    {
        fprintf(stderr, "TestBenchLite: dct16 slot is NULL, gate would be a "
                        "false PASS; refusing to run\n");
        return 2;
    }

    MBDstHarness h;
    const bool ok = h.testCorrectness(ref, opt);
    printf("TestBenchLite: seed=0x%08X dct16 %s\n",
           seed, ok ? "PASS" : "FAIL");
    return ok ? 0 : 1;
}

static int gate_sa8d(unsigned int seed)
{
    srand(seed);

    EncoderPrimitives ref;
    memset(&ref, 0, sizeof(ref));
    ref.cu[BLOCK_8x8].sa8d = sa8d_8x8_ref;

    EncoderPrimitives opt;
    memset(&opt, 0, sizeof(opt));
    opt.cu[BLOCK_8x8].sa8d = dynopt_sa8d_8x8_sve2;

    if (!opt.cu[BLOCK_8x8].sa8d)
    {
        fprintf(stderr, "TestBenchLite: sa8d slot is NULL, gate would be a "
                        "false PASS; refusing to run\n");
        return 2;
    }

    PixelHarness h;   // constructor fills the random test buffers (srand set)
    const bool ok = h.testCorrectness(ref, opt);
    printf("TestBenchLite: seed=0x%08X sa8d[8x8] %s\n",
           seed, ok ? "PASS" : "FAIL");
    return ok ? 0 : 1;
}

int main(int argc, char* argv[])
{
    unsigned int seed = (unsigned int)time(NULL);
    const char* gate = "dct16";

    for (int i = 1; i < argc; i++)
    {
        if (!strncmp(argv[i], "--seed", 6) && i + 1 < argc)
            seed = (unsigned int)strtoul(argv[++i], NULL, 0);
        else if (!strncmp(argv[i], "--gate", 6) && i + 1 < argc)
            gate = argv[++i];
        else if (!strncmp(argv[i], "--help", 6))
        {
            printf("usage: TestBenchLite [--gate dct16|sa8d] [--seed N]\n"
                   "reuses x265 MBDstHarness/PixelHarness data and C "
                   "references\n");
            return 0;
        }
    }

    if (!strcmp(gate, "sa8d"))
        return gate_sa8d(seed);
    return gate_dct16(seed);
}
