# Round 0018 context（2026-08-14）

目标：本地 QEMU 支持 SVE2p3 `sdot z.h,z.b,z.b`（SDOT BtoH），
解锁 interp8 方案 B（docs/30 P0）。

背景：QEMU 11.0.3 执行该指令 Illegal instruction（上游无 SVE2p3）；
内部 QEMU 支持但不可访问。本项目已有：自定义 llvm-mca BtoH 调度
补丁（patches/llvm-22.1.8-aarch64-sdot-z32-sched.patch）、920B
替换预估体系（docs/29）、interp8 方案 A fused 127 / 方案 B 预估
~100（-35%）。

方式：按专家咨询流程后台运行（默认 profile，模型 deepseek-v4-flash，
可写沙箱但只允许写指定文件），主流程不阻塞。
