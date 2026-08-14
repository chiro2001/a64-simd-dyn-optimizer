# interp8（8-bit 水平 8-tap）评估（2026-08-13）

> `interp8_hpp` 只存在于 HIGH_BIT_DEPTH 构建；8-bit 库的对应原语是
> `x265::interp_horiz_pp_neon<8, W, H>`（filter-prim.cpp），本节评估
> 8x8 实例（luma 8-tap 水平）。

## 基线（QEMU VL=256，true-dynamic，单次调用）

| 指标 | 值 |
| --- | ---: |
| dynamic total | 162 |
| 向量 raw | 141 |
| 其中 load（ld1/ldr/ldp/ldur） | 56 |
| 计算（umull/uaddw/umlal/umlsl/sqrshrun/movi 等） | ~106 |

- **计算 bound 成立**（SIMD 计算 106 > load 56，满足用户规则）；
- 指令构成：umull 16 + uaddw 16 + umlal 16 + umlsl 8 + sqrshrun 8 +
  movi 5 + ldur 47 + ldr 9 + str 8 + 标量地址 ~30。

## SVE256 机会（v3 切片技术的直接应用）

8-tap FIR 每输出 = 8 项点积；与 DCT32 v3 同构：
- 4 个输出位置的 4-tap 切片打包进 16-lane 寄存器，
  `sdot .d`（s16 系数 × u8 数据，注意符号扩展）+ 双份常量；
- 归约 uzp1+rshrnb+向量存储；
- 两个 4-tap 半程共享同一数据窗（卷积的滑动窗口），
  切片可跨输出复用；
- 预估 fused 141 → ~70-90（接近减半）。

## 状态与下一步

- 已具备接入条件：manifest/gen_verify 需扩展 filter 形状
  （u8→u8、stride×2、coeffIdx 参数）；
- 下一步：建立 kernels/interp8 manifest + 差分（vs
  `interp_horiz_pp_neon<8,8,8>`）+ v3 切片发射器；
- 实机验收仍等 960/950；920B 为 SVE1，仅可跑 NEON 对照。

## 3. 实现路径评估（2026-08-13 深夜）

语义：`src -= 3`；8-tap FIR；`vqrshrun_n_s16(d, IF_FILTER_PREC=6)`
（饱和舍入窄化 s16→u8）；coeffIdx=1/2/3 三相位。

方案 A（SVE2-safe，sdot .d）：每行 1 次 16 字节窗载入 +
4 tbl 切片 + 4 sdot .d + uzp1/rshrnb 归约 + NEON bridge
`vqrshrun_n_s16` 收窄。预估 **~136 vs 上游 162（-16%）**——
收益主要来自 8 行合计 47 条 ldur 降到 8 条 ld1h；tbl 打包成本
吃掉一半收益。

方案 B（SVE2p1，sdot .h）：`svdot_s16`（s8→s16，每指令 8 输出 ×
2 项）+ 每行 4 sdot.h + 1 次收窄，预估 **~100-105（-35%）**。
但 **GCC 16.1 缺失 `svdot_s16` 与 s16→s8 饱和窄化 intrinsic**
（svsqrshrunb_n_s8 等均不存在），需走 asm backend（参考
emit_dct16_sve2_asm.py），且目标必须是 SVE2p1（960 可，920G 未知）。

结论：interp8 值得投入但优先级低于已收敛的 dct 族；先做方案 A
（SVE2-safe，-16%）建立管线，SVE2p1 asm 路径作为后续轴。

## 4. 方案 A 实测（2026-08-13 深夜）

已落地 `kernels/interp8`（manifest + gen_verify interp8 shape + 发射器 +
搜索注册）：

| 实现 | dynamic | vector | movprfx | fused_uop |
| --- | ---: | ---: | ---: | ---: |
| 上游 interp_horiz_pp_neon<8,8,8> | 162 | 141 | 0 | 141 |
| 工具 path-a（sdot.d 切片，合并归约） | 193 | 143 | 16 | **127** |

- 2 万例 × 3 相位差分 0（upstream-exact）；fused_uop **-10%**；
- 第二次迭代（合并归约）：两个半程的 uzp1 结果经 tbl2_s32（注意 s32
  tbl2 索引 8-15 选第二个源，不是 16-23）合并成 8-lane 后一次
  rshrnb+uzp1_s16+vqmovun+整行存储，134 → 127；
- 实际收益仍低于预估（-16%）：ldur 47→8 的节省被 tbl 切片（每行 3）+
  sdot/归约开销抵消；
- 达标路径仍是方案 B（SVE2p1 sdot.h，预估 -35%，GCC 16.1 无 intrinsic，
  需 asm backend）；方案 A 保留为 SVE2 兼容基线。

### 4.1 存储越界修复与 lite 门禁（2026-08-13）

path-a 最初用整宽 SVE 存储：
`svst1_u8(p8b, dst, svset_neonq_u8(svundef_u8(), vcombine_u8(u, ...)))`。
VL=256 时该指令写 **32 字节/行**，只有低 8 字节有效，其余为未定义值，
构成越界写。此前 roundtrip 差分只比较每行前 8 字节，未能发现；
接入 IPFilterHarness 门禁后其**整缓冲 memcmp**（40000 字节，含 0xCD
哨兵）立即 FAIL。

修复：改为 NEON `vst1_u8(dst + r * dstStride, u)`，精确 8 字节/行。
修复后：TestBenchLite `--gate interp8` 5 个 seed 全 PASS、20k 差分 0、
fused_uop 仍 127。这是“lite 门禁比窄差分强”的实证：差分应保留为快速
筛选，验收门禁必须覆盖写足迹。

### 4.2 TestBenchLite interp8 门禁（2026-08-13）

- `tools/testbench_lite.cpp` 新增 `--gate interp8`：复用 x265
  `IPFilterHarness`（100 次 × 3 相位 × 随机/最小/最大输入模式，整缓冲
  比较）；ref = 上游 `interp_horiz_pp_neon<8,8,8>`（upstream-exact
  合同，用户裁定不需要 C ref）。
- `scripts/build-testbench-lite.sh` 编译并链接 `ipfilterharness.cpp`，
  自动携带 interp8 候选对象。
- 门禁接入后发现的越界写已修复（§4.1）。

## 5. 方案 B 工具链实测（2026-08-13）

- `sdot z0.h, z1.b, z2.b`（8-bit→16-bit，8 输出/指令）在
  `-march=armv9.5-a+sve2p3` 下**汇编器可接受**（该编码实际是 SVE2p3，
  不是 SVE2p1；ISA 目录已补 `sve2p3-sdot-h`）；
- **QEMU 11.0.3 执行 SIGILL**（max CPU 未实现 SVE2p3 sdot.h），本环境
  无法验证；需 960 实机或更新 QEMU；
- 方案 B 保持待验证状态，ACLE intrinsic 亦缺失（asm backend 就绪后
  可发射，但正确性门需要能执行它的环境）。

### 5.1 QEMU 更新路径核查（2026-08-13）

核查 QEMU 上游：2026-06-04 才出现 FEAT_SVE2p2（SVEVER>=3）补丁系列
（qemu-arm 邮件列表），GitHub `qemu/qemu` 仓库检索不到任何 SVE2p3
提交。因此**当前无法通过升级 QEMU 解锁 `sdot .h`**；方案 B 验证继续
挂起，等 960 实机或 QEMU SVE2p3 落地后恢复。

### 5.2 SVE2p3 执行 canary（2026-08-13）

- 已落地 `tools/sve2p3_canary.S/.c` + `scripts/sve2p3-canary.sh`：
  纯汇编 `sdot z2.h, z0.b, z1.b`，C 侧按 DDI0602 语义逐 lane 校验
  （连续正数 + 混合符号两组输入）；
- 实测：`aarch64-linux-gnu-as -march=armv9.5-a+sve2p3` 接受编码；
  QEMU 11.0.3 `-cpu max,sve-max-vq=2` 执行 SIGILL，脚本按 exit 3
  报告“执行器无 FEAT_SVE2p3”；
- 未来任一支持 SVE2p3 的执行器（新 QEMU/architectural model/960
  硅片）出现时，先跑 canary 再决定是否接入 interp8 path-B；canary
  不过则 path-B 只能标 `semantic-only`，不得称 upstream-exact。

### 5.3 方案 B 落地（2026-08-14，本地 QEMU SVE2p3 + 差分/门禁全过）

round-0018 交付 SVE2p3 SDOT BtoH（patches/qemu-sve2p3-sdot-btoh.patch，
canary PASS）后，方案 B 得以完整验证。候选已固化：
`kernels/interp8/candidates/best_sve2_sdoth.{cpp,S,o}`
（clang -O3 -march=armv9.4-a+sve2p3；GCC 16.1 同源码可编译且少 1 条）。

**结果（VL=256，单次调用）**

| 实现 | dynamic | vector | movprfx | fused_uop | MCA cycles | 920B LB | NP1 LB |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 上游 interp_horiz_pp_neon<8,8,8> | 172 | 141 | 0 | 141 | 54 | 43.0 | 26.9 |
| 工具 path-a（sdot.d，SVE2） | 193 | 143 | 16 | 127 | 121 | — | — |
| **方案 B sdot.h（clang）** | 156 | 109 | 8 | **101** | 55 | 40.0 | 22.8* |
| 方案 B sdot.h（GCC 16.1） | 146 | 108 | 8 | **100** | 56 | 34.75 | 21.7 |

- 20k 差分 × 3 相位 0 失配（upstream-exact）；常量输入（全 100）全过；
  TestBenchLite `--gate interp8` PASS（自定义 QEMU）。
- fused_uop **-28.4%**（vs 上游 141）；MCA（neoverse-v2 代理 +sve2p3）
  与上游几乎持平（55 vs 54）；表驱动 LB（optimizer/mca_targets.py）
  920B 口径 40~34.75 vs 43（-7%~-19%，GCC 结构更优）。
  NP1 LB 上游以 load（64）为界 26.9，方案 B 前端界 21.7~22.8；标
  `*` 的 clang 版 scalar 项（adrp/csel 探活路径）把 LB 抬到 40，属
  预估器对一次性标量的口径噪声，GCC 分支式相位选择在实机无此问题。
- 结论：方案 B 是首个 **SVE2p3 且通过黄金门禁** 的 interp8 候选，
  指令数显著优于上游；cycle 收益需 960 实机确认（模型口径下收益有限，
  瓶颈已从上游的 load 转到本方案的 tbl/uzp 置换）。

**调试中沉淀的三个语义结论（对工具/后端很重要）**

1. SVE2 “bottom narrow”（`sqrshrunb`/`rshrnb` 等）**把每个结果写进
   16-bit 槽的低字节、高字节清零**（bytes 0,2,4,…），不是紧凑写底半；
   要得到连续字节必须再接 `uzp1`。QEMU 与 LLVM 行为一致；已验收的
   dct32/idct32 内核正是 `rshrnb + uzp1` 组合。首版方案 B 少了这步，
   表现为输出 [p0,0,p1,0,…]。
2. `movprfx Zd, Zn`（无谓词形式）可把累加器初值（含 DC 偏移）折进
   sdot：inline asm 需 `"=&w"` 早截断约束强制 Zd≠Zn 且 sdot 不得复用
   Zd 作非破坏源。8192 偏移**必须拆成每 lane 4096**——对和会把两个
   lane 的偏移相加，直接折 8192 会双计（输出整体偏 8192/64=128）。
3. SVE2 `ADDP`（整数对和）只有**谓词形式** `addp Zd, Pg/m, Zd, Zm`，
   且偶槽取 Zn 对、奇槽取 Zm 对；`addp(t,t)` 产生 [p0,p0,p1,p1,…]，
   `addp(t,zero)` 产生 [p0,0,p1,0,…]，都不能替代 uzp1+uzp2+add 的
   紧凑对和（本 repo 已把该结论留在 emitter 注释里）。

**UDOT BtoH 反面结论（2026-08-14）**：round-0019 落地 UDOT BtoH 后
实测否决了“无符号直算 + 模 2^16 等价”方案：u8×u8 与 s8×s8 只在
**低 8 位**一致，高字节不同（255×185=47175，而 -1×185 ≡ 65351
mod 2^16），16-bit 累加结果并不等价，因此不能免掉每行 `sub #128`。
除非 SVE2p3 存在 mixed-sign（SUDOT）BtoH 且重新处理 4-tap 累加
溢出，否则该轴关闭；方案 B 保持 fused 101/100 为当前最优。

**工具链同步修复（2026-08-14）**

- `tools/parse_qemu_trace.py`：支持自定义 QEMU（disas/objdump.c）的
  `OBJD-T` 无 mnemonic 追踪格式，条目按 `.byte` 进表，交由
  `fix_dynamic_trace.py` objdump 修复（SVE2p3 内核追踪必须走此路径）。
- `tools/search_sve2_layouts.py`：新增 `--mca-arch`；修复动态流 MCA
  的 `.arch` 硬编码 sve2p1 导致 sdot.h 被 llvm-mc 静默跳过的问题。
- **interp8 path B 已接入搜索工具**（2026-08-14）：manifest 增加
  `compute: [sdot-d, sdot-h]` 轴；sdot-h 自动选 `armv9.4-a+sve2p3`
  编译、自定义 QEMU（`DYNOPT_QEMU_SVE2P3`，默认
  `build/qemu-build/qemu-aarch64`）验证/追踪、clang 默认编译器
  （101 fused / 4 stk，GCC 103/14）、MCA 自动 `+sve2p3` + `--mca-arch`。
  端到端实测：sdot-d 127 / MCA 121，sdot-h 101 / MCA 55，20k PASS。
- `optimizer/analysis/cost.py`：CLASSES 补 `sqrshrunb/sqrshrun`、
  `movi/mvni`、`uaddl/umlal` 等（此前这些向量指令被误计为 scalar）。

### 5.4 小形状（8x8）SVE256 收益评估（2026-08-14）

interp8 8x8 每行只有 8 字节有用输出，SVE256 的 32 字节向量 3/4 lane
闲置：指令数 -28%（141→101）但 MCA（55 vs 54）打平，920B 替换预估
（docs/29 §4）反而 1.84x 慢（BtoS 替换高估 dot 工作量，但方向一致）。
结论：**8x8 小形状在 SVE256 上实机大概率打平或落后 NEON**，与
sa8d 8x8 的既有判断一致；本项目 cycle 收益应聚焦 16x16/32x32 等
宽度可充分使用的形状（dct/idct/sa8d16 已验证）。interp8 的
指令数优化保留为工具能力的证据与 960 大形状（16x16/32x32）移植
基础。

### 5.5 大形状 16x16 / 32x32（2026-08-14，同结构 sdot.h）

按 §5.4 结论把 path-B 结构参数化到 n=16/32（emitter `--n`；
每 8-pixel unit 用同一组基础索引向量，unit 1/2 用 +8/+16 移位索引
向量，unit 3（仅 32x32）在 row+24 处再开一个窗口）。20k 差分
× 3 相位 **0 失配**（vs 上游 `interp_horiz_pp_neon<8,16,16>/
<8,32,32>`）。候选固化 `kernels/interp8/candidates/
best_sve2_sdoth_16x16.{cpp,S,o}`、`best_sve2_sdoth_32x32.*`。

| shape | 上游 fused | path-B fused | MCA（NV2 代理） | 920B LB | NP1 LB |
| --- | ---: | ---: | ---: | ---: | ---: |
| 16x16 | 467 | **359（-23%）** | 118 → 121 | 134.25 → 114.25（-15%） | 133.0 → 83.0（-38%） |
| 16x16 addp（§5.7） | 467 | **327（-30%）** | 118 → 114 | — | — |
| 32x32 | 1829 | **1417（-22.5%）** | 374 → 398 | 491 → 396.75（-19%） | 389 → 247.97（-36%） |
| 32x32 addp（§5.7） | 1829 | **1289（-29.5%）** | 374 → 369 | — | — |

全搜索确认（2026-08-14，pairsum×unroll 四变体）：16x16 loop+addp
最优（327/114，stk 22）；32x32 full+addp 为 MCA 最优（1289/367，
stk 8，spill 远低于 loop 的 40）。结果归档
`experiments/m30-interp8-{16,32}-search/layout-search/`。

- 指令数显著下降（load 大减：16x16 上游 ldur 112 → 22 ldr；32x32
  448 → 40+32），置换/窄化成为新瓶颈（表 LB 中 permute 项主导）。
- MCA（neoverse-v2 代理）几乎持平甚至略增（121/398 vs 118/374）：
  该模型对 SVE permute 的调度较保守；920B/NP1 结构模型（2×256/
  4×256 全 SVE pipe）则给出 -15~-38% LB。与 8x8 一致：指令数收益
  明确，cycle 收益以 950/960 实机为准。
- **unroll 搜索轴（2026-08-14，interp8-16/32 manifest 已加）**：
  `#pragma clang loop unroll(full)` 对比：fused 不变（359/1417），
  16x16 MCA 121→123（uOps 495→499）、32x32 MCA 398→398，但
  stack spill 大幅下降（16x16 22→6、32x32 40→8）。循环版 MCA
  略优、全展开版实机 spill 风险更低；两者均可由搜索枚举。

**“s8 直算 + 结果常数偏移”否定结论（2026-08-14，用户提议核查）**：
原设想“SDOT 直接吃原始字节，把 8192 偏移只加在结果上”不可行。
s8 是**补码解释**（0x64=+100、0xFF=-1），不是“b-128”；实测
`sdot(100,255) = -200`（lane 两乘积：100×(-1)×2）。逐字节的
unsigned→signed 映射是数据相关的（b<128 → +b，b≥128 → b-256），
常数 8192 无法补偿；每行 1 次 `sub #128`（8/16/32 条）仍必须保留。
真正免 sub 需要 mixed-sign 2-way dot（ISA 未提供）。

### 5.6 垂直方向 vpp 16x16（2026-08-14，滑动行管线）

垂直 8-tap FIR 的滑动窗口沿行方向：23 个行向量（行 -3..+19）加载
一次驻留寄存器，输出行 i 直接消费 v_i..v_{i+7}（8×MLA + 双累加器
4 乘积/acc 防溢出 + 4096/acc 偏移 + sqrshrunb+uzp1）。20k 差分
× 3 相位 0 失配（vs `interp_vert_pp_neon<8,16,16>`），
TestBenchLite（`+16x16 vpp`）PASS。候选固化
`kernels/interp8vpp-16/candidates/best_sve2.*`。

| 实现 | fused | MCA | uOps | 说明 |
| --- | ---: | ---: | ---: | ---: |
| 上游 vpp 16x16 | 400 | 112 | 476 | NEON 基线 |
| vpp acc_split=1（GCC） | **257（-36%）** | 168 | 344 | 2×4 乘积累加器 |
| vpp acc_split=2（GCC） | 293 | 171 | 422 | 4×2 乘积累加器（链更短但模型不奖励） |
| 上游 vpp 32x32 | 1572 | 388 | 1834 | NEON 基线 |
| vpp32 acc_split=1（GCC） | **936（-40%）** | 547 | 1279 | 软件流水（逐行惰性加载，峰值 9 行活跃） |
| vpp32 acc_split=2（GCC） | 1066 | 577 | 1535 | 4 累加器变体 |

- 指令数 -36%；MCA 反而 +50%（MLA 4 连依赖链 + NV2 模型保守），
  与水平方向结论一致：指令收益明确，cycle 以 950/960 实机为准。
- 已接入搜索工具：manifest `interp8vpp-16`（gen_verify 新增
  interp8vpp 模板，带行上边距），`acc_split: [1,2]` 轴可自动枚举；
  acc_split=1 双指标最优。
- **vpp32 注意**：32 列宽块要求 dstStride ≥ 32；生成验证的 corpus
  strides 用 [32,64]（ds=16 是非法配置，上游自身在该配置下行为
  依赖 ds，实测 2026-08-14）。
### 5.7 addp 对和优化（2026-08-14）

SVE2 谓词 `addp(t,t)` 的偶/奇槽语义恰好产生 [p0,p0,p1,p1,…]，
再接一次 `uzp1` 即得紧凑 [p0..p7]：把每单元的 `uzp1+uzp2+add`
（3 条）降为 `addp+uzp1`（2 条）。三形状 20k 差分 0 失配 +
TestBenchLite（hpp 8/16/32 + vpp 16/32）PASS；fused 与 MCA 双降：

| shape | 旧 fused/MCA | addp fused/MCA |
| --- | ---: | ---: |
| 8x8 | 101 / 55 | **93 / 53** |
| 16x16 | 359 / 121 | **327 / 114** |
| 32x32 | 1417 / 398 | **1289 / 369** |

注：addp 为 SVE2-only，920B（SVE1）替换预估仍沿用旧变体（docs/29
数字不变）；addp 变体面向 950/960。
