// VL semantics probe: PR_SVE_SET_VL is per-thread on Linux. This records
// whether a freshly created worker thread inherits the caller's VL or falls
// back to the system default, and whether the worker can set its own VL.
// Production dispatch (x265 thread pool) must set VL in every worker thread
// if inheritance is absent. NOTE: this probe is native-only; it passes VL in
// bits per the Linux kernel PR_SVE_SET_VL ABI (qemu-user uses bytes).
#include <arm_sve.h>

#include <cstdio>
#include <cstdlib>
#include <sys/prctl.h>
#include <thread>

static void worker(const char* tag, bool set_vl, unsigned long vl_bits)
{
    if (set_vl)
        (void)prctl(PR_SVE_SET_VL, vl_bits);
    printf("%s vl-bytes=%lu\n", tag, (unsigned long)svcntb());
}

int main(int argc, char** argv)
{
    unsigned long vl_bits = argc > 1 ? strtoul(argv[1], nullptr, 10) : 128;
    (void)prctl(PR_SVE_SET_VL, vl_bits);
    printf("main-after-prctl vl-bytes=%lu\n", (unsigned long)svcntb());

    std::thread t1(worker, "worker-inherit", false, vl_bits);
    t1.join();
    std::thread t2(worker, "worker-set-own", true, vl_bits);
    t2.join();
    printf("main-end vl-bytes=%lu\n", (unsigned long)svcntb());
    return 0;
}
