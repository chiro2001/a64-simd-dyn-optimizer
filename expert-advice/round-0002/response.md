## 总判定

- cand-0001：确认“不接受”；反驳其性能归因和泛化结论。算术变换本身正确，但现有测量不足以证明 14.4% 回退来自寄存器或发射资源。
- cand-0002：确认 correctness rejection；反驳“因此 8 条 s64 重排不可删除”。失败的是一个错误代数替换及其缩放，不是重排削减方向。
- 24 条重排只在“完整物化 8×8 转置、限用普通双输入 shuffle”的受限模型下接近下界；对最终仅观察绝对值总和的 SA8D，尚不能称全局接近最优。

以下用“事实 / 推断 / 需实验”明确区分。

## 1. cand-0001 / cand-0002

### cand-0001

- 事实：末端四向量求和只改变结合顺序。AArch64 s16 `ADD` 是模 \(2^{16}\) 加法，结合律成立，因此这个算术重写可形式化确认 bit-exact；10 万例零差异与此一致。
- 事实：报告的 latency 仅 1.008×，低于预注册 1.03 接受线；若 throughput 0.8856×被可靠复现，也必然触发 3% 门禁。因此“不接受”是合理的保守决定。
- 事实：当前脚本先连续跑完所有 neon，再跑 candidate，没有随机化成对次序、bootstrap CI、进程噪声门控，也没有归档 candidate 汇编、原始 CSV 或 candidate PMU。[test-candidate.sh](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/test-candidate.sh:41) 与项目自己的成对规范不一致。
- 事实：“throughput”循环仍是四次顺序间接函数调用，而且访问固定顺序的大 corpus；“latency”则用前次结果选择下一输入。[sa8d_microbench.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/sa8d_microbench.cpp:127) 因此二者也混入不同缓存行为。
- 推断：+0.8% 不能证明实机关键路径收益；-14.4% 更不能直接归因于“寄存器/发射资源竞争”。源级 DAG 确实少一级依赖，但必须从最终汇编和 PMU 验证。
- 需实验：把 cand-0001 作为 benchmark sanity control 重跑一次即可，不值得继续优化它。要求 randomized paired A/B、相同输入流、原始样本、95% CI、最终汇编及 cycles/instructions。

### cand-0002

- 事实：候选把原来的 `abs(x+y)` / `abs(x-y)` 路径换成了 `abs(x)+abs(y)`，[cand-0002](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/candidates/cand-0002-abs-add-reduction.cpp:105)。这不是成立的恒等式。
- 事实：真正相关的恒等式是：

  \[
  |p+q|+|p-q|=2\max(|p|,|q|)
  \]

  当前 s64 `zip/trn + umax` 是把低、高清晰对应的 \(p,q\) 对齐，然后保存右侧的“半尺度”结果。
- 事实：因此当前末端使用 `(half_sum + 1) >> 1`；若改为显式完整绝对值和，则必须恢复 `(R8 + 2) >> 2`。cand-0002 保留了旧缩放和 rounding，[roundtrip](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/roundtrip_sa8d_8x8.cpp:124)。
- 推断：99911/100000 不一致同时反映错误配对、错误恒等式和未更新尺度；不能据此推出 8 条 s64 shuffle 必需。

## 2. 最可能遗漏的 correctness / ABI 风险

按严重性排序：

1. **验证器可能给布局搜索错误信心。**

   - 事实：[semantics.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/targets/aarch64/semantics.py:32) 的 `trn/zip` 掩码只适用于 8×s16；实际以 4×s32 或 2×s64 调用会越界。
   - 事实：[interp.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/interp.py:112) 用有符号 Python `max` 模拟 `umax`，而指令是 unsigned max。seed 的非负小范围恰好掩盖了问题。
   - 事实：PackIR verifier 只检查“有注释”和 MachineIR 值覆盖，不递归检查引用、lane 边界或最终语义等价，[pack_ir.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/pack_ir.py:16)。文本生成的两个 candidate 也没有 candidate PackIR。
   - 需实验：在任何新布局候选前，先用真实 8/4/2 lane 指令语义测试，并比较候选最终标量；不能只比较“149 个值都有 provenance”。

2. **provenance 等价条件定义过强或过弱。**

   - 推断：SA8D 最终允许系数换序和逐系数变号，因为之后是 `abs + sum`；要求中间向量逐 lane 完全相同会误拒合法布局。反过来，只检查元素都还存在又会接受错误配对。
   - 需实验：把末端 lane 标成 `(ky,kx,sign,scale)`，比较 64 个系数的多重集或最终精确标量，并显式记录当前是 `R8` 还是 `R8/2`。

3. **rounding boundary。**

   - 事实：8×8 是 `(R8+2)>>2`；16×16 必须先累加四个未舍入的 R8，再舍入一次，[spec.py](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/spec.py:96)。四个已舍入 8×8 返回值不能相加。
   - 事实：PackIR 当前没有覆盖最终 scalar `lshr`，因此单靠 PackIR 无法保护 rounding。
   - 事实：SpecIR 文本还写着“32×32 sums rounded 8×8”，与 canonical 实现的 16×16 分块不一致，[spec_ir.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/spec_ir.py:40)，说明尺度元数据已有漂移。
   - 需实验：为 raw-R8、half-R8、rounded-8×8、raw-16×16 使用不同类型/节点，禁止隐式互换。

4. **s16 wrap 与 `INT16_MIN`。**

   - 事实：已有证明覆盖 canonical 8-bit 最终系数 `|T|≤16320`，但这不自动证明任意重排后的所有中间 add/sub 和逐 lane 累加均不溢出。
   - 需实验：每个候选重新证明所有 `abs/sabd` 输入、所有 u16 lane accumulator 和 scalar reduction 的范围；不能只复用全局 R8 上界。

5. **ABI/集成。**

   - 推断：当前 intrinsics 叶函数由编译器生成，AAPCS64 风险较低；真正风险在将来手写汇编或 raw-16×16 helper。
   - 需验证：函数指针签名和 8-bit dispatch、正 stride 合同、非对齐与无 over-read；手写汇编还须保存 x19–x29、v8–v15 的 ABI 保留部分、保持 SP 16-byte 对齐，并满足构建所用 BTI/branch-protection。现有每轮 10 万随机测试没有对 candidate 跑 guard page、sanitizer、TestBench 或真实 x265 注入。

## 3. 下一轮实验，按信息增益排序

先设一个不计作优化轮次的“零号门禁”：修正 8/4/2 lane 语义、unsigned `umax`、scale/rounding 标记，并把 cand-0002 的最小反例加入固定 corpus。

1. **重排 Hadamard bit-stage，使最后一对变成相邻 lane，再用 `UMAXP`。**

   当前最后的 \(p,q\) 位于相隔四个 s16 lane 的低/高半区，所以每组需要 `zip1 + zip2 + umax`。Walsh-Hadamard 的三个 bit-stage 可以换序；尝试让最后未决 stage 对应相邻 lane，然后用一条 pairwise unsigned max `UMAXP` 同时压缩两个向量。

   - 需实验：四组若都成立，可把 4×3=12 条变为 4 条，条件性净减 8 条，并保持现有 half-R8 及 `(sum+1)>>1`。
   - 这是对 cand-0002 过度结论最直接的证伪实验。

2. **对 `v64` 到 `uaddlv` 做局部精确布局综合。**

   枚举 6 种 Hadamard stage 顺序及对称等价的 ky packing，允许 `trn/zip/uzp/ext/rev`、`add/sub/abs/sabd/umax/umaxp/addp/uaddlp`。等价目标应是最终标量或带符号/换序容忍的 64 系数多重集，而非 seed 的逐 lane 布局。成本同时计 N1 实测 latency/throughput、峰值 live vector 和 spill。

3. **做受限下界与实机因果确认。**

   - 对上述允许指令集，尝试证明低于某个 permute/总成本预算无解。
   - 对 top candidates 保存最终 linked disassembly、PMU cycles/instructions，并做 randomized paired benchmark；同时放入“字节等价函数”和 cand-0001 作为测量控制。
   - 若只允许完整物化 8×8 s16 transpose 和普通双输入 shuffle，三层×每层8输出得到24条是很自然的受限下界；只有把 pairwise/fused reduction 也纳入仍无法降低，才能称“接近最优”。

## 4. 转向 / 停止门槛

当前两轮不应算作“两次有效无收益”：cand-0001 性能证据不完整，cand-0002 根本不是等价候选。

建议门槛：

- 两个正交、bit-exact、无 spill 的布局族都无法产生至少 2 条净指令减少，或 paired latency 的 95% CI 上界均低于 1.03：从“数 shuffle”转向 schedule/16×16 跨 tile 融合。
- 三个正交布局族均正确但 latency CI 上界仍低于 1.03，或 exact synthesis 已证明允许指令集内无更低成本实现：停止 8×8 重排路线。
- 任一候选接受仍要求 latency median ≥1.03、CI 下界 >1.00，且 throughput speedup 的 CI 下界 ≥0.97。
- 转向优先级应是 16×16 raw-tile 交错、地址/归约摊销和跨 tile packing；它还能影响由 16×16 组成的更大 shape。
- 事实：当前 workload 权重仍明确标为 placeholder，[workloads/sa8d.yaml](/home/chiro/projects/a64-simd-dyn-optimizer/workloads/sa8d.yaml:1)。在真实权重冻结前，无法严肃判断 1.30 加权目标是否仍有足够 headroom。

最后一个量级判断是推断：即使静态上免费删掉全部 24/116 条重排，按“每条等成本”粗略模型也只有约 1.26×，不足 1.30×；所以 30% 目标大概率不能只靠 8×8 shuffle 削减，必须同时利用指令端口差异、调度改善或 16×16 跨块融合。