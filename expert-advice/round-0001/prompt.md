# Round 0001: AArch64 NEON SA8D 超优化方向审阅

你是 AArch64/编译器优化审阅者。请只读审阅，不要修改仓库；最终建议写入回复。

## 背景

项目目标：把 x265 的 NEON/SVE kernel 抽象为 SpecIR/PackIR/MachineIR 三层 IR，
用搜索/验证流水线生成更快且 bit-exact 的候选。当前聚焦 8-bit SA8D 8x8/16x16，
目标相对同机 x265 上游 NEON 提升 30%（workload 加权几何平均）。

已完成：

- M0：冻结 x265（b81f650e）、NEON 基线（8x8 26.2ns/call，PMU 80.4 cycles / 115.9 insns）。
- M1：canonical SpecIR + C++/Python 双解释器，百万级差分 + Z3 range proof 全过。
- M2：LLVM IR 导入 MachineIR（167 节点），PackIR 全 lane provenance，
  roundtrip codegen 与上游静态指令完全一致（116 insns），10 万例差分零 mismatch。
- M3：AArch64 指令语义库 + 静态分类：8x8 核心 24/116 条是 trn/zip 重排。
- M4 首个候选：把最后 3 级串行 add 改为平衡树；正确、实测 +0.21%，未达阈值。

## 本轮结果（cand-0001）

- 正确性：100,000 例 c/neon/cand 一致。
- 性能：upstream 113481.0 ns/batch vs cand 113240.0 ns/batch（+0.21%）。
- 静态：指令数与上游完全相同。

## 请回答

1. 反驳或确认本轮归因（关键路径 vs 吞吐/发射宽度）。
2. 最可能被遗漏的 correctness/ABI/VL 风险（本候选与后续布局搜索）。
3. 按信息增益排序的 1–3 个下一轮实验，重点针对 24 条 trn/zip 重排。
4. 若连续几轮无收益，何时应改变 IR/搜索/成本方向或停止 SA8D family。
5. 明确区分：由已有文件支持的事实、你的推断、需要实验验证的建议。

## 上下文文件

- `experiments/m4-search/iteration.md`
- `experiments/m2-seed/iteration.md`
- `generated/sa8d/roundtrip_sa8d_8x8.cpp`
- `kernels/sa8d/candidates/cand-0001-balanced-reduction.cpp`
- `experiments/m2-seed/imported/machine-ir.json`、`pack-ir.json`
- `experiments/m0-foundation/benchmark/summary.csv`、`pmu/net-per-call.csv`
- `experiments/m3-cost/static/sa8d-8x8.json`、`pixel-sa8d-16x16.json`
- `isa/aarch64/sa8d-seed-ops.yaml`
- `docs/02-system-architecture.md`、`docs/03-sa8d-end-to-end.md`、
  `docs/04-validation-benchmark.md`、`docs/05-roadmap.md`
