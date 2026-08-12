// Differential verify for the SVE2 SA8D candidate vs a scalar canonical
// reference. Runs under qemu-aarch64 (VL=256 max) on the N1 host.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <random>
#include <vector>
#include <arm_sve.h>
#include <sys/prctl.h>

#include "sve_dispatch.h"

extern "C" int dynopt_sa8d_8x8_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

extern "C" int dynopt_sa8d_8x8x2_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

extern "C" int dynopt_sa8d_8x8x2raw_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

extern "C" int dynopt_sa8d_16x16_neon_sve2(
    const uint8_t* pix1, intptr_t stride_pix1,
    const uint8_t* pix2, intptr_t stride_pix2);

static int sa8d8_raw(const uint8_t* a, intptr_t sa,
                     const uint8_t* b, intptr_t sb)
{
    int d[8][8];
    for (int r = 0; r < 8; r++)
        for (int c = 0; c < 8; c++)
            d[r][c] = (int)a[(size_t)r * sa + c] - (int)b[(size_t)r * sb + c];
    int w[8][8];
    for (int k = 0; k < 8; k++)
        for (int j = 0; j < 8; j++)
            w[k][j] = (__builtin_popcount((unsigned)(k & j)) & 1) ? -1 : 1;
    int h[8][8];
    for (int k = 0; k < 8; k++)
        for (int c = 0; c < 8; c++)
        {
            int s = 0;
            for (int r = 0; r < 8; r++)
                s += w[k][r] * d[r][c];
            h[k][c] = s;
        }
    int r8 = 0;
    for (int ky = 0; ky < 8; ky++)
        for (int kx = 0; kx < 8; kx++)
        {
            int s = 0;
            for (int c = 0; c < 8; c++)
                s += h[ky][c] * w[kx][c];
            r8 += std::abs(s);
        }
    return r8;
}

static int scalar_sa8d_8x8(const uint8_t* a, intptr_t sa,
                           const uint8_t* b, intptr_t sb)
{
    return (sa8d8_raw(a, sa, b, sb) + 2) >> 2;
}

static std::vector<uint8_t> make_plane(int stride, int off,
                                       const uint8_t* vals)
{
    std::vector<uint8_t> p((size_t)stride * 8 + off, 0xAA);
    for (int r = 0; r < 8; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * 8, 8);
    return p;
}

static std::vector<uint8_t> make_plane16(int stride, int off,
                                         const uint8_t* vals)
{
    std::vector<uint8_t> p((size_t)stride * 8 + off + 16, 0xAA);
    for (int r = 0; r < 8; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * 16, 16);
    return p;
}

static std::vector<uint8_t> make_plane16x16(int stride, int off,
                                            const uint8_t* vals)
{
    std::vector<uint8_t> p((size_t)stride * 16 + off + 16, 0xAA);
    for (int r = 0; r < 16; r++)
        memcpy(p.data() + off + (size_t)r * stride, vals + r * 16, 16);
    return p;
}

int main(int argc, char** argv)
{
    int cases = 20000;
    int vl_override = 0;
    for (int i = 1; i < argc; i++)
    {
        if (strncmp(argv[i], "--vl-bytes=", 11) == 0)
            vl_override = atoi(argv[i] + 11);
        else
            cases = atoi(argv[i]);
    }
    if (vl_override)
        (void)prctl(PR_SVE_SET_VL, (unsigned long)vl_override);

    dynopt_sve::Sa8dCandidate cands[4] = {
        { "single", dynopt_sa8d_8x8_neon_sve2, 16, false, 0 },
        { "x2", dynopt_sa8d_8x8x2_neon_sve2, 32, false, 0 },
        { "x2raw", dynopt_sa8d_8x8x2raw_neon_sve2, 32, false, 0 },
        { "16x16", dynopt_sa8d_16x16_neon_sve2, 32, false, 0 },
    };
    (void)dynopt_sve::register_candidates(cands, 4);
    printf("vl-bytes=%lu\n", (unsigned long)svcntb());
    for (int i = 0; i < 4; i++)
        printf("registered_%s=%d\n", cands[i].name,
               cands[i].registered ? 1 : 0);
    std::mt19937 rng(0x5A8D2026u);
    int strides[5] = { 8, 16, 17, 64, 65 };
    int strides16[4] = { 16, 17, 64, 65 };
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
        std::vector<uint8_t> pa = make_plane(sa, oa, va);
        std::vector<uint8_t> pb = make_plane(sb, ob, vb);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int want = scalar_sa8d_8x8(a, sa, b, sb);
        int got = dynopt_sve::call(cands[0], a, sa, b, sb);
        if (want != got)
        {
            if (mism < 5)
                fprintf(stderr, "mismatch %d: scalar=%d sve=%d strides=%d/%d\n",
                        i, want, got, sa, sb);
            mism++;
        }
    }
    printf("cases=%d mismatches=%d\n", cases, mism);

    int mism2 = 0;
    const int x2runs = cands[1].registered ? cases : 0;
    for (int i = 0; i < x2runs; i++)
    {
        uint8_t va[128], vb[128];
        for (int j = 0; j < 128; j++)
        {
            va[j] = (uint8_t)(rng() & 0xFF);
            vb[j] = (uint8_t)(rng() & 0xFF);
        }
        int sa = strides16[rng() % 4];
        int sb = strides16[rng() % 4];
        int oa = offs[rng() % 4];
        int ob = offs[rng() % 4];
        std::vector<uint8_t> pa = make_plane16(sa, oa, va);
        std::vector<uint8_t> pb = make_plane16(sb, ob, vb);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int want = scalar_sa8d_8x8(a, sa, b, sb)
                 + scalar_sa8d_8x8(a + 8, sa, b + 8, sb);
        int got = dynopt_sve::call(cands[1], a, sa, b, sb);
        if (want != got)
        {
            if (mism2 < 5)
                fprintf(stderr, "x2 mismatch %d: scalar=%d sve=%d "
                        "strides=%d/%d\n", i, want, got, sa, sb);
            mism2++;
        }
    }
    printf("x2_cases=%d mismatches=%d\n", x2runs, mism2);

    int mism3 = 0;
    const int x2rawruns = cands[2].registered ? cases : 0;
    for (int i = 0; i < x2rawruns; i++)
    {
        uint8_t va[128], vb[128];
        for (int j = 0; j < 128; j++)
        {
            va[j] = (uint8_t)(rng() & 0xFF);
            vb[j] = (uint8_t)(rng() & 0xFF);
        }
        int sa = strides16[rng() % 4];
        int sb = strides16[rng() % 4];
        int oa = offs[rng() % 4];
        int ob = offs[rng() % 4];
        std::vector<uint8_t> pa = make_plane16(sa, oa, va);
        std::vector<uint8_t> pb = make_plane16(sb, ob, vb);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int ra = sa8d8_raw(a, sa, b, sb);
        int rb = sa8d8_raw(a + 8, sa, b + 8, sb);
        if ((ra & 1) || (rb & 1))
        {
            if (mism3 < 5)
                fprintf(stderr, "x2raw odd R8: ra=%d rb=%d (unexpected)\n",
                        ra, rb);
            mism3++;
            continue;
        }
        int want = (ra + rb) / 2;
        int got = dynopt_sve::call(cands[2], a, sa, b, sb);
        if (want != got)
        {
            if (mism3 < 5)
                fprintf(stderr, "x2raw mismatch %d: want=%d got=%d "
                        "strides=%d/%d\n", i, want, got, sa, sb);
            mism3++;
        }
    }
    printf("x2raw_cases=%d mismatches=%d\n", x2rawruns, mism3);

    int mism4 = 0;
    const int m16runs = cands[3].registered ? cases : 0;
    for (int i = 0; i < m16runs; i++)
    {
        uint8_t va[256], vb[256];
        for (int j = 0; j < 256; j++)
        {
            va[j] = (uint8_t)(rng() & 0xFF);
            vb[j] = (uint8_t)(rng() & 0xFF);
        }
        int sa = strides16[rng() % 4];
        int sb = strides16[rng() % 4];
        int oa = offs[rng() % 4];
        int ob = offs[rng() % 4];
        std::vector<uint8_t> pa = make_plane16x16(sa, oa, va);
        std::vector<uint8_t> pb = make_plane16x16(sb, ob, vb);
        const uint8_t* a = pa.data() + oa;
        const uint8_t* b = pb.data() + ob;
        int r00 = sa8d8_raw(a, sa, b, sb);
        int r01 = sa8d8_raw(a + 8, sa, b + 8, sb);
        int r10 = sa8d8_raw(a + 8 * sa, sa, b + 8 * sb, sb);
        int r11 = sa8d8_raw(a + 8 * sa + 8, sa, b + 8 * sb + 8, sb);
        int want = (r00 + r01 + r10 + r11 + 2) >> 2;
        int got = dynopt_sve::call(cands[3], a, sa, b, sb);
        if (want != got)
        {
            if (mism4 < 5)
                fprintf(stderr, "16x16 mismatch %d: want=%d got=%d "
                        "strides=%d/%d\n", i, want, got, sa, sb);
            mism4++;
        }
    }
    printf("16x16_cases=%d mismatches=%d\n", m16runs, mism4);

    for (int i = 0; i < 4; i++)
        printf("calls_%s=%zu\n", cands[i].name, cands[i].calls);

    const int failed = (mism || mism2 || mism3 || mism4) ? 1 : 0;
    const unsigned vl = (unsigned)svcntb();
    if (vl < 32)
    {
        int bad = 0;
        for (int i = 1; i < 4; i++)
            if (cands[i].registered || cands[i].calls)
                bad++;
        printf("rejection_audit=%s\n", (bad || failed) ? "fail" : "pass");
        return (bad || failed) ? 1 : 0;
    }
    printf("rejection_audit=n/a (vl>=256)\n");
    return failed;
}
