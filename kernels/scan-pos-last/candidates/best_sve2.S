	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_scan_pos_last_sve2
	.type	dynopt_scan_pos_last_sve2, %function
dynopt_scan_pos_last_sve2:
.LFB0:
	.cfi_startproc
	mov	x16, x0
	mov	x6, 0
	mov	w13, 0
	mov	w8, 0
	mov	w9, 0
	mov	w11, 0
	b	.L4
	.p2align 2,,3
.L8:
	ubfiz	x15, x14, 1, 28
	strh	w11, [x2, x15]
	mov	w11, 0
	strh	w9, [x3, x15]
	mov	w9, 0
	strb	w8, [x4, w14, uxtw]
	mov	w8, 0
.L3:
	lsr	w7, w7, 31
	add	w8, w10, w8
	add	w9, w10, w9
	and	w8, w8, 255
	lsl	w7, w7, w12
	add	x6, x6, 1
	add	w11, w11, w7
	cmp	w5, 0
	ble	.L7
.L4:
	ldrh	w7, [x16, x6, lsl 1]
	mov	w14, w13
	mov	w0, w6
	lsr	w13, w6, 4
	ldrsh	w7, [x1, x7, lsl 1]
	cmp	w7, 0
	cset	w10, ne
	ands	w12, w6, 15
	sub	w5, w5, w10
	beq	.L8
	mov	w12, w8
	lsl	w9, w9, 1
	b	.L3
	.p2align 2,,3
.L7:
	ubfiz	x1, x13, 1, 28
	strh	w11, [x2, x1]
	strh	w9, [x3, x1]
	strb	w8, [x4, w13, uxtw]
	ret
	.cfi_endproc
.LFE0:
	.size	dynopt_scan_pos_last_sve2, .-dynopt_scan_pos_last_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
