## 总判定

窄义上确认，广义上反驳：

- **事实**：按等工作量比较，x2 是 317 条处理两块，两个 x1 是 \(2×309=618\) 条，因此归一化 total 减少 48.7%；SIMD 是 \(204\) 对 \(2×202=404\)，减少 49.5%。[iteration.md](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m8-sve-pack/iteration.md:43)
- **事实**：这不是“代码尺寸每 tile 减半”。x2 函数体反而从 309 增至 317 条；准确表述应是“直线执行路径的归一化静态指令/tile 约减半”。
- **推断**：因为函数无循环、每调用路径固定，这个指标是合理的早期筛选代理，也强烈暗示 retired instructions/tile 会下降。
- **不成立**：它尚不能推出周期、吞吐或相对上游最佳 SVE2 实现快约 2 倍。
- **状态建议**：可以接受“VL=256 下同一图能打包两块”这个窄假设，但 M8 整体不宜标为性能 `accepted`；更符合项目协议的是“functional proof / `blocked-environment`”。当前记录同时写了 `accepted` 和性能 blocked，[manifest.yaml](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m8-sve-pack/manifest.yaml:1)，而协议规定 `accepted` 应满足全部门禁。[06-agent-iteration-protocol.md](/home/chiro/projects/a64-simd-dyn-optimizer/docs/06-agent-iteration-protocol.md:78)

## 1. 静态计数还缺什么

**事实**

- 当前计数来自独立 `.o`，不是生产 flags 下最终 linked binary 的目标 symbol。[build-sve-sa8d.sh](/home/chiro/projects/a64-simd-dyn-optimizer/scripts/build-sve-sa8d.sh:25)
- 计数脚本默认统计对象内所有函数，构建时未传 `--function`。[count_asm_insns.py](/home/chiro/projects/a64-simd-dyn-optimizer/tools/count_asm_insns.py:20)
- “SIMD”只是按操作数中出现 `z/p/v` 的正则分类；会漏掉 `cnth`、部分 `fmov`，明细中的 `[SIMD]` 也不表示同助记符的所有实例都是 SIMD。因此 total 比 SIMD 子计数更可信。
- 基线是机械生成的单-tile SVE2，而不是同机、同 VL 的上游最佳实现。

**需补证据**

1. 用生产编译器、完整 x265 flags、实际 `-mcpu`，保存最终 linked symbol 的：

   - total/code bytes/rodata；
   - compute、permute、load、predicate、scalar-address 分类；
   - spill、峰值 live Z/P 寄存器；
   - binary/object hash。

2. 用 QEMU plugin/trace 对相同两-tile 工作量统计 guest 动态指令。它可以证明“实际执行了更少的架构指令”，但 QEMU 墙钟时间不能当硬件性能。

3. 最终仍需真实 VL=256 上的 paired A/B：cycles、retired instructions、load/cache 事件和置信区间。静态计数可以作为主筛选信号，不能作为接受指标。[04-validation-benchmark.md](/home/chiro/projects/a64-simd-dyn-optimizer/docs/04-validation-benchmark.md:191)

## 2. Correctness、ABI 与 VL 风险

按严重性排序：

### 1. VL=512 常量索引加载确定越界

**事实**：每个索引数组只有 16×u16，即 32 字节；却用 `svld1_u16(svptrue_b16(), ...)`。[x2 generated](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp:73) VL=512 时 `svptrue_b16()` 激活 32 个 halfword，单次读 64 字节，越过数组对象。单-tile 版本也有同一问题。[single generated](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_8x8.cpp:73)

因此：

- VL=256 数组读恰好在界内；
- VL=512 的 0 mismatch 只能说明越界部分碰巧未流入前 16 个可观察 lane，不能证明内存安全；
- 该 VL=512 结果不应列为有效 correctness 门禁。

**需实验/修正**：索引 load 和 index arithmetic 使用活动前缀谓词，而不是 `svptrue`，随后做 ASan/guard 验证。

### 2. VL<256 会静默只算 tile A

**事实**：VL=128 只有 8 个 s16 lane，不存在注释中所谓“low 16 lanes”。[codegen.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:210) `svwhilelt_b16(0,16)` 在 VL=128 只激活 8 lane；全和减低半得到高半为零，函数返回 tile A。

因此 x2 合同必须是：

- exact VL=256；或
- VL≥256 的 VLA-minimum 合同，并修复索引越界。

还应在程序中打印/断言实际 `svcntb()`；`sve-max-vq` 是 CPU 最大能力参数，日志目前没有直接记录线程实际 VL。生产环境还需验证 worker 线程的 VL 继承和 dispatch。

### 3. 输入 load 本身不要求对齐，但扩大了 footprint

**事实**：`svld1ub_u16(pg16, ptr)` 在正常内存上允许未对齐，并且谓词下恰好访问每行 16 字节，不会因 Z 寄存器更宽自动 over-read。[x2 generated](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp:8)

真正的风险是调用合同：

- 原 8x8 调用只保证每行 8 字节时，x2 会读到合同之外；
- x2 必须证明两个水平相邻 tile 同时存在，每行至少 16 字节可访问；
- 现有验证器主动分配了宽松 padding，只测试正 stride≥16，没有 guard page、负 stride或恰好位于边界的布局。[sve_verify.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_verify.cpp:59)

### 4. 当前 rounding 对自定义 x2 oracle 正确，但不能直接接入 16x16

**事实**：当前函数返回：

\[
round(A)+round(B)
\]

验证器的 oracle 也明确这样定义。[sve_verify.cpp](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/sve_verify.cpp:123) 低半/全和减低半的归约方法在 VL≥256 下成立，每块分别 `(+1)>>1` 也保持两块独立舍入。[x2 generated](/home/chiro/projects/a64-simd-dyn-optimizer/generated/sa8d/sve_roundtrip_sa8d_8x8x2.cpp:204)

但 x265 16x16 要求四个未舍入 R8 累加后只舍入一次。[spec.py](/home/chiro/projects/a64-simd-dyn-optimizer/kernels/sa8d/spec.py:106) 所以：

- 它不能注册为单 8x8 primitive；
- 两次调用当前 x2 也不能组成 bit-exact 16x16；
- 若调用者需要 A、B 两个独立结果，当前单个 `int` 返回值已经丢失信息。

最自然的集成合同是让内部 x2 helper 返回“两块未舍入 half-R8 的和”，上下两次 x2 累加后在 16x16 边界统一舍入。

### 5. ABI 风险较低，但门禁尚未完成

**推断**：接口只有普通指针、`intptr_t` 和 `int`，SVE 类型未进入函数 ABI，intrinsics 也让编译器负责寄存器保存，因此比手写汇编安全。

**需验证**：

- 最终 x265 flags 下的 callee-saved、SP 对齐、BTI/branch protection、返回高位；
- SVE feature/VL dispatch；
- TestBench、guard page、ASan/UBSan；
- 正 stride 是否正式写入合同；
- x2 pack 目前只存在于 codegen 特判中，IR 本身看不见扩大的 footprint、tile 数和舍入边界，现有 IR verifier无法验证这些变化。[codegen.py](/home/chiro/projects/a64-simd-dyn-optimizer/optimizer/ir/codegen.py:296)

## 3. 下一轮实验排序

先做一个不计入优化收益的零号门禁：修复索引越界、记录实际 VL、明确 x2 的 raw/rounded 返回合同，并加入 guard-page 测试。

### 1. Typed shuffle 直接 lowering，hoist 作为对照

这是信息增益最高的一项。

**事实**：MachineIR 的 24 个 shuffle 并不是任意 table lookup；它们正好是 i16/i32/i64 三种粒度的 `TRN1/TRN2`，六种 mask 各重复四次。例如 i32 mask 可见 [machine-ir.json](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m2-seed/imported/machine-ir.json:803)。

建议同轮比较：

- A：按原元素类型直接生成 `svtrn1/2_u16/u32/u64`；
- B：保留 `svtbl2`，但将六个重复 index 向量公共化/按阶段 hoist；
- C：当前实现。

直接 TRN 有机会在保持 24 条 permute 的同时删除 48 `ld1h`、20 `mad` 和大部分常量地址计算；reinterpret 通常是零指令。hoist 只应作为编译器/CSE与寄存器压力对照。

注意：普通 SVE `ZIP/TRN/UZP` 不是统一的“128-bit 段内”操作，不能不经证明地替换任意 mask。真正的 `ZIPQ/UZPQ/TBLQ` 是 SVE2p1，当前 `sve2` 目标不能默认使用。[M7 coverage](/home/chiro/projects/a64-simd-dyn-optimizer/experiments/m7-isa-coverage/README.md:44)

主指标应是最终 symbol 的 guest 动态指令/two tiles、load 指令、spill、code+rodata，而不是只看源码节点数。

### 2. 用两个 x2 wave 构建合法 16x16 raw helper

**事实纠正**：VL=256 只有 \(256/16=16\) 个 s16 lane。当前 x2 已经把计算 lane 用满；“4 tile、32 个 s16 lane 用满 VL=256”在位宽上不可能。四 tile 单 Z 打包需要 VL=512。

VL=256 上有意义的替代实验是：

- 顶部两个水平 tile 用一个 x2 wave；
- 底部两个用第二个 x2 wave；
- 返回/累加未舍入 half-R8；
- 四 tile 统一做一次 16x16 rounding。

这会同时验证真实可注册 shape、footprint、调用开销和每 tile 动态摊销。若只是用两个 Z 寄存器复制两份 x2 图，而不融合地址或归约，不能期待再次“每 tile 减半”。

### 3. 再做 MachineIR 区域级布局融合

仅在实验 1 后仍有明显 permute 成本时进行。把 `tile-pack`、元素粒度、predicate、raw/rounded reduction 显式放进 IR，然后允许：

- Hadamard stage/layout 重排；
- producer/consumer 吸收相邻 TRN；
- 延迟物化中间布局；
- 以最终汇编、峰值 live Z/P、spill和动态 guest instructions 计成本。

这比在 codegen 中逐节点翻译更可能继续降低真实指令，但不应先于显而易见的 typed-TRN lowering。

## 4. 继续 SVE 还是转 DCT/interp8

**事实**：路线图要求 M6 的性能闭环必须有真实 VL=256 paired A/B；没有硬件时只能称功能部分完成。[05-roadmap.md](/home/chiro/projects/a64-simd-dyn-optimizer/docs/05-roadmap.md:143) 项目停止条件也明确包括“缺少目标硬件，所有不依赖该硬件的功能工作已完成”。[08-risks-and-decisions.md](/home/chiro/projects/a64-simd-dyn-optimizer/docs/08-risks-and-decisions.md:82)

**建议**

- 再做一个有明确上界的 SVE foundation 轮：零号门禁 + typed TRN + 合法 16x16 raw 接口。
- 完成后将 M6 冻结为 `blocked-environment`，不要继续按静态计数生产更多“赢家”。
- 只继续建设能复用于其他 family 的工具：typed shuffle 语义、VL/predicate verifier、guard、QEMU guest instruction counter、IR 中的 raw/rounded类型。
- 转向可在 N1 实测的下一个热点，先由真实 x265 profile 决定 DCT 还是 interp8。没有 profile 时，我倾向先做 DCT8：它能直接复用当前 transpose/layout/rounding 工具，内存与边界合同也比 interp8 简单；若 profile 明确显示 interp8 占比更高，则服从 profile。

建议停止门槛：

- 无实机阶段：上述目标无关门禁完成后立即停止新增 SVE SA8D 静态候选。
- 实机到位后：最多测试三个正交、bit-exact、无 spill 的候选；若 paired median 均不足 1.03，或 95% CI 下界不能超过 1.00，则停止该路线。
- 若收益所需的相邻 tile/stride/VL 前置条件不能由所有目标调用点保证，也直接停止部署该候选。

本次仅做了只读审阅，未修改仓库。