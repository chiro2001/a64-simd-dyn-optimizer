// 20k differential for the AGO-template scanPosLast candidate vs the
// x265 primitive reference (NEON on aarch64, C elsewhere).
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <random>

#include "common/primitives.h"

using namespace X265_NS;

extern "C" int dynopt_scan_pos_last_sve2(
    const uint16_t*, const int16_t*, uint16_t*, uint16_t*,
    uint8_t*, int, const uint16_t*, int);

static void gen_tu(std::mt19937& rng, int16_t* coeff, uint16_t* scan,
                   uint16_t* scanCG, int trSize, int* numSig)
{
    const int n = trSize * trSize;
    for (int i = 0; i < n; i++)
        coeff[i] = (int16_t)((int)(rng() & 31) - 15);  // mostly small
    // 4x4 zigzag scan order (memory positions in scan order); the first
    // entry of each CG group is the CG's contiguous 4x4 block base, which
    // is what the NEON reference uses to locate the block.
    static const uint16_t Z4[16] =
        { 0, 1, 4, 8, 5, 2, 3, 6, 9, 12, 13, 10, 7, 11, 14, 15 };
    for (int i = 0; i < n; i++)
        scan[i] = Z4[i];
    for (int i = 0; i < 16; i++)
        scanCG[i] = Z4[i];  // within-CG scan order for the TBL reorder
    *numSig = 0;
    for (int i = 0; i < n; i++)
        *numSig += coeff[i] != 0;
    if (!*numSig)
        coeff[0] = 1, *numSig = 1;
}

int main()
{
    x265_param p;
    std::memset(&p, 0, sizeof(p));
    p.internalBitDepth = 8;
    p.cpuid = X265_NS::cpu_detect(false);
    x265_setup_primitives(&p);
    scanPosLast_t ref = primitives.scanPosLast;
    std::mt19937 rng(0x5A8Du);
    int bad = 0;
    for (int t = 0; t < 20000; t++)
    {
        static int16_t coeff[256];
        static uint16_t scan[256], scanCG[16];
        int numSig = 0;
        gen_tu(rng, coeff, scan, scanCG, 4, &numSig);
        static uint16_t s1[64], f1[64], s2[64], f2[64];
        static uint8_t n1[64], n2[64];
        const int r = ref(scan, coeff, s1, f1, n1, numSig, scanCG, 4);
        const int d = dynopt_scan_pos_last_sve2(
            scan, coeff, s2, f2, n2, numSig, scanCG, 4);
        const int cgs = (r >> 4) + 1;  // written CG entries (incl. last)
        if (r != d ||
            std::memcmp(s1, s2, (size_t)cgs * sizeof(s1[0])) ||
            std::memcmp(f1, f2, (size_t)cgs * sizeof(f1[0])) ||
            std::memcmp(n1, n2, (size_t)cgs * sizeof(n1[0])))
        {
            if (bad < 5)
                printf("mismatch t=%d ref=%d dyn=%d\n", t, r, d);
            bad++;
        }
    }
    printf("scan_pos_last verify bad=%d\n", bad);
    return bad != 0;
}
