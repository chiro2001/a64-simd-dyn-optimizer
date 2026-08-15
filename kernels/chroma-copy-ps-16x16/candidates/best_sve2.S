	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_chroma_copy_ps_16x16_sve2
	.type	dynopt_chroma_copy_ps_16x16_sve2, %function
dynopt_chroma_copy_ps_16x16_sve2:
.LFB2:
	.cfi_startproc
	mov	w4, 16
	ptrue	p7.b, all
	.p2align 5,,15
.L2:
	ld1b	z31.h, p7/z, [x2]
	st1h	z31.h, p7, [x0]
	add	x2, x2, x3
	add	x0, x0, x1, lsl 1
	subs	w4, w4, #1
	bne	.L2
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_chroma_copy_ps_16x16_sve2, .-dynopt_chroma_copy_ps_16x16_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
