#!/usr/bin/env bash
# AGO M2: build + measure the bounded satd8 cover set (A/B/C) and print
# the pre-registered ranking comparison (see optimizer/ago/TODO-M2.md).
#
# Usage: scripts/bench-ago-satd8-covers.sh [CXX] [BUILD_DIR]
#   CXX       native/cross compiler (default aarch64-linux-gnu-g++)
#   BUILD_DIR x265 build dir with libx265.a (default build/x265-8-cross-make)
#   AGO_LINK_STATIC=0 -> dynamic link
#   AGO_SAMPLES / AGO_BATCH -> microbench args (default 30 / 4096)
#   AGO_REPS -> repetitions per cover (default 3)
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${1:-aarch64-linux-gnu-g++}"
BUILD_DIR="${2:-build/x265-8-cross-make}"
SAMPLES="${AGO_SAMPLES:-30}"
BATCH="${AGO_BATCH:-4096}"
REPS="${AGO_REPS:-3}"
STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-1}" = "0" ]; then
    STATIC_FLAG=""
fi

python3 - <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.covers_satd8 import all_covers, emit_cover
for c in all_covers():
    open("build/ago_satd8_cov%s.cpp" % c, "w").write(
        emit_cover(c, "dynopt_ago_satd8"))
PY

echo "== predictions (N1 timing table) =="
python3 - <<'PY'
import json, sys
sys.path.insert(0, "optimizer")
from ago.covers_satd8 import all_covers, predict_cost
table = json.load(open("benchmarks/neon-timing-n1/timing-n1.json"))
for c in all_covers():
    p = predict_cost(c, table)
    print("%s tput_sum=%s lat_sum=%s" % (c, p["tput_sum"], p["lat_sum"]))
PY

for c in A B C; do
    "$CXX" -O3 $STATIC_FLAG -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
      -DX265_DEPTH=8 -DX265_NS=x265 \
      -I third_party/x265/source -I third_party/x265/source/common \
      -I "$BUILD_DIR" benchmarks/ago_satd8_microbench.cpp \
      "build/ago_satd8_cov${c}.cpp" "$BUILD_DIR/libx265.a" \
      -lpthread -ldl -lnuma -o "build/ago_satd8_cov${c}_bench" \
      >/dev/null 2>&1 || {
        echo "cover $c: BUILD FAILED (missing -lnuma? use AGO_LINK_STATIC=0)";
        exit 1;
      }
done

echo "== verify (20k oracle, per cover) =="
for c in A B C; do
    if [ "${AGO_NATIVE:-0}" = "1" ]; then
        AGO_CXX="$CXX" AGO_NATIVE=1 scripts/verify-ago-satd8.sh --cover "$c" >/dev/null 2>&1 \
          && echo "cover $c: verify PASS" \
          || { echo "cover $c: verify FAIL"; exit 1; }
    else
        AGO_CXX="$CXX" scripts/verify-ago-satd8.sh --cover "$c" >/dev/null 2>&1 \
          && echo "cover $c: verify PASS" \
          || { echo "cover $c: verify FAIL"; exit 1; }
    fi
done

echo "== measured (CNTVCT batch medians) =="
echo "cover,neon_median,cand_medians"
for c in A B C; do
    NEON=$(for _ in $(seq "$REPS"); do
        "build/ago_satd8_cov${c}_bench" neon "$SAMPLES" "$BATCH"
    done | awk -F, '{print $4}' | cut -d= -f2 | sort -n | awk 'NR==2{print}')
    CAND=$(for _ in $(seq "$REPS"); do
        "build/ago_satd8_cov${c}_bench" cand "$SAMPLES" "$BATCH"
    done | awk -F, '{print $4}' | cut -d= -f2 | sort -n | awk 'NR==2{print}')
    echo "$c,$NEON,$CAND"
done
