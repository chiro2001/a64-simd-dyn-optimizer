	.arch armv8.2-a+dotprod+crc
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_scan_pos_last_sve2
	.type	dynopt_scan_pos_last_sve2, %function
dynopt_scan_pos_last_sve2:
.LFB3891:
	.cfi_startproc
	cmp	w5, 0
	ble	.L10
	ldp	q31, q30, [x6]
	adrp	x6, .LANCHOR0
	sbfiz	x11, x7, 1, 32
	mov	x12, x4
	ldr	q27, [x6, #:lo12:.LANCHOR0]
	uzp1	v0.16b, v31.16b, v30.16b
	.p2align 5,,15
.L6:
#APP
// 23 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	ldrh w7, [x0], #32
// 0 "" 2
#NO_APP
	ubfiz	x10, x7, 1, 16
	add	x13, x1, x10
	add	x9, x13, x11
	add	x8, x13, x11, lsl 1
	ldr	d29, [x1, x10]
	ldr	d25, [x13, x11]
	ldr	d28, [x9, x11]
	ldr	d26, [x8, x11]
	uzp1	v1.2d, v29.2d, v25.2d
	uzp1	v2.2d, v28.2d, v26.2d
	sqxtn	v3.8b, v1.8h
	sqxtn2	v3.16b, v2.8h
	tbl	v4.16b, {v3.16b}, v0.16b
	cmeq	v5.16b, v4.16b, #0
	cmlt	v6.16b, v4.16b, #0
	bic	v7.16b, v27.16b, v5.16b
	and	v16.16b, v6.16b, v27.16b
	addp	v17.16b, v16.16b, v7.16b
	addp	v18.16b, v17.16b, v17.16b
	addp	v19.16b, v18.16b, v18.16b
	fmov	w14, s19
	lsr	w15, w14, 16
	fmov	d20, x15
	lsr	w17, w14, 16
	cnt	v21.8b, v20.8b
#APP
// 13 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	rbit w18, w17
// 0 "" 2
#NO_APP
	lsr	w6, w18, 16
	strh	w6, [x3], 2
	addv	b22, v21.8b
	fmov	w10, s22
	cbz	w17, .L3
	and	w14, w17, w14
	mov	w8, w17
	mov	w13, 0
	.p2align 5,,15
.L4:
#APP
// 62 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	clz w9, w8
// 0 "" 2
#NO_APP
	lsl	w8, w8, w9
	lsl	w14, w14, w9
#APP
// 66 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	extr w13, w13, w14, #31
	bfc w8, #31, #1
// 0 "" 2
#NO_APP
	cbnz	w8, .L4
	fmov	w15, s22
	strh	w13, [x2], 2
	strb	w10, [x12], 1
	sub	w5, w5, w15
	cmp	w5, 0
	bgt	.L6
	sub	x0, x12, x4
	clz	w1, w17
	sub	w5, w0, #1
	mov	w2, 31
	sub	w11, w2, w1
	add	w0, w11, w5, lsl 4
	cmp	x4, x12
	beq	.L1
#APP
// 13 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	rbit w12, w17
// 0 "" 2
#NO_APP
	sub	w4, w1, #16
	lsr	w16, w12, 16
	asr	w17, w16, w4
	strh	w17, [x3, -2]
.L1:
	ret
	.p2align 2,,3
.L3:
	strh	wzr, [x2], 2
	strb	wzr, [x12], 1
	b	.L6
.L10:
	mov	w0, -16
	ret
	.cfi_endproc
.LFE3891:
	.size	dynopt_scan_pos_last_sve2, .-dynopt_scan_pos_last_sve2
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
.LC0:
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	-128
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	-128
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
