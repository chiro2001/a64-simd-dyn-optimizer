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
 * `--testbench transforms --nobench`) remains the acceptance golden standard;
 * this lite harness is the per-iteration fast gate. Extend the slot table
 * below when new kernels (dct8/dct32/sa8d/interp8_hpp) need gating.
 */
#include <cstdio>
#include <cstring>
#include <ctime>
#include <cstdlib>

#include "mbdstharness.h"

namespace X265_NS {
/* C reference for DCT16 (defined in x265 common/dct.cpp, no header decl). */
void dct16_c(const int16_t* src, int16_t* dst, intptr_t srcStride);
}

using namespace X265_NS;

/* Tool-generated kernel(s), linked in by scripts/build-testbench-lite.sh. */
extern "C" void dynopt_dct16_sve2_shared(
    const int16_t* src, int16_t* dst, intptr_t stride);

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

int main(int argc, char* argv[])
{
    unsigned int seed = (unsigned int)time(NULL);

    for (int i = 1; i < argc; i++)
    {
        if (!strncmp(argv[i], "--seed", 6) && i + 1 < argc)
            seed = (unsigned int)strtoul(argv[++i], NULL, 0);
        else if (!strncmp(argv[i], "--help", 6))
        {
            printf("usage: TestBenchLite [--seed N]\n"
                   "reuses x265 MBDstHarness data/checks for DCT16 only\n");
            return 0;
        }
    }

    return gate_dct16(seed);
}
