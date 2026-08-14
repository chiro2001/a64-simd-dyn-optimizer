# 指令融合分析（Instruction Fusion Analysis）需求梳理 v0.4

状态：**v0.4 冻结，v0.1 实现已接入搜索（2026-08-14）**。v0.4 已按
round-0005 顶级模型核实结果修订（“修订后有条件通过”），四项必改：

实现状态（2026-08-14）：
- `optimizer/analysis/fusion.py` + `tools/fusion_analysis.py`（静态
  inventory：SIMD/load 分类、C1-C4 结构可融合对枚举、movprfx 融合
  伪指令不计）；7 个单测 PASS；
- **已接入搜索**：`search_sve2_layouts.py` 对每个候选记录
  `fusion` 字段（eligible/hw_supported/pairs/counts），输出行带
  `fusion_eligible=N`；融合表为空 → `hw_supported=0`，**不驱动排序**
  （符合 v0.4 “融合表为空时不得产生预测收益并驱动搜索”约束）；
- 示例：interp8vpp-16 acc_split-1 eligible=7、acc_split-2 eligible=39
  （若 960 未来实现融合，split-2 潜在收益更大；目前仅记录）。

- `cycles_est` 降级为 `instruction_score`（搜索代理），另给资源下界模型；
- `load > SIMD` 从硬淘汰门改为软信号；
- 跨 ISA（b 档）与同 ISA（c 档）baseline 拆分为独立验收项；
- 融合表为空时不得产生预测收益并驱动搜索（先静态 inventory，目标融合对
  验证后才排序/进主循环）。

v0.3 已按用户对 v0.2 的答复更新：

- 估算只统计 **SIMD 指令 + load 指令**（load 标量/向量一起算）；当
  `load > SIMD` 时判定为**非计算 bound，无优化价值**；
- 920B 为 **SVE（v1）**、N+2（960）为 **SVE2.3**，运行均固定 **VL=256**；
- load/store **不参与融合**；
- 融合分析结果**必须驱动布局搜索**（不再是可选项）；
- 旧文档性能口径按三档目标修订（本次一并落盘）；
- 920B 实机 cycles 可作为**验收标准**：保留门槛为提升 >10%
  （NEON→SVE 4×256 时为 >110%）；所有优化候选全量记录，达标者额外展示，
  达到目标比例者视为“工具已优秀”。

审核通过后作为 P0 需求冻结，进入 `optimizer/analysis/fusion` 与
`tools/fusion_analysis.py` 的 v0.1 实现。

## 1. 背景与目标

### 1.1 目标与验证环境

| 环境 | CPU | SIMD 算力 | ISA | 用途 |
| --- | --- | --- | --- | --- |
| ARM N1（已有） | Neoverse-N1 | NEON 4×128（无 SVE） | SVE 不支持 | NEON→NEON 实机验收 |
| 鲲鹏 920B（第 N 代，云实例） | 鲲鹏 920B | NEON 4×128、SVE 2×256 | **SVE（v1）** | SVE256 功能/正确性/中间性能验收 |
| 鲲鹏 N+2（960，目标） | 鲲鹏 960 | SVE 4×256、NEON 4×128（后续型号） | **SVE2.3** | 最终验收 |

- 所有目标运行**固定 VL=256**（运行时设置，`svcntb()==32`）；
- 920B 为云实例，用户控制启停，销毁会通知；实验必须记录实例存活期内的
  环境快照，不跨实例生命周期静默复用结果。

### 1.2 优化目标（三档，已确定）

| 档位 | 迁移 | 机器 | 目标 |
| --- | --- | --- | --- |
| a | NEON → NEON | ARM N1 | +30% |
| b | NEON（或 SVE128）→ SVE256 | 鲲鹏 N+2 | +130% |
| c | SVE256 → SVE256 | 鲲鹏 N+2 | +130% |

### 1.3 验收分层（已确定）

所有搜索结果**全量记录**，在此基础上分三层：

| 层 | 定义 | 处理 |
| --- | --- | --- |
| 记录 | 所有生成的优化候选 | 全部存档（manifest/汇编/验证结果） |
| 保留 | 达到保留门槛 | 额外展示，可进入后续实机/注入路径 |
| 优秀 | 达到对应档位目标比例 | 视为“工具已优秀”的标志 |

保留门槛（round-0005 修订后，baseline 与阈值分档明确）：

| 环境/档位 | 精确 baseline | 保留 | 优秀 |
| --- | --- | ---: | ---: |
| 920B 中间验证 | 同机上游 NEON | speedup > 1.10 | 不作 N+2 优秀判定 |
| N+2 b 档 | 同机冻结 NEON（或预注册 SVE128，单列 b-neon/b-sve128） | speedup > 2.10 | speedup >= 2.30 |
| N+2 c 档 | 同机最佳现有 SVE256 | speedup > 1.10 | speedup >= 2.30 |

优秀门槛 = §1.2 三档目标（+30% / +130% / +130%）。

统计条件（round-0005）：保留门槛要求预注册 paired speedup 中心估计满足
上表，且 bootstrap 95% CI 下界也超过对应阈值；若只要求 CI 下界 >1.00，
必须明确标注为较弱的探索性保留。

### 1.4 SIMD 指令数估算模型（搜索代理）

统计范围（已确定）：

- `simd_insns`：SIMD 指令数（不含标量 GPR 算术/地址/控制/分支）；
- `load_insns`：load 指令数（**标量 load + 向量 load 一起算**；store 不计）；
- 估算有效指令数 `n_est = simd_insns + load_insns`。

计算 bound 判定（round-0005 修订：软信号，不硬淘汰）：

```text
load_pressure: low | medium | high
compute_bound_prediction: true | false | unknown
optimization_route: compute | load-reuse | latency | mixed
```

`load > SIMD` 只能提高 load_pressure 并降低“纯 SIMD 融合”优先级，不得把
kernel 移出优化漏斗（interp8 是典型 load-heavy 但可优化 kernel）。

指令数估算（round-0005 修订：降级为搜索代理）：

```text
n_est = simd_insns + load_insns        # 注意：分类必须互斥，向量 load 不得双计
instruction_score = n_est / issue_est  # 仅作搜索排序，不称为 cycles 估算
```

另给资源下界模型（P1 起逐步实现，P3 用实机校准）：

```text
cycles_lb = max(
  vec_alu_uops / vec_alu_rate,
  permute_uops / permute_rate,
  reduction_uops / reduction_rate,
  load_uops / load_rate,
  load_bytes / l1_bandwidth,
  store_uops / store_rate,
  frontend_uops / frontend_rate,
  critical_path_latency)
```

共享端口按端口占用求和而非简单取 max。最终验收只认实机 paired cycles。

### 1.5 movprfx 硬件融合（2026-08-13 用户确认）

**`movprfx`（Move Prefix）是编译器为满足 SVE 目的寄存器约束而插入的
伪指令**（如 GCC 在 `sdot zN.d, zM.h, zK.h` 前生成 `movprfx zN, z_acc`），
在实机（Neoverse/Kunpeng SVE 流水线）上**默认与紧随其后的那条指令融合
执行**：不占用独立的发射槽/周期，等效于“movprfx + 下一条 = 一条指令”。

计数与评估规则：

- `simd_insns` / `n_est` / `instruction_score` / 动态指令统计中，
  **movprfx 不计为独立指令**，按融合对 `(movprfx, next)` 折算为 1；
- 融合成立的前提是严格相邻；编译器通常满足，若调度器把两者分开则
  该对不再视为融合（当前计数按“默认相邻”处理，反例出现时再细化）；
- movprfx **不参与用户定义的融合对枚举**（C1-C4 只针对未融合的
  SIMD 指令对），避免重复计算；
- 报告必须同时给出 `raw` 与 `fused_adj`（= raw − movprfx 数），
  排名以 fused_adj 为准。

实测影响（DCT16 候选，VL=256 true-dynamic）：

```text
版本            raw   movprfx   fused_adj
NEON           1980     0       1980
上游 SVE       1911     0       1911
v3 quarter     1524   192       1332
v4 odd-quarter 1422    96       1326
v9 direct-zO   1365    96       1269   ← 当前实机口径最优
```

> 2026-08-13 二次口径修正：`is_vector` 补上 `ldr/str/ldp/stp qN|dN`
> 向量访存（此前只认 v/z 操作数，漏计 NEON 访存与 SVE `str d`）。
> v9 把 pass2 行对循环展开，O 直接用 NEON 加载的 SVE bridge 视图生成
> （消除 O[] 数组 spill 与寄存器文件 mov），fused 1326 → 1269。
> 两档都要记录，验收以实机 cycles 为准。

用户给定示例（N+2，4 pipe）：原动态流 100 条 NEON 指令 → 50 条 SVE256
指令（instruction_score 口径）：

```text
cycles_old = 100 / 4 = 25
cycles_new =  50 / 4 = 12.5
speedup    = 25 / 12.5 - 1 = +100%（未达 +130%）
```

达到 +130%（2.3×）需要 `n_est_new ≈ n_est_old / 2.3 ≈ 43.5`（-56.5%）。

推论（推断，待 workload 与实机确认）：

- 纯宽度迁移 NEON 4×128 → SVE 4×256 的理论上限是 +100%（2×），
  +130%（2.3×）相对纯宽度还需**额外 15% 吞吐**，等价于约 **13% cycles/
  工作量削减**；
- 因此融合分析只是支撑之一，必须与 load 合并、重排消除、归约融合、
  调度优化共同作用；
- 估算模型以吞吐上界为主口径；latency、依赖链、发射端口竞争与 spill
  作为次级指标单独报告。

### 1.5 920B 与 N+2 的差异与验收

- 920B：SVE **v1**、2×256；N+2：SVE2.3、4×256；
- 920B 可做 SVE256 正确性、功能、PMU instructions/cycles 与**保留门槛
  验收**（NEON→SVE 2×256，>10%）；
- 920B 的 SVE 吞吐上界是 N+2 的一半，**不能直接外推 N+2 吞吐**；折算
  数字只作为预测；
- N+2 目标（+130%/+110% 门槛）最终必须在 N+2 实机完成；
- 候选指令集必须按 ISA 档位过滤：920B 只允许 SVE1 指令，N+2 允许
  SVE2.3；当前 SA8D 候选仅用 SVE1 基础指令，可在 920B 直接运行。

## 2. 术语与融合分层

1. **微架构级融合（macro-op / fusion）**：执行引擎把两条架构指令合并为
   一条融合 uop，节省发射槽与执行 pipe。ISA 不变，架构语义不变。这是
   本需求的主分析对象。
2. **ISA 级合并**：用一条真实 ISA 指令替换两条（如 `TBL2+索引 → TRN`），
   属于现有指令选择/搜索能力，不是融合分析。
3. **SVE2 复合/特殊形态**：如 `MOVPRFX + destructive op`、128-bit 段级
   操作，作为融合候选的特殊来源，语义验证单独处理。

融合分析 v0.1 做第 1 层预测与第 3 层候选标注；第 2 层由现有搜索负责。

## 3. 融合条件

### C1：同类 SIMD 指令

- 两条源指令必须都是 NEON（ASIMD）、SVE、SVE2 向量指令；
- 谓词创建/谓词逻辑指令默认不参与融合；
- 标量 GPR、**load/store**、分支、system 指令默认排除（已确认，v0.1）。

### C2：融合后视为一条指令执行

- 分析器以“融合后发射数 2→1、执行 pipe 占用按 1 个 slot 计”建模；
- 这是预测：QEMU 不模拟融合；920B/N+2 的融合行为需实机确认；
- 所有候选带 `needs_hw_verify: true`，禁止把预测当已实现收益。

### C3：读/写寄存器端口约束

融合后指令必须满足：**读寄存器端口 ≤ 3，写寄存器端口 == 1**。

端口计数规则（v0.3，已确认项标注）：

| 操作数类型 | 计数规则 |
| --- | --- |
| 向量源寄存器（Z/V） | 每个不同源寄存器计 1 读口；同一寄存器多次出现仍计 1 |
| 谓词寄存器（P） | **不计读口**（已确认） |
| 标量 GPR 源 | 计 1 读口；v0.1 默认不允许含标量源的指令对参与 |
| 立即数 / 索引 / 移位量 / 位宽说明符 | 不计 |
| 内存操作数 | **不允许参与融合**（已确认） |
| 目的寄存器 | 唯一向量寄存器，计 1 写口 |

示例（仅说明计数，不是已确认融合对）：

- `add z0, z1, z2; fcvt z0, z0`：读 2（z1,z2）、写 1（z0）；
- `add z0, z1, z2; tbl z0, z0, z4`：读 3（z1,z2,z4）、写 1（z0）。

端口模型由 `TargetProfile` 参数化，默认 3R1W。

### C4：依赖条件（“紧密相连”，可重排相邻）

硬件融合只接受物理相邻的两条指令，但软件（编译器/调度器）可以重排指令
使候选对相邻。因此分析条件放宽为**寄存器依赖紧密相连**：

1. **中间结果不可观察**：第一条指令的目的寄存器只被第二条指令读取，
   不被序列中其它指令使用；
2. **目的链接**：第二条指令的目的与第一条目的相同（dest chaining），
   或第二条只读第一条结果并写新目的（v0.1 保守只接受前者）；
3. **可重排性**：两条指令之间可以存在其它无关指令（分析器标注“建议
   调度位置”），但不得存在读写中间值的指令；v0.1 只做依赖检查与位置
   标注，调度器负责实际重排；
4. **谓词一致**：若两条都带谓词，谓词寄存器必须相同（谓词不计端口，
   但一致性仍必须检查）；
5. **类型/位宽兼容**：第二条的源类型与第一条结果一致，或仅相差零成本
   位视图（u16/u32/u64 reinterpret）；
6. **无副作用/边界**：不跨 load/store、分支、异常边界、标志写。

### C5：可扩展性与融合对表

- 融合对不限于 2 条：端口预算按整体计算后可扩展 3 条链式融合；
- **当前假定目标 CPU 没有已确认的融合对**：`TargetProfile.fusion_table`
   默认为空，分析器只按 C1–C4 枚举候选并全部标记 `needs_hw_verify`；
- 后续拿到鲲鹏微架构融合表后，用表过滤候选并取消相应标记（仍需实机
   抽样确认）。

## 4. 分析能力需求

### 4.1 输入

- 目标 kernel 最终汇编（生产 flags 的 objdump/llvm-objdump）或 MachineIR
  指令序列；
- `TargetProfile`：ISA 档位（920B: sve-vl256；N+2: sve2p3-vl256）、VL、
  pipe 数、端口模型、融合对表（默认空）、issue_est；
- 可选：依赖图（MachineIR），用于“紧密相连”判定与建议调度位置。

### 4.2 输出

每 kernel 一份 JSON 报告：

```yaml
kernel: dynopt_sa8d_16x16_neon_sve2
profile: kunpeng-n2-sve2p3-vl256
compute_bound_prediction: true # 软信号，不硬淘汰
load_pressure: medium
counts:
  simd_insns: 50
  load_insns: 8
  n_est: 58
estimation:
  issue_est: 4
  instruction_score: 14.5
  cycles_lb: {vec_alu: 10, permute: 4, load: 3, critical_path: 12}
pairs:
  - index: 42
    insn1: {mnemonic: add, operands: "z0.h, z1.h, z2.h"}
    insn2: {mnemonic: fcvt, operands: "z0.h, z0.h"}
    read_ports: 2
    write_ports: 1
    dependency_ok: true
    predicate_ok: true
    type_ok: true
    suggested_adjacent: true
    confidence: structurally_eligible   # 融合表为空时仅此层
    savings: {issue_slots: unknown, pipe_slots: unknown, dynamic_insns: unknown}
    needs_hw_verify: true
summary:
  total_pairs: N
  predicted_dynamic_insns_saved: N
  predicted_issue_slots_saved: N
  instruction_score_after: X
  speedup_est_by_score: "+Y%"
  critical_path_impact: neutral|worse|unknown
```

报告必须：

- 给出逐项通过/拒绝原因（端口、依赖、谓词、类型）；
- 标注“建议调度位置”（`suggested_adjacent`）与重排前提；
- 提示融合不自动缩短关键路径：`add;fcvt` 仍是串行依赖，融合主要收益在
  发射/pipe 占用，不在 latency；
- 所有预测带 `needs_hw_verify`，预留实机 PMU 对比字段；
- 融合置信分层：`structurally_eligible`（仅句法/依赖/端口条件）→
  `hw_supported`（目标融合表或微基准确认）→ `measured_correlated`（静态
  预测与多组实测候选相关）。

### 4.3 与现有工具链集成（含融合感知搜索）

- 复用 `tools/count_asm_insns.py` 的分类与 `optimizer/targets/aarch64/`
  TargetFeatures/TargetProfile；
- 新增 `optimizer/analysis/fusion.py` 与 `tools/fusion_analysis.py`；
- 输出进入实验目录（`experiments/m11-fusion/`），与候选漏斗并列；
- **融合分析驱动布局搜索（有条件）**：融合表为空时，
  `structurally_eligible=N, hw_supported=0, predicted_cycles_saved=unknown`，
  不得按 2→1 扣 issue slot；执行顺序为：静态 inventory → 目标融合对
  验证（专用相邻/插空 instruction-pair 微基准）→ 后处理排序 → 相关性
  验证后进入搜索主循环；
- `instructions:u` 仍会退休两条架构指令，不能单独证明融合发生；
- 融合不改变 ISA 语义，正确性仍由现有差分门禁覆盖；
- 融合候选是静态筛选信号，不自动进入 benchmark 接受路径（保留门槛仍
  由实机 cycles 决定）。

### 4.4 正确性边界

- 融合分析不生成新 ISA 指令，不改变 kernel 汇编；
- 对第 3 层 SVE2 复合候选，用 MachineIR 语义/差分确认；
- 对 ISA 中不存在的理想融合（如 `add_fcvt`），只做预测，不做代码生成。

## 5. 验收标准（v0.1）

1. 能对现有 SVE2 候选（`sve_roundtrip_sa8d_8x8x2raw.cpp`、
   `sve_roundtrip_sa8d_16x16.cpp`）产出融合分析报告；
2. 端口计数（谓词不计、3R1W）、依赖链拒绝、谓词一致性、可重排位置标注
   均有单元测试；
3. 报告区分“按条件可融合”与“目标 CPU 支持（待验证）”，所有预测项带
   `needs_hw_verify`；
4. 报告输出 `compute_bound_prediction`、`load_pressure`、`simd_insns`、
   `load_insns`、`n_est`、`instruction_score`、`cycles_lb` 与
   `speedup_est_by_score`，可合并进估算/验收流程；
5. 无融合表时可正常运行：只产生 `structurally_eligible` 层，预测节省为
   `unknown`，不进入排序/搜索；
6. 920B 实例可用时，对同一候选输出：QEMU 差分正确性（VL=256）、实机
   PMU instructions/cycles、预测 `instruction_score` 与实测 cycles 的偏差
   记录；保留验收按 §1.3 表格（920B 对同机 NEON，speedup > 1.10 且
   CI 下界 >1.10）。

## 6. 里程碑建议

| 阶段 | 内容 | 退出条件 |
| --- | --- | --- |
| P0' | 口径修订并冻结（本文档 + docs/04 同步） | 本文档定稿；基线/门槛表无歧义 |
| P1' | 完成 M10 长门禁与真实 vq=1 dispatch 拒绝（运行时 dispatch 实现） | 长门禁全过；VL<256 时候选调用次数为 0 |
| P2' | 920B 最小工具链 + SVE1 严格重建 + native correctness + paired PMU | 同机 NEON 保留门 >1.10（CI 下界 >1.10）；身份/hash 归档 |
| P3' | 冻结 SA8D 源候选身份，启动 N1 可测 DCT8 | DCT8 首轮闭环 |
| P4' | 融合静态 inventory（互斥分类 + `structurally_eligible`） | m11-fusion 报告入库 |
| P5' | 目标融合对验证（专用 instruction-pair 微基准）→ 后处理排序 | 仅在有 `hw_supported` 证据后排序 |
| P6' | 相关性验证后进入搜索主循环 | 静态预测与多组实测相关 |
| P7' | N+2 profile（4×256、SVE2.3、融合表）与 b/c 分档验收 | b-neon/b-sve128/c 各自完成 |

## 7. 开放问题（v0.4）

v0.2 的 6 个问题已关闭（见下），v0.4 新增/修订的关闭项：

1. 估算口径：只统计 SIMD 指令 + load 指令（分类互斥，向量 load 不双计）；
   `load > SIMD` 只提高 load_pressure，不硬淘汰（round-0005 修订）；
2. ISA 档位：920B=SVE v1，N+2=SVE2.3，固定 VL=256（已确定）；
3. load/store 不参与融合（已确定）；
4. 融合分析驱动布局搜索（已确定，但有条件：融合表为空时无预测收益，
   先 inventory 后验证再排序，round-0005 修订）；
5. 旧文档性能口径按三档修订（已确定，随本文档一并修订）；
6. 920B 实机 cycles 可作为验收标准；保留门槛按 §1.3 分档（920B >1.10；
   N+2 b 档 >2.10；c 档 >1.10；优秀 2.30），CI 下界同步要求（round-0005
   修订）。

实现阶段仍需校准：`cycles_lb` 各资源速率、融合表（若鲲鹏后续提供）、
保留门槛的具体 family 权重（来自 x265 clip 调用统计）。

## 8. 风险

- **融合对未知**：默认融合表为空，预测收益可能高估；缓解：只报告、
  全部 `needs_hw_verify`。
- **端口模型假设错误**：读口计数规则需在 920B/N+2 上校准。
- **920B 与 N+2 pipe 数量不同**：920B 的 SVE 吞吐上界是 N+2 的一半，
  不能直接外推；折算必须标注“预测”。
- **920B 是 SVE v1 而 N+2 是 SVE2.3**：候选必须按档位过滤；当前 SA8D
  候选只用 SVE1 指令，920B 可测；若未来候选使用 SVE2 指令，920B 无法
  实机验证，只能 QEMU。
- **云实例生命周期**：启停/销毁破坏可复现性；缓解：每次实验记录实例
  状态与环境快照，销毁后不复用旧结果做验收。
- **融合可能恶化调度/关键路径**：报告必须输出 `critical_path_impact`，
  不以融合对数单独作为收益。
- **QEMU 无法验证融合**：正确性仍由差分保证，性能预测只能等实机。
- **目标 CPU 未定型**：N+2 的 pipe/融合表确认前，所有收益数字均为
  参数化模型。
