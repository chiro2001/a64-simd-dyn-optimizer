# round-0007 decision（2026-08-13，主执行 Agent 采纳记录）

采纳以下结论与行动，与当前工作状态对齐：

1. **停止单块 imported-NEON 布局的 opcode peephole**：M22 只覆盖了很薄的
   rewrite 组合（16 个搜索对象只有 4-6 份不同机器码），不能作为 DCT8 局部
   下限的测定。tier-a DCT8 不再投入 rev/zip/mul 级别的 peephole。
2. **成本模型只允许一次"修正依赖图后的重验证"**（P0）：修复 MLA 累加器
   链、d/q/v 与 w/x 别名、multi-dst、栈槽范围后，用两机同构语料做
   leave-one-structure-out；可信门=两机 Spearman ≥0.7 且 top-3 命中 ≥2。
   不过门则永久取消自动精排，退回"安全/静态 Pareto 粗筛 + 全部实测"。
3. **宏结构 family 限两轮、最多 8 份不同 .text**（P1）：优先双块
   interleave 隐藏乘加延迟、pass1 输出直接采用 pass2 消费布局、2 深
   MLA 混合归约、smull/smull2 + rshrn/rshrn2 合并、常量常驻、以及一两个
   新整数分解。保留每个 pass 的 rounding/narrow barrier。
4. **SVE256 只做静态准备**（P2）：双块/四块 pack 是核心设计，不是把单块
   NEON 机械换成 SVE。交付：N+2 特性合同、qemu 正确性、静态资源预算、
   batching 调用点可行性审计；拿到 960 实机前不做完整性能调优。
   本轮已交付 DCT8 双块 pack（`kernels/dct8/dct8x2_sve2.cpp`，
   qemu 20 万例 C-exact）。
5. **止损判据**：tier-a 中心值 <1.05 且 CI 下界 <1.00 即停止 DCT8 family；
   只有 ≥1.30 且全门禁通过才算达成。无内部参考、无合法 batching 调用点、
   无 N+2 时转向其他 hotspot 或 DCT→quant 融合。
6. **M21 措辞修正**：仓库跑的是自建 MBDstHarness 语义复刻器，不是官方
   TestBench executable；所有对外表述改为"通过 MBDstHarness-semantics
   replica"，并补跑官方 transforms TestBench 后再下结论。
7. **C-exact 合同不变**：candidate == C/spec 是硬门；上游 NEON 的 0.87%
   分歧作为已知记录，不据此放宽；如产品需要 legacy-neon-exact，另建合同
   族，不与 C-exact 混用。

> **2026-08-13 被用户决定取代**：正确性合同改为 `upstream-exact`——
> 候选必须与它在 x265 dispatch 中替换的开源 kernel 位级一致；C oracle
> 降级为算法/规格审计层。详见 docs/08-risks-and-decisions.md ADR A009。

下一动作排序：
1. 把 M15 proto_b 的 C-exact 结构（2 深 MLA 归约）移植到 DCT8 双块 SVE256
   pack，作为 P1/P2 交界的最优先静态候选（当前 x2 按上游结构移植，
   2 tile=582 条、每 tile 291 条，仅 1.17x 于上游 341——还有明显余量）；
2. P0 依赖图修复后的一次性成本模型重验证；
3. batching 调用点可行性审计（x265 内是否有连续多块调用点）。
