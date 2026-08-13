# Round 0009 上下文（2026-08-14）

round-0008 为 `blocked-expert`（sss 会话未写出 response.md，见
blocked.md）。按 docs/06 §5，本 round 为下一批满额后的重试轮。

## 本批实际优化迭代（自 round-0008 之后，均已完成并验证）

1. `store_merge16` 轴（commit `48572a4`）：rshrnb 偶 lane 布局探针 +
   16-lane 合并存储；upstream 1015→999、legacy 928→908。
2. `pass1_even_factor` 轴（commit `d353cbc`）：pass1 偶数 k 的 EE/EO
   4 项点积（sdot 密度对齐内部 176）；upstream 999→971、legacy
   908→878。
3. `pass1_pack_zip` / `pass2_pack_zip` 轴（commit `35a8645`）：
   zip1/zip2.d + revh 构建替代 tbl2，tbl 62→0、mov 54→0；upstream
   971→887、legacy 878→791。
4. 内部算子 pass2 偶数路径解析（commits `77de3ba`、`db1e626`）：
   saddlb/saddlt + .s 级 zip/revw 构建 s32 EE'/EO'，k=0/4/8/12 用
   mul.s+addp（每 16 输出约 12 条 vs 我们 NEON T8E ~100 条）；发现
   内部用**散布 st1d**（load_offset 偏移表）一次写 16 输出。

## 当前关键文件

- `experiments/m30-dct16-search/iteration.md`：各轴记录与数值
- `experiments/m30-dct16-search/layout-search/results.json`：搜索全量结果
- `experiments/m30-dct16-search/best/best.json`：当前固化 best
- `docs/18-internal-dct-evaluation.md`：内部算子聚合评估（§5-9）
- `docs/16-tool-inventory.md`、`docs/17-n2-validation.md`
- `tools/emit_dct16_sve2_shared.py`：发射器（所有布局轴）
- `tools/search_sve2_layouts.py`：搜索驱动
- `kernels/dct16/manifest.yaml`：布局轴清单

## 当前数值（fused_adj = 向量指令数 − movprfx，VL=256，true-dynamic）

- upstream-exact best：887（quarter/p1k4/odd-quarter/p2k1/nm1/sm16/
  factor/p1zip/p2zip）
- legacy-internal-exact best：791（同左 + legacy/p2k2）
- 内部参考：731（剩余差距 60）

## 已知约束与口径

- 验收黄金标准：x265 TestBench `transforms --nobench`（docs/17 §5）；
  搜索代理容差 legacy ≤0.06%（0.045% 过、0.090% 失败）
- 偶数路径全 s16 sdot 化已被 TestBench 否决（0.090% 分歧）
- 内部算子源码在 /tmp，**禁止读取**；只可用仓库内聚合信息
- 当前指标只含 movprfx 融合；scatter store 等“指令数便宜但实机可能贵”
  的口径问题待评估
