# best9-minus-remain + dct IR 冻结发布（2026-08-17）

## 1. 冻结内容

发布集 = **best9 − cost-coeff-remain** + **dct16/32 IR 候选**
（`AGO_IR_DCT=1`；dct16/32 走 `best_ir_neon8.cpp`/`best_ir_sve8.cpp`
按机选择，docs/65 §5-7）。

- 本地 bundle：`build/ablate-best9-noremain-ir-dct-{n1,710}-iab-*`
  （注入法 compile-in；`interleaved-inject-ab.sh` 单/多标签模式）；
- 基线：x265 b81f650，`build/x265-8-gcc`（N1 NEON-only / 710
  SVE2 VL128）；
- 输入：真实 1080p 100f 片段 B（`/tmp/real_1080p_100f_b.yuv`），
  单核 taskset -c 0；
- 门禁：注入法（LD_PRELOAD 在 N1/920B 无效，已弃用），同机码流
  md5 bit-exact，随机交错 6 对/批，bootstrap95 CI。

## 2. 冻结证据（双批 × 双机，2026-08-17）

diff = base − opt，>0 = 候选更快；Δ% = 相对 base。

| 机器 | 批次 | diff 中位 | Δ% | bootstrap95 | md5 |
| --- | --- | ---: | ---: | ---: | --- |
| N1 | 1 | +746.5 | **+2.25%** | [624.0, 935.5] | 07450372… |
| N1 | 2 | +705 | **+2.14%** | [603.5, 959.5] | 07450372… |
| 710 | 1 | +515.5 | **+2.03%** | [474.5, 641.5] | 21500eb4… |
| 710 | 2 | +602.5 | **+2.36%** | [489.0, 677.5] | 21500eb4… |
| 920B | 1 | +584.0 | **+2.63%** | [510.5, 672.5] | 1600c2fa… |

可加性（dct IR 相对 best9-noremain 的增量）：N1 第二批
+0.82% [222, 653]；710 第一批 +0.71% [61, 245]、第二批 +1.10%
[133, 331]——CI 均不含 0。920B 同日同法 best9-noremain 单臂
+2.20%，组合 +2.63%（约 +0.4pp，跨轮次对比）。

来源：`reports/n1-best9-noremain-ir-dct-freeze-20260817.txt`、
`reports/710-best9-noremain-ir-dct-freeze-20260817.txt`、
`reports/920b-best9-noremain-ir-dct-interleaved-20260817.txt`。

## 3. 发布规则

- **默认发布**：best9-minus-remain + dct IR，四机（N1/920B/710/950）
  构建时按 `AGO_IR_DCT=1` 选 dct16/32 IR 候选；remain 一律不注入
  （920B 复核 -0.23% 回归，docs/70 §2）。
- **未冻结**：950 100f 复测 + op4032 策略（非 bit-exact，仅版本化
  opt-in）；sve16 16-lane 候选（docs/72）待 950 实机对比后再并入。
- 复测：`scripts/interleaved-inject-ab.sh <host> labelA labelB 6`
  （label = best9-noremain-ir-dct），或独占节点重跑同 bundle。

## 4. 后续

- M4 独立声明：本发布集为“不回退”基座；需 950/920B 同口径数字 +
  至少两机额外 ≥0.5pp 增量后按 docs/52 声明。
- 冻结状态维护：任何后续改动（新增 kernel/模板）先消融验证再并入
  发布集，回退以本文件为基线。
