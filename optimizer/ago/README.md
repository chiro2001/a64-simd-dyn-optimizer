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
- M2-foundation 完成（21860a7 / 5f9ae14），M2-expanded 排序门通过
  （N1 81 对 acc=0.975、tau=0.951；920B 80 对 acc=1.000；N1 表
  transfer 到 920B acc=1.000；报告
  reports/ago-m2-expanded-ranking-20260816.txt）；
- 新增 manifest / objfeatures / predict：候选清单、final-object
  特征与 max(CP, tput) 解析预测；covers_satd_shapes：8x4/8x16/16x8
  cover 发射器；tools/ago_m2_corpus.py + scripts/ago-m2-gate.sh：
  语料构建与正式排序门；
- round-0024 咨询完成（response.md + decision.md），pass 管线已按
  “phase-once + 固定点校验”对齐。

## M3（进行中）

- 规则/模板协议：`rules.py`（Pattern/RewriteRule/CoverTemplate/
  Verifier + ProofObligations）；
- PEXT 4-bit 查表模板：3^16 穷举 bad=0、scanPosLast 20k 差分双机
  bad=0、微基准 N1 1.6x / 920B 2.2x；
- DFA 状态表模板：5x3x256 穷举 bad=0、costCoeffRemain 20k 差分双机
  bad=0、微基准 N1 1.24x / 920B 1.38x；
- 发射器（scan/remain）已改为委托 AGO 模板，输出与冻结候选逐字节
  一致。
