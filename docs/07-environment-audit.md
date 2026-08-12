# 环境与上游审计快照

本文件记录规划阶段的只读审计结果，日期为 2026-08-12（Asia/Shanghai）。实现 Agent 必须运行自己的环境采集脚本生成新快照；不能假定本文件永远反映当前状态。

## 1. 指定远端主机

连接目标：`chiro@129.146.162.16`

| 项目 | 实测值 |
| --- | --- |
| OS | Ubuntu 24.04，Linux `6.17.0-1018-oracle` |
| 架构 | AArch64 |
| CPU | 2 vCPU，Arm Neoverse-N1 r3p1 |
| ISA features | `fp asimd ... fphp asimdhp ... asimdrdm ... asimddp` |
| 不存在的关键 feature | I8MM、SVE、SVE2、SVE2 BitPerm |
| GCC | 13.3.0 |
| Python | 3.12.3 |
| perf | 6.17.13；用户态 cycles/instructions/branches 计数实测可用 |
| `perf_event_paranoid` | 2 |
| 项目目录 | `$HOME/projects/a64-simd-dyn-optimizer` 当时不存在 |
| x265 | 未安装，也未发现现有源码树 |
| 缺失工具 | CMake、Ninja、Clang/LLVM、llvm-mca、QEMU user、Codex CLI、ripgrep |

结论：该主机是 NEON128 的一个有效功能/性能目标，但只有 2 个云 vCPU，可能有 steal time 与邻居噪声。它不是 SVE 功能或性能目标。任何报告都必须把 CPU 型号和 feature 列表写入 manifest，禁止把编译成功误报为 SVE 实机验证成功。

## 2. 上游 x265 审计锚点

规划时从 `https://bitbucket.org/multicoreware/x265_git.git` 临时浅克隆，观察到：

- commit：`b81f650e21e8aacbe6a9ad04ce14aefc05b932c0`
- commit 日期：2026-06-23
- AArch64 源目录：`source/common/aarch64/`

与本项目直接相关的文件包括：

| 领域 | 标量规格/测试 | NEON/SVE 实现与接入 |
| --- | --- | --- |
| SA8D | `source/common/pixel.cpp`、`source/test/pixelharness.cpp` | `pixel-prim.cpp`、`pixel-prim-sve2.cpp`、`pixel-prim.h`、`asm-primitives.cpp` |
| DCT/IDCT | `source/common/dct.cpp`、`source/test/mbdstharness.cpp` | `dct-prim.cpp`、`dct-prim-sve.cpp`、`dct.S`、`dct-prim.h` |
| interp8_hpp | `source/common/ipfilter.cpp`、`source/test/ipfilterharness.cpp` | `filter-prim.cpp`、`filter-prim-sve.cpp`、DotProd/I8MM 变体、`filter-prim.h` |
| 构建 | `source/CMakeLists.txt`、`source/common/CMakeLists.txt` | `ENABLE_NEON*`、`ENABLE_SVE*`、`ENABLE_TESTS` |
| dispatch | `source/common/primitives.cpp`、`source/common/cpu.cpp` | `source/common/aarch64/cpu.h`、`asm-primitives.cpp` |

审计时确认的几个重要事实：

- 8-bit NEON SA8D 的核心是 `pixel_sa8d_8x8_neon` / `pixel_sa8d_16x16_neon`，使用 load-diff、8x8 Hadamard、absolute reduction 和最终 rounding。
- 上游的 SA8D 扩展版本在 `pixel-prim-sve2.cpp`，因此“NEON -> SVE256”任务必须先决定目标是 SVE 还是 SVE2，不能只按文件名想象。
- x265 的 SVE intrinsic 构建依赖 `HAVE_SVE_BRIDGE`，其 CMake feature 链还约束 DotProd/I8MM/SVE/SVE2；必须用实际 configure 输出确认哪些源被编译。
- `TestBench` 支持 `--cpuid`、`--testbench pixel|transforms|interp|intrapred` 和 `--nobench`；它会用 C reference 检查 intrinsic/assembly primitive，并提供内置速度输出。
- AArch64 `TestBench` 的计时来源是 `cntvct_el0`，输出不应未经校准就称作“CPU cycles”。项目需要独立 microbench 和 `perf stat` 交叉验证。
- x265 的 setup 顺序允许后设置的 ISA primitive 覆盖先前指针；项目可用一个默认关闭的 `setupA64DynoptPrimitives()` 最后覆盖特定 slot，形成低侵入集成。

## 3. M0 必须补齐的环境

至少需要：

- Git、CMake、Ninja；
- GCC 与 Clang/LLVM 的固定主版本；
- `llvm-objdump`、`llvm-mc`、`llvm-mca`（若目标模型可用）；
- Python 3.11+ 与锁定依赖；
- QEMU user/system 中至少一种，支持目标 SVE/SVE2 功能测试；
- `perf`、`taskset`、`sha256sum`、`jq`、`rg`；
- x265 固定 commit 的源码与 8/10/12-bit 构建目录；
- 一个真实 SVE/SVE2、VL=256 的性能执行节点；
- 能访问仓库的 Codex CLI 执行位置，用于每轮建议归档。它可以位于控制机，不要求安装在 benchmark 服务器。

工具安装属于 M0 的正常实现动作，但 Agent 不应在文档里硬编码未经验证的软件包版本。环境采集至少保存以下原始输出：

```text
uname -a
/etc/os-release
lscpu
/proc/cpuinfo 中的 Features
编译器、链接器、CMake、QEMU、perf 版本
SVE VL 查询结果
perf_event_paranoid
x265 commit/submodule status
完整 CMake configure 输出
```

## 4. 建议目标矩阵

| 目标 ID | 用途 | 必需条件 | 能否发布性能结论 |
| --- | --- | --- | --- |
| `n1-neon128` | NEON MVP、SA8D 首条链路 | 当前 N1；ASIMD | 可以，但注明 2-vCPU 云噪声 |
| `qemu-sve256` | SVE/SVE2 功能、非法指令与 VL 测试 | QEMU 固定 CPU/VL 配置 | 不可以 |
| `hw-sve256` | SVE/SVE2 正式性能 | 真实硬件；记录 MIDR、features、VL=256 | 可以 |
| `hw-sve-vla-alt` | 验证 VLA 可移植性 | 至少另一种 VL（如 128/512） | 只用于正确性/稳健性，性能单独报告 |

若暂时拿不到 `hw-sve256`，可以继续完成 SVE codegen 和功能验证，但相关 milestone 状态必须标记为“功能完成、性能待验证”，不能宣称已达对应档位目标。

## 5. 基线冻结记录模板

M0 结束时在实验目录写入类似记录：

```yaml
schema_version: 1
captured_at: 2026-08-12T00:00:00Z
host_id: n1-neon128
kernel: sa8d_8x8
x265_commit: <full sha>
optimizer_commit: <full sha>
compiler:
  id: clang
  version: <full version>
flags: [<exact flags>]
target:
  arch: aarch64
  cpu: neoverse-n1
  features: [neon, dotprod]
  sve_vl_bits: null
build:
  bit_depth: 8
  build_type: Release
binary_sha256: <sha256>
benchmark_protocol: <versioned protocol id>
raw_results: <relative path>
```
