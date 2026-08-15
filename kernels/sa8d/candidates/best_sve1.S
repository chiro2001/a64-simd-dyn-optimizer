	.arch armv8.2-a+crc+sve
	.file	"best_sve1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_sa8d_8x8_sve2
	.type	dynopt_sa8d_8x8_sve2, %function
dynopt_sa8d_8x8_sve2:
.LFB3890:
	.cfi_startproc
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	ptrue	p6.b, all
	add	x5, x4, 32
	ld1h	z30.h, p6/z, [x5]
	ptrue	p5.h, vl8
	sub	x5, x1, #8
	ptrue	p7.h, all
	eor	p7.b, p7/z, p7.b, p5.b
	ld1b	z29.h, p7/z, [x0, x5]
	sub	x5, x3, #8
	ld1h	z31.h, p6/z, [x4]
	ld1b	z27.h, p7/z, [x2, x5]
	add	x5, x4, 64
	add	x4, x4, 96
	ld1h	z5.h, p6/z, [x4]
	add	x4, x1, x1, lsl 1
	lsl	x6, x1, 1
	sub	x4, x4, #8
	ld1b	z20.h, p7/z, [x0, x4]
	add	x8, x0, x1, lsl 1
	add	x4, x3, x3, lsl 1
	ld1b	z28.h, p5/z, [x0]
	ld1b	z16.h, p5/z, [x0, x6]
	sub	x4, x4, #8
	ld1b	z7.h, p7/z, [x2, x4]
	ld1b	z0.h, p5/z, [x2]
	add	x4, x1, x1, lsl 2
	sel	z0.h, p7, z27.h, z0.h
	ld1h	z25.h, p6/z, [x5]
	sub	x4, x4, #8
	ld1b	z4.h, p7/z, [x0, x4]
	lsl	x5, x3, 1
	add	x4, x3, x3, lsl 2
	sel	z28.h, p7, z29.h, z28.h
	sel	z16.h, p7, z20.h, z16.h
	sub	x4, x4, #8
	ld1b	z2.h, p7/z, [x2, x4]
	sub	z0.h, z28.h, z0.h
	lsl	x4, x1, 3
	add	x7, x2, x3, lsl 1
	tbl	z23.h, {z0.h}, z5.h
	sub	x4, x4, x1
	mad	z23.h, p6/m, z25.h, z0.h
	ld1b	z22.h, p5/z, [x8, x6]
	sub	x4, x4, #8
	ld1b	z27.h, p7/z, [x0, x4]
	lsl	x0, x3, 3
	tbl	z23.h, {z23.h}, z31.h
	sel	z22.h, p7, z4.h, z22.h
	tbl	z17.h, {z23.h}, z5.h
	sub	x0, x0, x3
	mad	z17.h, p6/m, z25.h, z23.h
	ld1b	z6.h, p5/z, [x2, x5]
	tbl	z17.h, {z17.h}, z31.h
	sel	z6.h, p7, z7.h, z6.h
	ld1b	z19.h, p5/z, [x7, x5]
	sub	z6.h, z16.h, z6.h
	sel	z19.h, p7, z2.h, z19.h
	tbl	z3.h, {z6.h}, z5.h
	sub	z19.h, z22.h, z19.h
	mad	z3.h, p6/m, z25.h, z6.h
	tbl	z18.h, {z19.h}, z5.h
	tbl	z3.h, {z3.h}, z31.h
	mad	z18.h, p6/m, z25.h, z19.h
	tbl	z1.h, {z3.h}, z5.h
	tbl	z18.h, {z18.h}, z31.h
	mad	z1.h, p6/m, z25.h, z3.h
	tbl	z1.h, {z1.h}, z31.h
	add	x9, x8, x6
	tbl	z21.h, {z17.h}, z5.h
	tbl	z26.h, {z1.h}, z5.h
	mad	z21.h, p6/m, z25.h, z17.h
	mad	z26.h, p6/m, z25.h, z1.h
	tbl	z3.h, {z21.h}, z30.h
	tbl	z1.h, {z26.h}, z30.h
	add	v4.8h, v3.8h, v21.8h
	tbl	z29.h, {z18.h}, z5.h
	add	v20.8h, v1.8h, v26.8h
	mad	z29.h, p6/m, z25.h, z18.h
	add	x8, x7, x5
	tbl	z29.h, {z29.h}, z31.h
	sub	v3.8h, v21.8h, v3.8h
	tbl	z28.h, {z29.h}, z5.h
	sub	v1.8h, v26.8h, v1.8h
	mad	z28.h, p6/m, z25.h, z29.h
	sub	x0, x0, #8
	tbl	z23.h, {z28.h}, z30.h
	ld1b	z17.h, p7/z, [x2, x0]
	add	v2.8h, v23.8h, v28.8h
	ld1b	z0.h, p5/z, [x6, x9]
	sub	v23.8h, v28.8h, v23.8h
	sel	z0.h, p7, z27.h, z0.h
	ld1b	z16.h, p5/z, [x5, x8]
	sel	z16.h, p7, z17.h, z16.h
	sub	z16.h, z0.h, z16.h
	tbl	z7.h, {z16.h}, z5.h
	mad	z7.h, p6/m, z25.h, z16.h
	tbl	z7.h, {z7.h}, z31.h
	tbl	z6.h, {z7.h}, z5.h
	mad	z6.h, p6/m, z25.h, z7.h
	tbl	z6.h, {z6.h}, z31.h
	tbl	z5.h, {z6.h}, z5.h
	mad	z5.h, p6/m, z25.h, z6.h
	tbl	z30.h, {z5.h}, z30.h
	add	v18.8h, v30.8h, v5.8h
	mov	z29.h, #1
	movi	d27, #0
	sub	v30.8h, v5.8h, v30.8h
	add	v24.8h, v20.8h, v4.8h
	add	v22.8h, v1.8h, v3.8h
	add	v0.8h, v18.8h, v2.8h
	add	v19.8h, v30.8h, v23.8h
	abs	v24.8h, v24.8h
	sabd	v20.8h, v4.8h, v20.8h
	abs	v22.8h, v22.8h
	sabd	v1.8h, v3.8h, v1.8h
	sabd	v18.8h, v2.8h, v18.8h
	sabd	v30.8h, v23.8h, v30.8h
	abs	v0.8h, v0.8h
	abs	v19.8h, v19.8h
	umax	v18.8h, v20.8h, v18.8h
	umax	v30.8h, v1.8h, v30.8h
	umax	v0.8h, v24.8h, v0.8h
	umax	v19.8h, v22.8h, v19.8h
	add	v30.8h, v18.8h, v30.8h
	add	v19.8h, v0.8h, v19.8h
	udot	z27.d, z19.h, z29.h
	udot	z27.d, z30.h, z29.h
	addp	d27, v27.2d
	fmov	x0, d27
	add	x0, x0, 1
	ubfx	x0, x0, 1, 32
	ret
	.cfi_endproc
.LFE3890:
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
	.type	_ZL18DYNOPT_CADD_SIGN16, %object
	.size	_ZL18DYNOPT_CADD_SIGN16, 32
_ZL18DYNOPT_CADD_SIGN16:
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.hword	-1
	.hword	1
	.type	_ZL18DYNOPT_CADD_SWAP16, %object
	.size	_ZL18DYNOPT_CADD_SWAP16, 32
_ZL18DYNOPT_CADD_SWAP16:
	.hword	1
	.hword	0
	.hword	3
	.hword	2
	.hword	5
	.hword	4
	.hword	7
	.hword	6
	.hword	9
	.hword	8
	.hword	11
	.hword	10
	.hword	13
	.hword	12
	.hword	15
	.hword	14
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
