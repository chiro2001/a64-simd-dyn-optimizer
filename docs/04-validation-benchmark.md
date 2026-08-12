# 正确性与性能评测规范

任何候选都必须先通过正确性门禁，再进入性能比较。性能数字必须能追溯到相同 binary、相同输入语料、相同机器状态和原始计数。本文中的 MUST/必须是接受候选的硬条件。

## 1. 验证金字塔

```text
                 x265 end-to-end encode / regression
              x265 TestBench + ABI/dispatch/VL checks
           native or QEMU differential + memory safety
       MachineIR/生成代码 translation validation
    SpecIR schema/range + rewrite rule proofs + interpreter
```

低层失败时不运行高层 benchmark。高层通过不能掩盖低层未证明的语义缺口。

## 2. 正确性门禁

### V0：输入、工具和产物身份

验证前记录：

- x265/optimizer commit 与 dirty status；
- candidate id、SpecIR/PackIR/MachineIR hash；
- compiler/linker 版本与完整 flags；
- target CPU、ISA features、SVE VL、bit depth；
- 生成源、object 和最终 binary SHA-256；
- corpus id、PRNG algorithm 与 seeds。

未记录身份的结果只能用于本地调试，不能用于候选接受或性能目标报告。

### V1：静态 IR verifier

必须检查：

- 所有值已定义且类型/位宽匹配；
- wrap、saturate、round、extend/narrow 语义完整；
- 所有 active lane 有 provenance；
- inactive lane 不会流入可观察 store/reduction，除非语义已定义；
- 每个 load/store 落在 contract footprint，或有经审计的 padding precondition；
- alias 假设没有比 contract 更强；
- opcode、immediate、predicate 和 feature 对 target 合法；
- fixed VL 与 VLA 合同没有混用；
- reduction/rounding boundary 与规格一致。

### V2：规则与 translation validation

- 每条通用 rewrite 在引入时用 bit-vector SMT 证明其适用条件；证明状态随 rule id 归档。
- 每个候选对 SpecIR 做 whole-region translation validation。
- solver 超时不是成功。可以拆分 region、加强已证明 range lemma 或降级为“测试覆盖但未形式化证明”，但后者在进入默认 x265 路径前需要人工审计签字。
- 所有 solver counterexample 自动最小化并保存成 regression vector。

### V3：解释器和生成代码差分

比较四个层次（存在时）：

```text
x265 C oracle == canonical SpecIR interpreter
               == imported seed MachineIR interpreter
               == projected PackIR semantic/layout checks
               == generated candidate execution
```

测试集合分为：

1. 固定边界 corpus；
2. 每个候选固定 seed 的大量随机 corpus；
3. fuzz campaign；
4. 历史 counterexample corpus；
5. 真实编码采样输入（去敏后可复现）。

随机 case 数不是正确性的证明，但作为工程门禁，SA8D 8x8 MVP 建议至少 `10^6` 个快速 case；较昂贵 kernel 可按运行时间预注册数量。每轮不能因为失败概率低而减少历史 corpus。

### V4：内存与未定义行为

至少覆盖：

- ASan + UBSan；
- guard page 位于每个合法 footprint 后，检测 over-read/over-write；
- 合同允许的未对齐地址；
- 最小、典型和极端合法 stride；
- 输入 region alias 的合法组合；
- output/scratch canary；
- 对生成 assembly 的 stack alignment、callee-saved SIMD/GPR、返回值高位与 unwind/section 检查。

若为了性能接受 over-read，必须把最小 padding 写入 contract，证明所有 x265 调用点满足，并继续保留 guard 测试验证“刚好 padding”边界。

### V5：x265 primitive harness

候选注入后运行对应 harness：

| Kernel | TestBench |
| --- | --- |
| SA8D | `--testbench pixel` |
| DCT/IDCT | `--testbench transforms` |
| interp8_hpp | `--testbench interp` |

先运行 `--nobench` correctness，再运行性能模式。分别覆盖 x265 支持且候选声明支持的 8/10/12-bit build。`--cpuid` 不能超过实机 feature；QEMU feature 测试必须记录 emulator CPU/VL 参数。

### V6：dispatch 与多版本验证

在同一构建中验证：

- feature 不足时不注册候选；
- SVE VL 不匹配时固定 VL 候选不注册；
- 强制关闭 dynopt 后函数指针恢复上游；
- 每个 bit depth/shape 指向正确 symbol；
- 多线程创建/线程池下 SVE VL 合同成立；
- 在不支持 ISA 的真实 N1 上，包含 SVE object 的 binary 可以安全启动且绝不执行非法指令。

### V7：编码器级回归

建立小而固定的 clip/配置矩阵，至少覆盖：

- 8-bit 与候选支持的高 bit depth；
- 常见 preset、帧内/帧间、不同 CU/PU 使用；
- deterministic 参数；
- baseline 与 candidate 的编码退出状态、解码 checksum、帧 checksum/bitstream hash；
- 如理论上应 bitstream-identical，则强制 hash 一致；若 x265 并行/启发式导致非确定性，改用单线程 deterministic 配置定位 kernel 正确性，不能只比较 PSNR。

## 3. Benchmark 的三个层次

### B1：独立 kernel microbench（主优化信号）

同一 executable 链接：空 harness、C、上游最佳 baseline、candidate。每次批量调用 kernel，批量长度要让总测量时间远高于计时开销，并防止编译器消除调用。输入从预注册 corpus 轮换，输出累积到 observable checksum。

测两种模式：

- **latency**：下一次调用依赖前次结果或只用单个工作集，观察关键路径和单调用成本；
- **throughput**：多组独立输入交错，模拟可并行调用。

项目主指标默认使用与 x265 实际调用更接近的 latency/throughput 之一，M0 通过 call-site/profile 数据决定。两者都保留，禁止只报告有利的一个。

### B2：x265 TestBench（兼容信号）

保留上游输出，便于与 x265 社区和历史实现对照。但 AArch64 TestBench 读取 `cntvct_el0`，其值应称为 TestBench ticks/score，除非已证明与 CPU cycles 的换算；正式 cycles 使用 PMU。

### B3：完整 x265 encode（最终影响）

在固定 clip corpus、参数、线程数下测 fps/elapsed time，并采样 kernel 调用次数或 profile 占比。用 Amdahl 定律检查结果是否合理：若目标 kernel 只占总时间的 5%，单 kernel 快 2× 不应宣称编码器快 2×。端到端性能是单独 KPI。

## 4. 公平 A/B 设计

### 4.1 同一 binary

首选同一 binary 内通过函数指针选择 baseline/candidate。若必须分 binary：

- 使用相同 compiler/linker/flags/LTO 设置；
- 随机化运行顺序；
- 检查目标 symbol 与相邻 layout；
- 记录 binary hash；
- 用同一轮环境同时测量，不拿历史数字当当前分母。

### 4.2 CPU 和系统状态

- pin 到同一个在线 CPU；避开运行 SSH/系统任务的 core（如果资源允许）；
- 记录 governor、当前/可用频率接口、温度、steal time、内核 cmdline；
- 禁止候选与 baseline 使用不同 ISA feature 或 VL；
- 预热 instruction/data cache，再测热缓存；若冷缓存重要，作为单独预注册实验；
- 每轮先跑短 noise probe；噪声超过门限则丢弃整轮并记录原因，不选择性丢单个慢 sample；
- 云 VM 结果要通过多时段重复，SVE 正式目标也需记录宿主稳定性。

### 4.3 交替与样本

推荐一个 sample 内采用随机化 pair：

```text
warmup -> empty -> baseline -> candidate
warmup -> empty -> candidate -> baseline
```

重复至少 30 个有效 pair，跨至少 3 个独立进程；非常低延迟的 kernel 在每个计时窗中批量调用。保存每个原始 sample，不只保存平均值。

### 4.4 统计报告

必须给出：

- baseline/candidate median、p05、p95、MAD；
- paired ratio 的 median 或 geometric mean；
- bootstrap 95% CI；
- 样本数、批量调用数、丢弃整轮的次数与预注册原因；
- 效果大小而不只 p-value。

候选接受的默认阈值：

- 主 shape：CI 下界 > 1.00，median speedup 至少 1.03；
- 非目标但同 family shape：任一预注册关键 shape 不得回退超过 3%；
- 按三档目标验收：预注册聚合 speedup 至少达到对应档位阈值（同算力
  NEON→NEON 为 1.30；跨 ISA NEON/SVE128→SVE256 及 SVE256→SVE256 为
  2.30）；920B 中间验收保留门槛为提升 >10%（NEON→SVE 4×256 为 >110%）；
- 门限可在 M0 根据噪声调整，但必须在看到候选结果前修改规范。

## 5. 指令计数规范

“使用的 SIMD 指令数”至少拆成两个指标。

### 5.1 静态计数

对最终 linked binary 中目标 symbol 反汇编，按 opcode/operand 分类：

```yaml
static:
  total_instructions: N
  simd_compute: N
  simd_permute: N
  vector_load_store: N
  scalar_load_store: N
  scalar_address_control: N
  branch_return: N
  sve_predicate: N
  unknown: []
  code_bytes: N
```

分类器必须识别 alias mnemonic/canonical opcode；未知 opcode 不能静默算作 scalar。对循环同时报告 loop body、prologue/epilogue、unroll factor，不能把静态 body count 当一次 kernel 的执行指令数。

### 5.2 动态 retired instructions

用 PMU 对大批固定调用测 `instructions:u`，减去相同循环结构的空 harness，再除以调用数。同时测 cycles、branches、branch-misses，并在可用时测 L1D/cache/TLB。PMU multiplex 比例不足时减少 event group 或重跑。

动态 instructions 包含 scalar 地址/控制，是评价真实开销的必要补充。硬件无法区分 SIMD 类时，不凭空推算；把静态分类与动态总量并列展示。

### 5.3 spill 与 compiler drift

显式扫描 stack load/store 和异常 prologue 增长；对候选 expected opcode 建立非脆弱检查（必须/禁止 opcode 类和最大 spill），不要把完整汇编文本 hash 当唯一门禁。编译器升级后所有候选重新验证和 benchmark。

## 6. Workload 与性能目标聚合

每个 family 建立 `workload.yaml`，在优化前冻结：

```yaml
family: sa8d
metric: latency_ns
aggregation: weighted_geometric_mean_speedup
cases:
  - {bit_depth: 8, shape: 8x8, weight: 0.20}
  - {bit_depth: 8, shape: 16x16, weight: 0.35}
  - {bit_depth: 8, shape: 32x32, weight: 0.30}
  - {bit_depth: 8, shape: 64x64, weight: 0.15}
```

上例权重只是格式示例，不是最终数据。真实权重应来自固定 x265 clip corpus 的调用计数/耗时采样，并记录采集方法。10/12-bit、DCT size、interp width/coeffIdx 都用同样方法。若 workload 改变，建立新的 benchmark version，不覆盖旧结果。

## 7. 结果目录与判定

每次 benchmark run：

```text
experiments/<run-id>/
├── manifest.yaml
├── commands.txt
├── environment.txt
├── correctness/
├── disassembly/
├── perf/
│   ├── raw.csv
│   └── perf-stat.txt
├── testbench/
├── encode/
├── report.json
└── report.md
```

`report.json` 给机器读取，`report.md` 给人审阅。最终 decision 只能是：

- `accept`：所有门禁通过且达到预注册接受阈值；
- `retain-experimental`：正确但证据/性能不足，不注入默认路径；
- `reject-correctness`；
- `reject-performance`；
- `blocked-environment`：例如缺真实 SVE 机器。

不得用“看起来不错”作为第五种状态。
