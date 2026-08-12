# M11-SVE-920B：SVE256 实机闭环（功能 / 门禁 / paired PMU）

- run-id: `m11-sve-920b`
- state: `in-progress`（环境接入中；结果将随各门禁完成回填）
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
5. 8x8 single 与 16x16 wrapper 对同机上游 NEON 的 paired PMU 保留门槛
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
| SVE1 静态门禁 | `tools/check_isa_level.py --level sve1` | 待跑 | `static/` |
| native differential | `build/sve_verify 1000000` | 待跑 | `correctness/` |
| VL=128 拒绝 | `build/sve_verify --vl-bytes=16 200` | 待跑 | `correctness/` |
| guard-page | `build/sve_guard` | 待跑 | `correctness/` |
| ASan/UBSan | `CXXFLAGS='-O1 -g -fsanitize=address,undefined -fno-omit-frame-pointer' NATIVE=1 scripts/build-sve-sa8d.sh` | 待跑 | `correctness/` |
| paired PMU 8x8 | `scripts/run-pmu-sa8d-paired.sh build/sa8d_sve_microbench 8x8` | 待跑 | `benchmark/pmu/` |
| paired PMU 16x16 | 同上 16x16 | 待跑 | `benchmark/pmu/` |

保留门槛：speedup = neon_cycles / cand_cycles，中心估计与 bootstrap 95%
CI 下界均须 >1.10（920B 中间验收口径，见 docs/09 v0.4）。

## 5. 风险

- 2 vCPU 噪声：固定 `taskset -c 0`、每 pair 随机交替 A/B、≥30 有效
  pair、3 进程；
- 云实例可能被用户启停/销毁：所有结论绑定本节环境快照，销毁后不复用；
- GCC 12.3.1 与本地 GCC 16.1.0 生成的指令序列可能不同，静态条数以
  920B 实机构建为准，本地数字只作参照。
