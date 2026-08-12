# Round 0002: SA8D NEON 重排削减的方向审阅

你是 AArch64/编译器优化审阅者。请只读审阅，不要修改仓库；最终建议写入回复。

## 背景

项目：x265 8-bit SA8D 8x8/16x16 的 NEON 超优化，目标相对上游提升 30%
（workload 加权几何平均，latency 主指标，throughput 必须无 >3% 回退）。
三层 IR（SpecIR/PackIR/MachineIR）+ 候选漏斗已可用。

已完成两轮实际优化迭代：

- cand-0001（最终归约改平衡树）：正确；latency +0.8%，throughput -14.4%；
  判定 rejected-performance。结论：N1 上缩短 1 级串行 add 不带来吞吐收益。
- cand-0002（把 add+abs+sabd+s64trn+umax 改为 abs+add）：不正确
  （100k 差分 99911 不一致）；判定 rejected-correctness。结论：trn/umax
  阶段承担必要的 lane 配对，不能按代数直觉直接删。

静态：8x8 核心 116 条指令，24 条 trn/zip 重排（s16×8、s32×8、s64×8），
PMU 80.4 cycles / 115.9 insns per call。

## 请回答

1. 对 cand-0001/cand-0002 结论的反驳或确认。
2. 最可能被遗漏的 correctness/ABI 风险（尤其 lane 配对与 rounding）。
3. 按信息增益排序的 1–3 个下一轮实验，目标：在不破坏 lane provenance 的
   前提下减少 trn/zip；或说明为什么 24 条重排已是接近最优。
4. 连续几轮无收益时的转向/停止门槛建议。
5. 明确区分：事实 / 推断 / 需实验验证。

## 上下文文件（路径已核实）

- `experiments/m4-search/iteration.md`（cand-0001）
- `experiments/m4-search/iteration-0002.md`（cand-0002）
- `experiments/m2-seed/iteration.md`
- `generated/sa8d/roundtrip_sa8d_8x8.cpp`
- `kernels/sa8d/candidates/cand-0001-balanced-reduction.cpp`
- `kernels/sa8d/candidates/cand-0002-abs-add-reduction.cpp`
- `experiments/m2-seed/imported/machine-ir.json`、`pack-ir.json`
- `experiments/m0-foundation/benchmark/summary.csv`
- `experiments/m0-foundation/benchmark/pmu/net-per-call.csv`
- `experiments/m3-cost/static/sa8d-8x8.json`
- `isa/aarch64/sa8d-seed-ops.yaml`
- `docs/03-sa8d-end-to-end.md`、`docs/04-validation-benchmark.md`
