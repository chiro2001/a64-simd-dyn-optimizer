#!/usr/bin/env bash
# Run x265 TestBench correctness for a given build and testbench module.
# Usage: scripts/run-testbench.sh <build-dir> [module=pixel] [cpuid=NEON] [outdir]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

BUILD="${1:?usage: run-testbench.sh <build-dir> [module] [cpuid] [outdir]}"
MODULE="${2:-pixel}"
CPUID="${3:-NEON}"
OUTDIR="${4:-experiments/m0-foundation/testbench}"
if [ -x "$BUILD/TestBench" ]; then
  TB="$BUILD/TestBench"
elif [ -x "$BUILD/test/TestBench" ]; then
  TB="$BUILD/test/TestBench"
else
  echo "[run-testbench] no TestBench under $BUILD" >&2
  exit 1
fi

if [ ! -x "$TB" ]; then
  echo "[run-testbench] missing $TB" >&2
  exit 1
fi

mkdir -p "$OUTDIR"
LOG="$OUTDIR/${MODULE}-${CPUID}-nobench.log"
echo "[run-testbench] $TB --cpuid $CPUID --testbench $MODULE --nobench"
"$TB" --cpuid "$CPUID" --testbench "$MODULE" --nobench > "$LOG" 2>&1
rc=$?
echo "[run-testbench] exit=$rc log=$LOG"
tail -20 "$LOG"
exit $rc
