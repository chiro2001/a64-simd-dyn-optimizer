	.arch armv8.2-a+dotprod+crc+sve
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_scan_pos_last_sve2
	.type	dynopt_scan_pos_last_sve2, %function
dynopt_scan_pos_last_sve2:
.LFB3892:
	.cfi_startproc
	cmp	w5, 0
	ble	.L6
	ldp	q31, q30, [x6]
	adrp	x6, .LANCHOR0
	sbfiz	x11, x7, 1, 32
	mov	x13, x4
	ldr	q27, [x6, #:lo12:.LANCHOR0]
	uzp1	v0.16b, v31.16b, v30.16b
	.p2align 5,,15
.L5:
#APP
// 30 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	ldrh w7, [x0], #32
// 0 "" 2
#NO_APP
	ubfiz	x10, x7, 1, 16
	add	x12, x1, x10
	add	x9, x12, x11
	add	x8, x12, x11, lsl 1
	ldr	d29, [x1, x10]
	mov	w10, 0
	ldr	d25, [x12, x11]
	ldr	d28, [x9, x11]
	ldr	d26, [x8, x11]
	uzp1	v1.2d, v29.2d, v25.2d
	uzp1	v2.2d, v28.2d, v26.2d
	sqxtn	v3.8b, v1.8h
	sqxtn2	v3.16b, v2.8h
	tbl	v4.16b, {v3.16b}, v0.16b
	cmeq	v5.16b, v4.16b, #0
	cmlt	v6.16b, v4.16b, #0
#APP
// 43 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	addv b7, v5.16b
// 0 "" 2
// 44 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	smov w14, v7.b[0]
// 0 "" 2
#NO_APP
	bic	v16.16b, v27.16b, v5.16b
	add	w15, w14, 16
	and	v17.16b, v6.16b, v27.16b
	and	w16, w15, 255
	addp	v18.16b, v17.16b, v16.16b
	addp	v19.16b, v18.16b, v18.16b
	addp	v20.16b, v19.16b, v19.16b
	fmov	w17, s20
#APP
// 20 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	rbit w18, w17
// 0 "" 2
#NO_APP
	strh	w18, [x3], 2
	lsr	w6, w17, 16
	cbz	w6, .L3
	and	w9, w6, w17
	.p2align 5,,15
.L4:
#APP
// 69 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	clz w12, w6
// 0 "" 2
#NO_APP
	lsl	w6, w6, w12
	lsl	w9, w9, w12
#APP
// 73 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	extr w10, w10, w9, #31
	bfc w6, #31, #1
// 0 "" 2
#NO_APP
	cbnz	w6, .L4
.L3:
	strh	w10, [x2], 2
	sub	w5, w5, w16
	strb	w16, [x13], 1
	cmp	w5, 0
	bgt	.L5
	sub	x0, x13, x4
	sub	w1, w0, #1
	lsl	w0, w1, 4
	cmp	x4, x13
	beq	.L1
#APP
// 20 "kernels/scan-pos-last/candidates/best_sve2.cpp" 1
	rbit w2, w18
// 0 "" 2
#NO_APP
	clz	w4, w2
	sub	w5, w0, w4
	add	w0, w5, 15
	lsr	w11, w18, w4
	strh	w11, [x3, -2]
.L1:
	ret
.L6:
	mov	w0, -16
	ret
	.cfi_endproc
.LFE3892:
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
