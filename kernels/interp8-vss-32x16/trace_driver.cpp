// Single-invocation driver for QEMU tracing (interp8 vss 32x16).
#include <cstdint>
extern "C" void dynopt_interp8_vss_32x16_sve2(const int16_t*, intptr_t, int16_t*, intptr_t, int) __attribute__((noinline));
int main() {
    static int16_t a[(16 + 7) * 64 + 32 + 16]; static int16_t d[16 * 64 + 32];
    for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++) a[i] = (int16_t)((i * 37 + 11) % 16384 - 8192);
    dynopt_interp8_vss_32x16_sve2(a + 3 * 64 + 16, 64, d, 64, 2); return d[0] == 0x7f;
}
