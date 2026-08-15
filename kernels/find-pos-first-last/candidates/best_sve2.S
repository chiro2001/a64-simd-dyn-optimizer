	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_find_pos_first_last_sve2
	.type	dynopt_find_pos_first_last_sve2, %function
dynopt_find_pos_first_last_sve2:
.LFB3886:
	.cfi_startproc
	ldp	q30, q29, [x0]
	ldrh	w0, [x2, 4]
	cmtst	v31.8h, v30.8h, v30.8h
	cmtst	v28.8h, v29.8h, v29.8h
	uzp1	v31.16b, v31.16b, v28.16b
	cmp	w0, 2
	beq	.L2
	ldp	q28, q27, [x2]
	uzp1	v28.16b, v28.16b, v27.16b
	tbl	v31.16b, {v31.16b}, v28.16b
.L2:
	shrn	v31.8b, v31.8h, 4
	add	v30.8h, v30.8h, v29.8h
	umov	x1, v31.d[0]
	addv	h31, v30.8h
	umov	w2, v31.h[0]
	rbit	x0, x1
	clz	x0, x0
	clz	x3, x1
	cmp	x1, 0
	asr	w0, w0, 2
	mov	w1, -240
	orr	w2, w0, w2, lsl 31
	mov	w0, 63
	sub	w0, w0, w3
	asr	w0, w0, 2
	orr	w0, w2, w0, lsl 8
	csel	w0, w0, w1, ne
	ret
	.cfi_endproc
.LFE3886:
	.size	dynopt_find_pos_first_last_sve2, .-dynopt_find_pos_first_last_sve2
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
