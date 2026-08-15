#!/usr/bin/env bash
# Build a shape-substituted microbenchmark for older targets (docs/29):
# SVE2/SVE2p1/SVE2p3 instructions are replaced by same-shape instructions
# so the kernel runs on 950 (SVE2) / 920B (SVE1).
# 数值不保真——仅用于 CNTVCT 性能预估，禁止用作正确性验收。
#
# Usage:
#   scripts/build-substituted-microbench.sh <idct16|idct32|dct32> <sve1|sve2>
#       [candidate.cpp] [out]
set -euo pipefail
KERNEL="${1:?usage: ... <idct16|idct32> <sve1|sve2> [out]}"
TARGET="${2:?target sve1 or sve2}"
CAND_OR_OUT="${3:-best_sve2.cpp}"
OUT="${4:-}"
# Backward compatible: 3rd arg was OUT; with 4 args it is candidate source.
if [[ -z "$OUT" && "$CAND_OR_OUT" == *.cpp && -e "$CAND_OR_OUT" ]]; then
  CAND="$CAND_OR_OUT"
  OUT="build/${KERNEL}_microbench_${TARGET}"
elif [[ -z "$OUT" ]]; then
  CAND="best_sve2.cpp"
  OUT="$CAND_OR_OUT"
else
  CAND="$CAND_OR_OUT"
fi
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

case "$KERNEL" in idct16|idct32|dct32) ;; *) echo bad kernel >&2; exit 2 ;; esac
case "$TARGET" in sve1|sve2) ;; *) echo bad target >&2; exit 2 ;; esac

if [[ "$CAND" = /* ]]; then
  SRC="$CAND"
else
  SRC="$ROOT/kernels/${KERNEL}/candidates/${CAND}"
fi
[[ -f "$SRC" ]] || { echo "missing candidate $SRC" >&2; exit 2; }
TMP="$ROOT/build/${KERNEL}_sub_${TARGET}"
mkdir -p "$(dirname "$TMP")"

# Native aarch64 machines (950/920B) may lack the cross prefix; respect
# CXX/AS env overrides (default cross).
CXX_BIN="${CXX:-aarch64-linux-gnu-g++}"
AS_BIN="${AS:-aarch64-linux-gnu-as}"

# 1) C++ -> .S with the full SVE2p1 feature set (inline sdot passes through
#    unassembled; ACLE intrinsics emit sve2 instructions for sve1 target
#    and are rewritten in step 2).
"$CXX_BIN" -O3 -frename-registers \
  --param=sched-pressure-algorithm=1 -march=armv9.4-a+sve2p1 \
  -std=c++11 -S "$SRC" -o "$TMP.s"

# 2) Rewrite unsupported mnemonics + .arch for the target.
python3 "$ROOT/tools/substitute_unsupported.py" "$TMP.s" "$TMP.sub.s" \
  --target "$TARGET"

# 3) Assemble for the target.
if [ "$TARGET" = sve1 ]; then
  ASMARCH="armv8.2-a+sve"
else
  ASMARCH="armv8.2-a+sve2"
fi
"$AS_BIN" -march="$ASMARCH" -o "$TMP.o" "$TMP.sub.s"

# 4) Link the microbenchmark.
"$CXX_BIN" -O2 -static -std=c++11 -march="$ASMARCH" \
  "$ROOT/benchmarks/${KERNEL}_microbench.cpp" "$TMP.o" \
  -Wl,--start-group "$ROOT/build/x265-8-clang-sve/libx265.a" \
  -Wl,--end-group -lpthread -ldl -o "$OUT"
echo "built $OUT (shape-substituted, values NOT exact)"
