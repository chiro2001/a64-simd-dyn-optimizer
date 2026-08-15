# AGO (AArch64 SIMD Graph Optimizer)

Round-0023 规划（docs/52）：自动建图 → pass 管线 → 目标机代价指令选择
→ 真机反馈。当前处于 **M0：SA8D 8x8 垂直切片**。

## 语义权威原则（round-0023 P0）

- 契约 + 规范 DSL/受限 C 自语义是语义权威；intrinsics/汇编/反汇编/trace
  只是证据。
- 验证时机：导入后、每个有风险 rewrite 后、lowering 后；性能反馈不得
  覆盖未关闭的正确性义务。
- Pass：phase ordering + 可执行前后检查 + 确定性规范哈希 + 递减度量 +
  循环检测 + 硬预算（不用全局固定点）。
- 指令选择：有界 region → layout → cover → schedule → allocation；上游
  MachineIR 基线始终可选中。
- Lowering：intrinsic/DSL 与直接汇编两条都保留；最终链接对象反汇编与
  spill 是门禁。
- 代价模型：N1 与 920B 分表；residual 不得改写单指令延迟/吞吐。

## 目录

- `ir.py`：最小类型化 IR 契约（Shape/Op/Graph/contract_hash）。
- `TODO-M0.md`：垂直切片任务清单。

## 状态

2026-08-16：规划与咨询完成（expert-advice/round-0023），骨架建立，M0
待执行。
