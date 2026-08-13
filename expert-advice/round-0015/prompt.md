你是 AArch64/SVE2 编译器优化与 AI 编译器方向的高级审阅者。请审阅下面
这批 DCT32 优化迭代的结论与数据，反驳其中的错误归因，并给出下一轮
按信息增益排序的 1–3 个实验。只把最终建议写入
`expert-advice/round-0015/` 下的 summary.md / tooling-roadmap.md /
verification.md（不要修改任何源码/manifest/实验产物）。

背景：项目把 x265 DCT32 的 SVE2 kernel 抽象为 op DAG，用布局轴搜索
（manifest 笛卡尔积 + QEMU VL=256 差分 + true-dynamic 指令计数 +
x265 TestBenchLite 门禁）自动寻找指令数更少的实现。黄金标准：
TestBenchLite dct32 5 seed 全 PASS；20k 差分 legacy 签名 7268
（阈值 22528）不变；目标相对内部参考（只允许看聚合指标，源码在
/tmp 下且禁止读取）逐步逼近。

本轮完成的三个迭代：
1. k0_even_sdot 数值探针：s16 域简化 E 链（e0all/e1all 全宽 s16 加，
   revh_d 取 w2all，tee/teo = s2all±revh(s2all)，掩码
   [FFFF,FFFF,0,0] 后直接 sdot.d）在 [-255,255] 单 pass 零失配；
   但两阶段仿真（精确 pass1 → s16 pass2）k0 族分歧 1.34%，远超
   legacy 门禁 0.11%，与 DCT16 legacy_even_full 被否决同机理 →
   全 s16 k0 否决（对称行 E 链 pass2 频繁回绕）。此结论是否可靠？
   内部参考的“0.104% 签名来自 k0 sdot”推断是否应视为错误？
2. k0 重构轴：k0_shared_mul（k0/k16 共享 EEp×64，uzp1s/uzp2s+
   add/sub）+ k0_merge8（tbl2_s32 合并两 pack 的 4-lane 向量后
   一次 rshrnb+uzp1+store8）。row8 下 5352（-38），但 row16 下
   shared=1 反而 +16、merge8 只在 shared=0 时 -36（调度/spill
   差异吃掉理论收益）。是否值得继续保留这两个轴？
3. row_group=16（store_wide）：odd/k2/k4 四 bank 合并，
   narrow16_merged = 2×(uzp1_s32+rshrnb) + tbl2_s16 偶 lane 索引
   直接拼 16 行（跳过 uzp1_s16）+ store16。修复两处硬编码 g 循环。
   best 5390→4944 fused_uop（vector 5854→5416，stack 630→614），
   20k 签名 7268 不变，TestBenchLite 5 seed PASS。全布局搜索
   （--skip-axes，112 候选）确认 best = row16 + k0_merge8 +
   k0_even_sve（无 shared）。相对上游 12710 = 0.389×，距内部
   fused_uop 4827 = 1.024×（fused_adj 4251 = 1.16×）。

请回答：
- 各迭代的归因是否有误？特别是 k0_even_sdot 否决与“row16 是下一步
  正确方向”的判断；
- 下一轮按信息增益排序的 1–3 个实验（当前差距：zip1 +184、tbl +176
  （其中 112 是 narrow16 的 tbl2_s16）、ldr 304（spill）、
  str/st1h 418 vs 内部 192、rshrnb +32）；
- 工具层面：搜索空间里还有哪些轴值得加/哪些应该剪掉；narrow16 的
  tbl2_s16 是否有更便宜的替代；spill 是否值得专门做 live-range
  分析轴。

关键文件（只读）：
- docs/20-dct32-optimization-assessment.md §6.4–§6.6
- docs/10-agent-handoff.md §0.1
- kernels/dct32/manifest.yaml
- optimizer/ir/dct32_op_ir.py / dct32_op_emit.py（row16/k0 轴实现）
- tools/search_sve2_layouts.py（--skip-axes）
- experiments/m31-dct32-k0-sdot/probe_k0_s16.cpp（探针）
- experiments/m30-dct32-search/layout-search-k0sm/results.json
  （112 候选结果）

明确区分“由文件支持的事实”“推断”“需要实验验证的建议”。
