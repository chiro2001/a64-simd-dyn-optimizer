// Real-machine LD_PRELOAD verification for DCT16/DCT32 slots:
// 1) confirms the patched cu[16x16].dct / cu[32x32].dct slots changed;
// 2) differential-checks patched vs upstream on random inputs;
// 3) measures kernel-level cycles (cntvct) before/after the patch.
//
// Usage: preload_verify_dct <path-to-dynopt-lib.so>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>

#include "common/primitives.h"

using namespace X265_NS;

typedef void (*setup_t)(x265_param*);
typedef int (*patch_t)(void);
typedef void (*dct_t)(const int16_t*, int16_t*, intptr_t);

static inline uint64_t rdtsc(void)
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

template<int N>
static long bench(dct_t f, int iters)
{
    static int16_t src[N * N + 64], dst[N * N];
    for (int i = 0; i < N * N; i++)
        src[i] = (int16_t)((i * 73 + 11) & 1023) - 512;
    for (int i = 0; i < N * N; i++)
        dst[i] = 0;
    uint64_t t0 = rdtsc();
    for (int it = 0; it < iters; it++)
        f(src, dst, N);
    uint64_t t1 = rdtsc();
    return (long)((t1 - t0) / iters);
}

int main(int argc, char** argv)
{
    if (argc < 2)
    {
        fprintf(stderr, "usage: %s <dynopt-lib.so>\n", argv[0]);
        return 2;
    }
    void* xh = dlopen("libx265.so.216", RTLD_NOW | RTLD_LOCAL);
    if (!xh)
    {
        fprintf(stderr, "dlopen libx265 failed: %s\n", dlerror());
        return 3;
    }
    setup_t setup = (setup_t)dlsym(
        xh, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    setup(&p);

    EncoderPrimitives* real = (EncoderPrimitives*)dlsym(
        xh, "_ZN4x26510primitivesE");
    if (!real)
    {
        fprintf(stderr, "cannot resolve x265::primitives\n");
        return 4;
    }
    dct_t o16 = real->cu[BLOCK_16x16].dct;
    dct_t o32 = real->cu[BLOCK_32x32].dct;
    long t16_orig = bench<16>(o16, 5000);
    long t32_orig = bench<32>(o32, 2000);

    void* dh = dlopen(argv[1], RTLD_NOW | RTLD_LOCAL);
    if (!dh)
    {
        fprintf(stderr, "dlopen dynopt failed: %s\n", dlerror());
        return 5;
    }
    patch_t patch = (patch_t)dlsym(dh, "dynopt_patch_primitives");
    if (!patch)
    {
        fprintf(stderr, "dynopt_patch_primitives not found\n");
        return 6;
    }
    if (patch() != 0)
    {
        fprintf(stderr, "dynopt patch returned error\n");
        return 7;
    }
    dct_t c16 = real->cu[BLOCK_16x16].dct;
    dct_t c32 = real->cu[BLOCK_32x32].dct;
    printf("dct16 slot changed: %d\n", o16 != c16);
    printf("dct32 slot changed: %d\n", o32 != c32);

    int bad = 0;
    int16_t src[64 * 64], want[64 * 64], got[64 * 64];
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < 64 * 64; i++)
            src[i] = (int16_t)((i * 37 + it * 131 + 5) & 1023) - 512;
        std::memset(want, 0, sizeof(want));
        std::memset(got, 0, sizeof(got));
        o16(src, want, 16);
        c16(src, got, 16);
        for (int i = 0; i < 16 * 16; i++)
            if (want[i] != got[i])
                bad++;
        std::memset(want, 0, sizeof(want));
        std::memset(got, 0, sizeof(got));
        o32(src, want, 32);
        c32(src, got, 32);
        for (int i = 0; i < 32 * 32; i++)
            if (want[i] != got[i])
                bad++;
    }
    long t16_cand = bench<16>(c16, 5000);
    long t32_cand = bench<32>(c32, 2000);
    printf("dct16 mismatches=%d  orig=%ld  cand=%ld  delta=%.2f%%\n",
           bad, t16_orig, t16_cand,
           100.0 * (t16_cand - t16_orig) / t16_orig);
    printf("dct32 mismatches=%d  orig=%ld  cand=%ld  delta=%.2f%%\n",
           bad, t32_orig, t32_cand,
           100.0 * (t32_cand - t32_orig) / t32_orig);
    return bad != 0;
}
