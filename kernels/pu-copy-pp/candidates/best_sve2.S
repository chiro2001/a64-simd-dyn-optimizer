	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_pu_copy_pp_sve2
	.type	dynopt_pu_copy_pp_sve2, %function
dynopt_pu_copy_pp_sve2:
.LFB2:
	.cfi_startproc
	mov	w4, 16
	.p2align 5,,15
.L2:
	ldr	q31, [x2]
	subs	w4, w4, #1
	add	x2, x2, x3
	str	q31, [x0]
	add	x0, x0, x1
	bne	.L2
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_pu_copy_pp_sve2, .-dynopt_pu_copy_pp_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
