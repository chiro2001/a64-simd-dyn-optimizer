// Single-invocation driver for QEMU tracing (interp8 vps 16x4).
#include <cstdint>
extern "C" void dynopt_interp8_vps_16x4_sve2(const uint8_t*, intptr_t, int16_t*, intptr_t, int) __attribute__((noinline));
int main() {
    static uint8_t a[(4 + 7) * 64 + 16 + 16]; static int16_t d[4 * 64 + 16];
    for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++) a[i] = (uint8_t)((i * 37 + 11) % 256);
    dynopt_interp8_vps_16x4_sve2(a + 3 * 64 + 16, 64, d, 64, 2); return d[0] == 0x7f;
}
