# 多 ISA kernel 盘点与 dct 管线推广（2026-08-16）

## 1. 上游多 ISA 家族清单（third_party/x265/source/common/aarch64）

| 家族 | 文件（NEON / SVE / SVE2） | 结构类型 | dct 管线可迁移性 |
| --- | --- | --- | --- |
| dct/dct16/32 | dct-prim.cpp / dct-prim-sve.cpp | 蝶形+dot | ✅ 已完成（fused8 DAG + 多目标） |
| **pixel satd/sa8d** | pixel-prim.cpp / pixel-prim-sve2.cpp（SVE1 无 satd） | **hadamard 蝶形+置换+reduce** | ✅ **PoC 完成（本轮）** |
| sao | sao-prim.cpp / sao-prim-sve.cpp / sao-prim-sve2.cpp | 统计累积（edge stats） | ◐ 可提取 DAG，但非蝶形/dot，收益点不同 |
| filter/ipfilter | filter-prim.cpp / filter-neon-dotprod/i8mm / filter-prim-sve.cpp | FIR 抽头+饱和 | ◐ 可提取，结构差异大 |
| mc | mc-a.S / mc-a-sve2.S | 加载/平均/置换（asm） | ◐ asm 侧，先 C++ 族 |
| sad | sad-a.S / sad-neon-dotprod.S | 差分+reduction（asm） | ◐ asm |
| ssd | ssd-a.S / ssd-a-sve.S / ssd-neon-dotprod.S | 差分+平方和（asm） | ◐ asm |
| pixel-util | pixel-util.S / -sve / -sve2 / -bitperm | 各种 util（asm） | ◐ asm |
| blockcopy/p2s/intrapred | blockcopy8.S / p2s(-sve).S / intrapred.S | 拷贝/置换/预测 | ◐ 低优先 |

## 2. 首个非 dct PoC：SATD 8x8

选型理由：NEON 与 SVE2 版本共享同一 hadamard 算法图（差异只在
指令选择）；已有候选 `kernels/satd-8/candidates/best_sve1.cpp` 是
VL 无关纯 NEON（此前 best9-950 的 satd-8 SVE2 候选有 VL=256 假设，
本候选不受影响）；结构最接近 dct（蝶形）。

落地：
- `optimizer/ir/satd8_op_ir.py`：宽度无关 DAG（load_diff → hadamard
  垂直蝶形 → trn 置换 + abs/abd → vmax/vadd → vpaddl/vpadal/vaddv），
  自带 `n_out`/`lane_in` 显式 lane 边；
- `optimizer/ir/satd8_emit.py`：纯 NEON 发射器；
- `lane_defuse` 扩展支持新 op 种类（trn1q/trn2q s16/s32、abs/abd/max、
  vpaddl/vpadal/vaddv、无 store 的标量根）；
- 门禁：IR 版 **77 fused_uop / 91 total，vq=1 与 vq=2 均 0 失配**，
  与手写候选逐项一致；
- 测试：`tools/test_satd8_op_ir.py`。

### SATD 16x16（2026-08-16 完成）

- `satd16_dag()`：4 组 × (4 行 lo/hi 半加载 → hadamard 蝶形 → 置换
  +abs → vmax/vadd)，跨组 u16 累加，再统一 reduce；241 ops；
- 发射器支持 `half` 加载（vget_low/high_u8 + vsubl）；
- 差分：vs 上游 `satd8_sve2<16,16>`（QEMU vq=1/2 20k）0 失配；
  vs 现有可信候选 5000 例 0 失配；
- 动态计数：IR **273/308** vs 现有候选 **275/311**（-2 ops）；
- def-use（标量根）通过。

### SA8D 16x16（2026-08-16 完成）

- `sa8d16_op_ir.py`：4 个 8x8 块 × hadamard_8x8（hadamard_8_v +
  hadamard_8_h，含 trn s16/s32/s64 置换、abs/sumsub、vmax），跨块
  u16 累加，`vaddlv` + (x+1)>>1 收尾；336 ops；
- 发射器新增 trn1q/trn2q_s64 与 vaddlv（含 +1>>1）支持；
- 差分：vs 上游 `sa8d16_sve2<16,16>`（QEMU vq=1/2 20k）0 失配；
- 动态计数：IR **404/485** vs 现有纯 NEON 候选 **411/495**（-7 ops）；
  上游 128-bit 基线 373（仍有优化空间）；
- def-use 通过。

### SATD 全形状候选（2026-08-16 完成）

- `satd_rect_dag("8x16"/"16x8")`：两段 quad + vaddlv reduce；
  `satd_multi_emit.py` 产出 6 形状完整候选（8x8/8x16/16x8/16x16 +
  32x32/64x64 包装）；
- 对拍 vs 现有候选：6 形状 × 3000 例 **0 失配**；
- 动态计数（IR vs 现有）：8x8 77==77；8x16 **152/182** vs 152/198；
  16x8 **140/154** vs 150/183；16x16 **273/308** vs 275/311；
- 8x8 另经上游 `satd8_sve2<8,8>` 差分（vq=1/2）门禁。

### SAO 同图证据（2026-08-16 确认）

sao-prim.cpp（NEON）/ sao-prim-sve.cpp / sao-prim-sve2.cpp 三版本
共享 `compute_eo_stats`/`reduce_eo_stats` 图：mask（vceq）→
zip 扩展 → 与 diff 的 5 类统计。差异仅在 dot 降级：

- NEON：`vmulq_s16 + vmlaq_s16 + vpadalq_s16`（mul 路径）；
- SVE/SVE2：`x265_sdotq_s16`（sdot.d bridge，2×64 累加）；

即与 dct 相同的“同图 mul↔sdot”结构，可直接复用 dot 节点双目标
lowering。完整 saoCuStatsE0 DAG 提取列为下一增量（含 sign/edge、
count 的 vpadal 路径与 reduce）。

### SAO E0 64x1 DAG PoC（2026-08-16 完成）

- `sao_e0_op_ir.py`：完整宽度无关 DAG（209 ops）：4 个 16 块 ×
  （edge → 5×vceq mask → vpadal_s8 count + vzip 扩展 + dot_stats
  [lo/hi] → vpadal_s16 stats）+ reduce_eo_stats（vpadd/vpaddl +
  memory subtract + 标量尾项）；
- `sao_e0_emit.py`：纯 NEON 发射（dot_stats → vmul/vmla 路径）；
  lane_defuse 新增 vceq/vpadal/vzip/dot/vpadd/store_sub 等语义；
- 门禁：vs 上游 `saoCuStatsE0_neon` 20k **0 失配**（QEMU vq=1 与
  vq=2，VL 无关）；
- 计数：IR 213/226 vs 现有 SVE2 优化候选 165/182——差值来自 NEON
  路径（vpadal count + vmul/vmla stats）vs SVE2 的 svhistseg +
  sdot.d；同一 DAG 的 SVE dot 降级与 histseg 优化列为下一增量；
- 测试：`tools/test_sao_e0.py`。

### SAO E0 SVE2 目标模式（2026-08-16 完成）

同一 DAG 加 `target="sve2"` 变体（165 ops）：

- count：4× `svhistseg_s8`（替代 NEON 20× vpadal_s8）；
- stats：40× `sdotq_s16` 链式累加（替代 NEON vmul/vmla/vpadal）；
- reduce：vmovn_combine + vpadd + vaddv_s64（SVE 2×64 语义）；

门禁与计数：

| 变体 | vs 上游 NEON（vq=1/2 20k） | fused_uop |
| --- | --- | ---: |
| IR NEON | 0 失配 | 213 |
| IR SVE2 | **0 失配** | **167** |
| 现有手写 SVE2 | 0 失配 | 165 |

同一宽度无关 DAG 的 mul↔sdot 双目标 lowering 在 SAO 上落地，SVE2
计数与手写候选仅差 2 ops（histseg count 已复用）。

### SAO E0 实机 kernel 验证（2026-08-16）

`AGO_IR_SAO=1` 注入链就绪（`best_ir.cpp` NEON / `best_ir_sve2.cpp`
SVE2）。710（SVE2）kernel 微基准（cntvct，2000 例差分 0 失配）：

| 候选 | 相对上游 NEON 槽位 |
| --- | ---: |
| 现有 SVE2 候选 | **-19.2%** |
| IR SVE2 候选 | **-15.0%** |

IR 版与手写 SVE2 的差距（-15% vs -19%）与指令数差距（167 vs 165）
一致；两者均显著快于 710 上游 NEON 槽位。

### filter/ipfilter 评估（2026-08-16）

四套实现（NEON / NEON-dotprod / NEON-i8mm / SVE）都含 interp8_*：
结构是 8-tap FIR（滑窗抽头乘加），非蝶形/dot 块变换，但仍是
“同图不同 dot”：

- NEON：vmul/vadd 链；
- NEON-dotprod：SDOT（8-bit）；
- NEON-i8mm：SMLAL（8-bit 宽乘）；
- SVE：svdot（16-bit）；

宽度无关 DAG 可行（抽头 = dot 节点，滑窗偏移 = load index 表达式），
但非 dct 类结构，优先级低于 satd/sa8d/sao；列为后续增量，先做
近端实机 kernel/E2E 实测。

进一步证据（2026-08-16）：`filter8_u8x16` 核心按 coeffIdx 使用
不同优化形式——coeff 1/3 走 `vsubl + vmlal/vmlsl` 链、coeff 2 走
对称配对 `vaddl + vmlaq_n`；即“抽头=dot”只在抽象层成立，位精确
要求逐系数 lowering。通用 dot DAG 的成本/收益比低于 satd/sao，
正式列为远期增量（与 asm 族同级）。

## 3. 后续推广路线

1. satd/sa8d 其余形状（16x16/16x32 等，与 sa8d16 候选衔接）；
2. sao（NEON/SVE/SVE2 三版本，统计累积型 DAG）；
3. filter/ipfilter（多 ISA，FIR 型）；
4. asm 族（mc/sad/ssd/pixel-util）——需要先有 asm→IR 反编译器或
   以 C++ 参考实现建 DAG。

优先级按 best9 注入集实测收益与 profile 占比排序：satd/sa8d >
sao > filter > asm 族。

## 4. 通用算子优化管线工具（2026-08-16）

`tools/dag_pipeline.py`：一站化跑完整管线——DAG 构建 → lane def-use →
发射 → 编译 → QEMU 差分门禁 → 动态计数。新家族只需提供
`module:function` 的 DAG 构建器与发射器：

```sh
python3 tools/dag_pipeline.py --kernel satd-8 \
  --func dynopt_satd_8x8_sve2 \
  --dag satd8_op_ir:satd8_dag --emit satd8_emit:emit_satd8
```

`measure()` 新增 `verify_cxx_flags`（sao/filter 类 verify 需要 x265
头文件路径时使用）。三家族验证结果：

| 家族 | DAG ops | fused_uop | vq=1/2 差分 |
| --- | ---: | ---: | --- |
| satd-8 | 61 | 77/91 | 0 / 0 |
| sa8d16 | 336 | 404/485 | 0 / 0 |
| sao-stats-e0 (sve2) | 165 | 167/184 | 0 / 0 |

“通用算子优化管线”从逐家族脚本收敛为单一工具入口；filter/asm 族
后续接入只需实现各自的 DAG+发射器。

### asm 族首个成员：SAD 16x16（2026-08-16）

`sad_op_ir.py` + `sad_emit.py`：按上游 `sad_pp_neon`（vabal 链 +
vaddlv）建宽度无关 DAG（133 ops），纯 NEON 发射；经
`dag_pipeline.py` 门禁 vs 上游 `pixel_sad_16x16_neon_dotprod`：

| 候选 | fused_uop | vq=1/2 差分 |
| --- | ---: | --- |
| IR NEON | **66/98** | 0 / 0 |
| 现有 SVE2 候选 | 80/123 | 0 / 0 |

asm 族（sad/ssd/mc/pixel-util）的“同图不同指令”结构确认，sad 已
接入通用管线；其余成员（ssd 平方和、mc 平均、pixel-util）按同法
继续。

### asm 族 MC/SSD 接入（2026-08-16）

- `mc_avg_op_ir.py` + `mc_avg_emit.py`：avg_pp 16x16（urhadd = 
  (a+b+1)>>1），64 ops，经 `dag_pipeline` vs 上游
  `x265_pixel_avg_pp_16x16_neon`：**64/118，vq=1/2 0 失配**；
- `ssd_op_ir.py` + `ssd_emit.py`：sse_pp 16x16（vabdl + vmull +
  u32 累加 + vaddv），325 ops，vs `x265_pixel_sse_pp_16x16_neon`：
  **132/169，vq=1/2 0 失配**；
- 新增 `avg_pp`/`sse_pp` verify 模板与 kernels/mc、kernels/ssd
  manifest（参考为 NEON asm 符号，x265 参数惯例 dst 在前）；
- `tools/test_asm_op_ir.py`：sad/mc/ssd 三 DAG 的 def-use 与发射
  一致性。asm 族 sad/mc/ssd 三成员已接入通用管线，pixel-util 为
  最后一个剩余成员。

### asm 族 pixel-util（pixel_var 16x16，2026-08-16）

- `pixel_var_op_ir.py` + `pixel_var_emit.py`：按上游
  `pixel_var_neon<16>`（vpadalq_u8 和 + vmull_u8 平方 +
  vpadalq_u16 累加 + 打包返回 sum|sumsq<<32）建 DAG（138 ops），
  纯 NEON 发射；
- 门禁：自包含标量参考 3000 例 **0 失配**（算法为精确整数运算，
  与上游语义一致）；上游 exact 需完整 x265 harness（pixel_var 是
  匿名命名空间静态模板，无法直接链接参考库符号，列为后续）；
- 上游另有 `pixel_var_neon_dotprod` 变体——同图不同 dot 的又一
  实例。asm 族（sad/mc/ssd/pixel-util）全部完成 DAG 覆盖。
