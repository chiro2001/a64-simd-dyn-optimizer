// VL semantics probe: PR_SVE_SET_VL is per-thread on Linux. This records
// whether a freshly created worker thread inherits the caller's VL or falls
// back to the system default, and whether the worker can set its own VL.
// Production dispatch (x265 thread pool) must set VL in every worker thread
// if inheritance is absent. NOTE: PR_SVE_SET_VL argument units are observed
// empirically instead of assumed from the man page: on this Kunpeng 920B
// openEuler 6.6 kernel and on qemu-user the value behaves as BYTES
// (prctl(16) -> 16B, larger values clamp to the implementation maximum),
// while the man page documents bits. The probe prints prctl return codes so
// the behavior is recorded, and uses 16 (VL=128 bits = 16 bytes) for the
// inheritance check.
#include <arm_sve.h>

#include <cstdio>
#include <cstdlib>
#include <sys/prctl.h>
#include <thread>

static void worker(const char* tag, bool set_vl, unsigned long vl_arg)
{
    if (set_vl)
        printf("%s prctl-ret=%ld\n", tag,
               (long)prctl(PR_SVE_SET_VL, vl_arg));
    printf("%s vl-bytes=%lu\n", tag, (unsigned long)svcntb());
}

int main(int argc, char** argv)
{
    unsigned long vl_arg = argc > 1 ? strtoul(argv[1], nullptr, 10) : 16;
    printf("main-prctl-ret=%ld\n", (long)prctl(PR_SVE_SET_VL, vl_arg));
    printf("main-after-prctl vl-bytes=%lu\n", (unsigned long)svcntb());

    std::thread t1(worker, "worker-inherit", false, vl_arg);
    t1.join();
    std::thread t2(worker, "worker-set-own", true, vl_arg);
    t2.join();
    printf("main-end vl-bytes=%lu\n", (unsigned long)svcntb());
    return 0;
}
