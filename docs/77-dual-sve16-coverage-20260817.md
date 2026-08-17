# NEON→SVE256 全家族 dual-group 16-lane 覆盖（2026-08-17）

## 1. 背景与结论

此前只有 dct16/32 有真正的 16-lane（VL=256 全宽）纯 SVE 发射器
（docs/72）；satd 纯 SVE 是“任意 VL 但只激活 8 lane”；其余家族只有
8-lane/NEON 发射器。本轮把 dual-group 16-lane lowering 做成通用引擎，
并接入全部已有宽度无关 DAG 的向量家族：

| 家族 | 形状 | 双组 schedule |
| --- | --- | --- |
| mc avg_pp | 16x16 | 行对（y, y+1）打包，奇数行别名 |
| sad | 16x16 | 偶数行填 g0、奇数行填 g1（zhi/zlo） |
| ssd | 16x16 | 同上 |
| pixel_var (psy-cost) | 16x16 | 同上 |
| satd | 16x16 / 8x16 / 16x8 | lo/hi 半行分填 g0/g1；8x16 为行块分填 |
| sa8d | 16x16 | 左右 8 列分填 g0/g1，xo=8 块交换，末次 (x+2)>>2 折叠 |
| interp8 hpp | 9 形状（8x8..64x64） | 行对打包 + per-coeffIdx phase 发射 |

产出：17 个 `kernels/*/candidates/best_ir_sve16.cpp`，全部通过
`check_isa_level --no-neon`（0 NEON）与 QEMU `sve-max-vq=2` 数值
对拍（对 NEON DAG 参考，200 轮 × 6 模式，0 失配）；
`tools/test_dual_sve16.py` 是统一门禁（2 用例）。

## 2. 通用引擎

`optimizer/ir/dual_sve16.py`：

- `DUAL16_HELPERS`：双组原语库（VL=256 布局：u8x16→32-lane 双组、
  s16/u16→16-lane、u16x4→8-lane、s32/u32→8-lane、s64→4-lane）。
- `DualSve16Emitter`：按 op kind 发射；`Schedule` 子类只负责
  load/store 的内存双组映射；`emit_phased()` 支持 interp8 的
  coeffIdx 1/2/3 三阶段 if/else 结构。
- `emit_dual()` 组装完整 C++（PURE_SVE_HELPERS + DUAL16_HELPERS +
  函数体 + svcntb()==32 守卫）。

## 3. 双组 schedule 模式

| 模式 | 适用 | 说明 |
| --- | --- | --- |
| pair+alias | mc、interp8 | 偶数行加载两行，奇数行复用；存储一次写两行 |
| zhi/zlo | sad/ssd/pixel_var | 偶行数据在 g0、奇行在 g1，避免累加器重复计数 |
| lo/hi split | satd16/16x8 | 同一行 lo/hi 半列分填 g0/g1 |
| row-block split | satd8x16 | 上 8 行 g0、下 8 行 g1 |
| block swap | sa8d16 | 左右 8 列分填；xo=8 块交换使双组都为 total，末次折叠用 (x+2)>>2 |

## 4. 门禁与接入

```sh
python3 -m unittest tools.test_dual_sve16 -v        # 0-NEON + vq2 对拍
AGO_IR_SVE16=1 python3 tools/build_preload_so.py \
  --isa sve2 --vl 32 --kernels mc,sad,ssd,sa8d16,satd-16,interp8-16 \
  --out build/dynopt-sve16.so
```

`build_preload_so.py`：`candidate_sources` 在 `AGO_IR_SVE16=1` +
`--isa sve2 --vl 32` 时优先选 `best_ir_sve16.cpp`；符号映射见
`SVE16_SYMBOLS`。950（SVE2 2x256）注入用注入法交错 A/B。

## 5. 踩坑记录（GCC 16.1 / QEMU）

1. SVE 谓词加载按元素索引寻址：高 lane 谓词加载 `b` 会读 `b[16..]`；
   16-lane 双组加载必须“两个 pg16 加载 + tbl2 打包”，或内联 asm +
   `b-16` 基址（zlo）。
2. `svtbl2_u8` 双寄存器表在 VL=256 的字节偏移是 32，不是 16；
   u16 双寄存器表偏移是 16 lane（与 dct 一致）。
3. 静态索引数组 + `svtbl` 会被 GCC 合并成跨半加载（越界读）；一律用
   `svindex`/`svsel` 构造索引。
4. `svand_b_z` 对“模式谓词”（SV_VL8/SV_VL16）与 `svnot` 组合的求交在
   GCC16/QEMU 下得到全空；改用比较谓词（`svcmpge/svcmplt`）求交。
5. `svaddv` 会被编译器降到 NEON `uaddv`；全部归约用
   uzp1/uzp2+add 树 + 内联 asm `lasta`（沿用 satd pure-SVE 经验）。
6. 8 字节 SVE 加载会被降到 NEON D 寄存器 + `mov`；pair8 加载用内联
   asm `ld1b`（与 `psv_load8` 同模式）。`ldur/stur` 已加入
   `NEON_MEM_MNEMONICS` 白名单（纯访存编码）。
7. `svadalp` 按“结果类型”命名（`svadalp_u32_x(acc_u32, x_u16)` 等）；
   且对 .H 源在 16 位内相加，会回绕——vpaddl/vpadal 一律先
   `svunpklo/hi` 加宽到 u32 再两两相加。
8. `sqrshrunb/sqrshrunt` 的 .h→.b 语义在 QEMU 下逐 lane 重复输出；
   vqrshrun 改为显式“加宽→舍入右移→[0,255] 饱和→tbl 抽低字节”。

## 6. 遗留

- satd 8x8（8 宽）无法全宽 dual（算法跨行混合，API 单块）；保持
  8-lane any-VL 纯 SVE。
- sao 族（edge/vceq/vzip/histseg/sdot）与 interp8 其余 field
  （vpp/vps/vsp/vss、interp4）未接入，列为后续。
- `psy-cost-16x16` 无 manifest，注入需补 manifest。
- 950 kernel 级对比已做（2026-08-17，
  `reports/950-sve16-dual-lane-20260817.txt`）：dct16/dct32 双编译器
  全门禁 PASS 但实机慢 1.5-3.5x，**950 不可采纳**（静态 uop 不转实机
  周期，与 sao/satd/pure-SVE 教训一致）。950 E2E（FROZEN 冻结集，
  不含 sve16）仍待用户侧（docs/63/73）。
