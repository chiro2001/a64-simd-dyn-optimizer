# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2）kernel 做可验证的离线超优化：
以标量语义、内存来源和现有 SIMD 调度为输入，搜索更好的布局与指令序列，
生成、验证并注入 x265，最后以实机数据决定接受或淘汰。

规划文档见 [docs/README.md](docs/README.md)。当前进度（2026-08-14）：

- **工具链闭环（全部验证）**：搜索并行（`--workers`，W=1/W=4 结果一致，
  dct16 布局搜索 6:21→1:44）、rewrite 依赖剪枝（dct32 781→219 计划键/
  31 唯一源）、两级差分（2k→20k，fail→pass=0 构造保证）、流式 trace
  （`--stream`，348 日志与旧 parser 零差异）、LLVM-MCA 第二代理。
- **DCT32 op 后端 best = 4682 fused_uop**（vector 5158 / 零 scatter，
  相对上游 12710 = 0.368×，**低于内部参考 4827 = 0.970×**），
  **TestBenchLite 5 seed 全 PASS（黄金标准闭合）**；由
  row_group=16 合并存储 + k0_merge8 + k0 先发射 + pass1 专用
  k0 E-pack 达成（5390→4682，-13.1%），
  k0_even_sdot 全 s16 方案被数值探针否决（1.34% 回绕，超 legacy
  门禁，见 docs/20 §6.4）。
- DCT16 legacy best 705（零 scatter 895，超内部 731）；sa8d16 189
  （结构地板）；interp8 127。
- 下一主项：全布局搜索收尾确认（含 row16/k0 新轴）后固化新 best，
  再按 docs/20 §6 剩余差距（str/ldr/置换折叠）继续。
- 门禁覆盖 dct16/dct32/sa8d/sa8d16/interp8；interp8 门禁还实证发现并
  修复了一个整宽存储越界写；
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
