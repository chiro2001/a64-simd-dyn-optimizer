// Single-invocation driver for QEMU dynamic instruction tracing. Calls the
// kernel exactly once on fixed in-range data so `-one-insn-per-tb -d
// in_asm -dfilter <fn range>` yields the executed instruction stream in
// order, independent of compiler loop-unrolling decisions.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_dct16_neon_candidate(
    const int16_t*, int16_t*, intptr_t) __attribute__((noinline));

int main()
{
    static int16_t src[16 * 32];
    static int16_t dst[256];
    for (int i = 0; i < 16 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    dynopt_dct16_neon_candidate(src, dst, 32);
    // consume the output so nothing is optimized away
    int sum = 0;
    for (int i = 0; i < 256; i++)
        sum += dst[i];
    return sum == 0x7fffffff;   // never true; keeps the call live
}
