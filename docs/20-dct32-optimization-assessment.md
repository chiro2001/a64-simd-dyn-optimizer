# DCT32 优化评估（2026-08-13，v1 管线打通）

## 1. 基线（QEMU VL=256）

| 实现 | dynamic | vector | movprfx | fused_uop |
| --- | ---: | ---: | ---: | ---: |
| 上游 x265::dct32_sve（128-bit 风格） | 13362 | 12710 | 0 | 12710 |
| 工具生成 v1（16-lane SVE2，叶子缓冲） | 21218 | 9974 | 1032 | 8942 |
| **工具生成 v2（行主序，叶子不落缓冲）** | 16768 | 8854 | 1664 | **7190** |

- v2 相对上游 **-43.4%**（减半口径 ≈6355，还差 ~13%）；相对内部参考
  4251/4827 仍有约 2.4-2.9k 差距，作为下一阶段目标。
- 正确性：2 万例差分 0（vs `x265::dct32_sve`）；`TestBenchLite --gate dct32`
  PASS（MBDstHarness + C 参照 `dct32_c`）。

### v2 行主序轴（layout=v2）

v1 的 k 循环对同一叶子按 k 重复加载（每 pass 约 1800 条 leaf 重载）。
v2 改为逐行：叶子留在寄存器里，一行内完成全部 32 个输出
（16×sdot+uaddv、8×mul+addv、4×mul+4-lane addv、4×标量 t8_even），
彻底取消叶子缓冲与重载。这是 manifest 的新搜索轴
`layout: [v1, v2]`，工具自动枚举并排名。

### 半数硬门已落进工具（2026-08-13）

搜索在 manifest `targets.baseline_fused_uop / halve_gate` 下自动计算
`baseline_ratio` 并打标（HALVED / near-gate / NO）：
- dct32：v2 = 7190 / 12710 = **0.566（near-gate）**，v1 = 0.704（NO）；
- sa8d16：189 / 373 = **0.507（near-gate）**，与 round-0010 的
  “189 > ⌊373/2⌋=186”批评一致；
- sa8d：79 / 97 = 0.814（NO）。

后续每个搜索输出都带该门标；`fused_uop` 仍是排名主指标，实机 cycles
作为最终验收（960/950 可用后）。

## 2. v1 结构（tools/emit_dct32_sve2_shared.py）

- 每行 32 s16 = 2 个 16-lane 寄存器；E/O = `lo ± rev(hi)`（16-lane）。
- E 必须 s32（pass2 输入可超 s16）：`unpklo/unpkhi` 分别加宽 lo/rv 再相加；
  注意 **`svaddlb/svaddlt` 是每 128-bit 段的偶/奇 lane**，不是低半/高半。
- EE/EO = E ± rev16(E)；EEE/EEO = EE ± rev8(EE)；EEEE/EEEO = EEE ± rev4(EEE)
  （全部 16-lane SVE 指令，tbl 实现半反折）。
- k 族：
  - k 奇：O 16-lane `sdot .d`（1 条 16 乘积）+ `uaddv` 归约；
  - k≡2 mod4：EO s32 8-lane `mul` + `uaddv`；
  - k≡4 mod8：EEO s32 4-lane `mul` + 4-lane `uaddv`（VL=256 下 s32 有 8 lane，
    必须用 `whilelt_b32(0,4)` 谓词，否则把未定义 lane 计入）；
  - k≡0 mod8：EEEE/EEEO 2-term 标量（t8_even 系数 = g_t32 行 0/8/16/24 前两列）。
- 叶子落内存缓冲（sizeless 类型不能进数组）；缓冲大小按 s32 计（踩过坑）。

## 3. 下一步优化方向（按预期收益）

1. **常量预排列 + [C|C] 双份**：k 奇 16-term dot 目前每条 sdot 只产出 4 个
   partial 再用 uaddv 归约；改为把 8-lane 叶打包两行/寄存器（DCT16 pass1
   已验证的形态），sdot 一次算两行的 partial，去掉逐行 uaddv。
2. **k≡0 族向量化**：t8_even 4 行分组 vmul（上游形态），替换标量 2-term。
3. **pass2 寄存器分块**：叶子缓冲全部落内存导致大量 ld/st；按 4 行分组
   流水化（上游 `i += 4` 结构）减少回访。
4. **movprfx 1032 条**：cadd/mul 链的破坏性目的寄存器布局优化
   （融合后不计入 fused，但影响实机发射）。

目标：先把 fused_uop 压到 ~7000，再向 6355（减半）逼近；实机 cycles 等
950/960 可用后校准。

## 4. 内部手工最优 DCT32 对照（2026-08-13，仅聚合指标，代码不入库）

> 信息安全说明：与 docs/18 的 DCT16 处理一致，内部算子只在本机 /tmp
> 评估，仓库只记录量化指标与方向结论，不收录任何内部代码/反汇编细节。

同口径（QEMU VL=256、true-dynamic、单次调用 stride=64）三方对比：

| 指标 | 上游 dct32_sve | 本项目 v1 | 内部参考 |
| --- | ---: | ---: | ---: |
| dynamic total | 13362 | 21218 | 5381 |
| 向量 raw | 12710 | 9974 | 4731 |
| movprfx | 0 | 1032 | 480 |
| fused_adj | 12710 | 8942 | **4251** |
| scatter_gather（st1d） | 0 | 0 | 192 |
| fused_uop（sg +3/条） | 12710 | 8942 | **4827** |

- 内部相对上游 fused_adj = **0.335x**（远低于“减半”标准 0.5x）；
  我们 v1 为 0.704x，差距主要在 v1 的叶子缓冲往返与窄化/存储形态。
- 内部指令构成（仅计数，向量 4731）：sdot 1376、ld1h 864、movprfx 480、
  uzp1 480、add 272、rshrnb 256、st1d 192、zip1/zip2 152+152、sub 144、
  rev 112、saddlb/saddlt 32+32、mul 32。
- 方向结论（可工具化，不涉内部实现细节）：
  1. **常量预排列 + [C|C] 双份**：ld1h 864 表明常量以预排列/双份形式
     供 sdot 直接消费，省掉叶侧重排；
  2. **rshrnb 窄化链**：256 条窄化覆盖 2048 输出（0.125/输出），v1 的
     逐行 uaddv+标量舍入应替换为批量 rshrnb+连续 st1h；
  3. **sdot 主导**（1376）：奇数/偶数 k 都走 dot，v1 仅奇数 k 走 dot；
  4. **禁止 scatter**（用户裁定）：内部 192 条 st1d 在口径上 +576 uop，
     本项目必须用 uzp1 连续存储替代，不追表面指令数。

按减半口径（12710→6355），v1（8942）还需再压 ~29%；参考内部的方向
（常量预排列 + 批量窄化 + 全 dot 化）是主要路径。
