#include <cstdint>
#include <cstdio>
#include <cstring>
extern "C" void old_full(const int16_t*, int16_t*, intptr_t);
extern "C" void new_full(const int16_t*, int16_t*, intptr_t);
int main()
{
    int16_t src[32 * 64];
    for (int i = 0; i < 32 * 64; i++)
        src[i] = (int16_t)((i * 37 + 11) % 511 - 255);
    int16_t a[1024], b[1024];
    memset(a, 0, sizeof(a));
    memset(b, 0, sizeof(b));
    old_full(src, a, 64);
    new_full(src, b, 64);
    long mk[32] = {0};
    long tot = 0;
    for (int k = 0; k < 32; k++)
        for (int r = 0; r < 32; r++)
            if (a[k * 32 + r] != b[k * 32 + r])
            {
                mk[k]++;
                tot++;
                if (tot <= 16)
                    printf("k=%d row=%d want=%d got=%d\n",
                           k, r, a[k * 32 + r], b[k * 32 + r]);
            }
    for (int k = 0; k < 32; k++)
        if (mk[k]) printf("k=%d mism=%ld\n", k, mk[k]);
    printf("total=%ld\n", tot);
    return 0;
}
