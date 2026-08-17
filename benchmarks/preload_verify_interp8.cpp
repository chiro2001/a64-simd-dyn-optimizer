// Real-machine LD_PRELOAD verification for interp8 hpp slots:
// 1) confirms the patched pu[LUMA_*].luma_hpp slots changed;
// 2) differential-checks patched vs upstream on random inputs;
// 3) measures kernel-level cycles (cntvct) before/after the patch.
//
// Usage: preload_verify_interp8 <path-to-dynopt-lib.so>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>

#include "common/primitives.h"

using namespace X265_NS;

typedef void (*setup_t)(x265_param*);
typedef int (*patch_t)(void);
typedef void (*hpp_t)(const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

static inline uint64_t rdtsc(void)
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

template<int N>
static long bench(hpp_t f, int iters)
{
    // Extra padding: 3 pixels left + 3 pixels right for 8-tap filter
    const int pad = 3;
    const int stride = N + 2 * pad;
    const int buf_sz = (N + 2 * pad) * (N + 2 * pad) + 64;
    static uint8_t src[buf_sz > 0 ? buf_sz : 1];
    static uint8_t dst[N * N];
    for (int i = 0; i < buf_sz; i++)
        src[i] = (uint8_t)((i * 37 + 11) & 255);
    for (int i = 0; i < N * N; i++)
        dst[i] = 0;
    const uint8_t* s = src + pad * stride + pad;
    uint64_t t0 = rdtsc();
    for (int it = 0; it < iters; it++)
    {
        for (int ph = 1; ph <= 3; ph++)
            f(s, stride, dst, N, ph);
    }
    uint64_t t1 = rdtsc();
    return (long)((t1 - t0) / (iters * 3));
}

template<int N>
static int diff_check(hpp_t orig, hpp_t cand)
{
    const int pad = 3;
    const int stride = N + 2 * pad;
    const int buf_sz = (N + 2 * pad) * (N + 2 * pad) + 64;
    static uint8_t src[buf_sz > 0 ? buf_sz : 1];
    static uint8_t want[N * N], got[N * N];
    int bad = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < buf_sz; i++)
            src[i] = (uint8_t)((i * 37 + it * 131 + 5) & 255);
        const uint8_t* s = src + pad * stride + pad;
        for (int ph = 1; ph <= 3; ph++)
        {
            std::memset(want, 0xAA, sizeof(want));
            std::memset(got, 0xAA, sizeof(got));
            orig(s, stride, want, N, ph);
            cand(s, stride, got, N, ph);
            for (int i = 0; i < N * N; i++)
                if (want[i] != got[i])
                    bad++;
        }
    }
    return bad;
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
    hpp_t o8  = real->pu[LUMA_8x8].luma_hpp;
    hpp_t o16 = real->pu[LUMA_16x16].luma_hpp;
    hpp_t o32 = real->pu[LUMA_32x32].luma_hpp;
    long t8_orig  = bench<8>(o8, 10000);
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
    hpp_t c8  = real->pu[LUMA_8x8].luma_hpp;
    hpp_t c16 = real->pu[LUMA_16x16].luma_hpp;
    hpp_t c32 = real->pu[LUMA_32x32].luma_hpp;
    printf("interp8 8x8 slot changed: %d\n", o8 != c8);
    printf("interp8 16x16 slot changed: %d\n", o16 != c16);
    printf("interp8 32x32 slot changed: %d\n", o32 != c32);

    int bad8  = diff_check<8>(o8, c8);
    int bad16 = diff_check<16>(o16, c16);
    int bad32 = diff_check<32>(o32, c32);
    long t8_cand  = bench<8>(c8, 10000);
    long t16_cand = bench<16>(c16, 5000);
    long t32_cand = bench<32>(c32, 2000);
    printf("interp8 8x8  mismatches=%d  orig=%ld  cand=%ld  delta=%.2f%%\n",
           bad8, t8_orig, t8_cand,
           100.0 * (t8_cand - t8_orig) / t8_orig);
    printf("interp8 16x16 mismatches=%d  orig=%ld  cand=%ld  delta=%.2f%%\n",
           bad16, t16_orig, t16_cand,
           100.0 * (t16_cand - t16_orig) / t16_orig);
    printf("interp8 32x32 mismatches=%d  orig=%ld  cand=%ld  delta=%.2f%%\n",
           bad32, t32_orig, t32_cand,
           100.0 * (t32_cand - t32_orig) / t32_orig);
    return (bad8 + bad16 + bad32) != 0;
}
