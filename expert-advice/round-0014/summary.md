# round-0014：搜索/验证吞吐优化结论

## 结论先行

最优先落地的是“按源码哈希划分的独立任务 + 有界进程池 + 协调者合并结果 + 可恢复的分阶段缓存”。候选之间没有数据依赖，编译、QEMU 差分和 trace 都可以并行；真正需要串行的是任务规划、同一哈希的去重/claim，以及最终排序。按已知的单候选耗时，8 个有效 worker 的理想墙钟收益约为 5--8 倍；是否能稳定达到目标，取决于本地 CPU 核数和 trace 文件 IO，需要做一次并发扫描。

第二优先级是把“任意 4 个槽位的暴力序列”改成带前置条件的规范化 rewrite DAG。当前 `k0_even_sve` 明确依赖 legacy k2/k4 前置，重复应用 `merge_narrow8` 等操作又经常是 no-op 或 build fail。先在一次串行审计中证明等价类，再只测规范代表，预计能把需要真实测量的源数量从几十/数百降到几十以内。这个收益在语义证明通过后是确定的。

MCA 预筛、2k→20k 两级差分、批量验证和流式 trace 解析应作为第三优先级的可插拔漏斗：它们可能再省 20--60%，但不能未经校准就硬淘汰候选。MCA 与实机周期在 `docs/20` 中已有偏离，短差分也可能漏掉 legacy 的稀有分歧；探索模式可以激进，最终 exhaustive 模式必须保留全量正确性和动态计数。

## 证据、推断与待验证事项

本文使用以下标记：

- **[事实]**：来自 `context.md`、当前脚本或脱敏聚合文档，可直接复核。
- **[推断]**：由这些事实计算出的工程判断，不等于已测得收益。
- **[实验]**：必须在本地 x86/QEMU 上跑 A/B 才能接受的建议。

### [事实] 当前管线和缓存行为

`search_rewrite_sequences.py` 的固定深度写法是 `product(rewrites, repeat=4)`，去掉 `none` 后会形成“长度 0--4 的有序序列”。上下文中的 DCT32 `5^4=625` 是四步都为非 `none` 的 headline；当前脚本还会枚举含 `none` 的位置，故 raw product 是 `6^4=1296`，折叠后的序列键为 `1+5+25+125+625=781`（结果快照也记录 781）。DCT16 的 headline `4^4=256` 包含 `none`，非 `none` 的四步组合是 `3^4=81`，折叠后的键数为 `1+3+9+27+81=121`。上下文中的 625/256 应与实现的 up-to-four 口径分开报告。

脚本在生成阶段已有源码哈希去重（当前结果快照还记录了大量别名），但 rewrite 缓存主要按 `seq` 保存成功且有 `fused_uop` 的行；build/link/trace 失败没有稳定的负缓存，也没有工具链、manifest、验证 corpus、QEMU 参数和计数器版本指纹。布局搜索的 `verify_cache.json` 已按 contract+source hash 缓存成功/验证失败，但主循环和 JSON 写入仍是单进程串行。

每个候选会产生独立的 `.cpp`、`.o`、verify 可执行文件、trace driver、trace log 和 JSON。trace 使用 `qemu-aarch64 -one-insn-per-tb -d exec,in_asm`，随后解析器先建立地址反汇编表、再扫描执行记录，并把完整指令列表写成 JSON；这是可并行但会放大磁盘带宽和 inode 压力的阶段。

### [事实] 时间拆解（本地 x86）

| 阶段 | 已知单候选量级 | 端到端判断 | 可采取的动作 |
| --- | ---: | --- | --- |
| 交叉编译 | 约 0.2--1 s | 中等；失败候选仍会付出这笔成本 | 进程池并行；按完整 source/toolchain hash 复用对象 |
| verify 链接、driver 链接、`nm`/生成文件 | 上下文未单独测量 | 是编译后的固定残差；不能假设为零 | 同一对象分阶段缓存；一次性记录 stage timer；可实验合并 harness |
| 20k QEMU 差分 | 约 2 s | **最大单项**，通常占成功候选的约一半以上 | 并行；先做 reject-only 短差分；复用同一 verify binary |
| true-dynamic trace + parse | 约 1 s | 第二大项；QEMU、`-one-insn-per-tb` 和 log/JSON IO 合计 | 限制 trace 并发；独立目录；流式计数；只保留重点原始 log |
| LLVM-MCA | 约 0.5 s | 当前只跑 top-10，非主耗时；若全量运行会变成约 5 分钟级成本 | 编译后并行；先作次级排序/校准，不直接替代动态计数 |
| 串行循环/进程启动 | 每阶段都重复一次 | 不是单项最大头，但造成 CPU 空转和墙钟线性累加 | coordinator + worker queue；避免每个 worker 直接写共享 JSON |

按“成功候选、未计 MCA、暂不计未测链接/IO”估算，单候选 3.2--4.0 s 时，20k QEMU 约占 **50--63%**，trace+parse 约 **25--31%**，交叉编译约 **5--31%**（编译的 0.2--1 s 区间造成宽范围）。因此首先并行 QEMU/trace 最划算；文件 IO、链接和 Python 调度的精确比例目前没有基准，不应伪造百分比，应该由 stage timer 补齐。

据此，625 个四步非 `none` 候选的串行成本为约 `625 × (3--4 s + 未测链接/IO)`，与上下文的 30--60 分钟一致；当前实现实际还可能处理 781 个键（DCT16 为 256 raw slots/121 键），去重不足时还会更高。DCT32/DCT16 布局搜索的 3--4 分钟主要同样来自 QEMU 差分和 trace，而不是 Python 枚举本身。

### [推断] 最大收益排序

1. **任务级并行（确定性最高）**：成功候选的 QEMU 阶段可独立运行，8 个有效 worker 足以把 30--60 分钟压到约 4--8 分钟的理论区间；IO/CPU 争用决定实测值。
2. **规范化/依赖剪枝（确定性高，但需证明）**：源码别名和 no-op 重复序列说明当前搜索在重复测同一个 body。将可交换 rewrite 归一化、对重复/缺父节点的序列直接判无效，可显著减少编译和 QEMU 次数。
3. **分层漏斗与验证批处理/trace IO 优化（收益依赖候选淘汰率）**：静态合法性、objdump/MCA、2k 差分只应作为早期 reject 或排序；可实验地让一个 verify 进程复用同一 corpus/reference、顺序调用多个候选以摊薄 QEMU 启动，但 trace 仍按候选独立运行；全量验收仍需 20k、trace 和 TestBenchLite。把 oracle/随机数做 host-side SIMD 只能减少 harness 开销，不能替代候选本身的 QEMU 执行，收益需实测。

## 推荐的并行执行模型

采用 `concurrent.futures.ProcessPoolExecutor`（或等价的固定进程池），而不是多个 worker 争写一个 `results.json`：

1. coordinator 在主进程完成 manifest/IR 读取、规范化序列生成、源码哈希去重和 cache snapshot；为每个任务分配稳定的 `task_index`、完整 `source_sha256` 和 canonical key。
2. worker 只处理一个 source hash，目录为 `out/work/<full-hash>/`；所有中间文件使用临时名写入后 `os.replace`。同一 hash 只允许一个 claim，其他 alias 在 coordinator 侧映射到同一结果。
3. worker 的阶段顺序为 `emit -> compile -> link verify -> short/full verify -> link trace driver -> trace/parse -> optional MCA`。每一阶段返回状态、return code、耗时、stdout/stderr 摘要和 artifact hash；失败也要落盘。
4. QEMU 使用现有固定参数、独立 `-D` 日志和显式 `QEMU_LD_PREFIX`；verify 并发度先扫 `1,2,4,8,12`，trace 用较小 semaphore（例如 `min(4, W)`）避免多份 `-one-insn-per-tb` 日志打满磁盘。不要把远程 ARM 机器放入搜索 worker。
5. coordinator 以 canonical key/原始枚举序号排序后合并，主指标相同再按 source hash、MCA cycles、MCA uops 做稳定 tie-break；并行完成顺序不得影响 `best`、别名映射或 JSON 行顺序。

缓存键至少包括：kernel、canonical rewrite/layout key、完整源码 hash、manifest/contract hash、corpus cases/seed/value range、编译命令和 compiler version、QEMU 参数/loader、trace parser 与 metric-schema version、MCA CPU/version。成功、确定性失败（compile/link/语义验证）和可重试失败（timeout/IO/parser）分开存储；后者只能有限重试，不能永久负缓存。

## 口径提醒：gather/scatter

本轮用户要求“不把 gather/scatter 纳入优化目标”，而 `docs/18`/`docs/20` 的历史口径曾使用 `fused_uop = fused_adj + 3×scatter`。建议所有新结果同时输出：

`score_primary = fused_adj - scatter_gather_count`（明确排除 SG）、`scatter_gather_count`、`legacy_fused_uop_sg4 = score_primary + 4 * scatter_gather_count`（仅兼容诊断，等价于历史 `fused_adj + 3×SG`）。不要用两种口径混排 best；若项目另有“禁止 SG”的硬门，应作为单独 constraint，而不是偷偷改变 score。建议把 `(score_primary, scatter_gather_count)` 作为 Pareto/次级报告，避免把“SG 免费”误解成 SG 鼓励。这样才能解释 DCT16 的 705（含 4 scatter）与零 scatter 895，而不破坏历史可复现性。

## 验收目标

- **硬目标 [实验]**：DCT32 四步非 `none` 的 625 个 headline 候选，在 clean cache、固定本地环境、8 个有效 worker 下墙钟 `<=5 min`；DCT16 raw fixed-slot 的 256 个候选 `<=3 min`。同时报告当前实现实际 up-to-four 的 781/121 键耗时，避免数字口径混淆。
- **伸缩目标 [实验]**：8 worker 相对串行 speedup `>=5×`，trace 阶段不出现超过 10% 的重复/丢失；并发扫描中记录 CPU、RSS、写入字节和 QEMU 失败率。
- **可恢复目标 [事实可验]**：中途 kill 后重启只执行未完成或可重试任务；warm-cache 重跑 `<=10 s`（不含显式重新验证）。
- **排序不变 [硬门]**：新旧串行 exhaustive 的 canonical source 集、每个 source 的 verify 状态/动态计数、primary best 和 Pareto 前沿完全一致；别名只改变展示，不改变测量。
- **正确性 [硬门]**：所有最终保留候选仍过 20k full differential；legacy 候选按既有 mismatch 签名再过 x265 TestBenchLite，最终候选再做更大 corpus/完整 TestBench。

并行墙钟收益、source/失败缓存、已证明的依赖剪枝是确定性收益；QEMU 多实例线性度、MCA 预筛召回率、2k 短差分淘汰率、批量 harness 和流式 parser 的百分比收益都必须标成“待实验”。
