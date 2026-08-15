// Real-machine LD_PRELOAD verification: patches x265::primitives with the
// project library, then compares the patched sa8d/interp8 slots against the
// upstream implementation on random inputs.
//
// Usage: preload_verify <path-to-dynopt-lib.so>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>

#include "common/primitives.h"

using namespace X265_NS;

typedef void (*setup_t)(x265_param*);
typedef int (*patch_t)(void);
typedef int (*sa8d_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
typedef void (*hpp_t)(const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

static inline uint64_t rdtsc(void)
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
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
    sa8d_t orig_sa8d = real->cu[BLOCK_8x8].sa8d;
    hpp_t orig_hpp = real->pu[LUMA_8x8].luma_hpp;

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
    sa8d_t cand_sa8d = real->cu[BLOCK_8x8].sa8d;
    hpp_t cand_hpp = real->pu[LUMA_8x8].luma_hpp;

    static uint8_t a[8 * 8 + 64], b[8 * 8 + 64], out[8 * 8 + 64];
    int bad = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < (int)sizeof(a); i++)
            a[i] = (uint8_t)((i * 73 + it * 131) & 255);
        for (int i = 0; i < (int)sizeof(b); i++)
            b[i] = (uint8_t)((i * 37 + it * 97 + 11) & 255);
        int o = orig_sa8d(a, 16, b, 16);
        int c = cand_sa8d(a, 16, b, 16);
        if (o != c)
        {
            if (bad < 3)
                printf("sa8d mismatch it=%d orig=%d cand=%d\n", it, o, c);
            bad++;
        }
        for (int ph = 1; ph <= 3; ph++)
        {
            orig_hpp(a, 16, out, 16, ph);
            std::memcpy(b, out, 64);
            cand_hpp(a, 16, out, 16, ph);
            if (std::memcmp(b, out, 64) != 0)
            {
                if (bad < 3)
                    printf("interp8 mismatch ph=%d it=%d\n", ph, it);
                bad++;
            }
        }
    }
    volatile int sink = 0;
    const int N = 2000;
    uint64_t t0 = rdtsc();
    for (int i = 0; i < N; i++)
        sink += orig_sa8d(a, 16, b, 16);
    uint64_t t1 = rdtsc();
    for (int i = 0; i < N; i++)
        sink += cand_sa8d(a, 16, b, 16);
    uint64_t t2 = rdtsc();
    uint64_t sa8d_orig = t1 - t0, sa8d_cand = t2 - t1;

    t0 = rdtsc();
    for (int i = 0; i < N; i++)
        orig_hpp(a, 16, out, 16, 2);
    t1 = rdtsc();
    for (int i = 0; i < N; i++)
        cand_hpp(a, 16, out, 16, 2);
    t2 = rdtsc();
    uint64_t hpp_orig = t1 - t0, hpp_cand = t2 - t1;

    printf("preload real-machine compare: bad=%d "
           "(sa8d %p->%p, interp8 %p->%p)\n",
           bad, (void*)orig_sa8d, (void*)cand_sa8d,
           (void*)orig_hpp, (void*)cand_hpp);
    printf("cntvct sa8d: orig=%llu cand=%llu ratio=%.3f\n",
           (unsigned long long)sa8d_orig, (unsigned long long)sa8d_cand,
           (double)sa8d_orig / (double)sa8d_cand);
    printf("cntvct interp8: orig=%llu cand=%llu ratio=%.3f sink=%d\n",
           (unsigned long long)hpp_orig, (unsigned long long)hpp_cand,
           (double)hpp_orig / (double)hpp_cand, sink);
    return (bad != 0) ? 1 : 0;
}
