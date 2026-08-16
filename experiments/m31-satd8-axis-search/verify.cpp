#include <cstdint>
#include <cstdio>
#include <cstdlib>
namespace x265 {
template <int W, int H> int satd8_sve2(
    const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}
extern "C" {
typedef int (*cfn_t)(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
}
template <int W, int H>
static void check(const char* tag, cfn_t CAND)
{
    long mm = 0;
    const int sts[] = {16, 32, 64};
    static uint8_t a[(24 + 8) * 64 + 64], b[(24 + 8) * 64 + 64];
    for (int it = 0; it < 20000 && mm < 4; it++)
    {
        int st = sts[it % 3];
        for (int i = 0; i < (int)(sizeof(a) / sizeof(a[0])); i++)
            a[i] = b[i] = (uint8_t)(rand() % 256);
        int got = CAND(a + 3 * st + 8, st, b + 3 * st + 8, st);
        int want = x265::satd8_sve2<W, H>(
            a + 3 * st + 8, st, b + 3 * st + 8, st);
        if (got != want)
        {
            if (mm < 4)
                printf("%s it=%d got=%d want=%d\n", tag, it, got, want);
            mm++;
        }
    }
    printf("%s mismatches=%ld\n", tag, mm);
}
extern "C" int dynopt_satd_s8x8_r_vaddlv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x8_r_vaddlv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x8_r_vpaddl_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x8_r_vpaddl_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x8_r_vaddv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x8_r_vaddv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vaddlv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vaddlv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vpaddl_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vpaddl_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vaddv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s8x16_r_vaddv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vaddlv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vaddlv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vpaddl_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vpaddl_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vaddv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x8_r_vaddv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vaddlv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vaddlv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vpaddl_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vpaddl_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vaddv_a_abd(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
extern "C" int dynopt_satd_s16x16_r_vaddv_a_subabs(const uint8_t*, intptr_t, const uint8_t*, intptr_t);
int main()
{
    check<8, 8>("s8x8_r_vaddlv_a_abd", dynopt_satd_s8x8_r_vaddlv_a_abd);
    check<8, 8>("s8x8_r_vaddlv_a_subabs", dynopt_satd_s8x8_r_vaddlv_a_subabs);
    check<8, 8>("s8x8_r_vpaddl_a_abd", dynopt_satd_s8x8_r_vpaddl_a_abd);
    check<8, 8>("s8x8_r_vpaddl_a_subabs", dynopt_satd_s8x8_r_vpaddl_a_subabs);
    check<8, 8>("s8x8_r_vaddv_a_abd", dynopt_satd_s8x8_r_vaddv_a_abd);
    check<8, 8>("s8x8_r_vaddv_a_subabs", dynopt_satd_s8x8_r_vaddv_a_subabs);
    check<8, 16>("s8x16_r_vaddlv_a_abd", dynopt_satd_s8x16_r_vaddlv_a_abd);
    check<8, 16>("s8x16_r_vaddlv_a_subabs", dynopt_satd_s8x16_r_vaddlv_a_subabs);
    check<8, 16>("s8x16_r_vpaddl_a_abd", dynopt_satd_s8x16_r_vpaddl_a_abd);
    check<8, 16>("s8x16_r_vpaddl_a_subabs", dynopt_satd_s8x16_r_vpaddl_a_subabs);
    check<8, 16>("s8x16_r_vaddv_a_abd", dynopt_satd_s8x16_r_vaddv_a_abd);
    check<8, 16>("s8x16_r_vaddv_a_subabs", dynopt_satd_s8x16_r_vaddv_a_subabs);
    check<16, 8>("s16x8_r_vaddlv_a_abd", dynopt_satd_s16x8_r_vaddlv_a_abd);
    check<16, 8>("s16x8_r_vaddlv_a_subabs", dynopt_satd_s16x8_r_vaddlv_a_subabs);
    check<16, 8>("s16x8_r_vpaddl_a_abd", dynopt_satd_s16x8_r_vpaddl_a_abd);
    check<16, 8>("s16x8_r_vpaddl_a_subabs", dynopt_satd_s16x8_r_vpaddl_a_subabs);
    check<16, 8>("s16x8_r_vaddv_a_abd", dynopt_satd_s16x8_r_vaddv_a_abd);
    check<16, 8>("s16x8_r_vaddv_a_subabs", dynopt_satd_s16x8_r_vaddv_a_subabs);
    check<16, 16>("s16x16_r_vaddlv_a_abd", dynopt_satd_s16x16_r_vaddlv_a_abd);
    check<16, 16>("s16x16_r_vaddlv_a_subabs", dynopt_satd_s16x16_r_vaddlv_a_subabs);
    check<16, 16>("s16x16_r_vpaddl_a_abd", dynopt_satd_s16x16_r_vpaddl_a_abd);
    check<16, 16>("s16x16_r_vpaddl_a_subabs", dynopt_satd_s16x16_r_vpaddl_a_subabs);
    check<16, 16>("s16x16_r_vaddv_a_abd", dynopt_satd_s16x16_r_vaddv_a_abd);
    check<16, 16>("s16x16_r_vaddv_a_subabs", dynopt_satd_s16x16_r_vaddv_a_subabs);
    return 0;
}
