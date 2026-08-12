# 风险、决策门和停止条件

## 1. 最高风险清单

| 风险 | 早期信号 | 缓解与硬门禁 |
| --- | --- | --- |
| 把现有 SIMD 实现误当完整规格 | roundtrip 自洽但与 C reference 边界 case 不一致 | scalar oracle + canonical contract；seed 只提供 layout/schedule |
| 位宽、signedness、饱和或舍入丢失 | 随机大值/高 bit-depth 才失败 | bit-vector IR、range proof、rounding boundary 节点、反例回灌 |
| 允许了 x265 调用方不保证的 over-read/alignment | standalone 快、guard page 或真实 encode 崩溃 | 默认精确 footprint；precondition 必须审计所有调用点 |
| 动态 trace 覆盖不全 | QEMU trace 没看到的分支在 fuzz 中失败 | trace 只调试；规格来自 contract/静态 lifting/oracle |
| 搜索空间爆炸 | 候选数指数增长、solver/RA 占满时间 | 分层 tile/layout/cover；seed、beam、budget、局部 superopt |
| “指令更少但更慢” | 静态 count 降、cycles/IPC 变差 | 多维 cost + 实机排名；检查依赖链、端口、spill、load latency |
| compiler 改写了期望指令 | source IR 好看但 object 不同 | 最终 object 是候选身份；expected opcode/spill 门禁；必要时 .S |
| LLVM cost model 不支持 SVE/目标 CPU | llvm-mca unknown/结果不合理 | 标 unknown；实机 microbench 校准；不让静态模型作最终裁判 |
| 在 N1 上误判 SVE 性能 | 只能交叉编译/QEMU | M6 必需真实 SVE/SVE2 VL=256 节点，否则状态保持 blocked-environment |
| 固定 SVE VL 的线程语义错误 | 主线程测试通过、worker 非 256 | runtime VL guard；线程继承测试；优先 VLA 或显式固定合同 |
| benchmark 噪声/挑样本 | 2-vCPU 云主机结果漂移、只报最快值 | paired randomized protocol、原始样本、CI、多时段重复 |
| 相对错误 baseline 报“30%/130%” | 与 C 比或跨机器比 | baseline 定义写入 manifest；同 binary/ISA/VL/commit A/B |
| x265 上游漂移 | API/文件/编译器变化使 candidate 失效 | 固定 commit；定期 rebase milestone；每次升级重跑全部门禁 |
| 生成代码维护/许可不清 | 无 provenance、难以上游 | candidate manifest、可读代码、x265 GPL/商业许可边界由项目 owner 审核 |
| AI 建议驱动未经证实的改动 | 建议直接合入、没有假设与实验 | 顶级模型只给建议；Agent 写 `decision.md`，一项项用证据验证 |

## 2. 架构决策记录（初始）

实现过程中把每个决策移入正式 ADR；下表给出默认选择与推翻它所需的证据。

| ADR | 默认选择 | 原因 | 重新评估条件 |
| --- | --- | --- | --- |
| A001 | 离线 AOT 生成，不在 x265 热路径 JIT | 可复现、低集成风险、易验证 | AOT 已稳定且存在显著 per-machine 未捕获收益 |
| A002 | SpecIR 来自 canonical DSL + C oracle | 避免把 C packed trick/NEON layout 当规格 | restricted-C importer 能在多个 kernel 自动得到同等清晰规格 |
| A003 | intrinsic codegen 先于 assembly | 快速接入 ABI/构建，便于迭代 | compiler 无法稳定表达关键 schedule/opcode 或持续产生 spill |
| A004 | QEMU 只作功能验证 | 模拟时间不能代表目标核心 | 无；性能仍必须实机 |
| A005 | seed-guided 分层搜索 | 可控制组合爆炸且至少回退到已知实现 | 小 region exhaustive superopt 有明确优势时局部采用 |
| A006 | SMT + differential 双验证 | 形式证明与真实 object/oracle 互补 | solver 无法扩展时可 region 化，不能直接删除差分门禁 |
| A007 | 256-bit SA8D target 分两档：920B=SVE1、N+2=SVE2.3 | 上游 SA8D 扩展实现位于 SVE2 路径；920B 实测无 sve2 flag | 当前候选只用 SVE1 基础指令，920B 可重建验证；N+2 按 SVE2.3 生成/门控；生成路径必须接入 TargetFeatures ISA 门控，不能靠文件名/旧 hash 断言 |
| A008 | 实机 latency/throughput 是最终成本 | 指令数与静态模型不足 | 无；可换实机 workload，但不以 QEMU 替换 |

## 3. 必做技术 spike 与判定

### Spike 1：规格前端可行性

比较 canonical DSL、Clang LLVM IR、直接 AArch64 lifting 在 SA8D 8x8 上的节点数量、opaque 语义、人工标注量和 translation-validation 时间。

通过标准：DSL/C oracle 能精确表达；intrinsic importer 能 roundtrip seed。若直接 binary lifting 超过两个迭代仍有未知语义，推迟 `.S` frontend，不阻塞 MVP。

### Spike 2：SMT 规模

对 4-point Hadamard、8-point 1D、8x8 两 pass 与 reduction 分级测求解时间，保存 solver/version/options。

通过标准：局部 pattern 可在 CI 预算内证明；whole tile 若超时，建立组合 lemma。若连 1D 都不稳定，先修 IR canonicalization，不扩大 kernel。

### Spike 3：布局搜索收益

在 NEON SA8D 上依次只开放 peephole、layout、跨 tile 三层，记录每层候选数、预测与实测收益。

决策：若 layout 搜索连续三个有代表性的 kernel 都无收益且耗时巨大，缩减为模板库；若收益显著，才投入通用 e-graph/ILP。

### Spike 4：成本模型相关性

对至少 20 个正确候选计算静态 cost 与 N1 实测排名，报告 Spearman correlation 和 top-k recall。

决策：top-k recall 低则增加实机筛选配额、校准 target profile；不应把 benchmark 反馈移除。

### Spike 5：SVE/VL 策略

在 QEMU 和真实 VL=256 硬件比较 fixed-VL 与 VLA 代码的正确性、代码形态和性能，并测试线程 VL。

决策：如果 fixed-VL dispatch 难以可靠约束或收益不足，生产只保留 VLA，fixed-VL 留实验路径。

## 4. 里程碑决策门

| 门 | 问题 | Go 条件 | No-go 后动作 |
| --- | --- | --- | --- |
| D0 | baseline 是否可信？ | 同 binary、噪声达标、原始数据完整 | 停止优化，先修环境/bench |
| D1 | 规格是否可信？ | C oracle、DSL、固定/随机/guard 一致 | 停止 importer/search，修 contract |
| D2 | seed importer 是否保真？ | 无 unknown、roundtrip 正确、性能近 baseline | 缩小 frontend 范围或改 wrapper |
| D3 | 搜索是否产生正确 candidate？ | proof/diff/RA/codegen 门禁可自动跑 | 只做规则库/验证基础，不接 x265 |
| D4 | candidate 是否值得注入？ | 相对最佳 baseline 达接受阈值、无关键回退 | 保留负结果，校准模型或换 bottleneck |
| D5 | SVE 性能是否有证据？ | 真实 CPU + VL=256 A/B | 只声称功能完成 |
| D6 | 是否继续追对应档位目标？ | profile 表明理论余量且 Amdahl/上界支持 | 停止该 family，记录可证明瓶颈，转下一个 kernel |

## 5. 单 family 的停止条件

以下任一条件触发正式复盘，而不是无期限继续枚举：

- 连续 3 轮、每轮一个明确且不同的高价值假设，最佳正确候选提升均小于 benchmark 最小可检测效果；
- 静态关键路径/资源模型和实机 PMU 共同显示已接近硬件 load/compute 下界，新增指令选择空间很小；
- 达到对应档位预注册目标且无回退；
- 达成收益所需 precondition 不被 x265 调用方保证；
- solver/验证无法覆盖必要语义，继续会牺牲正确性证据；
- 缺少目标硬件，所有不依赖该硬件的功能工作已完成。

复盘输出可以是“当前架构下合理上界低于对应档位目标”。负结果是合法交付，但必须给出证据、尝试边界和下一候选 family；不能把相对 C 的更大数字替代目标。

## 6. 回退与故障隔离

- `ENABLE_A64_DYNOPT=OFF` 必须恢复上游构建/dispatch；
- 运行时 debug 开关可禁用全部或单个 candidate；
- 每个 candidate 独立 symbol，不原地覆盖上游源函数；
- x265 crash/regression 先用 dispatch 开关二分，再用 candidate id 精确定位；
- 生成器升级不自动删除旧 candidate，先在新 pipeline 重建和比较；
- performance regression CI 只告警，候选是否回退按预注册统计门限决定，避免单次噪声造成 churn。
