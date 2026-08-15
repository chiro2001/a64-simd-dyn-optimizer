// Single-invocation driver for QEMU dynamic tracing of the SVE2 sign
// candidate (fixed endX=64 slice).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_sign_sve2(
    int8_t*, const uint8_t*, const uint8_t*, int)
    __attribute__((noinline));

int main()
{
    static uint8_t s1[64], s2[64];
    static int8_t dst[64];
    for (int i = 0; i < 64; i++)
    {
        s1[i] = (uint8_t)((i * 37 + 11) % 256);
        s2[i] = (uint8_t)((i * 53 + 7) % 256);
    }
    memset(dst, 0, sizeof(dst));
    dynopt_sign_sve2(dst, s1, s2, 64);
    int sum = 0;
    for (int i = 0; i < 64; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
