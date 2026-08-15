// Single-invocation driver for QEMU dynamic tracing of the chroma
// copy_pp candidate (8x8).
#include <cstdint>
#include <cstring>

extern "C" void dynopt_chroma_copy_pp_8x8_sve2(
    uint8_t*, intptr_t, const uint8_t*, intptr_t)
    __attribute__((noinline));

int main()
{
    static uint8_t src[8 * 64], dst[8 * 64];
    for (int i = 0; i < (int)sizeof(src); i++)
        src[i] = (uint8_t)((i * 37 + 11) % 256);
    memset(dst, 0, sizeof(dst));
    dynopt_chroma_copy_pp_8x8_sve2(dst, 64, src, 64);
    return dst[8 * 64 - 1] == 0x7f;
}
