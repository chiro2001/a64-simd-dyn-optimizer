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
- **scale2D_64to32 性能翻新**：fused 1664→576、MCA 378→215
  （neon-paddl loop + clang -O3，20k 差分 0 失配）；luma vpp 补
  16x8/16x32/32x16/32x64/64x32 五个非方形形状（135/91、
  471/286、488/288、1832/1063、2367/1118）。
- **interp4 chroma 非方形覆盖**：hpp 补 8x16/16x8/16x32/32x16
  （165/70、85/47、325/109、325/109），vpp 补 8x8/8x16/16x8/
  16x32/32x16（90/57、170/92、90/57、330/151、335/150），均 20k
  差分 0 失配。
- **luma hpp 非方形覆盖**：8x16/16x8/16x32/32x16 首覆盖
  （181/75、167/71、647/197、649/197），SVE2p3 path-B，20k 差分
  0 失配。
- **sign 字段首覆盖**：SVE2 分块实现 16 fused / 30 MCA，20k 差分
  0 失配；enumerate 字段级 todo 降至 7。
- **findPosFirstLast 字段首覆盖**：NEON 双 128-bit load + 位打包，
  12 fused / 25 MCA，20k 差分 0 失配；enumerate todo 降至 6。
- **scanPosLast 字段首覆盖**：4x4 三种 scan 20k 差分 0 失配
  （标量切片，-O3 后 0 vector/33 MCA，后续可向量化）；enumerate todo 降至 5。
- **costCoeffNxN 字段首覆盖**：4x4 sig-map 代价 20k 差分 0 失配
  （-O3 后 10 vector/97 MCA）；enumerate todo 降至 4。
- **cu/pu/chroma 代表切片**：copy_pp 32x32/16x16/16x16
  （64/43、32/26、32/26），20k 差分 0 失配；enumerate todo 降至 1。
- **pelFilterLumaStrong 字段首覆盖**：V/H 强滤波 20k 差分 0 失配
  （NEON 版 81/53，较标量 82 MCA -35%）；AArch64 已注册字段
  enumerate todo 清零（29/29）。
- **64 宽 luma hpp / 32x32 chroma vpp**：interp8-64x32 2505/690、
  interp4vpp-32x32 655/275，均 20k 差分 0 失配。
- **最大形状覆盖**：interp8-64x64 5001/1354、interp4vpp-32x64
  1295/520，均 20k 差分 0 失配。
- **luma vpp 最大形状**：interp8vpp-64x64 4715/2183，20k 差分
  0 失配；luma hpp/vpp、chroma vpp 最大形状全部收口。
- **chroma vpp 更多形状**：8x32 330/151、16x64 650/272、32x8
  175/91，均 20k 差分 0 失配。
- **chroma hpp 更多形状**：8x32 325/109、16x64 645/189、32x8
  165/67，均 20k 差分 0 失配。
- **luma hps 非方形**：16x8 186/68、32x16 714/212，均 20k 差分
  0 失配（gen 发射器，isRowExt=0）。
- **luma hps 继续补齐**：8x32 362/119、16x32 714/212，均 20k 差分
  0 失配（gen 发射器，isRowExt=0）。
- **luma hps 32x8**：362/118，20k 差分 0 失配（gen 发射器，
  isRowExt=0）。
- **luma vpp 64x16**：1242/585，20k 差分 0 失配（SVE2）。
- **luma vpp 16x64 / 64x48**：919/542、3540/1650，均 20k 差分
  0 失配（SVE2）。
- **luma vpp 16x4 / 32x24**：79/60、712/419，均 20k 差分
  0 失配（SVE2）。
- **luma vpp 32x8**：264/159，20k 差分 0 失配（SVE2）。
- **luma vpp 8 宽支持**：8x16 247/157、8x32 471/286，均 20k 差分
  0 失配（SVE2）。
- **luma vpp 8x4**：79/60，20k 差分 0 失配（SVE2）。
- **pu.addAvg 代表切片**：16x16 128/58，20k 差分 0 失配（SVE2）。
- **cu.sub_ps 代表切片**：16x16 64/36，20k 差分 0 失配（SVE2）。
- **cu.copy_ss 代表切片**：16x16 32/26，20k 差分 0 失配（SVE2）。
- **cu.add_ps 代表切片**：16x16 96/49，20k 差分 0 失配（SVE2）。
- **cu.copy_sp 代表切片**：16x16 48/31，20k 差分 0 失配（SVE2）。
- **cu.copy_ps 代表切片**：16x16 32/26，20k 差分 0 失配（SVE2）。
- **chroma vpp 非 16 倍宽**：12x16 170/88、24x32 656/276，均 20k
  差分 0 失配（SVE2）。
- **chroma vpp 12x32 / 24x64**：330/149、1296/520，均 20k 差分
  0 失配（SVE2）。
- **luma vpp 16x12**：191/124，20k 差分 0 失配（SVE2）。
- **chroma vpp 8x64 / 16x4**：650/272、50/43，均 20k 差分
  0 失配（SVE2）。
- **chroma vpp 8x4**：50/43，20k 差分 0 失配（SVE2）。
- **chroma vpp 8x6**：70/51，20k 差分 0 失配（SVE2）。
- **chroma vpp 16x12 / 32x24**：130/74、495/211，均 20k 差分
  0 失配（SVE2）。
- **chroma vpp 16x24 / 32x48**：250/120、975/397，均 20k 差分
  0 失配（SVE2）。
- **chroma hpp 16x4 / 32x24**：45/37、485/149，均 20k 差分
  0 失配（SVE2p3 path-B）。
- **chroma hpp 8x4 / 32x64**：45/37、1285/349，均 20k 差分
  0 失配（SVE2p3 path-B）。
- **chroma hpp 8x64 / 32x48**：645/189、965/269，均 20k 差分
  0 失配（SVE2p3 path-B）。
- **chroma hpp 16x24**：245/89，20k 差分 0 失配（SVE2p3 path-B）。
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
- **950 实机首轮结果（2026-08-14，docs/35）**：sa8d16 +28%、ivpp16
  +12%、ivpp32 +13%、dct8 +48%（均超保留线 1.10）；idct16/32 替换
  下界 1.09/1.03；interp8 hpp path-B 在 950 不采用（等 960）；NV2
  MCA 对 SVE256 系统性低估（“判慢”的 vpp/dct8 实机全快）。
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
