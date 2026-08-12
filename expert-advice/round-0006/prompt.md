# Round 0006：DCT8 首轮闭环审阅（AArch64/编译器优化）

你是 AArch64 微架构与编译器优化审阅者。本轮覆盖三个实际优化阶段：

1. P1'：真实 VL<256 dispatch 拒绝（sve_dispatch.h + sve_verify.cpp，含
   PR_SVE_SET_VL 的 qemu/native 单位语义分歧）；
2. P2'：鲲鹏 920B SVE256 实机闭环（无硬件 PMU → CNTVCT；SA8D 候选全部
   REJECT，NEON 4×128 与 SVE 2×256 容量相等导致指令减半不换算成周期）；
3. P3'：DCT8 首轮闭环（tier a：NEON→NEON，N1 与 920B 双机）。

请按下列要求，以仓库文件为证据输出建议（不要修改仓库，只把最终建议写入
回复）：

1. 反驳或确认我的两个归因：
   a. 920B SVE 2×256 的每周期位宽容量与 NEON 4×128 相等，SA8D SVE256
      候选的指令减半（16x16 动态 481→257）无法换算成周期收益；
   b. 上游 x265 dct8_neon 与 dct8_c 在 ~0.86% 的 [-255,255] 随机输入上
      不一致（差异都是 64 的倍数，集中在奇数列 k=1/3/5/7 的 j=5/6/7 行），
      而 x265 自身 TestBench（128 迭代）通过——这是上游潜在 bug 还是我的
      harness/oracle 有问题。
2. 最可能遗漏的 correctness/ABI/VL 风险（尤其是 dct8 的 pass1 vrshrn
   饱和窄化合同、候选应匹配 C 参考还是 NEON 基线）。
3. 下一轮按信息增益排序的 1–3 个实验：DCT8 的 NEON→NEON 优化从哪里开始
   （基线数据：N1 上游 NEON 比 C 慢 19%、920B 慢 4%；用户内部参考有
   30–60% 余量）。
4. 若连续无收益，是否应改变 IR/search/cost 方向或停止该 family。
5. 明确区分"由已有文件支持的事实""推断""需要实验验证的建议"。

关键文件（详见 context.md）：experiments/m11-sve-920b/、
experiments/m12-dct8/、candidates/identity.yaml、docs/09、
kernels/dct8/dct8_verify.cpp、benchmarks/dct8_microbench.cpp。
