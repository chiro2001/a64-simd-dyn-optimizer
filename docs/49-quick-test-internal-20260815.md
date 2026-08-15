# 内网 920B / 950 快速实测指南（2026-08-15）

## 1. 用途

在内网可直达的 920B（SVE1 2x256 + NEON 4x128，无 PMU）与 950
（SVE2.0 及以下）上，快速获取：

- kernel 级 CNTVCT paired A/B（上游 NEON/SVE2 基线 vs 本项目候选）；
- 关键算子的 20k 差分/TestBenchLite 门禁结果；
- 可选：单算子或批量注入后的端到端编码时间与码流校验。

目标：把真机数据回填到搜索排序（`--rank-by bench920`）和报告里，为下一
轮优化提供依据。

## 2. 前置准备

### 2.1 仓库与构建

```sh
git pull origin main          # 与本地仓库同步到最新（含本轮 NEON 候选）
scripts/doctor.sh             # 环境体检（编译器/交叉工具链）
```

机器上需要 8-bit x265 静态库目录（quick-test 脚本按机器名查找）：

- 920B：`build/x265-8-920b/libx265.a`
- 950：`build/x265-8-950/libx265.a`

若内网机器没有这两个构建目录，可用交叉构建的
`build/x265-8-cross-make/libx265.a` 临时替代（脚本会 SKIP 找不到的项）。

### 2.2 编译器

- 原生 aarch64：优先 `g++`/`clang`；脚本会自动探测 SVE2p3 汇编能力并
  回退到 `aarch64-linux-gnu-g++`。
- 950 的 SVE2 候选建议同时测 `gcc -O2` 与 `clang -O3` 两档（920B 实测
  clang -O3 在 SVE1 搜索里通常更好，NEON sa8d16 则 GCC -O3 更好）。

## 3. 快速测试

### 3.1 一键脚本（推荐）

在目标机仓库根目录执行：

```sh
scripts/quick-test-real-machine.sh 920b reports/qt-920b-$(date +%s).txt
scripts/quick-test-real-machine.sh 950  reports/qt-950-$(date +%s).txt
```

脚本产出：

- 机器信息（uname/nproc/ISA/git commit）；
- TestBenchLite 门禁（920B 只跑 sa8d；950 跑 interp8/sa8d16/dct/idct）；
- paired CNTVCT 行：idct16/32（substituted）、interp8 path-B 8/16/32
  （sub）、dct8、sa8d16（950 用 SVE2 best_sve2，920B 用 NEON
  best_sve1）、entropy 族（scan/cost/flag/remain，总节拍/4096 次）。

`neon/cand` 比率 >1 表示候选反超上游；substituted 行是形状替换的估算
（docs/29）。

### 3.2 手工 kernel A/B（候选搜索后）

```sh
# sa8d16（920B 用 kernels/sa8d16/candidates/best_sve1.o）
aarch64-linux-gnu-g++ -O2 -static -std=c++11 -DX265_NS=x265 -DX265_DEPTH=8 \
  -DHIGH_BIT_DEPTH=0 -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_sve2 \
  -DDYNOPT_CANDIDATE16=dynopt_sa8d_16x16_sve2 \
  -I third_party/x265/source -I third_party/x265/source/common \
  -I build/x265-8-cross-make benchmarks/sa8d_microbench.cpp \
  kernels/sa8d/candidates/best_sve2.o \
  kernels/sa8d16/candidates/best_sve1.o \
  -Wl,--start-group build/x265-8-cross-make/libx265.a -Wl,--end-group \
  -lpthread -ldl -o /tmp/sa8d16-bench
scripts/bench-generic-paired.sh /tmp/sa8d16-bench 16x16 neon cand 25 8
```

注意：云端/内网老 libstdc++ 必须 `-static`，否则运行时报
`GLIBCXX_3.4.32 not found`。

### 3.3 搜索 + 真机回填排序

```sh
python3 tools/search_sve2_layouts.py --kernel sa8d16 --isa sve1 \
  --opt-extra "-O3 -frename-registers --param=sched-pressure-algorithm=1" \
  --bench-920b user@<内网920B> --bench-top 8 --rank-by bench920 \
  --outdir experiments/m30-sa8d16-search/bench920
```

`--rank-by bench920` 会按 920B CNTVCT `neon/cand` 比率从高到低排序，
未回填的候选排最后。920B 的 sa8d16 空间已统一覆盖
`load=sve|mixed|neon`（`load=neon/quad=pair` 目前实测最优，~1.06–1.12×）。

## 4. 端到端（可选，单算子注入）

```sh
python3 tools/build_preload_so.py --isa sve1 --kernels sa8d16 \
  --opt "-O3 -frename-registers --param=sched-pressure-algorithm=1" \
  --inject-outdir build/dynopt-inject-sa8d16
# 打包 out/ + work/ 传到内网机器后：
#   1) 恢复 libx265.so.216 为纯基线（去掉 dynopt 对象重链）
#   2) 应用 x265-dynopt-setup.patch，把对象并入链接行，重链
#   3) 编码前必须校验码流 md5 与基线一致（如 7981.54 kb/s / QP 33.77）
#   4) 计时：taskset -c 0 x265 --input yuv ... -o /dev/null
```

920B 真实 1080p 30 帧基线约 8.17 s；单算子注入收益若 <0.3% 会落在噪声
内，建议攒够多个 NEON 候选后做批量注入再比较。

## 5. 当前候选与已知问题（2026-08-15）

| kernel | 920B 实测 | 状态 |
| --- | --- | --- |
| sa8d16（NEON vaddlv-pair，best_sve1） | 延迟 1.12× / 吞吐 1.15× | 20k 差分 0 失配，可注入 |
| scanPosLast（NEON tail，best_sve2） | 单 CG 1.04×；多 CG ~1.10–1.14× | 码流一致，可注入 |
| costC1C2Flag（run-cache） | 微基准 ~1.68× vs C 标量 | 200k 差分 0 失配，但**该槽位被替换为任何实现（含与 C 参考逐字相同的标量副本）都会改变编码输出**（基线确定性 3 次 md5 一致，注入后 7974.26 kb/s / QP 33.78 vs 基线 7981.54/33.77）；原因未明，暂不用于 E2E 注入 |
| costCoeffRemain | 微基准 ~1.02× | 与基线码流一致（ee5db7…），可注入；早前“码流改变”为云端构建状态混乱导致的误判 |
| sa8d16 mixed（SVE1 宽装载+NEON H） | 0.92–0.95× | 负结果，保留为搜索轴 |

### costC1C2Flag 槽位替换现象（待查）

2026-08-15 排查记录：云端 920B 真机（x265-8-gcc，确定性能基线）上，
把 `primitives.costC1C2Flag` 通过编译期 patch 替换为以下任意实现都会使
编码输出从 `ee5db7…`（7981.54 kb/s / QP 33.77）变为 `22c4b7…`
（7974.26 kb/s / QP 33.78）：

- NEON run-cache 候选（200k 差分 0 失配）；
- 与 C 参考逐字相同的标量副本（仅 DYNOPT 内嵌表替代 extern 表）。

槽位偏移已验证正确（costC1C2Flag=7072、costCoeffRemain=7064），链接
候选对象本身（不 patch）不改变输出。原因待查：可能是该槽位在 x265 中
存在未记录的副作用契约或 patch 时机问题。结论：**该 kernel 暂不用于
端到端注入**，微基准 1.68× 收益保留为搜索/后续参考。

## 6. 结果回填

```sh
tools/parse_quick_report.py reports/qt-*.txt   # 汇总 paired 表
```

手工数据建议按 docs/48 的表格格式回填：kernel、形状、上游中位、候选
中位、neon/cand 比率、编译档（gcc/clang、-O2/-O3）、日期与 commit。

## 7. 注意事项

- CNTVCT 在内网/云端约为百 MHz 级，per-call 取整会把小 kernel 压成
  0/1；统一用「总节拍/批次」口径（entropy 微基准已改），batch 取
  4096+。
- 920B 无 PMU；`perf cpu-clock` 只能做热点占比，不能做指令级采样。
- 950 没有主动实机时，SVE2 候选先用本地 QEMU（`sve-max-vq=2`）做
  20k 差分 + MCA，再到内网 950 补 CNTVCT。
- 每次实机数据请带上 git commit，避免跨版本混用。
