# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2）kernel 做可验证的离线超优化：
以标量语义、内存来源和现有 SIMD 调度为输入，搜索更好的布局与指令序列，
生成、验证并注入 x265，最后以实机数据决定接受或淘汰。

规划文档见 [docs/README.md](docs/README.md)。当前进度（2026-08-14，
实机测试进行中）：

- **工具链闭环（全部验证）**：搜索并行（`--workers`，W=1/W=4 结果一致，
  dct16 布局搜索 6:21→1:44）、rewrite 依赖剪枝（dct32 781→219 计划键/
  31 唯一源）、两级差分（2k→20k，fail→pass=0 构造保证）、流式 trace
  （`--stream`，348 日志与旧 parser 零差异）、LLVM-MCA 第二代理。
- **DCT/IDCT 族（全部过减半门，20k/lite PASS）**：dct32 op-mca
  fused 4014 / MCA 1041（950 实机 985~995 cyc 为实机最快）；dct16
  op-mca 847 / MCA 220（vs 上游 1808/509，-53%/-57%）；idct32 5085 /
  MCA 1164（vs NEON 3319，-64.9%）；idct16 980 / MCA 246（vs 上游
  1487/462）；dct8 289 / MCA 77（8x8 小形状，实机暂落后 NEON）。
- **SA8D16 过减半门**：fused 186（< 186.5），20k/lite PASS；cadd
  为 SVE2-only，920B 不可测，等 950/960。
- **interp8（SVE2p3 path-B，QEMU 已解锁）**：hpp 8x8/16x16/32x32 =
  fused 93/327/1289（-30~34%）、MCA 53/114/369；vpp 16x16/32x32 =
  247/936；TestBenchLite（hpp 三形状 + vpp 两形状）PASS。
- **QEMU SVE2p3 就绪**：本地补丁实现 BtoH dot/udot（vector+indexed）、
  SABAL/UABAL 2-way、shift-narrow-interleave、SVE2p2 zeroing unary
  （patches/qemu-sve2p3-sdot-btoh.patch +
  patches/qemu-sve2p1p3-remaining.patch，canary PASS）。
- **门禁覆盖 7 个 gate**：dct16/dct32/idct16/idct32/sa8d/sa8d16/
  interp8，单次 lite 构建全跑。
- **实机测试就绪**：docs/32（950）、docs/33（920B）快速测试指南 +
  `scripts/quick-test-real-machine.sh` 自动报告 + `tools/parse_quick_report.py`
  结果回填；替换流程（docs/29）一键化。
- **模型校准**：docs/34 六样本 MCA vs 920B 替换比率结论（方向/幅度
  有界性）；融合分析 v0.1 已接入搜索（只记录不排序）。
- 工具：搜索缓存键含 build fingerprint（编译器+参数）、MCA 短名单
  = fused top ∪ 低/高 stack top、`--cxx`/`--opt-extra` 参数扫描、
  `tools/peak_live.py` 压力基线、自定义 llvm-mca（sdot_z32 调度补丁）。
- 关键路径回归在 9 点留一法上为负（M23），逐指令直接延迟也不能排序
  （M24）——静态模型只作粗筛，实机复核是唯一可信排序；
- 剩余：960 未流片（SVE2p3 只能本地 QEMU + 替换预估）、920B 为 SVE1
  （SVE2+ 内核替换预估）、950/960 实机周期验收进行中。

性能目标为三档（详见 [docs/09](docs/09-instruction-fusion-analysis.md)）：
同算力 NEON→NEON +30%；NEON/SVE128→SVE256 与 SVE256→SVE256 在鲲鹏
N+2 上 +130%；920B（SVE v1）作为中间验证环境，保留门槛 >10%。

顶级模型困难求助按批次触发：**每完成三个实际优化迭代请求一次**，后台
异步执行（gpt-5.6-sol max，非只读，仅写对应 round 目录），不阻塞主体
流水线（见
[docs/06](docs/06-agent-iteration-protocol.md)）。

## 常用入口

```sh
scripts/doctor.sh            # 环境体检
scripts/bootstrap.sh         # 幂等安装缺失工具
scripts/build-x265.sh        # 构建未修改 x265（默认 8-bit Release + Tests）
scripts/run-testbench.sh     # 运行 x265 TestBench correctness
scripts/build-testbench-inject.sh  # 黄金标准：注入候选并跑 TestBench transforms
scripts/build-testbench-lite.sh    # 开发期快速门禁：复用 MBDstHarness 秒级验证
scripts/capture-env.sh <dir> # 保存环境快照
scripts/build-sve-sa8d.sh    # SVE2 SA8D 候选生成/编译/QEMU 验证（支持交叉）
scripts/quick-test-real-machine.sh <950|920b> [report]  # 实机全量快速测试报告
scripts/bench-generic-paired.sh   # 通用 CNTVCT paired（microbench CSV）
tools/parse_quick_report.py       # paired 结果回填解析/验收表
```

## 目录

- `docs/`：项目规划、路线、评测规范
- `experiments/`：每次实验的完整原始产物
- `workloads/`：预注册的 workload 与三档性能目标聚合定义
- `third_party/`：固定提交的 x265
- `expert-advice/`：每三个实际优化迭代一次的顶级模型建议归档
- `kernels/` `generated/` `integrations/` `optimizer/`：随 M1+ 逐步建立
