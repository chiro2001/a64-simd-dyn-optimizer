# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2 / SVE2p3）kernel 做**可验证的离线
超优化**：以种子语义、上游参考与现有 SIMD 调度为输入，搜索更好的布局和
指令序列，生成候选后经 20k 差分 + TestBenchLite 验证，再用动态 fused /
LLVM-MCA / 实机 CNTVCT 多级代理评估，最后通过 `LD_PRELOAD` 快速注入 x265
进程做验收。

规划与完整文档见 [docs/README.md](docs/README.md)。

给 Codex/agent 的操作契约见 [AGENTS.md](AGENTS.md)（入口文档、机器
红线、工作流）；全部测试结果统一记录在
[data/kernel-test-db.csv](data/kernel-test-db.csv)，用法与维护约定见
[docs/67](docs/67-kernel-test-db-20260816.md)。

## AGO：自动图优化 sidecar（2026-08-16 起的新主方向）

在既有“布局搜索 + 专用发射器”之上，新增 **AGO（AArch64 SIMD Graph
Optimizer）** 并行后端：从 kernel 契约/受限 DSL 自动建数据流图 → 逐个
pass 优化 → 按目标机指令成本表做有界 cover/布局选择 → 20k 差分 +
生产逐调用差分验证 → N1 PMU / 920B CNTVCT 真机回放更新代价表。
目标是解决“内部手写算子可在 920B 超开源 NEON 30%+，而现有搜索工具
搜不出来”的算子级质量差距（规划 [docs/52](docs/52-ago-plan-20260816.md)，
实现 [optimizer/ago](optimizer/ago/README.md)）。

当前进度（2026-08-16）：

- M0 通过：SA8D 8x8 垂直切片（契约 → 图 → NEON cover → 20k 门禁 →
  N1/920B paired 复现，0 失配）；
- M1 通过：受限 fail-closed DSL 前端 + pass 管线（确定性/幂等/预算）；
- M2 通过：SATD 8x8 锚点 + 17 实例正式留出排序门（N1 81 可分辨对
  acc=0.975/tau=0.951/regret=1.0%；920B 80 对 acc=1.000；N1 成本表
  transfer 到 920B acc=1.000；报告
  [reports/ago-m2-expanded-ranking-20260816.txt](reports/ago-m2-expanded-ranking-20260816.txt)）；
- M3 进行中：已知赢法模板化（PEXT 查表、DFA 状态表）已带穷举证明 +
  双机 20k 差分 + 微基准（PEXT N1 1.6x/920B 2.2x；DFA N1 1.24x/920B
  1.38x），见 [reports/ago-m3-pext-template-20260816.txt](reports/ago-m3-pext-template-20260816.txt)
  与 [reports/ago-m3-dfa-template-20260816.txt](reports/ago-m3-dfa-template-20260816.txt)；
- **best8 冻结发布（2026-08-16，28 槽）**：外链修复（satd 家族 +
  interp8 vps）+ 既有熵族/pixelcmp 赢点，双平台 E2E：920B **-1.92%**、
  N1 **-1.78%**（bit-exact；复现手册 [docs/55](docs/55-best8-release-20260816.md)）；
- **best9 最终注入集（2026-08-16，29 槽）**：best8 + saoCuStatsBO，
  双平台 E2E：920B **-2.10%**、N1 **-1.62%**（bit-exact）；950
  SVE2 部署就绪（best9-950，41 槽）；项目全景见
  [docs/57](docs/57-final-status-20260816.md)；
- 顶级模型咨询：round-0023（AGO 规划条件 GO）与 round-0024
  （M2 拆分 + 排序门/N1 校准协议，decision 已落盘）见
  [expert-advice/](expert-advice/)。

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
- `--isa neon`：NEON+dotprod 纯 NEON 搜索（NEON→NEON 有效性验证）。
  只接受发射器有纯 NEON lowering 的 kernel（当前 scan-pos-last /
  find-pos-first-last / pel-filter-luma-strong），编译
  `-march=armv8.2-a+dotprod`，对象级拒绝任何 SVE 指令。

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

920B 端到端实测（640x360/30 帧、单核单线程、输出 /dev/null）：注入全部
79 个 SVE1 kernel 后中位 7476 ms vs 基线 7152 ms（约 +4.5% 变慢），当前
SVE1 候选适合搜索/正确性验证，不适合直接替换；详见
[docs/48](docs/48-preload-and-isa-profiles.md) §7。

真实 1080p 视频（30 帧）上的聚焦测试：基线 8.16–8.17 s。scanPosLast 的
NEON 搜索（`--isa neon`，mask/pext/flag/count 四轴）把单 CG 微基准从
2.24× 慢收敛到 1.04×；修正多 CG 语义后注入的候选与基线**码流完全一致**
（7981.54 kb/s、QP 33.77），耗时 8.21–8.22 s（约 +0.6%）。该轮同时暴露
并修复了旧差分语料只测单 CG 且几乎全非零的盲区（见
[docs/48](docs/48-preload-and-isa-profiles.md) §8）。

sa8d16 纯 NEON 搜索（第三轮）：新增 NEON 16x16 发射器（reduce:
vpadal/vaddlv/vaddv，quad: seq/pair），920B CNTVCT 延迟/吞吐均反超上游
NEON（vaddlv-pair 1.12×/1.15×，20k 差分 0 失配）；单算子注入 E2E 码流
一致但差异落在噪声内（热点占比 ~2.3%）。`--rank-by bench920` 支持按真机
CNTVCT 比率排序（见 [docs/48](docs/48-preload-and-isa-profiles.md) §9）。

### 最新实机结论（2026-08-15）

- **920B 内网共享节点复测**：sa8d16 NEON 的 1.12×/1.15× 收益不重现
  （延迟/吞吐 ~1.00–1.03×），scanPosLast 方向相反（候选慢 14%）；
  costC1C2Flag 约 2.1× 快、costCoeffRemain 中性。共享节点竞争噪声大，
  单点云端收益需专用节点复验（reports/920b-internal-quick-test-20260815.txt）。
- **dct32 搜索布局收敛**：此前 79-kernel 注入里 dct32 慢 27–40%；扩展
  替换表后，best_op_mca/r16 在 920B 上收敛到延迟 0.97/0.93、吞吐
  1.01/1.00（替换为 128-bit NEON 形态，是乐观估计），**仍不注入**。
- **批量注入（batch4：sa8d16+satd8+costCoeffNxN+costCoeffRemain）**：
  码流与基线一致，E2E 5 次中位 8.14–8.18 s vs 基线 8.15–8.19 s，
  **完全持平**——单 kernel 微基准收益 ≤15% 时 E2E 提升 <0.3%，淹没在
  噪声内。
- **950**：costC1C2Flag +81%（20k 干净，保留）；costCoeffRemain ~中性；
  scanPosLast SVE2 候选慢 4.5×，950 不注入；sa8d16 的 SVE2 候选正确性
  FAIL，950 沿用 NEON 版本（reports/950-quick-test-20260815.txt）。
- **costC1C2Flag 终局**：n<=4 展开叶子路径 + n5-8 NEON run-cache，
  60k 混合语料差分 0 失配、码流一致，但 E2E 仍 +0.7%（n1 占真实调用
  ~41%，uniform 语料下 n1 比 0.91）——不作为注入项，保留为最优已知
  候选（reports/c1c2-920b-e2e-20260815.txt）。
- **真实调用轨迹回放（P0 工具）**：920B 抓 30 帧编码的 1896 万次熵族
  调用并回放计时（tools/trace_entropy_calls.py +
  benchmarks/entropy_trace_replay.cpp）。真实分布下 costCoeffNxN 标量
  候选 +6.3%，costC1C2Flag/scanPosLast/costCoeffRemain 全部持平，与
  已知 E2E 符号一致；均匀微基准对熵族的判断不可信
  （reports/entropy-replay-920b-20260815.txt）。
- **costCoeffNxN NEON 变体通过生产验证**：回放 verify 模式对云端生产
  静态库逐调用差分，修复 soff=15 尾部 ctx 跳过条件后 5,776,047 次调用
  0 失配，真实分布回放 +9.7%；单算子注入码流 ee5db7 一致、E2E 中位
  8200 vs 基线 8191 ms（噪声内）。已设为 cost-coeff-nxn 默认候选。
- **costC1C2Flag round-29**：n=1..8 全展开叶子路径替代 NEON run-cache，
  生产逐调用 6,472,176 次 0 失配，真实分布回放 +30%（n8 +49%）；该
  kernel 在本编码 perf 占比 <1.1%，E2E 中性。best5 批量（c1c2 + ccn
  NEON + remain + sa8d16 + satd8，19 槽）码流 ee5db7 一致，中位
  8166 vs 8193 ms，首次方向转正（噪声内）。
- **scanPosLast round-30 + best6 批量（首个可复现 E2E 收益）**：
  4-bit 查表 PEXT 替代逐位 clz 压缩（回放 +27%，生产逐调用 432 万次
  0 失配）；best6 批量（+scan r30，20 槽）码流 ee5db7 一致，配对中位
  8055 vs 8210 ms，**-1.9%**。
- **costCoeffRemain DFA + 端到端汇总**：DFA 表（5×3×256）回放 +20%、
  生产 239 万次 0 失配；best6b 配对中位 8061 vs 8210 ms（-1.8%）。
  完整端到端对比、全部生产验证证据与结论见
  [reports/end-to-end-comparison-20260815.txt](reports/end-to-end-comparison-20260815.txt)。

结论：搜索有效性已在 NEON→NEON 方向验证（sa8d16/satd8/scanPosLast 微
基准反超、20k 差分干净），但微基准反超 → E2E 收益的转化率不足；达成
端到端 +15% 需要一批大热点同时显著反超，或单个 ≥5% 占比热点大幅反超。
搜索路线已到转化率瓶颈，**AGO 作为并行 sidecar 主攻算子级质量**（见上
一节），现有注入/冻结链路保持不变。

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
支持 8-bit x265。全 kernel 扫描下 sve2 可 patch 153 个、sve1 原生 79 个
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
scripts/quick-test-real-machine.sh <920b|950> [report]  # 内网实机快速测试
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

内网 920B/950 的快速实测流程、候选清单与已知问题见
[docs/49](docs/49-quick-test-internal-20260815.md)。

best6b 冻结发布（20 槽、双片段 CI、一键复现命令）见
[docs/51-release-best6b-20260815.md](docs/51-release-best6b-20260815.md)。

best7 = best6b + sao-stats-bo（21 槽，2026-08-15 起冻结）：30 帧码流
ee5db7 一致，中位 8066 ms；复现命令与完整清单见
[docs/51-release-best6b-20260815.md](docs/51-release-best6b-20260815.md)。

临时产物约定：项目相关的临时文件一律放 `~/tmp/dynopt/`（可随时删除），
不散落在 ~/tmp 或 /tmp 根目录；`experiments/` 只保留
`results.json` 等可再生物，原始搜索产物已按此策略清理（2026-08-16）。

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
