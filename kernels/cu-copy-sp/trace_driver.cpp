// Single-invocation driver for QEMU dynamic tracing of the cu.copy_sp
// candidate (16x16).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_cu_copy_sp_16x16_sve2(
    uint8_t*, intptr_t, const int16_t*, intptr_t)
    __attribute__((noinline));

int main()
{
    static int16_t a[16 * 64];
    static uint8_t d[16 * 64];
    for (int i = 0; i < 16 * 64; i++)
        a[i] = (int16_t)((i * 37 + 11) % 200 - 100);
    memset(d, 0, sizeof(d));
    dynopt_cu_copy_sp_16x16_sve2(d, 64, a, 64);
    return d[16 * 64 - 1] == 0x7f;
}
