# round-0012 上下文（批：DCT32 v3/v3.1 + interp8 管线 + 内部指标提炼）

本批自 round-0011 后完成的主要阶段（均已提交并推送 github/origin）：

1. `40c5f58` DCT32 v3：4 行切片 + lane-per-output `sdot .d` +
   `uzp1_s32+rshrnb+uzp1_s16` 批量窄化，fused_uop 7190→4266
   （0.336x，HALVED），upstream-exact 200k 差分 0、lite PASS。
2. `251df87` DCT32 v3.1：k≡2 pass1 同构切片，4266→3962（0.312x），
   正式超越内部参考 4251/4827（同口径，scatter 对我们禁用）。
3. `c1428d2` + `f12e216` interp8 方案 A：SVE2-safe 切片管线
   141→134→127 fused_uop（-10%），3 相位 2 万例差分 0；方案 B
   （SVE2p3 `sdot .h`，预估 -35%）被 QEMU 11.0.3 SIGILL 阻塞。

## 关键事实（仓库内可查证）

- 指标口径：`fused_uop = fused_adj + 3×scatter`；gather/scatter 禁用；
  movprfx 视为与下一指令融合（不单独计）。128-bit 上游基线在 SVE256
  下必须减半才算收益（halve_gate 已落进搜索输出）。
- DCT32 上游 12710 → 工具 v3.1 3962（0.312x）；DCT16 legacy 704 vs
  内部 827；sa8d16 189（0.507x，结构地板）；sa8d8 79（NO）；interp8
  127（-10%）。
- 内部参考只在本机 /tmp 评估（docs/18、docs/20 有聚合指标：指令构成
  直方图与计数，无代码）。**严禁读取 /tmp 内部 kernel 文件。**
- 实机：960 未流片；920B 为 SVE1（无法跑 SVE2）；内部保密机型 950/
  920G（SVE2 2×256）的 DCT16 cycles 数据见 docs/11 §6（匿名化）。
- QEMU 11.0.3 `-cpu max` 无 SVE2p3；`sdot .h` 需更新 QEMU/新实机。
- 验收：黄金标准是 x265 TestBench（DCT16 全量已过）；其余 kernel 用
  TestBenchLite（`scripts/build-testbench-lite.sh`）；正确性合同
  upstream-exact（与开源 kernel 位级一致，不要求 C-exact）。

## 请重点阅读

- docs/18-internal-dct-evaluation.md（内部 DCT16/DCT32 聚合指标与
  已提炼方向）
- docs/20-dct32-optimization-assessment.md（v3/v3.1 机制与归因）
- docs/22-interp8-assessment.md（方案 A/B 与 SVE2p3 阻塞）
- docs/11-status-and-decision.md（全项目状态与决策）
- docs/21-dct32-pass-through-design.md（partial 直通否决证据）
- tools/search_sve2_layouts.py、tools/emit_dct32_sve2_shared.py、
  tools/emit_dct16_sve2_shared.py、tools/emit_interp8_sve2_shared.py
- kernels/dct32/manifest.yaml、kernels/interp8/manifest.yaml
- experiments/m30-dct16-search/iteration.md（工具链闭环主记录）

## 启动命令（本 round 实际使用）

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s workspace-write \
  -C "$PWD" \
  exec -o expert-advice/round-0012/response.md \
  - < expert-advice/round-0012/prompt.md
```

后台运行，主模型继续前台工作；落盘后在下一次自然检查点写
`decision.md`。
