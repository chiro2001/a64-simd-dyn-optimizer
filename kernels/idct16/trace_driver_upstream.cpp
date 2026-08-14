// Single-invocation driver for tracing the x265 C IDCT16 reference.
#include <cstdint>
#include <cstring>

namespace x265 {
void idct16_c(const int16_t*, int16_t*, intptr_t);
}

int main()
{
    static int16_t src[16 * 16];
    static int16_t dst[16 * 32];
    for (int i = 0; i < 16 * 16; i++)
        src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    memset(dst, 0, sizeof(dst));
    x265::idct16_c(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 16 * 32; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
