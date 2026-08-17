# Round 0029 context（2026-08-17，git df3ca35）

## 最新事实

- 950（SVE2 2x256）sve16 双组 dct16/dct32 实机：6-seed TestBenchLite
  gcc16/clang22 全 PASS；dct16 比 SVE 慢 2.19x（gcc16）/2.06x
  （clang22）、比 NEON 慢 3.49x/3.29x；dct32 比 SVE 慢 1.70x/1.49x、
  比 NEON 慢 2.30x/1.86x。报告：
  `reports/950-sve16-dual-lane-20260817.txt`（DB 8 行已入库）。
- 静态 fused_uop（同口径）：dct16 sve16 640 vs op895 952（-33%）；
  dct32 sve16 897 vs opbase 1129/op4032 2110（-21%/-57%）。静态赢、
  实机输。
- 950 op-backend 对照（同机）：dct16 op895 p50~172 vs sve~250/
  neon~159（+45% vs SVE）；dct32 opbase ~2117 vs sve~2179/neon~2280
  （parity）；dct32 op4032 历史 +71%/+40%（非 bit-exact，等 C ref）。
- 950 E2E：dct8/16/32 opbase 注入 30f +0.79%（bit-exact，
  bootstrap95 [54,98] ms）；100f + op4032 策略待用户。
- 发布集（docs/73）：best9-minus-remain + dct IR，N1 +2.14~2.25%、
  710 +2.03~2.36%、920B +2.63~2.66%，均 bit-exact、CI 不跨零。
- M4 核验器 `tools/m4_declaration.py`：3/4 不回退、3/2 额外 ≥0.5pp；
  只差 950 E2E → INCOMPLETE。
- NEON→SVE256 覆盖（docs/77，17 候选）：mc/sad/ssd/psy-cost-16x16/
  satd-16（含 8x16/16x8）/sa8d16/interp8 9 形状 + dct16/32；全门禁
  （0-NEON + QEMU vq=2 200 轮 0 失配）；未做其他 kernel 的 950 实机。
- ranker：pooled-pair tau 0.871、acc 0.917、regret 1.53pp（131 行
  训练集）；带会弃权原型（coverage 83%）。
- 四机成本模型：N1/920B LOOCV 0.884/0.907；710 小样本；950 待数据。
- 历史教训（DB/报告）：satd 纯 SVE 实机 +1.8% 慢；i8mm 静态赢 E2E
  消失；sao SVE2 为 QEMU-only；纯 SVE dct16/32 在 710 E2E -2.63%。

## 关键文件

- `docs/72`（16-lane 发射器设计）、`docs/77`（dual-sve16 覆盖+踩坑）
- `reports/950-sve16-dual-lane-20260817.txt`（本次负结论）
- `data/kernel-test-db.csv`（264 行权威 DB）
- `optimizer/ir/dual_sve16.py`（双组 lowering 引擎）
- `tools/build_preload_so.py`（AGO_IR_SVE16 打包/注入）
