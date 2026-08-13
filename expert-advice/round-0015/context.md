# Round 0015 context（2026-08-14 晚）

批次：k0_even_sdot 否决（probe）→ k0 重构轴（shared/merge8）→
row16/4944（3 个实际优化迭代）。

## 本轮结果速览

| 迭代 | 结论 | 证据 |
| --- | --- | --- |
| k0_even_sdot | 否决 | 探针 s16 链正确但两阶段仿真 1.34% 回绕；docs/20 §6.4 |
| k0_shared_mul | row8 -24；row16 反增 16 | docs/20 §6.5/§6.6 |
| k0_merge8 | row8+shared 5352；row16+shared=0 → 4944 | docs/20 §6.6 |
| row_group=16 | 5390→4944（-8.3%） | 20k 7268 签名、lite 5 seed PASS |

## 关键数字

- upstream 12710；内部参考 fused_uop 4827 / fused_adj 4251（聚合
  指标，代码禁读）。
- best 4944：vector 5416 / movprfx 472 / stack 614 / sg 0；
  0.389× upstream，1.024× 内部 4827。
- 差距（vs 内部 4251 直方图，向量 raw）：zip1 336 vs 152、
  tbl 176 vs 0（112 为 narrow16 tbl2_s16）、ldr 304 vs 0、
  str+st1h 418 vs 192、rshrnb 288 vs 256、sdot 1344 vs 1376
  （已持平/略优）、ld1h 446 vs 864（已大幅优）。

## 命令

- 差分：qemu-aarch64 -L /usr/aarch64-linux-gnu -cpu max,sve-max-vq=2
  verify 20000（legacy 阈值 22528，实测 7268）
- lite：scripts/build-testbench-lite.sh <obj> build/x265-8-testbench
  -- --gate dct32 --seed 0x12345678
- 搜索：python3 tools/search_sve2_layouts.py --backend op --kernel
  dct32 --workers 8 --skip-axes layout,odd_lowering,narrow_batch,
  constant_layout --outdir experiments/m30-dct32-search/layout-search-k0sm

## 下一轮候选方向（待审阅）

1. narrow16 的 tbl2_s16 替代（uzp1/trn 组合或 store 侧合并）；
2. spill（ldr 304）的 live-range/调度轴；
3. 常量预排列/置换折叠（zip1 336、revh/revw 打包链）；
4. k4 rev8 tbl（64）吸收。

## 历史建议状态

round-0014 decision 已采纳：并行→剪枝→漏斗；均已落地（--workers、
layout_prune、--skip-axes、两级差分）。
