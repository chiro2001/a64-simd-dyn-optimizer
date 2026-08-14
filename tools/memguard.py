#!/usr/bin/env python3
"""Self-contained RSS watchdog for heavy tools.

Installs a daemon thread that samples the process RSS (VmRSS from
/proc/self/status) and self-terminates with code 137 when the limit is
crossed.  This is a belt-and-braces guard for direct invocations that
bypass scripts/bounded-run.sh; the layered backstops are:

  1. this watchdog (TOOL_MEM_LIMIT_MB, default 12288 MiB)
  2. scripts/bounded-run.sh  (per-command systemd-run MemoryMax scope)
  3. user@1000.service        (system-wide slice MemoryMax=26G, installed
                               on the dev host so a runaway cannot OOM the
                               whole box / kill the agent)

Usage:
    from memguard import install
    install()                 # env/default limit
    install(mb=4096)          # explicit MiB limit

The watchdog exits the whole process (os._exit(137)) so the tool dies
quickly instead of pushing the host into global OOM.
"""

import os
import sys
import threading

DEFAULT_LIMIT_MB = 12288


def _vmrss_mb():
    try:
        with open("/proc/self/status", encoding="utf-8") as f:
            for line in f:
                if line.startswith("VmRSS:"):
                    return int(line.split()[1]) // 1024
    except (OSError, IndexError, ValueError):
        pass
    return 0


def install(mb=None):
    """Start the watchdog thread. Returns the thread handle."""
    limit_mb = int(os.environ.get("TOOL_MEM_LIMIT_MB", DEFAULT_LIMIT_MB)) \
        if mb is None else int(mb)
    if limit_mb <= 0:
        return None

    def watch():
        while True:
            try:
                if _vmrss_mb() >= limit_mb:
                    print(
                        f"[memguard] RSS exceeded {limit_mb} MiB; "
                        "self-terminating (137) to protect the host",
                        file=sys.stderr, flush=True)
                    os._exit(137)
            except Exception:
                pass
            threading.Event().wait(0.25)

    t = threading.Thread(target=watch, daemon=True, name="memguard")
    t.start()
    return t


if __name__ == "__main__":
    # Quick smoke test: python3 tools/memguard.py [mb] [chunks]
    mb = int(sys.argv[1]) if len(sys.argv) > 1 else 512
    chunks = int(sys.argv[2]) if len(sys.argv) > 2 else 4000
    install(mb=mb)
    print(f"allocating {chunks} x 1MiB with limit {mb} MiB", flush=True)
    mem = [bytearray(1024 * 1024) for _ in range(chunks)]
    print("survived", len(mem))
