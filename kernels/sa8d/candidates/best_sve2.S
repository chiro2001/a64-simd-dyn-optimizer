	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_8x8_sve2
	.type	dynopt_sa8d_8x8_sve2, %function
dynopt_sa8d_8x8_sve2:
.LFB3889:
	.cfi_startproc
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	ptrue	p6.b, all
	add	x5, x4, 32
	ld1h	z1.h, p6/z, [x5]
	ld1h	z29.h, p6/z, [x4]
	add	x5, x4, 64
	add	x4, x4, 96
	ld1h	z27.h, p6/z, [x5]
	lsl	x5, x1, 1
	ld1h	z26.h, p6/z, [x4]
	ptrue	p5.h, vl8
	sub	x4, x5, #8
	ptrue	p7.h, all
	eor	p7.b, p7/z, p7.b, p5.b
	ld1b	z0.h, p7/z, [x0, x4]
	lsl	x4, x3, 1
	add	x5, x5, x1
	sub	x6, x4, #8
	add	x4, x4, x3
	ld1b	z24.h, p7/z, [x2, x6]
	sub	x6, x5, #8
	ld1b	z25.h, p5/z, [x0]
	sel	z25.h, p7, z0.h, z25.h
	ld1b	z0.h, p7/z, [x0, x6]
	sub	x6, x4, #8
	ld1b	z22.h, p7/z, [x2, x6]
	lsl	x6, x5, 1
	add	x8, x0, x1
	ld1b	z23.h, p5/z, [x0, x1]
	sub	x6, x6, #8
	sel	z23.h, p7, z0.h, z23.h
	ld1b	z20.h, p5/z, [x8, x5]
	ld1b	z0.h, p7/z, [x0, x6]
	ld1b	z30.h, p5/z, [x2]
	add	x6, x8, x5
	sel	z30.h, p7, z24.h, z30.h
	lsl	x5, x4, 1
	sub	z30.h, z25.h, z30.h
	add	x7, x2, x3
	sub	x5, x5, #8
	movprfx	z2, z30
	cadd	z2.h, z2.h, z30.h, #90
	ld1b	z30.h, p5/z, [x2, x3]
	tbl	z2.h, {z2.h}, z29.h
	sel	z30.h, p7, z22.h, z30.h
	sub	z30.h, z23.h, z30.h
	ld1b	z19.h, p7/z, [x2, x5]
	movprfx	z3, z2
	cadd	z3.h, z3.h, z2.h, #90
	add	x5, x7, x4
	tbl	z3.h, {z3.h}, z29.h
	movprfx	z2, z30
	cadd	z2.h, z2.h, z30.h, #90
	ld1b	z30.h, p5/z, [x7, x4]
	lsl	x4, x1, 3
	movprfx	z21, z3
	cadd	z21.h, z21.h, z3.h, #90
	tbl	z2.h, {z2.h}, z29.h
	sub	x4, x4, x1
	movprfx	z3, z2
	cadd	z3.h, z3.h, z2.h, #90
	tbl	z3.h, {z3.h}, z29.h
	sub	x4, x4, #8
	movprfx	z18, z3
	cadd	z18.h, z18.h, z3.h, #90
	ld1b	z3.h, p7/z, [x0, x4]
	lsl	x0, x3, 3
	sel	z20.h, p7, z0.h, z20.h
	sub	x0, x0, x3
	sel	z30.h, p7, z19.h, z30.h
	sub	z30.h, z20.h, z30.h
	sub	x0, x0, #8
	movprfx	z17, z30
	cadd	z17.h, z17.h, z30.h, #90
	ld1b	z16.h, p7/z, [x2, x0]
	tbl	z17.h, {z17.h}, z29.h
	ld1b	z0.h, p5/z, [x1, x6]
	movprfx	z2, z17
	cadd	z2.h, z2.h, z17.h, #90
	sel	z0.h, p7, z3.h, z0.h
	tbl	z2.h, {z2.h}, z29.h
	ld1b	z30.h, p5/z, [x3, x5]
	sel	z30.h, p7, z16.h, z30.h
	sub	z30.h, z0.h, z30.h
	movprfx	z7, z2
	cadd	z7.h, z7.h, z2.h, #90
	movprfx	z2, z30
	cadd	z2.h, z2.h, z30.h, #90
	add	z30.h, z21.h, z18.h
	tbl	z2.h, {z2.h}, z29.h
	movprfx	z6, z2
	cadd	z6.h, z6.h, z2.h, #90
	tbl	z6.h, {z6.h}, z29.h
	movprfx	z3, z6
	cadd	z3.h, z3.h, z6.h, #90
	add	z31.h, z7.h, z3.h
	tbl	z2.h, {z30.h - z31.h}, z1.h
	tbl	z4.h, {z30.h - z31.h}, z27.h
	sub	z30.h, z21.h, z18.h
	add	z16.h, z2.h, z4.h
	sub	z31.h, z7.h, z3.h
	abs	z16.h, p6/m, z16.h
	tbl	z1.h, {z30.h - z31.h}, z1.h
	sabd	z4.h, p6/m, z4.h, z2.h
	tbl	z30.h, {z30.h - z31.h}, z27.h
	tbl	z6.h, {z16.h}, z26.h
	add	z5.h, z1.h, z30.h
	tbl	z0.h, {z4.h}, z26.h
	abs	z5.h, p6/m, z5.h
	sabd	z30.h, p6/m, z30.h, z1.h
	tbl	z28.h, {z5.h}, z26.h
	smax	z6.h, p6/m, z6.h, z16.h
	smax	z0.h, p6/m, z0.h, z4.h
	smax	z28.h, p6/m, z28.h, z5.h
	tbl	z26.h, {z30.h}, z26.h
	add	z28.h, z6.h, z28.h
	smax	z26.h, p6/m, z26.h, z30.h
	add	z26.h, z0.h, z26.h
	add	z26.h, z28.h, z26.h
	uunpklo	z26.s, z26.h
	uaddv	d26, p6, z26.s
	fmov	w0, s26
	add	w0, w0, 1
	lsr	w0, w0, 1
	ret
	.cfi_endproc
.LFE3889:
	.size	dynopt_sa8d_8x8_sve2, .-dynopt_sa8d_8x8_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZN12_GLOBAL__N_1L9HAD_IDX16E, %object
	.size	_ZN12_GLOBAL__N_1L9HAD_IDX16E, 32
_ZN12_GLOBAL__N_1L9HAD_IDX16E:
	.hword	0
	.hword	2
	.hword	4
	.hword	6
	.hword	1
	.hword	3
	.hword	5
	.hword	7
	.hword	8
	.hword	10
	.hword	12
	.hword	14
	.hword	9
	.hword	11
	.hword	13
	.hword	15
	.type	_ZN12_GLOBAL__N_1L9TBL_IDX02E, %object
	.size	_ZN12_GLOBAL__N_1L9TBL_IDX02E, 32
_ZN12_GLOBAL__N_1L9TBL_IDX02E:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	16
	.hword	17
	.hword	18
	.hword	19
	.hword	20
	.hword	21
	.hword	22
	.hword	23
	.type	_ZN12_GLOBAL__N_1L9TBL_IDX13E, %object
	.size	_ZN12_GLOBAL__N_1L9TBL_IDX13E, 32
_ZN12_GLOBAL__N_1L9TBL_IDX13E:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	24
	.hword	25
	.hword	26
	.hword	27
	.hword	28
	.hword	29
	.hword	30
	.hword	31
	.type	_ZN12_GLOBAL__N_1L7ROT_IDXE, %object
	.size	_ZN12_GLOBAL__N_1L7ROT_IDXE, 32
_ZN12_GLOBAL__N_1L7ROT_IDXE:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
