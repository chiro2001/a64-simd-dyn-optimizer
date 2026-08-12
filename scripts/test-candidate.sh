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

for mode in latency throughput; do
  for impl in neon cand; do
    for p in 1 2 3 4 5; do
      taskset -c 0 "${OUT}_bench" 8x8 "$impl" "$mode" 30 4096 --noverify 2>/dev/null \
        | tail -n +2 | awk -v impl="$impl" -v p="$p" -v mode="$mode" \
          '{print impl "," p "," mode "," $0}'
    done
  done
done > "${OUT}_ab.csv"

python3 - "${OUT}_ab.csv" <<'PY'
import csv, statistics, sys
rows = {}
for r in csv.reader(open(sys.argv[1])):
    key = (r[0], r[2])
    rows.setdefault(key, []).append(float(r[8]))
for key in sorted(rows):
    impl, mode = key
    v = rows[key]
    print("%s %s median_ns=%.1f n=%d" % (impl, mode, statistics.median(v), len(v)))
for mode in ("latency", "throughput"):
    n = statistics.median(rows[("neon", mode)])
    c = statistics.median(rows[("cand", mode)])
    print("speedup cand/neon %s=%.4f" % (mode, n / c))
PY
