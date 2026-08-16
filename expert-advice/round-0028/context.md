# Round 0028 context（2026-08-17，git b6228a9）

- 发布集（docs/73）：best9-minus-remain + dct IR。N1 +2.14~2.25%、
  710 +2.03~2.36%、920B +2.63~2.66%（同轮 dct IR 增量 +0.59%，
  CI[74.5,169]），均 bit-exact、CI 不跨零；950 待用户提供实机。
- M4 核验器 tools/m4_declaration.py：DB 判定不回退 3/4、额外
  ≥0.5pp 2/2；950 缺数据 → INCOMPLETE。
- P4 模板（butterfly-quarter）：SVE2 完整 dct16/32 + NEON 完整
  dct16/32（51.2k/81.9k 0 失配），dot-fusion 证明 harness
  QEMU vq=2 穷举+随机 0 失配；9 门禁全过。
- ranker（短期项 6 关闭）：pairwise-logistic family 留出
  acc 0.917 / pair-weighted tau 0.871 / regret 1.53pp，18 组、
  31 可分辨对；会弃权原型 λ=10% coverage 83%。
- 四机成本模型：N1/920B LOOCV Spearman 0.88/0.91，710 部分，950
  待数据。
- interp8：vsp/hps/vss 全闭环；i8mm hpp 8x8/16x16/32x32
  fused_uop 35/33/62（IR 版 243/1013/3275）。
- saoCuOrg：E0/B0/E1 的 SVE2 版 20k 0 失配（fused_uop 168/57/
  129，NEON seed 269/219/517）；E1_2Rows/E2/E3 SVE2 待续。
- DB 174 行、契约语料 128 行（含 6 cuorg region）、ranker 训练
  115 行；回归 tools 32 / ago 43 / ir 50。
- 950 E2E：dct8/16/32 opbase 注入 30f +0.79%（bit-exact，CI 不跨
  零）；100f 复测 + op4032 策略放行待用户。纯 SVE（VL128）
  dct16/32 已全门禁但 710 E2E -2.63% 默认不注入。
