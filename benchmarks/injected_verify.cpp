// Compile-in verification: link against a libx265.a that has
// dynopt_patch.o appended, call x265_setup_primitives(), and confirm the
// dispatch table was patched from inside x265 and the candidates run.
#include <cstdint>
#include <cstdio>
#include <cstring>

#include "common/primitives.h"

using namespace X265_NS;

typedef int (*sa8d_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
typedef void (*hpp_t)(const uint8_t*, intptr_t, uint8_t*, intptr_t, int);

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    void* before_sa = (void*)primitives.cu[BLOCK_8x8].sa8d;
    void* before_hpp = (void*)primitives.pu[LUMA_8x8].luma_hpp;
    x265_setup_primitives(&p);
    sa8d_t cand_sa8d = primitives.cu[BLOCK_8x8].sa8d;
    hpp_t cand_hpp = primitives.pu[LUMA_8x8].luma_hpp;

    static uint8_t a[8 * 8 + 64], b[8 * 8 + 64], out[8 * 8 + 64];
    volatile int sink = 0;
    for (int it = 0; it < 200; it++)
    {
        for (int i = 0; i < (int)sizeof(a); i++)
            a[i] = (uint8_t)((i * 73 + it * 131) & 255);
        for (int i = 0; i < (int)sizeof(b); i++)
            b[i] = (uint8_t)((i * 37 + it * 97 + 11) & 255);
        sink += cand_sa8d(a, 16, b, 16);
        for (int ph = 1; ph <= 3; ph++)
        {
            cand_hpp(a, 16, out, 16, ph);
        }
    }
    printf("injected verify: sa8d %p->%p interp8 %p->%p sink=%d\n",
           before_sa, (void*)cand_sa8d,
           before_hpp, (void*)cand_hpp, sink);
    return 0;
}
