# N+2（鲲鹏 960）SVE2 验证合同（2026-08-13）

状态：**预注册**。当前只有 QEMU（`-cpu max,sve-max-vq=2`）验证与
true-dynamic 计数；920B 是 SVE1，无法执行本项目的 s16→s64 SDOT
（SVE2），因此**中间档 920B 只对 NEON 候选有效**，SVE2 候选直接以
960 为验收目标。

## 1. 目标与基线

| 档位 | 基线（同机冻结） | 保留 | 优秀 |
| --- | --- | ---: | ---: |
| b：NEON→SVE256 | 同机最佳 NEON（dct16_neon） | speedup > 2.10 | >= 2.30 |
| c：SVE256→SVE256 | 同机最佳 SVE256（上游 dct16_sve 或本项目 best） | speedup > 1.10 | >= 2.30 |

指令数口径（预注册）：true-dynamic fused_adj（movprfx 融合后）；宽度
标准：相对 128-bit 有效上游 SVE 应减半（当前 best 1292/1911=0.68，
回收 65% 减半空间）。

## 2. 运行合同

- 固定 VL=256：候选注册前 `prctl(PR_SVE_SET_VL, 32)` 并断言返回值；
  线程池继承由 x265 dispatch 层负责，注册时校验 worker VL；
- 同一 binary 内函数指针 A/B（候选/上游），或分 binary 时严格同
  compiler/flags/layout 并记录 binary hash；
- corpus：manifest 声明（stride {16,17,32}、[-255,255]、随机 seed
  固定）；每轮加 guard-page 与 canary 边界；
- paired 协议：warmup→empty→A→B 与 B→A 交替，≥30 有效 pair、跨 3
  进程，报 median/p05/p95/MAD + bootstrap 95% CI；
- cycles 用 PMU（CNTVCT 或 perf），不拿 TestBench ticks 当 cycles；
- 正确性：上游位级一致（manifest 生成 harness，200k 例 0 分歧）+
  x265 transforms TestBench + 单线程 deterministic encode 回归。

## 3. 候选注册条件（960 接入前可完成的静态门禁）

- `tools/pipeline.py --all` 全绿（baseline/search/report）；
- `pipeline.py finalize` 固化产物并通过 200k 上游差分；
- `tools/check_isa_level.py` 确认指令集 <= SVE2.3、VL 相关指令合规；
- 循环恢复报告无异常展开（loop_report 健康度）；
- `tools/fusion_analysis.py` 融合清单与 fused_adj 口径一致。

## 4. 决策

- 960 实测保留门槛未过：保留负结果与成本误差，不注入；
- b/c 档优秀门槛达到：标记"工具已优秀"并全量存档；
- 实机与 fused_adj 预测偏差 >20%：以实机为准，回填成本模型数据
  （docs/09 resource lower bound）。

## 5. 验收黄金标准：x265 TestBench 自测（2026-08-13 落盘）

**结论：验收合同的黄金标准 = 通过 x265 官方 TestBench 功能自测
（`--testbench transforms --nobench`）。** 差分 harness 有疑问（例如只有
部分用例未通过）时，以该黄金标准裁决，不猜。

运行方式：

```sh
# 完整黄金标准（构造 + 注入 + 静态校验 + QEMU 执行），退出码 0 = 通过
scripts/build-testbench-inject.sh [candidate.o] [outdir]

# 开发期快速门禁（复用 MBDstHarness 数据与 C 参考，秒级，不重建 libx265）
scripts/build-testbench-lite.sh [candidate.o] [outdir] [-- --seed N]
```

约定与已验证事实：
- 注入点：`testbench.cpp` 文件作用域声明候选（C 链接不能写在函数体内），
  `setupIntrinsicPrimitives/setupAliasPrimitives` 之后替换
  `vecprim.cu[BLOCK_16x16].dct`；`MBDstHarness`（transforms）对 16x16
  dct 槽跑 128 轮 × 3 组随机缓冲，与 C 参考 `dct16_c` 逐字节对比；
- 静态校验：构建后 `nm -u testbench.cpp.o | grep dynopt` 必须出现未定义
  引用（调用点真实编译进）；只链入符号不等于被调用；
- 负向对照已验证：注入故意错误的候选 → `dct16x16 failed`、非零退出；
- 候选 .o 通过 linker flags 传入时，`cmake --build` 不会因 .o 内容变化
  自动重链，脚本先删除 TestBench 二进制强制重链；
- SVE2 CPU 标签说明：本机交叉工具链缺 `arm_neon_sve_bridge.h`，x265
  CMake 禁用 SVE/SVE2 编译，`--cpuid SVE2` 报 Invalid；门禁以
  `NEON,Neon_DotProd,Neon_I8MM` 标签运行，注入的 SVE2 候选在 QEMU
  `-cpu max,sve-max-vq=2`（VL=256）下真实执行。920B/960 实机接入后改用
  原生 SVE2 标签复跑一次；
- lite 门禁与完整 TestBench 共用同一 `MBDstHarness`/`check_dct_primitive`
  与同一 C 参考，因此 lite 通过是快速信号，完整 TestBench 通过才是验收。
