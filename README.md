# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2）kernel 做可验证的离线超优化：
以标量语义、内存来源和现有 SIMD 调度为输入，搜索更好的布局与指令序列，
生成、验证并注入 x265，最后以实机数据决定接受或淘汰。

规划文档见 [docs/README.md](docs/README.md)。当前进度（2026-08-14）：

- **工具链闭环（全部验证）**：搜索并行（`--workers`，W=1/W=4 结果一致，
  dct16 布局搜索 6:21→1:44）、rewrite 依赖剪枝（dct32 781→219 计划键/
  31 唯一源）、两级差分（2k→20k，fail→pass=0 构造保证）、流式 trace
  （`--stream`，348 日志与旧 parser 零差异）、LLVM-MCA 第二代理。
- **IDCT32 SVE2p1 best = zip32 + sdot-s32：fused 5085 / 动态 MCA
  1164（相对 NEON 3319 -64.9%，远超 NP1 减半门），20k 0 失配 +
  TestBenchLite 5/5**；关键配方：`sdot z.s,z.h,z.h` 直算、C 常量
  `[base,#vnum,MUL VL]` 立即数寻址（adrp 944→94）、zip 写回转置
  （off 地址修复）、输入行按需装入、`-O3 -frename-registers
  --param=sched-pressure-algorithm=1`（docs/27 §8.11）。
- **IDCT16 SVE2p1 best = zip16 + sdot-s32：fused 980 / MCA 246**
  （旧 mul 438 的 -44%），20k/lite 全 PASS。
- **DCT32 op 后端**：fused best 3930（tbl2/row16）、cycle-proxy best
  4014（MCA 1041，950 实机 985~995 cyc，为实机最快），相对上游
  12710 = 0.315×（docs/10 §0.1）；DCT16 legacy best 705；sa8d16
  189；interp8 127。
- DCT16 legacy best 705（零 scatter 895，超内部 731）；sa8d16 189
  （结构地板）；interp8 127。
- 下一主项（docs/27 §8.11）：峰值活跃 Z 已实测 ≤31（预算内），
  直接 asm 原型从压峰值转为压标量/permute 开销；950/960 实机对
  IDCT 新 best 做 paired 复测（SVE2p1 无法在 920B 跑）。
- 门禁覆盖 dct16/dct32/sa8d/sa8d16/interp8；interp8 门禁还实证发现并
  修复了一个整宽存储越界写；
- 工具：搜索缓存键含 build fingerprint（编译器+参数）、MCA 短名单
  = fused top ∪ 低/高 stack top、`--cxx`/`--opt-extra` 参数扫描、
  `tools/peak_live.py` 压力基线、自定义 llvm-mca（sdot_z32 调度补丁）。
- 关键路径回归在 9 点留一法上为负（M23），逐指令直接延迟也不能排序
  （M24）——静态模型只作粗筛，实机复核是唯一可信排序；
- 剩余阻塞：960 未流片（SVE2p3 `sdot.h` 无法验证）、920B 为 SVE1、
  NEON→SVE256 实机周期目标待 N+2 验收。

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
```

## 目录

- `docs/`：项目规划、路线、评测规范
- `experiments/`：每次实验的完整原始产物
- `workloads/`：预注册的 workload 与三档性能目标聚合定义
- `third_party/`：固定提交的 x265
- `expert-advice/`：每三个实际优化迭代一次的顶级模型建议归档
- `kernels/` `generated/` `integrations/` `optimizer/`：随 M1+ 逐步建立
