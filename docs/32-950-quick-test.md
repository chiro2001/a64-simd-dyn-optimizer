# 950（920G）快速测试指南（2026-08-14）

> 目标：给“自动跑测试的 Agent”一份可直接执行的清单，产出可复制粘贴的
> 文字报告。950 = 鲲鹏 920G：**SVE2 2×256 / NEON 4×128，不支持
> SVE2p1 以上**。所有命令在 950 上原生编译/运行（本仓库交叉编译产物
> 也能跑，但建议在 950 上用相同命令重编一次，环境更干净）。

## 1. 测试矩阵（什么能测、怎么测）

| 内核 | 候选 | ISA | 950 能否原生 | 测试方式 |
| --- | --- | --- | --- | --- |
| dct8 | best_sve2（sdot.d + NEON bridge） | SVE1+NEON | ✅ | 原生 paired |
| dct16/dct32 | best_sve2 / best_op_r16 | 部分 SVE2p1 sdot | ⚠️ | 替换（sve2 目标） |
| idct16/idct32 | best_sve2（SVE2p1 sdot） | SVE2p1 | ⚠️ | 替换（sve2 目标） |
| sa8d16 | best_sve2（cadd） | SVE2 | ✅ | 原生 paired |
| interp8 hpp path-A 8x8 | best_sve2（sdot.d+rshrnb） | SVE2 | ✅ | 原生 paired |
| interp8 hpp path-B 8/16/32 | best_sve2_sdoth（sdot.h） | SVE2p3 | ❌ | 替换（sve2 目标，高估上界） |
| interp8 vpp 16/32 | best_sve2（滑动行管线） | SVE2 | ✅ | 原生 paired |

替换口径（docs/29）：数值不保真，只用于 CNTVCT cycle 预估；结果按
“上界/下界”解读（BtoS 替换会高估 dot 工作量）。

## 2. 准备（在 950 上，仓库已同步）

```sh
cd <repo> && git pull && git log -1 --oneline
# x265 参考库（若缺失）：
cmake -S third_party/x265/source -B build/x265-8-950 \
  -DCMAKE_TOOLCHAIN_FILE= -DENABLE_ASSEMBLY=ON -DENABLE_CLI=OFF \
  -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ \
  -DCMAKE_C_FLAGS="-march=armv8.2-a+sve2" \
  -DCMAKE_CXX_FLAGS="-march=armv8.2-a+sve2"
cmake --build build/x265-8-950 -j$(nproc)
# 之后所有脚本用 BUILD=build/x265-8-950
```

## 3. 门禁（正确性，必须 PASS）

```sh
# 一次性构建 lite（链接所有已固化候选）
bash scripts/build-testbench-lite.sh \
  kernels/interp8/candidates/best_sve2_sdoth.o \
  build/x265-8-950 -- --gate interp8 --seed 1
# 2026-08-14 起脚本自动链接 idct16/32 等全部候选，一次构建后 7 个
# gate 都能跑（没有 dct8 gate；dct8 用 20k 差分即可）：
build/testbench-lite/TestBenchLite --gate interp8 1 2>&1 | tail -1
build/testbench-lite/TestBenchLite --gate sa8d16 1 2>&1 | tail -1
build/testbench-lite/TestBenchLite --gate dct16 1 2>&1 | tail -1
build/testbench-lite/TestBenchLite --gate dct32 1 2>&1 | tail -1
build/testbench-lite/TestBenchLite --gate idct16 1 2>&1 | tail -1
build/testbench-lite/TestBenchLite --gate idct32 1 2>&1 | tail -1
```

**预期**：interp8（hpp 8/16/32 + vpp 16/32）PASS、sa8d16 PASS、
dct/idct 各 gate PASS。任何 FAIL 先停止，不要进 paired。

## 4. paired 性能（CNTVCT，每内核一组）

通用 paired 脚本（输出 median/geomean/min/max）：

```sh
bash scripts/bench-generic-paired.sh <bin> <shape> <implA> <implB> 30 16 /tmp/p.csv
```

### 4.1 idct16 / idct32（替换 sve2 目标）

```sh
bash scripts/build-substituted-microbench.sh idct16 sve2 build/idct16_sve2sub
bash scripts/bench-dct32-paired.sh build/idct16_sve2sub neon cand
bash scripts/build-substituted-microbench.sh idct32 sve2 build/idct32_sve2sub
bash scripts/bench-dct32-paired.sh build/idct32_sve2sub neon cand
```

### 4.2 dct8（原生）

```sh
bash scripts/build-dct8-microbench.sh build/x265-8-950 build/dct8_mb \
  kernels/dct8/candidates/best_sve2.cpp
# dct8_microbench 无 shape 参数：
taskset -c 0 build/dct8_mb neon latency 1 32 --noverify 2>/dev/null | tail -1
taskset -c 0 build/dct8_mb cand latency 1 32 --noverify 2>/dev/null | tail -1
# 用 bench-generic-paired 需要 shape 占位，直接写小循环或手工两条命令对比 p50
```

### 4.3 sa8d16（原生）

```sh
CXX=g++ bash scripts/build-sa8d-microbench.sh build/x265-8-950 build/sa8d16_mb
# 链接候选：脚本只链 8x8，16x16 需手工链接：
g++ -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 \
  -DX265_NS=x265 -DDYNOPT_CANDIDATE=dynopt_sa8d_8x8_sve2 \
  -DDYNOPT_CANDIDATE16=dynopt_sa8d_16x16_sve2 \
  -I third_party/x265/source -I third_party/x265/source/common \
  -I build/x265-8-950 benchmarks/sa8d_microbench.cpp \
  kernels/sa8d/candidates/best_sve2.o \
  kernels/sa8d16/candidates/best_sve2.o \
  build/x265-8-950/libx265.a -lpthread -ldl -o build/sa8d16_mb
bash scripts/bench-generic-paired.sh build/sa8d16_mb 16x16 neon cand 30 8 /tmp/sa8d16.csv
```

### 4.4 interp8 vpp 16x16 / 32x32（原生，SVE2）

```sh
# vpp16：
g++ -O3 -static -DNDEBUG -std=c++11 -DHIGH_BIT_DEPTH=0 -DX265_DEPTH=8 \
  -DX265_NS=x265 -DDYNOPT_CANDIDATE=dynopt_interp8_8x8_sve2 \
  -DDYNOPT_CANDIDATE_VPP=dynopt_interp8_16x16_sve2_vpp \
  -I third_party/x265/source -I third_party/x265/source/common \
  -I build/x265-8-950 benchmarks/interp8_microbench.cpp \
  kernels/interp8/candidates/best_sve2.o \
  kernels/interp8vpp-16/candidates/best_sve2.o \
  build/x265-8-950/libx265.a -lpthread -ldl -o build/ivpp16_mb
bash scripts/bench-generic-paired.sh build/ivpp16_mb 16x16v neon vcand 30 8 /tmp/vpp16.csv
# vpp32 同理（CANDIDATE_VPP=dynopt_interp8_32x32_sve2_vpp、32x32v）
```

### 4.5 interp8 hpp path-B（替换 sve2 目标，仅 cycle 预估）

> 已验证（2026-08-14）：当前候选是 addp 对和版本（docs/22 §5.7），
> `addp` 为 SVE2，950 原生支持、**无需替换**；只需替换 `sdot.h`→
> `sdot.s`（`--target sve2` 同时保留 `sqrshrunb`）。以下命令已本地
> 验证可汇编、可运行。

```sh
# 一键构建（CXX/AS 自动用原生 g++/as；BUILD 指向 950 的 x265 库）
BUILD=build/x265-8-950 bash scripts/build-interp8-substituted-microbench.sh \
  16 sve2 build/ipb16_mb
bash scripts/bench-generic-paired.sh build/ipb16_mb 16x16 neon cand 30 8 /tmp/ipb16.csv
# 32x32：shape 参数改 32；8x8 同理
```

## 5. 报告格式（复制粘贴）

脚本 `scripts/quick-test-real-machine.sh 950 reports/950-report.txt` 会自动
生成以下骨架并填入机器信息与门禁结果；paired 结果按上面命令追加。

```text
=== 950 (920G) quick test ===
date / git-commit / uname / nproc
ISA: SVE2 2x256 / NEON 4x128

[gates]
interp8: PASS   sa8d16: PASS   dct16: PASS   dct32: PASS
idct16: PASS    idct32: PASS

[paired]  (neon/cand, median, CI 可后补)
kernel            fused  MCA   p50_neon p50_cand ratio
idct16(sve2sub)   ...    ...   ...      ...      ...
idct32(sve2sub)   ...    ...   ...      ...      ...
dct8              ...    ...   ...      ...      ...
sa8d16            ...    ...   ...      ...      ...
ivpp16            ...    ...   ...      ...      ...
ivpp32            ...    ...   ...      ...      ...
ipb16(sve2sub)    ...    ...   ...      ...      ...
ipb32(sve2sub)    ...    ...   ...      ...      ...
ipb8(sve2sub)     ...    ...   ...      ...      ...

[结论] 实机相对 NEON 有/无收益的 kernel；替换项注明“高估上界”。
```

## 6. Agent 注意事项

1. 所有 paired 用 `taskset -c 0` + `--noverify`（正确性由门禁/20k 负责）；
2. 950 不支持 SVE2p1+：凡是候选含 `sdot z.s,z.h,z.h` 或 `sdot z.h,z.b,z.b`
   必须先走替换（docs/29），报告里标注 `(sve2sub)`；
3. 每测完一个 kernel 就把 `bench-generic-paired.sh` 的 median 行追加到报告；
4. 遇到 SIGILL（rc=132）→ 该候选含超出 950 ISA 的指令，改用替换或跳过；
5. 最后把报告文件内容整段贴回对话。
