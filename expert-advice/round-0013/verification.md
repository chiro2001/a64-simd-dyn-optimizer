# round-0013 验证标准

## 0. 标记规则与统一门

- **事实**：可由仓库当前代码/脱敏文档直接复核的结果。
- **推断**：由事实推出的工程判断；不是性能或语义证明。
- **需实验**：必须生成候选并运行门禁后才能下结论。

所有候选先经过同一硬门：target feature 与固定 VL 合法、`allow_scatter=false`、
round barrier/位宽/range 可证明、输出地址连续且双射、编译成功。硬门失败的
计划不得进入成本排序。`fused_uop` 是 QEMU true-dynamic 代理，不是 cycles；
只有目标机 paired measurement 才能称实机性能提升。

## 1. E1 验收层级

| 层级 | 当前证据/判定 | 必须补齐的验证 | 通过标准 |
| --- | --- | --- | --- |
| E1-R rewrite-driven | **事实：**18→18→12→12 漏斗，best 3962；search_plans 已在 `lower()` 前按 canonical key 去重。 | 将输出固定为机器可读层计数，并保存每个 plan 的 key、rewrite 顺序、源码别名。 | 语义、canonical、source-proof、measurement 四层均无未解释失败；best=3962、`sg=0`、20k 0 mismatch。 |
| E1-B backend-independent | **推断：**当前尚未成立；`lower()` 仍调用 grouped C++ 块，Tile 改变可不影响源码。 | 用不导入 `emit(layout="v3")`/`pass_grouped_cpp` 的 OpIR backend 生成同一候选。 | op provenance 覆盖率 100%；每个 Tile/ConstantMap/MemoryMap/RoundBarrier 至少有消费者；200k 0 mismatch、Lite≥3 seed PASS、`sg=0`。 |
| 统一主驱动 | **事实：**search_sve2_layouts 目前是 manifest cartesian product + emit 后源码 hash；尚未共享 Plan canonical 层。 | DCT16/DCT32/interp8 适配共同 `SearchAdapter`，codegen 前 canonical 去重。 | DCT32 仍 3962；DCT16 既有 prune 计数与 best 不回退；interp8-A 仍 127。 |

### E1 必测负例

1. 把一个 output tile 改成不匹配的 `row_group`/lane ownership：必须由
   `verify_layout` 或 OpIR lowering 拒绝，不能静默生成相同源码。
2. 改变 pass1 round shift 或把 round epoch 跨 pass 移动：必须报告
   `round_barrier` 失败；不得只在最终差分失败后才发现。
3. 将任一 store 改为 scatter/gather：必须在 codegen 前拒绝，并在 source/object
   proof 再次报告 `scatter_count>0`。
4. 删除/重复一个 dot segment 或常量 lane：必须出现具体 `op_id`/lane 的
   provenance mismatch，而不是只有总指令数不符。

## 2. 实验 #1：DCT32 OpIR 垂直切片

**事实**：当前 `check_source` 只能按 `svdot_s64`、`svmul_s32`、store、
scalar destination 等家族计数。**推断**：这能发现块级错配，却不能证明
逐 lane/逐地址等价。**需实验**：让 OpIR backend 至少覆盖 leaf、odd、pass1-k2、
round/narrow/store，并与 grouped backend 并行生成。

验证顺序及门槛：

1. **IR 单测**：每个 op 的输入/输出类型、lane owner、term coverage、
   `round_epoch`、constant source、address expression 都有正例和故意破坏
   的负例；所有 op `op_id` 唯一且可追溯到 Tile。
2. **中间值门**：在 pass1 barrier 后逐元素比较 OpIR interpreter 与 grouped
   oracle；不能只比较最终 pass2 输出。覆盖全零、impulse、交替极值、随机正负、
   半 LSB/tie。
3. **编译前 proof**：`ProofReport.status=PASS`，`provenance_coverage=1.0`，
   `address_bijection=true`，`scatter_count=0`，`max_live` 在目标寄存器预算内。
4. **快速/正式差分**：2k 作为筛选；存活者 20k；finalist 200k，所有 manifest
   stride，upstream-exact 必须 mismatch=0。
5. **黄金门**：DCT32 TestBenchLite 至少 3 个固定 seed PASS；最终候选再跑完整
   TestBench（若环境可用）。保留一个故意删 op 的负向候选并确认门禁失败。
6. **动态门**：QEMU VL=256 true-dynamic，`vector_fused_uop<=3962` 作为
   E1-B Go；同时记录 raw vector、movprfx、stack_vector、spill、scatter。
   若计数高于 3962，标记 backend 尚未重发现，不得用放宽合同替代。

## 3. 实验 #2：`row_group=8` 与双 accumulator

**事实**：当前 verifier 只接受 row group 1/4，VL=256 的 s64 lane 数为 4。
**推断**：8 行不是简单把 `4` 换成 `8`；需要两个 accumulator bank、常量
   生命周期和 store/round 调度的联合证明。**需实验**：先静态可行性，再编译
   和动态测量。

静态标准：

- 每个输出恰有一个逻辑 owner；两个 bank 的 lane 映射不重叠且覆盖完整输出；
- 每个 dot segment 的项集合无缺失/重复，accumulator bits 足以容纳最坏范围；
- `max_live_z<=32`（并记录谓词/GPR预算），无未声明 spill；
- pass1/pass2 round barrier 不移动；store 地址连续、无 scatter；
- `ProofReport` 能解释 bank 切换点、累加依赖和窄化批次。

动态/正确性标准：200k upstream-exact 0 mismatch、Lite≥3 seed、guard/stride
通过、`sg=0`。收益不设预先乐观目标：至少一项（fused_uop、raw vector、
stack_vector 或实机 cycles）严格优于 row_group=4，且没有另一项显著恶化；
否则记为“信息性否决”，不阻塞主线。

## 4. 实验 #3：共同搜索驱动与多 kernel 回归

**事实**：`layout_plans()` 已把 DCT16 依赖规则通用化，但 DCT16/DCT32 的
   emitter 入口仍在 `search_sve2_layouts.py` 分支中分别处理。**推断**：先合并
   schema、cache、proof 和预算层，能比再添加 DCT32 轴更快发现工具回归。

验收字段（每个候选/每层都保存）：

`kernel, contract, target features, VL, plan_key, semantic_fingerprint,
backend_version, compiler/flags, source_hash, object_hash, proof status/reasons,
verify cases/mismatches, dynamic total/vector/raw/movprfx/fused_uop/sg/stack,
cache hit, elapsed_ms`。

漏斗门：

1. semantic ProofReport 后才生成 canonical key；canonical 去重后才允许 codegen；
2. lowering source hash 只作为第二层别名，不替代 semantic key；
3. 预算分层为 2k quick diff → 20k + trace → 200k/Lite finalist；
4. 每个 semantic fingerprint 至少保留一个代表，报告剪枝率与 held-out recall；
5. 未能执行的 SVE2p3 候选状态只能是 `build-only`/`semantic-only`，不得进入
   动态 best；缓存键必须包含 ISA/executor/backend/compiler 版本。

回归基线：DCT32 rewrite search 18/18/12/12 与 3962 不变；DCT16 manifest
`layout_prune` 结果维持 520/520（旧硬编码等价）；interp8 path-A 维持
127、整宽越界修复和 Lite PASS。

## 5. 条件实验与延后项

### interp8 path-B（SVE2p3）

**事实**：汇编器接受 `sdot.h`，当前 QEMU 执行 SIGILL；path-A=127 已实测。
先跑 canary（零/正负混合/非零累加器/极值逐 lane）；canary 不通过时只做
semantic interpreter 与 build-only 记录。canary 通过后才要求三相位 20k/200k
0 mismatch、Lite≥3 seed、halo/guard、动态计数；`<127` 是候选收益门，100–105
仅为待验证 stretch，不是承诺。

### NEON→NEON 同算力消融

用于成本模型校准而非阻塞 DCT32 工具验收。固定算法/位宽/舍入合同，只比较
窄化存储与 accumulator 交错的 2×2 组合；每个变体 200k 0 mismatch、完整
TestBench；目标机 paired cycles 至少 30 次/变体，报告中位数与 95% CI，只有
CI 明确优于 baseline 才称收益。无目标机时不得由 QEMU 或静态条数宣称性能。

### 明确延后

完整逐寄存器/逐 op 覆盖（在垂直切片稳定后扩展）、任意 interpass retile、
跨 kernel 通用 MachineIR、学习式 cycles 模型和 960 实机校准均可延后；但
不得延后 E1-B 所需的最小 op provenance、codegen 前 canonical 去重和
ProofReport 硬门。

## 6. ProofReport 剪枝的安全标准

- `REJECT` 只能由可重放的硬事实触发（ISA/VL、range、round、address、scatter、
  缺 op）；保存 reason code、scope、plan key 和 counterexample。
- `UNKNOWN` 不得直接剪枝；送入较小 compile/measure 预算，并在报告中标明。
- 经验性 dominance 只有在相同 target/contract/semantic fingerprint 下才可
  作为软剪枝；必须保留每个指纹的代表和 held-out v3.1。
- 新规则必须同时有正例（DCT32 v3.1、DCT16 当前 best、interp8-A）和负例；
  随机差分相关性不能单独升级为合法性定理。
- `check_source` 保留兼容 API，但其结果应封装进四级 ProofReport（plan、
  lowering、object、trace）；正则计数只能证明“出现了什么”，不能声称
  “lane 语义已经证明”。
