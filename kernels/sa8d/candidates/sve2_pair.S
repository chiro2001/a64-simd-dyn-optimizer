	.arch armv8.2-a+crc+sve2
	.file	"sve2_pair.cpp"
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
	ldr	z31, [x4]
	add	x4, x4, 32
	ldr	z30, [x4]
	ptrue	p6.h, vl8
	sub	x4, x1, #8
	ptrue	p7.h, all
	eor	p7.b, p7/z, p7.b, p6.b
	ld1b	z2.h, p7/z, [x0, x4]
	sub	x4, x3, #8
	ld1b	z27.h, p7/z, [x2, x4]
	add	x4, x1, x1, lsl 1
	ld1b	z28.h, p6/z, [x0]
	ld1b	z1.h, p6/z, [x2]
	sub	x4, x4, #8
	ld1b	z29.h, p7/z, [x0, x4]
	sel	z28.h, p7, z2.h, z28.h
	add	x4, x3, x3, lsl 1
	sel	z1.h, p7, z27.h, z1.h
	sub	z1.h, z28.h, z1.h
	sub	x4, x4, #8
	ld1b	z25.h, p7/z, [x2, x4]
	movprfx	z0, z1
	cadd	z0.h, z0.h, z1.h, #90
	add	x4, x1, x1, lsl 2
	tbl	z0.h, {z0.h}, z31.h
	movprfx	z6, z0
	cadd	z6.h, z6.h, z0.h, #90
	sub	x4, x4, #8
	ld1b	z0.h, p7/z, [x0, x4]
	tbl	z6.h, {z6.h}, z31.h
	add	x4, x3, x3, lsl 2
	movprfx	z24, z6
	cadd	z24.h, z24.h, z6.h, #90
	lsl	x6, x1, 1
	sub	x4, x4, #8
	ld1b	z6.h, p7/z, [x2, x4]
	lsl	x5, x3, 1
	lsl	x4, x1, 3
	ld1b	z26.h, p6/z, [x0, x6]
	ld1b	z5.h, p6/z, [x2, x5]
	sel	z26.h, p7, z29.h, z26.h
	sel	z5.h, p7, z25.h, z5.h
	sub	x4, x4, x1
	sub	z5.h, z26.h, z5.h
	movprfx	z4, z5
	cadd	z4.h, z4.h, z5.h, #90
	tbl	z4.h, {z4.h}, z31.h
	movprfx	z2, z4
	cadd	z2.h, z2.h, z4.h, #90
	tbl	z2.h, {z2.h}, z31.h
	add	x8, x0, x1, lsl 1
	movprfx	z21, z2
	cadd	z21.h, z21.h, z2.h, #90
	sub	x4, x4, #8
	ld1b	z2.h, p7/z, [x0, x4]
	lsl	x0, x3, 3
	add	x7, x2, x3, lsl 1
	ld1b	z23.h, p6/z, [x8, x6]
	sub	x0, x0, x3
	sel	z23.h, p7, z0.h, z23.h
	ld1b	z29.h, p6/z, [x7, x5]
	sel	z29.h, p7, z6.h, z29.h
	sub	z29.h, z23.h, z29.h
	movprfx	z5, z29
	cadd	z5.h, z5.h, z29.h, #90
	tbl	z5.h, {z5.h}, z31.h
	movprfx	z4, z5
	cadd	z4.h, z4.h, z5.h, #90
	tbl	z4.h, {z4.h}, z31.h
	tbl	z3.h, {z24.h}, z30.h
	movprfx	z18, z4
	cadd	z18.h, z18.h, z4.h, #90
	tbl	z1.h, {z21.h}, z30.h
	add	v4.8h, v3.8h, v24.8h
	tbl	z22.h, {z18.h}, z30.h
	add	x9, x8, x6
	add	v29.8h, v1.8h, v21.8h
	add	x8, x7, x5
	ld1b	z20.h, p6/z, [x6, x9]
	sub	v3.8h, v24.8h, v3.8h
	sel	z20.h, p7, z2.h, z20.h
	sub	x0, x0, #8
	add	v2.8h, v22.8h, v18.8h
	ld1b	z19.h, p7/z, [x2, x0]
	ld1b	z0.h, p6/z, [x5, x8]
	sub	v1.8h, v21.8h, v1.8h
	sel	z0.h, p7, z19.h, z0.h
	sub	z0.h, z20.h, z0.h
	sub	v22.8h, v18.8h, v22.8h
	movprfx	z17, z0
	cadd	z17.h, z17.h, z0.h, #90
	tbl	z17.h, {z17.h}, z31.h
	movprfx	z6, z17
	cadd	z6.h, z6.h, z17.h, #90
	tbl	z6.h, {z6.h}, z31.h
	movprfx	z5, z6
	cadd	z5.h, z5.h, z6.h, #90
	tbl	z30.h, {z5.h}, z30.h
	add	v16.8h, v30.8h, v5.8h
	mov	z27.h, #1
	sub	v30.8h, v5.8h, v30.8h
	movi	d25, #0
	add	v7.8h, v29.8h, v4.8h
	add	v19.8h, v1.8h, v3.8h
	add	v0.8h, v16.8h, v2.8h
	add	v17.8h, v30.8h, v22.8h
	abs	v7.8h, v7.8h
	sabd	v29.8h, v4.8h, v29.8h
	abs	v19.8h, v19.8h
	sabd	v1.8h, v3.8h, v1.8h
	sabd	v16.8h, v2.8h, v16.8h
	sabd	v30.8h, v22.8h, v30.8h
	abs	v0.8h, v0.8h
	abs	v17.8h, v17.8h
	umax	v16.8h, v29.8h, v16.8h
	umax	v30.8h, v1.8h, v30.8h
	umax	v0.8h, v7.8h, v0.8h
	umax	v17.8h, v19.8h, v17.8h
	add	v30.8h, v30.8h, v16.8h
	add	v17.8h, v17.8h, v0.8h
	udot	z25.d, z17.h, z27.h
	udot	z25.d, z30.h, z27.h
	addp	d25, v25.2d
	fmov	x0, d25
	add	x0, x0, 1
	ubfx	x0, x0, 1, 32
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
	.type	_ZN12_GLOBAL__N_1L10HAD_IDX_HIE, %object
	.size	_ZN12_GLOBAL__N_1L10HAD_IDX_HIE, 32
_ZN12_GLOBAL__N_1L10HAD_IDX_HIE:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.hword	15
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
