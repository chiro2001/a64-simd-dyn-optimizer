"""Loop k-Sections 模板：k-sections 循环代替全展开。

成功案例：
- dct32 loop（permute_ratio=19.4%，vs opbase 21.2%，-33% fused_uop）

核心模式：
1. 将完全展开的 k-loop 改为 k-sections 循环
2. 每次迭代处理 k 个元素（如 k=4 或 k=8）
3. 循环体保持寄存器压力低，编译器调度更好
4. 减少 cp_len（66 -> 31, -53%）和 fused_uop（1129 -> 761, -33%）

适用场景：
- 大尺寸 kernel（dct32 等），全展开导致指令数过大
- 计算可分组为 k-sections 的 kernel

ISA 映射：
- SVE2: svld1/svst1 + svdot/svmla 循环体
- NEON: vld1/vst1 + vmlal 循环体
- SVE1: svld1/svst1 + svmla 循环体
"""

from __future__ import annotations
from typing import Any

from .base import RegionScheduleTemplate, TemplateResult


class LoopKSectionsTemplate(RegionScheduleTemplate):
    name = "loop_ksections"
    description = "k-sections 循环代替全展开（减少 cp_len + fused_uop）"
    isa_support = ["sve2", "sve1", "neon"]
    kernel_types = ["dct32", "dct16", "dct8"]

    def applicable(self, kernel_type: str,
                   constraints=None) -> bool:
        if constraints is None:
            constraints = TemplateConstraints()
        if not super().applicable(kernel_type, constraints):
            return False
        return True

    def emit(self, func_name: str, **kwargs: Any) -> TemplateResult:
        """生成 loop k-sections 候选。"""
        import sys
        import os
        ROOT = os.path.dirname(os.path.dirname(
            os.path.dirname(os.path.abspath(__file__))))
        sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
        kernel_type = kwargs.get("kernel_type", "dct32")
        if kernel_type == "dct32":
            from dct32_wide_sve2 import emit_candidate
            code = emit_candidate()
            return TemplateResult(
                code=code, func_name=func_name, template_name=self.name,
                estimated_permute_ratio=0.194,
                estimated_fused_uop=761,
                notes="dct32 loop: permute_ratio=19.4% (opbase=21.2%)")
        raise ValueError("LoopKSections: unsupported kernel_type %s"
                         % kernel_type)

    def predict_permute_ratio(self) -> float:
        return 0.194
