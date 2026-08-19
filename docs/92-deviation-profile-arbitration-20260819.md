# docs/92: 偏差画像工具 + op4032/sao/i8mm 重新仲裁（docs/87 步骤 5）

## 状态

步骤 5 完成：`tools/dev_profile.py` 把静态/MCA 降级为候选生成与粗筛之后的
**画像裁决层**跑通，并重跑三个高价值候选：

- dct32-op4032（950 +71% vs SVE / +40% vs NEON 的非 bit-exact 候选）
- interp8-32 best_ir / i8mm（原 “scan-only / LINK-FAIL” 候选）
- sao best_sve2 / best_sve2_e0（E0 两版候选）

qemu 代理全链路（编译 → 数值画像 → 每 cover A/B 计时 → 裁决 → 落库）已
闭环；950 实机数字留待 step 8（本步只做候选准入/存留判定）。

## 判权链（静态/MCA 降级后的第 4 道）

```
静态特征/MCA 粗筛（保留）
   -> 偏差画像：bit_exact / bounded / divergent（数值证据）
   -> 运行时分派 bench（AGO_BENCH 同机 A/B；本步用 mini-preload 探针 A/B）
   -> 新门禁：950 实测 + TestBenchLite/视频 md5（step 6/8，未在本步内）
```

`dev_profile` 负责前两层。输出字段即 docs/88 cover 注册表的偏差画像字段，
也是 step 7 有界发布的输入：

```
bit_exact   : 全部样本逐元素一致
max_abs     : 最大单元素绝对偏差
mean_abs_x1000 / l1 / l2_x1000 : 偏差分布
diff_count  : 累计差异元素次数（跨样本）
top_offsets : 偏差热点（off=offset:max=绝对值）
bound       : 本核允许偏差上界（dct=32767；interp/sao=0）
verdict     : ship / hold_exact / hold_bounded / exclude / missing
```

## 工具

```
python3 tools/dev_profile.py --kernels dct32,interp8-32,sao \
    --samples 300 --bench-iters 150000 --json release/step5-qemu/profile-qemu.json
```

- 每个 cover 独立编译（`multicover.plan_covers(..., extra_covers=...)`，
  候选在注册表序号尾部追加），生成 profile 二进制（upstream vs cover 数值对比）
  与探针（计时宿主加载 probe 后显式调用其 dynopt_patch_primitives() 再重读 slot。注意：x265 共享库链 DT_SYMBOLIC 且 CLI 只经 API 调用 setup，LD_PRELOAD 拦截器对共享库 CLI 不生效——A/B 探针已改为宿主 主动 patch 机制，见 docs/93）。
- 支持 `--scalars 'kernel=64,64,2'` 覆盖调用标量（相位矩阵用）、
  `--native` 直接上真机。
- 新单测：`tools/test_dev_profile.py`（verdict 策略、sao 原地参数映射、
  PROF 多行解析回归）、`tools/test_multicover.py` 新增 4 例（extras 规划）。

### 基础设施修正（本步骤顺手修的坑）

1. **covers_sao 指向错误文件**：cover A 此前 glob 到 `best_b0.cpp`
   （BO 签名），而 kernel sao 是 E0 槽；修正为 `A=best_sve2.cpp` +
   `B=best_sve2_e0.cpp`。
2. **i8mm 候选接入**：`best_sve2_i8mm.cpp` 导出宏生成名
   `dynopt_interp8_hpp_32x32_i8mm`，补规范名别名后进入 cov2。
3. **plan_covers 新增 `extra_covers`**：check-in 候选可直接作为 cover arm
   （ordinal 继续），`allow_ids` 同样生效。
4. **域约束画像**：画像上界必须等于可部署输入域，否则得到伪偏差——
   本步实测发现并修正两处（下节）。

## 域约束（画像有效性）

- **interp8-32（luma_hpp）**：生产调用只传 `xFrac = mv.x & 3 ∈ {1,2,3}`
  （predict.cpp `predInterLumaPixel`）。相位矩阵实测：phase 1–3 两 cover
  全部 bit-exact；phase 4–7 出现 max=255 的系统偏差——**不可达域伪象**。
- **sao（saoCuOrgE0）**：signLeft 状态域为 ±1 级内部状态。把画像输入域从
  任意 int8 收窄到 `{-1,0,1}` 后，两 cover 由 “max=15 偏差” 变为 bit-exact。
- **upstream 变体一致性**：`refcheck`（tools 外快速验证，见
  release/step5-qemu）确认 C 与 NEON+dotprod luma_hpp 输出逐字节一致
  （ndiff=0），qemu 上 `cpuid=0` 基线对 interp 是有意义的代理。

## 仲裁结果（qemu 代理，2026-08-19，commit cf69379）

| kernel | cover | 画像 | verdict | 说明 |
|---|---|---|---|---|
| dct32 | cov1 A/B/C | exact | hold_exact | 与 step-4 preset 默认一致；qemu 0.295/0.313/0.295 |
| dct32 | cov4 op4032 | bounded max=12096 (≤32767) | hold_bounded | 950 优势 +71% 待 step 8 实测；qemu 0.588（补丁计时已修，见 docs/93；qemu 标量代理不作发布依据） |
| interp8-32 | cov1 best_ir | exact（phase 1–3） | hold_exact | qemu 0.749；950 复测待 step 8 |
| interp8-32 | cov2 i8mm | exact（phase 1–3） | hold_exact | qemu 0.801；此候选首次进入可运行管线（原 LINK-FAIL/scan-only） |
| sao | cov1 best_sve2 | exact（300 iters, 真实 sign 域） | ship | qemu 1.001（真实补丁计时） |
| sao | cov2 best_sve2_e0 | exact | hold_exact→ship 竞逐 | qemu 1.229（真实补丁计时，>1.05 候选） |

- 阈值：exact 要求 speedup > 1.0；bounded 要求 > 1.05；qemu 单次
  噪声已记录，不作为发布依据。
- 计时修正（docs/93）：此前 A/B 两臂均未真正 patch（LD_PRELOAD
  拦截对 SYMBOLIC 共享库 CLI 无效），旧数字为纯噪声；本表数字为
  修正机制（宿主显式调用 probe patch 后重读 slot）重跑结果。
- 仲裁结论：三组候选**均不因画像被否决**；op4032 是 step 7 有界发布
  （bit_exact=no (bounded: max_abs<=32767)）的第一个高价值对象；
  interp8-32 i8mm 从 “scan-only” 升格为可用候选；sao 双 cover 留待
  950 裁 default。

## 数据落库

- `data/kernel-test-db.csv` +5 行（dct32-op4032 bounded、interp8-32 x2
  phase-domain、sao x2）。
- `release/step5-qemu/profile-qemu.json`：完整 profile + arm 计时 + verdict。
- `release/step5-qemu/interp8-32-phase-matrix.json`：相位 1–7 矩阵证据。

## 与后续步骤衔接

- step 6（TBL↔视频 md5）：interp/sao 的 bit-exact 候选直接进回放门，
  op4032 走 bounded 候选回放（有界偏差允许）。
- step 7（有界非 bit-exact 搜索轴）：dev_profile 的 `bound` + `max_abs` +
  `top_offsets` 即候选画像字段；`bit_exact=no (bounded: ...)` 进入 manifest。
- step 8（950 终验）：本步全部 hold_* 候选进入 AGO_PRESET 实测池，
  由运行时分派与 950 实测定 default。
