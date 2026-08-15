# AGO 项目最终状态（2026-08-16）

## 1. 目标与口径

- 目标：AGO 框架在 N1、920B 达成 15% E2E / 30% 算子平均提升；
- 约束：不动 x265 编码流程，仅算子层面（dispatch 替换/注入）；
- 测量：真实 1080p 30 帧，单核单线程，5+5 paired，码流同机 bit-exact。

## 2. 最终注入集 best9（920B/N1，29 槽）

| 家族 | 内容 | 实测收益 |
| --- | --- | --- |
| 熵族 | c1c2/remain/ccn/scan | 回放 +9.7% ~ +30% |
| satd | 8x8/16x16/8x16/16x8/32/64 | 920B 1.3-1.63x |
| interp8 vps | 6 形状 | 920B 1.30-1.81x |
| sa8d16 | 16/32/64 | ~1.0x |
| saoCuStatsBO | 64 宽行 | +20% |

## 3. E2E 结果（bit-exact）

| 平台 | best9 | 距目标 |
| --- | ---: | --- |
| 920B | **-2.10%** | 13.1pp |
| Neoverse-N1 | **-1.62%** | 13.4pp |

## 4. 算子平均（docs/56 审计）

item-level 39.1%（达标）、kernel-level 26%、占比加权 21%。

## 5. 框架完成度（M0-M4）

- M0 垂直切片 / M1 前端+pass / M2 排序门（N1 acc 0.975、920B
  acc 1.000、N1→920B transfer）/ M3 模板（PEXT/DFA 穷举证明）+
  ISA 审计加固 / M4 --backend ago + --rank-by ago；
- 证据性排除：SVE1 satd8/sa8d8/dct/quant/interp（结构缺项）、
  hps/vsp/psy-cost（无外链收益）、sad（无候选）。

## 6. 剩余路径

- 950（SVE2）：best9-950（21 kernel/41 槽）bundle + freeze 脚本 +
  语义抽查就绪，等内网窗口（唯一有证据可继续的方向）；
- 920B/N1：dispatch 级已穷尽；非 dispatch 热点（encodeBin/
  codeCoeffNxN/signBitHiding，合计 ~6%）受约束不可动，其中
  signBitHiding 已通过 scanPosLast 注入间接受益。

## 7. 关键证据索引

- 发布：docs/55（best9/best9-950 手册）
- 审计：docs/56（目标三口径）、docs/53（SVE1 全量证据）
- 报告：reports/ 下 e2e-best6b-perf、n1-e2e-best8、sao-bo-inject、
  satd-8x16-16x8-inline、interp8-vps-inline-inject、
  helper-bl-scan、sve1-satd8-search、ago-m2-expanded-ranking、
  ago-m3-pext/dfa-template
- 测试：ago 26、ISA 门禁 10（仓库根）、test_select demo 全绿。
