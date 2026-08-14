#!/usr/bin/env bash
# Run a command with hard memory + wall-time bounds so a runaway job cannot
# OOM the host and kill the agent/other work (docs/42 §11 memory discipline).
#
# Usage:
#   scripts/bounded-run.sh <mem_mb> <timeout_s> <cmd...>
#
# Memory limit is enforced with systemd-run cgroup MemoryMax when available
# (kills only this scope), otherwise with ulimit -v/-m. Swap is disabled for
# the scope so a ballooning job is killed instead of thrashing the host.
# Wall time uses `timeout -k`. Every invocation is logged to $BOUNDED_LOG
# (default build/bounded-run.log, gitignored).
set -u

MEM_MB="${1:?usage: bounded-run.sh <mem_mb> <timeout_s> <cmd...>}"
TIMEOUT_S="${2:?usage: bounded-run.sh <mem_mb> <timeout_s> <cmd...>}"
shift 2

LOG="${BOUNDED_LOG:-$PWD/build/bounded-run.log}"
mkdir -p "$(dirname "$LOG")"
{
    echo "=== $(date '+%F %T') bounded-run mem=${MEM_MB}MB timeout=${TIMEOUT_S}s: $* ==="
} >> "$LOG"

run_bounded() {
    if command -v systemd-run >/dev/null 2>&1 && \
       systemd-run --scope -p MemoryMax=$((MEM_MB * 1024 * 1024)) \
           -p MemorySwapMax=0 -p MemoryHigh=$((MEM_MB * 1024 * 1024)) \
           --quiet -- timeout -k 10 "$TIMEOUT_S" "$@" \
           2>/dev/null; then
        return 0
    fi
    # fallback: ulimit (KB units) + timeout
    ulimit -v $((MEM_MB * 1024)) 2>/dev/null || true
    ulimit -m $((MEM_MB * 1024)) 2>/dev/null || true
    timeout -k 10 "$TIMEOUT_S" "$@"
}

run_bounded "$@"
rc=$?
{
    if [ "$rc" -ge 128 ]; then
        echo "--- $(date '+%F %T') bounded-run rc=$rc mem=${MEM_MB}MB"
        echo "    (killed by signal $((rc - 128)): 137=OOM, 124=timeout) ---"
    else
        echo "--- $(date '+%F %T') bounded-run rc=$rc mem=${MEM_MB}MB ---"
    fi
} >> "$LOG"
exit $rc
