# AGO (AArch64 SIMD Graph Optimizer)

Round-0023 规划（docs/52）：自动建图 → pass 管线 → 目标机代价指令选择
→ 真机反馈。当前状态：**M0/M1 完成，M2（第二个数据流锚点 satd8 8x8
+ 有界 cover 搜索 + 留出集代价排序）进行中**。

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
- `TODO-M0.md`：M0 垂直切片任务清单（已完成）；
- `TODO-M2.md`：M2 第二个锚点与 cover 搜索/排序任务清单。

## 状态

2026-08-16：
- M0 验收通过（SA8D 8x8，N1 0.985 / 920B 1.006，0 失配，提交 86ff2df）；
- M1 通过（受限 DSL 前端 + pass 管线，提交 43dfc7e / 1accad9）；
- M2 锚点进行中：satd8 8x8 契约/图/cover/20k 门禁/paired 微基准就绪；
- round-0024 规划咨询已异步启动。
