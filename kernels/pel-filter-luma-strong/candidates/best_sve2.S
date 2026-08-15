	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_pel_filter_luma_strong_sve2
	.type	dynopt_pel_filter_luma_strong_sve2, %function
dynopt_pel_filter_luma_strong_sve2:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	neg	w14, w3
	neg	w13, w4
	mov	x29, sp
	sub	x30, x2, x2, lsl 2
	stp	x19, x20, [sp, 16]
	.cfi_offset 19, -64
	.cfi_offset 20, -56
	mov	x20, x1
	lsl	x19, x2, 1
	neg	x1, x2, lsl 1
	stp	x21, x22, [sp, 32]
	.cfi_offset 21, -48
	.cfi_offset 22, -40
	neg	x21, x2
	neg	x22, x2, lsl 2
	stp	x23, x24, [sp, 48]
	.cfi_offset 23, -32
	.cfi_offset 24, -24
	add	x23, x2, x2, lsl 1
	mov	w18, 4
	mov	w12, 255
	stp	x25, x26, [sp, 64]
	.cfi_offset 25, -16
	.cfi_offset 26, -8
.L8:
	ldrb	w17, [x0, x30]
	ldrb	w7, [x0, x22]
	ldrb	w10, [x0, x21]
	ldrb	w9, [x0]
	add	w5, w17, w17, lsl 1
	ldrb	w11, [x0, x1]
	add	w7, w5, w7, lsl 1
	ldrb	w16, [x0, x2]
	add	w26, w9, w10
	ldrb	w15, [x0, x19]
	add	w5, w11, w17
	add	w8, w5, w10
	ldrb	w24, [x0, x23]
	add	w7, w7, w11
	add	w5, w11, w5
	add	w6, w11, w10, lsl 1
	add	w26, w26, w16
	add	w26, w26, w15
	add	w7, w7, w10
	add	w5, w5, w10, lsl 1
	add	w6, w6, w9, lsl 1
	add	w25, w26, 2
	add	w7, w7, w9
	add	w26, w26, w15, lsl 1
	add	w5, w5, w9, lsl 1
	add	w6, w6, w16, lsl 1
	add	w24, w26, w24, lsl 1
	add	w7, w7, 4
	add	w8, w8, w9
	add	w5, w5, w16
	add	w6, w6, w15
	add	w8, w8, 2
	add	w5, w5, 4
	add	w6, w6, 4
	add	w24, w24, 4
	asr	w7, w7, 3
	asr	w8, w8, 2
	asr	w5, w5, 3
	asr	w6, w6, 3
	asr	w25, w25, 2
	asr	w24, w24, 3
	sub	w7, w7, w17
	sub	w8, w8, w11
	sub	w5, w5, w10
	sub	w6, w6, w9
	sub	w25, w25, w16
	sub	w24, w24, w15
	mov	w26, w14
	cmp	w14, w7
	bgt	.L2
	cmp	w3, w7
	csel	w26, w3, w7, le
.L2:
	add	w7, w26, w17
	cmp	w7, 255
	csel	w7, w7, w12, le
	bic	w7, w7, w7, asr #31
	strb	w7, [x0, x30]
	mov	w7, w14
	cmp	w14, w8
	bgt	.L3
	cmp	w3, w8
	csel	w7, w3, w8, le
.L3:
	add	w7, w7, w11
	cmp	w7, 255
	csel	w7, w7, w12, le
	bic	w7, w7, w7, asr #31
	strb	w7, [x0, x1]
	mov	w7, w14
	cmp	w14, w5
	bgt	.L4
	cmp	w3, w5
	csel	w7, w3, w5, le
.L4:
	add	w5, w7, w10
	cmp	w5, 255
	csel	w5, w5, w12, le
	bic	w5, w5, w5, asr #31
	strb	w5, [x0, x21]
	mov	w5, w13
	cmp	w13, w6
	bgt	.L5
	cmp	w4, w6
	csel	w5, w4, w6, le
.L5:
	add	w5, w5, w9
	cmp	w5, 255
	csel	w5, w5, w12, le
	bic	w5, w5, w5, asr #31
	strb	w5, [x0]
	mov	w5, w13
	cmp	w13, w25
	bgt	.L6
	cmp	w4, w25
	csel	w5, w4, w25, le
.L6:
	add	w5, w5, w16
	cmp	w5, 255
	csel	w5, w5, w12, le
	bic	w5, w5, w5, asr #31
	strb	w5, [x0, x2]
	mov	w5, w13
	cmp	w13, w24
	bgt	.L7
	cmp	w4, w24
	csel	w5, w4, w24, le
.L7:
	add	w5, w5, w15
	cmp	w5, 255
	csel	w5, w5, w12, le
	subs	w18, w18, #1
	bic	w5, w5, w5, asr #31
	strb	w5, [x0, x19]
	add	x0, x0, x20
	bne	.L8
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	dynopt_pel_filter_luma_strong_sve2, .-dynopt_pel_filter_luma_strong_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
