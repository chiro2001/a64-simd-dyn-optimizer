# Iteration: DCT32 row16 store merging + k0 axes（2026-08-14 晚）

## 假设

1. k0 族全 s16 sdot 化（k0_even_sdot）可逼近内部参考 → **被证伪**：
   两阶段仿真（精确 pass1 → s16 pass2）k0 族 1.34% 回绕，远超 legacy
   门禁 0.11%（docs/20 §6.4；与 DCT16 legacy_even_full 被否决同机理）。
2. row_group=16 + 四 bank 合并存储可显著削减 8-lane store 与 uzp1
   → **成立**：5390 → 4944 fused_uop（-8.3%）。
3. k0_shared_mul / k0_merge8 有独立收益 → **部分成立**：row8 下
   shared -24；row16 下 shared 反增 16（调度），merge8 在 shared=0
   时 -36。

## 变化

- `optimizer/ir/dct32_op_ir.py`：k0_shared_mul / k0_merge8 轴；
  row16 支持（g 循环 `32//row_group`，odd/k2/k4 四 bank）；
  narrow16_merged；row16+tbl2 归一化为 zip。
- `optimizer/ir/dct32_op_emit.py`：uzp2s、tbl2s（索引
  `[0,1,2,3,8,9,10,11]`）、narrow16_merged（tbl2_s16 偶 lane 索引）、
  pg16h；g 循环修复。
- `tools/search_sve2_layouts.py`：--skip-axes（op 后端无效轴剪枝，
  24k→768 组合）。
- `kernels/dct32/manifest.yaml`：新轴 + layout_prune。

## 正确性

- 20k 差分 legacy 签名 7268（0.0355%）与旧 best 逐位一致；
- TestBenchLite dct32 5 seed 全 PASS；
- 探针 `experiments/m31-dct32-k0-sdot/probe_k0_s16.cpp`：
  [-255,255] 单 pass 零失配，全范围两阶段 1.34%（否决依据）。

## 性能（QEMU VL=256 true-dynamic）

| 候选 | fused_uop | vector | movprfx | stack |
| --- | ---: | ---: | ---: | ---: |
| best_op_r8（旧） | 5390 | 5854 | 464 | 630 |
| row16+shared | 4960 | 5416 | 456 | 562 |
| **row16+merge8（新 best）** | **4944** | 5416 | 472 | 614 |
| 内部参考 | 4827 | 4731 | 480 | — |

后续迭代（同日深夜）：k0 先发射 → 4874；pass1 专用 k0 E-pack →
**4682**（0.368× 上游，fused_uop 口径**低于内部 4827**；lite 5 seed
PASS；全 pass E-pack 因 pass2 回绕在 lite FAIL，已记录 docs/20 §6.8）。

再后续（2026-08-14 深夜）：**sdot_indexed 轴**（SVE2 indexed SDOT
常量对打包共享，探针 probe_sdot_lane.cpp 实证语义）→ **4514**
（0.355× 上游，距内部 fused_uop 4827 = 0.935×、fused_adj 4251 =
1.062×）；全布局搜索 288 候选确认 best 含 k0_shared_mul=1（与
sdot_indexed 交互由负转正）；lite 5 seed PASS、20k 签名 7268 不变。

再再后续：**odd_from_k0packs 轴**（odd 切片复用 k0 的 lo/rv pack，
pack(rv) 等价配对 + L−R 子，探针 probe_odd_from_packs）→ **4480**；
**k2k4_from_packs 轴**（k2/k4 切片从 L/R pack 派生，pass2 leaf
E16 族链 DCE，探针 probe_k2k4_from_packs）→ **4234**（0.333× 上游，
fused_uop 0.877×、fused_adj 0.996× **均低于内部参考**）；搜索
608 候选确认；lite 5 seed PASS、20k 签名 7268 不变。

相对上游 12710 = 0.333×；距内部 fused_uop = 0.877× / fused_adj =
0.996×。
固化 `kernels/dct32/candidates/best_op_r16.{cpp,S}`。

## 下一步

- narrow16 tbl2_s16（112）替代、spill（ldr 304）、zip1 打包链
  （336 vs 内部 152）、k4 rev8 tbl（64）——按 round-0015 建议排序。
