# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2 / SVE2p3）kernel 做**可验证的离线
超优化**：以种子语义、上游参考与现有 SIMD 调度为输入，搜索更好的布局和
指令序列，生成候选后经 20k 差分 + TestBenchLite 验证，再用动态 fused /
LLVM-MCA / 实机 CNTVCT 多级代理评估，最后通过 `LD_PRELOAD` 快速注入 x265
进程做验收。

规划与完整文档见 [docs/README.md](docs/README.md)。

## 当前状态（2026-08-15）

- **覆盖**：179 个 kernel 目录；AArch64 已注册 29 个 dispatch 字段全部有
  代表切片/形状覆盖（`enumerate_x265_simd.py` todo = 0）；通用发射器冒烟
  回归 69/69。
- **正确性纪律**：新 kernel 一律 20k 差分 0 失配；大型体系改动跑
  `python3 tools/test_gen_emit.py` 防回归；SVE2p3-only 候选在本地自定义
  QEMU（`build/qemu-build/qemu-aarch64`）验证。
- **性能口径**：`fused` = QEMU 动态 trace 的 fused vector uop（VL=256）；
  `MCA` = LLVM-MCA Neoverse-V2 代理；920B/950 实机用 CNTVCT paired。

### 代表性覆盖与性能（fused/MCA）

| 族 | 代表性结果 |
| --- | --- |
| DCT/IDCT | dct8 289/77、dct16 847/220、dct32 4014/1041、idct16 980/246、idct32 5085/1164 |
| SA8D/SATD | sa8d16 186/73；satd 全形状首覆盖（16x16 140/74、64x64 2241/554） |
| interp8 | hpp path-B 8/16/32 = 93/53、327/114、1289/367；vpp 16/32 = 247/157、936/547；64x64 最大形状 5001/1354（vpp） |
| interp4/chroma | hpp/vpp 覆盖 I420/I422/I444 常用形状；最大 vpp 32x64 = 1295/520 |
| misc | quant/dequant/sao/scale/ssim/pelFilter/sign/find/scan/cost/copy/addAvg 等均有 20k 差分通过的代表切片 |

完整矩阵见 [docs/47-current-coverage-matrix-20260815.md](docs/47-current-coverage-matrix-20260815.md)，
逐段进展见 [docs/46-progress-20260815.md](docs/46-progress-20260815.md)。

## ISA 受限搜索与生成（920B / 950）

为在真实目标上验证优化效果，搜索/生成后端可限制在目标机器实际支持的
指令集：

- `--isa sve1`：920B（SVE1.0，VL=256）。只保留 SVE1 可用的 layout，
  编译 `-march=armv8.2-a+sve`，并对每个候选对象跑
  `check_isa_level.py` 静态门禁。
- `--isa sve2`：950（SVE2.0 及以下）。排除 SVE2p1/SVE2p3 的
  `sdot-s32`/`sdot.h` 路径，编译 `-march=armv8.2-a+sve2`。

也可直接用 `--target 920B|950`，等价于 `--isa sve1|sve2` +
对应 MCA profile。

```sh
# 920B：生成原生 SVE1 候选（gen 后端会自动使用 CADD90 的 SVE1 精确替换、
# NEON-bridge 窄化等等价 lowering）
python3 tools/search_sve2_layouts.py --kernel sa8d --backend gen --isa sve1 \
  --outdir experiments/isa-sve1/sa8d --workers 4 --mca-top 5 \
  --mca-bin /home/chiro/llvm-src/build-mca/bin/llvm-mca

# 950：只允许 SVE2.0 及以下（interp8 会自动退回 sdot-d path-A，不搜索 sdot.h）
python3 tools/search_sve2_layouts.py --kernel interp8 --target 950 \
  --outdir experiments/isa-sve2/interp8 --workers 4
```

已用完整 20k 差分验证的 SVE1 原生候选示例：

| kernel | fused/MCA | 说明 |
| --- | ---: | --- |
| interp8-8x8 | 106/52 | gen fir，SVE1 sdot + NEON 窄化 |
| sa8d-8x8 | 100/74 | gen hadamard，SVE1 CADD90 替换 |
| sa8d16 | 236/110 | gen hadamard，SVE1 16-lane 自然行 |
| satd-16x16 | 174/87 | gen hadamard，SVE1 |
| interp4-16x16 | 295/104 | gen fir，SVE1 |

## LD_PRELOAD 注入器

`tools/build_preload_so.py` 一键生成动态库，加载后通过拦截
`x265::x265_setup_primitives` 在 x265 完成 dispatch 表初始化/别名后，
把对应函数指针替换为本项目候选；也可手动调用 `dynopt_init()` 或
`dynopt_patch_primitives()`。

```sh
# 构建 950 可用的 SVE2 注入库（自动跳过不兼容 kernel）
python3 tools/build_preload_so.py --isa sve2 \
  --out build/dynopt-x265-sve2.so --kernels dct8,sa8d16,interp8vpp-16

# 构建 920B 可用的 SVE1 注入库（dct32 自动使用 best_sve1）
python3 tools/build_preload_so.py --isa sve1 \
  --out build/dynopt-x265-sve1.so --kernels dct8,dct32,scale2d

# 使用
LD_PRELOAD=/abs/path/build/dynopt-x265-sve2.so x265 --input ... --output ...
```

构建报告（`--json`）会列出实际 patch 的 kernel/slot 和跳过原因；当前只
支持 8-bit x265。全 kernel 扫描下 sve2 可 patch 147 个、sve1 原生 74 个
（quant/dequant/sao/ssim 等固定形状字段经 adapter 接入）。实现细节与
ISA 限制见
[docs/48-preload-and-isa-profiles.md](docs/48-preload-and-isa-profiles.md)。

对静态链接或不想用预加载的环境，可直接把候选编进 x265：

```sh
scripts/build-x265-injected.sh --isa sve1 --kernels sa8d,interp8 \
  --build-dir build/x265-8-cross-sve2 --inject-out build/dynopt-inject
```

脚本会重编带 patch 的 `primitives.cpp`、把候选对象并入 `libx265.a`，
再链接运行自检程序；源码随后恢复。

## 常用入口

```sh
scripts/doctor.sh                       # 环境体检
scripts/bootstrap.sh                    # 幂等安装缺失工具
python3 tools/test_gen_emit.py          # 通用发射器冒烟回归（69/69）
python3 tools/enumerate_x265_simd.py    # 覆盖清点（29/29，todo=0）
python3 tools/search_sve2_layouts.py --kernel <k> --workers 4 \
  --outdir experiments/m30-<k>-search/layout-search \
  --mca-top 5 --mca-bin /home/chiro/llvm-src/build-mca/bin/llvm-mca
python3 tools/build_preload_so.py --isa sve2 --out build/dynopt-x265.so
python3 tools/check_isa_level.py --object <candidate.o> --level sve2
scripts/verify-preload-real-machine.sh <user@host> sve1  # 920B 真机验证
scripts/quick-test-real-machine.sh <950|920b> [report]  # 实机快速测试
tools/parse_quick_report.py             # paired 结果回填/验收表
```

## 目录

- `docs/`：规划、评测规范、逐轮进展与交接
- `kernels/`：每个算子的 manifest、seed、verifier 与候选
- `seeds/`：提取/配方种子（MachineIR 与常量形态）
- `tools/`：搜索、发射、验证、ISA 门禁、注入器
- `scripts/`：构建、实机测试、环境脚本
- `experiments/`：实验原始产物（只保留 results.json 等可再生物）
- `third_party/`：固定提交的 x265
- `reports/`：950/920B 实机报告
- `expert-advice/`：每三个实际优化迭代一次的顶级模型建议归档

## 性能目标

三档目标见 [docs/09](docs/09-instruction-fusion-analysis.md)：同算力
NEON→NEON +30%；NEON/SVE128→SVE256 与 SVE256→SVE256 在鲲鹏 N+2 上
+130%；920B（SVE1）作为中间验证环境，保留门槛 >10%。静态模型只作粗筛，
最终排序以实机复核为准。
