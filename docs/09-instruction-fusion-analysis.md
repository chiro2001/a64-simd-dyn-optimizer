# 指令融合分析（Instruction Fusion Analysis）需求梳理 v0.2

状态：**待审核**。v0.2 已按用户对 v0.1 开放问题的答复更新：

- 谓词寄存器不计读口；
- 融合窗口：硬件只接受严格相邻，但软件可重排指令使候选对相邻，因此
  分析条件放宽为“寄存器依赖紧密相连”；
- `add+fcvt`、`add+tbl` 只是示例，当前假定目标 CPU 没有已确认的融合对；
- 优化目标改为三档（见 §1.2）；
- 新增鲲鹏 920B（第 N 代）中间验证环境（NEON 4×128、SVE 2×256）。

审核通过后作为 P0 需求冻结，进入 `optimizer/analysis/fusion` 与
`tools/fusion_analysis.py` 的 v0.1 实现。

## 1. 背景与目标

### 1.1 目标与验证环境

| 环境 | CPU | SIMD 算力 | 用途 |
| --- | --- | --- | --- |
| ARM N1（已有） | Neoverse-N1 | NEON 4×128（无 SVE） | NEON→NEON 实机验收 |
| 鲲鹏 920B（第 N 代，云实例） | 鲲鹏 920B | NEON 4×128、SVE 2×256 | SVE256 功能/正确性/中间性能验证 |
| 鲲鹏 N+2（960，目标） | 待定型 | SVE 4×256、NEON 4×128（后续型号） | 最终验收 |

鲲鹏 920B 为云实例，用户会控制启停；实例销毁时会通知。分析套件必须把
“实例可用状态”纳入实验记录，任何 920B 结果都要带实例存活期内的环境
快照，不能跨实例生命周期静默复用。

### 1.2 优化目标（已确定）

三档目标，均为**实机实际性能**口径：

| 档位 | 迁移 | 机器 | 目标 |
| --- | --- | --- | --- |
| a | NEON → NEON | ARM N1 | +30% |
| b | NEON（或 SVE128）→ SVE256 | 鲲鹏 N+2 | +130% |
| c | SVE256 → SVE256 | 鲲鹏 N+2 | +130% |

### 1.3 SIMD 指令数估算模型（鲲鹏 N+2 主口径）

在鲲鹏 N+2 上，目标性能用 **SIMD 指令数**估算：

```text
cycles_est = dynamic_simd_insns / simd_pipe_count
speedup    = (insns_old / pipe_old) / (insns_new / pipe_new) - 1
```

用户给定示例：原动态指令流 100 条 NEON 指令，优化为 50 条 SVE256 指令，
N+2 上 NEON 与 SVE 均为 4 pipe：

```text
cycles_old = 100 / 4 = 25
cycles_new =  50 / 4 = 12.5
speedup    = 25 / 12.5 - 1 = +100%（未达 +130%）
```

要达到 +130%（2.3×），在 pipe 数相同（4）时：

```text
insns_new = insns_old / 2.3 ≈ 43.5（相对 100 条 NEON，需 -56.5%）
```

推论（推断，待 workload 与实机确认）：

- 纯宽度迁移 NEON 4×128 → SVE 4×256 的理论上限是 +100%（2×），
  +130% 需要在此基础上再削减约 15% 的动态指令/周期；
- 因此**指令融合分析只是支撑之一**，还必须配合 load 合并、重排消除、
  归约融合与调度优化；
- 估算模型以吞吐上界为主口径；latency、依赖链、发射端口竞争与 spill
  作为次级指标单独报告。

### 1.4 920B 与 N+2 的 pipe 差异

920B 的 SVE 是 **2×256**，N+2 目标是 **4×256**。因此：

- 920B 可用于 SVE256 正确性、功能、动态指令数（PMU instructions）与
  cycles 的**中间验证**；
- 920B 的 SVE 吞吐上界只有 N+2 的一半，**不能直接外推 N+2 的吞吐验收**；
- 允许按 pipe 数折算估算：`cycles_est(920B) = insns / 2`、
  `cycles_est(N+2) = insns / 4`，但折算后的数字只作为预测，最终验收
  必须在 N+2 实机完成；
- 若 920B 实测 cycles 与 `insns/2` 偏差显著，应作为 cost-model 校准数据，
  而不是修改估算公式去凑 N+2 目标。

## 2. 术语与融合分层

1. **微架构级融合（macro-op / fusion）**：执行引擎把两条架构指令合并为
   一条融合 uop，节省发射槽与执行 pipe。ISA 不变，架构语义不变。这是
   本需求的主分析对象。
2. **ISA 级合并**：用一条真实 ISA 指令替换两条（如 `TBL2+索引 → TRN`），
   属于现有指令选择/搜索能力，不是融合分析。
3. **SVE2 复合/特殊形态**：如 `MOVPRFX + destructive op`、128-bit 段级
   操作，作为融合候选的特殊来源，语义验证单独处理。

融合分析 v0.1 只做第 1 层预测与第 3 层候选标注。

## 3. 融合条件

### C1：同类 SIMD 指令

- 两条源指令必须都是 NEON（ASIMD）、SVE、SVE2 向量指令；
- 谓词创建/谓词逻辑指令默认不参与融合；
- 标量 GPR、load/store、分支、system 指令默认排除（v0.1）。

### C2：融合后视为一条指令执行

- 分析器以“融合后发射数 2→1、执行 pipe 占用按 1 个 slot 计”建模；
- 这是预测：QEMU 不模拟融合；920B/N+2 的融合行为需实机确认；
- 所有候选带 `needs_hw_verify: true`，禁止把预测当已实现收益。

### C3：读/写寄存器端口约束

融合后指令必须满足：**读寄存器端口 ≤ 3，写寄存器端口 == 1**。

端口计数规则（v0.2，已确认项标注）：

| 操作数类型 | 计数规则 |
| --- | --- |
| 向量源寄存器（Z/V） | 每个不同源寄存器计 1 读口；同一寄存器多次出现仍计 1 |
| 谓词寄存器（P） | **不计读口**（已确认） |
| 标量 GPR 源 | 计 1 读口；v0.1 默认不允许含标量源的指令对参与 |
| 立即数 / 索引 / 移位量 / 位宽说明符 | 不计 |
| 内存操作数 | v0.1 不允许参与融合 |
| 目的寄存器 | 唯一向量寄存器，计 1 写口 |

示例（仅用于说明计数，不是已确认融合对）：

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
   标注，不执行完整调度验证；
4. **谓词一致**：若两条都带谓词，谓词寄存器必须相同（谓词不计端口，
   但一致性仍必须检查）；
5. **类型/位宽兼容**：第二条的源类型与第一条结果一致，或仅相差零成本
   位视图（u16/u32/u64 reinterpret）；
6. **无副作用/边界**：不跨 load/store、分支、异常边界、标志写。

### C5：可扩展性与融合对表

- 融合对不限于 2 条：端口预算按整体计算后可扩展 3 条链式融合；
- **当前假定目标 CPU 没有已确认的融合对**：`TargetProfile.fusion_table`
   默认为空，分析器只按 C1–C4 枚举候选并全部标记 `needs_hw_verify`；
- 后续拿到鲲鹏微架构融合表后，用表过滤候选并取消相应 `needs_hw_verify`
   标记（仍需实机抽样确认）。

## 4. 分析能力需求

### 4.1 输入

- 目标 kernel 最终汇编（生产 flags 的 objdump/llvm-objdump）或 MachineIR
  指令序列；
- `TargetProfile`：ISA 档位、VL、pipe 数、端口模型、融合对表（默认空）、
  窗口/可重排规则；
- 可选：依赖图（MachineIR），用于“紧密相连”判定与建议调度位置。

### 4.2 输出

每 kernel 一份 JSON 报告：

```yaml
kernel: dynopt_sa8d_16x16_neon_sve2
profile: kunpeng-n2-sve256-v0
estimation:
  simd_pipe_count: 4
  dynamic_simd_insns: 50
  cycles_est: 12.5
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
- 标注“建议调度位置”（`suggested_adjacent`），说明重排前提；
- 提示融合不自动缩短关键路径：`add;fcvt` 仍是串行依赖，融合主要收益在
  发射/pipe 占用，不在 latency；
- 所有预测带 `needs_hw_verify`，并预留实机 PMU 对比字段。

### 4.3 与现有工具链集成

- 复用 `tools/count_asm_insns.py` 的分类与 `optimizer/targets/aarch64/`
  TargetFeatures/TargetProfile 概念；
- 新增 `optimizer/analysis/fusion.py` 与 `tools/fusion_analysis.py`；
- 输出进入实验目录（建议 `experiments/m11-fusion/`），与候选漏斗并列；
- 融合不改变 ISA 语义，正确性仍由现有差分门禁覆盖；
- 融合候选是静态筛选信号，不自动进入 benchmark 接受路径。

### 4.4 正确性边界

- 融合分析不生成新 ISA 指令，不改变 kernel 汇编；
- 对第 3 层 SVE2 复合候选，用 MachineIR 语义/差分确认；
- 对 ISA 中不存在的理想融合（如 `add_fcvt`），只做预测，不做代码生成。

## 5. 验收标准（v0.1）

1. 能对现有 SVE2 候选（`sve_roundtrip_sa8d_8x8x2raw.cpp`、
   `sve_roundtrip_sa8d_16x16.cpp`）产出融合分析报告；
2. 端口计数（谓词不计、3R1W）、依赖链拒绝、谓词一致性、可重排位置标注
   均有单元测试；
3. 报告明确区分“按条件可融合”与“目标 CPU 支持（待验证）”，所有预测项
   带 `needs_hw_verify`；
4. 报告输出 `cycles_est` 与 `speedup_est_by_insns`，可合并进
   `count_asm_insns.py` 的动态指令估算；
5. 无融合表时可正常运行（降级为按 C1–C4 枚举）；
6. 920B 实例可用时，能对同一候选输出：
   - QEMU 差分正确性（VL=256）；
   - 实机 PMU dynamic instructions / cycles；
   - 预测 `insns/pipe` 与实测 cycles 的偏差记录（校准数据）。

## 6. 里程碑建议

| 阶段 | 内容 | 退出条件 |
| --- | --- | --- |
| P0 | 需求冻结（本文档审核通过） | 本文档 + 剩余开放问题关闭 |
| P1 | 融合分析器 v0.1（静态滑窗 + 端口/依赖/可重排检查 + JSON 报告） | 满足 §5.1–5.5 |
| P2 | 接入候选漏斗与实验目录（m11-fusion），对 SA8D 系列输出基线报告 | 报告入库并可复现 |
| P3 | 920B 环境接入：SVE256 实机差分 + PMU + 估算偏差校准 | §5.6 数据可复现；实例生命周期记录完整 |
| P4 | N+2 profile 参数化（pipe=4、融合表）与实机验收 | 鲲鹏 N+2 样机/文档可用后完成预测-实测对比 |
| P5 | 融合感知搜索/调度（可选） | 仅当 P3/P4 表明融合收益显著且稳定 |

## 7. 剩余开放问题（需审核确认）

1. **估算口径**：`dynamic_simd_insns` 是否只统计 SIMD 指令（不含标量
   地址/控制/load 指令）？用户示例按 100 条 NEON 指令计算，建议主口径
   为 SIMD 指令，标量/load 单独报告，请确认。
2. **ISA 档位**：920B 与 N+2 的 SVE 是 SVE1 还是 SVE2？是否支持运行时
   固定 VL=256（`prctl`/`set_sve_vl`）？这决定候选可用的指令集与 VL
   dispatch 方案。
3. **load/store 是否参与融合**：v0.1 建议排除（需要内存端口模型），
   是否同意？
4. **融合结果是否驱动搜索**：v0.1 只做静态报告；是否要求后续把“可融合
   序列”作为布局搜索的收益项？
5. **文档口径同步**：`docs/README.md`、`docs/01-project-charter.md` 的
   “+30%”旧口径是否随本需求冻结一并修订为三档口径？
6. **920B 数据用途**：920B 的实机 cycles 是仅作校准/中间验证，还是允许
   按 pipe 折算后作为 N+2 的预验收依据？建议仅作校准，最终验收在 N+2。

## 8. 风险

- **融合对未知**：默认融合表为空，预测收益可能高估；缓解：只报告、
  全部 `needs_hw_verify`。
- **端口模型假设错误**：读口计数规则需在 920B/N+2 上校准。
- **920B 与 N+2 pipe 数量不同**：920B 的 SVE 吞吐上界是 N+2 的一半，
  不能直接外推；任何跨机器折算必须标注“预测”。
- **云实例生命周期**：实例启停/销毁会破坏可复现性；缓解：每次实验记录
  实例状态与环境快照，销毁后不复用旧结果做验收。
- **融合可能恶化调度/关键路径**：融合减少发射但不缩短依赖链；报告必须
  输出 `critical_path_impact`。
- **QEMU 无法验证融合**：正确性仍由差分保证，性能预测只能等实机。
- **目标 CPU 未定型**：N+2 的 pipe/融合表/ISA 档位确认前，所有收益数字
  均为参数化模型。
