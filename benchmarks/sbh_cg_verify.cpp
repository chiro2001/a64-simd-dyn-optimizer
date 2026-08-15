// Random differential for the signBitHidingHDQ per-CG selection logic.
// Compares the exact x265 inner loop against the proposed NEON-friendly
// array version. Pure C++ (no x265 dependency) so mismatches are cheap to
// isolate before rebuilding the encoder.
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <algorithm>

static const int32_t MAX_INT = 0x7FFFFFFF;

static void orig_cg(const int16_t* coeff, const int32_t* deltaU,
                    const int16_t* resi, const uint16_t* scan, int cgStart,
                    uint32_t cgFlags, uint32_t signbit,
                    int firstNZ, int lastNZ, int isLastCG,
                    int* minPosOut, int32_t* finalChangeOut)
{
    int minCostInc = MAX_INT, minPos = -1, curCost = MAX_INT;
    int32_t finalChange = 0, curChange = 0;
    const int start = isLastCG ? lastNZ : 15;
    for (int n = start; n >= 0; --n)
    {
        const int blkPos = scan[cgStart + n];
        if (cgFlags & 1)
        {
            if (deltaU[blkPos] > 0)
            {
                curCost = -deltaU[blkPos];
                curChange = 1;
            }
            else
            {
                if ((cgFlags == 1) && (abs(coeff[blkPos]) == 1))
                    curCost = MAX_INT;
                else
                {
                    curCost = deltaU[blkPos];
                    curChange = -1;
                }
            }
        }
        else
        {
            if (cgFlags == 0)
            {
                const uint32_t thisSignBit = resi[blkPos] >= 0 ? 0 : 1;
                curCost = (thisSignBit != signbit) ? MAX_INT : -deltaU[blkPos];
                curChange = 1;
            }
            else
            {
                curCost = -deltaU[blkPos];
                curChange = 1;
            }
        }
        if (curCost < minCostInc)
        {
            minCostInc = curCost;
            finalChange = curChange;
            minPos = blkPos;
        }
        cgFlags >>= 1;
    }
    *minPosOut = minPos;
    *finalChangeOut = finalChange;
}

static void new_cg(const int16_t* coeff, const int32_t* deltaU,
                   const int16_t* resi, const uint16_t* scan, int cgStart,
                   uint32_t cgFlags, uint32_t signbit,
                   int firstNZ, int lastNZ, int isLastCG,
                   int* minPosOut, int32_t* finalChangeOut)
{
    int32_t cost[16], chg[16];
    for (int n = 0; n < 16; n++)
    {
        const int blk = scan[cgStart + n];
        const int32_t du = deltaU[blk];
        const int coef = coeff[blk];
        const bool nz = (cgFlags >> (15 - n)) & 1;
        if (nz)
        {
            if (du > 0)
            {
                cost[n] = -du;
                chg[n] = 1;
            }
            else if (n == firstNZ && abs(coef) == 1)
            {
                cost[n] = MAX_INT;
                chg[n] = 0;
            }
            else
            {
                cost[n] = du;
                chg[n] = -1;
            }
        }
        else
        {
            if (n < firstNZ)
            {
                const uint32_t thisSignBit = resi[blk] >= 0 ? 0 : 1;
                cost[n] = (thisSignBit != signbit) ? MAX_INT : -du;
                chg[n] = 1;
            }
            else
            {
                cost[n] = -du;
                chg[n] = 1;
            }
        }
        if (isLastCG && n > lastNZ)
            cost[n] = MAX_INT;
    }
    int minPos = -1;
    int32_t finalChange = 0;
    int32_t best = MAX_INT;
    const int start = isLastCG ? lastNZ : 15;
    for (int n = start; n >= 0; --n)
        if (cost[n] < best)
        {
            best = cost[n];
            minPos = scan[cgStart + n];
            finalChange = chg[n];
        }
    *minPosOut = minPos;
    *finalChangeOut = finalChange;
}

int main()
{
    std::mt19937 rng(0x58A7u);
    int bad = 0;
    for (int t = 0; t < 200000; t++)
    {
        int16_t coeff[16], resi[16];
        int32_t du[16];
        uint16_t scan[16];
        for (int i = 0; i < 16; i++)
        {
            coeff[i] = (int16_t)((int)(rng() % 21) - 10);
            resi[i] = (int16_t)((int)(rng() % 21) - 10);
            du[i] = (int32_t)((int)(rng() % 21) - 10);
            scan[i] = (uint16_t)i;
        }
        std::shuffle(scan, scan + 16, rng);
        uint32_t cgFlags = (uint32_t)(rng() & 0xFFFF);
        uint32_t signbit = rng() & 1;
        if (cgFlags == 0)
            continue;
        // coeffFlag bit b corresponds to scan position 15-b.
        const int bHigh = 31 - __builtin_clz((unsigned)cgFlags);
        const int bLow = __builtin_ctz((unsigned)cgFlags);
        const int firstNZ = 15 - bHigh;
        const int lastNZ = 15 - bLow;
        const int isLastCG = rng() & 1;
        int po, pn;
        int32_t fo, fn;
        orig_cg(coeff, du, resi, scan, 0, cgFlags, signbit,
                firstNZ, lastNZ, isLastCG, &po, &fo);
        new_cg(coeff, du, resi, scan, 0, cgFlags, signbit,
               firstNZ, lastNZ, isLastCG, &pn, &fn);
        if (po != pn || fo != fn)
        {
            if (bad < 5)
            {
                printf("mismatch t=%d flags=%04x first=%d last=%d lastCG=%d "
                       "orig=(%d,%d) new=(%d,%d)\n",
                       t, cgFlags, firstNZ, lastNZ, isLastCG,
                       po, fo, pn, fn);
                printf("  coeff:");
                for (int i = 0; i < 16; i++)
                    printf(" %d", coeff[i]);
                printf("\n  du:");
                for (int i = 0; i < 16; i++)
                    printf(" %d", du[i]);
                printf("\n  per-n:");
                {
                    uint32_t cf = cgFlags;
                    const int start = isLastCG ? lastNZ : 15;
                    for (int n = start; n >= 0; --n)
                    {
                        const int blk = scan[n];
                        int oc, nc;
                        if (cf & 1)
                            oc = du[blk] > 0 ? -du[blk]
                                 : ((cf == 1 && abs(coeff[blk]) == 1)
                                    ? MAX_INT : du[blk]);
                        else
                            oc = (cf == 0)
                                 ? (((resi[blk] >= 0 ? 0 : 1) != signbit)
                                    ? MAX_INT : -du[blk])
                                 : -du[blk];
                        const bool nz = (cgFlags >> (15 - n)) & 1;
                        if (nz)
                            nc = du[blk] > 0 ? -du[blk]
                                 : ((n == firstNZ && abs(coeff[blk]) == 1)
                                    ? MAX_INT : du[blk]);
                        else
                            nc = (n < firstNZ)
                                 ? (((resi[blk] >= 0 ? 0 : 1) != signbit)
                                    ? MAX_INT : -du[blk])
                                 : -du[blk];
                        printf(" n%d(s%d): orig=%d new=%d%s\n",
                               n, blk, oc, nc, oc != nc ? " *" : "");
                        cf >>= 1;
                    }
                }
            }
            bad++;
        }
    }
    printf("sbh_cg verify bad=%d\n", bad);
    return bad != 0;
}
