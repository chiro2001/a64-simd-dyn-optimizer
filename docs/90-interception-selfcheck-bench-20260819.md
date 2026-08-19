# docs/90: interception 自检 + benchmark 骨架 — 2026-08-19

> docs/87 step 3。相关：docs/88（协议/指纹）、docs/89（multicover 运行时）。

## 1. 自检契约（已进 .so）

- `.so` 维护 `dynopt_intercepted_`：`dynopt_patch_primitives()` 成功
  （x265 primitives 表已就绪且注入 ≥1 slot）时置 1。
- 导出：`dynopt_intercept_status()`（返回 0/1）、
  `dynopt_mark_intercepted()`（patch 成功路径调用）。
- `AGO_BENCH=1` 且未拦截 → stderr 输出
  `dynopt: BENCH INVALID (interception failed)`，**不产生 preset 行**。
- 拦截成功时既有的 `dynopt: patched N x265 dispatch slot(s)` 行即自检
  通过信号，随后输出每 arm 的 `ns/call` 与 `AGO_PRESET=...` 行。

## 2. benchmark 骨架（形感知 + 中位数 + 时间盒 + upstream 配对）

- `tools/bench_specs.py`：按 kernel 给 buffer 尺寸与标量实参
  （dct16/dct32 已按 `stride×rows×elem` 定输出缓冲；satd-8 就绪；
  无 spec 的 kernel 自动回退通用 4096B 零缓冲驱动）。
- 每个 bench kernel 生成 `dynopt_<k>_bench()`：
  - 200 次 warmup + `AGO_BENCH_ROUNDS`（默认 5，≤8）轮计时取**中位数**；
  - `AGO_BENCH_ITERS`（默认 2000）调每轮次数、`AGO_BENCH_MAXORD` 限序；
  - `AGO_BENCH_BUDGET_MS`（默认 4000）时间盒：超时跳过剩余 kernel；
  - id0=upstream 正式参赛（真实拦截场景），输出
    `chosen=ord<N> ns=<..> upstream_ns=<..>` 配对行；upstream 赢 →
    preset 该项输出 `0`（**显式放弃注入**，docs/87 §2 教训）。
- 输出仍是单行 `AGO_PRESET=v1:<fp>:<k>=<ord>,...`，可直接写回复用。

## 3. 验证工具与本地实测

`python3 tools/verify_preload_local.py --kernels dct16,dct32 --out report.json`

- 正例：注入版跨编 libx265（`x265_setup_primitives` 末尾调用
  `dynopt_patch_primitives`）+ LD_PRELOAD + AGO_BENCH=1 → 断言
  `patched N slots`、ord0 arm 在场、preset 行存在；
- 负例：仅 driver（无 x265）→ 断言 `BENCH INVALID` 且无 preset 泄漏；
- 真机运行 920B/710：`--native`（qemu 代理默认 `sve-max-vq=2` 规避
  docs/89 §3.1 的 qemu VL=256 问题，真机不受影响）。

qemu 代理实测（最大 sve-max-vq=2，iters=400/rounds=3）：

```
dynopt: patched 2 x265 dispatch slot(s)
dynopt: bench dct16 ord=0 ns/call=2294   (upstream, 参赛臂)
dynopt: bench dct16 ord=1 ns/call=4552
dynopt: bench dct16 ord=2 ns/call=7011
dynopt: bench dct16 ord=3 ns/call=4483
dynopt: bench dct16 chosen=ord0 ns=2294 upstream_ns=2294
dynopt: bench dct32 ord=0 ns/call=17806
dynopt: bench dct32 ord=1 ns/call=62131
dynopt: bench dct32 ord=2 ns/call=58461
dynopt: bench dct32 ord=3 ns/call=60587
dynopt: bench dct32 chosen=ord0 ns=17806 upstream_ns=17806
AGO_PRESET=v1:m4c6069ee:dct16=0,dct32=0
```

（qemu 下 cover 全输 upstream，preset 双 0 = 显式不注入；920B/710 真机
 重新仲裁后才会出现非 0 选择。preset 行为 `v1:<fp>:<kernel>=<ord>,...`
 格式，可直接写回 `AGO_PRESET` 复用。）

## 4. 过程中发现的问题

1. **spec 缓冲必须按 stride 定大小**：初版 dct32 输出缓冲 2112B，
   stride=128 写 32×128 int16（8192B）→ .bss 溢出 → 进程段错误。
   已修（`16*64*2+64` / `32*128*2+64`），并作为骨架回归用例。
2. **qemu 下 LD_PRELOAD 不穿透 + interposer 机制**：qemu-user 下
   guest 动态加载器不处理 env 传入的 `LD_PRELOAD`（host ld.so 把
   aarch64 .so 当 "incompatible ELF machine" 拒绝）。初版以为需要
   注入版 libx265（源码内调用 `dynopt_patch_primitives`）才能拦
   截；实际 multicover .so 自带 `x265_setup_primitives` interposer
   （docs/95 §3），plain 版 libx265 也能被拦截。`verify_preload_
   local.py` 在 qemu 下改用
   `ld-linux-aarch64.so.1 --preload <abs so>` 直接预载（绕过 env），
   selfcheck host 用 `RTLD_GLOBAL` + `RTLD_DEFAULT` dlsym 让
   interposer 赢得全局符号查找。`--native` 仍用 LD_PRELOAD env
   （真机无此限制）。详见 docs/95 §3。
3. bench 逐 arm 噪声：中位数值在 qemu 下稳定（±3%），真机由
   rounds/中位数继续兜底。

## 5. 920B/710 验证状态

- 本地 qemu 代理（正/负例、单/双 kernel）已全过，脚本已定
  （`--native` 即真机路径）。
- 真机 920B/710 跑批：`python3 tools/verify_preload_local.py
  --native --kernels <注册表子集> --lib-dir <注入版libx265目录>
  --out step3-920b.json`，产物 JSON 含 patched/slots/arms/chosen/preset。
- 950 终验并入步骤 8 终验闭环。
