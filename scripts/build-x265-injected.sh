#!/usr/bin/env bash
# Compile the dynopt kernels directly into an existing x265 static library
# (alternative to LD_PRELOAD; avoids copy-relocation pitfalls entirely).
#
# The script:
#   1. generates candidate .o files + dynopt_patch.o and a unified diff that
#      calls dynopt_patch_primitives() from x265_setup_primitives;
#   2. recompiles only primitives.cpp with that patch, replaces the archive
#      member, and appends the dynopt objects;
#   3. restores pristine primitives.cpp afterwards.
#
# Usage:
#   scripts/build-x265-injected.sh --isa sve1 --kernels sa8d,interp8 \
#       [--build-dir build/x265-8-cross-sve2] [--inject-out build/dynopt-inject]
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ISA=""
KERNELS=""
BUILD_DIR="$ROOT/build/x265-8-cross-sve2"
INJECT_OUT="$ROOT/build/dynopt-inject"

while [ $# -gt 0 ]; do
  case "$1" in
    --isa) ISA="$2"; shift 2 ;;
    --kernels) KERNELS="$2"; shift 2 ;;
    --build-dir) BUILD_DIR="$2"; shift 2 ;;
    --inject-out) INJECT_OUT="$2"; shift 2 ;;
    *) echo "unknown arg: $1" >&2; exit 2 ;;
  esac
done

[ -n "$ISA" ] || { echo "--isa required (sve1|sve2)" >&2; exit 2; }
[ -n "$KERNELS" ] || { echo "--kernels required" >&2; exit 2; }
BUILD_DIR="$(readlink -f "$BUILD_DIR")"
INJECT_OUT="$(readlink -f "$INJECT_OUT")"

PRIM_OBJ="$BUILD_DIR/common/CMakeFiles/common.dir/primitives.cpp.o"
[ -f "$PRIM_OBJ" ] || { echo "no primitives.cpp.o in $BUILD_DIR" >&2; exit 2; }
[ -f "$BUILD_DIR/libx265.a" ] || { echo "no libx265.a in $BUILD_DIR" >&2; exit 2; }

python3 "$ROOT/tools/build_preload_so.py" --isa "$ISA" \
  --kernels "$KERNELS" --inject-outdir "$INJECT_OUT" \
  --workdir "$INJECT_OUT/work"

PRIM="$ROOT/third_party/x265/source/common/primitives.cpp"
BACKUP="$BUILD_DIR/primitives.cpp.dynopt.bak"
cp "$PRIM" "$BACKUP"
restore() { mv -f "$BACKUP" "$PRIM"; }
trap restore EXIT

cd "$ROOT/third_party/x265"
patch -p1 < "$INJECT_OUT/x265-dynopt-setup.patch"
cd "$ROOT"

# Recompile primitives.cpp with the same flags the existing build used.
FLAGS="$BUILD_DIR/common/CMakeFiles/common.dir/flags.make"
CXX_DEFINES="$(sed -n 's/^CXX_DEFINES = //p' "$FLAGS")"
CXX_INCLUDES="$(sed -n 's/^CXX_INCLUDES = //p' "$FLAGS")"
CXX_FLAGS="$(sed -n 's/^CXX_FLAGS = //p' "$FLAGS")"
cd "$BUILD_DIR/common"
aarch64-linux-gnu-g++ ${CXX_DEFINES} ${CXX_INCLUDES} ${CXX_FLAGS} \
  -DENABLE_ASSEMBLY=1 -MD -MT CMakeFiles/common.dir/primitives.cpp.o \
  -MF CMakeFiles/common.dir/primitives.cpp.o.d \
  -o CMakeFiles/common.dir/primitives.cpp.o \
  -c "$PRIM"
cd "$ROOT"

ar r "$BUILD_DIR/libx265.a" "$PRIM_OBJ"
while IFS= read -r obj; do
  [ -n "$obj" ] || continue
  ar r "$BUILD_DIR/libx265.a" "$obj"
done < "$INJECT_OUT/objects.txt"

restore
trap - EXIT
echo "injected $KERNELS into $BUILD_DIR/libx265.a (isa=$ISA)"
echo "primitives.cpp restored; the patched object stays in the archive"

# Self-verify: link a tiny driver against the injected archive and run it.
if [ "$(uname -m)" = "aarch64" ]; then
  CXX_BIN="${CXX:-g++}"
  RUN=("$INJECT_OUT/injected_verify")
else
  CXX_BIN="${CXX:-aarch64-linux-gnu-g++}"
  RUN=(qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2
       "$INJECT_OUT/injected_verify")
fi
"$CXX_BIN" -O2 -std=c++11 -DX265_NS=x265 -DX265_DEPTH=8 -DHIGH_BIT_DEPTH=0 \
  -I "$ROOT/third_party/x265/source" \
  -I "$ROOT/third_party/x265/source/common" -I "$BUILD_DIR" \
  "$ROOT/benchmarks/injected_verify.cpp" \
  -Wl,--start-group "$BUILD_DIR/libx265.a" -Wl,--end-group \
  -lpthread -ldl -o "$INJECT_OUT/injected_verify"
"${RUN[@]}"
