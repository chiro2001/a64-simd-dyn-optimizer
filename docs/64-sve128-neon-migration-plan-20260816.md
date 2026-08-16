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

dct32 同样全量确认：op 轴全部变体（含最佳 r16k2epsi+m8 等）在
VL=128 下均 ~99.93% lanes 失配（20.47M/20.48M）。两 kernel 的迁移
缺口全景已齐（QEMU `sve-max-vq=1` + VL=16 verifier，可复现）。

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

1. **基线已落地（2026-08-16）**：`tools/emit_dct16_vl128.py` /
   `tools/emit_dct32_vl128.py` 直接提取上游 8-lane E/O+sdot 结构
   （upstream-exact 于任意 SVE VL），并实现 fused 四行 quarter
   变体（单循环、无中间 O/EO/EEE 数组）；
2. 在 QEMU `sve-max-vq=1`（VL=128）下已测：

   | 候选 | 结构 | fused_uop (-O3) | stack_vector | 20k/200k 差分 | TestBenchLite 5-seed |
   | --- | --- | ---: | ---: | --- | --- |
   | dct16 | upstream | 1565 | 270 | 0 | - |
   | dct16 | fused | **1392** | 95 | 0 / 0（51.2M lanes） | **PASS**（QEMU vq=1） |
   | dct32 | upstream | 10130 | 2959 | 0 | - |
   | dct32 | fused | **8421** | 844 | 0 / 0（204.8M lanes） | **PASS**（QEMU vq=1） |

   候选文件：`kernels/dct16/candidates/best_sve2_vl128.cpp`、
   `kernels/dct32/candidates/best_sve2_vl128.cpp`（需 `-O3` 编译）；
   `build_preload_so.py --vl 16 --isa sve2` 已接入选择（并修正
   VL128 过滤的字节/位单位不一致）；
3. **Yitian710 实机已测（2026-08-16）**：Neoverse-N2、SVE2
   VL=128（svcntb=16，即 4×128 NEON / 2×s64 SVE lane）；
   LD_PRELOAD bundle（`--isa sve2 --vl 16 --opt=-O3`）：
   - 槽位替换确认（`benchmarks/preload_verify_dct.cpp`）：
     dct16/dct32 slot changed=1，200 轮差分 0 失配；
   - kernel 级周期（cntvct，原→候选）：dct16 13→11
     （**-15.4%**）、dct32 88→82（**-6.8%**）；
   - 30f E2E（taskset -c0，3+3）：9248→9241ms 中位，**≈0**
     （bit-exact md5 一致）；符合预期——dct16 上游已很快、
     dct32 该机占比 ~1.4%，E2E 期望收益 ~0.1% 在噪声内。
4. 下一步：dct32 继续叠加 k 族结构轴（k0_epack/k2k4 的 8-lane
   版），以及 NEON lowering（920B/N1）。

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

### IR 宽度参数化（第一步，2026-08-16 已实现）

见 docs/65（IR 粒度审计）。`Shape`/`ValueLayout` 增加 `vscale`
（默认 1）+ `concrete_lanes(vl_bits)`：`lanes` 表达为每 128-bit
lane 数 × vscale，宽度成为 lowering 属性。这是 8-lane 发射器与
NEON lowering 的语义基础；后续把 permute 索引改为 lane 索引表达式。

## 4. 预期与风险

- SVE128：结构赢点（sdot.d/smullb）在 8-lane 下仍成立，但上游
  dct16_sve 已是 VL=128 原生（12.92 ticks），SVE2 需实测反超；
- NEON：920B/N1 上游是手写 asm，历史 NEON 候选未非劣；quarter/
  oddq 结构轴是主要机会，需 paired 裁决；
- 风险：8-lane 蝶形置换重推导易错，以 20k + TestBenchLite 为门。
