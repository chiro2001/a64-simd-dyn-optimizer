# M11-SVE-920B：SVE256 实机闭环（功能 / 门禁 / paired PMU）

- run-id: `m11-sve-920b`
- state: `closed-negative`（功能门禁全过；paired cycles 两形状均未达 1.10
  保留门槛，按协议全量记录为负结果）
- date: 2026-08-13（Asia/Shanghai）
- host: 鲲鹏 920B 云实例（`chiro@124.70.206.229`）

## 1. 本轮试图证伪什么

P2'：四个 SVE 候选（single/x2/x2raw/16x16）在真实 SVE1、VL=256 硬件上：

1. 用 `-march=armv8-a+sve` 重建后不含任何 SVE2+ 指令（官方 ARM ISA
   catalog + TBL2 双寄存器表操作数规则的静态门禁）；
2. native differential 与 QEMU 一致（`svcntb()==32`，即 VL=256bit）；
3. `PR_SVE_SET_VL` 主动降到 VL=128 时，打包候选注册数=0、调用数=0
   （真实 dispatch 拒绝，而非直接调用 mismatch）；
4. ASan/UBSan 无泄漏/无未定义行为；
5. 8x8 single 与 16x16 wrapper 对同机上游 NEON 的 paired cycles 保留门槛
   （speedup 中心估计与 bootstrap 95% CI 下界均 >1.10）。

## 2. 环境快照（实例存活期内有效）

- openEuler 24.03 LTS-SP2、内核 6.6、2 vCPU（1 socket、无 SMT）；
- ISA features：`sve`（SVE1）、`svei8mm/svef32mm/svef64mm/svebf16`、
  `i8mm/bf16`，**无 `sve2`**；
- `/proc/sys/abi/sve_default_vector_length=32`（32 字节 = **256 bit**，
  `svcntb()==32`）；
- `perf_event_paranoid=2`（cycles:u/instructions:u 用户态可用）；
- 工具链：GCC 12.3.1、CMake 3.27、Ninja 1.11、perf 6.6、
  libasan/libubsan 12.3.1、rsync 3.2.7（本轮新装，见
  `scripts/bootstrap-openEuler.sh`）。

**PMU 不可用（实测确认）**：客户机 `/sys/bus/event_source/devices/` 只有
software/breakpoint/kprobe/tracepoint/uprobe，没有硬件 PMU；root 下
`perf stat -e cycles,instructions` 同样 `<not supported>`。这是 KVM 未开
PMU 直通，与权限无关。本轮 paired cycles 回退为微基准自带 `CNTVCT_EL0`
ticks（`metric_source=cntvct`），仍是实机时钟口径；N+2 实机如有 PMU 再用
cycles:u/instructions:u。

## 3. 上游 SVE 基线结论（2026-08-13 已核实）

pinned x265 `b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`：

- `common/` 下**不存在** `pixel-prim-sve*.cpp`；
- SVE 只出现在 CMake 选项骨架与 `common/cpu.cpp` 特征串；
- 因此 920B 上不存在上游 SA8D SVE1 实现，paired 对比基线 =
  同机上游 NEON dispatch（`build/x265-8-gcc` 按 `scripts/build-x265.sh`
  以 `ENABLE_SVE=OFF/ENABLE_SVE2=OFF` 构建，NEON+DotProd 基线）。

## 4. 门禁与结果（回填）

| 门禁 | 命令 | 结果 | 证据 |
| --- | --- | --- | --- |
| SVE1 静态门禁 | `tools/check_isa_level.py --level sve1`（官方 catalog + TBL2 双寄存器表规则） | 4/4 PASS（117/125/116/25 条） | `static/isa-gate-920b.txt` |
| native differential | `build/sve_verify 1000000`（VL=256，svcntb=32） | 4 候选 1M×4 全 0 mismatch | `correctness/native-diff-1m.log` |
| VL=128 拒绝 | `build/sve_verify --vl-bytes=16 200`（PR_SVE_SET_VL） | registered=0/calls=0，`rejection_audit=pass` | `correctness/native-reject-vl128.log` |
| guard-page | `build/sve_guard` | 8/8 | `correctness/native-gates.log` |
| ASan/UBSan | `CXXFLAGS='-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer' NATIVE=1 scripts/build-sve-sa8d.sh` | exit 0，无 sanitizer 报告 | `correctness/asan-ubsan.log` |
| 同二进制 cand==neon | microbench `--verify-only`（8x8/16x16） | 20k 全 0 mismatch | 见构建日志 |
| paired cycles 8x8 | `scripts/run-pmu-sa8d-paired.sh build/sa8d_sve_microbench 8x8` | latency 0.897 / tp 0.932，REJECT | `benchmark/pmu/8x8{, -tp}/` |
| paired cycles 16x16 | 同上 16x16 | latency 0.886 / tp 0.681，REJECT | `benchmark/pmu/16x16{, -tp}/` |

保留门槛：speedup = neon_cycles / cand_cycles，中心估计与 bootstrap 95%
CI 下界均须 >1.10（920B 中间验收口径，见 docs/09 v0.4）。**本轮两形状
latency 与 throughput 均 REJECT**，按协议全量记录（负结果也归档）。

## 5. 为什么 920B 上 SVE256 打不过 NEON（本轮核心结论）

- 920B 的每周期 SIMD 位宽容量：NEON 4×128 = 512b/cycle，SVE 2×256 =
  512b/cycle，**容量相等**；指令条数减半只省发射槽，不省执行位宽。
- 实测表明 256-bit SVE 指令在 920B 上每条成本高于 NEON 128-bit（很可能
  按 128-bit 半拆 µop），于是"指令减半"没有换算成"周期减半"：
  16x16 动态指令 NEON 481 → SVE 257（-47%），但 latency -11%、throughput
  -32%。
- 16x16 throughput 更差（0.681）：throughput 循环里 4 路独立调用，NEON
  4 pipe 能吃满 ILP，SVE 只有 2 pipe 且每调用更长。
- 推论（未在本机验证，供 N+2 规划）：N+2（SVE 4×256、NEON 4×128）宽度
  2× 才让 SVE256 具备 +100% 上限；tier b 的 +130% 还需再砍 ~13% 周期，
  tier c 的 +130% 需要把 257 条动态指令压到 ~111 条。920B 只能做功能与
  指令数验证，吞吐验收必须上 N+2。

## 6. VL 语义实测（保存为生产 dispatch 约束）

- `PR_SVE_SET_VL` 参数在本机内核与 qemu-user 上均按**字节**解释
  （16→16B、32→32B、≥48 都钳到 32B=max 256bit）；Linux 手册写 bit，
  实测行为以运行环境为准，dispatch 只依赖 `svcntb()` 实测值。
- **新线程继承调用者 VL**（main 设 16B 后 worker-inherit=16B；worker
  也可自行设置）。对 x265 线程池有利，但仍建议 dispatch 在每个 worker
  入口显式设置/断言 `svcntb()==32`，避免跨内核版本行为漂移。证据：
  `correctness/vl-thread-probe.log`。

## 7. 下一轮最有信息量的实验

920B 闭环已完成：工具链、SVE1 重建、静态 ISA 门禁、native 差分、VL 拒绝、
guard、ASan/UBSan、paired cycles 全部跑通并归档。下一步 P3'：冻结 SA8D
SVE 候选身份（含 920B 负性能结论），把 `instruction_score` 目标写进搜索
（16x16：257 → ≤209 才够 N+2 tier b 的 2.3×），然后在 N1 上启动可实测的
DCT8（默认；若 profile 显示 interp8 占比更高则服从 profile）。

## 5. 风险

- 2 vCPU 噪声：固定 `taskset -c 0`、每 pair 随机交替 A/B、≥30 有效
  pair、3 进程；
- 云实例可能被用户启停/销毁：所有结论绑定上文环境快照，销毁后不复用；
- GCC 12.3.1 与本地 GCC 16.1.0 生成的指令序列可能不同，静态条数以
  920B 实机构建为准，本地数字只作参照。
