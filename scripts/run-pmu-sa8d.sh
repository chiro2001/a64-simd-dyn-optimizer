#!/usr/bin/env bash
# PMU counts for SA8D baseline (user-mode events, pinned to CPU 0).
# Reports gross counts for neon and empty; caller subtracts empty for net.
# Usage: scripts/run-pmu-sa8d.sh <shape> <samples> <batch> <outdir>
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

SHAPE="${1:?usage: run-pmu-sa8d.sh <shape> <samples> <batch> <outdir>}"
SAMPLES="${2:-100}"
BATCH="${3:-4096}"
OUT="${4:-experiments/m0-foundation/benchmark/pmu}"
MB="$ROOT/build/sa8d_microbench"

mkdir -p "$OUT"
for impl in neon empty; do
  perf stat -e cycles:u,instructions:u,branches:u,branch-misses:u \
    taskset -c 0 "$MB" "$SHAPE" "$impl" latency "$SAMPLES" "$BATCH" --noverify \
    > "$OUT/${SHAPE}-${impl}-stdout.txt" 2> "$OUT/${SHAPE}-${impl}-perfstat.txt"
done
echo "[run-pmu-sa8d] wrote $OUT/${SHAPE}-{neon,empty}-perfstat.txt"
