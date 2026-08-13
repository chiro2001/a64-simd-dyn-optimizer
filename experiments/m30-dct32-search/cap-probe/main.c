#include <stdint.h>
#include <stdio.h>

extern void sdot_d_probe(const int16_t*, const int16_t*, int16_t*);

int main(void)
{
    int16_t a[16], b[16], o[16] = {0};
    for (int i = 0; i < 16; i++)
    {
        a[i] = (int16_t)(i + 1);
        b[i] = 1;
    }
    sdot_d_probe(a, b, o);
    // sdot.d: lane0 = 1*1 + 2*1 + 3*1 + 4*1 = 10 (SVE v1, not SVE2).
    printf("lane0=%d (expect 10)\n", o[0]);
    return 0;
}
