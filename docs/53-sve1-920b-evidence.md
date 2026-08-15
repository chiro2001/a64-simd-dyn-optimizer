# SVE1.0 on 920B：全量证据与定位调整（2026-08-16）

## 1. 结论先行

截至 2026-08-16，**920B 上所有已实测的 SVE1 候选都未超过上游 NEON**，
其中多数慢 1.5–1.9×。920B（Kunpeng 920）上 SVE1 的 2×256-bit 宽度
优势被三种结构代价抵消：uaddv 归约延迟 13cyc、ld1b load→use 延迟
24cyc、以及 SVE1 缺少 zip/uzp/trn/cadd/宽乘（需 tbl/常数模拟）。
因此 **SVE1 在 920B 不是可靠的 30% 算子收益来源**；920B 的优化路径
以 NEON 目标为主（M2 排序已验证 N1 表 transfer 到 920B），SVE1 保留
为 950（SVE2）方向的搜索轴。

## 2. 全量实测证据（paired，CNTVCT）

| kernel | SVE1 候选 vs 上游 NEON | 来源 |
| --- | --- | --- |
| satd8 8x8（gen pack-2） | **1.87× 慢** | reports/sve1-satd8-search-920b-20260816.txt |
| satd8 8x8（pack-2b 并行 uaddv） | **1.82× 慢** | 同上 |
| interp8 ipb8/16/32（sve1 替换） | 1.5–1.97× 慢 | reports/920b-intranet-20260814.txt |
| dct8（原生 SVE1） | 0.75×（慢 33%） | reports/920b-internal-quick-test-20260815.txt |
| dct32（sve1 替换） | 0.93–0.97×（慢 3–8%） | docs/49 |
| idct16（sve1 替换） | 0.85×（慢 17%） | reports/920b-intranet-20260814.txt |
| sa8d16 mixed（SVE1 宽装载+NEON H） | 0.92–0.95× | docs/49 |
| sad16（搜索候选） | ~1.8× 慢 | round-0023 context |

## 3. 为什么 SVE1 在 920B 赢不了（成本表 v1 解释）

benchmarks/sve-timing-920b/timing-sve1-ago.json：

| 现象 | 数值 |
| --- | ---: |
| add/sub 单指令吞吐 | 0.50 cyc/op（不慢） |
| uaddv 归约延迟 | 13.02 cyc |
| ld1b load→use 延迟 | 24.03 cyc |
| tbl（SVE1 唯一通用 permute） | 3.00 / 0.69 |
| SVE1 无 zip/uzp/trn/cadd/smullb | 需 tbl+常数模拟，链长翻倍 |

候选实测 IPC：NEON satd8 ~3.5、SVE1 pack-2 ~1.9——SVE1 候选的指令
数没少（92 vs 90），但 permute/归约/load-use 依赖链让有效并行度减半。

## 4. 预测器校准结论

AGO 排序器跨 ISA 绝对预测不可用（NEON 过估 5.2×、SVE1 过估 1.45×，
方向错误）；SVE1 候选一律以 920B CNTVCT paired 为裁决。NEON 语料
内部排序（M2 门）仍然有效：N1 81 对 acc=0.975、920B acc=1.000。

## 5. 定位调整（docs/52 §4.3 更新）

- 920B：主攻 NEON 目标；SVE1 仅保留为“已实测非劣才注入”的特例；
- 950（SVE2）：SVE1/2 方向继续（dct8 +48%、ivpp16 +47%、c1c2 +81%
  均来自 SVE2/950 实测）；
- AGO 资源优先：NEON cover 搜索 + 真实视频热点的算子回归矩阵 +
  costCoeffNxN 等已注入内核的进一步优化。
