# docs/82: AGO 自动搜索管线集成 (2026-08-18)

## 更新 (2026-08-18 续接：dct32 manifest 待修已闭环)

`search_sve2_layouts.py` ago 后端对 dct16/dct32 的计数 bug 已修复：
cover 源把真正的 kernel 放在 static `op_pass_4/op_pass_11` 助手内，
导出符号 `dynopt_dct16/32_sve2_shared` 只是薄 wrapper——ago 后端按
wrapper 符号范围做 QEMU trace 只统计到 ~14 条指令（fused_uop=0）。
修复：ago+dct16/dct32 改走**全对象 static_counts**（与 ago_auto_search
同源，匹配 docs/79 实测 761/1129、950/1019），并 bump 缓存键
（`|count=whole-object-static`）防旧错误计数复用。

修复后 dct32 ago 排名：cover-A (loop) 416/1087 vs cover-B (opbase)
1588，ago_pred NP1 890.2 vs 1701.2——cover-A 继续胜出，与 docs/79
结论一致。interp8/dct16 同步验证通过（interp8 A=85 最优、dct16 由
NP1 代价表选 cover-C，与 permute 排序的 cover-A 分歧属两种排序
口径，docs/82 主表已并列）。

## 概述

将手动搜索的成果（svdot_s32/neon_bridge/loop 候选）落入 AGO 自动搜索
管线，实现"手动搜索 → AGO cover 模板 → 自动生成/编译/排序/验证"的
闭环。这是 docs/52 长远目标的第一步实现。

## AGO 自动搜索管线

```
kernel 名称
    ↓
AGO cover 模板（optimizer/ago/covers_*.py）
    ↓ 生成多个 cover 候选（A/B/C/...）
编译（aarch64-linux-gnu-g++ -O3 -march=armv8.2-a+sve2）
    ↓
static_counts 特征提取（permute_depth_ratio 等）
    ↓
综合排序（score = permute_ratio + fused_uop/1000）
    ↓
QEMU bit-exact 验证（对比 NEON reference）
    ↓
最佳候选 → build_preload_so.py → 950 实机
```

## 入口脚本

```bash
# AGO 自动搜索 + bit-exact 验证
python3 tools/ago_auto_search.py --kernel interp8 --verify
python3 tools/ago_auto_search.py --kernel dct16
python3 tools/ago_auto_search.py --kernel dct32

# 也可用 search_sve2_layouts.py 直接调用
python3 tools/search_sve2_layouts.py --kernel interp8 \
  --backend ago --rank-by permute --outdir /tmp/ago-smoke

# 按 NP1 代价表排序
python3 tools/search_sve2_layouts.py --kernel interp8 \
  --backend ago --rank-by ago --mca-target NP1
```

## Cover 模板

| Kernel | 文件 | Covers | 最佳 |
|--------|------|--------|------|
| interp8 | covers_interp8.py | A=svdot32, B=svdot64, C=neon | A (score=0.292) |
| dct16 | covers_dct16.py | A=neon_bridge, B=pure_sve2, C=op895 | C (score=1.137) |
| dct8 | covers_dct8.py | A=best_sve2 (B/C/D/E scan-only) | A (score=0.474) |
| dct32 | covers_dct32.py | A=loop, B=opbase | A (score=0.955；manifest 已修) |
| satd-8 | covers_satd8.py | A-E (5 种尾部) | (M2 已验证) |
| sa8d | covers_sa8d8.py | A-C (3 种尾部) | (M2 已验证) |
| sa8d16 | covers_sa8d16.py | A=best_sve1, B=best_sve2, C=best_wide_cadd | C (score=0.293) |
| sa8d-32x32 | covers_sa8d32x32.py | A=best_wide_cadd (2 半向量×4 pass) | A (score=0.295) |
| sa8d-64x64 | covers_sa8d64x64.py | A=best_wide_cadd (4 半向量×8 pass) | A (score=0.504) |
| satd-16 | covers_satd16.py | A=best_sve1, B=best_ir_sve16, C=best_sve2_cadd | C (score=0.218) |
| satd-16x4 | covers_satd16x4.py | A=best_sve2_cadd (4 行) | A (score=0.136) |
| satd-16x32 | covers_satd16x32.py | A=best_sve2_cadd (32 行扩展) | A (score=0.260) |
| satd-16x64 | covers_satd16x64.py | A=best_sve2_cadd (64 行扩展) | A |
| satd-32x8 | covers_satd32x8.py | A=best_sve2_cadd (2 半向量/行) | A (score=0.238) |
| satd-32x16 | covers_satd32x16.py | A=best_sve2_cadd (2 半向量/行) | A (score=0.322) |
| satd-32x32 | covers_satd32x32.py | A=best_sve2_cadd (2 半向量/行) | A (score=0.322) |
| satd-32x64 | covers_satd32x64.py | A=best_sve2_cadd (2 半向量/行) | A (score=0.322) |
| satd-64x16 | covers_satd64x16.py | A=best_sve2_cadd (4 半向量/行) | A (score=0.391) |
| satd-64x32 | covers_satd64x32.py | A=best_sve2_cadd (4 半向量/行) | A (score=0.391) |
| satd-64x48 | covers_satd64x48.py | A=best_sve2_cadd (4 半向量/行) | A (score=0.391) |
| satd-64x64 | covers_satd64x64.py | A=best_sve2_cadd (4 半向量/行) | A (score=0.391) |
| satd-8x16 | covers_satd_8x16.py | A/B/C=NEON trn covers | A (score=0.366) |
| satd-16x8 | covers_satd_16x8.py | A/B/C=NEON trn covers | B (score=0.328) |
| sad | covers_sad.py | A=best_sve2, B=best_ir, C=best_ir_sve16 | B (score=0.066) |
| cost-coeff-nxn | covers_costcoeff.py | A=best_sve2(looped), B=best_sve2_unroll | B (score=0.268) |
| sao-stats-e0 | covers_sao_e0.py | A-E (5 候选) | E=block32 (score=0.261) |
| sao-stats-e1 | covers_sao_stats_e1.py | A/B/C (block16=C 重复) | C=block32 (score=0.187) |
| sao-stats-e2 | covers_sao_stats_e2.py | A/B/C (block16=C 重复) | C=block32 (score=0.202) |
| sao-stats-bo | covers_sao_stats_bo.py | A=best_sve2 (标量) | A (score=0.314) |
| psy-cost-16x16 | covers_psycost.py | A=best_sve2, B=best_ir_sve16, C=best_cadd | C (score=0.269) |

## 新家族扩展（2026-08-18 续接：docs/82 下一步 #4 完成）

`ago_auto_search.py` 改为**免 manifest 直接发射** cover（不再依赖
search_sve2_layouts 的 manifest 驱动验证管线），因此无 manifest 的
kernel（psy-cost）也能跑；有 manifest 的 kernel（satd-16/sad）仍可
走 `--backend ago` 全管线（QEMU 差分验证）。

新增 3 个 cover 模板（均包装现有候选，docs/81 scan 数据为
expected_permute_ratio）：

| Kernel | 排名 | 结果 | 说明 |
|--------|------|------|------|
| satd-16 | C=best_sve2_cadd (8.0%,138) > A=best_sve1 (8.0%,172) > B=best_ir_sve16 (58.8%) | C 胜 | 原生 svcadd 替换软件 cadd（SVE2 约束）；fused 172→138、tbl 48→16；A/C 全过 QEMU 2000 例差分，ago_pred 144.4 vs 148.2 |
| sad | B=best_ir (0.0%,66) > A=best_sve2 (0.0%,80) > C=best_ir_sve16 (54.7%) | B 胜 | 无优化空间族（docs/37），自动选出 IR 版 |
| psy-cost-16x16 | C=best_cadd (17.4%,95) > A=best_sve2 (30.8%,168) > B=best_ir_sve16 (42.6%) | C 胜 | cadd 蝴蝶移植上游结构（24 cadd+16 tbl/块 vs 24 trn/块）；A/C 全过 QEMU 2000 例差分，ago_pred 94.2 vs 304.2 |
| satd-8x16 | NEON A/C (21.4%) ≈ B (22.2%)，均胜 sve16 (50.7%) | A 胜 | 3 cover 全过 QEMU 2000 例差分（vs satd8_sve2<8,16>） |
| satd-16x8 | NEON B (17.4%) > A/C (23.1%)，均胜 sve16 (46.7%) | B 胜 | 3 cover 全过 QEMU 2000 例差分（vs satd8_sve2<16,8>） |

全管线验证：sad/satd-16 的 cover-A/B 过 QEMU 0 失配；sve16 封面
（symbol 后缀 sve16）因不匹配 manifest 合同符号 LINK FAIL——语义
正确（非 drop-in 替换），其 permute 数据仍由 scan 报告记录。
DB 280 行（新增 6 行：3 scan + 3 新家族 + 3 原家族 ago 行）。

## permute_depth_ratio 集成

AGO 特征提取（objfeatures.py）已桥接 static_counts.py 的关键路径特征：

| 特征 | 来源 | 预测力 |
|------|------|--------|
| permute_depth_ratio | static_counts → objfeatures | rho=-1.000 vs 950 |
| critical_path_latency | static_counts → objfeatures | cp 长度 |
| critical_path_len | static_counts → objfeatures | cp 指令数 |
| permute_on_critical | static_counts → objfeatures | cp 上 permute 数 |
| vector_fused_uop | static_counts → objfeatures | 总指令数 |

## 排序方式

| 排序 | 命令 | 原理 |
|------|------|------|
| permute | `--rank-by permute` | permute_ratio 最低 = 最快（950） |
| ago | `--rank-by ago` | NP1 代价表预测 cycles |
| combined | ago_auto_search.py 默认 | score = ratio + uop/1000（平衡 permute 和总量） |

## auto-search 验证结果

### interp8（2026-08-18 验证）

```
cover-A  svdot32   fused=87   ratio=20.5%  score=0.292  ← 最佳
cover-B  svdot64   fused=127  ratio=53.3%  score=0.660  *** >30% ***
cover-C  neon      fused=422  ratio=0.0%   score=0.422

QEMU bit-exact: PASS ✓
```

### dct16

```
cover-C  op895       fused=952   ratio=18.5%  score=1.137  ← 最佳
cover-A  neon_bridge fused=1019  ratio=25.3%  score=1.272
cover-B  pure_sve2   fused=1012  ratio=43.4%  score=1.446  *** >30% ***
```

## 修改文件清单

| 文件 | 改动 |
|------|------|
| optimizer/ago/objfeatures.py | 桥接 static_counts 特征 |
| optimizer/ago/predict.py | predict_with_permute 置换惩罚 |
| optimizer/ago/covers_interp8.py | interp8 3 cover 模板 (新) |
| optimizer/ago/covers_dct16.py | dct16 3 cover 模板 (新) |
| optimizer/ago/covers_dct32.py | dct32 2 cover 模板 (新) |
| optimizer/ago/covers_satd16.py | satd-16 2 cover 模板 (新，续接) |
| optimizer/ago/covers_sad.py | sad 3 cover 模板 (新，续接) |
| optimizer/ago/covers_psycost.py | psy-cost 2 cover 模板 (新，续接) |
| optimizer/ago/test_covers_dct.py | dct cover 测试 (新) |
| optimizer/ago/test_covers_interp8.py | interp8 cover 测试 (新) |
| optimizer/ago/test_covers_more.py | sad/satd-16/psy-cost cover 测试 (新，续接) |
| tools/search_sve2_layouts.py | --backend ago + --rank-by permute 支持 |
| tools/ago_auto_search.py | 统一自动搜索入口 (新)；续接：免 manifest 直接发射 |

## 下一步

1. ~~修复 dct32 的 manifest/contract 配置~~（已完成，见文首更新）
2. 950 实机验证 AGO 选出的最佳候选
3. 将 950 实测结果反馈到代价表（Feedback Loop）
4. ~~扩展到更多 kernel 家族（satd-16, sad, psy-cost 等）~~（已完成；
   psy-cost manifest 已建，全管线通过，见 docs/83）
5. ~~自动发现新 cover 变体（而非预定义）~~（第一步完成：
   `ago_auto_search.py --discover` 参数网格枚举，见 docs/83；
   深化：score 补 cp_lat、dct32 新 lowering 轴）
