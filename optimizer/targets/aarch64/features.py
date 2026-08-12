"""Parameterized AArch64 target feature model.

Which instructions a search may emit is controlled by TargetFeatures:

    neon            NEON (ASIMD), 128-bit
    dotprod         udot/sdot
    i8mm            matrix multiply / 8-bit integer dot (requires dotprod)
    sve             scalable vector extension (any VL)
    sve2            SVE2
    sve2p1/sve2p2/sve2p3
                    later SVE2 architecture feature extensions
    sve2_bitperm    SVE2 bit permutation
    fixed_vl        None = VLA; 128/256/512 = fixed vector length contract

`allows(feature)` returns True when the instruction feature is enabled by the
target, including implied dependencies. This is the single gate used by the
instruction selector; no search candidate may bypass it.
"""

from dataclasses import dataclass, field


FEATURE_DEPENDENCIES = {
    "dotprod": ("neon",),
    "i8mm": ("dotprod",),
    "sve": (),
    "sve2": ("sve",),
    "sve2_bitperm": ("sve2",),
    "sve2p1": ("sve2",),
    "sve2p2": ("sve2p1",),
    "sve2p3": ("sve2p2",),
}


@dataclass(frozen=True)
class TargetFeatures:
    neon: bool = True
    dotprod: bool = False
    i8mm: bool = False
    sve: bool = False
    sve2: bool = False
    sve2p1: bool = False
    sve2p2: bool = False
    sve2p3: bool = False
    sve2_bitperm: bool = False
    fixed_vl: int | None = None  # None = VLA

    def enabled(self, feature):
        return bool(getattr(self, feature, False))

    def allows(self, feature):
        if not self.enabled(feature):
            return False
        return all(self.allows(dep) for dep in FEATURE_DEPENDENCIES.get(feature, ()))

    def feature_list(self):
        out = []
        for f in ("neon", "dotprod", "i8mm", "sve", "sve2", "sve2p1",
                  "sve2p2", "sve2p3", "sve2_bitperm"):
            if self.enabled(f):
                out.append(f)
        if self.fixed_vl is not None:
            out.append("vl%d" % self.fixed_vl)
        return out

    def to_dict(self):
        d = {f: self.enabled(f)
             for f in ("neon", "dotprod", "i8mm", "sve", "sve2", "sve2p1",
                       "sve2p2", "sve2p3", "sve2_bitperm")}
        d["fixed_vl"] = self.fixed_vl
        return d

    @classmethod
    def from_dict(cls, d):
        return cls(**{k: d.get(k, False) for k in (
            "neon", "dotprod", "i8mm", "sve", "sve2", "sve2p1", "sve2p2",
            "sve2p3", "sve2_bitperm")},
            fixed_vl=d.get("fixed_vl"))

    @classmethod
    def neon128(cls):
        return cls(neon=True)

    @classmethod
    def sve_vla(cls):
        return cls(neon=True, sve=True)

    @classmethod
    def sve_vl256(cls):
        return cls(neon=True, sve=True, fixed_vl=256)

    @classmethod
    def sve2_vl256(cls):
        return cls(neon=True, sve=True, sve2=True, fixed_vl=256)

    @classmethod
    def sve2p3_vl256(cls):
        return cls(neon=True, sve=True, sve2=True, sve2p1=True,
                   sve2p2=True, sve2p3=True, fixed_vl=256)
