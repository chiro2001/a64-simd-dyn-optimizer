# 950 / 920B 内网快速测试（2026-08-16 版，近期执行）

目的：950（SVE2 2x256）首轮 E2E（用新 op 后端 dct16/dct32 候选），
920B（NEON）回归基线；两者都出 bit-exact 门禁与 paired CI。

## 0b. 就绪核验（2026-08-17，git 70ad366）

- `FROZEN=1` 路径（docs/73 冻结发布集：14 kernel，dct16/32 走
  AGO_IR_DCT=1 best_ir_sve8）在本地构建通过：14 对象 + patch，
  SVE2 ISA 违规 0（dct16/32 为混合 NEON+SVE2，非纯 SVE 模式，
  属预期）；
- op4032 opt-in 路径（AGO_LEGACY_DCT32=1，策略放行项）构建通过；
- 用户侧动作保持一键：`FROZEN=1 scripts/freeze-950-dct.sh user@host`
  （可选 `AGO_IR_SVE16=1` / `GATE=1`），跑完后
  `python3 tools/m4_declaration.py` 出最终 M4 声明。

## 0. 内网 E2E 测试媒体（2026-08-16 更新）

内网机器（950/920B internal）无法 ssh 到公网 920B/710，下载走 GitHub：

- Release：https://github.com/chiro2001/a64-simd-dyn-optimizer/releases/tag/e2e-media-20260816
- 源视频：1416529-hd_1920_1080_30fps.mp4（7.5MB，md5
  f081565cbee2ba7a43a0550035bd4099）
- 复现命令：README-e2e-media.txt（同一 release 内）

yuv 来源（已逐字节验证）：

| 文件 | 源视频帧 | yuv md5 |
| --- | --- | --- |
| real_1080p_30f.yuv | 帧 0..29 | e20e4c9e5e82f338c6cdf05787cf6cd3 |
| real_1080p_100f_b.yuv | 帧 100..199 | 0f0c65c1f54a19ca53927f6efd430016 |

下载 mp4 后生成 yuv（目标机装 ffmpeg）：

```sh
# 30f
ffmpeg -y -i 1416529-hd_1920_1080_30fps.mp4 \
  -frames:v 30 -pix_fmt yuv420p -f rawvideo real_1080p_30f.yuv
# 100f（帧 100..199；select 里的逗号按 shell 转义）
ffmpeg -y -i 1416529-hd_1920_1080_30fps.mp4 \
  -vf "select='gte(n\\,100)'" -frames:v 100 \
  -pix_fmt yuv420p -f rawvideo real_1080p_100f_b.yuv
```

注意：`--frames 100` 不会补帧，输入必须是真实 100 帧的
`real_1080p_100f_b.yuv`（311,040,000 B），否则“100f”读数实为 30f
（2026-08-16 曾踩坑，见 reports/entropy-ablation-920b-20260816.txt）。
公网机器上已有副本：920B `/home/chiro/e2e-media/`、710
`/root/e2e-media/`（同一 mp4 + README）。

## 1. 950 快速测试

### 前置
- 仓库同步到 HEAD（含 kernels/dct16/candidates/best_sve2_op895.cpp、
  kernels/dct32/candidates/best_sve2_opbase.cpp 与
  best_sve2_op4032.cpp）；
- 机器：SVE2 2x256（VL=256）、cmake/ninja/g++、yuv
  `/tmp/real_1080p_30f.yuv`；
- 干净 SVE2 x265 构建（注意 ENABLE_NEON_I8MM 必须 ON，否则 CMake
  级联关 SVE/SVE2）：
```sh
cmake -S third_party/x265/source -B build/x265-8-gcc -G Ninja \
  -DCMAKE_BUILD_TYPE=Release -DENABLE_TESTS=OFF \
  -DENABLE_NEON=ON -DENABLE_NEON_DOTPROD=ON -DENABLE_NEON_I8MM=ON \
  -DENABLE_SVE=ON -DENABLE_SVE2=ON -DENABLE_SVE2_BITPERM=OFF \
  -DENABLE_SHARED=ON
cmake --build build/x265-8-gcc --parallel "$(nproc)"
```

> 一键流程（2026-08-16 晚补充）：23-kernel bundle
> `build/dynopt-best9-950-new` 已预构建；拿到 950 访问后直接跑
> `scripts/freeze-950-dct.sh user@host`（5+5 A/B + md5 门 + paired CI；
> `GATE=1` 附加 dct16/dct32 原生 TestBenchLite）。原生门禁脚本为
> `scripts/build-testbench-lite-native.sh`（`build-testbench-lite.sh`
> 的 `RUN_MODE=native` 变体，CXX 可用 `g++`）。

### 步骤
```sh
# 1) 构建 23-kernel bundle（dct16=op895、dct32=opbase，默认 upstream-exact）
python3 tools/build_preload_so.py --isa sve2 --vl 32 \
  --kernels cost-c1c2-flag,cost-coeff-nxn,cost-coeff-remain,sa8d16,satd-8,\
scan-pos-last,interp8-vps-8x8,interp8-vps-8x16,interp8-vps-16x16,\
interp8-vps-16x32,interp8-vps-32x16,interp8-vps-32x32,sao-stats-bo,\
sao-stats-e1,sao-stats-e2,sao-stats-e3,dct8,dct16,dct32,\
interp8vpp-16,interp8vpp-32,interp8-16,interp8-32 \
  --opt=-O3 --inject-outdir build/dynopt-best9-950-new \
  --workdir build/preload-work-best9-950-new \
  --json build/dynopt-best9-950-new/report.json

# 2) TestBenchLite 门禁（dct16/dct32，5 seed；在 950 原生跑）
scripts/build-testbench-lite-native.sh \
  build/preload-work-best9-950-new/dct16.o build/x265-8-testbench \
  --gate dct16 --seed 1   # 再跑 2/0x12345678/0xDEADBEEF/987654321
scripts/build-testbench-lite-native.sh \
  build/preload-work-best9-950-new/dct32.o build/x265-8-testbench \
  --gate dct32 --seed 1

# 3) 30f E2E（bit-exact 门禁；opbase/op895 应通过）
bash scripts/freeze-best9-950.sh root@<950>
#   期望：opt/base md5 一致（950 本机 hash），5+5 paired CI；
#   dct16/dct32 的 fused_uop 收益转周期在此裁决。

# 4)（可选，需政策决策）legacy 4032：AGO_LEGACY_DCT32=1 重建 bundle
#    → 非 bit-exact（legacy-internal-exact，TestBenchLite 门禁已过）
#    → 需用户确认是否接受非 bit-exact 发布。

# 5) perf profile：确认 dct16/dct32 热点占比下降
perf record -e cpu-clock -F 999 -- ./build/x265-8-gcc/x265 ...（注入后）
```

## 2. 920B 快速测试

### 步骤
```sh
# 现状：920B 的 dct 候选是 VL=256 SVE2（op895/opbase），920B 无法
# 使用；本版先回归 best9（13 kernel NEON）基线：
bash scripts/freeze-best9.sh chiro@124.70.206.229
#   期望：bit-exact（ee5db7…），30f ~ -2.06%，CI 显著

# NEON dct16/dct32 迁移候选已就绪（docs/64 §3.1.1），但 920B 实机
# 3+3 中位 8179→8202ms（+0.28%）——kernel 微基准赢面未转 E2E，
# **920B 本版不发布 dct 候选**，维持 best9 回归。若后续 k 族结构轴
# 反转，再追加：
#   AGO_NEON_DCT=1 python3 tools/build_preload_so.py \
#     --isa sve1 --vl 16 --kernels dct16,dct32 --opt=-O3 ...
```

## 2.5 N1 快速测试（已实测，2026-08-16）

N1（NEON-only，ENABLE_SVE=OFF）可发布 dct16/dct32 纯 NEON fused
候选：30f E2E 3+3 中位 12129→11996ms（**-1.10%**），bit-exact
（md5 一致）。

```sh
AGO_NEON_DCT=1 python3 tools/build_preload_so.py \
  --isa sve1 --vl 16 --kernels dct16,dct32 --opt=-O3 \
  --out build/dynopt-vl128-dct-neon.so
LD_PRELOAD=$PWD/build/dynopt-vl128-dct-neon.so ./x265 ...  # A/B 同 710
# kernel 级（benchmarks/preload_verify_dct.cpp）：
#   dct16 11→8（-27.3%）、dct32 74→73（-1.3%），契约内 0 失配
```

注意：N1 工作树有用户暂存的批量删除，勿在 N1 上 checkout/reset；
本地交叉编译 .so 后 scp 到 N1 即可（不依赖 N1 的 tools/）。

## 3. 输出与记录
- 每台机器：md5（bit-exact 门）、base/opt 中位、paired CI；
- 950 追加：dct16/dct32 TestBenchLite 5-seed 结果、perf 前后热点；
- 结果回填 docs/59 与 reports/，并同步 remote。
