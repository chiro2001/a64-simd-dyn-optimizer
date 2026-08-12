# M0 Foundation Iteration

- run-id: `m0-foundation`
- state: `foundation-only`
- date: 2026-08-12 (Asia/Shanghai)
- host: `n1-neon128` (Oracle Cloud, 2 vCPU Neoverse-N1, no SVE/I8MM)

## 1. 本轮试图证伪什么

M0 不验证性能假设，而是证伪“当前环境无法可复现地重建 x265 NEON 基线”。
具体可证伪项：从干净 checkout 能否一条命令重建 8-bit Release+Tests 的
`TestBench`，并给出稳定的 SA8D baseline 与可复用的 microbench 信号。

## 2. 什么变了，什么刻意没变

变：

- 远端项目仓库初始化并提交；x265 以 submodule 固定到
  `b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`。
- 安装并记录工具链：CMake 3.28.3、Ninja 1.11.1、GCC 13.3.0、
  Clang/LLVM 18.1.3、QEMU user 8.2.2、Z3 4.8.12、Python 3.12.3、
  perf 6.17.13、ripgrep 14.1.0。
- 新增幂等入口：`scripts/bootstrap.sh`、`doctor.sh`、`build-x265.sh`、
  `run-testbench.sh`、`capture-env.sh`、`build-sa8d-microbench.sh`、
  `run-sa8d-baseline.sh`、`run-pmu-sa8d.sh`。
- 构建 `build/x265-8-gcc`：8-bit Release、`ENABLE_TESTS=ON`、
  NEON+DotProd 开启、I8MM/SVE/SVE2 显式关闭；捕获 configure/build log、
  compile_commands、二进制 SHA-256。
- 建立独立 SA8D microbench（同一 binary 暴露 C reference、上游 NEON、
  empty harness）与噪声门控的 5 进程 baseline 协议。

刻意没变：

- 未修改 x265 任何源文件；没有注入候选。
- 没有发起顶级模型 expert advice（协议要求只在实际优化迭代后触发）。
- workload 权重仍是占位符，未用候选结果事后调整。

## 3. 正确性证据

- `TestBench --cpuid NEON --testbench pixel --nobench`：exit 0。
- `TestBench --cpuid NEON --nobench`（全部 harness）：exit 0。
- SA8D 差分验证：`sa8d_microbench --verify-only` 对 8x8/16x16/32x32/64x64
  各 20000 个固定 seed 随机 case，C reference 与 NEON dispatch 完全一致。
- 原始日志：
  `experiments/m0-foundation/testbench/pixel-NEON-nobench.log`、
  `full-NEON-nobench.log`。

## 4. 相对哪个精确 baseline，性能如何且不确定性多大

Baseline 定义：同 commit、同 binary、同机器、同 ISA 档位下 x265 dispatch
得到的最佳实现（NEON）。主指标为 8-bit SA8D latency（ns/call，
`median(batch_ns - empty_ns) / 4096`，batch=4096）。

采集条件：taskset CPU0、每 cell 5 个独立进程 × 30 samples、进程级
CV 门限 ≤10%、至少 3 个有效进程；NEON latency 有效进程 3–5 个，
cell CV 2.0%–5.4%。

| shape | C ns/call | NEON ns/call | NEON→C 加速 | NEON latency cell CV |
| --- | ---: | ---: | ---: | ---: |
| 8x8 | 78.2 | 26.3 | 2.97× | 5.4% |
| 16x16 | 307.1 | 90.3 | 3.40× | 2.0% |
| 32x32 | 1234.3 | 304.9 | 4.05× | 3.8% |
| 64x64 | 4725.6 | 1033.2 | 4.57× | 2.2% |

PMU 净计数（扣除 empty harness，500 samples × 4096 calls，CPU0）：

| shape | cycles/call | instructions/call |
| --- | ---: | ---: |
| 8x8 | 80.4 | 115.9 |
| 16x16 | 275.0 | 487.8 |

静态 disassembly 分类（目标 symbol，见 `disassembly/`）：

- `sa8d8_neon<8,8>`：117 条指令（16 ldr、8 usubl、36 add、16 sub、
  8 trn1、8 trn2、4 zip1、4 zip2、4 sabd、4 abs、4 umax、1 uaddlv、
  1 fmov、1 lsr、1 ret）。
- `pixel_sa8d_16x16_neon`：482 条指令（69 ldr、32 usubl、138 add、
  64 sub、32 trn1、32 trn2、16 zip1、16 zip2、16 sabd、16 abs、
  16 umax、6 uadalp、2 uaddlp、1 addv 等）。

30% 聚合定义（预注册，权重待调用统计替换）：`workloads/sa8d.yaml`，
`weighted_geometric_mean_speedup >= 1.30`，CI 下界 >1.00，
非目标 shape 回退 ≤3%。

## 5. 下一轮最有信息量的一个实验

M1：冻结 SA8D canonical SpecIR 与 C oracle（含 guard-page、固定 corpus、
range proof），并为现有 NEON 种子建立 importer/roundtrip；在这之前不要
进入搜索。若时间有限，先只做 8x8 8-bit 的最小 SpecIR + 差分解释器闭环。

## 决策记录

- x265 管理方式：submodule（已通过 `git submodule update --init` 注册），
  固定 commit 如上。
- SVE 目标：`sve2-vl256`；当前无实机，M6 只能功能验证，性能状态
  `blocked-environment`，不跨机计算 speedup。
- 主指标：latency ns/call（与 x265 调用形态更接近，M0 起默认 latency；
  throughput 保留为次要指标，禁止只报有利项）。
- 噪声协议版本 2 已写入 `workloads/sa8d.yaml`；后续候选必须走同一门控。

## 产物索引

- `manifest.yaml`、`commands.txt`、`environment.txt/json`
- `testbench/`、`benchmark/`（含 raw CSV、summary、gate、PMU、binary hash）
- `disassembly/`（NEON 8x8/16x16 目标反汇编）
- `expert-link.txt`：`none`（M0 foundation-only，不触发 expert advice）
