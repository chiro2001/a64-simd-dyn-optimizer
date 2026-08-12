## 总结判断

[推断] M22 的“这批候选全部拒绝”成立；“上游 NEON DCT8 已到局部 peephole 下限”则归因过强。最严谨的结论只能是：

> 在固定 imported seed、固定 rewrite 顺序、当前编译器 lowering、N1/920B 和本轮测量口径下，四份不同机器码均未胜过上游。

它没有排除布局、调度、双块并行、不同整数 DCT 分解或 DCT→quant 融合。

[待实验建议] 立即停止“单块、沿上游数据流做 opcode peephole”；只再允许一次有预算的宏结构实验，然后按本文止损线决定是否结束 tier-a DCT8 family。

## 1. 对 M22 结论与归因的反驳

### 搜索空间和实测点并没有表面上那么大

[仓库事实] M22 五个候选确实全部未达 `>1.05 且 CI 下界 >1.00` 的保留门槛：N1 为 `0.8638–0.8946`，920B 为 `0.9719–0.9982`，见 [M22 结果](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m22-dct8-structural-search/iteration.md:38)。

[仓库事实] “全部 CI 上界 <1.00”不正确：920B `widen` 为 `[0.9931, 1.0020]`，`widen-shift64` 为 `[0.9887, 1.0028]`。不过它不改变 `<1.05` 的拒绝判定。

[仓库事实] 对 16 个搜索对象逐 `.text` 比较，实际只有六份不同代码；五个实测标签中，`widen` 与 `widen-shift64` 的最终 benchmark symbol 完全同码，因此只有四个不同机器码。`tree_to_mla` 在未 widen 时是 no-op，`shift64` 多数情况下又被编译器折叠。[ranking.json](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m22-dct8-structural-search/ranking.json:1) 也显示大量组合成本完全相同。

[仓库事实] 搜索按给定目录顺序应用组合，不探索 rewrite 排列、重复应用或 phase ordering；见 [search_driver.py](/home/chiro/projects/a64-simd-dyn-optimizer/tools/search_driver.py:29)。

[推断] 因此 M22 是对一个很薄的、强依赖 seed layout 的搜索空间做了否定实验，不是对“DCT8 局部优化下限”的测定。

### `tree_to_mla` 不等价于 M15

[仓库事实] M15 的同一个 `butterfly` 被用于两个 pass，两个 pass 的奇数列都使用 s32 O 和 MLA 链，见 [proto_b.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct8/candidates/proto_b.cpp:23) 及其两次调用。

[仓库事实] M22 的规则只有在 `widen` 后才触发，只替换 pass2；单测明确要求 pass1 的 32 个 `smull` 保持不变，见 [tree_to_mla](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/rewrites.py:271) 和 [对应测试](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/test_rewrites.py:144)。M15 是 229 条，M22 tree 版仍为 345 条，也证明它们不是同一结构。

[推断] M22 编码的是“M15 的 pass2 局部切片”，不是 M15 原型或其完整邻域。

### `wide_load` 不等价于 M16

[仓库事实] M16 用 `int16x8_t r[8], t[8]`：直接 stride q-load、pass1 q-store、pass2 q-load、最终 q-store，见 [proto_c.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct8/candidates/proto_c.cpp:121)。

[仓库事实] M22 只把相邻两次 64-bit 输入 load 合成一次 q-load，再产生 `vget_low/high`；store codegen 仍只发出 `vst1_s16`，也没有 M16 的 pass 间 q-vector 数据结构，见 [wide_loads](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/rewrites.py:148) 和 [codegen](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:440)。

[推断] 这会漏掉依赖整体布局才显现的收益：q 窄化/存储合并、pass1 输出直接采用 pass2 消费布局、常量跨 pass 常驻，以及不同的寄存器压力分布。不过 M15/M16 原型本身已经实测失败，故只能说“搜索覆盖不完整”，不能反推忠实复现后一定会赢。

### 成本模型不是简单的“样本少”

[仓库事实] 当前解析器有会直接改变最长路径的语义缺口，见 [critical_path.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/analysis/critical_path.py:41)：

- `mla dst,...` 没有把旧 `dst` 作为输入，漏掉累加器链；
- 不统一 `d/q/v`、`w/x` 寄存器别名；
- `ldp` 只建一个目的寄存器；
- 栈槽不表示访问范围、重叠及 pre/post-index；
- 先用种子延迟选定路径，再在固定路径上求拟合成本；
- 未见 mnemonic 的权重默认为零。

[仓库事实] M22 的 widen 代码有约 160-byte frame 和多组栈上向量 store/load，tree 版约 96-byte frame；当前模型无法可靠描述这些 spill、发射端口和寄存器压力成本。

[推断] 所以“重拟合失败”首先否定的是当前实现，不能据此证明正确建模的关键路径毫无价值；但单一关键路径指标显然也不够。

### 测量方法限制

[仓库事实] M22 的 paired 脚本读取 CSV 第六列 `ns`，不是第七列 CNTVCT ticks；每个 A/B 都启动新进程，未做 empty subtraction，只测 latency，并以 IID bootstrap 处理样本，见 [bench-paired.sh](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/bench-paired.sh:12)。

[仓库事实] M22 时 latency 下一输入依赖前一次输出；上游 NEON 与 C-exact 候选在约 0.9% 输入上输出不同，因而可能沿不同输入序列运行。原 corpus 还把 `+256` 错算进 `[-255,255]`。

[仓库事实] M22 截点后的 M25 修复了这些主要 harness 问题并复测，五候选仍全部 `<1`；M26 又用两机原生 `-O3 -mcpu=native` 重编，最佳也只有 N1 `0.9597`、920B `0.9942`，见 [M25](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m25-dct8-harness-fix/iteration.md:8) 和 [M26](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m26-dct8-native-build/iteration.md:26)。

[推断] 后续证据显著加强了“这四种 lowering 不赢”，但仍没有把结论提升为 DCT8 理论或结构下限。

## 2. Correctness、ABI 与性能风险

1. **Rewrite translation validation 不足**

   [仓库事实] `tree_to_mla` 用集合识别 leaves/pairs，集合会丢掉操作数顺序和重数；删除 mul/addp/rshrn 时也未验证被删节点没有额外用户。系数行及 shift=9 实质上是 DCT8 专用知识。

   [推断] 当前固定 seed 的 20 万例差分通过，但作为可复用目录规则仍存在误编译风险。

   [待实验建议] 为 rewrite 增加 use-count、操作数有序多重集、完整子图所有权、常量身份和 range precondition；用刻意共享节点、重复操作数、交换 addp 输入的负例做单测。

2. **`wide_load` 改变内存操作时点**

   [仓库事实] 规则验证了 `+8` 地址的唯一 load consumer，却没有完整的 alias、volatile、介入 store 或 memory-order 检查。

   [推断] 当前 DCT8 只读 16-byte 行时大概率安全；泛化后可能把高半 load 提前到与其别名的 store 之前。

   [待实验建议] 增加最小 stride=8、所有 0–15 字节对齐、行尾 guard page、src/dst canary；若合同允许重叠，再测合法 alias。规则本身应携带 16-byte readable footprint 和无别名写证明。

3. **`vmlaq_n_s32` 的范围证明没有绑定到规则**

   [仓库事实] 8-bit DCT8 当前上界 `89×65280×4 < 2^31`，所以现有 seed 的 s32 MLA 不溢出；但默认分析范围固定为 `[-255,255]`。

   [推断] 规则若被用于高 bit depth、不同系数或不同 pass，可能发生非饱和 s32 回绕。

   [待实验建议] 每条 MLA 链必须附带逐项乘积与累加区间证明；高 bit depth 未证明前禁止匹配。

4. **新 codegen 的验证深度不足**

   [仓库事实] `vget_low/high`、`vtrn1/2q`、`vcombine`、`vmlaq_n` 在当前 seed 上通过了编译、qemu 和随机差分；单测主要检查节点数量或生成文本中存在 intrinsic，没有独立 lane-sentinel 测试。

   [待实验建议] 补充 lane 编号向量验证每个 transpose/combine mask，并运行极值、交替符号、已知最小反例、ASan/UBSan、输出前后 canary 和 guard-page 门禁。

5. **ABI 本身风险较低，集成门禁缺失**

   [仓库事实] 生成函数使用正确的 `extern "C"` 三参数签名，代码由 C++ 编译器生成；反汇编也保存/恢复了使用到的 `d8–d15`，没有发现直接 ABI 违规证据。

   [推断] 更可能遗漏的是 x265 primitive registration/dispatch、不同编译器 ABI 组合、真实调用点的对齐和内存合同，而非 intrinsic 自身破坏 callee-saved。

   [待实验建议] 在真正的 x265 dispatch 中注入一次，运行官方 transforms TestBench、ABI 寄存器 sentinel、完整 encode 回归和输出边界检查。

6. **性能风险被静态条数掩盖**

   [仓库事实] wide-load 版减少 load，却使 `mov` 数增加；tree 版引入 24 个 `mla`、转置、常量 materialization，并形成四深累加链。不同编译目标已造成约 2–9% 调度差异。

   [推断] `vget` 在 ISA 层常是寄存器视图，但更长 live range 仍会通过寄存器分配产生 move/spill；指令条数下降不能预测性能。

## 3. 下一实验，按信息增益排序

### P0：一次性关闭成本模型可信度问题

[仓库事实] 用户建议的“4+5 点直接重拟合并 LOOCV”在 M23 已做：原始 LOOCV Spearman 为 920B `-0.517`、N1 `-0.833`；M25 修复 harness 后仍为 `-0.467/-0.600`。M24 换成实测 mnemonic latency 后也只有接近零或负相关，见 [M23](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m23-dct8-cost-refit/iteration.md:38) 和 [M24](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m24-dct8-latency-probe/iteration.md:40)。不要原样再做一次。

[待实验建议] 只允许一次“修正依赖图后的重验证”：

- 对最终 linked symbol 按 `.text` 去重；
- 两机统一 `-O3 -mcpu=<target>`，使用同一合法公共 corpus；
- 同时记录 ticks 与 ns、CNTFRQ、empty subtraction、latency 和四路 throughput，按进程/时段 block bootstrap；
- 修复 MLA read-modify-write、寄存器别名、multi-dst、内存范围；
- 模型改为少参数的 `max/组合(CP, issue/port, frontend, load-store, spill)`，不要用九点拟合十几个 mnemonic 权重；
- 做 leave-one-structure-out，而不只是随机留一标签。

[待实验建议] 可信门：两机 Spearman 均 `≥0.7`，且预测 top-3 至少命中实测 top-3 的 2 个；否则永久取消自动精排，只保留安全/静态 Pareto 粗筛，所有不同机器码实测。

### P1：只做一次真正不同的宏结构 family

[待实验建议] 生成 6–8 个不同最终 `.text`，优先组合：

- 两块 DCT8 interleave，用独立 dot 链隐藏 N1/920B 乘加延迟；先确认调用点确实可批处理；
- pass1 输出直接采用 pass2 消费布局，避免 M16 的完整 `coef` store/reload；
- `2×(mul+mla)+add` 两深混合归约，避免四深 MLA；
- `smull/smull2`、`rshrn/rshrn2` 合并两组并 q-store；
- 常量跨组常驻，并把向量 spill 数作为硬预算；
- 另取一两个候选做精确整数矩阵的新 factorization，而不是重排现有 upstream 指令。

[推断] 真正有机会接近 +30% 的是跨块 ILP、减少 pass 间物化或新的整数分解；再增加 `rev/zip/mul` peephole 基本没有信息增益。

[待实验建议] 必须保留每个 pass1 的 rounding/narrow barrier；除非把合同扩展为 DCT+quant 融合，否则不能把缩放或舍入推过两个 pass。

### P2：SVE256 只做静态准备

[推断] 值得现在准备设计，不值得在没有 N+2 时投入完整 SVE2.3 性能调优。单个 DCT8 行只有 128 bit；要利用 VL=256 及 4×256 执行资源，核心设计必须是双块/四块 packing，而不是把单块 NEON 指令机械换成 SVE。

[待实验建议] 目前只交付：

- N+2 feature/HWCAP、SVE2.3、VL=256 和 per-thread VL 合同；
- tier b/c 各自基线及 dispatch 规则；
- 双块/四块 PackIR、lane mapping、rounding barrier；
- qemu correctness、反汇编和静态资源预算；
- 对真实 x265 调用点做 batching 可行性审计。

[待实验建议] 只有拿到 960 实机，或确认存在合法连续多块调用点后，才进入完整 codegen 和性能搜索。920B 不能验证 SVE2.3，也不能外推 4×256 吞吐。

## 4. 明确止损与转向判据

[待实验建议]

1. 现在停止“单块 imported-NEON-layout opcode peephole”。
2. 允许 P1 最多两轮、合计最多 8 个不同最终 `.text`。
3. 若没有任一机器出现中心值 `>1.05` 且 95% CI 下界 `>1.00`，停止 tier-a DCT8 family。
4. 若只有 `1.05–1.10` 信号，只允许一次消融和跨日复测；不能复制则停止。
5. tier-a 只有同机上游基线的中心值达到 `≥1.30`，且完整 correctness/ABI/encode 门禁通过，才算达成。
6. 没有内部参考反汇编、合法 batching 调用点或 N+2 实机时，转向其他 hotspot 或 DCT→quant 融合，不再继续调 mnemonic 权重。

[待实验建议] 转向后的 IR 应从“指令节点”提升到“DCT stage + rounding point + tensor/layout + memory region + range proof”；搜索目标改为布局、tiling、batching、factorization 和 schedule；成本改为关键路径、端口/issue、前端、load-store、spill 的多目标 Pareto。

## 5. M21 的处理

### 面向上游报告

[仓库事实] M21 运行的是自建 `MBDstHarness` 语义复刻器，不是官方 TestBench executable；源文件也承认 rand 流与真实 harness 构造顺序不同，且直接调用符号，没有覆盖 primitive registration/dispatch，见 [upstream_contract.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct8/upstream_contract.cpp:14)。

[仓库事实] M21 截点的“0.91%/0.0035%”使用了实际范围 `[-255,256]` 的生成器。M25 改成真 `[-255,255]` 后变为 dct8 `1736/200000`、dct16 `9/200000`。此外统一 stride `{8,16,17,32}` 对 dct16 包含 stride 8，对 dct32 只有 stride 32 符合通常的 `stride≥width` 调用形状。

[推断] dct8 有 M12–M14 的合法输入、最小反例、静态范围分析和修复作为独立证据；dct16 的少量分歧尚不足以正式定性为上游 bug。

[待实验建议] 上游报告应写成：

> pinned b81f650 的 untouched NEON symbols 通过本项目的 MBDstHarness-semantics replica。

不要写“已经运行并通过官方 x265 TestBench”。先实际运行官方 transforms TestBench；dct8 issue 附最小反例、pass2 `vsub_s16` 回绕根因、`vsubl` 修复和全范围结果。dct16 必须按每尺寸合法 stride 重跑、保存反例并最小化后单独处理。报告还应说明这是跨架构 encoder 输出/bitstream 可重复性问题，不等同于 decoder 或码流规范违规。

### 面向项目合同

[待实验建议] 保持 `candidate == C/spec` 为 canonical correctness 硬门，tier-a 性能仍对同机最佳 upstream NEON；同时增加“相对最佳 C-exact baseline”的辅助指标，用来区分 correctness tax 与真正优化收益。

[待实验建议] 不应因为内部 TestBench 通过而放宽 C-exact。若产品明确要求复现旧 ARM encoder 输出，另建 `legacy-neon-exact` 合同和候选族，不能与 canonical C-exact 混用。

[待实验建议] C-exact 随机差分不能替代真实 TestBench、primitive dispatch、ABI/内存门禁和端到端 encode 回归。

本次仅进行了只读审阅，没有修改仓库。