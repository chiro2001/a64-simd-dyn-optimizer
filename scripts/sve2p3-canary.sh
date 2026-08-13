#!/usr/bin/env bash
# Build and run the SVE2p3 execution canary under the requested executor.
# Usage: scripts/sve2p3-canary.sh [qemu|native] [extra qemu args...]
#
# Exit codes:
#   0  executed and PASS
#   1  executed but semantic mismatch
#   3  executor does not implement FEAT_SVE2p3 (SIGILL) or VL setup failed
#   4  build failure
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

MODE="${1:-qemu}"
shift 2>/dev/null || true

AS=${AS:-aarch64-linux-gnu-as}
CC=${CC:-aarch64-linux-gnu-gcc}
TMP=${TMPDIR:-/tmp}/sve2p3-canary
mkdir -p "$TMP"

if ! "$AS" -march=armv9.5-a+sve2p3 -o "$TMP/canary.o" \
        tools/sve2p3_canary.S 2>"$TMP/as.err"; then
    echo "canary: assembler does not accept SVE2p3 sdot.h" >&2
    cat "$TMP/as.err" >&2
    exit 4
fi
if ! "$CC" -O2 -static -o "$TMP/canary" \
        "$TMP/canary.o" tools/sve2p3_canary.c 2>"$TMP/cc.err"; then
    echo "canary: C build failed" >&2
    cat "$TMP/cc.err" >&2
    exit 4
fi

if [ "$MODE" = "qemu" ]; then
    qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2 "$@" \
        "$TMP/canary"
    rc=$?
else
    "$TMP/canary"
    rc=$?
fi

if [ "$rc" -eq 0 ]; then
    echo "canary: executor implements FEAT_SVE2p3"
    exit 0
fi
if [ "$rc" -eq 132 ] || [ "$rc" -eq 3 ]; then
    echo "canary: executor does NOT implement FEAT_SVE2p3 (SIGILL/exit $rc)"
    exit 3
fi
exit "$rc"
