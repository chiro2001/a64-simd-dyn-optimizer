# AArch64 SIMD Dynamic Optimizer

对 x265 的 AArch64（NEON / SVE / SVE2）kernel 做可验证的离线超优化：
以标量语义、内存来源和现有 SIMD 调度为输入，搜索更好的布局与指令序列，
生成、验证并注入 x265，最后以实机数据决定接受或淘汰。

规划文档见 [docs/README.md](docs/README.md)。当前进度（M30，2026-08-13）：

- 工具主链闭环：LLVM IR→MachineIR 导入、值域分析、范围驱动位宽修复、
  结构级 rewrite（widen / shift64 / wide_load / tree_to_mla）、搜索主循环、
  C-exact 差分门禁、双机 paired 微基准；
- 布局搜索主链（QEMU 真实动态 → lane 级 IR → manifest 布局轴 → 差分
  验证 → TestBenchLite 门禁 → fused_uop 排名）：DCT16 legacy 704（uop
  口径，低于内部 827）、**DCT32 op 后端 row8+legacy+zip = 6464
  （0.509x，低于 v2 7190；rewrite 序列可自动重发现 6456）**、sa8d16 189
  （0.507x，结构地板）、interp8 127（-10%）；
  （2026-08-13 口径修正：v3.1 的 3962 为 pass1-only，full-call 8292，
  未过半数门，原“HALVED/超越内部”结论撤销）
- **P0 op 级原子 rewrite + 序列搜索**：`tbl2_to_zip / legacy_k2 /
  legacy_k4 / merge_narrow8`；625 序列 → 341 唯一 → 自动重发现 best
  6456；LLVM-MCA 作为第二代理（best 516 cycles/2838 uops，排名一致）。
- 门禁覆盖 dct16/dct32/sa8d/sa8d16/interp8；interp8 门禁还实证发现并
  修复了一个整宽存储越界写；
- 关键路径回归在 9 点留一法上为负（M23），逐指令直接延迟也不能排序
  （M24）——静态模型只作粗筛，实机复核是唯一可信排序；
- 剩余阻塞：960 未流片（SVE2p3 `sdot.h` 无法验证）、920B 为 SVE1、
  NEON→SVE256 实机周期目标待 N+2 验收。

性能目标为三档（详见 [docs/09](docs/09-instruction-fusion-analysis.md)）：
同算力 NEON→NEON +30%；NEON/SVE128→SVE256 与 SVE256→SVE256 在鲲鹏
N+2 上 +130%；920B（SVE v1）作为中间验证环境，保留门槛 >10%。

顶级模型困难求助按批次触发：**每完成三个实际优化迭代请求一次**，可写
沙箱（仅允许写对应 round 目录）后台异步执行，不阻塞主体流水线（见
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
