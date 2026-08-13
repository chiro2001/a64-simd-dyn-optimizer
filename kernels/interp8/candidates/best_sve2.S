	.arch armv8.2-a+crc+sve2
	.file	"best_sve2.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_interp8_8x8_sve2
	.type	dynopt_interp8_8x8_sve2, %function
dynopt_interp8_8x8_sve2:
.LFB3886:
	.cfi_startproc
	sub	w4, w4, #1
	cmp	w4, 2
	bhi	.L4
	ubfiz	x5, x4, 6, 32
	add	x6, x5, 32
.L2:
	adrp	x4, .LANCHOR0
	add	x4, x4, :lo12:.LANCHOR0
	ptrue	p7.b, all
	add	x5, x4, x5
	ld1h	z31.h, p7/z, [x5]
	sub	x0, x0, #3
	add	x5, x4, x6
	ld1h	z30.h, p7/z, [x5]
	add	x6, x2, 4
	add	x5, x4, 256
	ld1h	z29.h, p7/z, [x5]
	movi	d26, #0
	add	x5, x4, 288
	add	x4, x4, 320
	ld1h	z28.h, p7/z, [x5]
	ld1h	z27.h, p7/z, [x4]
	mov	w5, 8
	mov	x4, 0
	.p2align 5,,15
.L3:
	ld1b	z25.h, p7/z, [x0]
	tbl	z23.h, {z25.h}, z28.h
	tbl	z24.h, {z25.h}, z29.h
	movprfx	z0, z26
	sdot	z0.d, z24.h, z31.h
	sdot	z0.d, z23.h, z30.h
	uzp1	z0.s, z0.s, z0.s
	rshrnb	z0.h, z0.s, #6
	uzp1	z0.h, z0.h, z0.h
	sqxtun	v0.8b, v0.8h
	tbl	z25.h, {z25.h}, z27.h
	movprfx	z22, z26
	sdot	z22.d, z23.h, z31.h
	sdot	z22.d, z25.h, z30.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #6
	uzp1	z22.h, z22.h, z22.h
	sqxtun	v22.8b, v22.8h
	add	x0, x0, x1
	str	s0, [x2, x4]
	subs	w5, w5, #1
	str	s22, [x6, x4]
	add	x4, x4, x3
	bne	.L3
	ret
	.p2align 2,,3
.L4:
	mov	x6, 96
	mov	x5, 64
	b	.L2
	.cfi_endproc
.LFE3886:
	.size	dynopt_interp8_8x8_sve2, .-dynopt_interp8_8x8_sve2
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL4CTBL, %object
	.size	_ZL4CTBL, 256
_ZL4CTBL:
	.hword	-1
	.hword	4
	.hword	-10
	.hword	58
	.hword	-1
	.hword	4
	.hword	-10
	.hword	58
	.hword	-1
	.hword	4
	.hword	-10
	.hword	58
	.hword	-1
	.hword	4
	.hword	-10
	.hword	58
	.hword	17
	.hword	-5
	.hword	1
	.hword	0
	.hword	17
	.hword	-5
	.hword	1
	.hword	0
	.hword	17
	.hword	-5
	.hword	1
	.hword	0
	.hword	17
	.hword	-5
	.hword	1
	.hword	0
	.hword	-1
	.hword	4
	.hword	-11
	.hword	40
	.hword	-1
	.hword	4
	.hword	-11
	.hword	40
	.hword	-1
	.hword	4
	.hword	-11
	.hword	40
	.hword	-1
	.hword	4
	.hword	-11
	.hword	40
	.hword	40
	.hword	-11
	.hword	4
	.hword	-1
	.hword	40
	.hword	-11
	.hword	4
	.hword	-1
	.hword	40
	.hword	-11
	.hword	4
	.hword	-1
	.hword	40
	.hword	-11
	.hword	4
	.hword	-1
	.hword	0
	.hword	1
	.hword	-5
	.hword	17
	.hword	0
	.hword	1
	.hword	-5
	.hword	17
	.hword	0
	.hword	1
	.hword	-5
	.hword	17
	.hword	0
	.hword	1
	.hword	-5
	.hword	17
	.hword	58
	.hword	-10
	.hword	4
	.hword	-1
	.hword	58
	.hword	-10
	.hword	4
	.hword	-1
	.hword	58
	.hword	-10
	.hword	4
	.hword	-1
	.hword	58
	.hword	-10
	.hword	4
	.hword	-1
	.zero	64
	.type	_ZL6IDX_X0, %object
	.size	_ZL6IDX_X0, 32
_ZL6IDX_X0:
	.hword	0
	.hword	1
	.hword	2
	.hword	3
	.hword	1
	.hword	2
	.hword	3
	.hword	4
	.hword	2
	.hword	3
	.hword	4
	.hword	5
	.hword	3
	.hword	4
	.hword	5
	.hword	6
	.type	_ZL6IDX_X1, %object
	.size	_ZL6IDX_X1, 32
_ZL6IDX_X1:
	.hword	4
	.hword	5
	.hword	6
	.hword	7
	.hword	5
	.hword	6
	.hword	7
	.hword	8
	.hword	6
	.hword	7
	.hword	8
	.hword	9
	.hword	7
	.hword	8
	.hword	9
	.hword	10
	.type	_ZL6IDX_X2, %object
	.size	_ZL6IDX_X2, 32
_ZL6IDX_X2:
	.hword	8
	.hword	9
	.hword	10
	.hword	11
	.hword	9
	.hword	10
	.hword	11
	.hword	12
	.hword	10
	.hword	11
	.hword	12
	.hword	13
	.hword	11
	.hword	12
	.hword	13
	.hword	14
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
