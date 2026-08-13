# round-0014 tooling roadmap

下面的路线只描述实现建议，不在本轮修改 `tools/` 或 `optimizer/`。收益数字是相对当前串行流程的墙钟估计；除“去重/缓存命中”外，都要用 `verification.md` 的实验协议确认。

## 设计原则和两种运行模式

实现上应明确区分：

- `exhaustive`：保留所有合法 canonical source，所有通过短门禁的候选都做 20k 差分和 true-dynamic 计数，用于发布结果和回归；
- `explore`：允许静态/MCA/短差分漏斗，只测有希望的 beam，用于开发期找方向；输出必须标注为非 exhaustive。

两种模式共享 source-hash artifact store 和结果 schema。这样加速器不会悄悄改变黄金结果的定义。

## P0：可恢复的任务图和并行执行（先做）

### P0.1 规划阶段（单进程）

为每个候选生成如下不可变记录：

```text
task_index                 # 原始枚举顺序，保证稳定输出
kernel / mode
canonical_key              # rewrite/layout 规范键
source_sha256              # 完整 64 位 hash
source_text_schema
compile/link command hash
verify contract + corpus hash
qemu command hash
trace metric-schema version
mca configuration (optional)
```

先做语义合法性、依赖检查、canonical-key 去重，再按 `source_sha256` 去重。规划阶段不得启动 QEMU；因此同一源的别名永远只产生一个测量任务。

### P0.2 worker 和隔离

建议用 `concurrent.futures.ProcessPoolExecutor`；worker 内部仍用 `subprocess.run` 执行交叉编译器、QEMU 和 parser。线程池会把大量外部进程的错误处理和超时传播变复杂，`xargs -P` 虽可作为临时基准，但不适合作为长期结果合并器。

每个任务使用 `outdir/work/<source_sha256>/`，不要让不同 worker 共享 `seq_<hash>` 的临时文件。推荐阶段文件：

```text
source.cpp
candidate.o
verify.bin
trace-driver
stage-compile.json
stage-verify.json
stage-trace.json
stage-mca.json
result.json
```

写文件时先写 `.tmp` 再 `os.replace`；`result.json` 中记录状态机 `PLANNED/RUNNING/PASSED/FAILED_RETRYABLE/FAILED_PERMANENT`、return code、超时、工具版本和 artifact hash。worker 不写全局 `results.json` 或 `verify_cache.json`。

coordinator 收集 future 结果，按 `(task_index, canonical_key, source_sha256)` 排序后一次性生成 `results.json`、alias 映射和 cache index。并发完成顺序只影响日志，不影响 JSON 行顺序、best 或 Pareto 集。

### P0.3 并发度和 QEMU 资源

先在本地做 `W ∈ {1,2,4,8,12}` 扫描，分别记录墙钟、CPU 利用率、RSS、trace 写入量、QEMU 非零退出率。初始建议：

- compile/link/short-verify：`W = min(8, usable_cpu)`；
- full QEMU verify：与 `W` 相同起步；
- `-one-insn-per-tb` trace：单独 semaphore，先限制为 `min(4,W)`；
- MCA：独立队列，避免和 trace 同时把 CPU/IO 打满。

每个 QEMU 实例使用固定 `-cpu max,sve-max-vq=2`、固定 loader、唯一 `-D` 路径和 30--120 s 超时（按阶段校准）。QEMU 实例之间没有候选状态共享，主要开销是进程启动、译码和 trace IO；因此并行会近似线性到 CPU 或磁盘饱和点，但不能假定 16 个实例一定比 8 个快。

### P0.4 缓存和失败处理

把当前“按 seq 成功行缓存”升级为 content-addressed cache：

```text
cache_key = sha256(kernel, source, compiler, flags, manifest,
                   contract, corpus, qemu, parser_schema, mca_cfg)
```

缓存分三类：

1. `artifact`: source/object/binary 已存在且 hash 校验通过；
2. `permanent_failure`: 语义、编译、链接、确定性 ISA/符号错误；
3. `retryable_failure`: timeout、临时 IO、QEMU 被杀、parser 截断。

只有 1 和 2 可立即复用；3 记录尝试次数和最后错误，指数退避后最多重试固定次数。`RUNNING` lease 带 pid/时间戳；重启时回收过期 lease。这样 build/link 失败不会在每轮重复，临时失败也不会永久污染搜索。

## P1：最小风险的算法级加速

### P1.1 Rewrite 依赖拓扑和规范化（最高信息增益）

为每个原子 rewrite 增加元数据（建议先在规划器的 Python 表中实现）：

```text
requires:   已存在的 op/feature
provides:   新建的 op/feature
conflicts:  互斥结构
consumes:   会被删除的结构
idempotent: 是否允许重复应用
commutes_with / canonical_before
```

目前可直接由代码/文档支持的约束：

- `k0_even_sve` 需要 legacy k2/k4 前置；`dct32_op_ir.py` 也会检查相应 lowering 条件；
- k2/k4 legacy rewrite 的实现注释限定了适用的 row-group/leaf 形态；
- DCT16 `legacy_even_sve` 会整体重建 even block，并把 narrow 语义翻转为 legacy；应最多应用一次；
- `merge_narrow8`、`tbl2_to_zip` 在目标链已被替换后再次应用通常是 no-op、重复源或 build fail（这一点需由 planner 单测确认后才可当硬规则）。

规划器应在产生序列时就拒绝缺父节点、冲突和重复应用，而不是等编译失败。对可交换的 `tbl2_to_zip`/`merge_narrow8` 等组合采用一个固定顺序；对不确定是否可交换的组合先保留两个顺序并做一次等价性审计。

不要只保留“最短序列”：一个较长序列可能提供不同结构。应保留每个 canonical source 的代表，并把所有被折叠的原始序列记录在 alias 列表。

**预期收益 [推断]**：DCT32 当前结果显示 781 键、77 个 unique source 的量级快照以及大量别名；依赖和幂等规则若把测量源压到 40--100 个，QEMU/trace 工作量可下降约 2--10 倍。具体数字必须用旧枚举回放确认。DCT16 的当前 up-to-four 键数应按 121 计算（raw fixed slots 仍为 256）。

### P1.2 增量搜索和缓存复用

新 rewrite 或新 lowering 加入时，只生成受影响的 child source hash；不要因为 `results.json` 缺少某个 seq 就重跑整个笛卡尔积。缓存命中条件必须包含完整 source/compiler/contract 指纹，不能只看短 hash 或 seq 字符串。

可以把搜索组织为 BFS/beam DAG：父节点已测得的 object、verify 状态和静态摘要传给 child；但 child 仍必须重新链接、验证和 trace，不能把父节点的动态计数线性相加当作结果。

### P1.3 两级 differential

开发期先运行固定 seed、2k cases 的 reject gate；通过者再跑 manifest 的 20k cases。2k harness 应与 20k harness 使用完全相同的代码、VL、stride/value 分布和 RNG，只改变 cases 参数，避免“短版 oracle”漂移。

- upstream-exact：`returncode==0 && mismatches==0` 才进入 full gate；
- legacy：短版除随机样本外加入确定性 ±255、边界、stride 16/17/32 和已知回绕触发向量；不能因为短样本为 0 就宣称 C-exact；
- full gate 仍是 20k 差分，最终候选仍需 TestBenchLite/完整 TestBench。

**预期收益 [实验]**：若多数坏候选在 2k 即失败，可减少约 80--90% 的 full-QEMU 时间；若失败集中在 trace 前，收益接近 `2s→0.2s` 的差值。必须报告 full-pass 被短 gate 错杀的数量，目标为 0。

## P2：静态/MCA 漏斗（校准后再启用硬剪枝）

候选通过 compile 后，先做便宜的 `objdump`/mnemonic histogram/ISA 检查，再对一个 beam 或 Pareto 前沿运行 LLVM-MCA。静态指标可包括：静态向量数、load/permute/narrow 数、代码大小、critical-path proxy、MCA cycles/uops。

推荐三个阶段：

1. `static reject`：只拒绝违反 ISA、scatter policy、符号/结构不可能或明显超过安全上界的候选；
2. `MCA rank`：按 MCA 和静态摘要排序，保留 `K` 个/每个 rewrite 家族若干个；
3. `full trace`：对 exhaustive 模式全部执行，对 explore 模式执行 beam。

MCA 不能一开始取代动态计数。`docs/20` 已记录 MCA 与 920B 周期排序不一致，因此硬剪枝前须满足历史回放中“动态 best 召回率 100%”和至少一个预设 top-K 召回门。否则 MCA 只作 tie-break/日志。

## P3：trace 和文件 IO

当前 parser 为了生成 JSON 会把 `IN:` 反汇编表和执行流读入内存，并写出完整 instruction/vector 数组；搜索排名实际上只需要 counts。建议增加 fast path：

- QEMU 原始 log 只保留失败、top-K 或显式 debug 任务；
- 成功普通候选使用流式计数器，直接产出 `total/vector/movprfx/scatter/stack/fused`，不写完整 `.json`；
- 保留一个离线 `replay` 模式，用旧 parser 对原始 log 生成完整 JSON；
- parser schema/version 写入 cache key，并用小日志逐指令对比 fast path 与旧 path。

这项优化不改变 QEMU 本身的译码成本，只减少两次文件扫描、JSON 序列化和磁盘占用；收益是 [实验]，通常在并发 trace 时更明显。

## P4：MCA 和 verify 的批处理边界

可以把多个候选 object 的 objdump/MCA 放入同一个 coordinator 批次，但不能让一个 QEMU verify binary 内混跑多个候选而失去候选隔离。也不建议把 20k 次正确性调用和 `-one-insn-per-tb` trace 合在一次 QEMU：trace 会记录所有 verify 调用，日志数量暴涨且难以区分计数。

低风险做法是复用已链接的 verify binary、短/full 两次只改 cases 参数，并把 trace 保持为单独的 single-call driver。若未来实现 QEMU plugin/内存内计数，再单独做 A/B；在此之前“trace 与 verify 合并”不是 P0。

### P4.1 多候选差分批处理（向量化验证的现实边界）

可生成一个短门禁 harness，同时链接 `N` 个候选符号：为每个固定 seed/case 只生成一次输入并计算一次 reference，然后顺序调用 N 个候选、分别输出 mismatch。这样能摊薄 QEMU user-process 启动、动态链接/loader 和 corpus 生成成本；每个候选仍有独立的计数和失败状态。先只用于 2k reject gate，full 20k 可在测得隔离性后启用。

不要把多个候选放进同一个 trace binary：`-one-insn-per-tb` 会把所有调用混成一个执行流，无法安全归因。也不要把“把 oracle/random 生成改成 x86 SIMD”称为候选向量化；它只优化 harness 侧，候选仍在 QEMU 中逐次运行。

**预期收益 [实验]**：若 QEMU 启动/loader 占比显著，批处理可省约 5--20%；若 2 s 主要来自 20k 候选本体，收益接近零。验收要求每个候选的 mismatch 与独立 binary 完全相等，且一个候选崩溃不会掩盖同批其它候选。

## 建议的交付顺序和收益/风险表

| 阶段 | 交付物 | 预期收益 | 主要风险 | Go 条件 |
| --- | --- | --- | --- | --- |
| P0 | coordinator、worker、per-task result、原子 merge、content cache | 并发 5--8×；可恢复 | CPU/磁盘争用；结果竞态 | W=1 与旧串行结果逐字段一致 |
| P1a | rewrite precondition/topological planner | 2--10× 候选减少（推断） | 错剪掉有效序列 | 旧全集 source hash 100% 覆盖或有审计例外 |
| P1b | 2k→20k differential | 候选淘汰比例决定，可能 1.5--5× | legacy 稀有错误漏检 | full-pass 零 false negative |
| P2 | static/MCA beam | 可能再省 20--60% | MCA 排序与实机/动态排序偏离 | 历史 best 召回 100%，否则仅 soft rank |
| P3 | streaming trace/counts | 减少 IO/RSS，收益随并发增加 | parser 口径漂移 | 与旧 parser counts 完全一致 |
| P4 | 批量/插件实验 | 未知 | trace 语义、隔离性复杂 | 仅在独立实验模式启用 |

## 建议的最终命令形状

建议提供一个统一入口（名字可另定），语义类似：

```text
search --kernel dct32 --mode exhaustive \
  --workers 8 --trace-workers 4 --verify-cases 2000 \
  --full-cases 20000 --cache <outdir>/cache \
  --mca top:10 --stable-output
```

`--mode exhaustive` 必须忽略 beam 硬剪枝；`--mode explore` 必须在结果中写明被剪掉的规则、阈值和未测候选数。任何模式都应打印阶段计时和 `planned/claimed/cache-hit/permanent-fail/retryable-fail/measured` 计数，才能定位下一轮瓶颈。
