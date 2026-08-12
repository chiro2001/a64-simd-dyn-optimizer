// Differential probe for the generated interp8_horiz_pp_dotprod<8,8>
// roundtrip candidate against a scalar oracle matching
// interp_horiz_pp_c<8,8,8> (common/ipfilter.cpp): all 4 phases, random
// uint8 input, several strides.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>

extern "C" void dynopt_interp8_hpp_dotprod(
    const uint8_t*, intptr_t, uint8_t*, intptr_t, int) __attribute__((weak));

static const int16_t g_luma_filter[4][8] =
{
    {  0, 0,   0, 64,  0,   0, 0,  0 },
    { -1, 4, -10, 58, 17,  -5, 1,  0 },
    { -1, 4, -11, 40, 40, -11, 4, -1 },
    {  0, 1,  -5, 17, 58, -10, 4, -1 },
};

static uint8_t clip3(int v)
{
    return (uint8_t)(v < 0 ? 0 : (v > 255 ? 255 : v));
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    std::mt19937 rng(0x1E8D0Du);
    const int strides[3] = { 8, 16, 32 };

    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        const int stride = strides[rng() % 3];
        const int dstStride = strides[rng() % 3];
        const int phase = (int)(rng() % 4);
        uint8_t buf[8 * 32 + 8];
        for (int j = 0; j < (int)sizeof(buf); j++)
            buf[j] = (uint8_t)(rng() & 0xFF);
        // the kernel reads src-3..src+4; place the tile 4 bytes in
        const uint8_t* src = buf + 4;

        uint8_t want[8 * 32], got[8 * 32];
        for (int r = 0; r < 8; r++)
        {
            for (int c = 0; c < 8; c++)
            {
                int sum = 0;
                for (int k = 0; k < 8; k++)
                    sum += g_luma_filter[phase][k]
                           * src[(size_t)r * stride + c + k - 3];
                want[(size_t)r * dstStride + c] =
                    clip3((sum + 32) >> 6);
            }
        }
        memset(got, 0xAA, sizeof(got));
        dynopt_interp8_hpp_dotprod(src, stride, got, dstStride, phase);
        for (int r = 0; r < 8; r++)
        {
            if (memcmp(want + (size_t)r * dstStride,
                       got + (size_t)r * dstStride, 8) != 0)
            {
                mism++;
                if (mism == 1)
                {
                    fprintf(stderr, "mismatch phase=%d stride=%d dstStride=%d",
                            phase, stride, dstStride);
                    for (int c = 0; c < 8; c++)
                        fprintf(stderr, " want[%d]=%d got[%d]=%d", c,
                                want[(size_t)r * dstStride + c], c,
                                got[(size_t)r * dstStride + c]);
                    fprintf(stderr, "\n");
                }
                break;
            }
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism != 0;
}
