	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_pel_filter_luma_strong_sve2
	.type	dynopt_pel_filter_luma_strong_sve2, %function
dynopt_pel_filter_luma_strong_sve2:
.LFB3889:
	.cfi_startproc
	dup	v31.4h, w3
	dup	v30.4h, w4
	uzp1	v30.2d, v31.2d, v30.2d
	neg	v29.8h, v30.8h
	cmp	x1, 1
	beq	.L7
	adrp	x3, .LANCHOR0
	add	x3, x3, :lo12:.LANCHOR0
	sub	x0, x0, #4
	mov	w2, 4
	ldr	q2, [x3, 64]
	ldp	d28, d27, [x3]
	ldp	d26, d25, [x3, 16]
	ldp	d24, d23, [x3, 32]
	ldp	d22, d3, [x3, 48]
.L4:
	subs	w2, w2, #1
	ldr	d19, [x0]
	fmov	d4, d19
	tbl	v0.8b, {v4.16b}, v27.8b
	tbl	v1.8b, {v4.16b}, v28.8b
	tbl	v6.8b, {v4.16b}, v26.8b
	tbl	v5.8b, {v4.16b}, v25.8b
	tbl	v4.8b, {v4.16b}, v24.8b
	uaddl	v4.8h, v5.8b, v4.8b
	umlal	v4.8h, v1.8b, v23.8b
	umlal	v4.8h, v0.8b, v22.8b
	umlal	v4.8h, v6.8b, v3.8b
	urshl	v4.8h, v4.8h, v2.8h
	usubw	v4.8h, v4.8h, v0.8b
	smax	v4.8h, v29.8h, v4.8h
	smin	v4.8h, v30.8h, v4.8h
	xtn	v4.8b, v4.8h
	add	v4.8b, v19.8b, v4.8b
	str	d4, [x0]
	add	x0, x0, x1
	bne	.L4
	ret
	.p2align 2,,3
.L7:
	sub	x1, x0, x2, lsl 2
	ldr	d18, [x0]
	add	x4, x1, x2, lsl 1
	add	x6, x1, x2
	add	x7, x2, x4
	lsl	x8, x2, 1
	add	x3, x7, x2, lsl 1
	ldr	d21, [x1, x2]
	ldr	d20, [x2, x6]
	add	x5, x2, x3
	ldr	d3, [x2, x4]
	movi	v7.4h, 0x2
	ldr	d16, [x8, x7]
	ldr	d31, [x2, x3]
	zip1	v2.2s, v21.2s, v20.2s
	zip1	v17.2s, v3.2s, v18.2s
	zip1	v3.2s, v20.2s, v3.2s
	zip1	v18.2s, v18.2s, v16.2s
	ldr	d22, [x2, x5]
	zip1	v19.2s, v16.2s, v31.2s
	ldr	d23, [x1]
	zip1	v31.2s, v21.2s, v31.2s
	zip1	v16.2s, v20.2s, v16.2s
	uaddl	v3.8h, v3.8b, v17.8b
	zip1	v22.2s, v23.2s, v22.2s
	uaddl	v19.8h, v2.8b, v19.8b
	uaddw	v18.8h, v3.8h, v18.8b
	uaddl	v22.8h, v22.8b, v31.8b
	add	v1.8h, v18.8h, v18.8h
	uaddw	v18.8h, v18.8h, v31.8b
	add	v1.8h, v1.8h, v19.8h
	urshr	v0.8h, v18.8h, 2
	mla	v18.8h, v22.8h, v7.h[0]
	urshr	v1.8h, v1.8h, 3
	usubw	v0.8h, v0.8h, v16.8b
	urshr	v18.8h, v18.8h, 3
	usubw	v1.8h, v1.8h, v17.8b
	smax	v0.8h, v29.8h, v0.8h
	usubw	v18.8h, v18.8h, v31.8b
	smax	v1.8h, v29.8h, v1.8h
	smin	v0.8h, v30.8h, v0.8h
	smax	v18.8h, v29.8h, v18.8h
	smin	v1.8h, v30.8h, v1.8h
	xtn	v0.8b, v0.8h
	smin	v18.8h, v30.8h, v18.8h
	xtn	v1.8b, v1.8h
	add	v0.8b, v0.8b, v16.8b
	xtn	v18.8b, v18.8h
	add	v1.8b, v1.8b, v17.8b
	add	v18.8b, v18.8b, v31.8b
	str	s1, [x2, x4]
	st1	{v1.s}[1], [x0]
	str	s0, [x2, x6]
	st1	{v0.s}[1], [x3]
	str	s18, [x1, x2]
	st1	{v18.s}[1], [x5]
	ret
	.cfi_endproc
.LFE3889:
	.size	dynopt_pel_filter_luma_strong_sve2, .-dynopt_pel_filter_luma_strong_sve2
	.section	.rodata
	.align	4
	.set	.LANCHOR0,. + 0
.LC0:
	.byte	-1
	.byte	0
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	-1
.LC1:
	.byte	-1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	-1
.LC2:
	.byte	-1
	.byte	2
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.byte	-1
.LC3:
	.byte	-1
	.byte	3
	.byte	4
	.byte	5
	.byte	6
	.byte	-1
	.byte	3
	.byte	-1
.LC4:
	.byte	-1
	.byte	4
	.byte	-1
	.byte	1
	.byte	2
	.byte	3
	.byte	4
	.byte	-1
.LC5:
	.byte	0
	.byte	2
	.byte	1
	.byte	2
	.byte	2
	.byte	1
	.byte	1
	.byte	0
.LC6:
	.byte	0
	.byte	3
	.byte	1
	.byte	2
	.byte	2
	.byte	1
	.byte	3
	.byte	0
.LC7:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	2
	.byte	1
	.byte	2
	.byte	0
.LC8:
	.hword	0
	.hword	-3
	.hword	-2
	.hword	-3
	.hword	-3
	.hword	-2
	.hword	-3
	.hword	0
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
