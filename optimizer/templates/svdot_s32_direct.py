"""svdot_s32 Direct Output 模板：s8xs8->s32，8 pixel/lane。

成功案例：
- interp8 hpp 8x8 svdot_s32（permute_ratio=20.5%，vs best_sve2 53.3%）

核心模式：
1. u8 输入减 128 -> s8（DC offset trick）
2. svtbl_s8 聚合 tap groups（4 byte/group, 8 groups @ VL=256）
3. svdot_s32(acc, x.b, c.b) 直接输出 8 个 s32 = 8 个像素
4. 不需要 addp 配对（避开 addp RMW 瓶颈）
5. svrshrnb_n_s32 + svuzp1_s16 + vqmovun_s16 narrow 输出

关键优势（vs svdot_s64 s16xs16->s64）：
- 不需要 u8->u16 宽化（svld1ub_u16）
- 不需要 addp_s32 配对（RMW 约束）
- 8 pixel/lane 直接映射（vs 4 s64 + addp -> 8 s32）
- permute 减少 75%（32 -> 8 on critical path）

适用场景：
- 8-tap dot product 类 kernel（filter/hpp）
- 输入为 8-bit（u8/s8）
- 目标 ISA: SVE2（svdot_s32 可用，非 SVE2p3）

ISA 映射：
- SVE2: svdot_s32 (s8xs8->s32, 8 groups @ VL=256)
- SVE2p3: sdot z.h,z.b,z.b (s8xs8->s16, 更高效但 950 不支持)
- i8mm: vusmmlaq_s32 (u8xs8->s32, 不同的系数格式)
- NEON: vdot_u32 (仅 A64v8.6+, 可能不可用)
"""

from __future__ import annotations
from typing import Any

from .base import RegionScheduleTemplate, TemplateResult


class SvdotS32DirectTemplate(RegionScheduleTemplate):
    name = "svdot_s32_direct"
    description = "svdot_s32 (s8xs8->s32) 直接输出 8 pixel/lane"
    isa_support = ["sve2", "sve2p1", "sve2p3"]
    kernel_types = ["hpp", "filter_hpp"]

    def applicable(self, kernel_type: str,
                   constraints=None) -> bool:
        if not super().applicable(kernel_type, constraints or
                                   type("c", (), {"isa": "sve2"})()):
            return False
        c = constraints
        if c.no_sve2p3 and c.isa not in ("sve2", "sve2p1"):
            return False
        if c.vl < 32:
            return False
        return True

    def emit(self, func_name: str, **kwargs: Any) -> TemplateResult:
        """生成 svdot_s32 interp8 hpp 候选。"""
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
            notes="svdot_s32: s8xs8->s32, 8 pixel/lane, no addp RMW")

    def predict_permute_ratio(self) -> float:
        return 0.205
