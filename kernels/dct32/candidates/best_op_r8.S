	.arch armv8.2-a+crc+sve2
	.file	"best_op_r8.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB5:
	.cfi_startproc
	addvl	sp, sp, #-28
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x22
	add	x7, x0, x2, lsl 1
	ptrue	p7.b, all
	sub	sp, sp, #320
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x23,0xc0,0x2,0x22
	add	x0, x0, 32
	add	x6, x0, x2, lsl 1
	adrp	x3, .LANCHOR0
	add	x0, x1, 64
	add	x3, x3, :lo12:.LANCHOR0
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x4, x3, 32
	add	x30, x2, x2, lsl 2
	ld1w	z7.s, p7/z, [x3]
	str	x0, [sp, 176]
	add	x0, x3, 64
	ld1h	z16.h, p7/z, [x4]
	str	x0, [sp, 184]
	add	x0, x3, 96
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #21
	stp	x19, x20, [sp, 16]
	add	x0, x0, 192
	stp	x21, x22, [sp, 32]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	add	x22, x2, x2, lsl 1
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x48,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4d,0x3,0x8f,0x88,0x1
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	str	z31, [x0]
	add	x0, x3, 128
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 192
	str	z31, [x0]
	add	x0, x3, 160
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 192
	str	z31, [x0]
	add	x0, x3, 192
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 192
	str	z31, [x0]
	add	x0, x3, 224
	ld1h	z2.h, p7/z, [x0]
	mov	z15.d, z2.d
	add	x0, x3, 256
	ld1h	z3.h, p7/z, [x0]
	mov	z14.d, z3.d
	add	x0, x3, 288
	ld1h	z4.h, p7/z, [x0]
	mov	z13.d, z4.d
	add	x0, x3, 320
	ld1h	z5.h, p7/z, [x0]
	mov	z12.d, z5.d
	add	x0, x3, 352
	ld1h	z6.h, p7/z, [x0]
	add	x0, x3, 384
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 192
	str	z31, [x0]
	add	x0, x3, 416
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #26
	add	x0, x0, 192
	str	z31, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 192
	str	z6, [x0]
.L2:
	sub	x0, x7, x2, lsl 1
	ld1h	z31.h, p7/z, [x0]
	sunpklo	z30.s, z31.h
	sub	x0, x6, x2, lsl 1
	ld1h	z28.h, p7/z, [x0]
	rev	z28.h, z28.h
	sunpklo	z27.s, z28.h
	sub	z29.h, z31.h, z28.h
	sunpkhi	z26.s, z28.h
	add	x0, sp, 192
	add	z30.s, z30.s, z27.s
	sunpkhi	z27.s, z31.h
	add	z31.h, z31.h, z28.h
	rev	z28.h, z31.h
	sub	z18.h, z31.h, z28.h
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z16.h
	sub	z31.h, z31.h, z28.h
	str	z31, [x0]
	addvl	x0, sp, #1
	add	z27.s, z27.s, z26.s
	add	x0, x0, 192
	rev	z27.s, z27.s
	add	z30.s, z30.s, z27.s
	rev	z31.s, z30.s
	add	z31.s, z30.s, z31.s
	tbl	z30.s, {z31.s}, z7.s
	add	z22.s, z31.s, z30.s
	str	z22, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 192
	sub	z21.s, z31.s, z30.s
	ld1h	z27.h, p7/z, [x6]
	rev	z27.h, z27.h
	sunpklo	z26.s, z27.h
	str	z21, [x0]
	addvl	x0, sp, #3
	ld1h	z31.h, p7/z, [x7]
	sunpkhi	z25.s, z27.h
	sub	z30.h, z31.h, z27.h
	add	x0, x0, 192
	sunpklo	z28.s, z31.h
	add	z28.s, z28.s, z26.s
	sunpkhi	z26.s, z31.h
	add	z31.h, z31.h, z27.h
	rev	z27.h, z31.h
	sub	z19.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	tbl	z27.h, {z31.h}, z16.h
	sub	z27.h, z31.h, z27.h
	str	z27, [x0]
	addvl	x0, sp, #4
	add	z26.s, z26.s, z25.s
	rev	z26.s, z26.s
	add	x0, x0, 192
	add	z28.s, z28.s, z26.s
	rev	z31.s, z28.s
	add	z31.s, z28.s, z31.s
	tbl	z28.s, {z31.s}, z7.s
	add	z20.s, z31.s, z28.s
	str	z20, [x0]
	addvl	x0, sp, #5
	sub	z31.s, z31.s, z28.s
	add	x0, x0, 192
	ld1h	z26.h, p7/z, [x6, x2, lsl 1]
	rev	z26.h, z26.h
	sunpklo	z25.s, z26.h
	str	z31, [x0]
	addvl	x0, sp, #6
	ld1h	z31.h, p7/z, [x7, x2, lsl 1]
	sunpkhi	z24.s, z26.h
	sub	z28.h, z31.h, z26.h
	add	x0, x0, 192
	sunpklo	z27.s, z31.h
	add	z27.s, z27.s, z25.s
	sunpkhi	z25.s, z31.h
	add	z31.h, z31.h, z26.h
	rev	z26.h, z31.h
	sub	z10.h, z31.h, z26.h
	add	z31.h, z31.h, z26.h
	tbl	z26.h, {z31.h}, z16.h
	sub	z26.h, z31.h, z26.h
	str	z26, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 192
	add	z25.s, z25.s, z24.s
	rev	z25.s, z25.s
	add	z27.s, z27.s, z25.s
	rev	z31.s, z27.s
	add	z31.s, z27.s, z31.s
	tbl	z27.s, {z31.s}, z7.s
	add	z26.s, z31.s, z27.s
	str	z26, [x0]
	addvl	x0, sp, #8
	sub	z11.s, z31.s, z27.s
	addvl	x4, sp, #28
	add	x0, x0, 192
	str	z11, [x0]
	add	x4, x4, 192
	add	x0, x7, x2, lsl 2
	ld1h	z26.h, p7/z, [x0]
	sunpklo	z24.s, z26.h
	add	x0, x6, x2, lsl 2
	ld1h	z25.h, p7/z, [x0]
	rev	z25.h, z25.h
	addvl	x0, sp, #9
	sunpklo	z27.s, z25.h
	sub	z31.h, z26.h, z25.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z23.s, z25.h
	add	x0, x0, 192
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z11.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z24.s, z27.s
	tbl	z25.h, {z26.h}, z16.h
	sub	z25.h, z26.h, z25.h
	str	z25, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 192
	rev	z24.s, z27.s
	add	z24.s, z27.s, z24.s
	tbl	z27.s, {z24.s}, z7.s
	add	z25.s, z24.s, z27.s
	sub	z24.s, z24.s, z27.s
	str	z25, [x0]
	ld1h	z25.h, p7/z, [x6, x22, lsl 1]
	addvl	x0, sp, #11
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	ld1h	z26.h, p7/z, [x7, x22, lsl 1]
	sunpkhi	z22.s, z25.h
	sub	z4.h, z26.h, z25.h
	add	x0, x0, 192
	sunpklo	z23.s, z26.h
	add	z23.s, z23.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z22.s
	sub	z5.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z23.s, z27.s
	tbl	z25.h, {z26.h}, z16.h
	sub	z23.h, z26.h, z25.h
	str	z23, [x0]
	addvl	x0, sp, #12
	rev	z23.s, z27.s
	add	x0, x0, 192
	add	z23.s, z27.s, z23.s
	tbl	z27.s, {z23.s}, z7.s
	add	z9.s, z23.s, z27.s
	str	z9, [x0]
	add	x0, x7, x2, lsl 3
	ld1h	z26.h, p7/z, [x0]
	add	x0, x6, x2, lsl 3
	sub	z23.s, z23.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	addvl	x0, sp, #13
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	sub	z3.h, z26.h, z25.h
	sunpkhi	z21.s, z25.h
	add	x0, x0, 192
	sunpklo	z22.s, z26.h
	add	z22.s, z22.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	sub	z8.h, z26.h, z25.h
	add	z26.h, z26.h, z25.h
	tbl	z25.h, {z26.h}, z16.h
	sub	z17.h, z26.h, z25.h
	str	z17, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 192
	add	z27.s, z27.s, z21.s
	rev	z27.s, z27.s
	add	z27.s, z22.s, z27.s
	rev	z26.s, z27.s
	add	z27.s, z27.s, z26.s
	tbl	z26.s, {z27.s}, z7.s
	add	z17.s, z27.s, z26.s
	str	z17, [x0]
	addvl	x0, sp, #15
	sub	z6.s, z27.s, z26.s
	ld1h	z22.h, p7/z, [x6, x30, lsl 1]
	add	x0, x0, 192
	rev	z22.h, z22.h
	sunpklo	z27.s, z22.h
	str	z6, [x0]
	addvl	x0, sp, #16
	ld1h	z25.h, p7/z, [x7, x30, lsl 1]
	sunpkhi	z20.s, z22.h
	sub	z26.h, z25.h, z22.h
	add	x0, x0, 192
	sunpklo	z21.s, z25.h
	add	z21.s, z21.s, z27.s
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z22.h
	rev	z22.h, z25.h
	sub	z6.h, z25.h, z22.h
	add	z25.h, z25.h, z22.h
	tbl	z22.h, {z25.h}, z16.h
	sub	z2.h, z25.h, z22.h
	str	z2, [x0]
	addvl	x0, sp, #17
	add	z27.s, z27.s, z20.s
	add	x0, x0, 192
	rev	z27.s, z27.s
	add	z27.s, z21.s, z27.s
	rev	z25.s, z27.s
	add	z27.s, z27.s, z25.s
	addvl	x5, sp, #28
	tbl	z25.s, {z27.s}, z7.s
	add	z2.s, z27.s, z25.s
	str	z2, [x0]
	addvl	x0, sp, #18
	sub	z27.s, z27.s, z25.s
	add	x5, x5, 208
	add	x0, x0, 192
	str	z27, [x0]
	add	x1, x1, 16
	add	x0, x7, x22, lsl 2
	ld1h	z25.h, p7/z, [x0]
	sunpklo	z21.s, z25.h
	add	x0, x6, x22, lsl 2
	ld1h	z22.h, p7/z, [x0]
	rev	z22.h, z22.h
	addvl	x0, sp, #19
	sunpklo	z27.s, z22.h
	sub	z20.h, z25.h, z22.h
	add	z21.s, z21.s, z27.s
	sunpkhi	z17.s, z22.h
	add	x0, x0, 192
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z22.h
	rev	z22.h, z25.h
	sub	z9.h, z25.h, z22.h
	add	z25.h, z25.h, z22.h
	tbl	z22.h, {z25.h}, z16.h
	sub	z1.h, z25.h, z22.h
	str	z1, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 192
	add	z27.s, z27.s, z17.s
	rev	z27.s, z27.s
	add	z27.s, z21.s, z27.s
	rev	z25.s, z27.s
	trn2	z22.d, z28.d, z26.d
	add	z27.s, z27.s, z25.s
	zip1	z21.d, z28.d, z26.d
	tbl	z25.s, {z27.s}, z7.s
	trn1	z28.d, z28.d, z26.d
	sub	z1.s, z27.s, z25.s
	str	z1, [x0]
	ldr	x0, [sp, 184]
	add	z17.s, z27.s, z25.s
	zip1	z26.d, z30.d, z3.d
	trn2	z27.d, z29.d, z4.d
	zip1	z25.d, z29.d, z4.d
	trn1	z29.d, z29.d, z4.d
	zip2	z29.d, z29.d, z28.d
	trn2	z28.d, z30.d, z3.d
	trn1	z30.d, z30.d, z3.d
	ld1h	z3.h, p7/z, [x0]
	addvl	x0, sp, #21
	zip1	z25.d, z25.d, z21.d
	add	x0, x0, 192
	ldr	z0, [x0]
	zip1	z21.d, z27.d, z22.d
	addvl	x0, sp, #22
	zip2	z27.d, z27.d, z22.d
	trn2	z4.d, z31.d, z20.d
	add	x0, x0, 192
	ldr	z2, [x0]
	zip1	z22.d, z31.d, z20.d
	addvl	x0, sp, #23
	trn1	z31.d, z31.d, z20.d
	zip1	z26.d, z26.d, z22.d
	add	x0, x0, 192
	ldr	z1, [x0]
	zip1	z22.d, z28.d, z4.d
	addvl	x0, sp, #24
	zip2	z30.d, z30.d, z31.d
	zip2	z28.d, z28.d, z4.d
	add	x0, x0, 192
	movi	d31, #0
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	ldr	z0, [x0]
	addvl	x0, sp, #27
	sdot	z20.d, z25.h, z3.h
	sdot	z4.d, z26.h, z3.h
	sdot	z20.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z27.h, z1.h
	sdot	z4.d, z28.h, z1.h
	add	x0, x0, 192
	uzp1	z20.s, z20.s, z20.s
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z20.h, z20.s, #4
	rshrnb	z4.h, z4.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z15.h
	sdot	z4.d, z26.h, z0.h
	str	q20, [x1, 48]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z15.h
	sdot	z20.d, z25.h, z0.h
	ldr	z0, [x0]
	addvl	x0, sp, #25
	sdot	z4.d, z30.h, z14.h
	sdot	z20.d, z29.h, z14.h
	add	x0, x0, 192
	ldr	z2, [x0]
	sdot	z4.d, z28.h, z13.h
	addvl	x0, sp, #26
	sdot	z20.d, z27.h, z13.h
	uzp1	z4.s, z4.s, z4.s
	add	x0, x0, 192
	ldr	z1, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 448
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z12.h
	sdot	z4.d, z30.h, z2.h
	sdot	z4.d, z28.h, z1.h
	str	q20, [x1, 176]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z12.h
	sdot	z20.d, z29.h, z2.h
	sdot	z20.d, z27.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 480
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 512
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 544
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 576
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 304]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 608
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 640
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 672
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 704
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 432]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 736
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x3, 768
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 800
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 832
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 560]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 864
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z4.h, z4.s, #4
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	str	q20, [x1, 688]
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 896
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 928
	ld1h	z3.h, p7/z, [x0]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	add	x0, x3, 960
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z20.d, z25.h, z1.h
	sdot	z4.d, z26.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 992
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 1024
	sdot	z20.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1056
	sdot	z20.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z20.s, z20.s, z20.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z20.h, z20.s, #4
	add	x0, x3, 1088
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 816]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1120
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x3, 1152
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1184
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 1216
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 944]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1248
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 1280
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1312
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 1344
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 1072]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1376
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 1408
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1440
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 1472
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 1200]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1504
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x3, 1536
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1568
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 1600
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 1328]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1632
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 1664
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1696
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z4.h, z4.s, #4
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	str	q20, [x1, 1456]
	ld1h	z3.h, p7/z, [x0]
	add	x0, x3, 1728
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1760
	ld1h	z0.h, p7/z, [x0]
	add	x0, x3, 1792
	sdot	z4.d, z30.h, z2.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1824
	sdot	z20.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z20.s, z20.s, z20.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z20.h, z20.s, #4
	add	x0, x3, 1856
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q20, [x1, 1584]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x3, 1888
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x3, 1920
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 1952
	sdot	z4.d, z28.h, z3.h
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 1984
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z22.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z4.d, z30.h, z2.h
	str	q20, [x1, 1712]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z0.h
	sdot	z20.d, z25.h, z1.h
	sdot	z20.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x3, 2016
	ld1h	z1.h, p7/z, [x0]
	sdot	z4.d, z28.h, z3.h
	add	x0, x3, 2048
	sdot	z20.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x3, 2080
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z4.h
	ld1h	z4.h, p7/z, [x0]
	add	x0, x3, 2112
	str	q20, [x1, 1840]
	movprfx	z20, z31
	sdot	z20.d, z21.h, z1.h
	sdot	z20.d, z25.h, z2.h
	sdot	z20.d, z29.h, z3.h
	movprfx	z29, z31
	sdot	z29.d, z22.h, z1.h
	sdot	z29.d, z26.h, z2.h
	ld1h	z26.h, p7/z, [x0]
	sdot	z29.d, z30.h, z3.h
	add	x0, x3, 2144
	sdot	z29.d, z28.h, z4.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #4
	ld1h	z25.h, p7/z, [x0]
	zip1	z28.d, z11.d, z9.d
	sdot	z20.d, z27.h, z4.h
	add	x0, x3, 2176
	uzp1	z20.s, z20.s, z20.s
	rshrnb	z20.h, z20.s, #4
	trn1	z20.h, z20.h, z29.h
	zip1	z29.d, z10.d, z6.d
	zip1	z30.d, z18.d, z5.d
	trn2	z10.d, z10.d, z6.d
	zip1	z30.d, z30.d, z29.d
	trn2	z11.d, z11.d, z9.d
	zip1	z29.d, z19.d, z8.d
	trn2	z18.d, z18.d, z5.d
	zip1	z29.d, z29.d, z28.d
	zip1	z18.d, z18.d, z10.d
	trn2	z19.d, z19.d, z8.d
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	zip1	z19.d, z19.d, z11.d
	sdot	z28.d, z30.h, z26.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2208
	uzp1	z28.s, z28.s, z28.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z28.h, z28.s, #4
	add	x0, x3, 2240
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 112]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2272
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x3, 2304
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 368]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2336
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x3, 2368
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 624]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2400
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x3, 2432
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x1, 880]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	str	q28, [x1, 1136]
	add	x7, x7, x2, lsl 4
	add	x6, x6, x2, lsl 4
	str	q20, [x1, 1968]
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2464
	ld1h	z25.h, p7/z, [x0]
	add	x0, x3, 2496
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z28.d, z30.h, z26.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z27.s, z27.s, z27.s
	add	x0, x3, 2528
	rshrnb	z27.h, z27.s, #4
	ld1h	z25.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x3, 2560
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z19.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x1, 1392]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	add	x0, x3, 2592
	ld1h	z26.h, p7/z, [x0]
	add	x0, sp, 192
	str	q28, [x1, 1648]
	movprfx	z28, z31
	sdot	z28.d, z18.h, z26.h
	sdot	z28.d, z30.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z19.h, z26.h
	sdot	z30.d, z29.h, z27.h
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #4
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z30.h
	ldr	z30, [x0]
	addvl	x0, sp, #11
	add	x0, x0, 192
	ldr	z29, [x0]
	zip1	z30.d, z30.d, z29.d
	addvl	x0, sp, #6
	add	x0, x0, 192
	ldr	z29, [x0]
	str	q28, [x1, 1904]
	addvl	x0, sp, #16
	add	x0, x0, 192
	ldr	z28, [x0]
	zip1	z29.d, z29.d, z28.d
	addvl	x0, sp, #3
	zip1	z29.d, z30.d, z29.d
	add	x0, x0, 192
	ldr	z30, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 192
	ldr	z28, [x0]
	zip1	z30.d, z30.d, z28.d
	addvl	x0, sp, #9
	add	x0, x0, 192
	ldr	z28, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 192
	ldr	z0, [x0]
	zip1	z28.d, z28.d, z0.d
	add	x0, x3, 2624
	zip1	z30.d, z30.d, z28.d
	ld1h	z26.h, p7/z, [x0]
	add	x0, x3, 2656
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x3, 2688
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x1, 240]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x3, 2720
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x1, 752]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 192
	ldr	z22, [x0]
	str	q28, [x1, 1264]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z27.h
	sdot	z31.d, z30.h, z27.h
	uzp1	z28.s, z28.s, z28.s
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z28.h, z28.s, #4
	rshrnb	z31.h, z31.s, #4
	trn1	z28.h, z28.h, z31.h
	str	q28, [x1, 1776]
	fmov	x0, d22
	str	d22, [x4]
	addvl	x4, sp, #2
	add	x4, x4, 192
	ldr	z21, [x4]
	fmov	x4, d21
	lsr	x0, x0, 32
	lsr	x16, x4, 32
	addvl	x4, sp, #28
	add	x4, x4, 200
	str	d21, [x4]
	addvl	x4, sp, #4
	add	x4, x4, 192
	ldr	z20, [x4]
	str	d20, [x5]
	addvl	x5, sp, #5
	fmov	x4, d20
	add	x5, x5, 192
	ldr	z19, [x5]
	fmov	x8, d20
	fmov	x5, d19
	lsr	x4, x4, 32
	add	x8, x4, x8
	lsr	x15, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 216
	str	d19, [x5]
	addvl	x5, sp, #7
	add	x5, x5, 192
	ldr	z18, [x5]
	fmov	x24, d18
	fmov	x5, d18
	lsr	x23, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 224
	add	x28, x23, x24
	str	d18, [x5]
	addvl	x5, sp, #8
	add	x5, x5, 192
	ldr	z11, [x5]
	sbfiz	x28, x28, 2, 58
	fmov	x5, d11
	lsr	x14, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 232
	str	d11, [x5]
	addvl	x5, sp, #10
	add	x5, x5, 192
	ldr	z10, [x5]
	fmov	x24, d10
	fmov	x5, d10
	lsr	x21, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 240
	add	x24, x21, x24
	str	d10, [x5]
	fmov	x5, d24
	sbfiz	x24, x24, 2, 58
	lsr	x13, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 248
	str	d24, [x5]
	addvl	x5, sp, #12
	add	x5, x5, 192
	ldr	z9, [x5]
	fmov	x25, d9
	fmov	x5, d9
	lsr	x20, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 256
	add	x27, x20, x25
	str	d9, [x5]
	fmov	x5, d23
	sbfiz	x27, x27, 2, 58
	lsr	x12, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 264
	str	d23, [x5]
	addvl	x5, sp, #14
	add	x5, x5, 192
	ldr	z8, [x5]
	fmov	x25, d8
	fmov	x5, d8
	lsr	x19, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 272
	add	x25, x19, x25
	str	d8, [x5]
	addvl	x5, sp, #15
	add	x5, x5, 192
	ldr	z6, [x5]
	sbfiz	x25, x25, 2, 58
	fmov	x5, d6
	lsr	x11, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 280
	str	d6, [x5]
	addvl	x5, sp, #17
	add	x5, x5, 192
	ldr	z5, [x5]
	fmov	x26, d5
	fmov	x5, d5
	lsr	x18, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 288
	add	x26, x18, x26
	str	d5, [x5]
	addvl	x5, sp, #18
	add	x5, x5, 192
	ldr	z4, [x5]
	sbfiz	x26, x26, 2, 58
	fmov	x5, d4
	lsr	x10, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 296
	str	d4, [x5]
	fmov	x5, d17
	lsr	x17, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 304
	str	d17, [x5]
	addvl	x5, sp, #20
	add	x5, x5, 192
	ldr	z3, [x5]
	fmov	x5, d3
	lsr	x9, x5, 32
	addvl	x5, sp, #28
	add	x5, x5, 312
	str	d3, [x5]
	fmov	x5, d22
	str	x24, [sp, 168]
	fmov	x24, d17
	add	x5, x0, x5
	add	x24, x17, x24
	ubfiz	x5, x5, 2, 58
	fmov	d31, x5
	ubfiz	x5, x8, 2, 58
	fmov	d30, x5
	add	x5, sp, 168
	ins	v31.h[1], w28
	sbfiz	x24, x24, 2, 58
	mov	w8, 83
	ld1	{v30.h}[1], [x5]
	mov	w5, 36
	ins	v31.h[2], w27
	fmov	w27, s11
	ins	v30.h[2], w25
	smull	x25, w16, w5
	ins	v31.h[3], w26
	fmov	w26, s19
	ins	v30.h[3], w24
	fmov	w24, s21
	zip1	v31.8h, v31.8h, v30.8h
	smaddl	x25, w24, w8, x25
	smull	x24, w15, w5
	smaddl	x24, w26, w8, x24
	add	x25, x25, 8
	smull	x26, w14, w5
	smaddl	x26, w27, w8, x26
	fmov	w27, s24
	str	q31, [x1, -16]
	add	x24, x24, 8
	add	x26, x26, 8
	fmov	d31, x26
	smull	x26, w13, w5
	smaddl	x26, w27, w8, x26
	fmov	w27, s23
	sshr	d25, d31, 4
	add	x26, x26, 8
	fmov	d31, x26
	smull	x26, w12, w5
	smaddl	x26, w27, w8, x26
	fmov	w27, s6
	sshr	d28, d31, 4
	add	x26, x26, 8
	fmov	d31, x26
	smull	x26, w11, w5
	smaddl	x26, w27, w8, x26
	fmov	w27, s4
	sshr	d26, d31, 4
	add	x26, x26, 8
	fmov	d31, x26
	smull	x26, w10, w5
	smaddl	x26, w27, w8, x26
	fmov	w27, s3
	sshr	d29, d31, 4
	add	x26, x26, 8
	fmov	d31, x26
	smull	x26, w9, w5
	smaddl	x8, w27, w8, x26
	sshr	d27, d31, 4
	add	x8, x8, 8
	fmov	d31, x8
	mov	w8, -64
	sshr	d30, d31, 4
	fmov	d31, x25
	fmov	w25, s22
	smull	x0, w0, w8
	ushr	d31, d31, 4
	smull	x4, w4, w8
	smull	x23, w23, w8
	smull	x21, w21, w8
	smull	x20, w20, w8
	ins	v31.h[1], v25.h[0]
	smull	x19, w19, w8
	smull	x18, w18, w8
	smull	x17, w17, w8
	fmov	w8, s17
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v27.h[0]
	fmov	d27, x24
	mov	w24, 64
	ushr	d27, d27, 4
	smaddl	x0, w25, w24, x0
	fmov	w25, s20
	smaddl	x17, w8, w24, x17
	fmov	w8, s11
	ins	v27.h[1], v28.h[0]
	ubfx	x0, x0, 4, 16
	smaddl	x4, w25, w24, x4
	fmov	w25, s18
	ins	v27.h[2], v29.h[0]
	ubfx	x4, x4, 4, 16
	smaddl	x23, w25, w24, x23
	ins	v27.h[3], v30.h[0]
	zip1	v31.8h, v31.8h, v27.8h
	str	q31, [x1, 496]
	fmov	d31, x23
	fmov	w23, s10
	sshr	d26, d31, 4
	smaddl	x21, w23, w24, x21
	fmov	d31, x21
	fmov	w21, s9
	sshr	d27, d31, 4
	smaddl	x20, w21, w24, x20
	fmov	d31, x20
	fmov	w20, s8
	sshr	d25, d31, 4
	smaddl	x19, w20, w24, x19
	fmov	d31, x19
	fmov	w19, s5
	sshr	d28, d31, 4
	smaddl	x18, w19, w24, x18
	fmov	d31, x18
	sshr	d30, d31, 4
	fmov	d31, x17
	mov	w17, -83
	sshr	d29, d31, 4
	fmov	d31, x0
	smull	x14, w14, w17
	fmov	w0, s21
	ins	v31.h[1], v26.h[0]
	smaddl	x8, w8, w5, x14
	smull	x13, w13, w17
	add	x8, x8, 8
	smull	x12, w12, w17
	smull	x11, w11, w17
	ins	v31.h[2], v25.h[0]
	smull	x16, w16, w17
	smull	x10, w10, w17
	smull	x15, w15, w17
	smull	x9, w9, w17
	ins	v31.h[3], v30.h[0]
	fmov	d30, x4
	smaddl	x4, w0, w5, x16
	fmov	w0, s19
	ins	v30.h[1], v27.h[0]
	add	x4, x4, 8
	smaddl	x0, w0, w5, x15
	ins	v30.h[2], v28.h[0]
	add	x0, x0, 8
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x1, 1008]
	fmov	d31, x8
	fmov	w8, s24
	sshr	d25, d31, 4
	smaddl	x8, w8, w5, x13
	add	x8, x8, 8
	fmov	d31, x8
	fmov	w8, s23
	sshr	d28, d31, 4
	smaddl	x8, w8, w5, x12
	add	x8, x8, 8
	fmov	d31, x8
	fmov	w8, s6
	sshr	d26, d31, 4
	smaddl	x8, w8, w5, x11
	add	x8, x8, 8
	fmov	d31, x8
	fmov	w8, s4
	sshr	d29, d31, 4
	smaddl	x8, w8, w5, x10
	smaddl	x5, w27, w5, x9
	add	x8, x8, 8
	fmov	d31, x8
	add	x5, x5, 8
	sshr	d27, d31, 4
	fmov	d31, x5
	sshr	d30, d31, 4
	fmov	d31, x4
	ushr	d31, d31, 4
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v27.h[0]
	fmov	d27, x0
	ldr	x0, [sp, 176]
	ushr	d27, d27, 4
	ins	v27.h[1], v28.h[0]
	ins	v27.h[2], v29.h[0]
	ins	v27.h[3], v30.h[0]
	zip1	v31.8h, v31.8h, v27.8h
	str	q31, [x1, 1520]
	cmp	x0, x1
	bne	.L2
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #28
	.cfi_def_cfa_offset 320
	add	sp, sp, 320
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	_ZL9op_pass_4PKsPsl, .-_ZL9op_pass_4PKsPsl
	.align	2
	.p2align 5,,15
	.type	_ZL10op_pass_11PKsPsl.constprop.0, %function
_ZL10op_pass_11PKsPsl.constprop.0:
.LFB8:
	.cfi_startproc
	addvl	sp, sp, #-28
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x22
	add	x4, x0, 192
	ptrue	p7.b, all
	sub	sp, sp, #384
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x23,0x80,0x3,0x22
	adrp	x2, .LANCHOR0
	add	x2, x2, :lo12:.LANCHOR0
	add	x3, x2, 32
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	ld1h	z16.h, p7/z, [x3]
	ld1w	z7.s, p7/z, [x2]
	str	x4, [sp, 240]
	add	x4, x0, 224
	str	x4, [sp, 168]
	add	x4, x0, 256
	str	x4, [sp, 176]
	add	x4, x0, 288
	str	x4, [sp, 184]
	add	x4, x0, 320
	str	x4, [sp, 192]
	add	x4, x0, 352
	str	x4, [sp, 200]
	add	x4, x0, 384
	str	x4, [sp, 208]
	add	x4, x0, 416
	str	x4, [sp, 216]
	add	x4, x0, 448
	str	x4, [sp, 224]
	add	x4, x0, 480
	str	x4, [sp, 232]
	add	x4, x2, 64
	str	x4, [sp, 160]
	add	x4, x2, 96
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #20
	stp	x19, x20, [sp, 16]
	add	x4, x4, 256
	stp	x21, x22, [sp, 32]
	mov	x3, 0
	stp	x23, x24, [sp, 48]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	add	x24, x0, 160
	stp	x25, x26, [sp, 64]
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	add	x26, x0, 96
	add	x25, x0, 128
	stp	x27, x28, [sp, 80]
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	add	x28, x0, 32
	add	x27, x0, 64
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x48,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4d,0x3,0x8f,0x88,0x1
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	str	z31, [x4]
	add	x4, x2, 128
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #21
	add	x4, x4, 256
	str	z31, [x4]
	add	x4, x2, 160
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 256
	str	z31, [x4]
	add	x4, x2, 192
	ld1h	z31.h, p7/z, [x4]
	str	x0, [sp, 248]
	addvl	x4, sp, #23
	add	x4, x4, 256
	str	z31, [x4]
	add	x4, x2, 224
	ld1h	z2.h, p7/z, [x4]
	mov	z14.d, z2.d
	add	x4, x2, 256
	ld1h	z3.h, p7/z, [x4]
	mov	z13.d, z3.d
	add	x4, x2, 288
	ld1h	z4.h, p7/z, [x4]
	mov	z12.d, z4.d
	add	x4, x2, 320
	ld1h	z5.h, p7/z, [x4]
	add	x4, x2, 352
	ld1h	z6.h, p7/z, [x4]
	add	x4, x2, 384
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #24
	add	x4, x4, 256
	str	z31, [x4]
	add	x4, x2, 416
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #25
	add	x4, x4, 256
	str	z31, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 256
	str	z5, [x4]
	addvl	x4, sp, #27
	add	x4, x4, 256
	str	z6, [x4]
.L7:
	ldp	x4, x0, [sp, 240]
	ld1h	z28.h, p7/z, [x28, x3, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z27.s, z28.h
	ld1h	z31.h, p7/z, [x0, x3, lsl 1]
	sunpkhi	z26.s, z28.h
	sub	z29.h, z31.h, z28.h
	sunpklo	z30.s, z31.h
	add	z30.s, z30.s, z27.s
	add	x0, sp, 256
	sunpkhi	z27.s, z31.h
	add	z31.h, z31.h, z28.h
	rev	z28.h, z31.h
	sub	z17.h, z31.h, z28.h
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z16.h
	sub	z31.h, z31.h, z28.h
	str	z31, [x0]
	addvl	x0, sp, #1
	add	z27.s, z27.s, z26.s
	rev	z27.s, z27.s
	add	x0, x0, 256
	add	z30.s, z30.s, z27.s
	rev	z31.s, z30.s
	add	z31.s, z30.s, z31.s
	tbl	z30.s, {z31.s}, z7.s
	add	z21.s, z31.s, z30.s
	str	z21, [x0]
	addvl	x0, sp, #2
	sub	z20.s, z31.s, z30.s
	add	x0, x0, 256
	ld1h	z27.h, p7/z, [x26, x3, lsl 1]
	rev	z27.h, z27.h
	sunpklo	z26.s, z27.h
	str	z20, [x0]
	addvl	x0, sp, #3
	ld1h	z31.h, p7/z, [x27, x3, lsl 1]
	sunpkhi	z25.s, z27.h
	sub	z30.h, z31.h, z27.h
	add	x0, x0, 256
	sunpklo	z28.s, z31.h
	add	z28.s, z28.s, z26.s
	sunpkhi	z26.s, z31.h
	add	z31.h, z31.h, z27.h
	rev	z27.h, z31.h
	sub	z18.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	tbl	z27.h, {z31.h}, z16.h
	sub	z27.h, z31.h, z27.h
	str	z27, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 256
	add	z26.s, z26.s, z25.s
	rev	z26.s, z26.s
	add	z28.s, z28.s, z26.s
	rev	z31.s, z28.s
	add	z31.s, z28.s, z31.s
	tbl	z28.s, {z31.s}, z7.s
	add	z19.s, z31.s, z28.s
	str	z19, [x0]
	addvl	x0, sp, #5
	sub	z31.s, z31.s, z28.s
	ld1h	z26.h, p7/z, [x24, x3, lsl 1]
	add	x0, x0, 256
	rev	z26.h, z26.h
	sunpklo	z25.s, z26.h
	str	z31, [x0]
	addvl	x0, sp, #6
	ld1h	z31.h, p7/z, [x25, x3, lsl 1]
	sunpkhi	z24.s, z26.h
	sub	z28.h, z31.h, z26.h
	add	x0, x0, 256
	sunpklo	z27.s, z31.h
	add	z27.s, z27.s, z25.s
	sunpkhi	z25.s, z31.h
	add	z31.h, z31.h, z26.h
	rev	z26.h, z31.h
	sub	z10.h, z31.h, z26.h
	add	z31.h, z31.h, z26.h
	tbl	z26.h, {z31.h}, z16.h
	sub	z26.h, z31.h, z26.h
	str	z26, [x0]
	addvl	x0, sp, #7
	add	z25.s, z25.s, z24.s
	add	x0, x0, 256
	rev	z25.s, z25.s
	add	z27.s, z27.s, z25.s
	rev	z31.s, z27.s
	add	z31.s, z27.s, z31.s
	tbl	z27.s, {z31.s}, z7.s
	add	z26.s, z31.s, z27.s
	str	z26, [x0]
	addvl	x0, sp, #8
	add	x0, x0, 256
	ld1h	z26.h, p7/z, [x4, x3, lsl 1]
	sub	z11.s, z31.s, z27.s
	ldr	x4, [sp, 168]
	ld1h	z25.h, p7/z, [x4, x3, lsl 1]
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	str	z11, [x0]
	addvl	x0, sp, #9
	sub	z31.h, z26.h, z25.h
	sunpkhi	z23.s, z25.h
	add	x0, x0, 256
	sunpklo	z24.s, z26.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	sub	z11.h, z26.h, z25.h
	add	z26.h, z26.h, z25.h
	tbl	z25.h, {z26.h}, z16.h
	sub	z25.h, z26.h, z25.h
	str	z25, [x0]
	addvl	x0, sp, #10
	add	z27.s, z27.s, z23.s
	add	x0, x0, 256
	rev	z27.s, z27.s
	add	z27.s, z24.s, z27.s
	rev	z26.s, z27.s
	add	z27.s, z27.s, z26.s
	ldr	x4, [sp, 176]
	tbl	z26.s, {z27.s}, z7.s
	add	z25.s, z27.s, z26.s
	str	z25, [x0]
	addvl	x0, sp, #11
	sub	z9.s, z27.s, z26.s
	ld1h	z26.h, p7/z, [x4, x3, lsl 1]
	add	x0, x0, 256
	str	z9, [x0]
	sunpklo	z24.s, z26.h
	ldr	x4, [sp, 184]
	ld1h	z25.h, p7/z, [x4, x3, lsl 1]
	rev	z25.h, z25.h
	addvl	x0, sp, #12
	sunpklo	z27.s, z25.h
	sub	z4.h, z26.h, z25.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z23.s, z25.h
	add	x0, x0, 256
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z5.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z24.s, z27.s
	tbl	z25.h, {z26.h}, z16.h
	sub	z24.h, z26.h, z25.h
	str	z24, [x0]
	addvl	x0, sp, #13
	ldr	x4, [sp, 192]
	rev	z22.s, z27.s
	add	z22.s, z27.s, z22.s
	add	x0, x0, 256
	tbl	z27.s, {z22.s}, z7.s
	ld1h	z26.h, p7/z, [x4, x3, lsl 1]
	ldr	x4, [sp, 200]
	add	z8.s, z22.s, z27.s
	sub	z22.s, z22.s, z27.s
	str	z8, [x0]
	ld1h	z25.h, p7/z, [x4, x3, lsl 1]
	addvl	x0, sp, #14
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	sub	z3.h, z26.h, z25.h
	sunpkhi	z23.s, z25.h
	add	x0, x0, 256
	sunpklo	z24.s, z26.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z8.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z24.s, z27.s
	tbl	z25.h, {z26.h}, z16.h
	sub	z23.h, z26.h, z25.h
	str	z23, [x0]
	addvl	x0, sp, #15
	rev	z24.s, z27.s
	add	z24.s, z27.s, z24.s
	ldr	x4, [sp, 208]
	tbl	z27.s, {z24.s}, z7.s
	ld1h	z25.h, p7/z, [x4, x3, lsl 1]
	add	x0, x0, 256
	add	z6.s, z24.s, z27.s
	sunpklo	z23.s, z25.h
	ldr	x4, [sp, 216]
	sub	z24.s, z24.s, z27.s
	ld1h	z21.h, p7/z, [x4, x3, lsl 1]
	rev	z21.h, z21.h
	sunpklo	z27.s, z21.h
	add	z23.s, z23.s, z27.s
	str	z6, [x0]
	addvl	x0, sp, #16
	sub	z26.h, z25.h, z21.h
	sunpkhi	z20.s, z21.h
	add	x0, x0, 256
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z21.h
	add	z27.s, z27.s, z20.s
	rev	z27.s, z27.s
	add	z27.s, z23.s, z27.s
	rev	z23.h, z25.h
	sub	z6.h, z25.h, z23.h
	add	z25.h, z25.h, z23.h
	tbl	z23.h, {z25.h}, z16.h
	sub	z15.h, z25.h, z23.h
	str	z15, [x0]
	addvl	x0, sp, #17
	rev	z23.s, z27.s
	ldr	x4, [sp, 224]
	add	z23.s, z27.s, z23.s
	tbl	z27.s, {z23.s}, z7.s
	add	x0, x0, 256
	ld1h	z25.h, p7/z, [x4, x3, lsl 1]
	add	z15.s, z23.s, z27.s
	ldr	x4, [sp, 232]
	sub	z23.s, z23.s, z27.s
	ld1h	z21.h, p7/z, [x4, x3, lsl 1]
	rev	z21.h, z21.h
	sunpklo	z27.s, z21.h
	str	z15, [x0]
	addvl	x0, sp, #18
	sub	z19.h, z25.h, z21.h
	sunpkhi	z15.s, z21.h
	add	x0, x0, 256
	sunpklo	z20.s, z25.h
	add	z20.s, z20.s, z27.s
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z21.h
	rev	z21.h, z25.h
	sub	z9.h, z25.h, z21.h
	add	z25.h, z25.h, z21.h
	tbl	z21.h, {z25.h}, z16.h
	sub	z2.h, z25.h, z21.h
	str	z2, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 256
	add	z27.s, z27.s, z15.s
	rev	z27.s, z27.s
	add	z27.s, z20.s, z27.s
	rev	z25.s, z27.s
	add	z27.s, z27.s, z25.s
	tbl	z25.s, {z27.s}, z7.s
	add	z15.s, z27.s, z25.s
	sub	z27.s, z27.s, z25.s
	str	z27, [x0]
	addvl	x0, sp, #20
	trn2	z21.d, z28.d, z26.d
	add	x0, x0, 256
	ldr	z2, [x0]
	zip1	z20.d, z28.d, z26.d
	addvl	x0, sp, #21
	trn1	z28.d, z28.d, z26.d
	trn2	z27.d, z29.d, z4.d
	add	x0, x0, 256
	ldr	z1, [x0]
	zip1	z25.d, z29.d, z4.d
	addvl	x0, sp, #22
	zip1	z25.d, z25.d, z20.d
	zip1	z26.d, z30.d, z3.d
	add	x0, x0, 256
	ldr	z0, [x0]
	zip1	z20.d, z27.d, z21.d
	addvl	x0, sp, #23
	zip2	z27.d, z27.d, z21.d
	trn1	z29.d, z29.d, z4.d
	ldr	x4, [sp, 160]
	zip2	z29.d, z29.d, z28.d
	trn2	z4.d, z31.d, z19.d
	trn2	z28.d, z30.d, z3.d
	zip1	z21.d, z31.d, z19.d
	add	x0, x0, 256
	trn1	z31.d, z31.d, z19.d
	trn1	z30.d, z30.d, z3.d
	ld1h	z3.h, p7/z, [x4]
	zip1	z26.d, z26.d, z21.d
	zip2	z30.d, z30.d, z31.d
	zip1	z21.d, z28.d, z4.d
	movi	d31, #0
	zip2	z28.d, z28.d, z4.d
	movprfx	z19, z31
	sdot	z19.d, z20.h, z2.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z2.h
	sdot	z19.d, z25.h, z3.h
	sdot	z4.d, z26.h, z3.h
	ldr	z3, [x0]
	addvl	x0, sp, #27
	sdot	z19.d, z29.h, z1.h
	sdot	z4.d, z30.h, z1.h
	sdot	z19.d, z27.h, z0.h
	sdot	z4.d, z28.h, z0.h
	add	x0, x0, 256
	uzp1	z19.s, z19.s, z19.s
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z19.h, z19.s, #11
	rshrnb	z4.h, z4.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z14.h
	sdot	z4.d, z26.h, z3.h
	str	q19, [x1, 64]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z14.h
	sdot	z19.d, z25.h, z3.h
	ldr	z3, [x0]
	addvl	x0, sp, #26
	add	x4, x2, 448
	sdot	z4.d, z30.h, z13.h
	add	x0, x0, 256
	ldr	z2, [x0]
	sdot	z4.d, z28.h, z12.h
	addvl	x0, sp, #24
	sdot	z19.d, z29.h, z13.h
	uzp1	z4.s, z4.s, z4.s
	add	x0, x0, 256
	ldr	z1, [x0]
	rshrnb	z4.h, z4.s, #11
	sdot	z19.d, z27.h, z12.h
	addvl	x0, sp, #25
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	add	x0, x0, 256
	ldr	z0, [x0]
	movprfx	z4, z31
	sdot	z4.d, z21.h, z3.h
	sdot	z4.d, z26.h, z2.h
	sdot	z4.d, z30.h, z1.h
	str	q19, [x1, 192]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z3.h
	sdot	z19.d, z25.h, z2.h
	sdot	z19.d, z29.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 480
	sdot	z4.d, z28.h, z0.h
	sdot	z19.d, z27.h, z0.h
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 512
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 544
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 576
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	str	q19, [x1, 320]
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z19.d, z25.h, z1.h
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z4.h, z4.s, #11
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	str	q19, [x1, 448]
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 608
	ld1h	z0.h, p7/z, [x4]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	add	x4, x2, 640
	ld1h	z2.h, p7/z, [x4]
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	add	x4, x2, 672
	ld1h	z3.h, p7/z, [x4]
	sdot	z19.d, z25.h, z1.h
	add	x4, x2, 704
	sdot	z4.d, z26.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 736
	ld1h	z0.h, p7/z, [x4]
	sdot	z19.d, z29.h, z2.h
	add	x4, x2, 768
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 800
	sdot	z19.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z19.s, z19.s, z19.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z19.h, z19.s, #11
	add	x4, x2, 832
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 576]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 864
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 896
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 928
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 960
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 704]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 992
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 1024
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1056
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1088
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 832]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1120
	ld1h	z0.h, p7/z, [x4]
	sdot	z4.d, z30.h, z2.h
	add	x4, x2, 1152
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1184
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1216
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 960]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1248
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 1280
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1312
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1344
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 1088]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1376
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 1408
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z4.h, z4.s, #11
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	str	q19, [x1, 1216]
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1440
	ld1h	z3.h, p7/z, [x4]
	add	x4, x2, 1472
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1504
	ld1h	z0.h, p7/z, [x4]
	sdot	z19.d, z29.h, z2.h
	add	x4, x2, 1536
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1568
	sdot	z19.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z19.s, z19.s, z19.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z19.h, z19.s, #11
	add	x4, x2, 1600
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 1344]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1632
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 1664
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1696
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1728
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 1472]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1760
	ld1h	z0.h, p7/z, [x4]
	add	x4, x2, 1792
	sdot	z4.d, z30.h, z2.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1824
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1856
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q19, [x1, 1600]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x4]
	add	x4, x2, 1888
	ld1h	z0.h, p7/z, [x4]
	sdot	z4.d, z30.h, z2.h
	add	x4, x2, 1920
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 1952
	sdot	z4.d, z28.h, z3.h
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 1984
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z21.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z4.d, z30.h, z2.h
	str	q19, [x1, 1728]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z0.h
	sdot	z19.d, z25.h, z1.h
	sdot	z19.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x4]
	add	x4, x2, 2016
	ld1h	z1.h, p7/z, [x4]
	sdot	z4.d, z28.h, z3.h
	add	x4, x2, 2048
	sdot	z19.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x4]
	rshrnb	z4.h, z4.s, #11
	add	x4, x2, 2080
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z4.h
	ld1h	z4.h, p7/z, [x4]
	add	x4, x2, 2112
	str	q19, [x1, 1856]
	movprfx	z19, z31
	sdot	z19.d, z20.h, z1.h
	sdot	z19.d, z25.h, z2.h
	sdot	z19.d, z29.h, z3.h
	movprfx	z29, z31
	sdot	z29.d, z21.h, z1.h
	sdot	z29.d, z26.h, z2.h
	ld1h	z26.h, p7/z, [x4]
	sdot	z29.d, z30.h, z3.h
	add	x4, x2, 2144
	sdot	z29.d, z28.h, z4.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #11
	zip1	z28.d, z11.d, z9.d
	ld1h	z25.h, p7/z, [x4]
	sdot	z19.d, z27.h, z4.h
	add	x4, x2, 2176
	uzp1	z19.s, z19.s, z19.s
	rshrnb	z19.h, z19.s, #11
	trn1	z19.h, z19.h, z29.h
	zip1	z29.d, z10.d, z6.d
	zip1	z30.d, z17.d, z5.d
	trn2	z10.d, z10.d, z6.d
	zip1	z30.d, z30.d, z29.d
	trn2	z11.d, z11.d, z9.d
	zip1	z29.d, z18.d, z8.d
	trn2	z17.d, z17.d, z5.d
	zip1	z29.d, z29.d, z28.d
	zip1	z17.d, z17.d, z10.d
	trn2	z18.d, z18.d, z8.d
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	zip1	z18.d, z18.d, z11.d
	sdot	z28.d, z30.h, z26.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x2, 2208
	uzp1	z28.s, z28.s, z28.s
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z28.h, z28.s, #11
	rshrnb	z27.h, z27.s, #11
	trn1	z28.h, z28.h, z27.h
	str	q28, [x1, 128]
	add	x0, sp, 256
	add	x3, x3, 256
	str	q19, [x1, 1984]
	ld1h	z25.h, p7/z, [x4]
	add	x4, x2, 2240
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z28.d, z30.h, z26.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x2, 2272
	uzp1	z28.s, z28.s, z28.s
	ld1h	z25.h, p7/z, [x4]
	rshrnb	z28.h, z28.s, #11
	add	x4, x2, 2304
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 384]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x2, 2336
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x4]
	rshrnb	z27.h, z27.s, #11
	add	x4, x2, 2368
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 640]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x2, 2400
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x4]
	rshrnb	z27.h, z27.s, #11
	add	x4, x2, 2432
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x1, 896]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	add	x4, x2, 2464
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x4]
	rshrnb	z27.h, z27.s, #11
	add	x4, x2, 2496
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x1, 1152]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x4]
	uzp1	z28.s, z28.s, z28.s
	add	x4, x2, 2528
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	ld1h	z25.h, p7/z, [x4]
	add	x4, x2, 2560
	movprfx	z27, z31
	sdot	z27.d, z18.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x1, 1408]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z25.h
	sdot	z28.d, z30.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x4]
	add	x4, x2, 2592
	ld1h	z26.h, p7/z, [x4]
	str	q28, [x1, 1664]
	movprfx	z28, z31
	sdot	z28.d, z17.h, z26.h
	sdot	z28.d, z30.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z18.h, z26.h
	sdot	z30.d, z29.h, z27.h
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z30.h
	ldr	z30, [x0]
	addvl	x0, sp, #12
	add	x4, x2, 2624
	ld1h	z26.h, p7/z, [x4]
	add	x0, x0, 256
	ldr	z29, [x0]
	zip1	z30.d, z30.d, z29.d
	addvl	x0, sp, #6
	add	x4, x2, 2656
	add	x0, x0, 256
	ldr	z29, [x0]
	str	q28, [x1, 1920]
	addvl	x0, sp, #16
	add	x0, x0, 256
	ldr	z28, [x0]
	zip1	z29.d, z29.d, z28.d
	addvl	x0, sp, #3
	zip1	z29.d, z30.d, z29.d
	add	x1, x1, 16
	add	x0, x0, 256
	ldr	z30, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 256
	ldr	z28, [x0]
	zip1	z30.d, z30.d, z28.d
	addvl	x0, sp, #9
	add	x0, x0, 256
	ldr	z28, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 256
	ldr	z3, [x0]
	zip1	z28.d, z28.d, z3.d
	addvl	x0, sp, #1
	zip1	z30.d, z30.d, z28.d
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	add	x0, x0, 256
	ld1h	z26.h, p7/z, [x4]
	uzp1	z28.s, z28.s, z28.s
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z28.h, z28.s, #11
	rshrnb	z27.h, z27.s, #11
	trn1	z28.h, z28.h, z27.h
	add	x4, x2, 2688
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x1, 240]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	str	q28, [x1, 752]
	ld1h	z26.h, p7/z, [x4]
	ldr	z21, [x0]
	addvl	x0, sp, #28
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	add	x0, x0, 256
	uzp1	z28.s, z28.s, z28.s
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z28.h, z28.s, #11
	rshrnb	z27.h, z27.s, #11
	trn1	z28.h, z28.h, z27.h
	add	x4, x2, 2720
	ld1h	z27.h, p7/z, [x4]
	str	q28, [x1, 1264]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z27.h
	sdot	z31.d, z30.h, z27.h
	uzp1	z28.s, z28.s, z28.s
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z28.h, z28.s, #11
	rshrnb	z31.h, z31.s, #11
	trn1	z28.h, z28.h, z31.h
	str	q28, [x1, 1776]
	fmov	x4, d21
	str	d21, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 256
	ldr	z20, [x0]
	fmov	x5, d20
	addvl	x0, sp, #28
	lsr	x4, x4, 32
	add	x0, x0, 264
	str	d20, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 256
	ldr	z19, [x0]
	lsr	x23, x5, 32
	addvl	x0, sp, #28
	fmov	x5, d19
	add	x0, x0, 272
	str	d19, [x0]
	addvl	x0, sp, #5
	add	x0, x0, 256
	ldr	z18, [x0]
	lsr	x6, x5, 32
	addvl	x0, sp, #28
	fmov	x5, d18
	add	x0, x0, 280
	fmov	w15, s18
	str	d18, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 256
	ldr	z17, [x0]
	lsr	x22, x5, 32
	addvl	x0, sp, #28
	fmov	x5, d17
	add	x0, x0, 288
	str	d17, [x0]
	addvl	x0, sp, #8
	add	x0, x0, 256
	ldr	z11, [x0]
	lsr	x12, x5, 32
	addvl	x0, sp, #28
	add	x13, x12, x5
	add	x0, x0, 296
	fmov	x5, d11
	lsl	x13, x13, 6
	str	d11, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 256
	ldr	z10, [x0]
	add	x13, x13, 1024
	addvl	x0, sp, #28
	lsr	x21, x5, 32
	add	x0, x0, 304
	fmov	x5, d10
	fmov	d31, x13
	str	d10, [x0]
	addvl	x0, sp, #11
	add	x0, x0, 256
	ldr	z9, [x0]
	sshr	d25, d31, 11
	addvl	x0, sp, #28
	lsr	x9, x5, 32
	add	x0, x0, 312
	add	x13, x9, x5
	fmov	x5, d9
	str	d9, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 256
	ldr	z8, [x0]
	lsl	x13, x13, 6
	addvl	x0, sp, #28
	add	x13, x13, 1024
	add	x0, x0, 320
	lsr	x20, x5, 32
	fmov	x5, d8
	fmov	d31, x13
	str	d8, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 328
	fmov	x13, d8
	sshr	d28, d31, 11
	lsr	x11, x5, 32
	fmov	x5, d22
	str	d22, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 256
	ldr	z6, [x0]
	add	x13, x11, x13
	addvl	x0, sp, #28
	lsr	x19, x5, 32
	fmov	x5, d6
	add	x0, x0, 336
	lsl	x13, x13, 6
	str	d6, [x0]
	addvl	x0, sp, #28
	add	x13, x13, 1024
	add	x0, x0, 344
	lsr	x8, x5, 32
	fmov	x5, d24
	fmov	d31, x13
	fmov	x13, d6
	str	d24, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 256
	ldr	z5, [x0]
	sshr	d26, d31, 11
	lsr	x18, x5, 32
	addvl	x0, sp, #28
	fmov	x5, d5
	add	x13, x8, x13
	add	x0, x0, 352
	lsl	x13, x13, 6
	str	d5, [x0]
	add	x13, x13, 1024
	addvl	x0, sp, #28
	lsr	x10, x5, 32
	fmov	x5, d23
	fmov	d31, x13
	fmov	x13, d5
	add	x0, x0, 360
	str	d23, [x0]
	addvl	x0, sp, #28
	sshr	d29, d31, 11
	lsr	x17, x5, 32
	fmov	x5, d15
	add	x13, x10, x13
	add	x0, x0, 368
	str	d15, [x0]
	addvl	x0, sp, #19
	lsl	x13, x13, 6
	add	x0, x0, 256
	ldr	z4, [x0]
	lsr	x30, x5, 32
	add	x13, x13, 1024
	fmov	d31, x13
	add	x13, x30, x5
	fmov	x5, d4
	addvl	x0, sp, #28
	lsl	x13, x13, 6
	sshr	d27, d31, 11
	add	x13, x13, 1024
	fmov	d31, x13
	fmov	w13, s20
	add	x0, x0, 376
	lsr	x16, x5, 32
	fmov	x5, d21
	sshr	d30, d31, 11
	str	d4, [x0]
	fmov	w0, s11
	add	x7, x4, x5
	fmov	x5, d19
	lsl	x7, x7, 6
	add	x7, x7, 1024
	fmov	d31, x7
	add	x5, x6, x5
	mov	w7, 83
	ushr	d31, d31, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v27.h[0]
	fmov	d27, x5
	mov	w5, 36
	ushr	d27, d27, 11
	smull	x14, w23, w5
	smaddl	x14, w13, w7, x14
	smull	x13, w22, w5
	ins	v27.h[1], v28.h[0]
	smaddl	x13, w15, w7, x13
	smull	x15, w21, w5
	add	x14, x14, 1024
	smaddl	x15, w0, w7, x15
	fmov	w0, s9
	add	x13, x13, 1024
	ins	v27.h[2], v29.h[0]
	add	x15, x15, 1024
	ins	v27.h[3], v30.h[0]
	zip1	v31.8h, v31.8h, v27.8h
	str	q31, [x1, -16]
	fmov	d31, x15
	smull	x15, w20, w5
	smaddl	x15, w0, w7, x15
	fmov	w0, s22
	sshr	d25, d31, 11
	add	x15, x15, 1024
	fmov	d31, x15
	smull	x15, w19, w5
	smaddl	x15, w0, w7, x15
	fmov	w0, s24
	sshr	d28, d31, 11
	add	x15, x15, 1024
	fmov	d31, x15
	smull	x15, w18, w5
	smaddl	x15, w0, w7, x15
	fmov	w0, s23
	sshr	d26, d31, 11
	add	x15, x15, 1024
	fmov	d31, x15
	smull	x15, w17, w5
	smaddl	x15, w0, w7, x15
	fmov	w0, s4
	sshr	d29, d31, 11
	add	x15, x15, 1024
	fmov	d31, x15
	smull	x15, w16, w5
	smaddl	x7, w0, w7, x15
	sshr	d27, d31, 11
	fmov	w0, s21
	add	x7, x7, 1024
	fmov	d31, x7
	mov	w7, -64
	sshr	d30, d31, 11
	fmov	d31, x14
	smull	x4, w4, w7
	ushr	d31, d31, 11
	smull	x6, w6, w7
	smull	x12, w12, w7
	smull	x9, w9, w7
	smull	x11, w11, w7
	ins	v31.h[1], v25.h[0]
	smull	x8, w8, w7
	smull	x10, w10, w7
	smull	x30, w30, w7
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v27.h[0]
	fmov	d27, x13
	mov	w13, 64
	ushr	d27, d27, 11
	smaddl	x4, w0, w13, x4
	fmov	w0, s19
	add	x4, x4, 1024
	ins	v27.h[1], v28.h[0]
	smaddl	x6, w0, w13, x6
	fmov	w0, s17
	add	x6, x6, 1024
	ins	v27.h[2], v29.h[0]
	smaddl	x12, w0, w13, x12
	fmov	w0, s10
	add	x12, x12, 1024
	ins	v27.h[3], v30.h[0]
	smaddl	x9, w0, w13, x9
	fmov	w0, s8
	add	x9, x9, 1024
	zip1	v31.8h, v31.8h, v27.8h
	smaddl	x11, w0, w13, x11
	fmov	w0, s6
	add	x11, x11, 1024
	str	q31, [x1, 496]
	fmov	d31, x12
	smaddl	x8, w0, w13, x8
	fmov	w0, s5
	sshr	d26, d31, 11
	fmov	d31, x9
	add	x8, x8, 1024
	sshr	d27, d31, 11
	fmov	d31, x11
	smaddl	x10, w0, w13, x10
	fmov	w0, s15
	sshr	d25, d31, 11
	fmov	d31, x8
	add	x10, x10, 1024
	sshr	d28, d31, 11
	fmov	d31, x10
	smaddl	x7, w0, w13, x30
	fmov	w0, s20
	sshr	d30, d31, 11
	add	x7, x7, 1024
	fmov	d31, x7
	sshr	d29, d31, 11
	fmov	d31, x4
	mov	w4, -83
	ushr	d31, d31, 11
	smull	x23, w23, w4
	smull	x22, w22, w4
	smull	x21, w21, w4
	ins	v31.h[1], v26.h[0]
	smull	x20, w20, w4
	smull	x19, w19, w4
	smull	x18, w18, w4
	smull	x17, w17, w4
	ins	v31.h[2], v25.h[0]
	smull	x16, w16, w4
	ins	v31.h[3], v30.h[0]
	fmov	d30, x6
	smaddl	x6, w0, w5, x23
	fmov	w0, s18
	ushr	d30, d30, 11
	add	x6, x6, 1024
	smaddl	x7, w0, w5, x22
	fmov	w0, s11
	ins	v30.h[1], v27.h[0]
	add	x7, x7, 1024
	smaddl	x8, w0, w5, x21
	fmov	w0, s9
	ins	v30.h[2], v28.h[0]
	add	x8, x8, 1024
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x1, 1008]
	fmov	d31, x8
	smaddl	x8, w0, w5, x20
	fmov	w0, s22
	sshr	d25, d31, 11
	add	x8, x8, 1024
	fmov	d31, x8
	sshr	d28, d31, 11
	smaddl	x8, w0, w5, x19
	fmov	w0, s24
	add	x8, x8, 1024
	fmov	d31, x8
	smaddl	x8, w0, w5, x18
	fmov	w0, s23
	sshr	d26, d31, 11
	add	x8, x8, 1024
	fmov	d31, x8
	smaddl	x8, w0, w5, x17
	fmov	w0, s4
	sshr	d29, d31, 11
	add	x8, x8, 1024
	fmov	d31, x8
	smaddl	x4, w0, w5, x16
	sshr	d27, d31, 11
	add	x4, x4, 1024
	fmov	d31, x4
	sshr	d30, d31, 11
	fmov	d31, x6
	ushr	d31, d31, 11
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v27.h[0]
	fmov	d27, x7
	ushr	d27, d27, 11
	ins	v27.h[1], v28.h[0]
	ins	v27.h[2], v29.h[0]
	ins	v27.h[3], v30.h[0]
	zip1	v31.8h, v31.8h, v27.8h
	str	q31, [x1, 1520]
	cmp	x3, 1024
	bne	.L7
	ldp	x29, x30, [sp]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	d8, d9, [sp, 96]
	ldp	d10, d11, [sp, 112]
	ldp	d12, d13, [sp, 128]
	ldp	d14, d15, [sp, 144]
	.cfi_restore 27
	.cfi_restore 28
	.cfi_restore 25
	.cfi_restore 26
	.cfi_restore 23
	.cfi_restore 24
	.cfi_restore 21
	.cfi_restore 22
	.cfi_restore 19
	.cfi_restore 20
	.cfi_restore 29
	.cfi_restore 30
	.cfi_restore 78
	.cfi_restore 79
	.cfi_restore 76
	.cfi_restore 77
	.cfi_restore 74
	.cfi_restore 75
	.cfi_restore 72
	.cfi_restore 73
	addvl	sp, sp, #28
	.cfi_def_cfa_offset 384
	add	sp, sp, 384
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	_ZL10op_pass_11PKsPsl.constprop.0, .-_ZL10op_pass_11PKsPsl.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB7:
	.cfi_startproc
	sub	sp, sp, #2080
	.cfi_def_cfa_offset 2080
	stp	x29, x30, [sp]
	.cfi_offset 29, -2080
	.cfi_offset 30, -2072
	mov	x29, sp
	str	x19, [sp, 16]
	.cfi_offset 19, -2064
	mov	x19, x1
	add	x1, sp, 32
	bl	_ZL9op_pass_4PKsPsl
	mov	x1, x19
	add	x0, sp, 32
	bl	_ZL10op_pass_11PKsPsl.constprop.0
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	add	sp, sp, 2080
	.cfi_restore 19
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
	.type	_ZL8IDX_REV8, %object
	.size	_ZL8IDX_REV8, 32
_ZL8IDX_REV8:
	.hword	7
	.hword	6
	.hword	5
	.hword	4
	.hword	3
	.hword	2
	.hword	1
	.hword	0
	.hword	15
	.hword	14
	.hword	13
	.hword	12
	.hword	11
	.hword	10
	.hword	9
	.hword	8
	.type	_ZL4CODD, %object
	.size	_ZL4CODD, 2048
_ZL4CODD:
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.type	_ZL3K2S, %object
	.size	_ZL3K2S, 512
_ZL3K2S:
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.type	_ZL3K4S, %object
	.size	_ZL3K4S, 128
_ZL3K4S:
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
