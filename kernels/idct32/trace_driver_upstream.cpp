// Single-invocation driver for tracing the x265 C IDCT32 reference.
#include <cstdint>
#include <cstring>

namespace x265 {
void idct32_c(const int16_t*, int16_t*, intptr_t);
}

int main()
{
    static int16_t src[32 * 32];
    static int16_t dst[32 * 64];
    for (int i = 0; i < 32 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    memset(dst, 0, sizeof(dst));
    x265::idct32_c(src, dst, 64);
    int sum = 0;
    for (int i = 0; i < 32 * 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
