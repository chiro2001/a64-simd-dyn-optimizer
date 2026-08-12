# 里程碑与重点算子路线

路线采用“纵向闭环优先、再横向泛化”。每个 milestone 都有可验证产物和退出条件；周数仅用于排期参考，不是跳过门禁的理由。默认 1–2 名实现 Agent 并行度下，完整首版约 5–8 个月，硬件获取和形式化验证是主要不确定性。

## 1. 依赖图

```text
M0 环境/基线
 └─> M1 contract + SpecIR
      └─> M2 NEON seed importer/roundtrip
           ├─> M3 verifier + AArch64 MVP semantics/cost
           │    └─> M4 SA8D NEON search/codegen/x265 闭环
           │         ├─> M5 SA8D family + 10/12-bit
           │         └─> M6 SVE2 VL=256 功能/实机闭环
           │              ├─> M7 DCT family
           │              └─> M8 interp8_hpp family
           └────────────────────> M9 泛化、回归、30% 收敛
```

M7/M8 可在 M4 稳定后并行探索，但不能绕过 M3 的验证基础。真实 SVE 硬件未到位时，M7 的 NEON 工作可以继续，M6 性能状态保持未完成。

## Milestone M0：可复现环境与冻结基线

预计：1–2 周。

### 任务

- 在指定远端创建项目 Git 仓库与本文档；选择 x265 submodule/worktree 管理方式。
- 固定 x265 commit，保存上游 remote/branch/patch 状态。
- 安装并锁定 CMake/Ninja、GCC、Clang/LLVM、QEMU、perf、Python 工具。
- 提供 `bootstrap`、`doctor`、`build-x265`、`capture-env` 的幂等入口。
- 构建 x265 8-bit Release/Tests；随后准备 10/12-bit build，但不阻塞第一条 8-bit SA8D。
- 建立 N1 NEON baseline 和噪声画像。
- 申请真实 SVE/SVE2 VL=256 节点；记录 owner/ETA。
- 预注册 benchmark workload 与 30% 聚合定义。

### 交付/退出条件

- 干净 checkout 可重建未修改 x265 `TestBench`；
- 环境 manifest 与构建日志齐全；
- `TestBench --cpuid NEON --testbench pixel --nobench` 通过；
- baseline microbench 可重复；
- 已明确 SVE 目标 CPU、SVE vs SVE2 和 VL 策略，或登记阻塞项。

## Milestone M1：Kernel contract、SpecIR 与 oracle

预计：2–3 周。

### 任务

- 定义 schema/version/canonical hashing。
- 实现 SpecIR 类型、内存 region、provenance、range 和解释器。
- 建立 SA8D 8x8 canonical DSL 与 x265 C oracle wrapper。
- 实现 DOT/JSON dump、固定 corpus、random differential、guard-page runner。
- 对 rounding、tile aggregation、8/10/12-bit 位宽形成可审计说明。

### 退出条件

- SA8D 8x8 8-bit 的 canonical spec 与 C oracle 通过全部预注册 case；
- 每个输出可以追溯到 128 个输入元素的关系；
- range 报告没有 unknown overflow；
- schema roundtrip 和 hash 稳定。

## Milestone M2：NEON importer 与 seed roundtrip

预计：3–5 周。

### 任务

- 读取 CMake compile database，构建目标 wrapper；
- 实现 restricted LLVM vector/intrinsic -> target-aware seed MachineIR importer；
- 依据 ISA 语义把 seed MachineIR 投影为不含 opcode/intrinsic 的 PackIR layout；
- 支持 SA8D baseline 实际使用的 helper/lane mapping；
- codegen intrinsics，并验证最终 object；
- 导入/生成之间保留 source location 和 candidate provenance。

### 退出条件

- `pixel_sa8d_8x8_neon` 无 opaque node；
- seed MachineIR 与 SpecIR translation-validate，PackIR 投影通过边界 verifier；
- seed roundtrip 通过 TestBench、sanitizer/guard；
- N1 性能在 baseline ±3% 内，超过则有经批准解释和修复计划。

## Milestone M3：验证器、ISA MVP 与成本模型

预计：3–5 周，可与 M2 后半并行。

### 任务

- bit-vector SMT emitter；规则 proof registry；
- SA8D 必需 NEON instruction semantics 与 LLVM MC fixtures；
- MachineIR、scheduler、register pressure/allocator 接口；
- N1 指令 microbench 与 target profile；
- static disassembly classifier、dynamic PMU harness；
- 候选漏斗与缓存。

### 退出条件

- seed 所有 opcode 有测试语义和成本来源；
- 注入一个人工等价变体时，错误变体可被 verifier 或差分检测；
- 至少 20 个正确/错误小候选验证成本在 CI 预算内；
- static/dynamic instruction report 能稳定生成。

## Milestone M4：SA8D 8x8/16x16 NEON 端到端

预计：3–4 周。

### 任务

- 开启 peephole、layout、instruction cover、schedule 搜索；
- 生成 top candidates 并做 compiler/object feedback；
- 用默认关闭的开关注入 x265 dispatch；
- 完成 standalone、TestBench、encode、perf A/B；
- 输出接受/负结果和成本预测误差。

### 退出条件

- 一条命令从 spec 生成并注入 candidate；
- SA8D 8x8 与 16x16 全门禁通过；
- 至少一个自动生成 candidate 在 N1 无回退并可独立回退；
- 报告包含静态 SIMD 分类、动态 instructions、cycles、延迟与代码尺寸；
- 若未快于 baseline，已执行 D4/D6 复盘，不用相对 C 数字伪装成功。

## Milestone M5：SA8D family 与 bit-depth 泛化

预计：3–5 周。

### 任务

- 组合 32x32/64x64 和 chroma shape，并保留“每个 16x16 先归一化、再做大块求和”的边界；
- 为 10-bit、12-bit 重新做 range/narrowing/rounding 证明；
- 搜索跨 tile accumulation 与 reduction；
- 从实际 clip profile 生成 shape/bit-depth 权重；
- 控制 code-size explosion，多版本只覆盖收益显著 case。

### 退出条件

- 支持矩阵内全部 shape/bit-depth bit-exact；
- family workload-weighted 报告可复现；
- 没有超过预注册阈值的关键 shape 回退；
- 生成模板不是每个 shape 的手写 fork。

## Milestone M6：SVE/SVE2 VL=256 迁移与实机闭环

预计：4–6 周，不含硬件等待。

### 任务

- 明确部署目标，优先实现 `sve2-vl256` SA8D backend；
- 增加 predicate、inactive lane、scalable/fixed pack 与 SVE ABI；
- 构建 QEMU 多 VL correctness matrix；
- 获取真实 VL=256 target profile 和 baseline；
- 比较 VLA/fixed-VL、单/多 tile packing；
- 实现 CPU feature + runtime VL dispatch；
- 与上游 SVE2 最佳实现同机比较。

### 退出条件

- 功能：QEMU + 真实硬件均通过全部门禁；
- dispatch：错误 feature/VL 永不调用候选；
- 性能：真实硬件 paired A/B 完整；
- 报告不跨 N1/SVE 机器计算 speedup；
- 若真实机器不可用，milestone 只能标为“功能部分完成”。

## Milestone M7：DCT/IDCT

预计：4–7 周。

### 选择顺序

先 profile 决定 `dct8` 或 `dct16`，默认从 dct8 1D pass/transpose 作为教学 kernel，再扩到 2D dct8、dct16；dct32 在成本/solver 可控后进入。IDCT 是独立语义和 rounding，不因 DCT 完成而自动覆盖。

### 新增技术问题

- 常量矩阵 load/broadcast provenance；
- multiply-accumulate、系数对称性与 even/odd factorization；
- 每个 pass 的 shift/round/saturating narrow；
- transpose 与 store layout 联合优化；
- s16/s32 accumulator 范围，特别是 10/12-bit；
- 零/稀疏系数的可能特化及 dispatch 成本。

### 任务与退出条件

- 从 `dct.cpp` 建 canonical spec/contract，用 `mbdstharness` 作 oracle；
- import `dct-prim.cpp` 与 `dct-prim-sve.cpp` 的目标路径；
- 扩 ISA 库到 widening multiply/MAC、rounding narrow；
- 搜索 1D factorization、layout、常量 materialization 与 2D fusion；
- 注入 x265 `p.cu[BLOCK_*].dct`/对应 idct slot；
- 全 bit-depth、all-zero/max/impulse/random/codec regression 通过；
- 输出 family 主指标，达到或诚实评估 30% 方向目标。

## Milestone M8：`interp8_hpp`

预计：4–7 周。

### 新增技术问题

- sliding-window load、重叠数据复用与合法 over-read；
- filter constant region 和 `coeffIdx` 多版本/运行时选择；
- DotProd/I8MM/SVE 的真实 feature 区分；
- widening MAC、offset、rounding shift、clip/narrow；
- width 非向量倍数、height 循环和 predicate tail；
- input/output alias 与 stride；
- 不同 width/height 的 code-size/dispatch 权衡。

### 任务与退出条件

- 以 `ipfilter.cpp` 和 `ipfilterharness` 建 oracle；
- 先选一个有代表性的 shape（由 profile 决定，不能凭直觉固定），跑通后参数化；
- import NEON、DotProd/I8MM 与 `filter-prim-sve.cpp` 中相关种子，按 feature 建不同 target；
- 搜索 load window layout、tap packing、dot/MAC cover、尾部策略；
- guard-page 测试所有边界与 padding contract；
- x265 `luma_hpp` slot 注入、TestBench/encode/实机通过；
- family weighted speedup 与代码体积一起评估，不为冷门 shape 生成巨大特化。

## Milestone M9：泛化、自动回归与 30% 收敛

预计：持续 4–8 周。

### 任务

- 把三类 kernel 中重复的 importer、rule、layout pattern 提升为稳定 API；
- 建 CI 分层：快 IR/SMT、native NEON、QEMU SVE、定期真实硬件 perf；
- 保存 cost prediction vs actual 数据，校准 target profile；
- 做真实 x265 profile/Amdahl 分析和 code-size/I-cache 回归；
- 对每个 family 执行 D6：继续搜索、目标达成或形成上界/负结果；
- 准备可读 patch、设计说明和上游拆分策略。

### 最终退出条件

见 [项目章程的完成定义](01-project-charter.md#7-完成定义)。达到 30% 必须按冻结 workload 报告；未达到也必须给出无选择偏差的完整结果和瓶颈证据。

## 2. 建议工作包与所有权

即使由单 Agent 执行，也保持以下逻辑边界，便于审查和并行：

| 工作包 | 主要产物 | 不应同时隐式承担 |
| --- | --- | --- |
| Frontend/IR | schema、importer、provenance、range | 最终性能判定 |
| Semantics/Verify | 指令语义、SMT、differential | 随意修改 target cost 追数字 |
| Search/Cost | layout/cover/schedule、profiles | 绕过 correctness gate |
| Codegen/Integration | source/object/dispatch/CMake | 定义 kernel 数学规格 |
| Benchmark | harness、raw data、statistics | 事后改变 workload/阈值 |

每个跨边界变更都应由对应测试验证，例如 search 新增 opcode 必须先通过 semantics；integration 新增 over-read 必须回到 contract/guard test。

## 3. CI 分层

| 层级 | 每次提交 | 内容 |
| --- | --- | --- |
| L0 | 是 | schema/unit、rule proof cache、formatter/lint |
| L1 | 是 | SpecIR interpreter、固定/random differential、NEON codegen compile |
| L2 | 是或合并前 | x265 TestBench correctness、sanitizer、guard-page |
| L3 | 定时 | QEMU SVE/SVE2 多 VL correctness |
| L4 | 定时/里程碑 | N1 与真实 SVE 硬件 performance，原始数据留档 |
| L5 | 里程碑 | 完整 clip encode/perf/bitstream 回归 |

性能 CI 不因一次噪声自动接受/拒绝候选；按统计门限生成状态，由 milestone decision 处理。
