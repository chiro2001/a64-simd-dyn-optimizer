// Lane-semantics micro probe for the k0_even_sdot design (VL=256).
// Run with: qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 ./lane_probe
#include <arm_sve.h>
#include <cstdint>
#include <cstdio>

static void print16(const char* tag, svint16_t v)
{
    int16_t o[32];
    svst1_s16(svptrue_b16(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 16; i++) printf(" %d", o[i]);
    printf("\n");
}

static void print32(const char* tag, svint32_t v)
{
    int32_t o[16];
    svst1_s32(svptrue_b32(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 8; i++) printf(" %d", o[i]);
    printf("\n");
}

static void print64(const char* tag, svint64_t v)
{
    int64_t o[8];
    svst1_s64(svptrue_b64(), o, v);
    printf("%s:", tag);
    for (int i = 0; i < 4; i++) printf(" %ld", (long)o[i]);
    printf("\n");
}

static inline svint32_t addp_s32(svint32_t a, svint32_t b)
{
    svint32_t r = a;
    asm volatile("addp %[r].s, %[p]/m, %[r].s, %[b].s"
                 : [r] "+w" (r)
                 : [b] "w" (b), [p] "Upl" (svptrue_b32()));
    return r;
}

int main()
{
    // --- predicate lane counts at VL=256 ---
    printf("svcntb=%d\n", svcntb());
    {
        svbool_t p = svwhilelt_b16(0, 4);
        svbool_t p2 = svptrue_pat_b16(SV_VL4);
        printf("whilelt(0,4) h16 active=%d\n",
               (int)svcntp_b16(svptrue_b16(), p));
        printf("ptrue_pat(VL4) h16 active=%d\n",
               (int)svcntp_b16(svptrue_b16(), p2));
        printf("ptrue_pat(VL8) h16 active=%d\n",
               (int)svcntp_b16(svptrue_b16(), svptrue_pat_b16(SV_VL8)));
        printf("ptrue_pat(VL2) h16 active=%d\n",
               (int)svcntp_b16(svptrue_b16(), svptrue_pat_b16(SV_VL2)));
        printf("ptrue_pat(VL4) b8 active=%d\n",
               (int)svcntp_b8(svptrue_b8(), svptrue_pat_b8(SV_VL4)));
        printf("ptrue_pat(VL4) s32 active=%d\n",
               (int)svcntp_b32(svptrue_b32(), svptrue_pat_b32(SV_VL4)));
    }

    // --- uzp1/zip on s32 (8 lanes) ---
    svint32_t a = svindex_s32(1, 1);           // 1..8
    svint32_t b = svindex_s32(101, 1);         // 101..108
    print32("a      ", a);
    print32("uzp1(a,a)", svuzp1_s32(a, a));
    print32("uzp2(a,a)", svuzp2_s32(a, a));
    print32("zip1(a,b)", svzip1_s32(a, b));
    print32("zip2(a,b)", svzip2_s32(a, b));
    print32("trn1(a,b)", svtrn1_s32(a, b));

    // --- uzp1 on s64 (4 lanes) ---
    svint64_t a64 = svindex_s64(1, 1);         // 1..4
    svint64_t b64 = svindex_s64(101, 1);       // 101..104
    print64("a64      ", a64);
    print64("uzp1(a64,a64)", svuzp1_s64(a64, a64));
    print64("uzp2(a64,a64)", svuzp2_s64(a64, a64));
    print64("zip1(a64,b64)", svzip1_s64(a64, b64));
    print64("zip2(a64,b64)", svzip2_s64(a64, b64));

    // --- sdot.d lane semantics ---
    svint16_t ah = svindex_s16(1, 1);          // 1..16
    svint16_t bh = svdup_n_s16(1);
    svint64_t dot = svdot_s64(svdup_n_s64(0), ah, bh);
    print64("sdot(1..16, ones)", dot);

    // --- trn1 s16 zero-pad layout ---
    svint16_t z = svdup_n_s16(0);
    print16("trn1(ah,z)", svtrn1_s16(ah, z));
    print16("trn2(ah,z)", svtrn2_s16(ah, z));
    print16("zip1(ah,z)", svzip1_s16(ah, z));
    print16("zip2(ah,z)", svzip2_s16(ah, z));

    // --- saddlb low-half selection vs ptrue_pat(VL4) ---
    svint32_t lo = svunpklo_s32(ah);           // 1..8 widened
    svint32_t hi = svunpkhi_s32(ah);           // 9..16 widened
    print32("saddlb(ah,ah)", svaddlb_s32(ah, ah));
    print32("saddlt(ah,ah)", svaddlt_s32(ah, ah));
    svint16_t e = svadd_s16_m(svptrue_pat_b16(SV_VL4), ah, ah);
    print16("add_m(VL4,ah,ah)", e);

    // --- k0 tail pipeline on known lanes ---
    svint32_t x = svindex_s32(10, 10);        // 10,20,...,80
    svint32_t m = svmul_s32_x(svptrue_b32(), x, svdup_n_s32(1));
    svint32_t p = addp_s32(m, m);
    svint32_t u = svuzp1_s32(p, p);
    svint16_t n = svrshrnb_n_s32(u, 4);
    svint16_t c = svuzp1_s16(n, n);
    print32("x       ", x);
    print32("addp(x,x)", p);
    print32("uzp1s    ", u);
    print16("rshrnb   ", n);
    print16("uzp1_s16 ", c);
    return 0;
}
