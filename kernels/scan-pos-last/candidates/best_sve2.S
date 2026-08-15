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
	mov	x17, x0
	mov	x6, 0
	mov	w11, 0
	mov	w9, 0
	mov	w10, 0
	mov	w13, 0
	.p2align 5,,15
.L5:
	ldrh	w7, [x17, x6, lsl 1]
	ubfiz	x15, x11, 1, 28
	mov	w0, w6
	lsr	w14, w6, 4
	ldrsh	w8, [x1, x7, lsl 1]
	cmp	w8, 0
	cset	w7, ne
	lsr	w12, w8, 31
	add	w16, w7, w9
	sub	w5, w5, w7
	tst	x6, 15
	bne	.L2
	strh	w13, [x2, x15]
	mov	w13, w12
	strh	w10, [x3, x15]
	mov	w10, w7
	strb	w9, [x4, w11, uxtw]
	mov	w9, w7
	cmp	w5, 0
	ble	.L3
	add	x6, x6, 1
.L4:
	mov	w11, w14
	b	.L5
	.p2align 2,,3
.L2:
	lsl	w12, w12, w9
	add	x6, x6, 1
	add	w10, w7, w10, lsl 1
	add	w13, w13, w12
	and	w9, w16, 255
	cmp	w5, 0
	bgt	.L4
.L3:
	ubfiz	x1, x14, 1, 28
	strh	w13, [x2, x1]
	strh	w10, [x3, x1]
	strb	w9, [x4, w14, uxtw]
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
