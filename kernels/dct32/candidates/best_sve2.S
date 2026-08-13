	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL11pass32_implPKsPsli, %function
_ZL11pass32_implPKsPsli:
.LFB6:
	.cfi_startproc
	addvl	sp, sp, #-5
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0x28,0x1e,0x22
	adrp	x4, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #80
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0x28,0x1e,0x23,0x50,0x22
	add	x4, x4, :lo12:.LANCHOR0
	movi	d28, #0
	add	x5, x4, 64
	add	x6, x0, 32
	ptrue	p6.s, vl4
	add	x12, x1, 64
	mov	w11, -64
	stp	d8, d9, [sp]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	ld1h	z9.h, p7/z, [x5]
	add	x5, x4, 128
	ld1w	z8.s, p7/z, [x4]
	mov	w10, 64
	stp	d10, d11, [sp, 16]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	ld1h	z10.h, p7/z, [x5]
	add	x5, x4, 192
	ld1h	z31.h, p7/z, [x5]
	add	x5, sp, 64
	stp	d12, d13, [sp, 32]
	mov	w7, 36
	mov	w9, 83
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	mov	w8, -83
	str	z31, [x5]
	add	x5, x4, 256
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #1
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x4, 320
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #2
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x4, 384
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #3
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x4, 448
	ld1h	z11.h, p7/z, [x5]
	add	x5, x4, 512
	ld1h	z12.h, p7/z, [x5]
	add	x5, x4, 576
	ld1h	z13.h, p7/z, [x5]
	add	x5, x4, 640
	ld1h	z14.h, p7/z, [x5]
	add	x5, x4, 704
	ld1h	z15.h, p7/z, [x5]
	add	x5, x4, 768
	ld1h	z0.h, p7/z, [x5]
	add	x5, x4, 832
	ld1h	z1.h, p7/z, [x5]
	add	x5, x4, 896
	ld1h	z2.h, p7/z, [x5]
	add	x5, x4, 960
	ld1h	z3.h, p7/z, [x5]
	add	x5, x4, 1024
	ld1h	z4.h, p7/z, [x5]
	add	x5, x4, 1056
	ld1w	z5.s, p7/z, [x5]
	add	x5, x4, 1088
	ld1w	z6.s, p7/z, [x5]
	add	x5, x4, 1120
	ld1w	z7.s, p7/z, [x5]
	add	x5, x4, 1152
	ld1w	z16.s, p7/z, [x5]
	add	x5, x4, 1184
	ld1w	z17.s, p7/z, [x5]
	add	x5, x4, 1216
	ld1w	z18.s, p7/z, [x5]
	add	x5, x4, 1248
	ld1w	z19.s, p7/z, [x5]
	add	x5, x4, 1280
	ld1w	z20.s, p7/z, [x5]
	sub	w5, w3, #1
	ldr	q21, [x4, 1312]
	ldr	q22, [x4, 1328]
	ldr	q23, [x4, 1344]
	ldr	q24, [x4, 1360]
	mov	w4, 1
	lsl	w4, w4, w5
	addvl	x5, sp, #4
	add	x5, x5, 64
	sxtw	x4, w4
	str	q24, [x5]
	.p2align 5,,15
.L2:
	ld1h	z29.h, p7/z, [x0]
	ld1h	z27.h, p7/z, [x6]
	rev	z27.h, z27.h
	sub	z30.h, z29.h, z27.h
	sunpklo	z31.s, z27.h
	sunpkhi	z27.s, z27.h
	sunpklo	z26.s, z29.h
	sunpkhi	z29.s, z29.h
	add	z29.s, z29.s, z27.s
	rev	z27.s, z29.s
	add	z31.s, z26.s, z31.s
	add	z29.s, z31.s, z27.s
	sub	z31.s, z31.s, z27.s
	rev	z26.s, z29.s
	add	z27.s, z29.s, z26.s
	tbl	z25.s, {z27.s}, z8.s
	sub	z29.s, z29.s, z26.s
	add	z26.s, z27.s, z25.s
	sub	z27.s, z27.s, z25.s
	movprfx	z25, z28
	sdot	z25.d, z30.h, z9.h
	uaddv	d25, p7, z25.d
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z10.h
	uaddv	d25, p7, z25.d
	fmov	w15, s26
	add	x1, x1, 2
	add	x0, x0, x2, lsl 1
	add	x6, x6, x2, lsl 1
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 62]
	fmov	x5, d25
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 190]
	add	x5, sp, 64
	ldr	z24, [x5]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uaddv	d25, p7, z25.d
	fmov	x5, d25
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 318]
	addvl	x5, sp, #1
	add	x5, x5, 64
	ldr	z24, [x5]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uaddv	d25, p7, z25.d
	fmov	x5, d25
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 446]
	addvl	x5, sp, #2
	add	x5, x5, 64
	ldr	z24, [x5]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uaddv	d25, p7, z25.d
	fmov	x5, d25
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 574]
	addvl	x5, sp, #3
	add	x5, x5, 64
	ldr	z24, [x5]
	movprfx	z25, z28
	sdot	z25.d, z30.h, z24.h
	uaddv	d25, p7, z25.d
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z11.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 702]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z12.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 830]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z13.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 958]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z14.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1086]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z15.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1214]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z0.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1342]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z1.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1470]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z2.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1598]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z3.h
	uaddv	d25, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1726]
	fmov	x5, d25
	movprfx	z25, z28
	sdot	z25.d, z30.h, z4.h
	uaddv	d30, p7, z25.d
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1854]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z5.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1982]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z6.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 126]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z7.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 382]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z16.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 638]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z17.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 894]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z18.s
	saddv	d30, p7, z30.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1150]
	fmov	x5, d30
	movprfx	z30, z31
	mul	z30.s, p7/m, z30.s, z19.s
	saddv	d30, p7, z30.s
	mul	z31.s, p7/m, z31.s, z20.s
	saddv	d31, p7, z31.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1406]
	fmov	x5, d30
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1662]
	fmov	x5, d31
	movprfx	z31, z29
	mul	z31.s, p7/m, z31.s, z21.s
	saddv	d31, p6, z31.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1918]
	fmov	x5, d31
	movprfx	z31, z29
	mul	z31.s, p7/m, z31.s, z22.s
	saddv	d31, p6, z31.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 254]
	fmov	x5, d31
	movprfx	z31, z29
	mul	z31.s, p7/m, z31.s, z23.s
	saddv	d31, p6, z31.s
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 766]
	fmov	x5, d31
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1278]
	addvl	x5, sp, #4
	add	x5, x5, 64
	ldr	z31, [x5]
	mul	z29.s, p7/m, z29.s, z31.s
	saddv	d31, p6, z29.s
	fmov	x5, d31
	add	x5, x4, x5
	asr	x5, x5, x3
	strh	w5, [x1, 1790]
	fmov	x5, d26
	lsr	x14, x5, 32
	fmov	x5, d27
	lsr	x13, x5, 32
	fmov	x5, d26
	asr	x5, x5, 32
	add	x5, x5, w15, sxtw
	add	x5, x4, x5, lsl 6
	asr	x5, x5, x3
	strh	w5, [x1, -2]
	smull	x5, w14, w11
	fmov	w14, s27
	smaddl	x5, w15, w10, x5
	add	x5, x5, x4
	asr	x5, x5, x3
	strh	w5, [x1, 1022]
	smull	x5, w13, w7
	smaddl	x5, w14, w9, x5
	smull	x13, w13, w8
	add	x5, x5, x4
	asr	x5, x5, x3
	strh	w5, [x1, 510]
	smaddl	x5, w14, w7, x13
	add	x5, x5, x4
	asr	x5, x5, x3
	strh	w5, [x1, 1534]
	cmp	x12, x1
	bne	.L2
	ldp	d8, d9, [sp]
	ldp	d10, d11, [sp, 16]
	ldp	d12, d13, [sp, 32]
	ldp	d14, d15, [sp, 48]
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #5
	.cfi_def_cfa_offset 80
	add	sp, sp, 80
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	_ZL11pass32_implPKsPsli, .-_ZL11pass32_implPKsPsli
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #2064
	.cfi_def_cfa_offset 2064
	mov	x18, x1
	mov	w3, 4
	add	x1, sp, 16
	stp	x29, x30, [sp]
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	mov	x29, sp
	bl	_ZL11pass32_implPKsPsli
	mov	w3, 11
	add	x0, sp, 16
	mov	x1, x18
	mov	x2, 32
	bl	_ZL11pass32_implPKsPsli
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
