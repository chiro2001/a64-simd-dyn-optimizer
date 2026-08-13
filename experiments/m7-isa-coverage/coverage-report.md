# AArch64 SIMD 指令覆盖报告（vs 官方 ISA XML）

数据源：`ISA_A64_xml_A_profile-2026-06`（A64 A-profile）
解析范围：`instr-class ∈ advsimd / sve / sve2`，共 1339 条指令。

## 按特性级别统计

| 级别 | 官方指令数 | 官方助记符数 | 语义库覆盖助记符 | 语义库覆盖指令 | 缺口指令 |
|---|---:|---:|---:|---:|---:|
| neon | 277 | 221 | 16 | 17 | 260 |
| dotprod | 4 | 2 | 2 | 4 | 0 |
| i8mm | 6 | 5 | 5 | 6 | 0 |
| sve | 498 | 262 | 11 | 21 | 477 |
| sve_i8mm | 6 | 5 | 5 | 6 | 0 |
| sve2 | 229 | 197 | 5 | 5 | 224 |
| sve2p1 | 110 | 73 | 0 | 0 | 110 |
| sve2p2 | 9 | 9 | 0 | 0 | 9 |
| sve2p3 | 16 | 15 | 0 | 0 | 16 |
| sve2_bitperm | 3 | 3 | 0 | 0 | 3 |

> “语义库覆盖指令”目前按助记符（asm）匹配；同一助记符（如 ADD、TRN1）
> 的多种 lane/元素布局尚未逐条绑定，因此该数字是上界。

## 当前模型之外的 SIMD 指令

这些指令因特性不在 TargetFeatures 中（FP16/BF16/加密/SME 等）而被归类为
“needs-other-features”，不影响 NEON/SVE/SVE2 整数优化，但扩展目标模型时需覆盖：

| 所需特性组合 | 指令数 |
|---|---:|
| FEAT_AES | 4 |
| FEAT_AdvSIMD + FEAT_FAMINMAX | 2 |
| FEAT_AdvSIMD + FEAT_LRCPC3 | 2 |
| FEAT_AdvSIMD + FEAT_LUT | 2 |
| FEAT_BF16 | 6 |
| FEAT_BF16 + FEAT_SME + FEAT_SVE | 6 |
| FEAT_BF16 + FEAT_SVE | 1 |
| FEAT_CPA + FEAT_SVE | 6 |
| FEAT_F16F32DOT | 2 |
| FEAT_F16F32MM | 1 |
| FEAT_F16MM | 1 |
| FEAT_F16MM + FEAT_F32MM + FEAT_F64MM + FEAT_SVE2p2 | 1 |
| FEAT_F64MM | 8 |
| FEAT_F8F16MM | 1 |
| FEAT_F8F16MM + FEAT_SVE2 | 1 |
| FEAT_F8F32MM | 1 |
| FEAT_F8F32MM + FEAT_SVE2 | 1 |
| FEAT_FAMINMAX + FEAT_SME2 + FEAT_SVE2 | 2 |
| FEAT_FCMA | 3 |
| FEAT_FHM | 4 |
| FEAT_FP8 | 5 |
| FEAT_FP8 + FEAT_SME2 + FEAT_SVE2 | 8 |
| FEAT_FP8DOT2 | 2 |
| FEAT_FP8DOT2 + FEAT_SSVE_FP8DOT2 + FEAT_SVE2 | 2 |
| FEAT_FP8DOT4 | 2 |
| FEAT_FP8DOT4 + FEAT_SSVE_FP8DOT4 + FEAT_SVE2 | 2 |
| FEAT_FP8FMA | 4 |
| FEAT_FP8FMA + FEAT_SSVE_FP8FMA + FEAT_SVE2 | 12 |
| FEAT_FRINTTS | 4 |
| FEAT_LSFE | 20 |
| FEAT_LUT + FEAT_SME2 + FEAT_SVE2 | 2 |
| FEAT_RDM | 4 |
| FEAT_SHA1 | 6 |
| FEAT_SHA256 | 4 |
| FEAT_SHA3 | 4 |
| FEAT_SHA512 | 4 |
| FEAT_SM3 | 7 |
| FEAT_SM4 | 2 |
| FEAT_SVE_AES | 4 |
| FEAT_SVE_AES2 | 6 |
| FEAT_SVE_B16B16 | 16 |
| FEAT_SVE_B16MM | 1 |
| FEAT_SVE_BFSCALE | 1 |
| FEAT_SVE_F16F32MM | 1 |
| FEAT_SVE_SHA3 | 1 |
| FEAT_SVE_SM4 | 2 |

## 各级别缺口明细

### neon（缺口 260 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `ADDHN_advsimd` | ADDHN | `ADDHN{2}  <Vd>.<Tb>, <Vn>.<Ta>, <Vm>.<Ta>` |
| `ADDP_advsimd_pair` | ADDP | `ADDP  D<d>, <Vn>.2D` |
| `ADDP_advsimd_vec` | ADDP | `ADDP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `ADDV_advsimd` | ADDV | `ADDV  <V><d>, <Vn>.<T>` |
| `AND_advsimd` | AND | `AND  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `BIC_advsimd_imm` | BIC | `BIC  <Vd>.<T>, #<imm8>{, LSL #<amount>}` |
| `BIC_advsimd_reg` | BIC | `BIC  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `BIF_advsimd` | BIF | `BIF  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `BIT_advsimd` | BIT | `BIT  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `BSL_advsimd` | BSL | `BSL  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `CLS_advsimd` | CLS | `CLS  <Vd>.<T>, <Vn>.<T>` |
| `CLZ_advsimd` | CLZ | `CLZ  <Vd>.<T>, <Vn>.<T>` |
| `CMEQ_advsimd_reg` | CMEQ | `CMEQ  D<d>, D<n>, D<m>` |
| `CMEQ_advsimd_zero` | CMEQ | `CMEQ  D<d>, D<n>, #0` |
| `CMGE_advsimd_reg` | CMGE | `CMGE  D<d>, D<n>, D<m>` |
| `CMGE_advsimd_zero` | CMGE | `CMGE  D<d>, D<n>, #0` |
| `CMGT_advsimd_reg` | CMGT | `CMGT  D<d>, D<n>, D<m>` |
| `CMGT_advsimd_zero` | CMGT | `CMGT  D<d>, D<n>, #0` |
| `CMHI_advsimd` | CMHI | `CMHI  D<d>, D<n>, D<m>` |
| `CMHS_advsimd` | CMHS | `CMHS  D<d>, D<n>, D<m>` |
| `CMLE_advsimd` | CMLE | `CMLE  D<d>, D<n>, #0` |
| `CMLT_advsimd` | CMLT | `CMLT  D<d>, D<n>, #0` |
| `CMTST_advsimd` | CMTST | `CMTST  D<d>, D<n>, D<m>` |
| `CNT_advsimd` | CNT | `CNT  <Vd>.<T>, <Vn>.<T>` |
| `DUP_advsimd_elt` | DUP | `DUP  <V><d>, <Vn>.<T>[<index>]` |
| `DUP_advsimd_gen` | DUP | `DUP  <Vd>.<T>, <R><n>` |
| `MOV_DUP_advsimd_elt` | DUP | `MOV  <V><d>, <Vn>.<T>[<index>]` |
| `EOR_advsimd` | EOR | `EOR  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FABD_advsimd` | FABD | `FABD  <Hd>, <Hn>, <Hm>` |
| `FABS_advsimd` | FABS | `FABS  <Vd>.<T>, <Vn>.<T>` |
| `FACGE_advsimd` | FACGE | `FACGE  <Hd>, <Hn>, <Hm>` |
| `FACGT_advsimd` | FACGT | `FACGT  <Hd>, <Hn>, <Hm>` |
| `FADD_advsimd` | FADD | `FADD  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FADDP_advsimd_pair` | FADDP | `FADDP  H<d>, <Vn>.2H` |
| `FADDP_advsimd_vec` | FADDP | `FADDP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FCMEQ_advsimd_reg` | FCMEQ | `FCMEQ  <Hd>, <Hn>, <Hm>` |
| `FCMEQ_advsimd_zero` | FCMEQ | `FCMEQ  <Hd>, <Hn>, #0.0` |
| `FCMGE_advsimd_reg` | FCMGE | `FCMGE  <Hd>, <Hn>, <Hm>` |
| `FCMGE_advsimd_zero` | FCMGE | `FCMGE  <Hd>, <Hn>, #0.0` |
| `FCMGT_advsimd_reg` | FCMGT | `FCMGT  <Hd>, <Hn>, <Hm>` |
| `FCMGT_advsimd_zero` | FCMGT | `FCMGT  <Hd>, <Hn>, #0.0` |
| `FCMLE_advsimd` | FCMLE | `FCMLE  <Hd>, <Hn>, #0.0` |
| `FCMLT_advsimd` | FCMLT | `FCMLT  <Hd>, <Hn>, #0.0` |
| `FCVTAS_advsimd` | FCVTAS | `FCVTAS  <Hd>, <Hn>` |
| `FCVTAU_advsimd` | FCVTAU | `FCVTAU  <Hd>, <Hn>` |
| `FCVTL_advsimd` | FCVTL | `FCVTL{2}  <Vd>.<Ta>, <Vn>.<Tb>` |
| `FCVTMS_advsimd` | FCVTMS | `FCVTMS  <Hd>, <Hn>` |
| `FCVTMU_advsimd` | FCVTMU | `FCVTMU  <Hd>, <Hn>` |
| `FCVTN_advsimd` | FCVTN | `FCVTN{2}  <Vd>.<Tb>, <Vn>.<Ta>` |
| `FCVTNS_advsimd` | FCVTNS | `FCVTNS  <Hd>, <Hn>` |
| `FCVTNU_advsimd` | FCVTNU | `FCVTNU  <Hd>, <Hn>` |
| `FCVTPS_advsimd` | FCVTPS | `FCVTPS  <Hd>, <Hn>` |
| `FCVTPU_advsimd` | FCVTPU | `FCVTPU  <Hd>, <Hn>` |
| `FCVTXN_advsimd` | FCVTXN | `FCVTXN  S<d>, D<n>` |
| `FCVTZS_advsimd_fix` | FCVTZS | `FCVTZS  <V><d>, <V><n>, #<fbits>` |
| `FCVTZS_advsimd_int` | FCVTZS | `FCVTZS  <Hd>, <Hn>` |
| `FCVTZU_advsimd_fix` | FCVTZU | `FCVTZU  <V><d>, <V><n>, #<fbits>` |
| `FCVTZU_advsimd_int` | FCVTZU | `FCVTZU  <Hd>, <Hn>` |
| `FDIV_advsimd` | FDIV | `FDIV  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMAX_advsimd` | FMAX | `FMAX  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMAXNM_advsimd` | FMAXNM | `FMAXNM  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMAXNMP_advsimd_pair` | FMAXNMP | `FMAXNMP  H<d>, <Vn>.2H` |
| `FMAXNMP_advsimd_vec` | FMAXNMP | `FMAXNMP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMAXNMV_advsimd` | FMAXNMV | `FMAXNMV  <V><d>, <Vn>.<T>` |
| `FMAXP_advsimd_pair` | FMAXP | `FMAXP  H<d>, <Vn>.2H` |
| `FMAXP_advsimd_vec` | FMAXP | `FMAXP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMAXV_advsimd` | FMAXV | `FMAXV  <V><d>, <Vn>.<T>` |
| `FMIN_advsimd` | FMIN | `FMIN  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMINNM_advsimd` | FMINNM | `FMINNM  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMINNMP_advsimd_pair` | FMINNMP | `FMINNMP  H<d>, <Vn>.2H` |
| `FMINNMP_advsimd_vec` | FMINNMP | `FMINNMP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMINNMV_advsimd` | FMINNMV | `FMINNMV  <V><d>, <Vn>.<T>` |
| `FMINP_advsimd_pair` | FMINP | `FMINP  H<d>, <Vn>.2H` |
| `FMINP_advsimd_vec` | FMINP | `FMINP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMINV_advsimd` | FMINV | `FMINV  <V><d>, <Vn>.<T>` |
| `FMLA_advsimd_elt` | FMLA | `FMLA  <Hd>, <Hn>, <Vm>.H[<index>]` |
| `FMLA_advsimd_vec` | FMLA | `FMLA  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMLS_advsimd_elt` | FMLS | `FMLS  <Hd>, <Hn>, <Vm>.H[<index>]` |
| `FMLS_advsimd_vec` | FMLS | `FMLS  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMOV_advsimd` | FMOV | `FMOV  <Vd>.<T>, #<imm>` |
| `FMUL_advsimd_elt` | FMUL | `FMUL  <Hd>, <Hn>, <Vm>.H[<index>]` |
| `FMUL_advsimd_vec` | FMUL | `FMUL  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `FMULX_advsimd_elt` | FMULX | `FMULX  <Hd>, <Hn>, <Vm>.H[<index>]` |
| `FMULX_advsimd_vec` | FMULX | `FMULX  <Hd>, <Hn>, <Hm>` |
| `FNEG_advsimd` | FNEG | `FNEG  <Vd>.<T>, <Vn>.<T>` |
| `FRECPE_advsimd` | FRECPE | `FRECPE  <Hd>, <Hn>` |
| `FRECPS_advsimd` | FRECPS | `FRECPS  <Hd>, <Hn>, <Hm>` |
| `FRECPX_advsimd` | FRECPX | `FRECPX  <Hd>, <Hn>` |
| `FRINTA_advsimd` | FRINTA | `FRINTA  <Vd>.<T>, <Vn>.<T>` |
| `FRINTI_advsimd` | FRINTI | `FRINTI  <Vd>.<T>, <Vn>.<T>` |
| `FRINTM_advsimd` | FRINTM | `FRINTM  <Vd>.<T>, <Vn>.<T>` |
| `FRINTN_advsimd` | FRINTN | `FRINTN  <Vd>.<T>, <Vn>.<T>` |
| `FRINTP_advsimd` | FRINTP | `FRINTP  <Vd>.<T>, <Vn>.<T>` |
| `FRINTX_advsimd` | FRINTX | `FRINTX  <Vd>.<T>, <Vn>.<T>` |
| `FRINTZ_advsimd` | FRINTZ | `FRINTZ  <Vd>.<T>, <Vn>.<T>` |
| `FRSQRTE_advsimd` | FRSQRTE | `FRSQRTE  <Hd>, <Hn>` |
| `FRSQRTS_advsimd` | FRSQRTS | `FRSQRTS  <Hd>, <Hn>, <Hm>` |
| `FSQRT_advsimd` | FSQRT | `FSQRT  <Vd>.<T>, <Vn>.<T>` |
| `FSUB_advsimd` | FSUB | `FSUB  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `INS_advsimd_elt` | INS | `INS  <Vd>.<Ts>[<index1>], <Vn>.<Ts>[<index2>]` |
| `INS_advsimd_gen` | INS | `INS  <Vd>.<Ts>[<index>], <R><n>` |
| `MOV_INS_advsimd_elt` | INS | `MOV  <Vd>.<Ts>[<index1>], <Vn>.<Ts>[<index2>]` |
| `MOV_INS_advsimd_gen` | INS | `MOV  <Vd>.<Ts>[<index>], <R><n>` |
| `LD1R_advsimd` | LD1R | `LD1R  { <Vt>.<T> }, [<Xn\|SP>]` |
| `LD2_advsimd_mult` | LD2 | `LD2  { <Vt>.<T>, <Vt2>.<T> }, [<Xn\|SP>]` |
| `LD2_advsimd_sngl` | LD2 | `LD2  { <Vt>.B, <Vt2>.B }[<index>], [<Xn\|SP>]` |
| `LD2R_advsimd` | LD2R | `LD2R  { <Vt>.<T>, <Vt2>.<T> }, [<Xn\|SP>]` |
| `LD3_advsimd_mult` | LD3 | `LD3  { <Vt>.<T>, <Vt2>.<T>, <Vt3>.<T> }, [<Xn\|SP>]` |
| `LD3_advsimd_sngl` | LD3 | `LD3  { <Vt>.B, <Vt2>.B, <Vt3>.B }[<index>], [<Xn\|SP>]` |
| `LD3R_advsimd` | LD3R | `LD3R  { <Vt>.<T>, <Vt2>.<T>, <Vt3>.<T> }, [<Xn\|SP>]` |
| `LD4_advsimd_mult` | LD4 | `LD4  { <Vt>.<T>, <Vt2>.<T>, <Vt3>.<T>, <Vt4>.<T> }, [<Xn\|SP>]` |
| `LD4_advsimd_sngl` | LD4 | `LD4  { <Vt>.B, <Vt2>.B, <Vt3>.B, <Vt4>.B }[<index>], [<Xn\|SP>]` |
| `LD4R_advsimd` | LD4R | `LD4R  { <Vt>.<T>, <Vt2>.<T>, <Vt3>.<T>, <Vt4>.<T> }, [<Xn\|SP>]` |
| `MLA_advsimd_elt` | MLA | `MLA  <Vd>.<T>, <Vn>.<T>, V<m>.<Ts>[<index>]` |
| `MLA_advsimd_vec` | MLA | `MLA  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `MLS_advsimd_elt` | MLS | `MLS  <Vd>.<T>, <Vn>.<T>, V<m>.<Ts>[<index>]` |
| `MLS_advsimd_vec` | MLS | `MLS  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `MOVI_advsimd` | MOVI | `MOVI  <Vd>.<T>, #<imm8>{, LSL #0}` |
| `MUL_advsimd_elt` | MUL | `MUL  <Vd>.<T>, <Vn>.<T>, V<m>.<Ts>[<index>]` |
| `MUL_advsimd_vec` | MUL | `MUL  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `MVNI_advsimd` | MVNI | `MVNI  <Vd>.<T>, #<imm8>{, LSL #<amount>}` |
| `NEG_advsimd` | NEG | `NEG  D<d>, D<n>` |
| `MVN_NOT_advsimd` | NOT | `MVN  <Vd>.<T>, <Vn>.<T>` |
| `NOT_advsimd` | NOT | `NOT  <Vd>.<T>, <Vn>.<T>` |
| `ORN_advsimd` | ORN | `ORN  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `MOV_ORR_advsimd_reg` | ORR | `MOV  <Vd>.<T>, <Vn>.<T>` |
| `ORR_advsimd_imm` | ORR | `ORR  <Vd>.<T>, #<imm8>{, LSL #<amount>}` |
| `ORR_advsimd_reg` | ORR | `ORR  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `PMUL_advsimd` | PMUL | `PMUL  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `PMULL_advsimd` | PMULL | `PMULL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `RADDHN_advsimd` | RADDHN | `RADDHN{2}  <Vd>.<Tb>, <Vn>.<Ta>, <Vm>.<Ta>` |
| `RBIT_advsimd` | RBIT | `RBIT  <Vd>.<T>, <Vn>.<T>` |
| `REV16_advsimd` | REV16 | `REV16  <Vd>.<T>, <Vn>.<T>` |
| `REV32_advsimd` | REV32 | `REV32  <Vd>.<T>, <Vn>.<T>` |
| `REV64_advsimd` | REV64 | `REV64  <Vd>.<T>, <Vn>.<T>` |
| `RSHRN_advsimd` | RSHRN | `RSHRN{2}  <Vd>.<Tb>, <Vn>.<Ta>, #<shift>` |
| `RSUBHN_advsimd` | RSUBHN | `RSUBHN{2}  <Vd>.<Tb>, <Vn>.<Ta>, <Vm>.<Ta>` |
| `SABA_advsimd` | SABA | `SABA  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SABAL_advsimd` | SABAL | `SABAL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SABDL_advsimd` | SABDL | `SABDL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SADALP_advsimd` | SADALP | `SADALP  <Vd>.<Ta>, <Vn>.<Tb>` |
| `SADDL_advsimd` | SADDL | `SADDL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SADDLP_advsimd` | SADDLP | `SADDLP  <Vd>.<Ta>, <Vn>.<Tb>` |
| `SADDLV_advsimd` | SADDLV | `SADDLV  <V><d>, <Vn>.<T>` |
| `SADDW_advsimd` | SADDW | `SADDW{2}  <Vd>.<Ta>, <Vn>.<Ta>, <Vm>.<Tb>` |
| `SCVTF_advsimd_fix` | SCVTF | `SCVTF  <V><d>, <V><n>, #<fbits>` |
| `SCVTF_advsimd_int` | SCVTF | `SCVTF  <Hd>, <Hn>` |
| `SHADD_advsimd` | SHADD | `SHADD  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SHL_advsimd` | SHL | `SHL  D<d>, D<n>, #<shift>` |
| `SHLL_advsimd` | SHLL | `SHLL{2}  <Vd>.<Ta>, <Vn>.<Tb>, #<shift>` |
| `SHRN_advsimd` | SHRN | `SHRN{2}  <Vd>.<Tb>, <Vn>.<Ta>, #<shift>` |
| `SHSUB_advsimd` | SHSUB | `SHSUB  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SLI_advsimd` | SLI | `SLI  D<d>, D<n>, #<shift>` |
| `SMAX_advsimd` | SMAX | `SMAX  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SMAXP_advsimd` | SMAXP | `SMAXP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SMAXV_advsimd` | SMAXV | `SMAXV  <V><d>, <Vn>.<T>` |
| `SMIN_advsimd` | SMIN | `SMIN  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SMINP_advsimd` | SMINP | `SMINP  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SMINV_advsimd` | SMINV | `SMINV  <V><d>, <Vn>.<T>` |
| `SMLAL_advsimd_elt` | SMLAL | `SMLAL{2}  <Vd>.<Ta>, <Vn>.<Tb>, V<m>.<Ts>[<index>]` |
| `SMLAL_advsimd_vec` | SMLAL | `SMLAL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SMLSL_advsimd_elt` | SMLSL | `SMLSL{2}  <Vd>.<Ta>, <Vn>.<Tb>, V<m>.<Ts>[<index>]` |
| `SMLSL_advsimd_vec` | SMLSL | `SMLSL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SMOV_advsimd` | SMOV | `SMOV  <Wd>, <Vn>.<Ts>[<index>]` |
| `SMULL_advsimd_elt` | SMULL | `SMULL{2}  <Vd>.<Ta>, <Vn>.<Tb>, V<m>.<Ts>[<index>]` |
| `SMULL_advsimd_vec` | SMULL | `SMULL{2}  <Vd>.<Ta>, <Vn>.<Tb>, <Vm>.<Tb>` |
| `SQABS_advsimd` | SQABS | `SQABS  <V><d>, <V><n>` |
| `SQADD_advsimd` | SQADD | `SQADD  <V><d>, <V><n>, <V><m>` |
| `SQDMLAL_advsimd_elt` | SQDMLAL | `SQDMLAL  <Va><d>, <Vb><n>, V<m>.<Ts>[<index>]` |
| `SQDMLAL_advsimd_vec` | SQDMLAL | `SQDMLAL  <Va><d>, <Vb><n>, <Vb><m>` |
| `SQDMLSL_advsimd_elt` | SQDMLSL | `SQDMLSL  <Va><d>, <Vb><n>, V<m>.<Ts>[<index>]` |
| `SQDMLSL_advsimd_vec` | SQDMLSL | `SQDMLSL  <Va><d>, <Vb><n>, <Vb><m>` |
| `SQDMULH_advsimd_elt` | SQDMULH | `SQDMULH  <V><d>, <V><n>, V<m>.<Ts>[<index>]` |
| `SQDMULH_advsimd_vec` | SQDMULH | `SQDMULH  <V><d>, <V><n>, <V><m>` |
| `SQDMULL_advsimd_elt` | SQDMULL | `SQDMULL{2}  <Vd>.<Ta>, <Vn>.<Tb>, V<m>.<Ts>[<index>]` |
| `SQDMULL_advsimd_vec` | SQDMULL | `SQDMULL  <Va><d>, <Vb><n>, <Vb><m>` |
| `SQNEG_advsimd` | SQNEG | `SQNEG  <V><d>, <V><n>` |
| `SQRDMULH_advsimd_elt` | SQRDMULH | `SQRDMULH  <V><d>, <V><n>, V<m>.<Ts>[<index>]` |
| `SQRDMULH_advsimd_vec` | SQRDMULH | `SQRDMULH  <V><d>, <V><n>, <V><m>` |
| `SQRSHL_advsimd` | SQRSHL | `SQRSHL  <V><d>, <V><n>, <V><m>` |
| `SQRSHRN_advsimd` | SQRSHRN | `SQRSHRN  <Vb><d>, <Va><n>, #<shift>` |
| `SQRSHRUN_advsimd` | SQRSHRUN | `SQRSHRUN  <Vb><d>, <Va><n>, #<shift>` |
| `SQSHL_advsimd_imm` | SQSHL | `SQSHL  <V><d>, <V><n>, #<shift>` |
| `SQSHL_advsimd_reg` | SQSHL | `SQSHL  <V><d>, <V><n>, <V><m>` |
| `SQSHLU_advsimd` | SQSHLU | `SQSHLU  <V><d>, <V><n>, #<shift>` |
| `SQSHRN_advsimd` | SQSHRN | `SQSHRN  <Vb><d>, <Va><n>, #<shift>` |
| `SQSHRUN_advsimd` | SQSHRUN | `SQSHRUN  <Vb><d>, <Va><n>, #<shift>` |
| `SQSUB_advsimd` | SQSUB | `SQSUB  <V><d>, <V><n>, <V><m>` |
| `SQXTN_advsimd` | SQXTN | `SQXTN  <Vb><d>, <Va><n>` |
| `SQXTUN_advsimd` | SQXTUN | `SQXTUN  <Vb><d>, <Va><n>` |
| `SRHADD_advsimd` | SRHADD | `SRHADD  <Vd>.<T>, <Vn>.<T>, <Vm>.<T>` |
| `SRI_advsimd` | SRI | `SRI  D<d>, D<n>, #<shift>` |
| `SRSHL_advsimd` | SRSHL | `SRSHL  D<d>, D<n>, D<m>` |
| `SRSHR_advsimd` | SRSHR | `SRSHR  D<d>, D<n>, #<shift>` |
| `SRSRA_advsimd` | SRSRA | `SRSRA  D<d>, D<n>, #<shift>` |
| `SSHL_advsimd` | SSHL | `SSHL  D<d>, D<n>, D<m>` |
| `SSHLL_advsimd` | SSHLL | `SSHLL{2}  <Vd>.<Ta>, <Vn>.<Tb>, #<shift>` |
| `SXTL_SSHLL_advsimd` | SSHLL | `SXTL{2}  <Vd>.<Ta>, <Vn>.<Tb>` |
| `SSHR_advsimd` | SSHR | `SSHR  D<d>, D<n>, #<shift>` |
| `SSRA_advsimd` | SSRA | `SSRA  D<d>, D<n>, #<shift>` |

### dotprod（缺口 0 条）

无缺口。

### i8mm（缺口 0 条）

无缺口。

### sve（缺口 477 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `cmpeq_p_p_zi` | None | `CMPEQ  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, #<imm>` |
| `cmpeq_p_p_zw` | None | `CMPEQ  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.D` |
| `cmpeq_p_p_zz` | None | `CMPEQ  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.<T>` |
| `cntb_r_s` | None | `CNTB  <Xd>{, <pattern>{, MUL #<imm>}}` |
| `ctermeq_rr` | None | `CTERMEQ  <R><n>, <R><m>` |
| `decb_r_rs` | None | `DECB  <Xdn>{, <pattern>{, MUL #<imm>}}` |
| `decd_z_zs` | None | `DECD  <Zdn>.D{, <pattern>{, MUL #<imm>}}` |
| `facge_p_p_zz` | None | `FACGT  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.<T>` |
| `fcmeq_p_p_z0` | None | `FCMEQ  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, #0.0` |
| `fcmeq_p_p_zz` | None | `FCMEQ  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.<T>` |
| `frinta_z_p_z` | None | `FRINTX  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `incb_r_rs` | None | `INCB  <Xdn>{, <pattern>{, MUL #<imm>}}` |
| `incd_z_zs` | None | `INCD  <Zdn>.D{, <pattern>{, MUL #<imm>}}` |
| `punpkhi_p_p` | None | `PUNPKHI  <Pd>.H, <Pn>.B` |
| `revb_z_z` | None | `REVB  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `sunpkhi_z_z` | None | `SUNPKHI  <Zd>.<T>, <Zn>.<Tb>` |
| `sxtb_z_p_z` | None | `SXTB  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `trn1_p_pp` | None | `TRN1  <Pd>.<T>, <Pn>.<T>, <Pm>.<T>` |
| `trn1_z_zz` | None | `TRN1  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `uunpkhi_z_z` | None | `UUNPKHI  <Zd>.<T>, <Zn>.<Tb>` |
| `uxtb_z_p_z` | None | `UXTB  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `uzp1_p_pp` | None | `UZP1  <Pd>.<T>, <Pn>.<T>, <Pm>.<T>` |
| `uzp1_z_zz` | None | `UZP1  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `zip1_p_pp` | None | `ZIP2  <Pd>.<T>, <Pn>.<T>, <Pm>.<T>` |
| `zip1_z_zz` | None | `ZIP2  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `addpl_r_ri` | ADDPL | `ADDPL  <Xd\|SP>, <Xn\|SP>, #<imm>` |
| `addvl_r_ri` | ADDVL | `ADDVL  <Xd\|SP>, <Xn\|SP>, #<imm>` |
| `adr_z_az` | ADR | `ADR  <Zd>.<T>, [<Zn>.<T>, <Zm>.<T>{, <mod> <amount>}]` |
| `and_p_p_pp` | AND | `AND  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `and_z_p_zz` | AND | `AND  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `and_z_zi` | AND | `AND  <Zdn>.<T>, <Zdn>.<T>, #<const>` |
| `and_z_zz` | AND | `AND  <Zd>.D, <Zn>.D, <Zm>.D` |
| `bic_and_z_zi` | AND | `BIC  <Zdn>.<T>, <Zdn>.<T>, #<const>` |
| `mov_and_p_p_pp` | AND | `MOV  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `ands_p_p_pp` | ANDS | `ANDS  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `movs_ands_p_p_pp` | ANDS | `MOVS  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `andv_r_p_z` | ANDV | `ANDV  <V><d>, <Pg>, <Zn>.<T>` |
| `asr_z_p_zi` | ASR | `ASR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `asr_z_p_zw` | ASR | `ASR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.D` |
| `asr_z_p_zz` | ASR | `ASR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `asr_z_zi` | ASR | `ASR  <Zd>.<T>, <Zn>.<T>, #<const>` |
| `asr_z_zw` | ASR | `ASR  <Zd>.<T>, <Zn>.<T>, <Zm>.D` |
| `asrd_z_p_zi` | ASRD | `ASRD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `asrr_z_p_zz` | ASRR | `ASRR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `bic_p_p_pp` | BIC | `BIC  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `bic_z_p_zz` | BIC | `BIC  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `bic_z_zz` | BIC | `BIC  <Zd>.D, <Zn>.D, <Zm>.D` |
| `bics_p_p_pp` | BICS | `BICS  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `brka_p_p_p` | BRKA | `BRKA  <Pd>.B, <Pg>/<ZM>, <Pn>.B` |
| `brkas_p_p_p` | BRKAS | `BRKAS  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `brkb_p_p_p` | BRKB | `BRKB  <Pd>.B, <Pg>/<ZM>, <Pn>.B` |
| `brkbs_p_p_p` | BRKBS | `BRKBS  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `brkn_p_p_pp` | BRKN | `BRKN  <Pdm>.B, <Pg>/Z, <Pn>.B, <Pdm>.B` |
| `brkns_p_p_pp` | BRKNS | `BRKNS  <Pdm>.B, <Pg>/Z, <Pn>.B, <Pdm>.B` |
| `brkpa_p_p_pp` | BRKPA | `BRKPA  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `brkpas_p_p_pp` | BRKPAS | `BRKPAS  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `brkpb_p_p_pp` | BRKPB | `BRKPB  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `brkpbs_p_p_pp` | BRKPBS | `BRKPBS  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `clasta_r_p_z` | CLASTA | `CLASTA  <R><dn>, <Pg>, <R><dn>, <Zm>.<T>` |
| `clasta_v_p_z` | CLASTA | `CLASTA  <V><dn>, <Pg>, <V><dn>, <Zm>.<T>` |
| `clasta_z_p_zz` | CLASTA | `CLASTA  <Zdn>.<T>, <Pg>, <Zdn>.<T>, <Zm>.<T>` |
| `clastb_r_p_z` | CLASTB | `CLASTB  <R><dn>, <Pg>, <R><dn>, <Zm>.<T>` |
| `clastb_v_p_z` | CLASTB | `CLASTB  <V><dn>, <Pg>, <V><dn>, <Zm>.<T>` |
| `clastb_z_p_zz` | CLASTB | `CLASTB  <Zdn>.<T>, <Pg>, <Zdn>.<T>, <Zm>.<T>` |
| `cls_z_p_z` | CLS | `CLS  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `clz_z_p_z` | CLZ | `CLZ  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `cmple_cmpeq_p_p_zz` | CMPGE | `CMPLE  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `cmplt_cmpeq_p_p_zz` | CMPGT | `CMPLT  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `cmplo_cmpeq_p_p_zz` | CMPHI | `CMPLO  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `cmpls_cmpeq_p_p_zz` | CMPHS | `CMPLS  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `cnot_z_p_z` | CNOT | `CNOT  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `cnt_z_p_z` | CNT | `CNT  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `cntp_r_p_p` | CNTP | `CNTP  <Xd>, <Pg>, <Pn>.<T>` |
| `compact_z_p_z` | COMPACT | `COMPACT  <Zd>.<T>, <Pg>, <Zn>.<T>` |
| `cpy_z_o_i` | CPY | `CPY  <Zd>.<T>, <Pg>/Z, #<imm>{, <shift>}` |
| `cpy_z_p_i` | CPY | `CPY  <Zd>.<T>, <Pg>/M, #<imm>{, <shift>}` |
| `cpy_z_p_r` | CPY | `CPY  <Zd>.<T>, <Pg>/M, <R><n\|SP>` |
| `cpy_z_p_v` | CPY | `CPY  <Zd>.<T>, <Pg>/M, <V><n>` |
| `fmov_cpy_z_p_i` | CPY | `FMOV  <Zd>.<T>, <Pg>/M, #0.0` |
| `mov_cpy_z_o_i` | CPY | `MOV  <Zd>.<T>, <Pg>/Z, #<imm>{, <shift>}` |
| `mov_cpy_z_p_i` | CPY | `MOV  <Zd>.<T>, <Pg>/M, #<imm>{, <shift>}` |
| `mov_cpy_z_p_r` | CPY | `MOV  <Zd>.<T>, <Pg>/M, <R><n\|SP>` |
| `mov_cpy_z_p_v` | CPY | `MOV  <Zd>.<T>, <Pg>/M, <V><n>` |
| `decp_r_p_r` | DECP | `DECP  <Xdn>, <Pm>.<T>` |
| `decp_z_p_z` | DECP | `DECP  <Zdn>.<T>, <Pm>.<T>` |
| `dup_z_i` | DUP | `DUP  <Zd>.<T>, #<imm>{, <shift>}` |
| `dup_z_r` | DUP | `DUP  <Zd>.<T>, <R><n\|SP>` |
| `dup_z_zi` | DUP | `DUP  <Zd>.<T>, <Zn>.<T>[<imm>]` |
| `fmov_dup_z_i` | DUP | `FMOV  <Zd>.<T>, #0.0` |
| `mov_dup_z_i` | DUP | `MOV  <Zd>.<T>, #<imm>{, <shift>}` |
| `mov_dup_z_r` | DUP | `MOV  <Zd>.<T>, <R><n\|SP>` |
| `mov_dup_z_zi` | DUP | `MOV  <Zd>.<T>, <V><n>` |
| `dupm_z_i` | DUPM | `DUPM  <Zd>.<T>, #<const>` |
| `mov_dupm_z_i` | DUPM | `MOV  <Zd>.<T>, #<const>` |
| `eon_eor_z_zi` | EOR | `EON  <Zdn>.<T>, <Zdn>.<T>, #<const>` |
| `eor_p_p_pp` | EOR | `EOR  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `eor_z_p_zz` | EOR | `EOR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `eor_z_zi` | EOR | `EOR  <Zdn>.<T>, <Zdn>.<T>, #<const>` |
| `eor_z_zz` | EOR | `EOR  <Zd>.D, <Zn>.D, <Zm>.D` |
| `not_eor_p_p_pp` | EOR | `NOT  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `eors_p_p_pp` | EORS | `EORS  <Pd>.B, <Pg>/Z, <Pn>.B, <Pm>.B` |
| `nots_eors_p_p_pp` | EORS | `NOTS  <Pd>.B, <Pg>/Z, <Pn>.B` |
| `eorv_r_p_z` | EORV | `EORV  <V><d>, <Pg>, <Zn>.<T>` |
| `ext_z_zi` | EXT | `EXT  <Zd>.B, { <Zn1>.B, <Zn2>.B }, #<imm>` |
| `fabd_z_p_zz` | FABD | `FABD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fabs_z_p_z` | FABS | `FABS  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `facle_facge_p_p_zz` | FACGE | `FACLE  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `faclt_facge_p_p_zz` | FACGT | `FACLT  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `fadd_z_p_zs` | FADD | `FADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fadd_z_p_zz` | FADD | `FADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fadd_z_zz` | FADD | `FADD  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fadda_v_p_z` | FADDA | `FADDA  <V><dn>, <Pg>, <V><dn>, <Zm>.<T>` |
| `faddv_v_p_z` | FADDV | `FADDV  <V><d>, <Pg>, <Zn>.<T>` |
| `fcadd_z_p_zz` | FCADD | `FCADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>, <const>` |
| `fcmle_fcmeq_p_p_zz` | FCMGE | `FCMLE  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `fcmlt_fcmeq_p_p_zz` | FCMGT | `FCMLT  <Pd>.<T>, <Pg>/Z, <Zm>.<T>, <Zn>.<T>` |
| `fcmla_z_p_zzz` | FCMLA | `FCMLA  <Zda>.<T>, <Pg>/M, <Zn>.<T>, <Zm>.<T>, <const>` |
| `fcmla_z_zzzi` | FCMLA | `FCMLA  <Zda>.H, <Zn>.H, <Zm>.H[<imm>], <const>` |
| `fcpy_z_p_i` | FCPY | `FCPY  <Zd>.<T>, <Pg>/M, #<const>` |
| `fmov_fcpy_z_p_i` | FCPY | `FMOV  <Zd>.<T>, <Pg>/M, #<const>` |
| `fcvt_z_p_z` | FCVT | `FCVT  <Zd>.S, <Pg>/M, <Zn>.H` |
| `fcvtzs_z_p_z` | FCVTZS | `FCVTZS  <Zd>.H, <Pg>/M, <Zn>.H` |
| `fcvtzu_z_p_z` | FCVTZU | `FCVTZU  <Zd>.H, <Pg>/M, <Zn>.H` |
| `fdiv_z_p_zz` | FDIV | `FDIV  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fdivr_z_p_zz` | FDIVR | `FDIVR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fdup_z_i` | FDUP | `FDUP  <Zd>.<T>, #<const>` |
| `fmov_fdup_z_i` | FDUP | `FMOV  <Zd>.<T>, #<const>` |
| `fexpa_z_z` | FEXPA | `FEXPA  <Zd>.<T>, <Zn>.<T>` |
| `fmad_z_p_zzz` | FMAD | `FMAD  <Zdn>.<T>, <Pg>/M, <Zm>.<T>, <Za>.<T>` |
| `fmax_z_p_zs` | FMAX | `FMAX  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fmax_z_p_zz` | FMAX | `FMAX  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fmaxnm_z_p_zs` | FMAXNM | `FMAXNM  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fmaxnm_z_p_zz` | FMAXNM | `FMAXNM  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fmaxnmv_v_p_z` | FMAXNMV | `FMAXNMV  <V><d>, <Pg>, <Zn>.<T>` |
| `fmaxv_v_p_z` | FMAXV | `FMAXV  <V><d>, <Pg>, <Zn>.<T>` |
| `fmin_z_p_zs` | FMIN | `FMIN  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fmin_z_p_zz` | FMIN | `FMIN  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fminnm_z_p_zs` | FMINNM | `FMINNM  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fminnm_z_p_zz` | FMINNM | `FMINNM  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fminnmv_v_p_z` | FMINNMV | `FMINNMV  <V><d>, <Pg>, <Zn>.<T>` |
| `fminv_v_p_z` | FMINV | `FMINV  <V><d>, <Pg>, <Zn>.<T>` |
| `fmla_z_p_zzz` | FMLA | `FMLA  <Zda>.<T>, <Pg>/M, <Zn>.<T>, <Zm>.<T>` |
| `fmla_z_zzzi` | FMLA | `FMLA  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `fmls_z_p_zzz` | FMLS | `FMLS  <Zda>.<T>, <Pg>/M, <Zn>.<T>, <Zm>.<T>` |
| `fmls_z_zzzi` | FMLS | `FMLS  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `fmsb_z_p_zzz` | FMSB | `FMSB  <Zdn>.<T>, <Pg>/M, <Zm>.<T>, <Za>.<T>` |
| `fmul_z_p_zs` | FMUL | `FMUL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fmul_z_p_zz` | FMUL | `FMUL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fmul_z_zz` | FMUL | `FMUL  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fmul_z_zzi` | FMUL | `FMUL  <Zd>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `fmulx_z_p_zz` | FMULX | `FMULX  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fneg_z_p_z` | FNEG | `FNEG  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `fnmad_z_p_zzz` | FNMAD | `FNMAD  <Zdn>.<T>, <Pg>/M, <Zm>.<T>, <Za>.<T>` |
| `fnmla_z_p_zzz` | FNMLA | `FNMLA  <Zda>.<T>, <Pg>/M, <Zn>.<T>, <Zm>.<T>` |
| `fnmls_z_p_zzz` | FNMLS | `FNMLS  <Zda>.<T>, <Pg>/M, <Zn>.<T>, <Zm>.<T>` |
| `fnmsb_z_p_zzz` | FNMSB | `FNMSB  <Zdn>.<T>, <Pg>/M, <Zm>.<T>, <Za>.<T>` |
| `frecpe_z_z` | FRECPE | `FRECPE  <Zd>.<T>, <Zn>.<T>` |
| `frecps_z_zz` | FRECPS | `FRECPS  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `frecpx_z_p_z` | FRECPX | `FRECPX  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `frsqrte_z_z` | FRSQRTE | `FRSQRTE  <Zd>.<T>, <Zn>.<T>` |
| `frsqrts_z_zz` | FRSQRTS | `FRSQRTS  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fscale_z_p_zz` | FSCALE | `FSCALE  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fsqrt_z_p_z` | FSQRT | `FSQRT  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `fsub_z_p_zs` | FSUB | `FSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fsub_z_p_zz` | FSUB | `FSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fsub_z_zz` | FSUB | `FSUB  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fsubr_z_p_zs` | FSUBR | `FSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <const>` |
| `fsubr_z_p_zz` | FSUBR | `FSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `ftmad_z_zzi` | FTMAD | `FTMAD  <Zdn>.<T>, <Zdn>.<T>, <Zm>.<T>, #<imm>` |
| `ftsmul_z_zz` | FTSMUL | `FTSMUL  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `ftssel_z_zz` | FTSSEL | `FTSSEL  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `incp_r_p_r` | INCP | `INCP  <Xdn>, <Pm>.<T>` |
| `incp_z_p_z` | INCP | `INCP  <Zdn>.<T>, <Pm>.<T>` |
| `index_z_ii` | INDEX | `INDEX  <Zd>.<T>, #<imm1>, #<imm2>` |
| `index_z_ir` | INDEX | `INDEX  <Zd>.<T>, #<imm>, <R><m>` |
| `index_z_ri` | INDEX | `INDEX  <Zd>.<T>, <R><n>, #<imm>` |
| `index_z_rr` | INDEX | `INDEX  <Zd>.<T>, <R><n>, <R><m>` |
| `insr_z_r` | INSR | `INSR  <Zdn>.<T>, <R><m>` |
| `insr_z_v` | INSR | `INSR  <Zdn>.<T>, <V><m>` |
| `lasta_r_p_z` | LASTA | `LASTA  <R><d>, <Pg>, <Zn>.<T>` |
| `lasta_v_p_z` | LASTA | `LASTA  <V><d>, <Pg>, <Zn>.<T>` |
| `lastb_r_p_z` | LASTB | `LASTB  <R><d>, <Pg>, <Zn>.<T>` |
| `lastb_v_p_z` | LASTB | `LASTB  <V><d>, <Pg>, <Zn>.<T>` |
| `ld1d_z_p_ai` | LD1D | `LD1D  { <Zt>.D }, <Pg>/Z, [<Zn>.D{, #<imm>}]` |
| `ld1d_z_p_bi` | LD1D | `LD1D  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1d_z_p_br` | LD1D | `LD1D  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #3]` |
| `ld1d_z_p_bz` | LD1D | `LD1D  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>, <Zm>.D, <mod> #3]` |
| `ld1h_z_p_ai` | LD1H | `LD1H  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, #<imm>}]` |
| `ld1h_z_p_bi` | LD1H | `LD1H  { <Zt>.H }, <Pg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1h_z_p_br` | LD1H | `LD1H  { <Zt>.H }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #1]` |
| `ld1h_z_p_bz` | LD1H | `LD1H  { <Zt>.S }, <Pg>/Z, [<Xn\|SP>, <Zm>.S, <mod> #1]` |
| `ld1rb_z_p_bi` | LD1RB | `LD1RB  { <Zt>.B }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rd_z_p_bi` | LD1RD | `LD1RD  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rh_z_p_bi` | LD1RH | `LD1RH  { <Zt>.H }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rqb_z_p_bi` | LD1RQB | `LD1RQB  { <Zt>.B }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rqb_z_p_br` | LD1RQB | `LD1RQB  { <Zt>.B }, <Pg>/Z, [<Xn\|SP>, <Xm>]` |
| `ld1rqd_z_p_bi` | LD1RQD | `LD1RQD  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rqd_z_p_br` | LD1RQD | `LD1RQD  { <Zt>.D }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #3]` |
| `ld1rqh_z_p_bi` | LD1RQH | `LD1RQH  { <Zt>.H }, <Pg>/Z, [<Xn\|SP>{, #<imm>}]` |
| `ld1rqh_z_p_br` | LD1RQH | `LD1RQH  { <Zt>.H }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #1]` |

### sve_i8mm（缺口 0 条）

无缺口。

### sve2（缺口 224 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `adclb_z_zzz` | ADCLB | `ADCLB  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `adclt_z_zzz` | ADCLT | `ADCLT  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `addhnb_z_zz` | ADDHNB | `ADDHNB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `addhnt_z_zz` | ADDHNT | `ADDHNT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `bcax_z_zzz` | BCAX | `BCAX  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `bsl_z_zzz` | BSL | `BSL  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `bsl1n_z_zzz` | BSL1N | `BSL1N  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `bsl2n_z_zzz` | BSL2N | `BSL2N  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `cadd_z_zz` | CADD | `CADD  <Zdn>.<T>, <Zdn>.<T>, <Zm>.<T>, <const>` |
| `cdot_z_zzz` | CDOT | `CDOT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>, <const>` |
| `cdot_z_zzzi` | CDOT | `CDOT  <Zda>.S, <Zn>.B, <Zm>.B[<imm>], <const>` |
| `cmla_z_zzz` | CMLA | `CMLA  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>, <const>` |
| `cmla_z_zzzi` | CMLA | `CMLA  <Zda>.H, <Zn>.H, <Zm>.H[<imm>], <const>` |
| `eor3_z_zzz` | EOR3 | `EOR3  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `eorbt_z_zz` | EORBT | `EORBT  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `eortb_z_zz` | EORTB | `EORTB  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `faddp_z_p_zz` | FADDP | `FADDP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fcvtlt_z_p_z` | FCVTLT | `FCVTLT  <Zd>.S, <Pg>/M, <Zn>.H` |
| `fcvtnt_z_p_z` | FCVTNT | `FCVTNT  <Zd>.H, <Pg>/M, <Zn>.S` |
| `fcvtx_z_p_z` | FCVTX | `FCVTX  <Zd>.S, <Pg>/M, <Zn>.D` |
| `fcvtxnt_z_p_z` | FCVTXNT | `FCVTXNT  <Zd>.S, <Pg>/M, <Zn>.D` |
| `flogb_z_p_z` | FLOGB | `FLOGB  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `fmaxnmp_z_p_zz` | FMAXNMP | `FMAXNMP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fmaxp_z_p_zz` | FMAXP | `FMAXP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fminnmp_z_p_zz` | FMINNMP | `FMINNMP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fminp_z_p_zz` | FMINP | `FMINP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `fmlalb_z_zzz` | FMLALB | `FMLALB  <Zda>.S, <Zn>.H, <Zm>.H` |
| `fmlalb_z_zzzi` | FMLALB | `FMLALB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `fmlalt_z_zzz` | FMLALT | `FMLALT  <Zda>.S, <Zn>.H, <Zm>.H` |
| `fmlalt_z_zzzi` | FMLALT | `FMLALT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `fmlslb_z_zzz` | FMLSLB | `FMLSLB  <Zda>.S, <Zn>.H, <Zm>.H` |
| `fmlslb_z_zzzi` | FMLSLB | `FMLSLB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `fmlslt_z_zzz` | FMLSLT | `FMLSLT  <Zda>.S, <Zn>.H, <Zm>.H` |
| `fmlslt_z_zzzi` | FMLSLT | `FMLSLT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `histseg_z_zz` | HISTSEG | `HISTSEG  <Zd>.B, <Zn>.B, <Zm>.B` |
| `ldnt1b_z_p_ar` | LDNT1B | `LDNT1B  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, <Xm>}]` |
| `ldnt1d_z_p_ar` | LDNT1D | `LDNT1D  { <Zt>.D }, <Pg>/Z, [<Zn>.D{, <Xm>}]` |
| `ldnt1h_z_p_ar` | LDNT1H | `LDNT1H  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, <Xm>}]` |
| `ldnt1sb_z_p_ar` | LDNT1SB | `LDNT1SB  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, <Xm>}]` |
| `ldnt1sh_z_p_ar` | LDNT1SH | `LDNT1SH  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, <Xm>}]` |
| `ldnt1sw_z_p_ar` | LDNT1SW | `LDNT1SW  { <Zt>.D }, <Pg>/Z, [<Zn>.D{, <Xm>}]` |
| `ldnt1w_z_p_ar` | LDNT1W | `LDNT1W  { <Zt>.S }, <Pg>/Z, [<Zn>.S{, <Xm>}]` |
| `match_p_p_zz` | MATCH | `MATCH  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.<T>` |
| `mla_z_zzzi` | MLA | `MLA  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `mls_z_zzzi` | MLS | `MLS  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `mul_z_zz` | MUL | `MUL  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `mul_z_zzi` | MUL | `MUL  <Zd>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `nbsl_z_zzz` | NBSL | `NBSL  <Zdn>.D, <Zdn>.D, <Zm>.D, <Zk>.D` |
| `nmatch_p_p_zz` | NMATCH | `NMATCH  <Pd>.<T>, <Pg>/Z, <Zn>.<T>, <Zm>.<T>` |
| `pmul_z_zz` | PMUL | `PMUL  <Zd>.B, <Zn>.B, <Zm>.B` |
| `pmullb_z_zz` | PMULLB | `PMULLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `pmullt_z_zz` | PMULLT | `PMULLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `raddhnb_z_zz` | RADDHNB | `RADDHNB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `raddhnt_z_zz` | RADDHNT | `RADDHNT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `rsubhnb_z_zz` | RSUBHNB | `RSUBHNB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `rsubhnt_z_zz` | RSUBHNT | `RSUBHNT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `saba_z_zzz` | SABA | `SABA  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sabalb_z_zzz` | SABALB | `SABALB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sabalt_z_zzz` | SABALT | `SABALT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sabdlb_z_zz` | SABDLB | `SABDLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sabdlt_z_zz` | SABDLT | `SABDLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sadalp_z_p_z` | SADALP | `SADALP  <Zda>.<T>, <Pg>/M, <Zn>.<Tb>` |
| `saddlb_z_zz` | SADDLB | `SADDLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `saddlbt_z_zz` | SADDLBT | `SADDLBT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `saddlt_z_zz` | SADDLT | `SADDLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `saddwb_z_zz` | SADDWB | `SADDWB  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `saddwt_z_zz` | SADDWT | `SADDWT  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `sbclb_z_zzz` | SBCLB | `SBCLB  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sbclt_z_zzz` | SBCLT | `SBCLT  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `shadd_z_p_zz` | SHADD | `SHADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `shrnb_z_zi` | SHRNB | `SHRNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `shrnt_z_zi` | SHRNT | `SHRNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `shsub_z_p_zz` | SHSUB | `SHSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `shsubr_z_p_zz` | SHSUBR | `SHSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sli_z_zzi` | SLI | `SLI  <Zd>.<T>, <Zn>.<T>, #<const>` |
| `smaxp_z_p_zz` | SMAXP | `SMAXP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sminp_z_p_zz` | SMINP | `SMINP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `smlalb_z_zzz` | SMLALB | `SMLALB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smlalb_z_zzzi` | SMLALB | `SMLALB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `smlalt_z_zzz` | SMLALT | `SMLALT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smlalt_z_zzzi` | SMLALT | `SMLALT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `smlslb_z_zzz` | SMLSLB | `SMLSLB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smlslb_z_zzzi` | SMLSLB | `SMLSLB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `smlslt_z_zzz` | SMLSLT | `SMLSLT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smlslt_z_zzzi` | SMLSLT | `SMLSLT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `smulh_z_zz` | SMULH | `SMULH  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `smullb_z_zz` | SMULLB | `SMULLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smullb_z_zzi` | SMULLB | `SMULLB  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `smullt_z_zz` | SMULLT | `SMULLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `smullt_z_zzi` | SMULLT | `SMULLT  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqabs_z_p_z` | SQABS | `SQABS  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `sqadd_z_p_zz` | SQADD | `SQADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqcadd_z_zz` | SQCADD | `SQCADD  <Zdn>.<T>, <Zdn>.<T>, <Zm>.<T>, <const>` |
| `sqdmlalb_z_zzz` | SQDMLALB | `SQDMLALB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlalb_z_zzzi` | SQDMLALB | `SQDMLALB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmlalbt_z_zzz` | SQDMLALBT | `SQDMLALBT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlalt_z_zzz` | SQDMLALT | `SQDMLALT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlalt_z_zzzi` | SQDMLALT | `SQDMLALT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmlslb_z_zzz` | SQDMLSLB | `SQDMLSLB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlslb_z_zzzi` | SQDMLSLB | `SQDMLSLB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmlslbt_z_zzz` | SQDMLSLBT | `SQDMLSLBT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlslt_z_zzz` | SQDMLSLT | `SQDMLSLT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmlslt_z_zzzi` | SQDMLSLT | `SQDMLSLT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmulh_z_zz` | SQDMULH | `SQDMULH  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sqdmulh_z_zzi` | SQDMULH | `SQDMULH  <Zd>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmullb_z_zz` | SQDMULLB | `SQDMULLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmullb_z_zzi` | SQDMULLB | `SQDMULLB  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqdmullt_z_zz` | SQDMULLT | `SQDMULLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `sqdmullt_z_zzi` | SQDMULLT | `SQDMULLT  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `sqneg_z_p_z` | SQNEG | `SQNEG  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `sqrdcmlah_z_zzz` | SQRDCMLAH | `SQRDCMLAH  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>, <const>` |
| `sqrdcmlah_z_zzzi` | SQRDCMLAH | `SQRDCMLAH  <Zda>.H, <Zn>.H, <Zm>.H[<imm>], <const>` |
| `sqrdmlah_z_zzz` | SQRDMLAH | `SQRDMLAH  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sqrdmlah_z_zzzi` | SQRDMLAH | `SQRDMLAH  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `sqrdmlsh_z_zzz` | SQRDMLSH | `SQRDMLSH  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sqrdmlsh_z_zzzi` | SQRDMLSH | `SQRDMLSH  <Zda>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `sqrdmulh_z_zz` | SQRDMULH | `SQRDMULH  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sqrdmulh_z_zzi` | SQRDMULH | `SQRDMULH  <Zd>.H, <Zn>.H, <Zm>.H[<imm>]` |
| `sqrshl_z_p_zz` | SQRSHL | `SQRSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqrshlr_z_p_zz` | SQRSHLR | `SQRSHLR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqrshrnb_z_zi` | SQRSHRNB | `SQRSHRNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqrshrnt_z_zi` | SQRSHRNT | `SQRSHRNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqrshrunb_z_zi` | SQRSHRUNB | `SQRSHRUNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqrshrunt_z_zi` | SQRSHRUNT | `SQRSHRUNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqshl_z_p_zi` | SQSHL | `SQSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `sqshl_z_p_zz` | SQSHL | `SQSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqshlr_z_p_zz` | SQSHLR | `SQSHLR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqshlu_z_p_zi` | SQSHLU | `SQSHLU  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `sqshrnb_z_zi` | SQSHRNB | `SQSHRNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqshrnt_z_zi` | SQSHRNT | `SQSHRNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqshrunb_z_zi` | SQSHRUNB | `SQSHRUNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqshrunt_z_zi` | SQSHRUNT | `SQSHRUNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sqsub_z_p_zz` | SQSUB | `SQSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqsubr_z_p_zz` | SQSUBR | `SQSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sqxtnb_z_zz` | SQXTNB | `SQXTNB  <Zd>.<T>, <Zn>.<Tb>` |
| `sqxtnt_z_zz` | SQXTNT | `SQXTNT  <Zd>.<T>, <Zn>.<Tb>` |
| `sqxtunb_z_zz` | SQXTUNB | `SQXTUNB  <Zd>.<T>, <Zn>.<Tb>` |
| `sqxtunt_z_zz` | SQXTUNT | `SQXTUNT  <Zd>.<T>, <Zn>.<Tb>` |
| `srhadd_z_p_zz` | SRHADD | `SRHADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `sri_z_zzi` | SRI | `SRI  <Zd>.<T>, <Zn>.<T>, #<const>` |
| `srshl_z_p_zz` | SRSHL | `SRSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `srshlr_z_p_zz` | SRSHLR | `SRSHLR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `srshr_z_p_zi` | SRSHR | `SRSHR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `srsra_z_zi` | SRSRA | `SRSRA  <Zda>.<T>, <Zn>.<T>, #<const>` |
| `sshllb_z_zi` | SSHLLB | `SSHLLB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `sshllt_z_zi` | SSHLLT | `SSHLLT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `ssra_z_zi` | SSRA | `SSRA  <Zda>.<T>, <Zn>.<T>, #<const>` |
| `ssublb_z_zz` | SSUBLB | `SSUBLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `ssublbt_z_zz` | SSUBLBT | `SSUBLBT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `ssublt_z_zz` | SSUBLT | `SSUBLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `ssubltb_z_zz` | SSUBLTB | `SSUBLTB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `ssubwb_z_zz` | SSUBWB | `SSUBWB  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `ssubwt_z_zz` | SSUBWT | `SSUBWT  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `stnt1b_z_p_ar` | STNT1B | `STNT1B  { <Zt>.S }, <Pg>, [<Zn>.S{, <Xm>}]` |
| `stnt1d_z_p_ar` | STNT1D | `STNT1D  { <Zt>.D }, <Pg>, [<Zn>.D{, <Xm>}]` |
| `stnt1h_z_p_ar` | STNT1H | `STNT1H  { <Zt>.S }, <Pg>, [<Zn>.S{, <Xm>}]` |
| `stnt1w_z_p_ar` | STNT1W | `STNT1W  { <Zt>.S }, <Pg>, [<Zn>.S{, <Xm>}]` |
| `subhnb_z_zz` | SUBHNB | `SUBHNB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `subhnt_z_zz` | SUBHNT | `SUBHNT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `suqadd_z_p_zz` | SUQADD | `SUQADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `tbx_z_zz` | TBX | `TBX  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `uaba_z_zzz` | UABA | `UABA  <Zda>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `uabalb_z_zzz` | UABALB | `UABALB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uabalt_z_zzz` | UABALT | `UABALT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uabdlb_z_zz` | UABDLB | `UABDLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uabdlt_z_zz` | UABDLT | `UABDLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uadalp_z_p_z` | UADALP | `UADALP  <Zda>.<T>, <Pg>/M, <Zn>.<Tb>` |
| `uaddlb_z_zz` | UADDLB | `UADDLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uaddlt_z_zz` | UADDLT | `UADDLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `uaddwb_z_zz` | UADDWB | `UADDWB  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `uaddwt_z_zz` | UADDWT | `UADDWT  <Zd>.<T>, <Zn>.<T>, <Zm>.<Tb>` |
| `uhadd_z_p_zz` | UHADD | `UHADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uhsub_z_p_zz` | UHSUB | `UHSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uhsubr_z_p_zz` | UHSUBR | `UHSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uminp_z_p_zz` | UMINP | `UMINP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `umlalb_z_zzz` | UMLALB | `UMLALB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umlalb_z_zzzi` | UMLALB | `UMLALB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `umlalt_z_zzz` | UMLALT | `UMLALT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umlalt_z_zzzi` | UMLALT | `UMLALT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `umlslb_z_zzz` | UMLSLB | `UMLSLB  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umlslb_z_zzzi` | UMLSLB | `UMLSLB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `umlslt_z_zzz` | UMLSLT | `UMLSLT  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umlslt_z_zzzi` | UMLSLT | `UMLSLT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `umulh_z_zz` | UMULH | `UMULH  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `umullb_z_zz` | UMULLB | `UMULLB  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umullb_z_zzi` | UMULLB | `UMULLB  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `umullt_z_zz` | UMULLT | `UMULLT  <Zd>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `umullt_z_zzi` | UMULLT | `UMULLT  <Zd>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `uqadd_z_p_zz` | UQADD | `UQADD  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqrshl_z_p_zz` | UQRSHL | `UQRSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqrshlr_z_p_zz` | UQRSHLR | `UQRSHLR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqrshrnb_z_zi` | UQRSHRNB | `UQRSHRNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `uqrshrnt_z_zi` | UQRSHRNT | `UQRSHRNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `uqshl_z_p_zi` | UQSHL | `UQSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, #<const>` |
| `uqshl_z_p_zz` | UQSHL | `UQSHL  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqshlr_z_p_zz` | UQSHLR | `UQSHLR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqshrnb_z_zi` | UQSHRNB | `UQSHRNB  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `uqshrnt_z_zi` | UQSHRNT | `UQSHRNT  <Zd>.<T>, <Zn>.<Tb>, #<const>` |
| `uqsub_z_p_zz` | UQSUB | `UQSUB  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uqsubr_z_p_zz` | UQSUBR | `UQSUBR  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |

### sve2p1（缺口 110 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `addqv_z_p_z` | ADDQV | `ADDQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `andqv_z_p_z` | ANDQV | `ANDQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `bfmlslb_z_zzz` | BFMLSLB | `BFMLSLB  <Zda>.S, <Zn>.H, <Zm>.H` |
| `bfmlslb_z_zzzi` | BFMLSLB | `BFMLSLB  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `bfmlslt_z_zzz` | BFMLSLT | `BFMLSLT  <Zda>.S, <Zn>.H, <Zm>.H` |
| `bfmlslt_z_zzzi` | BFMLSLT | `BFMLSLT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `cntp_r_pn` | CNTP | `CNTP  <Xd>, <PNn>.<T>, <vl>` |
| `dupq_z_zi` | DUPQ | `DUPQ  <Zd>.<T>, <Zn>.<T>[<imm>]` |
| `eorqv_z_p_z` | EORQV | `EORQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `extq_z_zi` | EXTQ | `EXTQ  <Zdn>.B, <Zdn>.B, <Zm>.B, #<imm>` |
| `faddqv_z_p_z` | FADDQV | `FADDQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `fclamp_z_zz` | FCLAMP | `FCLAMP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fdot_z_zzz` | FDOT | `FDOT  <Zda>.S, <Zn>.H, <Zm>.H` |
| `fdot_z_zzzi` | FDOT | `FDOT  <Zda>.S, <Zn>.H, <Zm>.H[<imm>]` |
| `fmaxnmqv_z_p_z` | FMAXNMQV | `FMAXNMQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `fmaxqv_z_p_z` | FMAXQV | `FMAXQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `fminnmqv_z_p_z` | FMINNMQV | `FMINNMQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `fminqv_z_p_z` | FMINQV | `FMINQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `ld1b_mz_p_bi` | LD1B | `LD1B  { <Zt1>.B-<Zt2>.B }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1b_mz_p_br` | LD1B | `LD1B  { <Zt1>.B-<Zt2>.B }, <PNg>/Z, [<Xn\|SP>, <Xm>]` |
| `ld1d_mz_p_bi` | LD1D | `LD1D  { <Zt1>.D-<Zt2>.D }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1d_mz_p_br` | LD1D | `LD1D  { <Zt1>.D-<Zt2>.D }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #3]` |
| `ld1h_mz_p_bi` | LD1H | `LD1H  { <Zt1>.H-<Zt2>.H }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1h_mz_p_br` | LD1H | `LD1H  { <Zt1>.H-<Zt2>.H }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #1]` |
| `ld1q_z_p_ar` | LD1Q | `LD1Q  { <Zt>.Q }, <Pg>/Z, [<Zn>.D{, <Xm>}]` |
| `ld1w_mz_p_bi` | LD1W | `LD1W  { <Zt1>.S-<Zt2>.S }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld1w_mz_p_br` | LD1W | `LD1W  { <Zt1>.S-<Zt2>.S }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #2]` |
| `ld2q_z_p_bi` | LD2Q | `LD2Q  { <Zt1>.Q, <Zt2>.Q }, <Pg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld2q_z_p_br` | LD2Q | `LD2Q  { <Zt1>.Q, <Zt2>.Q }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #4]` |
| `ld3q_z_p_bi` | LD3Q | `LD3Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q }, <Pg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld3q_z_p_br` | LD3Q | `LD3Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #4]` |
| `ld4q_z_p_bi` | LD4Q | `LD4Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q, <Zt4>.Q }, <Pg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ld4q_z_p_br` | LD4Q | `LD4Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q, <Zt4>.Q }, <Pg>/Z, [<Xn\|SP>, <Xm>, LSL #4]` |
| `ldnt1b_mz_p_bi` | LDNT1B | `LDNT1B  { <Zt1>.B-<Zt2>.B }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ldnt1b_mz_p_br` | LDNT1B | `LDNT1B  { <Zt1>.B-<Zt2>.B }, <PNg>/Z, [<Xn\|SP>, <Xm>]` |
| `ldnt1d_mz_p_bi` | LDNT1D | `LDNT1D  { <Zt1>.D-<Zt2>.D }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ldnt1d_mz_p_br` | LDNT1D | `LDNT1D  { <Zt1>.D-<Zt2>.D }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #3]` |
| `ldnt1h_mz_p_bi` | LDNT1H | `LDNT1H  { <Zt1>.H-<Zt2>.H }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ldnt1h_mz_p_br` | LDNT1H | `LDNT1H  { <Zt1>.H-<Zt2>.H }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #1]` |
| `ldnt1w_mz_p_bi` | LDNT1W | `LDNT1W  { <Zt1>.S-<Zt2>.S }, <PNg>/Z, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `ldnt1w_mz_p_br` | LDNT1W | `LDNT1W  { <Zt1>.S-<Zt2>.S }, <PNg>/Z, [<Xn\|SP>, <Xm>, LSL #2]` |
| `orqv_z_p_z` | ORQV | `ORQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `pext_pn_rr` | PEXT | `PEXT  <Pd>.<T>, <PNn>[<imm>]` |
| `pext_pp_rr` | PEXT | `PEXT  { <Pd1>.<T>, <Pd2>.<T> }, <PNn>[<imm>]` |
| `pmov_p_zi` | PMOV | `PMOV  <Pd>.B, <Zn>` |
| `pmov_z_pi` | PMOV | `PMOV  <Zd>, <Pn>.B` |
| `psel_p_ppi` | PSEL | `PSEL  <Pd>, <Pn>, <Pm>.<T>[<Wv>, <imm>]` |
| `ptrue_pn_i` | PTRUE | `PTRUE  <PNd>.<T>` |
| `revd_z_p_z` | REVD | `REVD  <Zd>.Q, <Pg>/M, <Zn>.Q` |
| `sclamp_z_zz` | SCLAMP | `SCLAMP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `sdot_z32_zzz` | SDOT | `SDOT  <Zda>.H, <Zn>.B, <Zm>.B` |
| `sdot_z32_zzzi` | SDOT | `SDOT  <Zda>.H, <Zn>.B, <Zm>.B[<imm>]` |
| `smaxqv_z_p_z` | SMAXQV | `SMAXQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `sminqv_z_p_z` | SMINQV | `SMINQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `sqcvtn_z_mz2` | SQCVTN | `SQCVTN  <Zd>.H, { <Zn1>.S-<Zn2>.S }` |
| `sqcvtun_z_mz2` | SQCVTUN | `SQCVTUN  <Zd>.H, { <Zn1>.S-<Zn2>.S }` |
| `sqrshrn_z_mz2` | SQRSHRN | `SQRSHRN  <Zd>.B, { <Zn1>.H-<Zn2>.H }, #<const>` |
| `sqrshrun_z_mz2` | SQRSHRUN | `SQRSHRUN  <Zd>.B, { <Zn1>.H-<Zn2>.H }, #<const>` |
| `st1b_mz_p_bi` | ST1B | `ST1B  { <Zt1>.B-<Zt2>.B }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st1b_mz_p_br` | ST1B | `ST1B  { <Zt1>.B-<Zt2>.B }, <PNg>, [<Xn\|SP>, <Xm>]` |
| `st1d_mz_p_bi` | ST1D | `ST1D  { <Zt1>.D-<Zt2>.D }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st1d_mz_p_br` | ST1D | `ST1D  { <Zt1>.D-<Zt2>.D }, <PNg>, [<Xn\|SP>, <Xm>, LSL #3]` |
| `st1h_mz_p_bi` | ST1H | `ST1H  { <Zt1>.H-<Zt2>.H }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st1h_mz_p_br` | ST1H | `ST1H  { <Zt1>.H-<Zt2>.H }, <PNg>, [<Xn\|SP>, <Xm>, LSL #1]` |
| `st1q_z_p_ar` | ST1Q | `ST1Q  { <Zt>.Q }, <Pg>, [<Zn>.D{, <Xm>}]` |
| `st1w_mz_p_bi` | ST1W | `ST1W  { <Zt1>.S-<Zt2>.S }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st1w_mz_p_br` | ST1W | `ST1W  { <Zt1>.S-<Zt2>.S }, <PNg>, [<Xn\|SP>, <Xm>, LSL #2]` |
| `st2q_z_p_bi` | ST2Q | `ST2Q  { <Zt1>.Q, <Zt2>.Q }, <Pg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st2q_z_p_br` | ST2Q | `ST2Q  { <Zt1>.Q, <Zt2>.Q }, <Pg>, [<Xn\|SP>, <Xm>, LSL #4]` |
| `st3q_z_p_bi` | ST3Q | `ST3Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q }, <Pg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st3q_z_p_br` | ST3Q | `ST3Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q }, <Pg>, [<Xn\|SP>, <Xm>, LSL #4]` |
| `st4q_z_p_bi` | ST4Q | `ST4Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q, <Zt4>.Q }, <Pg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `st4q_z_p_br` | ST4Q | `ST4Q  { <Zt1>.Q, <Zt2>.Q, <Zt3>.Q, <Zt4>.Q }, <Pg>, [<Xn\|SP>, <Xm>, LSL #4]` |
| `stnt1b_mz_p_bi` | STNT1B | `STNT1B  { <Zt1>.B-<Zt2>.B }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `stnt1b_mz_p_br` | STNT1B | `STNT1B  { <Zt1>.B-<Zt2>.B }, <PNg>, [<Xn\|SP>, <Xm>]` |
| `stnt1d_mz_p_bi` | STNT1D | `STNT1D  { <Zt1>.D-<Zt2>.D }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `stnt1d_mz_p_br` | STNT1D | `STNT1D  { <Zt1>.D-<Zt2>.D }, <PNg>, [<Xn\|SP>, <Xm>, LSL #3]` |
| `stnt1h_mz_p_bi` | STNT1H | `STNT1H  { <Zt1>.H-<Zt2>.H }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `stnt1h_mz_p_br` | STNT1H | `STNT1H  { <Zt1>.H-<Zt2>.H }, <PNg>, [<Xn\|SP>, <Xm>, LSL #1]` |
| `stnt1w_mz_p_bi` | STNT1W | `STNT1W  { <Zt1>.S-<Zt2>.S }, <PNg>, [<Xn\|SP>{, #<imm>, MUL VL}]` |
| `stnt1w_mz_p_br` | STNT1W | `STNT1W  { <Zt1>.S-<Zt2>.S }, <PNg>, [<Xn\|SP>, <Xm>, LSL #2]` |
| `tblq_z_zz` | TBLQ | `TBLQ  <Zd>.<T>, { <Zn>.<T> }, <Zm>.<T>` |
| `tbxq_z_zz` | TBXQ | `TBXQ  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `uclamp_z_zz` | UCLAMP | `UCLAMP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `udot_z32_zzz` | UDOT | `UDOT  <Zda>.H, <Zn>.B, <Zm>.B` |
| `udot_z32_zzzi` | UDOT | `UDOT  <Zda>.H, <Zn>.B, <Zm>.B[<imm>]` |
| `umaxqv_z_p_z` | UMAXQV | `UMAXQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `uminqv_z_p_z` | UMINQV | `UMINQV  <Vd>.<T>, <Pg>, <Zn>.<Tb>` |
| `uqcvtn_z_mz2` | UQCVTN | `UQCVTN  <Zd>.H, { <Zn1>.S-<Zn2>.S }` |
| `uqrshrn_z_mz2` | UQRSHRN | `UQRSHRN  <Zd>.B, { <Zn1>.H-<Zn2>.H }, #<const>` |
| `uzpq1_z_zz` | UZPQ1 | `UZPQ1  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `uzpq2_z_zz` | UZPQ2 | `UZPQ2  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `whilege_pn_rr` | WHILEGE | `WHILEGE  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilege_pp_rr` | WHILEGE | `WHILEGE  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilegt_pn_rr` | WHILEGT | `WHILEGT  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilegt_pp_rr` | WHILEGT | `WHILEGT  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilehi_pn_rr` | WHILEHI | `WHILEHI  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilehi_pp_rr` | WHILEHI | `WHILEHI  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilehs_pn_rr` | WHILEHS | `WHILEHS  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilehs_pp_rr` | WHILEHS | `WHILEHS  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilele_pn_rr` | WHILELE | `WHILELE  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilele_pp_rr` | WHILELE | `WHILELE  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilelo_pn_rr` | WHILELO | `WHILELO  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilelo_pp_rr` | WHILELO | `WHILELO  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilels_pn_rr` | WHILELS | `WHILELS  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilels_pp_rr` | WHILELS | `WHILELS  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `whilelt_pn_rr` | WHILELT | `WHILELT  <PNd>.<T>, <Xn>, <Xm>, <vl>` |
| `whilelt_pp_rr` | WHILELT | `WHILELT  { <Pd1>.<T>, <Pd2>.<T> }, <Xn>, <Xm>` |
| `zipq1_z_zz` | ZIPQ1 | `ZIPQ1  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `zipq2_z_zz` | ZIPQ2 | `ZIPQ2  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |

### sve2p2（缺口 9 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `bfcvt_z_p_z` | BFCVT | `BFCVT  <Zd>.H, <Pg>/M, <Zn>.S` |
| `bfcvtnt_z_p_z` | BFCVTNT | `BFCVTNT  <Zd>.H, <Pg>/M, <Zn>.S` |
| `expand_z_p_z` | EXPAND | `EXPAND  <Zd>.<T>, <Pg>, <Zn>.<T>` |
| `firstp_r_p_p` | FIRSTP | `FIRSTP  <Xd>, <Pg>, <Pn>.<T>` |
| `frint32x_z_p_z` | FRINT32X | `FRINT32X  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `frint32z_z_p_z` | FRINT32Z | `FRINT32Z  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `frint64x_z_p_z` | FRINT64X | `FRINT64X  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `frint64z_z_p_z` | FRINT64Z | `FRINT64Z  <Zd>.<T>, <Pg>/M, <Zn>.<T>` |
| `lastp_r_p_p` | LASTP | `LASTP  <Xd>, <Pg>, <Pn>.<T>` |

### sve2p3（缺口 16 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `addqp_z_zz` | ADDQP | `ADDQP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `addsubp_z_zz` | ADDSUBP | `ADDSUBP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `fcvtzsn_z_mz2` | FCVTZSN | `FCVTZSN  <Zd>.<T>, { <Zn1>.<Tb>-<Zn2>.<Tb> }` |
| `fcvtzun_z_mz2` | FCVTZUN | `FCVTZUN  <Zd>.<T>, { <Zn1>.<Tb>-<Zn2>.<Tb> }` |
| `luti6_z_z2zz` | LUTI6 | `LUTI6  <Zd>.H, { <Zn1>.H, <Zn2>.H }, <Zm>[<index>]` |
| `luti6_z_zzz` | LUTI6 | `LUTI6  <Zd>.B, { <Zn1>.B, <Zn2>.B }, <Zm>` |
| `sabal_z_zzz` | SABAL | `SABAL  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `scvtf_z_z` | SCVTF | `SCVTF  <Zd>.<T>, <Zn>.<Tb>` |
| `scvtflt_z_z` | SCVTFLT | `SCVTFLT  <Zd>.<T>, <Zn>.<Tb>` |
| `sqshrn_z_mz2` | SQSHRN | `SQSHRN  <Zd>.<T>, { <Zn1>.<Tb>-<Zn2>.<Tb> }, #<const>` |
| `sqshrun_z_mz2` | SQSHRUN | `SQSHRUN  <Zd>.<T>, { <Zn1>.<Tb>-<Zn2>.<Tb> }, #<const>` |
| `subp_z_p_zz` | SUBP | `SUBP  <Zdn>.<T>, <Pg>/M, <Zdn>.<T>, <Zm>.<T>` |
| `uabal_z_zzz` | UABAL | `UABAL  <Zda>.<T>, <Zn>.<Tb>, <Zm>.<Tb>` |
| `ucvtf_z_z` | UCVTF | `UCVTF  <Zd>.<T>, <Zn>.<Tb>` |
| `ucvtflt_z_z` | UCVTFLT | `UCVTFLT  <Zd>.<T>, <Zn>.<Tb>` |
| `uqshrn_z_mz2` | UQSHRN | `UQSHRN  <Zd>.<T>, { <Zn1>.<Tb>-<Zn2>.<Tb> }, #<const>` |

### sve2_bitperm（缺口 3 条）

| 官方 id | 助记符 | 汇编形式 |
|---|---|---|
| `bdep_z_zz` | BDEP | `BDEP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `bext_z_zz` | BEXT | `BEXT  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
| `bgrp_z_zz` | BGRP | `BGRP  <Zd>.<T>, <Zn>.<T>, <Zm>.<T>` |
