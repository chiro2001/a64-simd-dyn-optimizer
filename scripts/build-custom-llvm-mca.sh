#!/usr/bin/env bash
# Build llvm-mca with the sdot_z32 (SVE2p1) scheduling patch.
#
# Stock llvm-mca has no scheduling entry for `sdot z.s,z.h,z.h`
# (SDOT_ZZZ_HtoS / SDOT_ZZZI_HtoS, SVE2p1) nor `sdot z.h,z.b,z.b`
# (SDOT_ZZZ_BtoH, SVE2p3) in any AArch64 model, so sdot candidates
# cannot be MCA-evaluated. The patch adds them to Neoverse-V2 with the
# project's dot-pipe model (4c V02, read-advance 3, docs/26).
#
# Usage: scripts/build-custom-llvm-mca.sh [src_dir] [jobs]
#   src_dir defaults to /tmp/llvm-project-llvmorg-22.1.8 and is downloaded
#   (via proxy 127.0.0.1:14514) if absent. Output binary:
#   $src_dir/build-mca/bin/llvm-mca
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PATCH="$ROOT/patches/llvm-22.1.8-aarch64-sdot-z32-sched.patch"
VER="llvmorg-22.1.8"
DIR="llvm-project-$VER"
SRC="${1:-/tmp/$DIR}"
JOBS="${2:-8}"

if [ ! -d "$SRC/llvm" ]; then
    echo "downloading LLVM $VER ..." >&2
    curl -x http://127.0.0.1:14514 -L -o "/tmp/$VER.tar.gz" \
        "https://github.com/llvm/llvm-project/archive/refs/tags/$VER.tar.gz"
    tar xzf "/tmp/$VER.tar.gz" -C /tmp
    SRC="/tmp/$DIR"
fi

cd "$SRC"
if ! patch -p1 --dry-run < "$PATCH" >/dev/null 2>&1; then
    patch -p1 < "$PATCH"
fi

cmake -S llvm -B build-mca -DCMAKE_BUILD_TYPE=Release \
    -DLLVM_TARGETS_TO_BUILD=AArch64
cmake --build build-mca --target llvm-mca -j"$JOBS"
echo "custom llvm-mca: $SRC/build-mca/bin/llvm-mca"
