// ACLE-free trace driver for the asm-kernel path: the kernel object is pure
// GNU asm, so this main must not pull any SIMD intrinsics.
#include <stdint.h>
#include <string.h>

extern void dynopt_dct16_sve2_shared(const int16_t*, int16_t*, intptr_t);

int main(void)
{
    static int16_t src[16 * 32];
    static int16_t dst[256];
    int sum = 0;
    for (int i = 0; i < 16 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    memset(dst, 0, sizeof(dst));
    dynopt_dct16_sve2_shared(src, dst, 32);
    for (int i = 0; i < 256; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
