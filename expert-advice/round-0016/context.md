# Round 0016 context（2026-08-14 深夜）

批次：sdot_indexed（4514）→ odd_from_k0packs（4480）→
k2k4_from_packs（4234），3 个实际优化迭代。

## 结果速览

| 迭代 | 效果 | 证据 |
| --- | --- | --- |
| sdot_indexed | 4682→4514（ld1h -168） | docs/20 §6.10，探针 probe_sdot_lane |
| odd_from_k0packs | 4514→4480 | docs/20 §6.11，探针 probe_odd_from_packs |
| k2k4_from_packs | 4480→4234（leaf DCE） | docs/20 §6.12，探针 probe_k2k4_from_packs |

## 关键数字

- best 4234：vector 4694 / movprfx 460 / stack 442 / sg 0；
  0.333× 上游；fused_uop 0.877× / fused_adj 0.996× 内部参考。
- 20k 差分 legacy 签名 7268（0.0355%，阈值 22528）；lite 5 seed PASS。
- 搜索：layout-search-k2k4，608 候选全过，best = row16 + merge8 +
  shared_mul + epack + sdot_indexed + odd_from_k0packs +
  k2k4_from_packs。

## 剩余差距（内部 4251 fused_adj 口径）

vector 4694 vs 内部 4731（已低于）；spill（stack 442 vs 0）、
打包置换（zip1 ~300、tbl 96、revh/revw/trn ~200）、存储。

## 环境

920B（SVE1）存活：chiro@124.70.206.229，可跑 best_sve1 变体；
960 未流片；倚天710（SVE2）此前 1 小时实例已释放。

## 命令

- 差分/lite/搜索命令同 round-0015。
- 本轮已推送 GitHub main（13a42b5）。
