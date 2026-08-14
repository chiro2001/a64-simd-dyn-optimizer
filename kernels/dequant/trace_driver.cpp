// Single-invocation driver for QEMU dynamic tracing of the SVE2
// dequant_normal 256 candidate.
#include <cstdint>

extern "C" void dynopt_dequant_normal_256_sve2(
    const int16_t*, int16_t*, int, int) __attribute__((noinline));

int main()
{
    static int16_t q[256], c[256];
    for (int i = 0; i < 256; i++)
        q[i] = (int16_t)((i * 37 + 11) % 32768);
    dynopt_dequant_normal_256_sve2(q, c, 64, 4);
    // q[255] saturates to 0x7fff with scale=64/shift=4; return 0 on the
    // expected result so QEMU tracing sees a clean exit.
    return c[255] != 0x7fff;
}
