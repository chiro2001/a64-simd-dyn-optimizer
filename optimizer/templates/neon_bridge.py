"""NEON Bridge 模板：SVE2 计算 + NEON narrow。

成功案例：
- dct16 neon_bridge（permute_ratio=12.0%，优于 op895 的 18.5%）
- interp8 svdot_s32（permute_ratio=20.5%，vs best_sve2 53.3%）

核心模式：
1. SVE2 宽寄存器做主要计算（svdot/svmla/svadd 等）
2. NEON intrinsics 做最终窄化（vqmovun_s16: s16->u8 saturating）
3. 用 svget_neonq_s16 等 bridge 函数从 SVE 切到 NEON

适用场景：
- 需要 saturating narrow（s16->u8）的 kernel
- VL=256 且输出为 8-bit 的 hpp/dct 类 kernel
- 不要求 pure SVE（允许 NEON bridge）

ISA 映射：
- SVE2: svdot_s32 + svrshrnb_n_s32 + svget_neonq_s16 + vqmovun_s16
- SVE1: 不适用（无 svdot_s32/svrshrnb）
- NEON: vmull + vqmovun_s16（纯 NEON 变体）
- i8mm: vusmmlaq_s32 + vqshrun（8x8 4-row batch）
"""

from __future__ import annotations
from typing import Any

from .base import RegionScheduleTemplate, TemplateConstraints, TemplateResult


class NEONBridgeTemplate(RegionScheduleTemplate):
    name = "neon_bridge"
    description = "SVE2 计算 + NEON narrow（vqmovun_s16）"
    isa_support = ["sve2", "sve2p1", "sve2p3"]
    kernel_types = ["hpp", "dct16"]

    def applicable(self, kernel_type: str,
                   constraints: TemplateConstraints) -> bool:
        if not super().applicable(kernel_type, constraints):
            return False
        if constraints.no_neon:
            return False
        if constraints.vl < 32:
            return False
        return True

    def emit(self, func_name: str, **kwargs: Any) -> TemplateResult:
        """生成 NEON bridge 候选。

        kwargs:
            kernel_type: "dct16" 或 "hpp"
            width, height: 输出尺寸
        """
        kernel_type = kwargs.get("kernel_type", "hpp")
        if kernel_type == "dct16":
            return self._emit_dct16(func_name, kwargs)
        if kernel_type == "hpp":
            return self._emit_hpp(func_name, kwargs)
        raise ValueError("NEONBridge: unsupported kernel_type %s" % kernel_type)

    def _emit_dct16(self, func_name: str,
                    kwargs: dict[str, Any]) -> TemplateResult:
        """dct16 neon_bridge 候选（调用现有 emitter）。"""
        import sys
        import os
        ROOT = os.path.dirname(os.path.dirname(
            os.path.dirname(os.path.abspath(__file__))))
        sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
        from dct16_wide_sve2 import emit_candidate
        code = emit_candidate("neon_bridge")
        return TemplateResult(
            code=code, func_name=func_name, template_name=self.name,
            estimated_permute_ratio=0.12,
            estimated_fused_uop=950,
            notes="dct16 neon_bridge: permute_ratio=12.0% (op895=18.5%)")

    def _emit_hpp(self, func_name: str,
                  kwargs: dict[str, Any]) -> TemplateResult:
        """interp8 hpp svdot_s32 候选（调用现有 emitter）。"""
        import sys
        import os
        ROOT = os.path.dirname(os.path.dirname(
            os.path.dirname(os.path.abspath(__file__))))
        sys.path.insert(0, os.path.join(ROOT, "optimizer", "ir"))
        from interp8_wide_sve2 import emit_svdot32
        width = kwargs.get("width", 8)
        height = kwargs.get("height", 8)
        code = emit_svdot32(func_name=func_name, width=width, height=height)
        return TemplateResult(
            code=code, func_name=func_name, template_name=self.name,
            estimated_permute_ratio=0.205,
            estimated_fused_uop=87,
            notes="interp8 svdot_s32: permute_ratio=20.5% (best_sve2=53.3%)")

    def predict_permute_ratio(self) -> float:
        return 0.12
