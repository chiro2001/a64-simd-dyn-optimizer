// Single-invocation driver for QEMU tracing (sao E0 64).
#include <cstdint>

extern "C" void dynopt_sao_e0_64_sve2(
    uint8_t*, int8_t*, int8_t*, intptr_t) __attribute__((noinline));

int main()
{
    static uint8_t rec[4 * 64];
    static int8_t off[5] = { -1, 0, 1, 0, -1 };
    static int8_t sl[2] = { 0, 0 };
    for (int i = 0; i < 4 * 64; i++)
        rec[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_sao_e0_64_sve2(rec, off, sl, 64);
    return rec[255] == 0x7f;
}
