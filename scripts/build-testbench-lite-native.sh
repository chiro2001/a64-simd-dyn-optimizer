#!/usr/bin/env bash
# Native (non-QEMU) testbench-lite gate for a target aarch64 machine.
# Usage: scripts/build-testbench-lite-native.sh <candidate.o> <outdir> [-- seed]
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
export CXX="${CXX:-g++}"
export RUN_MODE=native
exec scripts/build-testbench-lite.sh "$@"
