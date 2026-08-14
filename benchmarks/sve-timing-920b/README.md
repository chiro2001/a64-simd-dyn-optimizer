# 920B (hip09) SVE 指令 timing 微基准

目的：920B 没有公开/可用的 SVE 流水线数据（LLVM tsv110 显式
unsupported，GCC hip09.md 只有 NEON/FP），需要实测后导入 MCA。

方法：
- latency：单条依赖链，`cycles/iter`（不扣空循环；空循环单独输出）；
- throughput：8 条独立链，`cycles/op`；
- 每组 7 次取最小，CNTVCT 计时（920B 无 PMU）；
- 校准：依赖整型加链（x=x+x，1 cycle/iter）把 CNTVCT tick 换算成
  CPU cycle（`calib_add_ticks_per_cyc` / `freq_hz_est` 输出在 JSON 头）。

运行（920B 本机或 qemu-aarch64 VL=256）：

```sh
make
./timing_sve > timing.json
```

产物：`timing-920b.json`（指令名 -> latency_cyc / throughput_cyc_per_op；
920B 实测 2026-08-14，SVE1，VL=256）。

覆盖指令族：add_s32 / mul_s64 / sdot(indexed,s64) / smullb /
rshrnb+uzp1 / uzp1 / tbl / zip1 / st1h / ld1h / ld1h+add。

注意：本基准为“端口压力 + 依赖链”的近似，不测量 VL 相关的拆 uop
开销（scatter/gather 的拆 uop 按 docs/17 口径另行建模）。

已知限制：
- rshrnb/smullb 是 SVE2，920B 无法跑，需 hip12（920C/G）或倚天710
  （VL=128）补测；
- st1h/ld1h 用流式地址（8192 元素环形缓冲）避免编译器 hoist；
- `ld1h_use_add` 是 load-to-use+add 链的近似。
