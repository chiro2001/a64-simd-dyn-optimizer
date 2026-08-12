#!/usr/bin/env bash
# Idempotent bootstrap for openEuler (Kunpeng 920B) hosts.
#
# The 920B cloud instance is an SVE1 / VL=256 correctness-and-PMU host, not a
# development host, so this installs only what the closed loop needs: native
# GCC 12, CMake/Ninja for the unmodified x265 NEON baseline, git for repo
# sync, perf for paired PMU, and libasan/libubsan for the remaining sanitizer
# gates. Local x86 remains the primary build host (cross g++ + qemu-aarch64).
set -euo pipefail

PKGS=(
  gcc gcc-c++ make
  cmake ninja-build
  git
  perf
  numactl-libs numactl-devel
  libasan libubsan
  python3
)

echo "[bootstrap-openEuler] installing: ${PKGS[*]}"
sudo dnf install -y "${PKGS[@]}"

echo "[bootstrap-openEuler] toolchain versions"
gcc --version | head -1
g++ --version | head -1
cmake --version | head -1
ninja --version
perf --version | head -1
echo "[bootstrap-openEuler] OK"
