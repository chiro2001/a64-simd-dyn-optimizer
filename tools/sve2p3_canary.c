/* SVE2p3 execution canary runner.
 *
 * Build with tools/sve2p3_canary.S and run under the candidate executor:
 *   qemu-aarch64 -cpu max,sve-max-vq=2 ./canary
 *
 * Exit codes:
 *   0  executed and lane results correct
 *   1  executed but results wrong (semantics probe failure)
 *   77 executor lacks SVE2p3 (SIGILL) -- detected by the launcher script
 *   78 fixed VL/register setup failed
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/prctl.h>

#ifndef PR_SVE_SET_VL
#define PR_SVE_SET_VL 50
#endif

extern void sve2p3_sdot_h_canary(const int8_t*, const int8_t*, int16_t*);

static int check(const int8_t* a, const int8_t* b, int n)
{
    int16_t out[32];
    memset(out, 0xA5, sizeof(out));
    sve2p3_sdot_h_canary(a, b, out);
    for (int i = 0; i < n; i++)
    {
        int want = (int)a[2 * i] * (int)b[2 * i]
                 + (int)a[2 * i + 1] * (int)b[2 * i + 1];
        if (out[i] != (int16_t)want)
        {
            fprintf(stderr, "canary: lane %d want %d got %d\n",
                    i, want, out[i]);
            return 1;
        }
    }
    return 0;
}

int main(void)
{
    int vl = prctl(PR_SVE_SET_VL, 32, 0, 0, 0, 0);
    if (vl < 0 || vl != 32)
    {
        fprintf(stderr, "canary: VL setup failed (prctl=%d)\n", vl);
        return 78;
    }

    int8_t a[32], b[32];
    for (int i = 0; i < 32; i++)
    {
        a[i] = (int8_t)(i + 1);          /* 1..32 */
        b[i] = 1;
    }
    int rc = check(a, b, 16);            /* expect 4i+3 per lane */
    if (rc) return rc;

    for (int i = 0; i < 32; i++)
    {
        a[i] = (i & 1) ? (int8_t)(i + 1) : -(int8_t)(i + 1); /* -1,2,-3,4... */
        b[i] = (i & 2) ? (int8_t)-1 : 1;                     /* 1,1,-1,-1... */
    }
    rc = check(a, b, 16);                /* mixed signs */
    if (rc) return rc;

    printf("SVE2p3 sdot.h canary: PASS (executor implements FEAT_SVE2p3)\n");
    return 0;
}
