# dct16/32 16-lane IR 发射器设计（2026-08-17）

## 目标（短期项 5）

从宽度无关 fused8 DAG 生成 VL=256（16-lane）的 dct16/32 候选，与
op-backend（op895/opbase/op4032）同宽对比。当前 fused8 DAG 是 8-lane
固定；16-lane 采用“打包双组”表示：一个 16-lane SVE 寄存器携带两个
独立的 8-lane 组（lanes 0-7 / 8-15），所有运算同时对两组执行。

## 已验证的原语（2026-08-17，QEMU VL=256 + 0 NEON + 数值自检）

- `psv16_load/store`（全 VL ld1h/st1h）
- `psv16_rev`（全寄存器反转）、`psv16_sdot`、`psv16_rshrn6`
- `psv16_dual_rev16`：分别反转两个 8-lane 组（tbl 索引
  [7..0, 15..8]）
- `psv16_dual_vget_lo4/hi4`：从两组各取低/高 4 lane 放到 lanes 0-3 /
  8-11（tbl 索引）
- `psv16_rev_lo/hi`：只反转低/高 8-lane 组（O = lo - rev(hi) 需要）
- `psv16_dual_saddl`：双组加宽加（s16 双组 → s32 双组，lanes 0-3 /
  4-7，svunpklo/hi + svtbl2 打包）
- `psv16_dual_load8`（两 8-lane 加载打包）、`dual_rev32/rev64_s32`、
  `dual_vmovn_s64`、`dual_rshrn_s32<S>`、`dual_store4_s16`（2026-08-17
  补齐，VL=256 数值自检 + 0 NEON）

## 8-lane op → 双组 op 映射（待实现）

| 8-lane（VL128） | 16-lane 双组（VL256） |
| --- | --- |
| 行半区 load（lo/hi 各 8） | 两行打包 load（或同一行 lo/hi 打包，取决于 O 组合） |
| rev16（整 8-lane） | 需要“只反转一组”的变体（rev_hi/rev_lo），因 O = lo - rev(hi) 只反转 hi |
| vget_low/high（4-lane） | psv16_dual_vget_lo4/hi4 |
| saddl / vmovn / padd / combine4 | 双组版本（lanes 0-3 与 8-11 并行） |
| sdot（8-lane → 2×s64） | psv16_sdot（16-lane → 4×s64，两组成对） |
| store | psv16_store（每寄存器写两行/两组） |

关键点：8-lane 代码里同一行 lo/hi 会做 O = lo - rev16(hi)，因此打包
方案若把 lo/hi 放同一寄存器，需要“单组反转”原语；若把两行各自
完整处理，则寄存器内同时存在两行的 lo 与 hi，选择其一。设计取舍
在实现时按 pass 结构定（优先两行打包以复用全寄存器）。

## 实施步骤

1. 补齐双组原语：rev_lo/hi、dual_saddl、dual_vmovn_s32、
   dual_combine4_s16、dual_addp4_s32 均 ✅（2026-08-17，VL=256 数值
   自检 + 0 NEON）；
2. 实现 dct16 pass1/pass2 双组发射器（可由 8-lane pure-SVE 源码
   按映射逐语句翻译），生成 `dct16/candidates/best_ir_sve16.cpp`；
3. 门禁：`--no-neon`、20k QEMU vq=2 差分、TestBenchLite（RUN_VQ=2）、
   与 neon8 数值一致；
4. dct32 同法；与 op895/opbase/op4032 对比 fused/周期，950 实机
   （注入法交错）定稿。

## 状态

- ✅ 双组原语集全部就绪（含 load8/rev32/rev64/vmovn_s64/rshrn/store4；
   zip1/2_s64 用全宽 svzip 天然满足双组语义）；
- ✅ **dct16 双组发射器完成**（`optimizer/ir/dct16_dual_sve_emit.py`
   → `kernels/dct16/candidates/best_ir_sve16.cpp`，`svcntb()==32`
   守卫）：0 NEON（`check_isa_level --no-neon`）、51k 跨 VQ 差分
   （vq1 8-lane pure-SVE 参考 vs vq2 16-lane，分进程同输入，0 失配；
   `tools/test_dct16_sve16.py`）、TestBenchLite vq=2 六 seed 全过
   （`--gate dct16-sve16`）。
- ✅ **dct32 双组发射器完成**（`optimizer/ir/dct32_dual_sve_emit.py`
   → `kernels/dct32/candidates/best_ir_sve16.cpp`）：0 NEON、41k
   跨 VQ 差分 0 失配、TestBenchLite vq=2 六 seed 全过
   （`--gate dct32-sve16`）。dct32 每行 4 个 8-lane 块，EO 本身是
   8-lane，pair-form 双组寄存器直接喂 sdot（无需 dct16 的 quad-pack）；
   pass2 保留每行两个 s32 EO（EO_*0/EO_*1）供 mla 使用。
- ✅ 与 op-backend 同宽静态对比（同编译 `-O3 -march=armv8.2-a+sve2`，
  按 kernel 函数集计 `vector_fused_uop`，VL=256）：

  | kernel | sve16 | op-backend | 差 |
  | --- | --- | --- | --- |
  | dct16 | **640** | op895 952 | −33% |
  | dct32 | **897** | opbase 1129 / op4032 2110 | −21% / −57% |

  （注：op895/opbase/op4032 的历史 DB 数字 895/8114/4032 出自另一
  计数路径，与本表同口径数字不同；本表命令：
  `aarch64-linux-gnu-g++ -O3 -march=armv8.2-a+sve2 -c <cand>.cpp` +
  `tools/static_counts.py`/按符号计数。）
- ⏳ 950 实机 kernel 周期/注入 E2E：候选已接入
  `AGO_IR_SVE16=1`（`tools/build_preload_so.py` 在
  `--isa sve2 --vl 32` 时优先选 `best_ir_sve16.cpp`）。950 侧命令：
  `AGO_IR_SVE16=1 python3 tools/build_preload_so.py --isa sve2 --vl 32
  --kernels dct16,dct32 --opt=-O3 --out build/dct-sve16.so`，再按
  docs/63 的注入法 A/B。

## 实现要点（dct16）

语句配对：相邻两行合并为一个双组寄存器（pair A = rows i/i+1，
pair B = rows i+2/i+3）。三族输出统一为“四行结果落在 s16 lanes
0-3 后 `psv_store4_s16` 直存 4 个连续位置”：

- k 奇：`sdot(O_A/O_B)` → `dual_vmovn_s64` 得到两对部分和 →
  `combine_g0` 跨组打包 → `pairwise_add`（uzp1+uzp2）得四行总和。
- k≡2 mod 4（pass1）：`quad_pack` 把 pair-form EO 打成四行 quad-form
  → 一次 16-lane `sdot` → `dual_vmovn_s64` → rshrn。
- k≡2 mod 4（pass2）：`pairwise_add(m_A, m_B)` 先得“每组行内部分和”，
  再 `pairwise_add(s1, s1)` 得四行总和。
- k=0/4/8/12：偶数族，先 `combine_g0` 后 `pairwise_add`；k=0/8 用
  EEE、k=4/12 用 EEO；注意 8-lane 源码中 k=8 是**先乘后加**（与
  k=0 相反），发射器已按源码逐块对应。

## 门禁陷阱（已踩坑记录）

- `svzip1/2_s64`、`uzp1/2` 的 lane 分组随 VL 变化（N=2 vs N=4），
  因此 8-lane pure-SVE 代码去掉 `svcntb()==16` 守卫后**不能**直接在
  vq=2 当参考；跨 VQ 对比必须分进程、同输入。
- 原始 `uzp1+uzp2` 两两加在 VL=256 下会把第二个操作数的和放到
  g1（lanes 4-7），必须先 `combine_g0` 把两个 g0 拼进同一寄存器。
- TestBenchLite（x265 `dct16_c` 标量参考）是最终正确性门禁；
  `tools/testbench_lite.cpp` 已加 `dct16-sve16` gate（weak 符号）。

## 验证注意事项

双组原语（load8/rev/vget/saddl/vmovn/combine4/addp4/rshrn/store4）
均已单独数值验证（VL=256 + 0 NEON）。EO 阶段“语句配对”PoC 曾用
自写标量参考校验但参考实现存在未定位 bug（双组输出与按公式手算一致，
如 EOa=336/240/144/48），为避免假信号已从测试移除；**EO 阶段映射
必须用可信参考验证**：方案 A：给 8-lane pass1 插桩导出 EO_0/EO_1 中间
值后比对；方案 B：完成整个双组 pass1 后与 8-lane 纯 SVE dct16 最终
输出做 20k 差分（推荐，直接复用现有门禁）。
