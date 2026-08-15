	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_cu_copy_pp_sve2
	.type	dynopt_cu_copy_pp_sve2, %function
dynopt_cu_copy_pp_sve2:
.LFB2:
	.cfi_startproc
	mov	w4, 32
	whilelo	p7.b, wzr, w4
	.p2align 5,,15
.L2:
	ld1b	z31.b, p7/z, [x2]
	st1b	z31.b, p7, [x0]
	add	x2, x2, x3
	add	x0, x0, x1
	subs	w4, w4, #1
	bne	.L2
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_cu_copy_pp_sve2, .-dynopt_cu_copy_pp_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
