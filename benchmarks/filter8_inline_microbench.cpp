// Verify the GCC12 helper-outlining cost for interp8 filter8_u8x16:
// noinline (lib behavior: bl + stack round-trip per call) vs
// always_inline (candidate behavior). Self-contained, no x265 deps.
#include <algorithm>
#include <arm_neon.h>
#include <cstdint>
#include <cstring>
#include <cstdio>
#include <random>
#include <vector>

static inline uint64_t rdtsc()
{
    uint64_t t;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(t));
    return t;
}

__attribute__((noinline)) static void filter8_noinline(
    const uint8x16_t* s, const uint16x8_t c, int16x8_t& d0, int16x8_t& d1)
{
    const uint8x16_t f0 = vdupq_n_u8(4);
    const uint8x16_t f1 = vdupq_n_u8(10);
    const uint8x16_t f2 = vdupq_n_u8(58);
    const uint8x16_t f3 = vdupq_n_u8(17);
    const uint8x16_t f4 = vdupq_n_u8(5);
    uint16x8_t t0 = vsubl_u8(vget_low_u8(s[1]), vget_low_u8(s[7]));
    t0 = vaddq_u16(c, t0);
    t0 = vmlal_u8(t0, vget_low_u8(s[6]), vget_low_u8(f0));
    t0 = vmlsl_u8(t0, vget_low_u8(s[5]), vget_low_u8(f1));
    t0 = vmlal_u8(t0, vget_low_u8(s[4]), vget_low_u8(f2));
    t0 = vmlal_u8(t0, vget_low_u8(s[3]), vget_low_u8(f3));
    t0 = vmlsl_u8(t0, vget_low_u8(s[2]), vget_low_u8(f4));
    d0 = vreinterpretq_s16_u16(t0);
    uint16x8_t t1 = vsubl_u8(vget_high_u8(s[1]), vget_high_u8(s[7]));
    t1 = vaddq_u16(c, t1);
    t1 = vmlal_u8(t1, vget_high_u8(s[6]), vget_high_u8(f0));
    t1 = vmlsl_u8(t1, vget_high_u8(s[5]), vget_high_u8(f1));
    t1 = vmlal_u8(t1, vget_high_u8(s[4]), vget_high_u8(f2));
    t1 = vmlal_u8(t1, vget_high_u8(s[3]), vget_high_u8(f3));
    t1 = vmlsl_u8(t1, vget_high_u8(s[2]), vget_high_u8(f4));
    d1 = vreinterpretq_s16_u16(t1);
}

__attribute__((always_inline)) static inline void filter8_inline(
    const uint8x16_t* s, const uint16x8_t c, int16x8_t& d0, int16x8_t& d1)
{
    const uint8x16_t f0 = vdupq_n_u8(4);
    const uint8x16_t f1 = vdupq_n_u8(10);
    const uint8x16_t f2 = vdupq_n_u8(58);
    const uint8x16_t f3 = vdupq_n_u8(17);
    const uint8x16_t f4 = vdupq_n_u8(5);
    uint16x8_t t0 = vsubl_u8(vget_low_u8(s[1]), vget_low_u8(s[7]));
    t0 = vaddq_u16(c, t0);
    t0 = vmlal_u8(t0, vget_low_u8(s[6]), vget_low_u8(f0));
    t0 = vmlsl_u8(t0, vget_low_u8(s[5]), vget_low_u8(f1));
    t0 = vmlal_u8(t0, vget_low_u8(s[4]), vget_low_u8(f2));
    t0 = vmlal_u8(t0, vget_low_u8(s[3]), vget_low_u8(f3));
    t0 = vmlsl_u8(t0, vget_low_u8(s[2]), vget_low_u8(f4));
    d0 = vreinterpretq_s16_u16(t0);
    uint16x8_t t1 = vsubl_u8(vget_high_u8(s[1]), vget_high_u8(s[7]));
    t1 = vaddq_u16(c, t1);
    t1 = vmlal_u8(t1, vget_high_u8(s[6]), vget_high_u8(f0));
    t1 = vmlsl_u8(t1, vget_high_u8(s[5]), vget_high_u8(f1));
    t1 = vmlal_u8(t1, vget_high_u8(s[4]), vget_high_u8(f2));
    t1 = vmlal_u8(t1, vget_high_u8(s[3]), vget_high_u8(f3));
    t1 = vmlsl_u8(t1, vget_high_u8(s[2]), vget_high_u8(f4));
    d1 = vreinterpretq_s16_u16(t1);
}

int main(int argc, char** argv)
{
    const int which = argc > 1 && !strcmp(argv[1], "inline");
    const int samples = argc > 2 ? atoi(argv[2]) : 50;
    const int batch = argc > 3 ? atoi(argv[3]) : 20000;
    std::mt19937 rng(0xF81Eu);
    uint8_t buf[8 * 16 + 16];
    for (int i = 0; i < (int)sizeof(buf); i++)
        buf[i] = (uint8_t)rng();
    uint8x16_t s[8];
    for (int i = 0; i < 8; i++)
        s[i] = vld1q_u8(buf + i * 16);
    const uint16x8_t c = vdupq_n_u16(0x8000);
    int16x8_t acc = vdupq_n_s16(0);
    std::vector<uint64_t> times;
    for (int k = 0; k < samples; k++)
    {
        uint64_t t0 = rdtsc();
        for (int i = 0; i < batch; i++)
        {
            if (which)
            {
                for (int j = 0; j < 8; j++)
                {
                    int16x8_t d0, d1;
                    filter8_inline(s + j, c, d0, d1);
                    acc = vaddq_s16(acc, d0);
                    acc = vaddq_s16(acc, d1);
                }
            }
            else
            {
                for (int j = 0; j < 8; j++)
                {
                    int16x8_t d0, d1;
                    filter8_noinline(s + j, c, d0, d1);
                    acc = vaddq_s16(acc, d0);
                    acc = vaddq_s16(acc, d1);
                }
            }
        }
        uint64_t t1 = rdtsc();
        times.push_back(t1 - t0);
        if (k == 0 && acc[0] == 0x7fff)
            printf("unreachable\n");
    }
    std::sort(times.begin(), times.end());
    printf("filter8,%s,median_total=%llu\n",
           which ? "inline" : "noinline",
           (unsigned long long)times[times.size() / 2]);
    return 0;
}
