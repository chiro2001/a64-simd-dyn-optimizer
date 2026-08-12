# 指令融合分析（Instruction Fusion Analysis）需求梳理 v0.3

状态：**待审核**。v0.3 已按用户对 v0.2 的答复更新：

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

保留门槛（用户给定）：

- 920B：NEON→SVE 2×256 实测 cycles 提升 **>10%**；
- N+2：NEON→SVE 4×256 实测 cycles 提升 **>110%**；
- 同 ISA 内（NEON→NEON、SVE256→SVE256）默认 >10%（可配置）；

优秀门槛 = §1.2 三档目标（+30% / +130% / +130%）。

### 1.4 SIMD 指令数估算模型（主口径）

统计范围（已确定）：

- `simd_insns`：SIMD 指令数（不含标量 GPR 算术/地址/控制/分支）；
- `load_insns`：load 指令数（**标量 load + 向量 load 一起算**；store 不计）；
- 估算有效指令数 `n_est = simd_insns + load_insns`。

计算 bound 判定（已确定）：

```text
load_insns > simd_insns  ⇒  kernel 不是计算 bound，不具备优化价值
```

此类 kernel 仍记录，但标记 `compute_bound: false`，不进入优化/验收路径。

cycles 估算（参数化，默认按用户示例口径）：

```text
cycles_est = n_est / issue_est
speedup    = cycles_est_old / cycles_est_new - 1
```

- `issue_est` 默认取 SIMD pipe 数（N+2 为 4）；若 920B/N+2 实测显示 load
  走独立端口，可把 load 按 load 端口带宽另行折算（P3 校准）；
- 同时报告 `cycles_simd_only = simd_insns / pipe` 作为对照。

用户给定示例（N+2，4 pipe）：原动态流 100 条 NEON 指令 → 50 条 SVE256
指令：

```text
cycles_old = 100 / 4 = 25
cycles_new =  50 / 4 = 12.5
speedup    = 25 / 12.5 - 1 = +100%（未达 +130%）
```

达到 +130%（2.3×）需要 `n_est_new ≈ n_est_old / 2.3 ≈ 43.5`（-56.5%）。

推论（推断，待 workload 与实机确认）：

- 纯宽度迁移 NEON 4×128 → SVE 4×256 的理论上限是 +100%（2×），
  +130% 需要叠加约 15% 的指令/周期削减；
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
compute_bound: true            # load_insns > simd_insns 时为 false
counts:
  simd_insns: 50
  load_insns: 8
  n_est: 58
estimation:
  issue_est: 4
  cycles_est: 14.5
  cycles_simd_only: 12.5
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
    savings: {issue_slots: 1, pipe_slots: 1, dynamic_insns: 1}
    needs_hw_verify: true
summary:
  total_pairs: N
  predicted_dynamic_insns_saved: N
  predicted_issue_slots_saved: N
  cycles_est_after: X
  speedup_est_by_insns: "+Y%"
  critical_path_impact: neutral|worse|unknown
```

报告必须：

- 给出逐项通过/拒绝原因（端口、依赖、谓词、类型）；
- 标注“建议调度位置”（`suggested_adjacent`）与重排前提；
- 提示融合不自动缩短关键路径：`add;fcvt` 仍是串行依赖，融合主要收益在
  发射/pipe 占用，不在 latency；
- 所有预测带 `needs_hw_verify`，预留实机 PMU 对比字段。

### 4.3 与现有工具链集成（含融合感知搜索）

- 复用 `tools/count_asm_insns.py` 的分类与 `optimizer/targets/aarch64/`
  TargetFeatures/TargetProfile；
- 新增 `optimizer/analysis/fusion.py` 与 `tools/fusion_analysis.py`；
- 输出进入实验目录（`experiments/m11-fusion/`），与候选漏斗并列；
- **融合分析必须驱动布局搜索**：搜索器在枚举候选序列时调用融合分析，
  把“融合后发射数/pipe 节省”计入候选代价，优先保留可融合序列；
  融合感知搜索在 v0.1 阶段先接入“后处理排序”，P4 进入搜索主循环；
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
4. 报告输出 `compute_bound`、`simd_insns`、`load_insns`、`n_est`、
   `cycles_est` 与 `speedup_est_by_insns`，可合并进估算/验收流程；
5. 无融合表时可正常运行（降级为按 C1–C4 枚举）；
6. 920B 实例可用时，对同一候选输出：QEMU 差分正确性（VL=256）、实机
   PMU instructions/cycles、预测 `n_est/issue_est` 与实测 cycles 的偏差
   记录；实测 cycles 提升 >10%（NEON→SVE 2×256）即可作为保留验收。

## 6. 里程碑建议

| 阶段 | 内容 | 退出条件 |
| --- | --- | --- |
| P0 | 需求冻结（本文档审核通过） | 本文档定稿 |
| P1 | 融合分析器 v0.1（静态滑窗 + 端口/依赖/可重排检查 + 估算报告） | 满足 §5.1–5.5 |
| P2 | 接入候选漏斗与实验目录（m11-fusion），对 SA8D 系列输出基线报告 | 报告入库并可复现 |
| P3 | 920B 环境接入：SVE256 实机差分 + PMU + 估算校准 + 保留门槛验收 | §5.6 可复现；实例生命周期记录完整 |
| P4 | 融合感知搜索（后处理排序 → 搜索主循环） | 搜索候选按融合收益排序，融合候选可进实机 |
| P5 | N+2 profile（pipe=4、SVE2.3、融合表）与实机验收 | 鲲鹏 N+2 可用后完成三档目标验收 |

## 7. 开放问题（v0.3 已关闭项）

v0.2 的 6 个问题已按用户答复关闭：

1. 估算口径：只统计 SIMD 指令 + load 指令；`load > SIMD` 判定非计算
   bound（已确定）；
2. ISA 档位：920B=SVE v1，N+2=SVE2.3，固定 VL=256（已确定）；
3. load/store 不参与融合（已确定）；
4. 融合分析驱动布局搜索（已确定）；
5. 旧文档性能口径按三档修订（已确定，随本文档一并修订）；
6. 920B 实机 cycles 可作为验收标准（保留门槛 >10%，NEON→SVE 4×256 为
   >110%）（已确定）。

实现阶段仍需在 P3 用实机校准的模型参数：`issue_est`（load 是否计入
SIMD pipe）、融合表（若鲲鹏后续提供）、保留门槛的具体 family 权重。

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
