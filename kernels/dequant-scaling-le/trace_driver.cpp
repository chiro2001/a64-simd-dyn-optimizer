// Single-invocation driver for QEMU tracing (dequant_scaling le).
#include <cstdint>

extern "C" void dynopt_dequant_scaling_256_sve2(
    const int16_t*, const int32_t*, int16_t*, int, int)
    __attribute__((noinline));

int main()
{
    static int16_t q[256], c[256];
    static int32_t dq[256];
    for (int i = 0; i < 256; i++)
    {
        q[i] = (int16_t)((i * 37 + 11) % 32768);
        dq[i] = (int32_t)((i * 53 + 7) % 65536) - 32768;
    }
    dynopt_dequant_scaling_256_sve2(q, dq, c, 2, 16);  // le: 6 <= 16
    // q[255]*dq[255] saturates negative, then saturating << stays -32768.
    return c[255] != -32768;
}
