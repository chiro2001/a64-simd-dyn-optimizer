#!/usr/bin/env bash
# AGO M3 DFA template gate (round-0024): exhaustive finite-domain proof
# of the (goRice x phase x value) table vs the reference formula
# (5x3x256 = 3840 entries), plus the costCoeffRemain 20k differential
# against x265 primitives.
#
# Usage: scripts/verify-ago-dfa.sh [--cxx CXX] [--qemu QEMU]
#   AGO_NATIVE=1  run built binaries directly (native aarch64)
#   AGO_LINK_STATIC=0  dynamic link
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

CXX="${AGO_CXX:-aarch64-linux-gnu-g++}"
QEMU="${AGO_QEMU:-build/qemu-build/qemu-aarch64}"
BUILD_DIR="${AGO_LIB_DIR:-build/x265-8-cross-make}"
WORK="$(mktemp -d /tmp/ago-dfa.XXXXXX)"
trap 'rm -rf "$WORK"' EXIT

python3 - "$WORK/proof.cpp" <<'PY'
import sys
sys.path.insert(0, "optimizer")
from ago.templates.dfa_table import proof_c_source
open(sys.argv[1], "w").write(proof_c_source())
PY

STATIC_FLAG="-static"
if [ "${AGO_LINK_STATIC:-${AGO_STATIC:-1}}" = "0" ]; then
    STATIC_FLAG=""
fi

"$CXX" -O2 $STATIC_FLAG -std=c++11 "$WORK/proof.cpp" -o "$WORK/proof" \
  2>&1 | head -5
if [ "${AGO_NATIVE:-0}" = "1" ]; then
    "$WORK/proof"
else
    "$QEMU" -L /usr/aarch64-linux-gnu "$WORK/proof"
fi

# 20k differential vs x265 primitives.costCoeffRemain
if [ -f "$BUILD_DIR/libx265.a" ]; then
    python3 - "$WORK/dfa.cpp" <<'PY'
import os, sys
sys.path.insert(0, os.path.join(os.getcwd(), "tools"))
sys.path.insert(0, os.path.join(os.getcwd(), "optimizer"))
from ago.templates.dfa_table import emit_dfa
open(sys.argv[1], "w").write(emit_dfa("dynopt_cost_coeff_remain_sve2"))
PY
    if "$CXX" -O3 $STATIC_FLAG -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 \
        -DX265_DEPTH=8 -DX265_NS=x265 \
        -I third_party/x265/source -I third_party/x265/source/common \
        -I "$BUILD_DIR" benchmarks/cost_remain_verify.cpp "$WORK/dfa.cpp" \
        "$BUILD_DIR/libx265.a" -lpthread -ldl -lnuma \
        -o "$WORK/remain_verify" >/dev/null 2>&1; then
        if [ "${AGO_NATIVE:-0}" = "1" ]; then
            "$WORK/remain_verify"
        else
            "$QEMU" -L /usr/aarch64-linux-gnu "$WORK/remain_verify"
        fi
    else
        echo "remain_verify: SKIP (link needs libnuma / x265 lib)"
    fi
else
    echo "remain_verify: SKIP (no $BUILD_DIR/libx265.a)"
fi
