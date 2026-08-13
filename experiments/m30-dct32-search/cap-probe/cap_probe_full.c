#include <signal.h>
#include <stdint.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>

extern void probe_sdot_d(const int16_t*, const int16_t*, int16_t*);
extern void probe_uzp1(const int32_t*, const int32_t*, int32_t*);
extern void probe_sunpklo(const int16_t*, const int16_t*, int32_t*);
extern void probe_rshrnb(const int32_t*, const int32_t*, int16_t*);
extern void probe_tbl2(const int16_t*, const int16_t*, int16_t*);

static int run_one(const char* name, void (*fn)(void))
{
    pid_t pid = fork();
    if (pid == 0)
    {
        int16_t a16[32], b16[32], o16[32] = {0};
        int32_t a32[16], b32[16], o32[16] = {0};
        for (int i = 0; i < 32; i++)
        {
            a16[i] = (int16_t)(i + 1);
            b16[i] = (int16_t)(i + 1);
        }
        for (int i = 0; i < 16; i++)
        {
            a32[i] = i + 1;
            b32[i] = i + 1;
        }
        if (fn == (void (*)(void))probe_sdot_d)
            probe_sdot_d(a16, b16, o16);
        else if (fn == (void (*)(void))probe_uzp1)
            probe_uzp1(a32, b32, o32);
        else if (fn == (void (*)(void))probe_sunpklo)
            probe_sunpklo(a16, b16, o32);
        else if (fn == (void (*)(void))probe_rshrnb)
            probe_rshrnb(a32, b32, o16);
        else
            probe_tbl2(a16, b16, o16);
        _exit(0);
    }
    int st = 0;
    waitpid(pid, &st, 0);
    if (WIFSIGNALED(st) && WTERMSIG(st) == SIGILL)
    {
        printf("%s: SIGILL\n", name);
        return 0;
    }
    if (WIFEXITED(st) && WEXITSTATUS(st) == 0)
    {
        printf("%s: OK\n", name);
        return 0;
    }
    printf("%s: unexpected status 0x%x\n", name, st);
    return 1;
}

int main(void)
{
    int rc = 0;
    rc |= run_one("sdot_d(SVE1)", (void (*)(void))probe_sdot_d);
    rc |= run_one("uzp1(SVE1)", (void (*)(void))probe_uzp1);
    rc |= run_one("sunpklo(SVE1)", (void (*)(void))probe_sunpklo);
    rc |= run_one("rshrnb(SVE2)", (void (*)(void))probe_rshrnb);
    rc |= run_one("tbl2(SVE2)", (void (*)(void))probe_tbl2);
    return rc;
}
