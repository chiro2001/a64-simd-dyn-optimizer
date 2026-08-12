// Differential verify: generated roundtrip candidate vs x265 C/NEON.
#include "primitives.h"

#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>

extern "C" int dynopt_sa8d_8x8_neon_roundtrip(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

using namespace x265;

static std::vector<uint8_t> make_plane(int stride, int off,
                                       const uint8_t* vals, int n)
{
    std::vector<uint8_t> p((size_t)stride * 8 + off, 0xAA);
    for (int r = 0; r < 8; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * n, n);
    return p;
}

int main(int argc, char** argv)
{
    const int cases = argc > 1 ? atoi(argv[1]) : 100000;
    EncoderPrimitives cprim, opt;
    memset(&cprim, 0, sizeof(cprim));
    memset(&opt, 0, sizeof(opt));
    setupCPrimitives(cprim);
    setupAliasPrimitives(cprim);
    int cpu = cpu_detect(false);
    setupIntrinsicPrimitives(opt, cpu);
    setupAssemblyPrimitives(opt, cpu);
    setupAliasPrimitives(opt);
    pixelcmp_t c = cprim.cu[BLOCK_8x8].sa8d;
    pixelcmp_t neon = opt.cu[BLOCK_8x8].sa8d;

    std::mt19937 rng(0x5218D2026u);
    int strides[5] = { 8, 16, 17, 64, 65 };
    int offs[4] = { 0, 1, 3, 7 };
    int mism = 0;
    for (int i = 0; i < cases; i++)
    {
        uint8_t va[64], vb[64];
        for (int j = 0; j < 64; j++)
        {
            va[j] = (uint8_t)(rng() & 0xFF);
            vb[j] = (uint8_t)(rng() & 0xFF);
        }
        int sa = strides[rng() % 5];
        int sb = strides[rng() % 5];
        int oa = offs[rng() % 4];
        int ob = offs[rng() % 4];
        std::vector<uint8_t> pa = make_plane(sa, oa, va, 8);
        std::vector<uint8_t> pb = make_plane(sb, ob, vb, 8);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int rc = c(a, sa, b, sb);
        int rn = neon(a, sa, b, sb);
        int rg = dynopt_sa8d_8x8_neon_roundtrip(a, sa, b, sb);
        if (rc != rn || rc != rg)
        {
            if (mism < 5)
                fprintf(stderr, "mismatch %d: c=%d neon=%d gen=%d strides=%d/%d off=%d/%d\n",
                        i, rc, rn, rg, sa, sb, oa, ob);
            mism++;
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);
    return mism ? 1 : 0;
}
