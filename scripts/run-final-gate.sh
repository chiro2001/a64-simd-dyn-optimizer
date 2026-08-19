#!/usr/bin/env bash
# run-final-gate.sh -- 内网/目标机终验入口（docs/87 step 8, docs/95）。
# 等价调用 tools/final_gate.py；本脚本定位"内网只跑一条命令"。
set -u
cd "$(dirname "$0")/.."
python3 tools/final_gate.py "$@"
