"""MCA target profiles for the project's two Kunpeng models.

2026-08-14 (用户口径): 
  920B = SVE 2x256 / NEON 4x128 (VL=256)
  NP1  = SVE 4x256 / NEON 4x128 (VL=256, 960)

latency 参数参考 LLVM Neoverse-V2 调度模型
(llvm/lib/Target/AArch64/AArch64SchedNeoverseV2.td, main):
  ADD/SUB ZZZ        2c 1V
  MUL ZZZ BHS        4c V02
  SDOT HtoD          4c V02 (read advance 3)
  TBL/TBX/UZP/ZIP/TRN/REV  2c 1V
  MOVPRFX            2c 1V
  LD1 (SVE)          6c 1L
  ST1H               2c 1L01+1V01
  RSHRN (ASIMD)      4c V13   (SVE2 rshrnb 代理)
  SMULL (ASIMD)      3c V02   (SVE smull 代理)

throughput 权重：920B 用 920B 实测（benchmarks/sve-timing-920b/
timing-920b.json，VL=256，cycles/op）；NP1 把受 SVE 管道数限制的
类别按 4/2=2x 缩放（dot/mul/add/permute/narrow/shift），load/store
暂沿用 920B 实测。movprfx 视为与下一条融合（docs/09）。
"""


NV2_LATENCY = {
    "dot": 4,       # SDOT HtoD (V02)
    "mul": 4,       # MUL ZZZ BHS (V02)
    "add": 2,       # ADD/SUB ZZZ (1V)
    "permute": 2,   # TBL/UZP/ZIP/TRN/REV (1V)
    "narrow": 4,    # ASIMD RSHRN 代理 (V13)
    "load": 6,      # SVE LD1 (1L)
    "store": 2,     # SVE ST1H (1L01+1V01)
    "shift": 2,     # SVE shift (V13)
    "movprfx": 2,   # fused with next (docs/09)
    "scalar": 1,
}


TARGETS = {
    "920B": {
        "name": "920B",
        "sve_pipes": 2,
        "sve_vl_bits": 256,
        "neon_pipes": 4,
        "neon_vl_bits": 128,
        "vl_bytes": 32,
        "issue_rate": 4.0,
        "latency": dict(NV2_LATENCY),
        # 920B 实测 throughput (cycles/op, VL=256)
        "throughput": {
            "dot": 1.0, "mul": 1.0, "add": 0.5, "permute": 0.5,
            "narrow": 0.5, "load": 0.37, "store": 3.0, "shift": 0.5,
            "scalar": 1.0,
        },
        "llvm_proxy_cpu": "neoverse-v2",
        "llvm_proxy_mattr": "+sve2",
    },
    "NP1": {
        "name": "NP1",
        "sve_pipes": 4,
        "sve_vl_bits": 256,
        "neon_pipes": 4,
        "neon_vl_bits": 128,
        "vl_bytes": 32,
        "issue_rate": 6.4,
        "latency": dict(NV2_LATENCY),
        # SVE-pipe-bound classes scale 2x vs 920B (4/2 pipes);
        # load/store 暂沿用 920B 实测。
        "throughput": {
            "dot": 0.5, "mul": 0.5, "add": 0.25, "permute": 0.25,
            "narrow": 0.25, "load": 0.37, "store": 3.0, "shift": 0.25,
            "scalar": 1.0,
        },
        "llvm_proxy_cpu": "neoverse-v2",
        "llvm_proxy_mattr": "+sve2",
    },
}


def target(name):
    try:
        return TARGETS[name]
    except KeyError:
        raise KeyError("unknown mca target %r (have %s)"
                       % (name, sorted(TARGETS)))
