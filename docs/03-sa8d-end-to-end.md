# SA8D 端到端纵向切片

本路线先完成 8-bit `sa8d 8x8` 的 NEON128 闭环，再扩展到 `16x16` 和 SVE2/VL=256。选择它的原因是：计算图有限、纯整数、无输出内存写、x265 已有 C/NEON/SVE2 和 TestBench，可同时覆盖 load provenance、二维 Hadamard、转置/重排、abs、归约与舍入。

## 0. 首轮边界

首轮只承诺：

- x265 固定 commit；
- 8-bit build；
- `sa8d 8x8`，随后 `16x16`；
- 当前 N1 的 NEON128 target；
- intrinsics codegen；
- 离线搜索；
- bit-exact 输出；
- 单线程 latency 为主指标。

首轮不同时解决 10/12-bit、全部 CU shape、普通 SVE、SVE2、assembly codegen 和在线 JIT。每增加一个维度前先复制上一阶段全部证据。

## S0：冻结 x265 与未修改基线

### 工作

1. 初始化项目 Git；把 x265 以固定 commit 的 submodule 或只读 worktree 纳入，记录选择。
2. 安装 M0 工具并生成环境 manifest。
3. 以 Release、8-bit、`ENABLE_TESTS=ON` 构建未修改 x265。
4. 保存 C 与 `--cpuid NEON` 的 `TestBench --testbench pixel --nobench` 输出。
5. 建立独立 SA8D microbench；同一 binary 暴露 C reference、上游 NEON 和空 harness。
6. 在 N1 上采集 baseline latency、cycles、instructions、静态 disassembly 与代码尺寸。

### 建议命令形状

实际 path/flags 由 M0 固化；下列是意图，不可复制后忽略 configure 输出：

```sh
cmake -S third_party/x265/source -B build/x265-8-neon \
  -G Ninja -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTS=ON \
  -DHIGH_BIT_DEPTH=OFF -DENABLE_SVE=OFF
cmake --build build/x265-8-neon --target TestBench
build/x265-8-neon/TestBench --cpuid NEON --testbench pixel --nobench
```

注意：上游 CMake 的 feature 依赖需要由 configure 日志核实。N1 没有 I8MM/SVE，构建不得通过强制 cpuid 在该机执行不支持指令。

### 退出条件

- baseline 可以从干净工作区一条命令重建；
- correctness 连续通过；
- microbench 30 个有效 sample 的变异系数达到评测规范门限，否则先治理噪声；
- symbol 边界、编译器 flags、binary hash 和原始输出已归档。

## S1：建立可执行规格与 contract

### 精确语义

从 x265 `source/common/pixel.cpp` 的 reference 派生 canonical SA8D 规格。令 `W8` 为 x265 采用的未归一化 8 点 Walsh-Hadamard 矩阵（元素为 `+1/-1`），对每个 8x8 tile 定义：

```text
D[y,x] = signed(A[y,x]) - signed(B[y,x])
T       = W8 * D * transpose(W8)
R8      = sum(y=0..7, x=0..7, abs(T[y,x]))

sa8d8x8(A, B) = (R8 + 2) >> 2
```

`16x16` 先分别计算四个 8x8 tile 的未归一化绝对值和，再统一舍入：

```text
sa8d16x16(A, B) = (R8_00 + R8_01 + R8_10 + R8_11 + 2) >> 2
```

这两个舍入边界是 contract，不是搜索器可自由移动的代数节点。`16x16` 不能实现为四个已经舍入的 `sa8d8x8` 之和。x265 的 `32x32`/`64x64` 则是多个**已经归一化的 `sa8d16x16` 结果**相加；不能反过来把所有 16x16 tile 的 `+2 >> 2` 推迟到整个大块末尾。实现时仍须用冻结提交的 executable oracle 和源码锁定 `W8` 的具体 stage 排列及所有 shape wrapper。

### provenance

建立 128 个输入逻辑元素：

```text
A[y,x] = load(pixel_a, y * stride_a + x)
B[y,x] = load(pixel_b, y * stride_b + x)
D[y,x] = sext(A[y,x]) - sext(B[y,x])
```

8-bit 输入给出以下保守范围证明：

```text
D[y,x]                  in [-255, 255]
abs(1D Hadamard value) <= 8 * 255  = 2040
abs(2D coefficient)    <= 8 * 2040 = 16320
R8                     <= 64 * 16320 = 1044480
```

因此 1D/2D 单系数可安全放入有符号 16-bit，且绝不会产生 `INT16_MIN`，所以对该已证明范围执行 s16 `abs` 不会触及 `abs(INT16_MIN)` 的特殊行为；`R8` 及跨 tile 累加必须使用足够宽的类型。range report 仍要逐 stage 验证，因为具体 butterfly 的暂存范围也是合法变换的前提。

这些结论**只适用于 8-bit**。10/12-bit 必须从各自输入范围重新证明每个 stage、绝对值与归约宽度；例如简单上界已经使 10-bit 的 2D 系数超过 s16，不能复用 8-bit 的 narrowing、`abs` 或 overflow 结论。

### 测试向量

固定 corpus 至少含：

- 全 0、全最大、A=B；
- 0/max 互换、棋盘、水平/垂直条纹；
- 单像素 impulse，遍历 64 个位置和正/负方向；
- ramp 与每 bit 单独置位；
- PRNG 固定 seed 随机样本；
- 最小 stride、常见 stride、非 16-byte 对齐、stride 0（仅在 contract/调用点证明合法时）；
- guard page 紧邻合法 footprint，捕获隐式 over-read。

### 退出条件

canonical interpreter/DSL 对 x265 C oracle 在固定 corpus、至少百万级随机 case 和 sanitizer/guard-page case 上一致；输出 `spec.ir.json`、可读 DOT 和 range report。

## S2：导入现有 NEON 作为 seed schedule

### 工作

1. 为 `pixel_sa8d_8x8_neon` 建立与真实 x265 宏一致的 wrapper translation unit。
2. 保存预处理源、Clang AST、`-O0/-O2` LLVM IR、object 和 symbol disassembly。
3. 把以下 target 语义导入 seed MachineIR：8x8 load、u8 difference widening、s16 butterfly、transpose/zip、absolute pair、widening reduction。
4. 用 AArch64 语义解释 seed MachineIR，将每个 vector lane 追溯到 `A[y,x]` / `B[y,x]`，再投影出不含 intrinsic/opcode 的 PackIR layout seed。
5. translation-validate seed MachineIR 的可观察语义与 S1 SpecIR。
6. 从 seed MachineIR 原样 codegen 一个 `seed-roundtrip` candidate。

### 退出条件

- 不存在 opaque/unknown instruction；
- lane provenance 覆盖全部活跃 lane，inactive/dont-care lane 显式标注；
- PackIR schema/verifier 拒绝 intrinsic、opcode、具体寄存器和指令顺序；
- roundtrip candidate 通过 S1 全部测试与 x265 TestBench；
- 最终汇编与上游基线差异有逐项解释；性能若偏离超过 3%，先修复导入/codegen，不进入搜索。

## S3：构建 SA8D 最小 AArch64 语义与成本库

只为最终 disassembly 中出现以及候选明确需要的形式建库，典型类别包括：

- scalar/address update 与 64-bit GPR load addressing；
- NEON 64/128-bit load；
- u8 到 s16 的 widen/difference；
- s16 add/sub/abs/max；
- `trn/zip/uzp/ext/tbl` 等实际出现的 lane mapping；
- pairwise widening add 与 horizontal reduction；
- 目标 compiler 生成的 move/return。

每个 form 完成 encoding round-trip、随机语义测试和 N1 latency/throughput microbench（能可靠测量时）。N1 profile 中区分 critical-path latency 与 reciprocal throughput，不用一项“指令成本”代替。

### 退出条件

seed candidate 100% opcode 有语义；静态 cost report 能解释其关键路径、load/store、permute、峰值 live vector 和 spill；预测数据注明来源和置信度。

## S4：分层搜索 NEON128 候选

按风险从低到高开启搜索：

1. **Peephole**：合并连续 permute、删除 dead lane/move、改变 reduction tree。
2. **Butterfly layout**：枚举 row-pair/column-pair packing，比较显式 transpose 与 butterfly 中隐含重排。
3. **Load/compute fusion**：在不 over-read 的前提下改变 load grouping 和 widen-sub 组合。
4. **跨 block fusion**：到 `16x16` 时并行处理两个或四个 8x8，延后归约并复用 address/constant。
5. **Schedule/register allocation**：在 N1 资源模型下安排独立 butterfly，拒绝 spill。

每阶段都保留 seed，给出预算：最大候选数、beam width、超时、临时寄存器数和允许 opcode。第一轮不让 ML 模型直接生成未经语义库约束的汇编。

### 候选淘汰漏斗

```text
所有枚举候选
 -> IR verifier
 -> 静态成本 top K（例如 100）
 -> SMT/解释器正确 top K
 -> 编译后无未知/无 spill top N（例如 20）
 -> 快速 native benchmark top M（例如 5）
 -> 完整 correctness + 稳健 benchmark
```

K/N/M 是配置而非硬编码；每轮报告搜索空间和淘汰原因。

## S5：生成、独立验证与 x265 注入

### 生成产物

- `generated/sa8d/sa8d_8x8_neon_<candidate>.cpp`；
- target/feature manifest；
- expected opcode pattern 与最终 disassembly；
- standalone wrapper；
- x265 slot 映射 patch。

### 注入方式

在 `ENABLE_A64_DYNOPT` 下编译生成 translation unit，并在 AArch64 primitive setup 的最后一步：

```text
p.cu[BLOCK_8x8].sa8d = dynopt_sa8d_8x8_neon_<id>;
```

实际代码须沿用 x265 namespace/PFX/bit-depth 约定。保留三个同 binary 可调用入口：C reference、上游 NEON baseline、dynopt candidate；避免分别构建 binary 带来的链接布局与编译漂移。

### 正确性门禁

1. SpecIR/MachineIR translation validation；
2. standalone fixed + random + guard-page；
3. ASan/UBSan build；
4. `TestBench --cpuid NEON --testbench pixel --nobench`；
5. 8-bit smoke/regression encodes，baseline/candidate 输出验证；
6. AAPCS64 与 callee-saved/stack/alignment 检查。

任何失败都先最小化 counterexample，并回灌固定 corpus，随后才改规则或候选。

## S6：性能和指令对比

同一次 run 同时测 baseline 与 candidate，使用随机化/交替次序。至少报告：

| 指标 | 获取方式 |
| --- | --- |
| symbol 静态总指令 | `llvm-objdump`，按 symbol 边界解析 |
| 静态 SIMD / permute / load-store / branch | opcode 分类器，保存未知类 |
| 动态 instructions/call | `perf stat` 批量调用，扣空 harness |
| cycles/call | PMU cycles，扣空 harness |
| latency distribution | 独立 microbench 原始 samples |
| code bytes | ELF symbol size/section |
| spill | disassembly + stack memory classifier |
| x265 TestBench | 作为兼容的辅助速度指标 |

第一条链路验收要求 candidate 在 N1 上 bit-exact，且性能无回退；是否达到对应档位性能目标不作为 SA8D MVP 跑通的必要条件。若变快，必须重复完整规范；若只减少静态指令但实机更慢，候选不替换 baseline，不过该负结果进入 cost-model 数据集。

## S7：扩展到 `16x16` 和 shape family

`16x16` 是验证跨 tile 优化的关键：

- 正确保留 `(R8_00 + R8_01 + R8_10 + R8_11 + 2) >> 2`，禁止先分别舍入四个 8x8；
- 比较调用/内联四个 8x8、交错两个 tile、四 tile 同时累加；
- 测量峰值 live register 和 spill；
- 再用模板/loop 组合出 32x32、64x64；它们累加已归一化的 16x16 返回值，禁止把舍入推到整个大块末尾，并按真实 workload 权重评估代码体积与性能。

在 `8x8` 与 `16x16` 都闭环前，不宣称优化器已具备 SA8D family 泛化能力。

## S8：从同一 SpecIR 生成 SVE2 VL=256

### 目标澄清

上游审计显示 SA8D 扩展实现属于 SVE2。首个 256-bit 目标建议明确为 `sve2-vl256`，另设 `sve-vla` 研究任务；不要把两者混成一个 backend。

### 工作

1. 申请/准备 QEMU 功能节点与真实 SVE2 VL=256 节点。
2. 扩展 PackIR：16 个 i16 lane、predicate、NEON-SVE bridge 与 reduction。
3. 从 SpecIR 重新枚举布局；NEON PackIR 只作 seed/对照，不作机械翻译模板。
4. 比较一个 8x8、两个 8x8 或 16x16 row pair 填满 256-bit 的策略。
5. 与同一 SVE2 硬件上的上游 x265 最佳实现比较，而非只与 N1 NEON 数字比较。
6. 在至少另一 VL 上验证 VLA 候选；固定 VL 候选必须验证 runtime dispatch。

### 退出条件

- QEMU 和真实硬件均 bit-exact；
- candidate manifest 明确 `sve2` 与 VL 合同；
- VL mismatch 时绝不 dispatch；
- 正式性能来自真实硬件，报告 CPU/VL/频率环境；
- 上游 SVE2 baseline 与 dynopt candidate 的完整 A/B 数据留档。

## S9：首条链路交付包

SA8D 纵向切片最终交付：

```text
contracts/sa8d_8x8_u8.yaml
kernels/sa8d/spec.*
optimizer 可复现入口
ISA semantics/tests
NEON 与 SVE2 target profiles
所有被接受 candidate manifests
x265 integration patch
standalone + x265 correctness logs
raw benchmark + statistical report
instruction reports
一份失败候选/负结果摘要
expert-advice 对应轮次与采纳决策
```

### Definition of Done

- 从干净 checkout 运行一条受控 pipeline 能重建候选；
- 所有正确性门禁通过；
- NEON 实机和 SVE2/VL=256 实机结果均有证据，若硬件未就绪则明确标记未完成；
- x265 默认行为不变，打开开关才注入；
- 关闭开关无需删除生成代码即可回退；
- 报告区分 static count、dynamic instructions、PMU cycles 与墙钟时间；
- 不把 QEMU、相对 C 或跨机器数字包装成目标性能提升。
