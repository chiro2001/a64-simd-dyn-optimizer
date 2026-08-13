# AArch64 SIMD 动态优化器：项目规划索引

本文档集是本项目的执行依据。项目目标不是做一个“把 NEON 文本翻译成 SVE 文本”的脚本，而是建立一条可验证、可测量、可持续扩展的 SIMD kernel 优化流水线：把 x265 kernel 的标量语义、内存来源、元素关系和现有 SIMD 调度分离建模，再针对具体 AArch64 ISA 与微架构搜索更好的数据布局和指令序列，最终生成、注入并验证 x265 kernel。

首条纵向链路选择 8-bit SA8D，从 `sa8d 8x8` 开始，随后覆盖 `16x16` 和其他块尺寸。纵向链路跑通后，再依次扩展到 DCT 与 `interp8_hpp`。项目级性能目标为三档（详见 [09-instruction-fusion-analysis.md](09-instruction-fusion-analysis.md)）：

- a) NEON → NEON（同算力），ARM N1 实机 **+30%**；
- b) NEON（或 SVE128）→ SVE256，鲲鹏 N+2 实机 **+130%**；
- c) SVE256 → SVE256，鲲鹏 N+2 实机 **+130%**。

它不是相对 C 标量实现的提升，也不等价于 x265 整体编码速度同步提升。鲲鹏 920B（SVE 2×256）作为中间验证环境，保留门槛为提升 >10%。

## 必读顺序

1. [项目章程与成功标准](01-project-charter.md)：范围、目标、非目标和统一术语。
2. [系统架构与 IR](02-system-architecture.md)：三层 IR、提取、搜索、验证、代码生成与 x265 接入架构。
3. [SA8D 端到端纵向切片](03-sa8d-end-to-end.md)：第一条 kernel 从提取到实机 benchmark 的逐步执行方案。
4. [正确性与性能评测规范](04-validation-benchmark.md)：任何性能结论必须通过的门禁。
5. [里程碑与重点算子路线](05-roadmap.md)：从环境基线到 SA8D、DCT、`interp8_hpp` 和性能目标的依赖图。
6. [Agent 单轮迭代协议](06-agent-iteration-protocol.md)：未来执行 Agent 的工作闭环、产物格式与专家建议归档（每三个实际优化迭代请求一次，可写沙箱仅限 round 目录，后台异步执行）。
7. [环境与上游审计快照](07-environment-audit.md)：2026-08-12 实测事实、缺口和复现要求。
8. [风险、决策门和停止条件](08-risks-and-decisions.md)：最容易让项目失控的技术风险与应对策略。
9. [指令融合分析需求](09-instruction-fusion-analysis.md)：三档性能目标、SIMD 指令数估算模型与融合分析需求。
10. [Agent 交接上下文](10-agent-handoff.md)：上下文压缩后接手的必读清单、环境、里程碑证据与下一步任务。

本初始规划完成后直接进入执行，不安排规划审核轮次。`expert-advice/round-NNNN/` 只保留给后续已经完成验证和 benchmark 的实际优化迭代；咨询频率为**每完成三个实际优化迭代请求一次**，请求以可写沙箱（仅允许写该 round 目录）在后台执行，主流程不阻塞等待，响应落盘后在下一次自然检查点写 `decision.md`。

2026-08-13 状态速览：DCT16 legacy 704（uop 口径，低于内部 827）、
DCT32 v2 = 7190（0.566x，near-gate；v3.1 的 3962 系 pass1-only，
full-call 8292，未过半数门）、sa8d16 189（结构地板）、
interp8 127（-10%，已接入 lite 门禁）；详见
[11-status-and-decision.md](11-status-and-decision.md) 与
[22-interp8-assessment.md](22-interp8-assessment.md)。

2026-08-14 状态速览（最新）：工具链闭环（并行搜索/依赖剪枝/两级差分/
流式 trace 全部可用并验证）；DCT32 op best **4874**（row16 合并存储 +
k0_merge8 + k0 先发射，全布局搜索 112 候选确认，TestBenchLite
5 seed PASS，距内部 4827 = 1.010×）；
k0_even_sdot 全 s16 方案被探针否决（§6.4）；DCT16 best 705；完整状态
见 [20-dct32-optimization-assessment.md](20-dct32-optimization-assessment.md) §6 与
[10-agent-handoff.md](10-agent-handoff.md)。

## 一页执行摘要

推荐的 v1 路径是“离线合成 + x265 运行时 ISA dispatch”，不是在编码热路径中 JIT：

```text
x265 C reference ──> 标量规格图 SpecIR ─┐
                                          ├─> 等价变换/布局搜索
现有 NEON/SVE kernel ─> seed MachineIR ─> 抽象 PackIR ┘  │
                                                         v
ISA 语义库 + 目标代价模型 ─────────────────────> MachineIR 候选
                                                     │
                           ┌─────────────────────────┴──────────────┐
                           v                                        v
                 C/C++ intrinsics 或 .S                    翻译验证与差分测试
                           │                                        │
                           └──────────────> x265 注入 <──────────────┘
                                                │
                                      静态计数 + 实机测量
                                                │
                                   保留 / 淘汰 / 进入下一轮
```

核心原则如下：

- **规格与调度分离**：标量 C reference 是功能规格的首选来源；现有 NEON/SVE 是高质量种子调度，不自动被视为规格。
- **元素语义优先**：每个 load 后的逻辑元素都有来源、坐标、位宽、符号和数值范围；向量寄存器只是这些元素在某个时刻的打包方式。
- **精确整数语义**：必须区分数学整数、定宽回绕、饱和、扩宽、窄化、舍入移位、符号解释和谓词 inactive lane；“代数上相似”不代表 bit-exact。
- **正确性先于成本**：候选只有通过语义验证和差分测试后才允许参与性能排名。
- **指令数不是最终目标**：搜索目标同时考虑关键路径、吞吐、load/store、shuffle、寄存器压力、溢出 spill、循环开销和代码体积；静态 SIMD 指令数只是一项诊断指标。
- **实机是性能裁判**：LLVM 静态模型和 QEMU 用于筛选与功能验证；发布级性能结论必须来自声明过 CPU/ISA/VL 的真实硬件。
- **实验可复现**：每次候选生成、编译、验证和 benchmark 都以 manifest、哈希、命令、原始输出和统计摘要留档。

## 当前已知的硬约束

截至 2026-08-12，指定远端 `chiro@129.146.162.16` 的实测 CPU 是 2 vCPU Neoverse-N1，支持 ASIMD/NEON、FP16、RDM 和 DotProd，不支持 I8MM、SVE 或 SVE2。因此：

- 该机器适合跑 NEON128 正确性与性能基线；`perf` 用户态硬件计数器可用。
- 该机器不能给出 SVE256/SVE2 性能数据，也不能原生执行这类候选。
- SVE/SVE2 功能测试在本地 x86 用 `aarch64-linux-gnu-g++` 交叉编译 +
  `qemu-aarch64` 完成（本地算力优先，远程 ARM 只做实机验证）。
- 远端当时没有目标项目目录、x265、CMake、Clang/LLVM、QEMU、Codex CLI 或 ripgrep。启动实现前必须完成 [环境基线里程碑](05-roadmap.md#milestone-m0可复现环境与冻结基线)。

2026-08-13 新增目标/验证环境：

- 鲲鹏 920B（第 N 代，云实例 `chiro@124.70.206.229`）：openEuler 24.03、
  aarch64、2 vCPU；SVE v1（无 sve2 flag，含 svei8mm/svebf16/svef32mm/
  svef64mm）；默认 VL=256（`sve_default_vector_length=32`）；NEON 4×128、
  SVE 2×256；工具链未安装（仅 python3，sudo 可用）。作为 SVE256 中间验证
  与保留门槛（>10%）验收环境。
- 鲲鹏 N+2（960，目标）：SVE2.3、SVE 4×256、NEON 4×128，尚未定型；
  三档目标见 [09-instruction-fusion-analysis.md](09-instruction-fusion-analysis.md)。

上游 x265 的临时审计基于 2026-08-12 拉取到的提交 `b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`。这是审计锚点，不是未经确认就永久锁定的项目依赖；M0 需要显式选择并记录最终基线提交。

## 推荐仓库布局

这是实现阶段应逐步形成的目标布局，不要求规划阶段一次性创建空目录：

```text
.
├── docs/                         # 架构、路线、实验规范
├── expert-advice/                # 每三个实际优化迭代后的一次性建议，按 round 独立归档（可写沙箱，仅限 round 目录）
├── optimizer/
│   ├── frontend/                 # DSL、Clang/LLVM IR、受限 AArch64 importer
│   ├── ir/                       # SpecIR、PackIR、MachineIR
│   ├── analysis/                 # provenance、range、alias、liveness
│   ├── rewrite/                  # 已证明的等价规则与 e-graph
│   ├── search/                   # tiling、packing、instruction selection、schedule
│   ├── targets/aarch64/          # ISA 特性、语义、编码和代价
│   ├── codegen/                  # intrinsics、assembly、manifest
│   └── verify/                   # interpreter、SMT、translation validation
├── isa/aarch64/                  # 可审计的指令语义/模式数据库
├── kernels/                      # 独立规格、wrapper 和固定测试向量
├── generated/                    # 生成代码；只提交已通过门禁的候选
├── integrations/x265/            # x265 patch、dispatch 与构建 glue
├── benchmarks/                   # 独立 microbench 与结果分析
├── experiments/                  # 大体积或本地实验产物，按 run-id 管理
├── third_party/x265/             # 固定提交的 submodule/worktree，M0 决策
└── tools/                        # 可复现命令入口，不放核心语义
```

## 下一位 Agent 的第一项任务

不要立即实现通用反汇编器。先执行 M0：创建仓库基线、安装并记录工具链、固定 x265 提交，构建 8-bit Release + Tests，保存未修改 x265 在当前 N1 上的 NEON SA8D 正确性与性能基线。基线无法复现时，后面的“提升”没有可比较的分母。
