// Single-invocation driver for QEMU tracing (nquant 256).
#include <cstdint>

extern "C" uint32_t dynopt_nquant_256_sve2(
    const int16_t*, const int32_t*, int16_t*, int, int)
    __attribute__((noinline));

int main()
{
    static int16_t coef[256], qo[256];
    static int32_t qc[256];
    for (int i = 0; i < 256; i++)
    {
        coef[i] = (int16_t)((i * 37 + 11) % 32768);
        qc[i] = 1 + (int32_t)((i * 53 + 7) % 16384);
    }
    uint32_t n = dynopt_nquant_256_sve2(coef, qc, qo, 16, 8);
    return n == 0x7fffffff;
}
