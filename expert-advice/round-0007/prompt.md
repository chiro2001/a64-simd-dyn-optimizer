你是一名 AArch64 SIMD/编译器优化审阅者。请审阅下面这个已完成的实际优化
迭代批次（M13–M22，重点是 M21/M22），并给出下一步方向。只读模式，不要
修改仓库；把最终建议写入回复。

请严格区分三类信息并明确标注：
1. 由仓库文件直接支持的事实；
2. 你的推断；
3. 需要实验验证的建议。

至少回答：

1. 对 M22 的结论和归因提出反驳：
   - 五个结构 rewrite 候选在 N1/920B 全部 <1.05，是否意味着“上游 NEON
     DCT8 局部 peephole 已到下限”，还是我们的搜索空间/成本模型/测量方法
     本身有限制？
   - wide_load 与 tree_to_mla 的编码是否忠实于 M15/M16 原型？若否，差在
     哪里，是否可能因此漏掉本应赢的候选？
2. 最可能遗漏的 correctness/ABI/性能风险（尤其是新加入的 codegen：
   vget_low/high、vtrn1/2q、vmlaq_n 路径）。
3. 按信息增益排序的 1–3 个下一实验。优先考虑：
   a. 用 M16 的 4 组 + M22 的 5 组实测点重拟合逐机器关键路径延迟，并做
      留一法验证排序是否可信；
   b. 需要哪些新的结构化 rewrite 或不同的 DCT8 分解（例如两 pass 之间
      复用、双块 interleave、常量/窄化重排）才有机会达到 tier a +30%；
   c. 在 N+2（SVE2.3、VL=256、4×256）未接入的情况下，SVE256 候选是否
      值得现在做静态/设计层面准备。
4. 若连续无收益，是否应改变 IR/search/cost 方向或停止该 family？给出
   明确的止损/转向判据。
5. 对 M21 的“上游 kernel 通过 x265 内部 test，但全范围 uniform 下 dct8
   0.91%、dct16 0.0035% 分歧”这一发现，从上游报告和项目合同两个角度给
   出处理建议。

背景摘要（详见 context.md 列出的文件）：

- 三档目标：a NEON→NEON N1/920B +30%；b NEON/SVE128→SVE256 N+2 +130%；
  c SVE256→SVE256 N+2 +130%。N+2（鲲鹏 960）尚未接入；920B 无硬件 PMU，
  用 CNTVCT 做 paired 比较。
- M22 把 M15/M16 的 wide-load 与 tree→mla 结构编码为可组合 IR rewrite，
  搜索目录 {widen, shift64, wide_load, tree_to_mla} 枚举 16 候选，5 个
  C-exact 候选实机 paired latency 全部 0.86–1.00（neon/cand median）。
- 成本模型是 family-scoped 的关键路径逐 mnemonic 权重（M19 跨家族排序
  未通过），当前用 M16 的 4 个候选拟合；新候选引入的新 mnemonic 权重
  为零，排序区分度差。
- DCT8 上游 pass2 `vsub_s16` 回绕 bug 已静态检测+自动修复（M14）；用户
  的内部鲲鹏 DCT 参考实现比开源快 30–60%，但未提供反汇编/指令直方图。

请把最终建议写成后续执行 Agent 可以直接采纳的、按优先级排序的清单。
