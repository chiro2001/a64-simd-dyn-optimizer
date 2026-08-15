	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_cu_add_ps_16x16_sve2
	.type	dynopt_cu_add_ps_16x16_sve2, %function
dynopt_cu_add_ps_16x16_sve2:
.LFB2:
	.cfi_startproc
	mov	w6, 16
	ptrue	p7.b, all
	.p2align 5,,15
.L2:
	ld1b	z31.h, p7/z, [x2]
	ld1h	z30.h, p7/z, [x3]
	add	z30.h, z31.h, z30.h
	sqxtunb	z30.b, z30.h
	uzp1	z30.b, z30.b, z30.b
	str	q30, [x0]
	add	x2, x2, x4
	add	x3, x3, x5, lsl 1
	subs	w6, w6, #1
	add	x0, x0, x1
	bne	.L2
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_cu_add_ps_16x16_sve2, .-dynopt_cu_add_ps_16x16_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
