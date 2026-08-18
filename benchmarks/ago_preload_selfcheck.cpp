// Real-machine / qemu interception self-check host (docs/87 step 3).
//
// Usage: ago_preload_selfcheck <libx265-path-or-name> [iterations]
//
// The process is expected to run with LD_PRELOAD=<dynopt .so> (injected
// x265 builds call dynopt_patch_primitives() at the end of
// x265_setup_primitives).  The host:
//   1. dlopens libx265 and runs x265_setup_primitives (8-bit);
//   2. prints the patched dct16 slot address (patched != upstream when
//      interception worked);
//   3. runs `iterations` dct16 calls through the patched slot as a
//      smoke check;
//   4. exits 0 only when the patched slot is callable.
// Without interception the slot is upstream (still callable): the
// "patched N slots" stderr line from the dynopt .so is the signal, and
// AGO_BENCH=1 prints BENCH INVALID + no preset (see docs/90).

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <dlfcn.h>

#include "common/primitives.h"

using namespace X265_NS;

typedef void (*setup_t)(x265_param*);

int main(int argc, char** argv)
{
    const char* lib = (argc > 1) ? argv[1] : "libx265.so.216";
    int iters = (argc > 2) ? atoi(argv[2]) : 1000;
    const char* x265lib = getenv("X265_LIB");  // optional override
    if (x265lib)
        lib = x265lib;

    void* xh = dlopen(lib, RTLD_NOW | RTLD_LOCAL);
    if (!xh)
    {
        fprintf(stderr, "ago_preload_selfcheck: dlopen %s failed: %s\n",
                lib, dlerror());
        return 3;
    }
    setup_t setup = (setup_t)dlsym(
        xh, "_ZN4x26521x265_setup_primitivesEP10x265_param");
    if (!setup)
    {
        fprintf(stderr, "ago_preload_selfcheck: setup symbol missing\n");
        return 4;
    }
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = 0;
    setup(&p);

    EncoderPrimitives* P = (EncoderPrimitives*)dlsym(
        xh, "_ZN4x26510primitivesE");
    if (!P)
    {
        fprintf(stderr, "ago_preload_selfcheck: primitives missing\n");
        return 5;
    }
    void (*df)(const int16_t*, int16_t*, intptr_t) =
        P->cu[BLOCK_16x16].dct;
    if (!df)
    {
        fprintf(stderr, "ago_preload_selfcheck: dct16 slot empty\n");
        return 6;
    }
    static int16_t src[16 * 16 + 64], dst[16 * 16 + 64];
    std::memset(src, 0, sizeof(src));
    std::memset(dst, 0, sizeof(dst));
    for (int i = 0; i < iters; i++)
        df(src, dst, 64);
    fprintf(stderr, "ago_preload_selfcheck: dct16 fn=%p iters=%d ok\n",
            (void*)df, iters);
    return 0;
}
