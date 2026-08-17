# docs/84: AGO 自动搜索语料总览（2026-08-20，142 kernel）

> 由 goal round 29 全量审计生成（tools/ago_auto_search.py 对每个
> kernel 实跑，胜者与 docs/82 家族表一致）。本文件是语料现状的
> 权威总览；docs/82 家族表为逐家族详情。

## 1. 总览

- **142 kernel / 26 家族**，全部经 QEMU vq=2 2000 例差分门禁
  （bit-exact vs 上游参考）
- 工具链：ago_auto_search（免 manifest 直接发射）/ search_sve2_layouts
  --backend ago（全管线+门禁）/ feedback_calibrate（Feedback Loop）
- 约束维度：--isa sve1（920B）/ sve2（950）/ neon；SVE2p3（interp4）
  超出目标优先范围（NEON/SVE→SVE256），未接入
- DB：423 行（kernel-test-db.csv 权威）；回归：tools 91 / ago 138 /
  templates 25 / ir 50

## 2. 家族统计

| 家族 | kernel 数 | 代表胜者（fused uop） | 备注 |
|------|----------:|----------------------|------|
| satd | 17 | | |
| sa8d | 4 | | |
| interp8 | 57 | | |
| interp4 | 23 | | |
| sao | 10 | | |
| dct | 3 | | |
| idct | 2 | | |
| chroma | 7 | | |
| cu | 6 | | |
| pu | 2 | | |
| mc | 1 | | |
| ssd | 1 | | |
| sad | 1 | | |
| sad-32 | 1 | | |
| scan-pos-last | 1 | | |
| sign | 1 | | |
| scale2d | 1 | | |
| pel-filter-luma-strong | 1 | | |
| find-pos-first-last | 1 | | |
| cost-coeff-nxn | 1 | | |
| psy-cost-16x16 | 1 | | |

## 3. 覆盖状态

- **已收编 142 kernel**：全部有候选的 sve1/sve2 适用 kernel
- 未接入：interp4 17 形状（SVE2p3-only，超出范围）、dequant
  （无候选）、interp8-*_ext / *-8 / *-8x4 等空目录（无候选）
- 950 实机仲裁：用户侧（microbench + freeze 脚本就绪；Feedback Loop
  摄取实测数据后校准 ago_pred）
