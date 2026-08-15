# 算子覆盖与性能矩阵（commit #625，2026-08-15 12:04 +0800）

> 时间点：HEAD `49dccd4c7506e5e43c704743874f93bedcf8085c`，commit 序号 625。
> 口径：fused = QEMU 动态 trace 的 fused vector uop（VL=256）；
> MCA = LLVM-MCA Neoverse-V2 代理 cycle；“自动搜索” =
> `search_sve2_layouts.py --backend gen` 由 `gen_sve2_emit.py` 配方从
> MachineIR 自动生成候选；“手动/特化” = per-kernel emitter 或 op/asm
> 后端，但复用同一搜索/验证漏斗；“无基线” = 该形状首次覆盖。

## 1. 总览

| 指标 | 值 |
| --- | --- |
| kernel 目录 | 172 |
| seed recipe | 93 |
| 通用发射器冒烟核数 | 69/69 通过 |
| 通用配方数 | 10 |
| AArch64 已注册字段 | 29 |
| 已覆盖字段 | 29 |
| 字段级剩余 todo | 0 |
| 自动搜索 kernel 占比 | 69/94 ≈ 73.4% |

剩余字段：无（AArch64 已注册 29 个字段全部有本项目 kernel 覆盖；
嵌套大数组以代表切片标注）。

## 2. 自动搜索线：有上游/手写基线的追平情况

| 配方 | 算子 | 自动候选 fused/MCA | 上游/手写 fused/MCA | 评价 |
| --- | --- | --- | --- | --- |
| diff-sum | sad-16x16 | 80/69 | 上游 68/- | 覆盖项，无优化空间 |
| diff-sum | sad-32x32 | 160/118 | 上游 197/- | 覆盖项 |
| hadamard | sa8d-8x8 | 79/71 | 上游 97/- | 追平手写 |
| hadamard | sa8d-16x16 | 186/73 | 上游 373/- | 追平手写 |
| fir | interp8-8x8 | 93/53 | 上游 141/- | 追平手写 93/53 |
| fir | interp8-16x16 | 327/114 | 上游 467/- | 追平手写 327/114 |
| fir | interp8-32x32 | 1289/367 | 上游 1829/- | MCA 略优 |
| fir(4tap) | interp4-8x8 | 85/47 | 上游 63/- | 追平手写 |
| fir(4tap) | interp4-16x16 | 165/70 | 上游 345/- | 追平手写 |
| fir(4tap) | interp4-32x32 | 645/189 | 上游 1353/- | 追平手写 |
| vertical-fir | interp8vpp-16 | 247/157 | 上游 400/- | 追平手写 |
| vertical-fir | interp8vpp-32 | 936/547 | 上游 1572/- | 追平手写 |
| vertical-fir(4tap) | interp4vpp-16 | 171/96 | 上游 231/- | 追平手写 |

## 3. 自动搜索线：satd 首次覆盖

| 算子 | 自动候选 fused/MCA | 相对 DAG 直译 |
| --- | --- | --- |
| satd-4x4 | 37/57 | 首覆盖 |
| satd-4x8 | 63/62 | 首覆盖 |
| satd-8x4 | 47/43 | 首覆盖 |
| satd-8x8 | 93/51 | 首覆盖 |
| satd-8x16 | 102/69 | -45%/-1.4% |
| satd-8x32 | 202/91 | -45%/-18% |
| satd-16x4 | 36/43 | -60%/-12% |
| satd-16x8 | 72/53 | -61%/-23% |
| satd-16x16 | 140/74 | -68%/-44% |
| satd-16x32 | 276/106 | -68%/-55% |
| satd-16x64 | 548/174 | -69%/-60% |
| satd-24x32 | 607/215 | -46%/-31% |
| satd-32x8 | 141/68 | -62%/-41% |
| satd-32x16 | 281/101 | -68%/-58% |
| satd-32x32 | 561/166 | -68%/-62% |
| satd-32x64 | 1121/298 | -68%/-65% |
| satd-48x64 | 1681/426 | -68%/-66% |
| satd-64x16 | 561/168 | -68%/-63% |
| satd-64x32 | 1121/298 | -68%/-65% |
| satd-64x48 | 1681/427 | -68%/-66% |
| satd-64x64 | 2241/554 | -68%/-67% |

## 4. 自动搜索线：interp8 short 变体首覆盖

| 算子 | 自动候选 fused/MCA | 备注 |
| --- | --- | --- |
| interp8-hps-8x8 | 98/45 | isRowExt=0 |
| interp8-hps-8x16 | 186/72 | isRowExt=0 |
| interp8-hps-16x16 | 362/117 | isRowExt=0 |
| interp8-hps-32x32 | 1418/502 | isRowExt=0 |
| interp8-hps-16x8 | 186/68 | isRowExt=0 首覆盖 |
| interp8-hps-32x16 | 714/212 | isRowExt=0 首覆盖（-O3 后） |
| interp8-hps-8x32 | 362/119 | isRowExt=0 首覆盖 |
| interp8-hps-16x32 | 714/212 | isRowExt=0 首覆盖 |
| interp8-hps-32x8 | 362/118 | isRowExt=0 首覆盖（-O3 后） |
| interp8-hps-8x8-ext | 175/68 | isRowExt=1 |
| interp8-hps-8x16-ext | 263/92 | isRowExt=1 |
| interp8-hps-16x16-ext | 516/159 | isRowExt=1 |
| interp8-hps-32x32-ext | 1726/606 | isRowExt=1 |
| interp8-vps-8x4 | 70/50 | 首覆盖 |
| interp8-vps-16x4 | 70/50 | 首覆盖 |
| interp8-vps-8x8 | 118/78 | 首覆盖 |
| interp8-vps-8x16 | 214/135 | 首覆盖 |
| interp8-vps-16x16 | 214/136 | 首覆盖 |
| interp8-vps-16x32 | 406/248 | 首覆盖 |
| interp8-vps-32x16 | 424/252 | 首覆盖 |
| interp8-vps-32x32 | 808/479 | 首覆盖 |
| interp8-vsp-8x4 | 83/67 | 行预加载 |
| interp8-vsp-16x4 | 149/99 | 行预加载 |
| interp8-vsp-8x8 | 143/101 | 行预加载 |
| interp8-vsp-8x16 | 271/172 | 行预加载 |
| interp8-vsp-16x16 | 517/311 | 原 938/317 |
| interp8-vsp-16x32 | 1013/578 | 行预加载 |
| interp8-vsp-32x16 | 1200/602 | 行预加载 |
| interp8-vsp-32x32 | 2350/1178 | 行预加载 |
| interp8-vss-8x4 | 74/57 | 行预加载 |
| interp8-vss-16x4 | 132/93 | 行预加载 |
| interp8-vss-8x8 | 126/89 | 行预加载 |
| interp8-vss-8x16 | 238/151 | 行预加载 |
| interp8-vss-16x16 | 450/291 | 原 872/297 |
| interp8-vss-16x32 | 882/539 | 行预加载 |
| interp8-vss-32x16 | 1045/558 | 行预加载 |
| interp8-vss-32x32 | 2046/1096 | 行预加载 |

### 4.1 luma vpp 非方形形状（2026-08-15 补，20k 差分 0 失配）

| 算子 | 自动候选 fused/MCA | 备注 |
| --- | --- | --- |
| interp8vpp-16x8 | 135/91 | 首覆盖 |
| interp8vpp-16x32 | 471/286 | 首覆盖 |
| interp8vpp-32x16 | 488/288 | 首覆盖 |
| interp8vpp-32x64 | 1832/1063 | 首覆盖 |
| interp8vpp-64x32 | 2367/1118 | 首覆盖 |
| interp8vpp-64x64 | 4715/2183 | 首覆盖（最大 luma vpp；tile 4/8/16 均更差） |
| interp8vpp-64x16 | 1242/585 | 首覆盖 |
| interp8vpp-16x64 | 919/542 | 首覆盖 |
| interp8vpp-64x48 | 3540/1650 | 首覆盖 |
| interp8vpp-16x4 | 79/60 | 首覆盖 |
| interp8vpp-16x12 | 191/124 | 首覆盖 |
| interp8vpp-24x32 | 937/549 | 首覆盖（非 16 倍宽） |
| interp8vpp-8x16 | 247/157 | 首覆盖（8 宽发射器扩展） |
| interp8vpp-8x4 | 79/60 | 首覆盖（8 宽发射器扩展） |
| interp8vpp-8x32 | 471/286 | 首覆盖（8 宽发射器扩展） |
| interp8vpp-32x8 | 264/159 | 首覆盖 |
| interp8vpp-32x24 | 712/419 | 首覆盖 |

### 4.2 interp4（chroma 4-tap）非方形形状（2026-08-15 补，20k 差分 0 失配）

| 算子 | 自动候选 fused/MCA | 备注 |
| --- | --- | --- |
| interp4-8x16 | 165/70 | hpp 首覆盖 |
| interp4-16x8 | 85/47 | hpp 首覆盖 |
| interp4-16x32 | 325/109 | hpp 首覆盖 |
| interp4-32x16 | 325/109 | hpp 首覆盖 |
| interp4-8x32 | 325/109 | hpp 首覆盖 |
| interp4-16x64 | 645/189 | hpp 首覆盖 |
| interp4-32x8 | 165/67 | hpp 首覆盖 |
| interp4-16x4 | 45/37 | hpp 首覆盖 |
| interp4-32x24 | 485/149 | hpp 首覆盖 |
| interp4-8x4 | 45/37 | hpp 首覆盖 |
| interp4-32x64 | 1285/349 | hpp 首覆盖 |
| interp4-8x64 | 645/189 | hpp 首覆盖 |
| interp4-32x48 | 965/269 | hpp 首覆盖 |
| interp4-16x24 | 245/89 | hpp 首覆盖 |
| interp4vpp-8x8 | 90/57 | vpp 首覆盖 |
| interp4vpp-8x16 | 170/92 | vpp 首覆盖 |
| interp4vpp-16x8 | 90/57 | vpp 首覆盖 |
| interp4vpp-16x32 | 330/151 | vpp 首覆盖 |
| interp4vpp-32x16 | 335/150 | vpp 首覆盖 |
| interp4vpp-32x32 | 655/275 | vpp 首覆盖 |
| interp4vpp-32x64 | 1295/520 | vpp 首覆盖 |
| interp4vpp-8x32 | 330/151 | vpp 首覆盖 |
| interp4vpp-8x64 | 650/272 | vpp 首覆盖 |
| interp4vpp-16x64 | 650/272 | vpp 首覆盖 |
| interp4vpp-32x8 | 175/91 | vpp 首覆盖 |
| interp4vpp-16x4 | 50/43 | vpp 首覆盖 |
| interp4vpp-8x4 | 50/43 | vpp 首覆盖 |
| interp4vpp-8x6 | 70/51 | vpp 首覆盖 |
| interp4vpp-16x12 | 130/74 | vpp 首覆盖 |
| interp4vpp-12x16 | 170/88 | vpp 首覆盖（非 16 倍宽） |
| interp4vpp-12x32 | 330/149 | vpp 首覆盖（非 16 倍宽） |
| interp4vpp-16x24 | 250/120 | vpp 首覆盖 |
| interp4vpp-32x24 | 495/211 | vpp 首覆盖 |
| interp4vpp-24x32 | 656/276 | vpp 首覆盖（非 16 倍宽） |
| interp4vpp-24x64 | 1296/520 | vpp 首覆盖（非 16 倍宽） |
| interp4vpp-32x48 | 975/397 | vpp 首覆盖 |

### 4.3 luma hpp 非方形形状（2026-08-15 补，20k 差分 0 失配）

| 算子 | 自动候选 fused/MCA | 备注 |
| --- | --- | --- |
| interp8-8x16 | 181/75 | path-B 首覆盖 |
| interp8-16x8 | 167/71 | path-B 首覆盖 |
| interp8-16x32 | 647/197 | path-B 首覆盖 |
| interp8-32x16 | 649/197 | path-B 首覆盖 |
| interp8-64x32 | 2505/690 | path-B 首覆盖（64 宽） |
| interp8-64x64 | 5001/1354 | path-B 首覆盖（最大 luma hpp） |

## 5. 自动搜索线：misc 首覆盖

| 配方 | 算子 | 自动候选 fused/MCA |
| --- | --- | --- |
| planecopy | planecopy_cp 64x32 | 128/60 |
| weight-pp | weight_pp 64x32 branch-0 | 642/213 |
| sign | sign 64 (variable endX) | 16/30 |
| find-pos-first-last | 4x4 packed first/last | 12/25 |
| scan-pos-last | 4x4 scan walk | 0 vector/33 MCA（-O3；NEON 试验 80/121，暂不采用） |
| cost-coeff-nxn | 4x4 sig-map cost | 10 vector/97 MCA（-O3 后较 12/109 改善） |
| cu-copy-pp | 32x32 代表切片 | 64/43 |
| cu-sub-ps | 16x16 代表切片 | 64/36 |
| cu-copy-ss | 16x16 代表切片 | 32/26 |
| cu-add-ps | 16x16 代表切片 | 96/49 |
| cu-copy-sp | 16x16 代表切片 | 48/31 |
| cu-copy-ps | 16x16 代表切片 | 32/26 |
| pu-copy-pp | 16x16 代表切片 | 32/26 |
| pu-addavg | 16x16 代表切片 | 128/58 |
| chroma-copy-pp | 16x16 代表切片 | 32/26 |
| pel-filter-luma-strong | V/H 强滤波 | 81/53（NEON 版，优于标量 82 MCA） |

## 6. 手动/特化线

| 算子 | 候选 fused/MCA | 上游 fused | 生成方式 |
| --- | --- | --- | --- |
| dct8 | 289/77 | 146 | 特化 emitter + 布局搜索 |
| dct16 | 847/220 | 1808 | 特化 emitter / op 后端 699/212 |
| dct32 | 4014/1041 | 12710 | 特化 emitter / op 后端 |
| idct16 | 980/246 | 1487 | 特化 emitter + 布局搜索 |
| idct32 | 5085/1164 | 10214 | 特化 emitter + 布局搜索 |
| dequant_normal | 130/57 | - | 特化 emitter + 搜索 |
| dequant_scaling gt | 210/75 | - | 特化 emitter + 搜索 |
| dequant_scaling le | 193/72 | - | 特化 emitter + 搜索 |
| quant | 508/169 | - | 特化 emitter + 搜索 |
| nquant | 329/131 | - | 特化 emitter + 搜索 |
| saoCuOrgE0 | 305/133 | - | 特化 emitter + 搜索 |
| saoCuOrgB0 | 386/126 | - | 特化 emitter + 搜索 |
| saoCuOrgE1 | 610/171 | - | 特化 emitter + 搜索 |
| saoCuOrgE1_2Rows | 306/103 | - | 特化 emitter + 搜索 |
| saoCuOrgE2 | 154/74 | - | 特化 emitter + 搜索 |
| saoCuOrgE3 | 135/73 | - | 特化 emitter + 搜索 |
| saoStatsE0 block16 | 165/62 | - | 特化 emitter + 搜索 |
| saoStatsE1 block16 | 180/64 | - | 特化 emitter + 搜索 |
| saoStatsE2 block16 | 181/65 | - | 特化 emitter + 搜索 |
| saoStatsE3 block16 | 180/65 | - | 特化 emitter + 搜索 |
| saoStatsBO | 0/137 | - | 无优化空间 |
| scale1D_128to64 | 24/21 | - | 特化 emitter + 搜索 |
| scale2D_64to32 | 576/215 | - | 特化 emitter + 搜索；2026-08-15 从 1664/378 降至 576/215（neon-paddl-loop + clang -O3，20k 0 失配） |
| ssim_4x4x2_core | 45/47 | - | 特化 emitter + 搜索 |

## 7. 工具链完成度

| 阶段 | 工具 | 完成度 |
| --- | --- | --- |
| 覆盖清点 | enumerate_x265_simd.py | 可用，字段级 todo=8 |
| 抽取 | extract_seed.py | flat/structured、分支剥离、constant-shape wrapper |
| 配方检测/发射 | gen_sve2_emit.py | 10 配方，未知族报错 |
| 差分验证 | gen_verify.py + QEMU | 2k/20k 两级，include 式 verify |
| 性能代理 | search_sve2_layouts.py | fused/MCA/cost/cp/consensus |
| 实机验证 | 950/920B 流程 | 部分；新增 short 变体待实测 |
| 回归护栏 | test_gen_emit.py | 69/69 通过 |
| 单命令流水线 | seed_pipeline.py | seed→检测→搜索→summary |
