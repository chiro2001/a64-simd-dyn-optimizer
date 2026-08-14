#!/usr/bin/env bash
# Build a shape-substituted interp8 path-B (sdot.h, SVE2p3) microbench for
# older targets (docs/29, docs/32 §4.5): sdot.h -> sdot.s (BtoS), addp/
# sqrshrunb kept for sve2 (950 native), addp replaced for sve1 (920B).
# 数值不保真——仅用于 CNTVCT 性能预估，禁止用作正确性验收。
#
# Usage:
#   build-interp8-substituted-microbench.sh <8|16|32> <sve1|sve2> [out]
set -euo pipefail

SHAPE="${1:?usage: ... <8|16|32> <sve1|sve2> [out]}"
TARGET="${2:?target sve1 or sve2}"
OUT="${3:-build/interp8_${SHAPE}_mb_${TARGET}}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"

case "$SHAPE" in 8|16|32) ;; *) echo "bad shape" >&2; exit 2 ;; esac
case "$TARGET" in sve1|sve2) ;; *) echo "bad target" >&2; exit 2 ;; esac

if [ "$SHAPE" = 8 ]; then
  SRC="$ROOT/kernels/interp8/candidates/best_sve2_sdoth.cpp"
else
  SRC="$ROOT/kernels/interp8/candidates/best_sve2_sdoth_${SHAPE}x${SHAPE}.cpp"
fi
SYM="dynopt_interp8_${SHAPE}x${SHAPE}_sve2_sdoth"
TMP="$ROOT/build/interp8_${SHAPE}_sub_${TARGET}"
mkdir -p "$(dirname "$TMP")"

CXX_BIN="${CXX:-aarch64-linux-gnu-g++}"
AS_BIN="${AS:-aarch64-linux-gnu-as}"
BUILD="${BUILD:-build/x265-8-clang-sve}"
CONFIG_DIR=""
for d in "$ROOT/$BUILD" "$ROOT/build/x265-8-cross-make" \
         "$ROOT/build/x265-8-testbench"; do
  if [ -f "$d/x265_config.h" ]; then
    CONFIG_DIR="$d"
    break
  fi
done
[ -n "$CONFIG_DIR" ] || { echo "x265_config.h not found" >&2; exit 2; }

# sve1 (920B) has no addp: regenerate the candidate with the uzp pair-sum
# baseline (docs/22 §5.7 note), so the substitute stream stays SVE1-legal.
if [ "$TARGET" = sve1 ]; then
  SRC="$TMP.uzp.cpp"
  python3 "$ROOT/tools/emit_interp8_sve2_shared.py" "$SRC" \
    --compute sdot-h --n "$SHAPE" --pairsum uzp
fi

# 1) C++ -> .S with the full SVE2p3 feature set.
"$CXX_BIN" -O3 -march=armv9.5-a+sve2p3 -std=c++11 -S "$SRC" -o "$TMP.s"

# 2) Rewrite unsupported mnemonics + .arch.
python3 "$ROOT/tools/substitute_unsupported.py" "$TMP.s" "$TMP.sub.s" \
  --target "$TARGET"

# 3) Assemble for the target.
if [ "$TARGET" = sve1 ]; then
  ASMARCH="armv8.2-a+sve"
else
  ASMARCH="armv8.2-a+sve2"
fi
"$AS_BIN" -march="$ASMARCH" -o "$TMP.o" "$TMP.sub.s"

# 4) Link the interp8 microbench (16x16 uses DYNOPT_CANDIDATE16).
"$CXX_BIN" -O2 -static -std=c++11 -march="$ASMARCH" \
  -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 -DX265_NS=x265 \
  -DDYNOPT_CANDIDATE="$SYM" \
  -DDYNOPT_CANDIDATE16="$SYM" \
  -I "$ROOT/third_party/x265/source" \
  -I "$ROOT/third_party/x265/source/common" \
  -I "$CONFIG_DIR" \
  "$ROOT/benchmarks/interp8_microbench.cpp" "$TMP.o" \
  "$ROOT/$BUILD/libx265.a" -lpthread -ldl \
  -o "$OUT"
echo "built $OUT (shape ${SHAPE}x${SHAPE}, target $TARGET, symbol $SYM)"
