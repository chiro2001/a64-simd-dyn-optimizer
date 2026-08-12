# Round 0005：需求 v0.3 与后续方案核实

你是 AArch64/SVE/编译器优化与系统性能审阅者。这是一次**需求与方案核实**，
不是实际优化迭代后的困难求助。请只读审阅，不要修改仓库；最终建议写入
回复。

## 一、项目现状（事实摘要）

- SA8D NEON 搜索（M4）三轮候选均为负结果或正确性失败；NEON 基线
  26.2 ns/call、80.4 cycles / 115.9 insns。
- SVE2 功能候选已完成：single（117 静态）/ x2（125）/ x2raw（116）/
  16x16 两次 wave wrapper（+23），QEMU VL=256/512 各 2 万例差分 0
  mismatch，guard-page 8/8；1M/ASan 长门禁待跑。
- 鲲鹏 920B 已连通（`chiro@124.70.206.229`）：openEuler 24.03、aarch64、
  HiSilicon 鲲鹏 920B、2 vCPU、SVE v1（无 sve2 flag，含 svei8mm/
  svebf16/svef32mm/svef64mm）、默认 VL=256
  （`/proc/sys/abi/sve_default_vector_length=32`）；工具链未安装
  （仅 python3，sudo 可用）。
- 目标机器：鲲鹏 N+2（960）= SVE2.3、4×256，尚未定型。

## 二、需求 v0.3 要点（需核实）

1. 三档目标：a) NEON→NEON 在 N1 +30%；b) NEON/SVE128→SVE256 在 N+2
   +130%；c) SVE256→SVE256 在 N+2 +130%。
2. 估算口径：只统计 SIMD 指令 + load 指令（load 标量/向量一起算，store
   不计）；`load > SIMD` 判定非计算 bound、无优化价值；
   `cycles_est = (simd_insns + load_insns) / issue_est`，`issue_est`
   默认取 SIMD pipe 数（N+2=4）。
3. 验收分层：所有候选全量记录；保留门槛为 920B 实测 cycles 提升 >10%
   （NEON→SVE 4×256 时 >110%）；达到三档目标视为“工具已优秀”。
4. 融合条件：同类 SIMD；谓词寄存器不计读口；读口 ≤3、写口 ==1；依赖
   紧密相连（可重排相邻，中间结果不可观察）；load/store 不参与；融合对
   表默认空，全部 `needs_hw_verify`；融合分析必须驱动布局搜索。
5. 后续方案：P0 需求冻结 → P1 融合分析器 v0.1 → P2 接入候选漏斗 →
   P3 920B 实机（装工具链、SVE256 差分 + PMU + 校准 + 保留门槛）→
   P4 融合感知搜索 → P5 N+2 实机验收；M10 剩余长门禁
   （1M/ASan/vq=1 拒绝）完成后冻结 SVE 静态候选，转向 N1 可测的
   DCT8/interp8（默认 DCT8）。

## 三、请核实并回答

1. **需求口径自洽性**：
   - 三档目标与估算公式是否自洽？+130%（2.3×）相对 NEON 4×128 → SVE
     4×256 的 2× 宽度理论上限，是否合理且可达成？
   - `load > SIMD` 判定计算 bound 是否足够/是否可能误杀可优化 kernel？
   - 920B 上 NEON 4×128 与 SVE 2×256 峰值带宽相同（512 bit），保留门槛
     >10% 是否合理？N+2 上 NEON→SVE 4×256 门槛 >110% 与目标 +130% 的
     关系是否清晰？
2. **方案顺序核实**：
   - 先实现融合分析器 v0.1，还是先完成 M10 长门禁并在 920B 上跑 SA8D
     SVE 实机基线/验收？哪个信息增益更高？
   - 920B 无 SVE2、只有 SVE v1：当前 SA8D 候选是否真的全部可用 SVE1
     指令？在 920B 上应验证什么、不应验证什么？
   - 融合感知搜索的演进路径（静态报告 → 后处理排序 → 搜索主循环）
     是否合理？
3. **遗漏风险**：
   - 固定 VL=256 的运行时设置、线程继承与 dispatch 风险；
   - 920B 仅 2 vCPU 的 PMU 噪声与 benchmark 方法；
   - openEuler 工具链安装、x265 构建与 SVE baseline 是否可得；
   - 估算公式把 load 计入 SIMD pipe 的合理性（load 通常走独立端口）；
   - NEON→SVE 迁移的 baseline 定义（x265 当前 NEON vs 上游 SVE2
     实现）对 +130% 判定的影响。
4. 明确区分：事实 / 推断 / 需实验验证。

## 四、上下文文件（路径已核实）

- `docs/09-instruction-fusion-analysis.md`（需求 v0.3）
- `docs/01-project-charter.md`、`docs/04-validation-benchmark.md`、
  `docs/05-roadmap.md`（已同步三档目标）
- `experiments/m10-sve-16x16/iteration.md`、`manifest.yaml`、
  `kunpeng920b-environment.txt`
- `experiments/m9-sve-trn/iteration.md`、`m8-sve-pack/iteration.md`
- `expert-advice/round-0004/response.md`、`decision.md`
- `generated/sa8d/sve_roundtrip_sa8d_16x16.cpp`、`_8x8x2raw.cpp`
- `optimizer/ir/codegen.py`、`optimizer/targets/aarch64/features.py`
- `isa/aarch64/instructions.yaml`
