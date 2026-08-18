# docs/89: preset 协议进 .so（multicover 运行时分派）— 2026-08-19

> 对应 docs/87 step 2。规格权威来源：docs/88。
> 实现：`tools/multicover.py`（规划 + 运行时 C++ 生成）、
> `tools/build_preload_so.py --multicover/--bench-kernels`。
> 测试：`tools/test_multicover.py`（10 项单测）、
> `tools/test_multicover_so.py`（5 项 qemu 端到端）。

## 1. 交付内容

- 一个 .so 内同时编入某 kernel 的全部 AGO cover：
  - 每个 cover 独立符号 `dynopt_<kernel>_cov<N>`（N 为注册表序号，
    docs/88 §1；同源 IR 产生的 `op_pass1/2` 等辅助符号按 cover 前缀
    唯一化，避免链接期多重定义）；
  - 每个 kernel 一个 trampoline（slot 赋值目标），运行时指针
    `dynopt_<kernel>_cur` 指向**当前选中**的 cover；
  - `dynopt_<kernel>_up` 在 x265 patch 时保存 upstream，作为序号 0
    的候选（只读 arm，永不注入）。
- 运行时协议（LD_PRELOAD 注入后生效）：
  - `AGO_PRESET=v1:<指纹>:<kernel>=<ord>,...`：严格解析 → 指纹校验
    → 白名单校验（kernel 名 + 序号越界 + token 语法）→ 全部合法才
    应用，任一失败打印一行 `dynopt: AGO_PRESET ignored (...)`
    并回退默认分派（**无部分应用**，符合 docs/88 §2）；
  - `AGO_BENCH=1`：对每个 bench 启用的 kernel 做 CNTVCT-free 的
    sweep（`clock_gettime(CLOCK_MONOTONIC)`，注释见 §3.2），输出
    `AGO_PRESET=...` 一行到 stdout，可直接写回复用；
  - `AGO_DEBUG=1`：stderr 输出解析/应用/bench 过程 trace；
  - `AGO_BENCH_MAXORD=<n>`：限制 sweep 最高序号（分故障排查/调参）。
- 构建入口：`build_preload_so.py --multicover --bench-kernels dct16`
  （仅 `--isa sve2` 的 LD_PRELOAD 模式；非 multicover 行为不变）。

## 2. 机器指纹（与 docs/88 §3 对齐）

```
fp = sha256(machine | isa | vl | compiler | so_sha256 | extra)[:8]，前缀 m
```

- `machine`：运行时读 `/proc/cpuinfo` Features 行；
- `isa`：构建期注入宏 `AGO_ISA_STR`（e.g. "sve2"）；
- `vl`：`svcntw()`（SVE 使能时），否则 16；
- `compiler`：`__VERSION__`；
- `so_sha256`：加载时 `dl_iterate_phdr` 定位自身 .so 文件并对文件内容
  SHA-256（实现为生成代码内自包含 SHA-256，数据面清零时按文档计算；
  已用 FIPS "abc" 向量与 sha256sum 对拍验证）；
- `extra`：预留（构建 flag 摘要，暂空）。

签名交互验证（qemu 实测）：合法 preset `applied`；指纹失配/未知
kernel/越界序号/坏 token/坏版本均 `ignored` + 回退。

## 3. 实测与发现（供步骤 5 重新仲裁纳管）

### 3.1 dct16 cover A/B 在 SVE VL=256 下疑似隐患（重点）

- 现象：`dynopt-mc-dct16.so` 在 qemu（默认 cpu，SVE VL=256）下对
  cover A（neon_bridge）、B（pure_sve2）各 12000+ 次调用后，进程
  退出时 `pc=0` 崩溃（返回地址被踩成 0；gdb 栈为 corrupt stack）。
  cover C（op895，当前构建默认）同场景干净。
- 边界：`-cpu max,sve-max-vq=2`（VL=128）全流程干净；host x86 上同一
  套生成代码+桩 cover 干净；preset 解析/应用路径（不跑 A/B）全程干净。
- 结论分级：**不能排除 dct16_wide_sve2 生成的 VL=256 路径存在真实
  缺陷，也不能排除 qemu 该 VL 下的仿真缺陷**。因为 920B/950 真实
  硬件就是 VL=256，此项进入步骤 5 重仲裁必测清单（950 真机 +
  TestBenchLite 门禁）。
- 当前处置：默认分派仍是 op895（id 3，干净）；CI 的 bench sweep
  qemu 门禁固定 `sve-max-vq=2`；人工排查可用 `AGO_BENCH_MAXORD`。

### 3.2 计时源

- 初版用 `mrs cntvct_el0`；qemu VL=256 下读数异常（单次调用表现为
  1.5e14 “周期”）且伴随同一崩溃。改为 `clock_gettime(CLOCK_MONOTONIC)`
  （ns，跨 qemu/真机一致），stderr 输出单位同步改 `ns/call`。

### 3.3 其它备注

- AGO_BENCH 的 id0（upstream）需要真 x265 patch 场景才有数据；无
  x265 时跳过 id0，输出行只含编译进 .so 的 cover。
- 无任何 arm 可测的 kernel 不出现在 AGO_BENCH 输出行里（避免
  `=0` 误导）。

## 4. 与步骤 3/4 的衔接

- 步骤 3（interception 自检 + benchmark 骨架）：每 kernel 专用驱动
  取代当前通用零缓冲 sweep；AGO_BENCH 输出格式不变。
- 步骤 4（build_release.py 单入口）：串 `--multicover
  --bench-kernels <注册表默认集>`，manifest 记录 cover 清单 + fp。
- 步骤 5（重新仲裁）：把 §3.1 的 A/B VL=256 复测列为硬门禁。
