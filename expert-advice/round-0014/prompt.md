# 顶级模型分析请求（round-0014，GPT-5.6-sol max）：搜索效率优化

你是本项目的顶级模型分析顾问。请先阅读
`expert-advice/round-0014/context.md`，然后在本仓库
`/home/chiro/projects/a64-simd-dyn-optimizer` 内分析并产出建议。

## 沙箱与输出约束

- 可写会话（用户裁定 2026-08-13）：只允许写
  `expert-advice/round-0014/` 下的 `summary.md`、`tooling-roadmap.md`、
  `verification.md`；严禁改动源码、manifest、实验产物或其它文件。
- 严禁读取 `/tmp` 或仓库外文件；内部 DCT16/DCT32 参考只允许引用
  docs/18、docs/20 已脱敏聚合指标。

## 背景摘要（截至 2026-08-13 深夜）

当前工具链（kernel → op DAG → 布局搜索 / 原子 rewrite 序列搜索 →
QEMU 差分验证 → true-dynamic 计数 → LLVM-MCA）已能自动发现：

- DCT16：布局搜索 best 705 fused_uop（legacy+even_sve，含 4×scatter）、
  零 scatter 895；rewrite 序列搜索从 965 base 自动重发现
  `[tbl2_to_zip, legacy_even_sve, merge_narrow8]` → 705；
- DCT32：布局搜索 best 5814（row8+legacy+zip+k0_even_sve，MCA
  411 cyc / 2231 uops）；rewrite 序列搜索（625 序列，含新增
  k0_even_sve 原子 rewrite）正在后台跑，预期可自动重发现
  ~5814/6562（row8/row4）。

**核心痛点（本次咨询主题）**：搜索/验证吞吐太慢。

- `tools/search_rewrite_sequences.py`：DCT32 5^4=625 序列，每个唯一源
  都要 编译 → 20k QEMU 差分（约 2s）→ trace（约 1s），串行估计
  30-60 分钟；DCT16 4^4=256 序列同理；
- `tools/search_sve2_layouts.py`：DCT32 op 布局 96 组合（约 4 分钟），
  DCT16 357 组合（源码哈希去重后约 70 唯一源，约 3 分钟）；
- 每个候选：`aarch64-linux-gnu-g++` 交叉编译（约 0.2-1s，`-O2
  -fno-tree-pre`）、`qemu-aarch64` 20k 差分（约 2s）、`-one-insn-per-tb`
  trace（约 1s）、`llvm-mca` 第二代理（约 0.5s）；
- 搜索策略目前是暴力枚举 + 源码哈希去重 + results.json 缓存
  （按 seq key / 源码 hash），无并行、无基于成本的剪枝、无
  MCA 预筛漏斗（MCA 只对 top-10 跑）、无向量化验证。

本地 x86（主工作机）：交叉 g++ 16.1.0 + qemu-aarch64 11.0.3 +
`QEMU_LD_PREFIX=/usr/aarch64-linux-gnu`；有 LLVM-MCA。远程鲲鹏
920B（SVE1/VL=256）可同步跑 paired 实机验证，但不宜做大规模搜索。
用户要求：优先本地 x86 算力；gather/scatter 不计入优化目标；
golden 标准是 x265 TestBenchLite；搜索空间超过 60s 才考虑算法优化
（当前已远超）。

## 请输出

1. **搜索/验证管线吞吐瓶颈归因**：按端到端时间拆解（编译 / 20k
   差分 / trace / MCA / 文件 IO / 串行循环），哪些是最大头，哪些
   可以并行/复用/剪枝；
2. **并行化方案**：给出具体可落地的并行执行设计（例如
   `concurrent.futures`/`xargs -P`/进程池），每个 worker 的隔离、
   缓存一致性、QEMU 多实例开销、结果合并与可复现性；
3. **算法级加速**：在“暴力枚举 + 哈希去重”基础上，按信息增益排序
   建议 1-3 个加速手段，例如：MCA/静态计数预筛漏斗、失败缓存
   （build/verify 失败不再重试）、增量搜索（只跑新增序列）、
   按 rewrite 依赖拓扑剪枝（如 k0_even_sve 需要 legacy_k2/k4 前置）、
   缩短差分规模作为预筛（2k → 20k 两级）、trace 与 verify 合并；
4. **明确的验收指标**：给出可测量的目标（例如 625 序列从 ~40 分钟
   压到 <5 分钟），并指出哪些收益是确定性的、哪些需要实验验证；
5. 明确区分“由已有文件支持的事实”“推断”“需要实验验证的建议”；
   不直接修改仓库，只把最终建议写入回复。

## 建议输出文件

在 `expert-advice/round-0014/` 下写 `summary.md`（主结论与优先
排序）、`tooling-roadmap.md`（分步实现路线，含每步预期收益与风险）、
`verification.md`（如何验证加速不改变正确性/排序结果）。
