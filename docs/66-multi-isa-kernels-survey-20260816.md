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

## 3. 后续推广路线

1. satd/sa8d 其余形状（16x16/16x32 等，与 sa8d16 候选衔接）；
2. sao（NEON/SVE/SVE2 三版本，统计累积型 DAG）；
3. filter/ipfilter（多 ISA，FIR 型）；
4. asm 族（mc/sad/ssd/pixel-util）——需要先有 asm→IR 反编译器或
   以 C++ 参考实现建 DAG。

优先级按 best9 注入集实测收益与 profile 占比排序：satd/sa8d >
sao > filter > asm 族。
