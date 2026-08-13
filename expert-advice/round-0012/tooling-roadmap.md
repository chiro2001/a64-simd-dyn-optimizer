# 内部优化点提炼与工具自搜索路线

## 0. 证据边界与标注

本文对内部 DCT16/DCT32 的判断只使用 [docs/18](../../docs/18-internal-dct-evaluation.md) 与 [docs/20](../../docs/20-dct32-optimization-assessment.md) 已脱敏的聚合指标，不把内部参考视为源码、语义 oracle 或可复现实现。其余判断来自仓库内现有工具和公开候选。

- 【事实】：仓库数据、代码接口或已完成实验直接支持。
- 【推断】：由聚合结构或现有候选归因得到，不能声称是内部实现细节。
- 【建议·待验证】：下一步可实施但尚无结果。

## 1. 从内部聚合指标可编码的机制

| 机制 | 仓内事实与推断边界 | 工具可落地搜索轴 | rewrite / 合法性 | 成本项 |
| --- | --- | --- | --- | --- |
| 常量预排列与复制 | 【事实】内部 DCT16 聚合中 `tbl/tbx` 为 0、`mov` 仅 1，内部 DCT32 以大量 `ld1h+sdot` 为主；v3.1 已用预排列双份常量。【推断】直方图支持“把数据侧置换吸收到 constant map”，但不能反推出内部表布局。 | `constant_map={canonical, lane-replicated, k-family-packed}`；复制因子由 lane ownership 派生，不作为任意字节表穷举。 | `derive_constant_map(lane_map, G)`；逐 lane 证明每个逻辑系数 `G[k,j]` 的来源、符号和复制位置，禁止凭指令模式改表。 | 运行期 permute、常量 load、常量字节数/I-cache、成对寄存器搬移、最大常量活跃数。 |
| lane-per-output dot | 【事实】DCT32 v3/v3.1 的 4 行切片使每个 s64 lane 拥有一个完整输出，消除了逐输出横向归约；内部 DCT32 聚合含 1376 条 `sdot`。【推断】“dot 主导”不等于所有 k-family 都能安全走 s16 输入。 | `row_group={1,2,4,8}`、`lane_owner={partial, output}`、每个 `{pass,k_family}` 的 lowering `{mul-reduce, sdot.d}`、`acc_bits={32,64}`。 | `assign_output_lanes` + `segment_dot`；前置条件是输入位宽、累加范围、VL 下 lane 数和输出地址均可证明。DCT32 pass2 EO 为 s32 时不得强行套用 s16 dot。 | dot/mul 数、横向归约数、切片 pack、累加依赖深度、活跃 accumulator、每输出 uop。 |
| 批量窄化与连续存储 | 【事实】内部 DCT16 窄化 64、内部 DCT32 `rshrnb` 256；v3.1 用 `uzp1+rshrnb+uzp1` 批处理并保持 upstream-exact、零 scatter。 | `narrow_batch={1,4,8,16}`、`narrow_kind={rshrnb,sqrshrnb}`、`store_topology={contiguous}`；scatter/gather 不进入合法域。 | `batch_round_narrow_store`；必须保留 shift、rounding epoch、饱和/回绕语义，并由 address map 证明无空洞、重复或越界。`sqrshrnb` 只在合同明确允许时可选。 | narrow/compact/store uop、store 字节与连续性、额外 `uzp`、store queue 压力；`scatter_gather>0` 为硬失败而非低分。 |
| 寄存器分块与循环平铺 | 【事实】DCT32 v3.1 的有效粒度是 4 行；docs/18 记录 DCT16 的 4/8 行合并方向；v2b 的惰性常量加载与 spill 重载净持平。 | `row_group`、`k_tile`、`const_lifetime={preload,jit}`、`accumulator_policy={inplace,rotating,tree}`、pass 内 block 顺序。 | `tile_rows`、`tile_k`、`schedule_accumulators`；以 VL、Z/P 寄存器预算和 destructive-destination 约束合法化。 | `max_live_z/p/gpr`、预计/实际 spill、`stack_vector`、`movprfx`、关键路径、load-use 距离。 |
| 结构化置换而非 peephole | 【事实】DCT16 的 zip 化曾消除 `tbl 62 + mov 54`；但仓库 BFS 已证明目标“行切片”没有短的局部 zip/uzp 替代。【推断】机会来自改变全局 lane ownership/转置方向，而不是逐条把 `tbl` 换成 `zip`。 | `pack_family={tbl,zip/trn,structural-transpose}`，同时与 `row_group/lane_owner` 联合搜索。 | 先由 LayoutIR 选择目标 lane map，再把 `tools/search_permute.py` 当叶子 solver；不得让局部 solver 决定全局布局。 | 网络长度、临时寄存器、pair-register 搬移、依赖深度、常量可吸收的 permute 数。 |
| 跨 pass 数据布局 | 【事实】v2 通过行主序取消叶子缓冲回访；DCT32 partial 直通因延迟 pass1 舍入产生 3.87% 分歧而否决。【推断】仍可搜索“已按原语义舍入后的 s16 中间矩阵”如何分块/转置，不能搜索绕过舍入的 partial。 | `interpass_layout={row-major, transposed-block, block4}`、`materialization={rounded-s16}`；upstream-exact 下 `round_epoch=after-pass1` 固定。 | `retile_materialized_boundary`；先逐元素生成相同的 pass1 逻辑矩阵，再只改地址/块布局。移动或合并舍入必须另有等价证明，否则剪枝。 | 中间矩阵 load/store、地址算术、transpose/pack、缓存行、pass2 连续访问率、活跃块数。 |
| 累加形式与 `movprfx` | 【事实】DCT16 legacy 比内部聚合多约 19 条 `movprfx`；DCT32 v3.1 的 `movprfx` 已从早期版本显著下降。【推断】它对 cycles 的影响依赖微架构，不能只因 fused 口径把它忽略。 | `accumulator_policy`、源/目的寄存器 ownership、unroll/交错度。 | 在 lane map 不变时做破坏性目的重命名与多 accumulator 轮换；用 liveness 验证不引入 spill。 | raw vector、融合后 uop、`movprfx` 对数、串行 dot 链长度、实机 issue/rename 事件。 |

### 必须先于成本排序的硬约束

1. 【事实】默认合同是 upstream-exact；内部 DCT16/DCT32 分歧签名不同，聚合参考不能作为放宽合同的依据。
2. 【事实】DCT16 `legacy_even_full` 把对称偶路径也改为 s16 dot 后，分歧约从 0.045% 增至 0.090% 且 TestBench 首跑失败；因此位宽不是软成本轴。
3. 【事实】DCT32 跨 pass 延迟舍入 3.87% 分歧；`round_epoch` 必须成为 IR 类型/效果的一部分。
4. 【事实/用户策略】gather/scatter 禁用；未来搜索应令 `allow_scatter=false`，而不只是沿用 `+3×sg` 排名惩罚。历史 704 可保留作比较，但含 scatter 的候选不应成为 strict-policy finalist。
5. 【事实】固定 VL=256 和 ISA feature 是合法性合同；SVE2p3 候选不得在只有 SVE2 的执行器上被误判为“算法失败”。

## 2. 当前“会选模板、不会发现机制”的差距

| 层 | 当前事实 | 主动搜索所缺 |
| --- | --- | --- |
| 搜索表示 | `kernels/dct32/manifest.yaml` 只有 `layout: [v1,v2,v2b,v3]`；`make_emitter()` 只传一个字符串。 | 独立的行组、k-family lowering、lane ownership、constant map、窄化、存储和调度轴。 |
| 发射器粒度 | `pass_grouped_cpp()` 把 4 行切片、`sdot.d`、常量形式和窄化链作为一个人工模板；当前 `v3` 实际已包含文档所称 v3.1 的 pass1 k≡2 路径。 | 由合法 rewrite 组合生成该结构，而不是为它取一个新版本名。 |
| 轴约束 | `search_sve2_layouts.py` 内硬编码 DCT16 轴依赖；manifest loader 只做笛卡尔积。 | manifest/IR 层的 `requires/conflicts/derived` 约束与规范化 plan hash。 |
| 语义证明 | `PackIR` 有 lane provenance，`range.py` 有值域，但尚未承载 DCT32 SVE2 布局、round epoch、constant/address map。 | 一个窄范围 typed LayoutIR，把现有 provenance/range 能力接入布局搜索。 |
| ISA 能力 | `TargetFeatures` 已有 `sve2p3_vl256()`，ISA 表也已有相关条目；布局搜索的编译和执行命令仍固定为 SVE2/QEMU max。 | target、assembler、executor 三者的 capability handshake，以及 `build-only/semantic-only/executed` 状态。 |
| 成本反馈 | 编译后有真实动态 `fused_uop`、`stack_vector`、`movprfx`；既有静态关键路径模型跨家族排序失败。 | 硬约束之后的多目标 Pareto、编译前 liveness/流量下界、实机 profile；禁止无校准的单一 cycles 分数。 |
| 失败反馈 | 差分主要返回 mismatch 数，失败组合被缓存但不会形成新的合法性规则。 | 可重放/最小化反例、最早分歧 stage、带合同和适用域的负约束。 |

## 3. 最小改进路径（按收益/风险排序）

### P0：先解耦 v3.1 的复合轴

**收益：高；风险：低；优先级：最高。** 这一步让工具能做机制消融和组合搜索，但仍属于“参数化发现”，不是最终的自动综合。

【建议·待验证】把 DCT32 的单个 `layout` 拆成以下最小轴：

- `row_group={1,4,8}`；
- `lane_owner={partial,output}`；
- `odd_lowering={row-reduce,sdot.d}`；
- `pass1_k2_lowering={mul-reduce,sdot.d}`；
- `constant_layout={canonical,derived-replicated}`；
- `narrow_batch={1,4,8}`；
- `interpass_layout={row-major,block4}`；
- `accumulator_policy`、`k_tile`；
- `store_topology={contiguous}`，并固定 `allow_scatter=false`。

文件与接口建议：

- `tools/kernel_manifest.py`：新增结构化轴依赖，提供 `layout_plans(manifest, target)`，不再只返回笛卡尔积；
- `tools/search_sve2_layouts.py`：移除 kernel-specific `if combo...`，缓存键改为 `contract|target|canonical_plan_hash|lowering_version`；
- `tools/emit_dct32_sve2_shared.py`：先增加 `emit(plan)` 适配层，旧 `v1/v2/v3` 仅映射为预置 plan，以保证回归；
- `kernels/dct32/manifest.yaml`：将目标特性、strict memory policy 和轴域显式化。

关键约束是“派生而非交叉积”：constant map 应从 lane map 自动生成，`narrow_batch` 应受输出 lane/address map 约束，8 行组在 4 个 s64 lane 下自然需要两个 accumulator。否则组合数膨胀且大量候选只是重复源码。

P0 完成标准：旧 v1/v2/v3.1 plan 能回放到相同语义和计数；每个核心机制可单独关闭做消融；不允许用一个 `v3_like=true` 重新包回复合模板。

### P1：实现一个“只够重发现 v3.1”的 typed LayoutIR

**收益：很高；风险：中。** 不建议先把所有 MachineIR/LoopIR 重构完；最小垂直切片只覆盖 DCT32 odd 与 pass1 k≡2 两类线性点积。

建议新增 `optimizer/ir/layout_ir.py`，每个值至少携带：

```text
ValueLayout(id, elem_type, lanes[logical_value], range, wrap_mode)
RoundBarrier(stage, shift, rounding_mode, narrow_type, saturating)
ConstantMap(logical_G_index -> table/lane, replication)
MemoryMap(logical_value -> base + affine_index, topology)
Tile(pass_id, row_group, k_family, k_tile, lane_owner)
Target(features, fixed_vl, allow_scatter)
```

建议的稳定接口是：

```text
rewrite.match(plan, target, contract) -> ProofObligations
rewrite.apply(plan, obligations)       -> (new_plan, ProofCertificate)
verify_layout(plan)                    -> ProofReport
lower(plan, backend)                   -> CandidateSource
canonical_key(plan)                    -> bytes
```

第一批只需三个主动 rewrite，加一个派生步骤：

1. `assign_output_lanes(row_group)`：把 4 个输出映射到 VL=256 的 4 个 s64 lane；
2. `segment_dot(term_group=4, acc=s64)`：把 16-term dot 分为 4 段并保持每 lane 的逻辑输出 ownership；
3. `batch_round_narrow_store(batch=4)`：在原舍入点生成 `uzp1+rshrnb+uzp1` 等价链和连续地址图；
4. `derive_constant_map()`：根据上述 lane map 生成复制常量，不作为手写 rewrite。

复用而不是重造：lane 表达可扩展 `optimizer/ir/pack_ir.py`/`provenance.py`，值域复用 `optimizer/analysis/range.py`；新增 `optimizer/analysis/layout_verify.py` 统一检查 lane 等价、range、round barrier、地址一一映射和 ISA feature。

主动发现的硬定义：禁用 `pass_grouped_cpp()` 这一复合候选，仅从规范 DCT 图和以上 rewrite 出发，搜索仍能生成 upstream-exact、零 scatter、`fused_uop <= 3962` 的 plan。做不到就说明 IR/rewrite 仍缺表达能力，不能称为“工具发现”。

### P2：分层搜索，避免新轴再次退化成大笛卡尔积

**收益：高；风险：中低。** 层次应与证明成本一致：

1. **语义层**：固定合同与两个 pass 的 round barrier；枚举各 k-family lowering 和位宽，range/ISA 不合法即剪枝；
2. **布局层**：枚举行组、lane ownership、interpass layout、连续地址图，自动派生 constant map；按 lane 等价和对称性规范化去重；
3. **lowering 层**：为目标 lane map 调用 `tools/search_permute.py`，再枚举 narrow chain、accumulator ownership、load/schedule；用 liveness 和流量下界做 Pareto；
4. **测量层**：编译静态 top/Pareto 集，先小差分，再对存活者做 QEMU true-dynamic；20k、200k、lite 只逐级放大。

小空间仍穷举；只有超过时间预算才在每个“语义指纹”内保留 beam/Pareto 前沿，避免全局 beam 提前丢掉一种 k-family。`canonical_key` 必须基于逻辑 lane/constant/address map，而不只基于生成源码，才能在 codegen 前去重。

### P3：成本代理改为“硬门 + Pareto 特征 + 实机校准”

**收益：高；风险：中。** 既有证据已否决未经校准的单值静态 cycles 排名；因此不要再拟合一个全家族总分。

建议 `optimizer/analysis/layout_cost.py::estimate(plan, target_profile)` 返回成本向量：

```text
(compute_uops, permute_uops, narrow_uops, contiguous_ldst_uops,
 constant_bytes, max_live_z, max_live_p, spill_risk,
 movprfx_pairs, dependency_depth, interpass_bytes)
```

排序顺序：

1. 合同/range/round/address/ISA/VL/no-scatter 硬门；
2. 编译前成本向量的 Pareto dominance，只剪掉在同一语义指纹下被全面支配者；
3. 编译后的 `vector_fused_uop`、raw vector、`stack_vector`、`movprfx` 精排；
4. 实机 paired cycles/PMU 是最终排序，QEMU 指令数不称为性能结果。

`optimizer/analysis/critical_path.py` 可作为一个 Pareto 特征，不能恢复为唯一 ranker。机器 profile 应按微架构分开；SVE2 2×256 与未来 4×256 不共享权重。对于不能执行的 SVE2p3 候选，状态必须是 `unexecuted`，不能混入已动态验证榜单。

### P4：反例驱动的保守规则归纳

**收益：中高；风险：中。** 目标不是从随机失败中自动“发明数学定理”，而是把反例归入有限模板并生成可审核的 rewrite 前置条件。

建议流程：

1. `gen_verify.py` 输出 seed、首个输入、首差输出 lane，并可保存可重放 case；
2. 对输入做幅值、非零行/lane 的 delta-debug，找到仍失败的最小 case；
3. 用 LayoutIR interpreter 比较每个 round barrier 前后的逻辑值，定位最早分歧；
4. 从模板生成规则：`requires_range_fit(s16)`、`preserve_round_epoch(pass1)`、`preserve_saturation_mode`、`address_bijection`；
5. 规则记录合同、目标、反例、证明域和正例回归；只有静态证明或完整门禁支持后才升为硬剪枝。

建议落点：`optimizer/search/counterexamples.py` 负责最小化/分类，`optimizer/rules/layout_legality.yaml` 保存审核后的规则，`search_sve2_layouts.py` 只消费规则而不在主循环内拼条件。

首批回归必须覆盖：

- DCT16 全 s16 even dot：归纳 `EE` 不满足 s16 range 的前置条件；
- DCT32 partial 直通：归纳 upstream-exact 下 pass1 round barrier 不可移动；
- DCT32 v3.1：作为正例，任何新规则都不得误剪；
- dct8 切片“太薄”只应形成目标/shape 特定的成本 dominance 证据，不能成为语义禁令。

### 暂缓项

在盲重发现 v3.1 以前，暂缓完整 LoopIR 重建、跨 kernel 学习式 cycles 模型、任意置换超大搜索和自动放宽语义合同。这些工作风险高，且不能证明当前核心缺口已经闭合。

## 4. 下一轮实验（按信息增益排序）

### E1：DCT32 v3.1 held-out 盲重发现与机制消融

**信息增益：最高；环境风险：低。**

【建议·待验证】把现有 v3.1 仅作为 held-out gold，搜索入口禁止 `layout=v3`/复合 grouped 模板；允许 P1 的原子 rewrite 和 P0 轴。记录搜索是否自然选择 `row_group=4 + output-lane sdot.d + derived replicated constants + batch narrow`，以及 pass1 k≡2 是否独立出现。

同一实验做 leave-one-mechanism-out：分别禁用 constant prepack、output-lane ownership、batch narrow、k2 slicing，并报告净 `compute/permute/narrow/ldst/spill` 变化。再开放 `row_group=8`、k≡4/k≡0 的合法 lowering；若 range/liveness 先证明无机会，应由工具剪枝而不是人工结论。

Go：盲搜到 `<=3962`、upstream-exact、零 scatter 的候选。No-go：只能通过一个等价复合模板达到；返回缺失的 lane/constant/narrow 表达，而不是继续加版本号。

### E2：SVE2p3 执行 capability canary，再验证 interp8 path-B

**信息增益：高；环境风险：高。**

【事实】`sdot z?.h,z?.b,z?.b` 是 SVE2p3；汇编器接受，QEMU 11.0.3 `-cpu max` 执行 SIGILL。path-A 的 127 是事实，path-B 约 100–105 只是估计。

【建议·待验证】把环境验证拆成独立 canary：零/混合符号/极值输入、非零 accumulator、已知逐 lane 结果，依次在“更新版 QEMU（若其 capability probe 明确支持）→可用的 Arm architectural model→真实 SVE2p3 主机”尝试。任何环境都必须先通过 canary；只会汇编或只会 decode 不算可执行支持。

若所有执行器都不支持，可先在 LayoutIR/指令语义解释器中验证 path-B 算法与打包，但结果只能标 `semantic-only`，不能称 upstream-exact ISA 验证，更不能报告 cycles。canary 通过后才跑三相位差分、lite、guard 和动态计数。

Go：环境 canary 全通过且 path-B 比 127 更低、位级一致；stretch 目标为估计区间 100–105。No-go：仍 SIGILL/语义不符则停止 kernel 集成，只保留 build-only 轴等待合格执行器。

### E3：NEON→NEON 同算力的窄化/调度消融

**信息增益：中高；环境风险：低；预期收益不确定。**

【事实】已有同机数据中 NEON DCT16 174 cycles，内部/本项目 SVE2 为 204–213；说明 fused_uop 不能解释同算力机器的周期。【推断】先隔离布局/调度收益，比继续追 SVE2 指令数更能校准成本代理。

【建议·待验证】保持 upstream NEON 的算法、位宽和舍入点不变，只做 2×2 小消融：`narrow/store={原链,跨行批处理}` × `schedule={单累加链,双累加交错}`；常量只允许编译期预排列，不改变乘加数。分别记录 pass1/pass2 paired cycles、前端/后端/ldst PMU（可用项）和机器码。

Go：至少一个候选在可用 N1/920B 上重复测量的 95% CI 全部优于基线；达到项目 +30% 才能称目标完成。No-go：若改善不稳定或小于噪声，停止 NEON peephole，把数据用于 `target_profile` 的依赖/访存权重。
