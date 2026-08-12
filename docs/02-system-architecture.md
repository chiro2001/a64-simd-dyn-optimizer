# 系统架构与中间表示

## 1. 总体分层

优化器由七个可独立测试的层组成：

```text
Kernel contract
      │
      ├── scalar C / canonical DSL ──> SpecIR ──> normalize/range/alias
      │
      └── NEON/SVE intrinsics/.S ────> target-aware seed MachineIR
                                                │
                                  ISA 语义解释/抽象投影
                                                v
                                      PackIR seed layout
                                                │
                      SpecIR + rewrite rules ───┤
                      target ISA/cost model ────┤
                                                v
                                  layout + tile + instruction search
                                                │
                                                v
                                      candidate MachineIR
                                 ┌──────────────┼──────────────┐
                                 v              v              v
                              verifier     code generator   cost/benchmark
```

每层都通过版本化、可 canonicalize 的数据交换，不允许只有某个脚本进程内才存在的隐式语义。推荐用 JSON 作为 MVP 的调试/归档格式，用 schema version 和稳定排序生成内容哈希；性能成为瓶颈后再替换内部序列化，不改变逻辑模型。

## 2. Kernel contract：先声明可合法观察的行为

在读取任何 implementation 之前，为每个 kernel 建立 contract：

```yaml
kernel: sa8d_8x8_u8
abi:
  return: i32
  args:
    - {name: pix1, type: ptr<u8>, region: pixel_a, readonly: true}
    - {name: stride1, type: intptr}
    - {name: pix2, type: ptr<u8>, region: pixel_b, readonly: true}
    - {name: stride2, type: intptr}
shape: {height: 8, width: 8}
memory:
  reads:
    - "pixel_a[y * stride1 + x], 0 <= y,x < 8"
    - "pixel_b[y * stride2 + x], 0 <= y,x < 8"
  writes: []
  alias: pixel_a may_alias pixel_b
preconditions:
  - all declared reads are valid
  - stride units are elements
numeric:
  bit_depth: 8
  result_semantics: exact_x265_reference
target_contract: null
```

contract 必须表达：

- 每个指针属于 pixel、constant、output、scratch 或 unknown 中哪类 memory region；
- stride 的单位、合法范围、是否允许 0/负数，以及可访问 footprint；
- 对齐只是保证还是优化偏好；
- region 是否可能 alias；
- bit depth、输入范围和输出类型；
- fixed shape、动态 shape 与合法尾部；
- 是否允许 over-read。默认不允许，除非 x265 调用方合同明确保证 padding；
- ISA feature、SVE VL、ABI 和 predication 合同。

contract 不是从一次 trace 猜出来的。无法证明的条件先列为显式 precondition，再用 x265 调用点和 guard-page 测试核实。

## 3. SpecIR：与向量宽度无关的精确规格图

SpecIR 是有类型 SSA 数据流图，循环在 MVP 中按固定 kernel shape 展开；较大 shape 用可参数化 tile region 表达。它只描述逻辑值与内存效果，不选择 NEON/SVE 寄存器。

### 3.1 值类型

每个值至少携带：

- bit width：8/16/32/64 或经过证明的数学整数；
- signedness：signed、unsigned 或只作为 raw bits；
- lane-independent scalar provenance；
- 已知值域 `[min,max]`、模约束和可能的 poison/undefined 状态；
- 对于布尔值，明确是 scalar condition 还是 lane predicate。

禁止用一个模糊的 `int` 覆盖所有阶段。`u8 -> s16` 扩宽、`s16` 回绕、饱和窄化和数学整数加法是不同节点。

### 3.2 逻辑元素与 provenance

load 首先展开为逻辑元素，例如：

```text
%a_3_5 = load_elem region=pixel_a index=(3 * stride1 + 5) type=u8
%c_2   = load_elem region=filter_constants index=2 type=s8
```

后续每个节点保留从输入元素到输出元素的关系。布局变换不能丢失 provenance，只改变元素容器或顺序。这样可以回答：

- 一个 lane 对应哪一个像素/常量；
- 某个 shuffle 是必要的逻辑转置，还是前一布局选择引入的开销；
- 两次 load 能否合并，是否会越界；
- 一个归约包含哪些元素，舍入发生在 tile 内还是 tile 之间。

### 3.3 节点集合

MVP 节点至少包括：

- `LoadElem`、`StoreElem`、`Const`、`Broadcast`；
- `Add/Sub/Mul/Mla`，各自带 exact/wrap/saturating 与结果位宽；
- `ZeroExtend/SignExtend/Truncate/SaturatingNarrow`；
- `Abs/Min/Max/Neg/Select`；
- `ShiftLeft`、logical/arithmetic shift、rounding shift、saturating rounding shift；
- `Dot`、`PairwiseAdd`、`ReduceAdd/Max/Min`；
- `Permute`，用输入元素到输出元素的显式映射描述，而不是只存 intrinsic 名；
- `PredicateCreate`、`PredicatedOp`，并声明 inactive lane 是 merge、zero 还是 dont-care；
- `Region`，表达 Hadamard stage、DCT pass 或 filter tap window 等可重写子图。

### 3.4 数值与内存分析

在任何搜索前运行：

1. affine address/provenance 分析；
2. alias 与 footprint 检查；
3. interval + known-bits + congruence range 分析；
4. widening/narrowing 与 overflow 证明；
5. dead value、common subexpression 和常量传播；
6. reduction tree 与 rounding boundary 标注。

范围分析既用于正确性，也用于发现更窄、更便宜的指令。例如只有证明中间结果不溢出时，才允许把 `s32` 运算降为 `s16`；证明必须作为候选证书的一部分。

## 4. PackIR：把语义和数据布局连接起来

PackIR 的核心对象是 `Pack`：

```text
Pack {
  shape: 16 x i16,
  fragments: [abstract-vector-fragment...],
  lane_map: lane -> SpecIR element | constant | inactive,
  predicate: optional,
  alignment: known/required,
}
```

PackIR 允许同一组 SpecIR 元素同时存在多个布局，搜索器可以在以下选择之间比较：

- row-major、column-major、interleaved rows、paired blocks；
- NEON 的 8x16-bit 与 SVE 的 16x16-bit（VL=256）分块；
- 先转置再计算，或用 dot/table/zip 指令隐式完成部分重排；
- 一次处理一个 block，或跨两个/四个 block 并行以摊薄归约和 load；
- VLA predication 与 fixed-VL 完全填满的方案。

数据重排被建模为 lane mapping，不以 `trn/zip/uzp/tbl` 名字提前锁死。目标 pattern matcher 再寻找实现该 mapping 的合法指令序列。

PackIR 可以感知目标向量容量、fragment 数量和 predicate 形状，但**不能**包含 intrinsic 名、opcode、具体寄存器、指令顺序或调度约束；这些只属于 MachineIR。现有 SIMD 实现也不能直接“lift 成 PackIR”：importer 必须先建立保留具体指令形式和顺序的 target-aware seed MachineIR，再用 ISA 语义解释每条指令，把可观察的元素关系与布局投影为 PackIR。该投影用于提供布局 seed，可以有意丢掉具体指令选择；需要复现基线时必须从 seed MachineIR round-trip，而不是假定 PackIR 能还原原指令。

## 5. MachineIR 与 AArch64 指令语义库

MachineIR 已选择目标指令、operand、寄存器类别、predicate、立即数和 feature。它在分配物理寄存器前仍可调度，随后产生寄存器分配和 spill 信息。

每个 ISA pattern 的 schema 至少包含：

```yaml
name: <canonical opcode/form>
features: [neon | dotprod | i8mm | sve | sve2 | sve2-bitperm]
operands: <typed operand constraints>
lane_semantics: <PackIR mapping and arithmetic effect>
inactive_lanes: <merge|zero|n/a>
immediates: <legal ranges>
memory: <bytes, alignment, faulting behavior>
encoding_check: <llvm-mc round-trip fixture>
cost_keys: <latency, reciprocal throughput, uops/resources by target>
```

语义库必须以机器可测试的方式维护：随机生成 operand，比较语义解释器与真实/模拟执行结果；用 `llvm-mc` 组装并反汇编 round-trip。第一阶段只实现 SA8D 实际需要的约 20–40 种形式，按 kernel 拉动增长，绝不先抄完整 Arm 手册。

## 6. 前端：规格和现有实现走不同入口

### 6.1 规格入口

优先级如下：

1. 受限 canonical DSL：最清晰、最适合 SMT，是 MVP 的可执行规格；
2. x265 标量 C reference 的受限 Clang/LLVM importer；
3. 差分调用 x265 C reference，作为所有规格入口的 oracle。

x265 标量代码可能用 packed-word 技巧同时计算多个值，直接把其 LLVM IR 当“干净数学规格”会把实现偶然性带入搜索。因此 SA8D 首轮允许从 C reference 派生一份人工审核的 canonical DSL，但必须通过随机、边界和 guard-page 测试证明两者等价。之后再逐步自动化 restricted-C lifting。

### 6.2 现有 intrinsic 实现入口

对 `pixel-prim.cpp` 等文件：

- 用 x265 真实 compile commands 和宏（特别是 `X265_DEPTH`、`HIGH_BIT_DEPTH`、ISA flags）预处理；
- 构建只暴露目标 static/inline kernel 的 wrapper translation unit；
- 生成 Clang AST、优化前/后 LLVM IR、最终 object 与 symbol disassembly；
- 把 LLVM vector op、`shufflevector`、GEP/load、`llvm.aarch64.*` intrinsic 及其最终 target lowering 导入 target-aware seed MachineIR；
- 把 inline helper 的效果展开，保留源位置映射；
- 依据 AArch64 指令语义解释 seed MachineIR，并把 lane provenance/layout 抽象投影到 PackIR；
- 将 seed MachineIR 的可观察语义与 canonical SpecIR translation-validate。

第一条验收不是立刻变快，而是“导入 seed MachineIR -> 原样 codegen”能得到 bit-exact 且性能/汇编结构接近现有 NEON 的 seed candidate，同时其抽象投影能提供不带 opcode 的 PackIR layout seed。这个 round-trip 能提前暴露 importer 丢语义的问题。

### 6.3 assembly 入口

`.S` 支持放在 intrinsics MVP 之后：预处理宏、组装、按 symbol 边界反汇编，然后用受限 AArch64 lifter 生成 seed MachineIR，再按 ISA 语义投影 PackIR。它只支持显式白名单 opcode；遇到未知指令立即失败，不能用 opaque node 后仍声称完成等价证明。

### 6.4 QEMU 与 LLVM 的职责边界

| 工具 | 适合 | 不适合 |
| --- | --- | --- |
| Clang/LLVM IR | C/intrinsic 抽取、类型与 vector op、后端 codegen | 自动理解全部 x265 业务语义 |
| LLVM MC/objdump | 编码、反汇编、symbol 静态计数 | 证明整数 kernel 等价 |
| llvm-mca | 支持的 CPU/指令上的静态调度初筛 | 替代实机；未建模 SVE/CPU 时硬给结论 |
| QEMU | 跨 ISA/VL 功能执行、非法指令、可选动态 trace | 真实硬件周期/吞吐排名 |
| perf/PMU | 实机 cycles、instructions、cache/branch 证据 | 单独证明功能正确 |

动态 trace 只能覆盖执行过的路径和数据，主要用于 importer/debug 与动态指令分类。它不能作为完整 kernel 语义的唯一来源。

## 7. 等价变换与搜索

搜索采用由粗到细的分层策略，避免在“所有指令序列”空间盲枚举。

### 7.1 规范化和已证明规则

先执行确定性规范化：常量折叠、结合/交换规范形、冗余扩宽/窄化删除、dead lane 消除、相邻 permute 合成、load 合并的合法性检查。每条规则必须：

- 由 SMT 在声明的 bit width/precondition 下离线证明，或来自可审计手工证明；
- 带唯一 rule id 和版本；
- 生成前后 IR 的 proof/测试记录；
- 不允许把 rounding、saturation 或 overflow boundary 跨过 reduction 随意移动。

可在局部 region 使用 e-graph 表达多种等价算术/重排形式，但 extraction 必须感知布局和寄存器压力，不能只按节点数。

### 7.2 分层搜索空间

1. **algorithm/tile**：Hadamard/DCT/filter 的合法 factorization、block fusion、循环展开。
2. **packing/layout**：元素到 lane、NEON/SVE fragment、predicate 的映射。
3. **instruction cover**：用目标 pattern 覆盖 PackIR；小 region 用 DP/ILP，较大 region 用 beam/A*。
4. **schedule**：依赖图上的 list scheduling，考虑 target execution resources。
5. **register allocation**：估算后必须做一次真实分配/编译；出现 spill 的候选重新计价。
6. **peephole superoptimization**：只对 3–12 条指令的小窗口做 bounded enumerative/SMT 搜索。

现有 NEON/SVE 实现始终作为 seed，保证搜索至少能回到 baseline 形态。新候选若不能超过 seed，可以保留负结果而不是强行集成。

### 7.3 代价函数

正确性和 feature 合法性是 hard constraint；候选预筛 cost 可写为：

```text
C = w_cp * critical_path
  + w_tp * resource_throughput
  + w_mem * weighted_load_store
  + w_perm * cross_lane_permute
  + w_reg * peak_live_and_spill
  + w_loop * loop_branch_address_overhead
  + w_size * code_bytes
```

权重按 target profile 保存，例如 `neoverse-n1-neon` 与某个 `sve2-vl256` CPU 不能共用一组数据。来源按优先级为：实机依赖链/吞吐 microbench、厂商资料、LLVM scheduling model。`llvm-mca` 不认识目标指令时标记 unknown 并降低候选置信度，不得填 0 成本。

最终排名采用实机反馈。保存静态预测与实测残差，积累足够数据后才考虑回归/学习型 cost model；不能在没有稳定数据集时先建黑盒模型。

### 7.4 “最优”的可证明边界

只有同时固定以下集合并穷尽搜索时，才能称“在该边界内最优”：允许的指令形式、最大序列长度、临时寄存器数、内存操作、目标 feature、VL、precondition 和 cost 定义。其他结果统一称为“当前搜索预算下最优候选”。文档与 benchmark 不使用无边界的“全局最少指令”表述。

## 8. 验证架构

候选按以下顺序通过门禁：

1. IR schema/type/feature verifier；
2. 每条 rewrite 的局部证明；
3. SpecIR 与 MachineIR 解释器的随机/边界差分；
4. whole-tile SMT translation validation，超时则拆 region 并记录未证明边界；
5. 生成代码对 x265 C oracle 的 native/QEMU 差分；
6. ASan/UBSan、guard pages、未对齐和 stride 组合；
7. x265 `TestBench` correctness；
8. 小型编码回归与输出 checksum/bitstream 检查；
9. 性能测量。

SMT 使用 bit-vector 而非 unbounded integer，内存地址按 contract 有界展开。对于 8x8 SA8D，可把 128 个 u8 输入元素符号化；若 whole-function 求解超时，先证明 Hadamard stage/reduction pattern，再通过组合定理连接，不能把随机测试伪装成形式化证明。

## 9. 代码生成策略

### v1：intrinsics 优先

生成单独的 C++ translation unit：

- 显式目标 feature attribute/compile flag；
- 稳定 symbol，例如 `x265_dynopt_sa8d_8x8_neon_v003`；
- `static_assert`/manifest 约束 bit depth 与类型；
- compiler output disassembly 纳入候选身份；
- 若 compiler 未选中 MachineIR 期望指令，候选失败或转 assembly backend，不能只验证源级 IR。

intrinsics 让编译器负责 ABI、寄存器分配和 unwind，适合快速打通 x265。生成器需要 pin 编译器主版本，并验证最终 object，而非假定 intrinsic 与单条指令一一对应。

### v2：assembly backend

对 compiler 表达不稳定、需精确调度或固定寄存器的热点输出 `.S`。必须生成 AAPCS64 prologue/epilogue、callee-saved 寄存器与 GNU property/section 元数据，并运行 ABI clobber 测试。assembly 后端不应阻塞 SA8D intrinsics MVP。

## 10. x265 集成与 dispatch

推荐新增默认关闭的 `ENABLE_A64_DYNOPT`：

1. 上游 `setupIntrinsicPrimitives()` / `setupAssemblyPrimitives()` 正常运行；
2. 最后调用 `setupA64DynoptPrimitives(p, cpuMask, runtimeVectorLength)`；
3. 仅对 manifest 匹配的 primitive slot 覆盖函数指针；
4. 支持环境变量或内部 debug flag 禁用 dynopt，便于同一 binary A/B；
5. 构建日志输出实际启用的候选 id 和 target contract。

固定 VL=256 的 SVE 候选只有在硬件 feature 与运行时 VL 均匹配时可 dispatch。Linux SVE VL 是线程状态；必须验证 x265 worker 对 VL 的继承/变化合同。若无法可靠保证，生产候选应生成 VLA 版本，或保持固定 VL candidate 默认关闭。禁止只靠“CPU 支持 SVE”就调用 VL=256 特化函数。

## 11. 缓存、manifest 与 provenance

每个 candidate id 由以下内容哈希得到：

```text
contract + SpecIR + source seed + rewrite/search config + ISA db
+ target profile + generator + compiler/flags
```

候选目录至少含：

```text
candidate.json
spec.ir.json
pack.ir.json
machine.ir.json
generated.cpp | generated.S
object.sha256
disassembly.txt
verification.json
static-cost.json
benchmark-link.txt
```

任何输入变化都使缓存失效。实验报告只能引用 candidate id，不能引用“刚才生成的那个版本”。

## 12. 推荐实现栈与复用边界

### 12.1 MVP 技术选择

为尽快完成 SA8D 纵向切片，推荐采用以下组合，而不是一开始开发完整 LLVM/MLIR 后端：

| 组件 | MVP 推荐 | 原因与升级路径 |
| --- | --- | --- |
| 流水线/实验编排 | Python 3.12，严格类型与锁定依赖 | 搜索和分析迭代快；热点确定后再移到 Rust/C++ |
| IR | 自有 immutable typed IR + JSON Schema | 能精确表达 x265 rounding/provenance/layout；格式稳定可审计 |
| C/intrinsic frontend | Clang CLI + `compile_commands.json` + 小型 LLVM pass/helper | 不依赖 `llvmlite` 对 AArch64/SVE 覆盖；必要时用 C++ LLVM API 导出规范 JSON |
| 证明 | Z3 bit-vector（可加 cvc5 交叉检查） | 直接控制位宽、memory、predicate；proof query/solver 版本入档 |
| 等价饱和 | MVP 为有界 typed rewrite；M4 后评估 egg/egglog | 先得到可控规则与成本数据，再承担 e-graph 提取复杂度 |
| 指令编码/反汇编 | `llvm-mc`、`llvm-objdump` | 与 LLVM codegen 同版本；GNU objdump 作为交叉检查 |
| 静态调度 | LLVM scheduling model/`llvm-mca`，只在支持时 | unknown 显式降置信；实机数据最终校准 |
| 功能模拟 | QEMU AArch64 user/system | SVE/SVE2/VL 功能矩阵；不进入性能 cost |
| 生成与集成 | C++ ACLE intrinsics -> Clang，必要时 `.S` | 先利用 ABI/RA；最终 object translation-validate |
| microbench | 小型 C++ harness + Linux perf | 与 x265 ABI 一致、可批量调用、可扣空 harness |

Python 核心不得把 NumPy 的溢出/类型行为当作规格；SpecIR interpreter 必须逐节点实现定义好的 bit-vector 语义。性能测量不从 Python 调用 kernel，避免 FFI/解释器噪声。

### 12.2 现成系统的定位

| 系统/思想 | 本项目如何使用 | 为什么不直接作为完整答案 |
| --- | --- | --- |
| LLVM vectorizer/SLP | baseline、frontend 与 codegen | 目标问题含手工 vector IR、跨 lane layout 和 target-specific idiom |
| MLIR vector/arith | M4 后做迁移 spike，可承载部分通用 op | 自定义 provenance、x265 精确舍入和机器指令 cover 仍需扩展；早期工程成本高 |
| Alive2 | 支持范围内验证 LLVM IR 变换 | 不覆盖所有 AArch64/SVE intrinsic、MachineIR 与目标成本 |
| Souper/Minotaur 类 superoptimizer | 借鉴 SSA/CEGIS/局部搜索，可做对比实验 | 通常不直接解决本项目的内存 contract、scalable vector 与 lane-layout 联合搜索 |
| STOKE | 借鉴随机搜索 + 验证 + 实测反馈架构 | 主要面向 x86，不能直接复用为 AArch64/SVE 方案 |
| equality saturation | 保存多个等价 factorization/layout | extraction 需目标成本、register pressure 和 proof side condition，MVP 后引入 |
| QEMU TCG plugin | 可选地采集动态 opcode/memory trace定位问题 | trace 非全路径语义，TCG 时间非目标硬件性能 |
| LLVM Exegesis/自建指令 bench | 校准 latency/throughput | 云 VM/PMU/指令支持需实测；数据仍是 target-specific |

M0/M1 为每个外部依赖做最小可行 spike，并记录“采用、延后或拒绝”。不要让引入框架本身成为 milestone；判断标准是它是否减少 SA8D 闭环的自有代码和验证风险。

### 12.3 何时考虑 MLIR 化

满足以下条件后再做正式 ADR：

- SA8D 的 SpecIR/PackIR 语义已经稳定，不再每轮重写 schema；
- DCT 和 interp 至少一个暴露了可复用的 region/vector lowering；
- 自有 importer/rewrite 的维护成本可以量化；
- 一个限时 spike 能把同一 SA8D spec lowering 到候选并保持 proof/provenance；
- MLIR 方案没有把 MachineIR target cover 和实机 feedback 隐藏在不可审计 pass 中。

否则继续用小型 IR；“像 AI 编译器”不要求先采用某个大型 compiler framework。

## 13. 优化器命令边界

实现阶段应提供稳定的非交互命令，使 Agent/CI 不需要调用内部 Python module。建议接口：

```text
simdopt doctor                          # 工具、CPU、ISA、SVE VL、x265 基线
simdopt spec import <kernel-contract>   # C/DSL -> SpecIR
simdopt seed import <wrapper>           # intrinsic/.S -> seed MachineIR + PackIR 投影
simdopt verify <candidate-or-ir>         # proof + differential 门禁
simdopt search --target <profile>        # 有预算、可恢复的候选搜索
simdopt codegen <candidate-id>           # 生成 source/object/disassembly
simdopt x265 patch <candidate-id>        # 生成而非隐式应用集成 patch
simdopt bench <baseline> <candidate>     # 运行预注册 A/B
simdopt report <run-id>                  # 静态/动态/统计统一报告
simdopt pipeline <experiment.yaml>       # 串联上述步骤并缓存
```

每个命令读取显式输入、输出 manifest，失败使用非零退出码；`search` 不应自动覆盖 x265，`bench` 不应接受未通过 verify 的 candidate，`pipeline` 不应隐藏实际子命令和日志。CLI schema 在 M1 冻结 v1，后续破坏性修改提升 schema version。
