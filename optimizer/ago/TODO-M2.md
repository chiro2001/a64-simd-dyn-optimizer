# M2：第二个数据流锚点 + 有界 cover 搜索 + 留出集代价排序
# （round-0023 范围，round-0024 拆分为 foundation + expanded）

## 目标

不追求第二个 kernel 的加速；证明 AGO 流水线能端到端复现第二个
数据流形状（SATD 8x8，4x4 象限结构），并建立**可验证的排序工具**
（候选清单 → final-object 特征 → 噪声探针 → 留出排序门）。

round-0024 拆分为：

- **M2-foundation（已完成，提交 21860a7/5f9ae14）**：satd8 锚点复现 +
  A/B/C 尾部 cover 冒烟排序门（2 个可分辨对，N1/920B PASS）；
  该结果是 foundation，**不构成通用排序声称**。
- **M2-expanded（剩余验收）**：语料扩到 region/形状/cover 多样性，
  按 round-0024 协议预注册正式排序门。

## M2-foundation 任务（satd8 8x8，已完成）

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
- [x] N1 / 920B 实机 paired：N1 0.983、920B 0.995（噪声带内复现）。

## 有界 cover 搜索与排序门（M2-foundation 已完成，见报告）

- [x] A/B/C 尾部 cover（共享前缀，全部 20k oracle 通过）；
- [x] 冒烟预测（N1 表 tput 和）与 N1/920B CNTVCT 实测；
- [x] 结果：reports/ago-m2-satd8-covers-20260816.txt。

## M2-expanded（进行中，round-0024 协议）

### 第一步：候选清单 + final-object 特征 + 噪声探针

- [x] 建立不可变候选 manifest：contract hash、region/node ID、模板
  参数、ISA、编译器版本/flags、源与 final-object hash、验证证据；
- [x] final-object 特征提取：反汇编指令数、按类计数、对象 hash
  spill/reload 计数、对象 hash 去重（同对象不算多样性）；
- [x] N1/920B 基线-自对比噪声探针（2026-08-16，12 次独立启动、
  batch=4096、taskset 单核）：
  - q_N1 = 0.0000 → MDE_N1 = 1%（floor）；
  - q_920b = 0.0009 → MDE_920b = 1%（floor）；
  - 共享节点当前安静；若后续 MDE >5% 记 inconclusive-noise。

### 第二步：扩大的留出排序门（数值在探针后冻结）

- [x] 语料：17 实例（satd8 8x8 A-E、8x4/8x16/16x8 A-C、sa8d8 A-C），
  17 个唯一 final object，全部 20k oracle 通过；
- [x] 解析代价模型（round-0024 公式）：predicted = max(CP,
  Σ insn_count*recip_throughput) + spill；基于 final-object 特征；
- [x] 预注册指标全部满足：N1 81 对 acc=0.975（bootstrap 下界 0.913）、
  tau=0.951、regret=1.0% → PASS；920B 80 对 acc=1.000 → PASS；
- [x] 920B transfer：N1 表预测 vs 920B 实测 80 对 acc=1.000 →
  transfer PASS（reports/ago-m2-expanded-ranking-20260816.txt）；
- [x] 边界记录：语料为 cover 级、新形状 IR 锚点未建、绝对周期偏高、
  微基准无完整 CI 协议（报告 §结论）。

### 并行：N1 成本模型校准（实验 2）

- [ ] 手写 asm 单指令延迟链 + 独立链饱和扫描（1/2/4/8 链）+ mixed-op
  资源矩阵；matched empty loop；保存反汇编与事件缩放；
- [ ] 提取 LLVM AArch64SchedNeoverseN1.td 与 GCC N1 DFA 记录为内部
  统一表（不平均两源，保留分歧与 uncertainty 标记）；
- [ ] 只标定语料用到的 opcode 类，在留出序列上验证；
- [ ] 920B 保持 on-target 配对更新，不用 N1 权重改写 920B 表。

## M3+（计划）

- 显式 loop/FSM 模板（PEXT、DFA、全展开）沉淀为 pass/模板；
- AGO 接入 `--backend ago` 注入/冻结，双目标达标后过渡。
