#!/usr/bin/env bash
# Idempotent M0 bootstrap for the a64-simd-dyn-optimizer project.
# Installs the documented toolchain on Ubuntu/Debian, ensures the x265
# submodule is present, and records what was installed.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

required=(
  git cmake ninja-build clang llvm lld qemu-user
  z3 jq ripgrep python3-venv python3-pip
  libnuma-dev pkg-config
)

missing=()
for pkg in "${required[@]}"; do
  if ! dpkg-query -W -f='${Status}' "$pkg" 2>/dev/null | grep -q "install ok installed"; then
    missing+=("$pkg")
  fi
done

if [ "${#missing[@]}" -gt 0 ]; then
  echo "[bootstrap] installing: ${missing[*]}"
  sudo apt-get update -qq
  sudo DEBIAN_FRONTEND=noninteractive apt-get install -y -qq "${missing[@]}"
fi

if [ ! -f "$ROOT/third_party/x265/CMakeLists.txt" ] && [ -f "$ROOT/.gitmodules" ]; then
  echo "[bootstrap] initializing x265 submodule"
  git submodule update --init --recursive
fi

if [ ! -d "$ROOT/.venv" ]; then
  echo "[bootstrap] creating python venv"
  python3 -m venv "$ROOT/.venv"
fi

echo "[bootstrap] OK"
scripts/doctor.sh --short
