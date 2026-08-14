// Single-invocation driver for tracing the tool-generated IDCT16 candidate.
// Optional argv[1] = RNG seed (docs/29 §1 flow-independence check).
#include <cstdint>
#include <cstdlib>
#include <cstring>

extern "C" void dynopt_idct16_sve2_shared(
    const int16_t*, int16_t*, intptr_t);

int main(int argc, char** argv)
{
    static int16_t src[16 * 16];
    static int16_t dst[16 * 32];
    if (argc > 1)
    {
        uint32_t seed = (uint32_t)strtoul(argv[1], 0, 0);
        for (int i = 0; i < 16 * 16; i++)
        {
            seed = seed * 1664525u + 1013904223u;
            src[i] = (int16_t)(seed % 65536) - 32768;
        }
    }
    else
    {
        for (int i = 0; i < 16 * 16; i++)
            src[i] = (int16_t)((i * 37 + 11) % 65536) - 32768;
    }
    memset(dst, 0, sizeof(dst));
    dynopt_idct16_sve2_shared(src, dst, 32);
    int sum = 0;
    for (int i = 0; i < 16 * 32; i++)
        sum += dst[i];
    return sum == 0x7fffffff;
}
