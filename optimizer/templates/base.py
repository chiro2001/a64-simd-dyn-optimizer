"""region-schedule 模板库基础类。

一个"模板"描述一种从 DAG/IR 到目标代码的调度模式，包括：
- 适用条件（kernel 类型、ISA、约束）
- 代码生成逻辑
- 跨 ISA 映射（NEON/SVE2/SVE2p3/i8mm）

成功案例提取的模板：
1. NEONBridge — SVE2 计算 + NEON narrow（dct16 neon_bridge, interp8 svdot_s32）
2. SvdotS32Direct — s8xs8->s32 直接输出 8 pixel/lane（interp8 hpp）
3. LoopKSections — k-sections 循环代替全展开（dct32 loop）
"""

from __future__ import annotations
from dataclasses import dataclass, field
from typing import Any


@dataclass
class TemplateConstraints:
    """模板选择的约束条件。"""
    isa: str = "sve2"          # 目标 ISA: neon/sve1/sve2/sve2p3/i8mm
    vl: int = 32               # 向量长度（字节）: 16(128bit) / 32(256bit)
    no_neon: bool = False      # 禁止 NEON（pure SVE）
    no_sve2p3: bool = True     # 禁止 SVE2p3（950 不支持）
    max_fused_uop: int | None = None
    max_permute_ratio: float = 0.30  # permute_depth_ratio 软阈值


@dataclass
class TemplateResult:
    """模板生成结果。"""
    code: str
    func_name: str
    template_name: str
    estimated_permute_ratio: float | None = None
    estimated_fused_uop: int | None = None
    notes: str = ""


class RegionScheduleTemplate:
    """region-schedule 模板基类。"""

    name: str = "base"
    description: str = ""
    isa_support: list[str] = []
    kernel_types: list[str] = []  # hpp/vpp/dct/sad/...

    def applicable(self, kernel_type: str,
                   constraints: TemplateConstraints) -> bool:
        """判断此模板是否适用于给定的 kernel 类型和约束。"""
        if kernel_type not in self.kernel_types:
            return False
        if constraints.isa not in self.isa_support:
            return False
        return True

    def emit(self, func_name: str, **kwargs: Any) -> TemplateResult:
        """生成候选代码。子类必须实现。"""
        raise NotImplementedError

    def predict_permute_ratio(self) -> float:
        """预测此模板的 permute_depth_ratio。子类可覆盖。"""
        return 0.0
