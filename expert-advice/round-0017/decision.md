# Round 0017 decision（2026-08-14）

| 建议 | 处置 | 证据/理由 | 对应实现 |
| --- | --- | --- | --- |
| zip32 先消除越界（p16→8-lane 谓词加载）再谈 RA | **reject（实验否定）** | 实测 p8h 消除越界后仍 89% 失配；真正根因是 store 地址把 off 当元素偏移（`(off + r*stride)` 应为 `((off + r)*stride)`） | 已修复并固化新 best（fused 5249 / MCA 1185，-64.3% vs NEON） |
| `-O2 -fschedule-insns` 隔离 O3 收益 | defer（低优先级） | 当前 -O3 已含 pre-RA 调度；收益上限小 | 后续 flag 扫描 |
| 搜索缓存键加 build fingerprint | **accept（待实现）** | 会话确认旧键会误复用 | 下一轮工具迭代 |
| regspill 收敛口径用动态 MCA/总指令数 | **accept（已部分落地）** | vnum 寻址 fused_uop 只 -2 但 MCA -18%；docs/27 | 搜索排名维持 MCA 主口径 |

补充：咨询运行期间主进程完成 vnum 立即数寻址优化并固化 best
（sdot scatter fused 5847 / MCA 1550，对 NEON -53.3%，lite 5/5）。
