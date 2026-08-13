# round-0014 决策（2026-08-14）

咨询（gpt-5.6-sol max，后台非阻塞，约 1 小时）已产出
`summary.md` / `tooling-roadmap.md` / `verification.md`。本轮咨询按要求
未使用只读模式，直接向固定目录写文件，未生成 `response.md`。
本文件记录采纳与修正。当前基线：DCT32 best **5390**（zero scatter，
内部参考 4827，1.117×），DCT16 best 705（含 4 scatter）/ 零 scatter 895。

## 1. 采纳的判定

- **P0 任务级并行（源码哈希去重 + 有界进程池 + coordinator 原子合并 +
  分阶段持久化缓存）= ACCEPT，下一主项**。候选间无数据依赖，QEMU
  差分与 trace 可并行；先落地 `concurrent.futures.ProcessPoolExecutor`
  + `--workers N`（默认 1 保持 W=1 等价），每候选独立
  `work/<source_sha256>/` 目录、临时文件 + `os.replace`、coordinator
  按 task_index/canonical key 稳定排序合并。成功、确定性失败、
  可重试失败三类缓存分开；`RUNNING` lease 可回收。先跑并发扫描
  W∈{1,2,4,8,12} 校准墙钟/CPU/RSS/IO。
- **P1.1 rewrite 依赖拓扑与规范化剪枝 = ACCEPT（P0 之后）**：
  `k0_even_sve` requires legacy k2/k4、`legacy_even_sve` 至多一次、
  `merge_narrow8`/`tbl2_to_zip` 幂等/可交换规则先入 planner 表；剪枝
  完备性以旧枚举 source 覆盖率 100% 为硬门，未证明前不得在 exhaustive
  模式启用。
- **P1.3 两级差分（2k reject → 20k full）= ACCEPT（explore 模式默认，
  exhaustive 仍跑全量 20k）**：2k 与 20k 使用同一 harness/种子分布只改
  cases；legacy 短门额外加 ±255、边界、stride 16/17/32 与已知回绕
  向量；`fail→pass = 0` 是硬门。
- **P3 流式 trace 计数 = ACCEPT（P0 稳定后）**：普通候选只产出
  counts，原始 log 仅保留失败/top-K/debug；保留离线 replay 用旧 parser
  重建完整 JSON，fast path 与旧 path 逐字段一致。
- **计数口径修订 = ACCEPT**：`score_primary = fused_adj − SG`，SG 单列，
  历史 `fused_adj + 3×SG` 仅作兼容诊断；不同时混排 best。DCT16 705
  （含 4 scatter）与零 scatter 895 必须分别报告。
- **验收口径 = ACCEPT**：报告 headline（DCT32 625 / DCT16 256）与
  实际 up-to-four 键数（781 / 121）两套数字；DCT32 625 候选 8 worker
  ≤5 min、DCT16 256 候选 ≤3 min 为性能目标，达到后即工具优秀。
- **verification.md 协议 = ACCEPT**：W=1 回放、并发扫描、短门召回、
  剪枝完备性、cache 失效矩阵、TestBench 回归均作为实施 Go 门。

## 2. 修正/限定

- **P2 MCA/静态漏斗 = DEFER（只作软排序）**：`docs/20` 已记录 MCA 与
  920B 周期排序不一致；仅当离线回放 dynamic best 召回率 100% 且跨
  两 kernel 稳定后才允许 explore 硬剪，exhaustive 永不因 MCA 丢候选。
- **P4 批量 verify / 多候选 trace = 暂缓实验**：只允许独立实验模式；
  trace 必须一候选一 driver，批量 harness 不得用于动态计数。
- **920B/实机**：并行搜索 worker 不使用远程 ARM；920B 仅做最终候选
  paired+warmup+p50/CI 验收。960 未流片，不承诺实机。
- **gather/scatter**：不作为优化目标（用户裁定），也不为表面指令数
  引入 gather/scatter；禁止 SG 是独立 constraint，不是 score 系数。

## 3. 下一批执行顺序（已修订）

1. **P0 并行搜索**：给 `search_rewrite_sequences.py` 与
   `search_sve2_layouts.py` 加进程池/任务图/分阶段缓存；W=1 回放与旧
   串行结果逐 hash 一致；随后 W 扫描。
2. **P1.1 rewrite 依赖元数据 + 规划剪枝**：验证旧全集 source 100%
   覆盖；目标 DCT32 781→40-100 个实测源。
3. **P1.3 两级差分 + P3 流式计数**（可并行推进）。
4. DCT32 向 4827 收敛：5390 → 目标 <4827；DCT16 与 sa8d 回归不回退。

## 4. 搁置/延后

- MCA 硬剪枝、批量 verify、QEMU 插件/内存内计数：见 §2。
- 学习式 cycles 模型、任意 interpass retile：仍不进入本轮。
