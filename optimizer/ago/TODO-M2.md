# M2：第二个数据流锚点 + 有界 cover 搜索 + 留出集代价排序（round-0023）

## 目标

不追求第二个 kernel 的加速；证明 AGO 流水线能端到端复现第二个
数据流形状（SATD 8x8，4x4 象限结构），并为同一张图生成 2-3 个合法
NEON cover，用 N1/920B 指令成本表预测排序，在留出集上验证排序质量。

## 锚点任务（satd8 8x8）

- [x] 数值一致性预检：C `satd8<8,8>`（两段 SWAR `satd_8x4`）与上游
  NEON `pixel_satd_8x8_neon` 20k 随机模拟 0 失配；
- [x] 语义契约：`optimizer/ago/contracts/satd8.py`；
- [x] 导入图：`optimizer/ago/graphs/satd8_graph.py`（两半 4x4 象限，
  不用 8 点 hadamard_v）；
- [x] DSL 前端：`hadamard4_v` / `hadamard4_h_abs` / `max` 语句，
  `SATD8_DSL` 与手工图结构逐节点一致；
- [x] cover：`cover_neon.py` 输出上游 NEON 指令数据流
  （load_diff -> hadamard_4x4_quad -> vaddq -> vaddlvq）；
- [x] 20k oracle 门禁：`scripts/verify-ago-satd8.sh`（bad=0）；
- [x] paired 微基准：`benchmarks/ago_satd8_microbench.cpp` +
  `scripts/build-ago-satd8-bench.sh`；
- [ ] N1 / 920B 实机 paired（目标：先复现，不要求更快）。

## 有界 cover 搜索与排序门（进行中）

- [ ] 同一 satd8 图生成 2-3 个合法 NEON cover（如 reduction 形状、
  转置/配对顺序、abs/add vs abd 变体），全部先过 20k oracle；
- [ ] 用 `benchmarks/neon-timing-n1/timing-n1.json` 与 920B 表对
  cover 排序（指令数 + 关键路径 + 吞吐下界）；
- [ ] 预注册排序质量门：候选语料收集完后，固定噪声协议（N1 PMU /
  920B CNTVCT batch 中位）与阈值，再评测；
- [ ] 结果落 reports/，提交并推送。

## M3+（计划）

- 显式 loop/FSM 模板（PEXT、DFA、全展开）沉淀为 pass/模板；
- AGO 接入 `--backend ago` 注入/冻结，双目标达标后过渡。
