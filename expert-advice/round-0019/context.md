# Round 0019 context（2026-08-14）

目标：本地 QEMU 补齐 SVE2p1/SVE2p2/SVE2p3 剩余指令，供项目验证
SVE2p1/2p3 kernel（interp8 方案 B 已用 SDOT BtoH；后续 960 候选用
指令可能更多）。

已有：round-0018 交付 SDOT BtoH（QEMU 11.0.3 + cpu-features/译码/
helper，SVEver=4，canary PASS）；LLVM 22.1.8 源码在
/home/chiro/llvm-src（含 SVE2p1/2p2/2p3 特性与指令定义）。

方式：后台咨询（默认 profile，模型 deepseek-v4-flash），只写指定
补丁与摘要，不阻塞主线。
