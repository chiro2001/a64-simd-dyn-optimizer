结论先行：

- 归因 a：部分确认。现象成立，但“位宽容量相等，因此指令减半不能换成周期”因果过强；当前证据只能说它没有换成收益。
- 归因 b：高度支持上游 `dct8_neon` 的 16-bit 中间减法溢出 bug，不像 oracle 错误；不过现有 harness 确有几处缺陷，应修正后再形成上游报告。
- DCT8 correctness 应以 C/规范 oracle 为准，性能仍以上游 NEON 为 baseline。
- 下一轮不建议先做 `vmull+vpaddq` 局部 peephole；应先冻结正确语义、修正 microbench，再从 C 编译器生成的正确向量化结构和“pass2 选择性 widening”开始。

## 1. 两个归因

### a. 920B SVE256

[已有文件支持的事实]

- 仓库采用的 920B 模型是 NEON `4×128`、SVE `2×256`，二者均为 512 bit/cycle；M11 的四组 CNTVCT paired 结果全部小于 1：

  - 8×8 latency 0.8957、throughput 0.9323；
  - 16×16 latency 0.8822、throughput 0.6806。

  见 [8×8 latency](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m11-sve-920b/benchmark/pmu/8x8/paired-pmu-summary.txt:1) 和 [16×16 throughput](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m11-sve-920b/benchmark/pmu/16x16-tp/paired-pmu-summary.txt:1)。

- “481→257”不是 PMU 动态 retired-instructions 证据。481 来自静态反汇编总数 [pixel-sa8d-16x16.json](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m3-cost/static/pixel-sa8d-16x16.json:35)；257 是 `25 + 2×116` 的静态单调用路径重构 [identity.yaml](/home/chiro/projects/a64-simd-dyn-optimizer/candidates/identity.yaml:53)。本机没有硬件 PMU，不能称作实测动态指令数。
- 16×16 候选是两个 out-of-line wave 串接 [sve_roundtrip_sa8d_16x16.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_16x16.cpp:6)，还包含调用边界、保存恢复和失去跨 wave 调度机会。

[推断]

- 相等的执行位宽确实消除了“仅靠 2× 向量宽度得到 2× throughput”的可能，因此是合理上界模型。
- 但它不能推出“指令减少必然无周期收益”：若前端、地址生成、load、shuffle 或 issue slot 是瓶颈，架构指令减少仍可能有收益。反之，SVE 指令可能拆成更多 µop、具有更差 latency/port 占用。
- 所以严谨表述应是：**在当前候选结构和 920B CNTVCT 测量中，静态路径指令减少没有转化为时间收益；位宽容量相等是主要解释之一，尚非单一因果证明。**
- CNTVCT 是固定频率虚拟计数器 tick，不是 core cycle；它可做 pinned paired 时间比较，但不能据此反推每条 SVE 指令的周期或 pipe 利用率。

### b. DCT8 分歧

[已有文件支持的事实]

- 两台实机都得到 `1733/200000`，独立 oracle 与 `dct8_c` 为 0 mismatch [differential log](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m12-dct8/evidence/dct8-differential-920b.log:1)。
- 首个归档反例所有输入都在 `[-255,255]` 内，所以即使 harness 存在范围 off-by-one，它也不能解释该反例。
- C 路径在 `int` 中计算 `O[k] = src[k] - src[7-k]` [dct.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/common/dct.cpp:212)；NEON 路径却在每一 pass 都使用 16-bit wrapping `vsub_s16` [dct-prim.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/common/aarch64/dct-prim.cpp:991)。
- `vrshrn_n_s32` 是 rounding、非饱和窄化；饱和版本是 `vqrshrn_n_s32`。验证器当前“saturating vrshrn”的注释是错误的 [dct8_verify.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/dct8/dct8_verify.cpp:112)。

[强推断]

- pass1 单个系数在合法 8-bit residual 下可界定在 int16 范围内，故 pass1 `rshrn` 本身不是问题。
- 问题出在 pass2：两个合法 int16 pass1 系数之差可达到约 ±65280，需要 17 bit。对首个归档反例重算，可得到一对系数 `-15054 - 18234 = -33288`，`vsub_s16` 会绕回 `32248`。
- 只有第二 pass 的奇数频率使用 `O[]`，正好解释奇数频率位置；wrap 差为 65536，再经 `>>9`，也解释输出差呈 64/128 的倍数。
- 因此这是**高度确认的上游算术宽度 bug**。最后的确认实验只需把 pass2 的 O 改成 widening subtract，并证明现有反例和大样本全部归零。

TestBench 通过并不构成反证。它只有 128 次 [mbdstharness.h](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/test/mbdstharness.h:37)，且三类输入中两类是全 `-255`/全 `+255`，随机类是两个 `[0,255]` 数之差的三角分布 [mbdstharness.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/test/mbdstharness.cpp:61)，覆盖远弱于均匀全范围随机。

不过，“集中在 j=5/6/7”尚未被当前 verifier 的统计字段充分支持；它只记录每个 case 的首个差异和 stride。建议补完整二维位置 histogram 后再写进上游报告。

## 2. correctness、ABI 与 VL 风险

按优先级：

1. **语义 seed 错误。** 如果从上游 NEON LLVM IR 做“等价变换”，搜索会忠实继承 pass2 的 wrapping bug。应先建立 C/SpecIR 语义，显式表示：

   - signed lane width；
   - wrapping 与 widening add/sub；
   - `round_shift_narrow<32→16, non-saturating>`；
   - pass1 rounding/narrow barrier。

   不能把两 pass 合并成数学 DCT，也不能跨 pass1 窄化重结合。

2. **oracle 与 baseline 必须拆开。**

   - correctness：`candidate == dct8_c/规范 oracle`；
   - performance：`candidate` 对同机上游 `dct8_neon`；
   - 另行报告 `candidate != neon` 的已知集合。

   这与 x265 TestBench 本身以 C 对 optimized primitive 做 `memcmp` 一致。若产品要求保持旧 AArch64 bitstream，则应作为单独的 legacy-compat 策略，而不是污染默认正确性合同。

3. **现有随机生成器有 off-by-one。** `(rng() & 0x1ff)-255` 实际是 `[-255,256]`，验证器和 microbench 都有此问题 [dct8_microbench.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/dct8_microbench.cpp:65)。应改成真正的 `[-255,255]` 分布，并保留当前合法反例作为固定回归。

4. **DCT microbench 目前不是干净的 kernel 测量。**

   - 每次调用后在计时区内扫描 64 个输出；
   - latency 的下一输入由输出 checksum 决定；因 C 与 NEON 会分歧，两者很快走上不同输入序列；
   - throughput 仍复用一个输出缓冲，不是四路独立调用；
   - `empty_dct` 不写输出，随后读取未初始化 `out[]`，属于 UB；
   - `offs` 不是合法的二维 origin 映射。

   见 [run_batch](/home/chiro/projects/a64-simd-dyn-optimizer/benchmarks/dct8_microbench.cpp:143)。因此 0.8068/0.9615 应暂称“当前 harness-inclusive CNTVCT 比值”，不宜直接解释为 kernel cycles。

5. **ABI/内存门尚不完整。**

   - 函数签名应严格保持 `void(const int16_t*, int16_t*, intptr_t)`，stride 单位是 int16 元素 [primitives.h](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/common/primitives.h:153)。
   - 补 src/dst 不同对齐、最小 stride、guard page、输出 canary、ASan/UBSan。
   - 若最终生成汇编，检查 x19–x29、v8–v15 低 64 bit、SP 16-byte、BTI。AArch64 TestBench 的 `checked()` 当前退化为直接调用，不会检查 callee-saved 寄存器 [testharness.h](/home/chiro/projects/a64-simd-dyn-optimizer/third_party/x265/source/test/testharness.h:204)。

6. **P1' 只闭环了验证器级 dispatch，尚非生产 dispatch。**

   - VL=128 日志实际是 single 仍注册，只有 x2/x2raw/16x16 被拒绝 [native-reject-vl128.log](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m11-sve-920b/correctness/native-reject-vl128.log:1)。若目标是“所有候选拒绝”，则尚未满足；若目标仅是 packed candidates，则满足。
   - `sve_dispatch.h` 只在 verifier 使用，尚未进入 x265 primitive 注册路径。
   - `registered` 是缓存状态；VL 是 per-thread 且之后可改变，跨线程复用候选表会产生 stale registration [sve_dispatch.h](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_dispatch.h:32)。
   - `PR_SVE_SET_VL` 的标准长度单位就是字节。仓库证据也只显示 native/qemu 都是 `16→16B`，不支持“单位分歧”；相反，[sve_verify.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_verify.cpp:101) 的“kernel bits/qemu bytes”注释应视为错误。
   - verifier 忽略 `prctl()` 失败。生产路径应先查 `HWCAP_SVE`，检查返回值及 `PR_SVE_VL_LEN_MASK`，再以本线程 `svcntb()` 决定注册。
   - 必须选择固定 `svcntb()==32` 或 VLA-minimum `>=32`；当前文档写固定 256，而代码使用 `>=32`。若保留后者，至少补 VL=384/512 的 correctness/guard。

## 3. 下一轮实验，按信息增益排序

1. **定案 correctness 根因。**

   用真正 `[-255,255]`、固定归档反例和边界构造，对比：

   - upstream NEON；
   - 仅把 pass2 O 改为 widening 的诊断版本；
   - C/oracle。

   同时记录 pass1 系数范围、pass2 O 溢出次数和二维差异位置。预期诊断版本对 C 为 0 mismatch；这一步也产出正确的搜索 seed。

2. **重建可信的性能基线。**

   移出 64 项 checksum，修正二维 origin；throughput 使用四个 dst/四路独立调用；latency 使用一组预筛选为 C==NEON 的共同输入链。显式归档 `impl_a/impl_b`、CNTFRQ、原始 ticks。然后在 N1/920B 同时测 C、upstream NEON、corrected-NEON，并可拆测 pass1/pass2。

3. **从 C-correct 结构做三个手工原型，再决定 importer/search。**

   优先顺序：

   - pass1 保持 16-bit，pass2 仅 O 使用 `ssubl`/32-bit；
   - 四个独立列并行的 s32 `mul/mla`，替换 `smull+addp` 归约链；
   - pass1 中间值留寄存器并显式 8×8 transpose，权衡减少 stack load/store 与新增 permute。

   N1 上按当前报告，C 已约比 NEON 快 1.24×，距离 1.30×只差约 5%；920B 上仍需比 C 再快约 25%。因此应允许两台 CPU 使用不同调度/候选，不要强求一个布局。

## 4. 连续无收益后的方向

现在不应停止 DCT8：当前 seed 有语义 bug，microbench 也尚未隔离 kernel，本轮负面结果不能作为 family 止损依据。

建议的止损点是：修正上述两项后，完成三种结构独立的原型；若没有任何候选在任一机器达到中心估计 >1.05 且 CI 下界 >1.00，就停止“上游 NEON 局部 peephole”这个 family。

届时应：

- 把 IR 改为 range-aware fixed-point transform IR，而非逐条 LLVM/NEON opcode；
- 把 raw instruction count 降为 tie-breaker，主成本改为 `mul/mla`、`addp`、permute、narrow、load/store、spill 和关键路径的目标 CPU 权重；这也符合仓库已经要求的资源下界模型 [docs/09](/home/chiro/projects/a64-simd-dyn-optimizer/docs/09-instruction-fusion-analysis.md:92)；
- 转向 register-resident factorization、两块 DCT8 batching，或 residual→DCT / DCT→quant 跨 primitive 融合；
- 若内部 30–60% 实现可提供哪怕只有反汇编/指令直方图，优先用它校准搜索空间。

最后，M12 还不能标成证据闭环：当前 manifest 仍列 `c_eq_neon`、`cand_eq_neon` [manifest.yaml](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m12-dct8/manifest.yaml:16)，与已经确定的 C-oracle 合同冲突；iteration 也仍把已有 N1/920B evidence 写成待跑。建议下一轮实验前先修正这些记录口径。