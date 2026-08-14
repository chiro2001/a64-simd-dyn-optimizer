// Single-invocation driver for tracing the tool-generated IDCT16 candidate.
#include <cstdint>
#include <cstring>

extern "C" void dynopt_idct16_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main()
{
    static int16_t src[16 * 16];
    static int16_t dst[16 * 32];
    for (int i = 0; i < 16 * 16; i++)
        src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    memset(dst, 0, sizeof(dst));
    dynopt_idct16_sve2_shared(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 16 * 32; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
