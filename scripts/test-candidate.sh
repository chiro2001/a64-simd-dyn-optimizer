#!/usr/bin/env bash
# Candidate funnel: generate -> verify (100k diff) -> same-binary A/B.
# Usage: scripts/test-candidate.sh <variant-id>
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

ID="${1:?usage: test-candidate.sh <variant-id>}"
BUILD="${2:-build/x265-8-gcc}"
SRC="$ROOT/third_party/x265/source"
RT="$ROOT/generated/sa8d/roundtrip_sa8d_8x8.cpp"
CAND="$ROOT/kernels/sa8d/candidates/${ID}.cpp"
OUT="$ROOT/build/candidate-${ID}"
mkdir -p "$(dirname "$CAND")"

if [ ! -f "$RT" ]; then
  scripts/build-sa8d-roundtrip.sh
fi
PYTHONPATH="$PWD" .venv/bin/python kernels/sa8d/gen_candidate.py "$ID" "$RT" "$CAND"

g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_neon_candidate \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  kernels/sa8d/roundtrip_verify.cpp "$CAND" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o "${OUT}_verify"

echo "[candidate] verify:"
"${OUT}_verify" 100000

g++ -O3 -DNDEBUG -std=c++11 -Wall -Wextra \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_neon_candidate \
  -I"$SRC" -I"$SRC/common" -I"$BUILD" \
  benchmarks/sa8d_microbench.cpp "$CAND" \
  "$BUILD/libx265.a" -lnuma -lpthread -ldl \
  -o "${OUT}_bench"

scripts/bench-paired.sh "${OUT}_bench" 30 5 "$OUT"

for impl in neon cand; do
  perf stat -e cycles:u,instructions:u \
    taskset -c 0 "${OUT}_bench" 8x8 "$impl" latency 500 4096 --noverify \
    > "$OUT/${impl}-stdout.txt" 2> "$OUT/${impl}-perfstat.txt" || true
done
llvm-objdump -d --disassemble-symbols=dynopt_sa8d_8x8_neon_candidate \
  "${OUT}_bench" > "$OUT/disasm-candidate.txt" 2>/dev/null || true
echo "[candidate] artifacts in $OUT/"
