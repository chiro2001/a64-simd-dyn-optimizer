// Self-contained reproduction of x265's internal DCT correctness test for the
// pinned open-source NEON kernels (third_party/x265 @ b81f650), linked
// against the untouched upstream objects (dct4/8/16/32_c vs dct*_neon).
//
// This mirrors source/test/mbdstharness.cpp:
//   MBDstHarness::MBDstHarness  -> 3 input cases:
//       case 0: (rand() & PIXEL_MAX) - (rand() & PIXEL_MAX)
//       case 1: -PIXEL_MAX
//       case 2: +PIXEL_MAX
//   check_dct_primitive          -> ITERS iterations, stride = width,
//       index = rand() % 3, ref(case, out_ref, width), opt(case, out_opt,
//       width), memcmp(width*width*sizeof(int16_t))
//
// Fidelity note: upstream TestBench constructs several harness objects with
// the default (unseeded) rand stream before srand(seed); those objects only
// shift the stream, not the distributions used here. The input distribution
// and the uniform-3 index selection are reproduced exactly; the exact index
// sequence for one historical run is not (it depended on wall-clock seed and
// on the global construction order).
//
// Usage:
//   upstream_contract                      # contract run, seed=time(NULL)
//   upstream_contract --iters N --seed S   # stress, N iterations, fixed seed
//   upstream_contract --sweep K --seed S   # K independent 128-iter runs
//   upstream_contract --uniform --iters N  # full-range uniform [-255,255]
//                                          # diagnostic (stricter than x265)
#include <cstdint>
#include <ctime>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <vector>

namespace x265
{
using dct_t = void (*)(const int16_t*, int16_t*, intptr_t);
void dct4_c(const int16_t*, int16_t*, intptr_t);
void dct8_c(const int16_t*, int16_t*, intptr_t);
void dct16_c(const int16_t*, int16_t*, intptr_t);
void dct32_c(const int16_t*, int16_t*, intptr_t);
void dct4_neon(const int16_t*, int16_t*, intptr_t);
void dct8_neon(const int16_t*, int16_t*, intptr_t);
void dct16_neon(const int16_t*, int16_t*, intptr_t);
void dct32_neon(const int16_t*, int16_t*, intptr_t);
}

namespace
{
constexpr int kPixelMax = 255;          // X265_DEPTH == 8
constexpr int kIncr = 16;               // MBDstHarness::INCR
constexpr int kContractIters = 128;     // MBDstHarness::ITERS

struct Entry
{
    const char* name;
    int width;
    x265::dct_t ref;
    x265::dct_t opt;
};

const Entry kEntries[] =
{
    { "dct4x4",   4,  x265::dct4_c,  x265::dct4_neon },
    { "dct8x8",   8,  x265::dct8_c,  x265::dct8_neon },
    { "dct16x16", 16, x265::dct16_c, x265::dct16_neon },
    { "dct32x32", 32, x265::dct32_c, x265::dct32_neon },
};

// rand() is deliberately used to mirror upstream (glibc LCG on both the x86
// host build and the aarch64 runtime under qemu).
void fill_contract_case(int16_t* dst, size_t n, int case_idx)
{
    for (size_t i = 0; i < n; i++)
    {
        if (case_idx == 0)
            dst[i] = (int16_t)((rand() & kPixelMax) - (rand() & kPixelMax));
        else if (case_idx == 1)
            dst[i] = (int16_t)-kPixelMax;
        else
            dst[i] = (int16_t)kPixelMax;
    }
}

uint64_t run_contract(int iters, unsigned seed, int& sizes_failed)
{
    srand(seed);
    const size_t buf_size = 32u * 32u + (size_t)iters * kIncr;
    std::vector<std::vector<int16_t>> cases(3);
    for (int c = 0; c < 3; c++)
    {
        cases[c].resize(buf_size);
        fill_contract_case(cases[c].data(), buf_size, c);
    }

    uint64_t total_mismatches = 0;
    sizes_failed = 0;
    printf("contract seed=%u iters=%d\n", seed, iters);

    for (const Entry& e : kEntries)
    {
        const size_t out_elems = (size_t)e.width * e.width;
        std::vector<int16_t> out_ref(out_elems), out_opt(out_elems);
        size_t j = 0;
        uint64_t mismatches = 0;
        for (int i = 0; i < iters; i++)
        {
            const int index = rand() % 3;
            const int16_t* src = cases[index].data() + j;
            e.ref(src, out_ref.data(), e.width);
            e.opt(src, out_opt.data(), e.width);
            if (memcmp(out_ref.data(), out_opt.data(),
                       out_elems * sizeof(int16_t)) != 0)
                mismatches++;
            j += kIncr;
        }
        total_mismatches += mismatches;
        if (mismatches)
            sizes_failed++;
        printf("  %-8s mismatches=%llu/%d %s\n", e.name,
               (unsigned long long)mismatches, iters,
               mismatches ? "FAIL" : "PASS");
    }
    return total_mismatches;
}

uint64_t run_uniform(int iters, unsigned seed, int& sizes_failed)
{
    // Uniform full-range residual probe, [-255,255]: the stricter diagnostic
    // used by kernels/dct8/dct8_verify.cpp. Stride is randomized among the
    // four values used there; upstream's own harness never does this.
    uint32_t state = seed ? seed : 0xD8C82026u;
    auto next = [&state]() {
        state ^= state << 13;
        state ^= state >> 17;
        state ^= state << 5;
        return state;
    };
    const int strides[4] = { 8, 16, 17, 32 };
    uint64_t total_mismatches = 0;
    sizes_failed = 0;
    printf("uniform seed=%u iters=%d\n", seed, iters);

    for (const Entry& e : kEntries)
    {
        const size_t out_elems = (size_t)e.width * e.width;
        std::vector<int16_t> buf((size_t)e.width * 32 + 8);
        std::vector<int16_t> out_ref(out_elems), out_opt(out_elems);
        uint64_t mismatches = 0;
        for (int i = 0; i < iters; i++)
        {
            const int stride = strides[next() % 4];
            for (size_t k = 0; k < buf.size(); k++)
                buf[k] = (int16_t)((int)(next() & 0x1FFu) - 255);
            e.ref(buf.data(), out_ref.data(), stride);
            e.opt(buf.data(), out_opt.data(), stride);
            if (memcmp(out_ref.data(), out_opt.data(),
                       out_elems * sizeof(int16_t)) != 0)
                mismatches++;
        }
        total_mismatches += mismatches;
        if (mismatches)
            sizes_failed++;
        printf("  %-8s mismatches=%llu/%d %s\n", e.name,
               (unsigned long long)mismatches, iters,
               mismatches ? "FAIL" : "PASS");
    }
    return total_mismatches;
}

struct Args
{
    int iters = kContractIters;
    unsigned seed = 0;   // 0 = time(NULL), mirroring upstream TestBench
    unsigned sweep = 1;
    bool uniform = false;
};

bool parse_args(int argc, char** argv, Args& a)
{
    for (int i = 1; i < argc; i++)
    {
        if (!strcmp(argv[i], "--iters") && i + 1 < argc)
            a.iters = atoi(argv[++i]);
        else if (!strcmp(argv[i], "--seed") && i + 1 < argc)
            a.seed = (unsigned)strtoul(argv[++i], nullptr, 0);
        else if (!strcmp(argv[i], "--sweep") && i + 1 < argc)
            a.sweep = (unsigned)strtoul(argv[++i], nullptr, 0);
        else if (!strcmp(argv[i], "--uniform"))
            a.uniform = true;
        else
        {
            fprintf(stderr, "unknown arg: %s\n", argv[i]);
            return false;
        }
    }
    if (a.iters < 1 || a.sweep < 1)
        return false;
    return true;
}
} // namespace

int main(int argc, char** argv)
{
    Args a;
    if (!parse_args(argc, argv, a))
    {
        fprintf(stderr,
                "usage: %s [--iters N] [--seed S] [--sweep K] [--uniform]\n",
                argv[0]);
        return 2;
    }
    if (a.seed == 0)
        a.seed = (unsigned)time(nullptr);

    int worst_sizes_failed = 0;
    unsigned failing_runs = 0;
    uint64_t total = 0;
    for (unsigned k = 0; k < a.sweep; k++)
    {
        const unsigned seed = a.seed + k;
        int sizes_failed = 0;
        total += a.uniform ? run_uniform(a.iters, seed, sizes_failed)
                           : run_contract(a.iters, seed, sizes_failed);
        if (sizes_failed > worst_sizes_failed)
            worst_sizes_failed = sizes_failed;
        failing_runs += sizes_failed ? 1u : 0u;
        if (a.sweep > 1)
            printf("run %u: sizes_failed=%d\n", k, sizes_failed);
    }

    printf("summary: mode=%s sweep=%u runs_failing=%u/%u "
           "max_sizes_failed=%d total_mismatches=%llu\n",
           a.uniform ? "uniform" : "contract", a.sweep, failing_runs,
           a.sweep, worst_sizes_failed, (unsigned long long)total);

    // A contract run fails only if the upstream NEON kernel disagrees with
    // its own C reference under x265's exact test semantics (any size).
    return failing_runs ? 1 : 0;
}
