	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL6pass32PKsPsli, %function
_ZL6pass32PKsPsli:
.LFB6:
	.cfi_startproc
	sub	w4, w3, #1
	mov	w10, 1
	ptrue	p7.b, all
	sub	sp, sp, #4096
	.cfi_def_cfa_offset 4096
	adrp	x12, .LANCHOR0
	lsl	w10, w10, w4
	add	x4, x12, :lo12:.LANCHOR0
	ld1w	z31.s, p7/z, [x4]
	add	x6, x0, 32
	mov	x4, x0
	add	x0, sp, 4096
	add	x7, sp, 3072
	add	x8, sp, 3584
	mov	x14, sp
	sub	x13, x0, x0, lsl 2
	mov	x11, -5120
	add	x9, sp, 3840
	mov	x5, x8
	mov	x0, x7
	sub	x11, x11, x14
	.p2align 5,,15
.L2:
	ld1h	z2.h, p7/z, [x4]
	ld1h	z1.h, p7/z, [x6]
	rev	z1.h, z1.h
	sub	z5.h, z2.h, z1.h
	st1h	z5.h, p7, [x11, x0, lsl 1]
	sunpklo	z4.s, z2.h
	sunpklo	z3.s, z1.h
	sunpkhi	z2.s, z2.h
	add	z3.s, z4.s, z3.s
	sunpkhi	z1.s, z1.h
	add	z1.s, z2.s, z1.s
	rev	z1.s, z1.s
	add	z27.s, z3.s, z1.s
	sub	z1.s, z3.s, z1.s
	st1w	z1.s, p7, [x13, x5, lsl 2]
	rev	z0.s, z27.s
	add	z30.s, z27.s, z0.s
	sub	z0.s, z27.s, z0.s
	str	q0, [x0], 16
	tbl	z29.s, {z30.s}, z31.s
	add	z28.s, z30.s, z29.s
	sub	z29.s, z30.s, z29.s
	add	x4, x4, x2, lsl 1
	str	d28, [x5], 8
	add	x6, x6, x2, lsl 1
	str	d29, [x9], 8
	cmp	x0, x8
	bne	.L2
	add	x11, x12, :lo12:.LANCHOR0
	sxtw	x5, w10
	ptrue	p7.b, all
	add	x11, x11, 64
	add	x9, x1, 64
	movi	d28, #0
	add	x13, x1, 2112
	add	x6, x14, 2048
	.p2align 5,,15
.L4:
	add	x2, x14, 1024
	mov	x4, x9
	ld1h	z29.h, p7/z, [x11]
	.p2align 5,,15
.L3:
	ld1h	z30.h, p7/z, [x2]
	movprfx	z31, z28
	sdot	z31.d, z30.h, z29.h
	uaddv	d31, p7, z31.d
	fmov	x0, d31
	add	x2, x2, 32
	add	x0, x5, x0
	asr	x0, x0, x3
	strh	w0, [x4], 2
	cmp	x2, x6
	bne	.L3
	add	x9, x9, 128
	add	x11, x11, 64
	cmp	x9, x13
	bne	.L4
	add	x13, x12, :lo12:.LANCHOR0
	add	x11, x1, 128
	ptrue	p7.b, all
	add	x13, x13, 1056
	mov	w9, 0
	.p2align 5,,15
.L6:
	mov	x4, x11
	mov	x2, x6
	add	x0, x13, w9, uxtw 3
	ld1w	z30.s, p7/z, [x0]
	.p2align 5,,15
.L5:
	ld1w	z31.s, p7/z, [x2]
	mul	z31.s, p7/m, z31.s, z30.s
	saddv	d31, p7, z31.s
	fmov	x0, d31
	add	x2, x2, 32
	add	x0, x5, x0
	asr	x0, x0, x3
	strh	w0, [x4], 2
	cmp	x2, x7
	bne	.L5
	add	w9, w9, 4
	add	x11, x11, 256
	cmp	w9, 32
	bne	.L6
	add	x11, x12, :lo12:.LANCHOR0
	mov	x9, 128
	ptrue	p7.b, all
	add	x11, x11, 1312
	mov	w6, 0
	ptrue	p6.s, vl4
.L8:
	add	x4, x1, w9, uxtw 1
	mov	x2, x7
	add	x0, x11, w6, uxtw 1
	ld1w	z30.s, p7/z, [x0]
	.p2align 5,,15
.L7:
	ldr	q31, [x2], 16
	mul	z31.s, p7/m, z31.s, z30.s
	saddv	d31, p6, z31.s
	fmov	x0, d31
	add	x0, x5, x0
	asr	x0, x0, x3
	strh	w0, [x4], 2
	cmp	x2, x8
	bne	.L7
	add	w6, w6, 8
	add	x9, x9, 256
	cmp	w6, 32
	bne	.L8
	add	x7, x1, 1024
	add	x5, x1, 512
	mov	z22.s, w10
	add	x4, x1, 1536
	mov	x0, 0
	whilelo	p6.s, wzr, w6
	mov	z21.s, w3
	ptrue	p7.b, all
	mov	z20.s, #83
	mov	z19.s, #36
	mov	z18.s, #-83
	.p2align 5,,15
.L9:
	ld2w	{z25.s - z26.s}, p6/z, [x2]
	add	x3, x2, 256
	add	z17.s, z26.s, z25.s
	ld2w	{z23.s - z24.s}, p6/z, [x3]
	lsl	z17.s, z17.s, #6
	movprfx	z6, z22
	mla	z6.s, p7/m, z20.s, z23.s
	add	z17.s, z22.s, z17.s
	lsl	z25.s, z25.s, #6
	asr	z17.s, p7/m, z17.s, z21.s
	add	z25.s, z22.s, z25.s
	lsl	z26.s, z26.s, #6
	mla	z6.s, p7/m, z19.s, z24.s
	sub	z26.s, z25.s, z26.s
	asr	z6.s, p7/m, z6.s, z21.s
	asr	z26.s, p7/m, z26.s, z21.s
	mad	z23.s, p7/m, z19.s, z22.s
	mla	z23.s, p7/m, z18.s, z24.s
	asr	z23.s, p7/m, z23.s, z21.s
	st1h	z17.s, p6, [x1, x0, lsl 1]
	st1h	z26.s, p6, [x7, x0, lsl 1]
	st1h	z6.s, p6, [x5, x0, lsl 1]
	st1h	z23.s, p6, [x4, x0, lsl 1]
	incb	x2, all, mul #2
	incw	x0
	whilelo	p6.s, w0, w6
	b.any	.L9
	add	sp, sp, 4096
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL6pass32PKsPsli, .-_ZL6pass32PKsPsli
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #2064
	.cfi_def_cfa_offset 2064
	mov	x15, x1
	mov	w3, 4
	add	x1, sp, 16
	stp	x29, x30, [sp]
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	mov	x29, sp
	bl	_ZL6pass32PKsPsli
	mov	x1, x15
	add	x0, sp, 16
	mov	w3, 11
	mov	x2, 32
	bl	_ZL6pass32PKsPsli
	ldp	x29, x30, [sp]
	add	sp, sp, 2064
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	dynopt_dct32_sve2_shared, .-dynopt_dct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL9IDX_REV4S, %object
	.size	_ZL9IDX_REV4S, 32
_ZL9IDX_REV4S:
	.word	3
	.word	2
	.word	1
	.word	0
	.word	7
	.word	6
	.word	5
	.word	4
	.type	_ZL3C32, %object
	.size	_ZL3C32, 1024
_ZL3C32:
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	64
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	-9
	.hword	-25
	.hword	-43
	.hword	-57
	.hword	-70
	.hword	-80
	.hword	-87
	.hword	-90
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	-18
	.hword	-50
	.hword	-75
	.hword	-89
	.hword	-89
	.hword	-75
	.hword	-50
	.hword	-18
	.hword	18
	.hword	50
	.hword	75
	.hword	89
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	25
	.hword	70
	.hword	90
	.hword	80
	.hword	43
	.hword	-9
	.hword	-57
	.hword	-87
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	83
	.hword	36
	.hword	-36
	.hword	-83
	.hword	-83
	.hword	-36
	.hword	36
	.hword	83
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-43
	.hword	-90
	.hword	-57
	.hword	25
	.hword	87
	.hword	70
	.hword	-9
	.hword	-80
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	50
	.hword	89
	.hword	18
	.hword	-75
	.hword	-75
	.hword	18
	.hword	89
	.hword	50
	.hword	-50
	.hword	-89
	.hword	-18
	.hword	75
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	57
	.hword	80
	.hword	-25
	.hword	-90
	.hword	-9
	.hword	87
	.hword	43
	.hword	-70
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	64
	.hword	-64
	.hword	-64
	.hword	64
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-70
	.hword	-43
	.hword	87
	.hword	9
	.hword	-90
	.hword	25
	.hword	80
	.hword	-57
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	-75
	.hword	-18
	.hword	89
	.hword	-50
	.hword	-50
	.hword	89
	.hword	-18
	.hword	-75
	.hword	75
	.hword	18
	.hword	-89
	.hword	50
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	80
	.hword	-9
	.hword	-70
	.hword	87
	.hword	-25
	.hword	-57
	.hword	90
	.hword	-43
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	36
	.hword	-83
	.hword	83
	.hword	-36
	.hword	-36
	.hword	83
	.hword	-83
	.hword	36
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	-87
	.hword	57
	.hword	-9
	.hword	-43
	.hword	80
	.hword	-90
	.hword	70
	.hword	-25
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	89
	.hword	-75
	.hword	50
	.hword	-18
	.hword	-18
	.hword	50
	.hword	-75
	.hword	89
	.hword	-89
	.hword	75
	.hword	-50
	.hword	18
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	90
	.hword	-87
	.hword	80
	.hword	-70
	.hword	57
	.hword	-43
	.hword	25
	.hword	-9
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.type	_ZL2K2, %object
	.size	_ZL2K2, 256
_ZL2K2:
	.word	90
	.word	87
	.word	80
	.word	70
	.word	57
	.word	43
	.word	25
	.word	9
	.word	87
	.word	57
	.word	9
	.word	-43
	.word	-80
	.word	-90
	.word	-70
	.word	-25
	.word	80
	.word	9
	.word	-70
	.word	-87
	.word	-25
	.word	57
	.word	90
	.word	43
	.word	70
	.word	-43
	.word	-87
	.word	9
	.word	90
	.word	25
	.word	-80
	.word	-57
	.word	57
	.word	-80
	.word	-25
	.word	90
	.word	-9
	.word	-87
	.word	43
	.word	70
	.word	43
	.word	-90
	.word	57
	.word	25
	.word	-87
	.word	70
	.word	9
	.word	-80
	.word	25
	.word	-70
	.word	90
	.word	-80
	.word	43
	.word	9
	.word	-57
	.word	87
	.word	9
	.word	-25
	.word	43
	.word	-57
	.word	70
	.word	-80
	.word	87
	.word	-90
	.type	_ZL2K4, %object
	.size	_ZL2K4, 64
_ZL2K4:
	.word	89
	.word	75
	.word	50
	.word	18
	.word	75
	.word	-18
	.word	-89
	.word	-50
	.word	50
	.word	-89
	.word	18
	.word	75
	.word	18
	.word	-50
	.word	75
	.word	-89
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
