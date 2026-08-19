# 94 · 有界非 bit-exact 搜索轴（docs/87 步骤 7）

把“有界偏差”从仲裁备注升级为正式搜索轴：候选按**偏差预算**分类，
DB 用规范文法记 `bit_exact=no (bounded: ...)`，发布边界由
step-6 的真实输入包络与 950/TBL 终验共同约束。

## 1. 轴定义

输入：
- kernel 的 cover 集合（注册表序号空间，doc/88 §1）
- 偏差预算 bound（见 §2）
- 样本数 N（默认 300，与 step-5 dev_profile 同一 harness）

输出（每 cover 三分类）：
- `exact`：max_abs == 0 → `bit_exact=yes`
- `bounded`：0 < max_abs <= bound → `bit_exact=no (bounded: ...)`
- `exclude`：max_abs > bound → 保留 upstream（禁止发布）

实现：`tools/bounded_search.py`（复用 dev_profile 差分 harness，无重复
代码生成）：
```
python3 tools/bounded_search.py --kernel dct32 --bound 32767 --samples 300 --db
python3 tools/bounded_search.py --kernel dct32 --bound 2880 \
    --json release/step7-qemu/bounded-dct32-envelope2880.json
```

## 2. bound 的三层来源

| 来源 | 值 | 用途 |
| --- | --- | --- |
| 注册表硬上限（docs/88 §1 `bound` 字段） | dct32=32767（kernel 位宽内最大可表示偏差） | 发布准入的不可逾越上限 |
| step-6 剪辑 md5 不变包络（docs/93） | 本语料/preset 下 replay max_abs<=2880 时视频 md5 不变 | 同机“安全包络”参照 |
| 目标机 replay 包络（docs/93 回放主机在 950 上重放录制 trace） | 目标机实测 | 最终发布依据（step 8） |

示例：dct32 轴以硬上限 32767 跑, cov4 op4032 = bounded
（measured=12096, diff=3304/200→2176/300）；若以剪辑包络 2880 为
bound（保守模式）同样数据 = exclude——用来提醒：**随机差分画像不能
单独证明“视频 md5 不变”**，两者口径不同，发布走 §4 决策流时以目标机
回放包络 + 指定视频 md5 为准。

## 3. DB 文法（kernel-test-db）

规范字符串（`bit_exact` 列）：

```
yes
no (bounded: max_abs<=<B>; measured=<M>; diff_count=<D>; md5-envelope=<ref>)
```

- 解析语义：`kernel_db.parse_bit_exact()` → `("yes", None)` /
  `("bounded", "max_abs<=B; ...")`；`kernel_db.add` 校验合法性，
  `kernel_db.query --bounded` 只取有界行。
- 新行（本次执行）：
  `dct32-4-bounded-axis-2026-08-19-cf69379`，variant=cov4，
  candidate_file=kernels/dct32/candidates/best_sve2_op4032.cpp，
  machine=qemu-cpuid0，kernel_value=12096，
  bit_exact=`no (bounded: max_abs<=32767; measured=12096; diff_count=3304;
  md5-envelope=clip128x128x24 preset=faster qemu: max_abs<=2880 (docs/93))`。
- 注册表侧：cover 可选 `bound`（发布上限，正整数）与 `deviation`
  （实测 max_abs，非负）；`cover_registry.py --bind-bound kernel=id:bound`
  写入，`cover_bound()` 读取，单测覆盖非法 bound/负 deviation/id0 禁绑
  （tools/test_cover_registry.py，17 用例全绿）。

## 4. 决策流（与 step 2/6/8 衔接）

```
候选 → dev_profile 画像 → bounded_search 轴分类
  exact        → bit_exact=yes → preset ordinal（0 除外）可默认
  bounded      → speedup>1.05? 
                   是 → preset 候选（step 2）→ 目标机/指定视频 md5 +
                        TBL（step 6/8 门禁，950 终验）
                   否 → hold_bounded（保留）
  exclude      → 不进入 preset，保持 upstream
```

有界候选进入 preset 前必须满足（docs/93 §结论 3）：
(a) 注册表 bound 内（轴通过）；(b) 目标机回放包络在 bound 内；
(c) 指定视频（内网 8K 实测集）整段 md5 不变（record 模式对照）；
(d) TBL/lite 或加强版以目标机为准的强度配置。

## 5. 产物

- `release/step7-qemu/bounded-dct32-32767.json`（硬上限轴，cov1-3 exact，
  cov4 bounded 12096/3304）
- `release/step7-qemu/bounded-dct32-envelope2880.json`（剪辑包络轴，
  cov4 exclude——保守口径）
- `data/kernel-test-db.csv` + 自动生成的 `data/kernel-test-db.md`
  （bounded 行已导出）
- `tools/bounded_search.py` / `tools/kernel_db.py --bounded` /
  `tools/cover_registry.py --bind-bound`

## 6. 已知限制

- qemu 代理（cpuid=0 基线）的 max_abs 与真实 asm 上游口径不同：
  轴产物是随机差分画像，目标机包络必须用 step-6 回放工具在 950 重跑。
- 剪辑包络 2880 仅对本语料/preset（faster）标定；换 preset/码率需重标。
- 有界候选的“性能”门槛缺 950 实测前不作 ship 判断（docs/92 仲裁延续）。
