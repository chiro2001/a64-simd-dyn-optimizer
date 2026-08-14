// Single-invocation driver for tracing the tool-generated IDCT32 candidate.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_idct32_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main()
{
    static int16_t src[32 * 32];
    static int16_t dst[32 * 64];
    for (int i = 0; i < 32 * 32; i++)
        src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    memset(dst, 0, sizeof(dst));
    dynopt_idct32_sve2_shared(src, dst, 64);
    int sum = 0;
    for (int i = 0; i < 32 * 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
