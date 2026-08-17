"""region-schedule 模板库。

从成功优化案例中提取的可复用调度模式。每个模板描述一种从 DAG/IR
到目标代码的生成策略，支持跨 ISA 映射（NEON/SVE2/SVE2p3/i8mm）。

使用方式:
    from optimizer.templates import (
        NEONBridgeTemplate, SvdotS32DirectTemplate,
        LoopKSectionsTemplate, TemplateConstraints,
    )

    constraints = TemplateConstraints(isa="sve2", vl=32)
    for tpl in [NEONBridgeTemplate(), SvdotS32DirectTemplate(),
                LoopKSectionsTemplate()]:
        if tpl.applicable("hpp", constraints):
            result = tpl.emit("dynopt_interp8_8x8_sve2",
                              kernel_type="hpp", width=8, height=8)
            print(result.code)

模板列表:
1. NEONBridge — SVE2 计算 + NEON narrow（dct16/interp8）
2. SvdotS32Direct — s8xs8->s32 直接输出（interp8 hpp）
3. LoopKSections — k-sections 循环（dct32）
"""

from .base import RegionScheduleTemplate, TemplateConstraints, TemplateResult
from .neon_bridge import NEONBridgeTemplate
from .svdot_s32_direct import SvdotS32DirectTemplate
from .loop_ksections import LoopKSectionsTemplate

ALL_TEMPLATES = [
    NEONBridgeTemplate(),
    SvdotS32DirectTemplate(),
    LoopKSectionsTemplate(),
]


def select_template(kernel_type: str,
                    constraints: TemplateConstraints | None = None):
    """根据 kernel 类型和约束选择最佳模板。

    返回 permute_ratio 预测值最低的适用模板。
    """
    if constraints is None:
        constraints = TemplateConstraints()
    candidates = [t for t in ALL_TEMPLATES
                 if t.applicable(kernel_type, constraints)]
    if not candidates:
        return None
    return min(candidates, key=lambda t: t.predict_permute_ratio())


__all__ = [
    "RegionScheduleTemplate", "TemplateConstraints", "TemplateResult",
    "NEONBridgeTemplate", "SvdotS32DirectTemplate",
    "LoopKSectionsTemplate", "ALL_TEMPLATES", "select_template",
]
