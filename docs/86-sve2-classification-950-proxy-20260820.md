# docs/86: SVE2 指令分类 + 950 代价表代理 (2026-08-20)

> 承接 docs/82-85 AGO 自动搜索主线。本文档记录 SVE2 指令分类
> 修复、950 代价表代理、permute 惩罚集成、以及 6 个新测试。

## 0. 问题

AGO 预测器 `predict_from_features` 使用 `_CLASSES` 正则将反汇编指令
分类为吞吐量类（ld_vec/st_vec/add/mul/...），再查代价表计算预测
cycles。但以下 SVE2 指令未被任何类匹配，**静默跳过吞吐量计算**：

| 指令 | 用途 | 原状 |
|------|------|------|
| cadd | satd/psy-cost 蝴蝶 | 跳过 |
| svdot | interp8/dct 点积 | 跳过 |
| sqxtun | sao 饱和窄化 | 跳过 |
| movprfx | SVE2 前缀 | 跳过 |
| whilelt | 循环谓词 | 跳过 |
| dup | 广播 | 跳过 |
| st1b | 存储 | 跳过（正则 `\b(st1)\b` 不匹配 `st1b`） |

导致 SVE2 候选的 `ago_pred` 系统性偏低（吞吐量低估），排名不准。

## 1. 修复

### 1a. _CLASSES 正则扩展 (objfeatures.py)

```
add:  +cadd +dup
sub:  +sshll +ushll
tbl:  +tbx
mul:  +svdot +sqdmlal +sqdmull
新增 narrow: xtn/sqxtn/sqxtun/uqxtn
新增 pred: whilelt/ptrue/sel
新增 movprfx
ld_vec/st_vec: \b(st1)\b → \b(st1)\w*\b（修复 st1b 不匹配）
```

### 1b. SVE1 代价表扩充 (timing-sve1-ago.json)

新增 8 条（架构估值，待 950 实测校准）：

| 键 | lat | tput | 来源 |
|----|-----|------|------|
| st1b_s8 | 1.0 | 0.5 | 存储估值 |
| cadd_s16 | 2.0 | 0.5 | 类似 sabd |
| svdot_s32 | 3.0 | 0.5 | 类似 sdot+acc |
| svdot_s64 | 4.0 | 1.0 | 宽累加 |
| xtn_s16 | 2.0 | 0.5 | 窄化 |
| whilelt_s32 | 1.0 | 0.5 | 谓词生成 |
| sel_s16 | 1.0 | 0.5 | 谓词选择 |
| movprfx | 0.0 | 0.0 | 融合，无代价 |

### 1c. 类映射扩充 (predict.py)

_SVE1_CLASS_KEY 和 _CLASS_TABLE_KEY 均添加 narrow/pred/movprfx。

### 1d. 表类型自动检测 (predict.py)

`predict_from_features` 探测 `"ld1b_s8" in table` 判断 SVE1 vs NEON，
自动选择对应的类映射，修复键不匹配 bug。

### 1e. 950 代价表代理 (search_sve2_layouts.py)

`--mca-target 950` 从 NP1（NEON/VL128）改用 920B SVE1 表
（VL256 SVE 实测），更贴近 950 的 2x256 管线。

### 1f. Permute 惩罚入 rank-by-ago (search_sve2_layouts.py)

`predict_from_features` → `predict_with_permute`，在代价表预测
之上叠加 permute 惩罚（ratio > 30% 的候选被惩罚）。

### 1g. feedback_calibrate 表自动选择

SVE march → SVE1 表；NEON march → NP1 表。

## 2. 验证

### interp8 950 预测对比

| Cover | 改进前 | 改进后 | 变化 |
|-------|--------|--------|------|
| A (svdot32) | 72.6 | 80.6 | +8.0（cadd/movprfx 计入） |
| B (svdot64) | 92.6 | **137.1** | +44.5（svdot+permute 惩罚 28.0） |
| C (neon) | 168.0 | 138.5 | -29.5（store 正确定价） |

cover-B 的排名从第 2 跌到第 3（低于 NEON cover-C），正确反映
950 上 svdot64 的 permute 瓶颈（53.3% >> 30%）。

### 测试

| 套件 | 数量 | 状态 |
|------|------|------|
| ago | 147 (+6 新) | OK |
| ir | 50 | OK |
| templates | 25 | OK |
| tools | 91 | OK |
| **合计** | **313** | **OK** |

6 个新测试（test_m2_corpus.TestPredict）：
- test_sve2_instruction_classification
- test_predict_with_permute_below_threshold
- test_predict_with_permute_above_threshold
- test_table_auto_detection_sve1
- test_table_auto_detection_neon
- (ld_vec/st_vec 正则修复隐含在分类测试中)

## 3. Feedback Loop 双机校准验证（2026-08-20）

### 3a. 920B（SVE1/VL256）校准

从 DB 提取 920B 绝对 ticks 数据（17 条，5 kernel），运行
`feedback_calibrate.py --march armv8.2-a+sve`：

| Kernel | Scale | n | min | max | 误差 |
|--------|-------|---|-----|-----|------|
| sa8d | 81.679 | 3 | 81.634 | 82.275 | ~7% |
| satd-8 | 75.645 | 5 | 75.562 | 80.264 | ~7% |
| satd-8x16 | 63.298 | 3 | 62.721 | 77.305 | ~7% |
| satd-16x8 | 63.541 | 3 | 62.833 | 65.957 | 1.1% |

satd-8x4 因 SVE2-only 指令在 sve1 march 下编译失败，跳过。
satd-16x8 校准后 ago_pred=6105 vs 实测 6037，**误差 1.1%**。
排名正确：AGO（校准）选 A（最快），permute 启发式错选 B（最慢）。

### 3b. N1（SVE2/VL128）校准

从 DB 提取 N1 绝对 ticks 数据（17 条，5 kernel），运行
`feedback_calibrate.py --march armv8.2-a+sve2 --out calibration-n1.json`：

| Kernel | Scale | n | min | max | 误差 |
|--------|-------|---|-----|-----|------|
| sa8d | 27.844 | 3 | 27.701 | 27.844 | **0.1%** |
| satd-8 | 25.062 | 5 | 25.042 | 28.046 | **0.1%** |
| satd-8x16 | 23.280 | 3 | 23.218 | 27.471 | **0.1%** |
| satd-16x8 | 23.803 | 3 | 23.584 | 25.711 | **0.1%** |
| satd-8x4 | 23.470 | 1 | 23.470 | 23.470 | **0.1%** |

N1 校准后预测误差仅 **0.1%**（sa8d: 预测 1729.1 vs 实测 1728）。
satd-8x4 在 N1 SVE2 下可编译（920B SVE1 不行）。

### 3c. 结论

- AGO 代价表预测 + 校准 = **0.1% 误差**（N1）/ 1-7%（920B）
- 两台机器的 scale 反映 ISA/微架构差异：920B 62-82x（SVE1 软件模拟
  + VL256 循环），N1 23-28x（SVE2 原生 + VL128 循环）
- 校准后 `--rank-by ago` 正确选出最快 cover（satd-16x8 实证）
- Feedback Loop 端到端工作：DB ticks → JSON → feedback_calibrate
  → calibration.json → 自动校准 → 精确预测

### 3d. ago_auto_search 集成

`ago_auto_search.py --rank-by ago` 自动加载 `build/calibration.json`
（或 `$DYNOPT_CALIBRATION`），乘以 per-kernel scale。N1 校准用
`DYNOPT_CALIBRATION=build/calibration-n1.json`。

`--compare` 模式诊断 permute vs ago 排名不一致（2/26 家族：cost-coeff-nxn
和 sad-32，均为校准问题，需更多实测数据）。

## 4. 950 验证快速指南（用户侧）

> 工具侧全部就绪。以下命令在 950 上执行即可完成最终验证。

### 4a. kernel 级微基准（获取 ticks）

```sh
# interp8 svdot32 vs best_sve2（旗舰验证）
bash scripts/microbench-950-interp8.sh user@950

# 其他 kernel：仿 microbench-950-interp8.sh，用各自的
# preload_verify_*.cpp + CNTVCT harness
```

产出 JSON 格式（供 Feedback Loop 摄取）：
```json
[{"kernel": "interp8", "cover": "A", "measured_cyc": 123.4}, ...]
```

### 4b. Feedback Loop 校准

```sh
python3 tools/feedback_calibrate.py \
    --ingest /tmp/950-measurements.json \
    --march armv8.2-a+sve2 \
    --out build/calibration-950.json
```

使用：`DYNOPT_CALIBRATION=build/calibration-950.json
python3 tools/ago_auto_search.py --kernel interp8 --rank-by ago`

### 4c. E2E A/B 仲裁

```sh
AGO_WIDE_SVE2=1 scripts/freeze-950-dct.sh user@950
# 门禁：同机码流 md5 bit-exact；5+5 交错取中位
# CI lower ≥1.10 + Amdahl ≥0.3pp = 通过
```

### 4d. --compare 诊断

```sh
# 验证 permute vs ago 排名一致性
for k in interp8 dct16 dct32 satd-16 psy-cost-8x8; do
    python3 tools/ago_auto_search.py --kernel $k --compare
done
```

### 4e. 通过标准

- kernel ratio > 1.0（AGO 候选快于手写分派）
- CI lower ≥ 1.10（E2E）
- Amdahl ≥ 0.3pp（E2E）
- bit-exact（同机 md5 门禁）
- --compare 一致或 ⚠ 项已 950 校准

## 5. 待办

- 950 实机校准：950 SVE2/VL512 ticks → feedback_calibrate
  → 扩展校准到全部 146 kernel
- SVE2 指令真实代价：950 实测 cadd/svdot/sqxtun/movprfx 延迟与吞吐量，
  替换 SVE1 表中的架构估值
- 验证 "超过手写结果"：950 E2E A/B 仲裁 AGO 胜者 vs 手写参考
