# Agent 单轮迭代协议

本协议供后续执行 Agent 使用。目标是让每轮围绕一个可证伪假设闭环，留下足够证据供下一轮继续，而不是不断改代码直到看到一个好数字。

## 1. 一轮的输入

开始前读取：

- 当前 milestone 和退出条件；
- 上一轮 `iteration.md`、未解决 counterexample 与 benchmark 报告；
- 目标 contract、candidate/baseline manifest；
- 当前 `git status`，辨认用户已有修改；
- 最新一轮 `expert-advice/round-NNNN/response.md` 及其 `decision.md`；
- 目标主机 environment snapshot。

若 baseline、contract 或目标硬件身份发生变化，先建立新实验版本，不能把结果追加到旧序列。

## 2. 一轮只声明一个主假设

使用如下模板：

```yaml
iteration: 0017
milestone: M4
hypothesis: "把 SA8D 16x16 的四次局部 reduction 延后为一次，可减少依赖链和动态指令"
target: n1-neon128
baseline_candidate: <id>
affected_contracts: [sa8d_16x16_u8]
expected_signal:
  correctness: bit_exact
  performance: ">= 3% median latency improvement"
  static: "no spill; fewer horizontal reductions"
budget:
  wall_time: <declared>
  candidates: <declared>
rollback: "disable candidate id / revert isolated patch"
```

允许附带必要的基础修复，但不能在同一性能结论中混入多个无法区分贡献的布局、算法和编译器升级。需要多个变化时做消融候选。

## 3. 单轮状态机

```text
Observe -> Hypothesize -> Implement/Generate -> Verify -> Benchmark
   ^                                                   │
   └──────────── Diagnose/Counterexample <─────────────┘
                         │
                         v
             Archive -> Expert advice -> Decision
```

### Step A：观察和预注册

- 运行当前 baseline 的 correctness/noise probe；
- 阅读 disassembly、PMU、关键路径/寄存器报告；
- 写主假设、预期信号、预算和停止条件；
- 不在看到 candidate benchmark 后再改主指标或 corpus。

### Step B：最小实现

- 修改最小边界的 IR/rule/target/candidate；
- 新 opcode 先加语义和 test；
- 新 precondition 先改 contract 并审计调用点；
- 不覆盖用户无关改动；
- 自动生成内容必须能从命令重建。

### Step C：验证漏斗

严格按 [验证规范](04-validation-benchmark.md) 从低到高运行。第一个失败即停止 benchmark，保存并最小化 counterexample。禁止在 correctness 失败时继续看性能作为是否修复的依据。

### Step D：测量和解释

- 先快筛，再对 top candidate 做完整 paired benchmark；
- 对比预期 signal：静态 count、动态 instructions、cycles、latency、spill；
- 若预测与实测相反，写出最可能的依赖链/资源/缓存/编译器原因，并把误差作为 cost-model 数据；
- 同时报告所有预注册关键 shape，不只报告赢家。

### Step E：作出本轮结论

本轮状态只能是：

- `accepted`：满足全部门禁；
- `rejected-correctness`；
- `rejected-performance`；
- `inconclusive-noise`；
- `blocked-environment`；
- `foundation-only`：完成验证/工具基础，没有性能候选。

状态与证据写入 `experiments/<run-id>/iteration.md`。

## 4. 每轮最小产物

```text
experiments/<run-id>/
├── iteration.md             # 假设、动作、结论、下一步
├── manifest.yaml            # commits、target、candidate、commands
├── changes.patch            # 与本轮相关的可审计 diff（若适用）
├── correctness/             # 原始 logs/counterexamples
├── benchmark/               # raw samples + report
├── disassembly/             # baseline/candidate
└── expert-link.txt          # 对应 advice round 相对路径
```

`iteration.md` 必须回答五个问题：

1. 本轮试图证伪什么？
2. 什么变了，什么刻意没变？
3. 正确性证据是什么？
4. 相对哪个精确 baseline，性能如何且不确定性多大？
5. 下一轮最有信息量的一个实验是什么？

## 5. 顶级模型困难求助（批次触发与异步执行）

这是一个**独立归档、一次性的顾问步骤**，不阻塞主体流水线，也不授权模型
自行合入修改。触发频率（2026-08-13 用户修订）：**每完成三个实际优化迭代
（阶段）发起一次请求**，替代旧规则“每个实际优化 iteration 请求一次”。
初始项目规划、环境审计、M0 基线建设以及纯文档整理仍不触发专家审核。

- 每个 round 对应一批（3 个阶段）的上下文；`context.md` 列出本批涉及的
  run-id 与文件，不围绕回复继续 `resume`、追问或发起多轮审阅。
- 请求以只读模式（`-s read-only`）在**后台**执行；执行 Agent / 主模型
  不等待响应，继续前台工作（实现、验证、benchmark）。响应落盘后，在主
  流程的下一个自然检查点读取并写 `decision.md`。
- 历史 round-0001~0005 按旧频率（每迭代一次）执行，保持不可覆盖；本修订
  生效后的 round 继续递增编号。
- 顶级模型不可用、Codex 未安装或认证失败时，只记录 `blocked.md` 和错误，
  不得伪造 response，也不得因此阻塞、重跑或延长主体实验。

满足触发条件后，在仓库根目录创建递增目录：

```text
expert-advice/
├── README.md
├── round-0001/
│   ├── prompt.md
│   ├── context.md
│   ├── response.md
│   ├── session.jsonl        # 可选，便于审计过程
│   └── decision.md          # 执行 Agent 对建议的逐项处置
└── round-0002/
    └── ...
```

### 5.1 请求内容

`prompt.md` 应要求顶级模型充当 AArch64/编译器优化审阅者，至少提供：

- 对本轮结果和归因的反驳；
- 最可能遗漏的 correctness/ABI/VL 风险；
- 下一轮按信息增益排序的 1–3 个实验；
- 若连续无收益，是否应改变 IR/search/cost 方向或停止该 family；
- 明确区分“由已有文件支持的事实”“推断”“需要实验验证的建议”；
- 不直接修改仓库，只把最终建议写入回复。

`context.md` 列出供模型读取的文件和本轮摘要。不要把整个 `experiments/` 无选择塞入 prompt；给 baseline/candidate manifest、iteration、关键 disassembly/PMU/反例和相关 docs 的精确路径。

### 5.2 命令形状

用户指定使用 `sss` profile，并通过 `-c` 选择顶级模型。推荐从仓库根目录使用一次非交互 `exec`，让本轮唯一回复直接落盘：

```sh
codex -p sss \
  -c 'model="gpt-5.6-sol"' \
  -c 'model_reasoning_effort="max"' \
  -s workspace-write \
  -C "$PWD" \
  exec -o expert-advice/round-0001/response.md - < expert-advice/round-0001/prompt.md
```

如果本机 CLI/profile 的实际配置键不同，先运行 `codex --help` 或 `codex exec --help` 核对，并把最终命令保存在 `context.md`。也可用 `-m gpt-5.6-sol` 代替 model 的 `-c`，但保留用户要求的 `-p sss`。不要在脚本中依赖交互式模型选择器。

若需要完整过程记录，可增加 `--json` 并把 stdout 保存为 `session.jsonl`；最终自然语言仍用 `-o response.md`。顶级模型当前不可用、Codex 未安装或认证失败时，只记录 `blocked.md` 和错误，不得伪造 response，也不得因此阻塞、重跑或延长主体实验。

**沙箱口径（用户裁定 2026-08-13）**：咨询模型**不用只读模式**，使用
`-s workspace-write`，但 prompt 明确限制它只写 `expert-advice/round-NNNN/`
下的输出文档（`summary.md`/`tooling-roadmap.md`/`verification.md` 等），
不得改动源码、manifest、实验产物或构建目录。round-0010 曾因 read-only
被拒写导致三份文档无法落盘（只能由主进程从最终答复补录）；此后一律用
可写沙箱 + 目录约束。不要把 `--yolo`/绕过审批作为协议要求。OpenAI 官方
CLI 参考也建议避免在非专用 sandbox VM 中绕过 sandbox。相关官方资料：

- <https://developers.openai.com/codex/cli/reference>
- <https://developers.openai.com/codex/models>

### 5.3 建议处置

执行 Agent 阅读 `response.md` 后写 `decision.md`：

```markdown
# Round 0001 decision

| 建议 | 处置 | 证据/理由 | 对应下一轮 |
| --- | --- | --- | --- |
| ... | accept / reject / defer | ... | iteration 0018 |
```

顶级模型建议不是证明，也不自动改变 roadmap。接受的建议必须变成下一轮可证伪假设；拒绝或延期同样给出技术理由。每个 round 目录对应一批（3 个实际优化迭代）的上下文，永不覆盖旧 `response.md`；`decision.md` 是本地处置记录，不是第二轮模型审核。

## 6. 面向不同失败的下一步

| 观察 | 下一步优先级 |
| --- | --- |
| bit-exact 失败 | 最小化反例 -> 检查 rounding/width/provenance -> 新增 regression；禁止 benchmark |
| guard-page 失败 | 查 footprint/precondition；默认撤销 over-read，不扩大合同掩盖问题 |
| compiler 产生 spill | 降低 live range/packing 并发，或进入 assembly 决策门 |
| 静态更少、动态/周期更差 | 查关键路径、端口、load、分支、频率；校准 cost，不以 count 接受 |
| 预测 top-k 与实测无关 | 增加实机筛选、重新测 target costs、降低未知 opcode 权重 |
| NEON 有收益、SVE 无收益 | 检查 VL 填充、predicate/reduction、跨 tile packing；不要机械扩宽 |
| 连续三轮无可测收益 | 执行 D6 和停止条件复盘，请顶级模型反驳方向，必要时转下一个 hotspot |
| x265 microbench 快、encode 不变 | profile 调用占比/Amdahl、cache/code size、dispatch overhead；不夸大结论 |

## 7. Agent 交接模板

每次 Agent 结束工作时，在最终说明中简洁列出：

- 已完成 milestone/iteration 与状态；
- 改动文件和 candidate id；
- 实际运行的最高正确性门禁；
- baseline/candidate 的关键数字和原始报告路径；
- 未运行的测试及原因（尤其 SVE 实机）；
- 下一项唯一推荐任务；
- 专家建议 round 路径及其采纳状态。

不能只说“tests pass”或“性能提升约 30%/130%”；必须给出测试对象、baseline 和证据路径。
