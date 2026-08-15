	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_sign_sve2
	.type	dynopt_sign_sve2, %function
dynopt_sign_sve2:
.LFB2:
	.cfi_startproc
	cmp	w3, 0
	ble	.L1
	mov	x4, 0
	mov	w6, 32
	.p2align 5,,15
.L3:
	sub	w5, w3, w4
	cmp	w5, 32
	csel	w5, w5, w6, le
	whilelo	p7.b, wzr, w5
	ld1b	z29.b, p7/z, [x1, x4]
	ld1b	z28.b, p7/z, [x2, x4]
	cmphi	p14.b, p7/z, z29.b, z28.b
	cmphi	p15.b, p7/z, z28.b, z29.b
	mov	z31.b, p14/z, #1
	mov	z30.b, p15/z, #-1
	add	z30.b, z31.b, z30.b
	st1b	z30.b, p7, [x0, x4]
	add	x4, x4, 32
	cmp	w3, w4
	bgt	.L3
.L1:
	ret
	.cfi_endproc
.LFE2:
	.size	dynopt_sign_sve2, .-dynopt_sign_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
