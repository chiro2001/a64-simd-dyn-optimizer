# SVE256 图级候选 → SVE128 / NEON 迁移计划（2026-08-16）

## 1. 迁移基线与缺口（已实测）

同一计算图（canonical dot）的 SVE256 op 后端候选在 VL=128 下不可用：

| 候选 | VL=256 | VL=128 20k 失配率 |
| --- | ---: | ---: |
| dct16 op895 | 895 fused_uop / 0 失配 | **99.97%**（first-diff idx=0） |
| dct32 opbase | 8114 / 0 失配 | **99.94%**（first-diff idx=0） |

原因：op 发射器把「16 元素行」固化为 16-lane 向量（`svptrue_b16`
全宽）；VL=128 下 SVE 只有 8 个 s16 lane，每行只算了一半。

全量确认（2026-08-16）：dct16 op 轴全部变体在 VL=128 下均
~99.97% 失配（legacy+sve 1079 fused_uop 但 5.1M lanes 失配）——
与单点测量一致，迁移缺口覆盖全部结构轴。

## 2. 为什么“同一算法”但代码不可直接迁移

- 计算图（dot/butterfly/round/narrow）与 VL 无关——这是统一的前提；
- 但 **lowering 的向量宽度是 VL 相关的**：16-lane 的 rev/tbl/zip
  蝶形置换表在 8-lane 下需要重新推导（`rev16→rev8`、16-lane
  `tbl2` 切片 → 8-lane 切片、dot 项数减半）；
- 因此迁移不是“改一个 flag”，而是**把 op DAG 按 8-lane 行切分
  （row-split）重新 lowering**，或直接用 NEON（128-bit 固定）实现
  同一 DAG。

## 3. 迁移方案

### 3.1 SVE128（Yitian710）

1. 扩展 dct16/dct32 op 发射器：新增 `lanes_per_row=8` 模式——
   每 16 元素行拆成 2 个 8-lane 向量（load/store 拆半、蝶形置换表
   换 8-lane 版本、dot 项数相应调整）；
2. 在 QEMU `sve-max-vq=1`（VL=128）下重跑 dct16/dct32 op 轴网格
   （复用 search_dct*_axes.py），找 VL=128 最优；
3. 门禁：20k 差分（`gen_verify --vl 16`）+ TestBenchLite（VL=16）；
4. 实机：Yitian710 E2E（dct16/dct32 在该机 profile 占比：dct32
   ~1.4%、dct16 上游 SVE1 已快于 NEON，SVE2 VL=128 是否有结构赢点
   需实测裁决）。

### 3.2 NEON（920B/N1）

1. 为 op DAG 增加 **NEON lowering**（canonical dot 表已列
   `vmull_vmlal`/`vmull_u8_s8` 等）：dct16/32 的 dot/butterfly 用
   NEON 128-bit 指令重新发射（8-lane s16 = 全宽）；
2. 复用 dct16 quarter+oddq、dct32 rg16+k2k4 的结构轴在 NEON 网格
   寻优；
3. 门禁同 SVE128；实机 920B（dct32 占比 ~2.9%）、N1（dct16 ~2.4%）
   E2E。

### 3.3 工具侧

- `gen_verify --vl 16` 已就绪（VL=128 验证）；
- 测量链已支持 VL=128：`measure(qemu_vq=1)` 替换 QEMU
  `sve-max-vq=1`，`search_dct*_axes.py --vq 1` 自动生成 VL=16
  verifier 并测量（fused_uop 仍有效，20k 门禁按 VL=16 判定）；
- emit_dct*_best.py 增加 `--vl 16`/`--neon` 输出模式。

## 4. 预期与风险

- SVE128：结构赢点（sdot.d/smullb）在 8-lane 下仍成立，但上游
  dct16_sve 已是 VL=128 原生（12.92 ticks），SVE2 需实测反超；
- NEON：920B/N1 上游是手写 asm，历史 NEON 候选未非劣；quarter/
  oddq 结构轴是主要机会，需 paired 裁决；
- 风险：8-lane 蝶形置换重推导易错，以 20k + TestBenchLite 为门。
