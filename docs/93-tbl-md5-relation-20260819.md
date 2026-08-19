# 93 · TBL↔视频 md5 关系实验（录制模式 + 真实输入回放）

主线 docs/87 第 6 步。目标：建立 x265 三层门禁（TestBenchLite 随机输入、
真实输入回放、整段编码 md5）之间的经验关系，为第 7 步“有界非 bit-exact
候选发布”提供量化依据。

## 实验对象

- kernel：dct32；候选：`best_sve2_op4032`（有界偏差画像 max=12096，
  docs/92；测试基准改为 QEMU sve-max-vq=2 代理机）。
- 真实输入语料：确定性合成 YUV420 128x128 24 帧（梯度 + 锐边块 +
  条纹噪声；`tbl_md5.py --genclip` 可换成任何真实视频路径——外网
  用合成语料，内网同构替换为指定视频即可，接口不变）。

## 工具与产物

```
python3 tools/tbl_md5.py --experiment --static-build build/x265-8-static-cli2 \
    --res 128 --frames 24 --out release/step6-qemu/report.json
```

- 静态 x265 CLI：`build/x265-8-static-cli2`（aarch64 交叉、CLI 静态链接，
  注入可重链接）。基线/录制/候选三份 CLI 由 `--inject` 模式产出：
  - **录制模式**（recorder）：primitives.cpp 尾调 `dynopt_patch_primitives()`
    （沿用 `x265-dynopt-setup.patch` 的注入点），recorder 保存上游 slot 并
    包装 dct32，`AGO_TRACE=path` 时逐调用写 trace v1：
    `AGO1 | ver | kernel | seq | stride | sblen | dblen | src bytes | dst bytes`
    （逐字段写入，无结构体对齐填充；dst 即上游输出的快照）。
  - **候选模式**（candidate）：`AGO_LEGACY_DCT32=1` 走 build_preload_so
    legacy 注入，把 op4032 装进 slot。
- 回放主机：`build/step6/replay trace` 直接链接 op4032.o，逐记录重放
  真实输入（upstream=lib 的 C dct32，cpuid=0），输出
  `RPL total eq diff_calls up_ok max cnt eq_rec cnt_rec max_rec` 与
  前 5 个偏差热点 offset。
- TestBenchLite：`scripts/build-testbench-lite.sh <op4032.o> ...`，
  `--gate dct32 --seed` 连跑 3 粒种子。

## 结果（release/step6-qemu/report.json，deterministic）

| 门禁 | 结果 |
|---|---|
| 整段编码 md5（基线 vs 录制） | `5f5771e2…` == `5f5771e2…`（录制一致性 true） |
| 整段编码 md5（基线 vs op4032 注入） | `5f5771e2…` == `5f5771e2…`（**未变**） |
| TestBenchLite dct32 3 种子 | PASS × 3（x265 自带随机 harness 抓不到 op4032） |
| 回放（真实输入，666 调用） | 663/666 与 C 上游逐元素一致；3 调用偏差，16 元素，max=2880, top offsets 704/128/129/64/576 |
| 回放 vs 录制时上游（asm） | 全部 666 调用均有偏差，max_rec=18575（asm dct32 与 op4032 全量不同） |

关系判定（report.relation= `tbl_pass_md5_pass_replay_bounded`）：

1. TBL(x265 自带) 对 op4032 是**过弱**的门禁——随机 harness 全 PASS，
   内网曾报“op4032 随机输入能触发 md5 改变”的是**加强版 TBL**（更狠的
   输入工程），两者不可混用；本步把“加强版随机”作为 dev_profile 画像
   （max=12096）长期保留。
2. 真实输入回放是**敏感度阶梯的中间层**：op4032 在真实编码调用上确有
   3/666 调用、max=2880 的偏离，但该偏离没有超出量化包络，整段 md5
   不变。
3. 因此 step 7 的有界门禁应为：**（a）dev_profile 画像给出 bound 上界；
   （b）真实输入回放给出同机偏差包络；两者都在 bound 内 +（c）整段
   视频 md5 不变**才算有界候选发布通过。本剪辑下（preset=faster,
   QP 域 >30）经验包络：`max_abs<=2880, diff_calls<=3, diff_count<=16`
   → md5 不变；不同 preset/码率需按同法重新标定，这正是内网需用真实
   视频补的样本。
4. 同机性：视频 md5 只能做同机回归（与 docs/87 推论 2 一致）；回放
   主机在目标机上重放录制 trace 即可把包络标定到目标机，不依赖两机
   bitstream 一致。

## 顺带修正（含 docs/92 增补）

发现 dev_profile 计时臂此前并未真正 patch：x265 共享库链接
`DT_SYMBOLIC`，CLI 又只经 API 调 setup，LD_PRELOAD 的
`x265_setup_primitives` 拦截器对共享库 CLI 不生效，导致 A/B 两臂都计时
上游、数值纯噪声。已修：probe 编译带 `-DX265_NS=x265` 且计时宿主在
加载 probe 后显式调用其 `dynopt_patch_primitives()` 再重读 slot；数字
重跑后有真实差异（sao cov2 1.229、dct32 cov1-3 0.30/0.31、op4032
0.588、interp8-32 0.75/0.80，qemu 标量代理）。静态 CLI 注入则直接
依赖 primitives.cpp 的 dynopt patch 调用点（CLI 级 md5 实验的可靠路径）。

## 已知限制

- qemu 代理的 asm 路径与目标机不完全等价；`up_ok=0` 的原因正是录制时
  CLI 走 asm dct32、回放以 C 为基准——两个对照都保留在报告里，最终包络
  以目标机（950/target）上的录制-回放为准。
- 合成语料对 dct32 的调用分布（666 次）偏小；内网指定视频接入后按同
  工具重跑即可扩大样本，接口不变。
- trace v1 无校验和，仅用于回放；录制文件 2.8MB/24 帧，放大帧数即放大
  样本。

## 交接物

- `tools/tbl_md5.py`：genclip / inject(recorder|candidate) / encode /
  replay / tbl / experiment 单入口。
- `release/step6-qemu/report.json`：完整 JSON（md5 ×3、replay 统计、
  TBL 三种子、relation）。
- `build/step6/`：CLI 三件、trace、回放主机、lite 二进制。
- docs/87 §1 推论 1 已由本步实验直接支撑；step 6 在落地顺序表标记 DONE。
