# 方向梳理与问题答复（2026-08-14）

## 1. 问题答复

### 1.1 QEMU 上游是否支持 SVE2p3？

**不支持**。本机 QEMU 11.0.3 实测执行 `sdot z.h, z.b, z.b`（SVE2p3
SDOT BtoH）报 Illegal instruction；docs/11 §10 记录上游 2026-06 才有
SVE2p2，master 无 SVE2p3（内部 QEMU 支持但本项目不可访问）。

行动：已按用户建议派 subagent（deepseek-v4-flash）为本地 QEMU 补
SDOT BtoH（补丁目标 `patches/qemu-sve2p3-sdot-btoh.patch` + 构建
验证），完成后即可本地验证 SVE2p3 kernel（interp8 方案 B 等）。

### 1.2 950/960 环境

外网拿不到、内部测试困难——已记录；有机会时用户再反馈实测数据。
验收命令（docs/27）与微基准已就绪，随时可跑。

### 1.3 920B 实机 vs MCA 对齐精度

现状数据点（CNTVCT paired / NV2 MCA 代理）：

| 候选 | MCA（NV2） | 920B 实测（替换版 p50） | 观察 |
| --- | ---: | ---: | ---: |
| idct32 zip32 sdot | 1164 | ~148 | MCA/实机 ≈7.9 |
| idct32 scalar sdot | ~3200 | ~208（由 ratio 0.76 反推） | MCA/实机 ≈15.4 |
| dct32（950 实机） | 1041 | 985~995 | ≈1.05，对齐很好 |
| dct8（920B，2026-08-14 新增） | NEON 96 / cand 118（+23%） | NEON p50 3 / cand p50 5（+67%） | MCA 低估 dct8 惩罚 |

观察：**MCA 与 920B 的排序一致**（zip32 快、scalar 慢），但 MCA
把 scalar 写回代价放大得比实机多（2.7× vs 1.4×）。替换版是 BtoS
形状（可能高估真实 HtoS 工作量），实机参考对相对排序可信、绝对值
需保守解读。继续用 `--bench-920b` 积累样本，再做分级校准
（dct32 的 950 数据说明 NV2 模型在同宽 SVE 上可相当准）。dct8
新样本显示 MCA 会**低估** tiny kernel 的实机惩罚（+23% vs +67%），
与 idct32 的“高估 scalar 惩罚”方向相反——模型对内存/标量开销的
权重在不同规模 kernel 上不一致，需按 kernel 分级校准。

### 1.4 直接 asm 原型为什么终止

M1（idct32 O 阶段固定寄存器汇编）成功：峰值 12 Z、零 spill、QEMU
对照 bad=0。M2 分析发现 **t/u 蝶形在位化困难**：
- `t_k=E_k+O_k`、`u_k=E_{15-k}-O_{15-k}`，每个 E/O 值被 t 与 u 各消费
  一次；32 个 Z 全被 16×E + 16×O 占用时，任何目标寄存器覆盖都会破坏
  另一个源的后续消费；
- 最小正确序列需 1 个 scratch：mov+sub+add = **3 条/k = 48 ops/chunk**，
  而 C++ 只需 32（add/sub）；
- 每 chunk 的 asm 净收益 = spill 节省 ~54 − 蝶形多出 16 ≈ 38 ops，
  预期 MCA 收益 ≤3-5%，不敌实现/维护成本；
- 按 docs/28 止损规则终止；M1 生成器保留为 pressure-budgeted 工具基础。

### 1.5 已排除方向

- **NEON→NEON（a位）**：暂不尝试；
- **算子间融合（dct+quant 等）**：暂不尝试；
- **直接 asm 原型**：已终止（见 1.4）；
- **dct8 sdot-s32 判低价值**：需修正（见 1.7）。

### 1.6 SVE2p3 方向

值得探索。具体目标：interp8 方案 B（`sdot z.h,z.b,z.b`，预估 fused
~100，-35% vs 当前 127）；QEMU 补丁完成后可本地验证 + MCA（自定义
llvm-mca 已补 BtoH 调度）+ 920B 替换预估三条线并行。

### 1.7 dct8 是否还能提一提

**能，且有个认知修正**：本项目 dct8 当前实现**已经使用 SVE
`sdot z.d,z.h,z.h`（HtoD）**（emitter 经 `svdot_s64` + NEON bridge，
与用户内部 dct8 同指令族）；当前 best vector 355 / dynamic 492。
可再提的方向：
- **HtoS（`sdot z.s,z.h,z.h`，SVE2p1 4-way）**：每指令 4 个半字点积
  （vs HtoD 2-way），dot 指令数约减半；DCT8 数值范围（[-255,255]×8
  项）s32 无溢出风险。可用现有 **920B 替换预估流**先估性能，再决定
  是否实现；
- 布局搜索空间目前只有 k_tile 轴（1 个通过候选），可加轴。

**2026-08-14 新增实测**（`benchmarks/dct8_microbench.cpp`，920B
CNTVCT paired）：当前 dct8（SVE HtoD 移植版）**比上游 NEON 慢
~67%**（p50 5 vs 3；MCA 仅 +23%）——不是“已近地板”，而是明显
落后。提升方向优先：HtoS 减半 dot + 减少 pass 间内存往返（当前
动态 492 中 str/ldr 占比高），可用 920B 直接实测迭代（dct8 全为
SVE1/NEON，无需替换）。

**2026-08-14 追加定位**：我们的 dct8 移植版比**上游 dct8_sve 还差**
（动态 492 vs 310，MCA 118 vs 77，920B p50 5 vs 4）——所谓
“op-for-op 移植”实际多了 ~180 条指令（NEON bridge 的 8-lane 存取/
vpadd/rshrn 与 sdot 的 movprfx 零初始化）。上游 SVE 本身也比 NEON
慢 33%（p50 4 vs 3，同宽 920B）。因此 dct8 两步走：
1. **纯 SVE 重写对齐上游**（310 dyn / MCA 77 / p50 4）：去掉 NEON
   bridge；
2. **寄存器驻留中间量 + HtoS（4-way）**（目标 ≤NEON p50 3）：把两趟
   pass 的中间量留在 SVE 寄存器（当前 str/ldr 往返 ~40 条），odd 用
   sdot z.s,z.h,z.h（SVE2p1，920B 用替换预估流验证）。
设计见 docs/31（待写）。

### 1.8 interp8 优化现状

方案 A（SVE2-safe sdot.d + NEON bridge）已落地：**fused 127**（基线
141，-10%），TestBenchLite gate + 20k 全过；方案 B（SVE2p3 sdot.h）
预估 ~100（-35%）此前被 QEMU/960 阻塞——QEMU 补丁将解除本地验证
阻塞。

## 2. 方向整理（优先级）

**P0：QEMU SVE2p3（进行中，subagent）→ interp8 方案 B**
- 补丁验证后：实现 interp8 sdot.h 方案、20k/lite、MCA、920B 替换预估。

**P1：dct8 提一提**
- 评估 HtoS（SVE2p1）变体：先 920B 替换预估 + MCA，显著再实现；
- 顺带扩展 dct8 布局轴。

**P2：920B/MCA 对齐精度评估**
- 用 `--bench-920b` 积累候选样本（现在 3 点），做相对排序一致性
  与分级校准；dct32 950 数据作为“同宽 SVE 上 NV2 准”的正例。

**P3：等 950/960 实机验收**（用户反馈数据后执行 docs/27 命令）。

**明确不做**：NEON→NEON、算子融合、直接 asm 原型（已终止）、
dct+quant。
