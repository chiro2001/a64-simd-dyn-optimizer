# 建议验证标准

## 0. 适用范围

本文定义后续实现的验收门。本次咨询未运行构建、搜索或 benchmark，以遵守“只写三份建议文档”的会话约束。内部聚合参考只用于方向和比较，不参与正确性判定。

## 1. 统一验证漏斗

1. **静态合法性**：target feature、固定 VL、lane 等价、range、round barrier、constant map、地址一一映射全部通过；`scatter_gather == 0`。
2. **rewrite 单测**：边界值覆盖半 LSB 前后、s16/s32 极值、正负 tie、饱和与非饱和差异；每个 rewrite 校验前后逻辑 lane 相等。
3. **快速差分**：生成后先做 2k case；upstream-exact 必须 0 分歧，不能用“低分歧率”参与成本排序。
4. **搜索门**：2k 存活者做 manifest 的 20k corpus；再进行 QEMU true-dynamic 与 Pareto 排名。
5. **finalist 门**：200k case、所有 stride/phase、0 分歧；记录首差能力即使结果为 0。
6. **黄金门**：至少 3 个固定 seed 的 TestBenchLite；DCT16 合同变化或最终部署候选再跑完整 x265 TestBench，并保留故意错误候选的负向对照。
7. **guard 门**：错误 VL/ISA 必须在进入候选体前拒绝；输入输出双侧 guard page、最小/非自然 stride、线程内 VL 设置均通过。
8. **实机门**：QEMU 只证明功能和动态指令构成。性能结论必须来自目标机 paired cycles；报告中位数、95% CI、重复轮次、机器/频率/绑核及可用 PMU。

合同规则：

- `upstream-exact`：20k/200k 均要求 bit-for-bit 0 mismatch。
- `legacy-internal-exact`：0.06% 只可作搜索代理，finalist 必须过完整 TestBench；不能用内部代码作 oracle。本轮 strict no-scatter 策略下，含 scatter 的 legacy 候选不得最终接受。
- 任何新合同必须有仓库内、可执行、非内部源码的规范 oracle；不能由聚合分歧率反推合同。

## 2. 机制级证明与回归

| 建议机制 | 静态/单元验收 | 差分与门禁 | 失败条件 |
| --- | --- | --- | --- |
| constant map 派生 | 对每个 `{pass,k,j,lane}` 证明逻辑系数、符号、复制次数；常量表 canonical round-trip 一致。 | DCT32 20k→200k 0 分歧；至少 3-seed lite。 | 任一 lane 来源未知、依赖运行期未声明 permute、常量 footprint 无上限。 |
| output-lane `sdot.d` | 每个 s64 lane 恰对应一个输出；乘积项无缺失/重复；累加范围容纳最坏输入。 | 200k 0 分歧，并对全零、单 impulse、交替极值、全极值做定向 corpus。 | 需要 s16 回绕才能匹配、未定义 lane 参与、输出 ownership 不唯一。 |
| 批量窄化/连续存储 | 精确建模 round mode、shift、取高低半、饱和；MemoryMap 对输出是双射且连续。 | 200k + lite；guard page 覆盖首尾输出；动态/反汇编 `sg=0`。 | 舍入点移动、`rshrnb/sqrshrnb` 混用、地址空洞/重复、任何 scatter/gather。 |
| 行/k 分块与 accumulator 调度 | `max_live_z<=32`，谓词/GPR 有预算；编译后比较估计 liveness 与实际 spill。 | 所有 plan 先 2k；finalist 200k + lite。 | `stack_vector` 意外增加且没有净收益，或因重命名改变 destructive-op 语义。 |
| 结构化 permute | `search_permute` 输出逐 lane 等价证书；临时数和序列长度有界。 | 目标 kernel 20k→200k；对旧 v3.1 做机器计数消融。 | 只在局部 lane map 成立、全局 ownership 不成立；未证明的 tbl→zip peephole。 |
| interpass retile | pass1 **已舍入 s16 逻辑矩阵**逐元素等同基线；`round_epoch=after-pass1` 不变。 | 先比较 pass1 中间矩阵，再做最终 200k 0 分歧和 lite。 | 延迟/合并 pass1 舍入、保存未舍入 partial，或重现已知 3.87% 类分歧。 |
| movprfx/ILP 调度 | lane map 不变；def-use、破坏性目的和 alias 检查通过。 | 功能门同上；实机 paired cycles 才判断收益。 | 仅 fused_uop 下降/持平但 raw、spill、依赖链恶化时宣称性能提升。 |

## 3. 工具路线逐项验收

### P0：轴解耦与兼容性

- 旧 v1、v2、v2b、v3.1 均可由显式 plan 回放；至少语义、汇编类别直方图和 true-dynamic 计数一致，v3.1 仍为 3962、`sg=0`。
- 每个轴关闭时生成不同 canonical plan；无效轴组合在 codegen 前被约束系统拒绝。
- 搜索脚本不再包含 DCT16/DCT32 专属的轴依赖分支；重复 plan 在生成源码前去重。
- 回放候选通过 200k upstream-exact、3-seed lite、VL/guard 门；实机只需确认兼容 plan 不回退。

### P1：typed LayoutIR 与原子 rewrite

- schema round-trip、canonical hash 稳定；交换无关 rewrite 顺序后等价 plan 获得相同 key。
- `verify_layout()` 对故意破坏的 lane、range、round、constant、address、ISA 各有一个必失败单测。
- 禁用复合 grouped 模板后，原子 rewrite 能生成可编译候选；它必须通过 200k、lite、no-scatter、fixed-VL guard。
- 对 interpass 变换增加 stage-level oracle；只看最终输出不足以验收舍入屏障。

### P2/P3：分层搜索与成本代理

- 在可穷举的小空间建立 measured truth set；Pareto/beam 必须保留全局最佳及各语义指纹最佳，尤其不能剪掉 held-out v3.1。
- 报告 `best recall`、编译候选缩减倍数和每层耗时；Spearman 仅作诊断，不作放行门。
- `fused_uop`、raw vector、movprfx、stack_vector、max-live、流量分别输出，禁止折成未经校准的单值 cycles。
- 机器 profile 用 leave-one-structure-out 验证；未能在 held-out 上保持 top-k 命中前，只能用于 Pareto 粗筛。
- 所有被动态排名的候选必须已执行 20k 0 分歧；无法执行的 SVE2p3 plan 单列 `unexecuted`。

### P4：反例驱动规则

- 可一键重放 seed/input/contract/target，并定位最早分歧 barrier；delta-debug 后仍保持同一失败原因。
- 已知 DCT16 全 s16 even-dot 必须归为 range 前置条件失败；DCT32 partial 直通必须归为 round-barrier 失败。
- 正例集至少包含 DCT16 upstream best、DCT32 v3.1、interp8 path-A；新增规则不得误剪这些 plan。
- 每条硬规则需有反例、适用域、静态证明或完整门禁证据；随机 corpus 上的相关性不能直接升级为硬规则。
- 性能反例与语义反例分库：dct8 切片不盈利只能形成 shape/target 特定 dominance，不能禁止该 rewrite。

## 4. 三个下一轮实验的验收矩阵

| 实验 | 差分 | Lite/TestBench | guard / ISA | 指令与实机判定 |
| --- | --- | --- | --- | --- |
| E1 DCT32 盲重发现 | 搜索期 2k/20k，finalist 200k upstream-exact 0；定向极值/impulse 0。 | `--gate dct32` 至少 3 seed PASS。 | VL=128/512 拒绝且候选体零调用；输入/输出 guard；`sg=0`。 | 禁用复合 v3 后自动得到 `fused_uop<=3962` 为 Go；实机 SVE2 cycles 仅在可用目标机上补验，未测时只称指令最优。 |
| E2 SVE2p3 canary→interp8 B | canary 先对已知逐 lane 结果；其后三相位 20k→200k 全 0。 | `--gate interp8` 至少 3 seed PASS。 | 静态 ISA 检查 + runtime canary；SIGILL 即环境不支持；覆盖 `src-3` halo、三 stride、双侧 guard。 | 首要 Go 为 `<127 fused_uop`；100–105 只是 stretch。模型只能验正确性，cycles 必须来自真实 SVE2p3 硅片。 |
| E3 NEON→NEON 消融 | 每个 2×2 变体 20k，finalist 200k upstream-exact 0。 | DCT16 lite 多 seed + 完整 TestBench PASS。 | NEON feature/ABI、输入输出 guard；无 SVE VL 依赖。 | N1/920B 随机化 paired A/B；95% CI 全部快于基线才称 win，达到 +30% 才称项目目标完成，否则仅用于成本校准。 |

## 5. 性能报告的最低字段

每个 finalist 至少记录：contract、target features、VL、canonical plan、源码/对象 hash、编译器与 flags、差分 cases/mismatches、lite/TestBench seed、guard 结果、dynamic total/raw/movprfx/fused_uop/sg/stack-vector、常量字节数、max-live 估计，以及实机 cycles/CI/PMU。缺少实机数据时结论必须写“QEMU 指令代理”，不能写“性能提升”。
