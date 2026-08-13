	.arch armv8.2-a+crc+sve2
	.file	"best_op_r8.cpp"
	.text
	.align	2
	.p2align 5,,15
	.type	_ZL9op_pass_4PKsPsl, %function
_ZL9op_pass_4PKsPsl:
.LFB9:
	.cfi_startproc
	addvl	sp, sp, #-27
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xd8,0x1e,0x22
	adrp	x3, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #64
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xd8,0x1e,0x23,0x40,0x22
	add	x3, x3, :lo12:.LANCHOR0
	add	x5, x3, 64
	ld1h	z31.h, p7/z, [x5]
	add	x7, x0, x2, lsl 2
	addvl	x5, sp, #16
	add	x6, x7, x2, lsl 2
	add	x5, x5, 64
	stp	d8, d9, [sp]
	add	x8, x6, x2, lsl 2
	stp	d10, d11, [sp, 16]
	add	x14, x1, 64
	add	x13, x0, x2, lsl 1
	stp	d12, d13, [sp, 32]
	add	x12, x7, x2, lsl 1
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	ld1h	z12.h, p7/z, [x3]
	add	x11, x6, x2, lsl 1
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	add	x10, x8, x2, lsl 1
	str	z31, [x5]
	add	x5, x3, 96
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #17
	add	x9, x3, 32
	add	x5, x5, 64
	str	z31, [x5]
	mov	x4, 0
	add	x5, x3, 128
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #18
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 160
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #19
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 192
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #20
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 224
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #21
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 256
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #22
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 288
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #23
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 320
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #24
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 352
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #25
	add	x5, x5, 64
	str	z31, [x5]
	add	x5, x3, 384
	ld1h	z31.h, p7/z, [x5]
	addvl	x5, sp, #26
	add	x5, x5, 64
	str	z31, [x5]
.L2:
	add	x5, x0, x4
	ld1h	z15.h, p7/z, [x5]
	ptrue	p6.d, all
	add	x5, x5, 32
	ld1h	z10.h, p7/z, [x5]
	rev	z31.h, z10.h
	add	x5, sp, 64
	sub	z20.h, z15.h, z31.h
	add	z31.h, z15.h, z31.h
	rev	z30.h, z31.h
	sub	z29.h, z31.h, z30.h
	str	z29, [x5]
	addvl	x5, sp, #1
	add	z31.h, z31.h, z30.h
	tbl	z30.h, {z31.h}, z12.h
	add	x5, x5, 64
	sub	z31.h, z31.h, z30.h
	str	z31, [x5]
	add	x5, x13, x4
	ld1h	z25.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z23.h, p7/z, [x5]
	rev	z31.h, z23.h
	addvl	x5, sp, #2
	sub	z19.h, z25.h, z31.h
	add	z31.h, z25.h, z31.h
	add	x5, x5, 64
	rev	z30.h, z31.h
	sub	z28.h, z31.h, z30.h
	str	z28, [x5]
	addvl	x5, sp, #3
	add	z31.h, z31.h, z30.h
	add	x5, x5, 64
	tbl	z30.h, {z31.h}, z12.h
	sub	z30.h, z31.h, z30.h
	str	z30, [x5]
	add	x5, x7, x4
	ld1h	z30.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z27.h, p7/z, [x5]
	rev	z31.h, z27.h
	addvl	x5, sp, #4
	sub	z6.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	add	x5, x5, 64
	rev	z28.h, z31.h
	sub	z9.h, z31.h, z28.h
	str	z9, [x5]
	addvl	x5, sp, #5
	add	z31.h, z31.h, z28.h
	add	x5, x5, 64
	tbl	z28.h, {z31.h}, z12.h
	sub	z26.h, z31.h, z28.h
	str	z26, [x5]
	add	x5, x12, x4
	ld1h	z16.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z11.h, p7/z, [x5]
	rev	z31.h, z11.h
	addvl	x5, sp, #6
	sub	z7.h, z16.h, z31.h
	add	z31.h, z16.h, z31.h
	add	x5, x5, 64
	rev	z28.h, z31.h
	sub	z8.h, z31.h, z28.h
	str	z8, [x5]
	addvl	x5, sp, #7
	add	z31.h, z31.h, z28.h
	add	x5, x5, 64
	tbl	z28.h, {z31.h}, z12.h
	sub	z24.h, z31.h, z28.h
	str	z24, [x5]
	add	x5, x6, x4
	ld1h	z31.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z28.h, p7/z, [x5]
	rev	z26.h, z28.h
	addvl	x5, sp, #8
	sub	z22.h, z31.h, z26.h
	add	z26.h, z31.h, z26.h
	add	x5, x5, 64
	rev	z24.h, z26.h
	sub	z21.h, z26.h, z24.h
	str	z21, [x5]
	addvl	x5, sp, #9
	add	z26.h, z26.h, z24.h
	add	x5, x5, 64
	tbl	z24.h, {z26.h}, z12.h
	sub	z18.h, z26.h, z24.h
	str	z18, [x5]
	add	x5, x11, x4
	ld1h	z26.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z24.h, p7/z, [x5]
	rev	z18.h, z24.h
	addvl	x5, sp, #10
	sub	z21.h, z26.h, z18.h
	add	z18.h, z26.h, z18.h
	add	x5, x5, 64
	rev	z17.h, z18.h
	sub	z14.h, z18.h, z17.h
	str	z14, [x5]
	addvl	x5, sp, #11
	add	z18.h, z18.h, z17.h
	add	x5, x5, 64
	tbl	z17.h, {z18.h}, z12.h
	sub	z17.h, z18.h, z17.h
	str	z17, [x5]
	add	x5, x8, x4
	ld1h	z17.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z13.h, p7/z, [x5]
	rev	z18.h, z13.h
	addvl	x5, sp, #12
	sub	z8.h, z17.h, z18.h
	add	z18.h, z17.h, z18.h
	add	x5, x5, 64
	rev	z14.h, z18.h
	sub	z5.h, z18.h, z14.h
	str	z5, [x5]
	addvl	x5, sp, #13
	add	z18.h, z18.h, z14.h
	add	x5, x5, 64
	tbl	z14.h, {z18.h}, z12.h
	sub	z4.h, z18.h, z14.h
	str	z4, [x5]
	add	x5, x10, x4
	ld1h	z18.h, p7/z, [x5]
	add	x5, x5, 32
	ld1h	z14.h, p7/z, [x5]
	rev	z3.h, z14.h
	addvl	x5, sp, #14
	sub	z9.h, z18.h, z3.h
	add	z3.h, z18.h, z3.h
	add	x5, x5, 64
	rev	z2.h, z3.h
	sub	z4.h, z3.h, z2.h
	str	z4, [x5]
	addvl	x5, sp, #15
	add	z3.h, z3.h, z2.h
	add	x5, x5, 64
	tbl	z2.h, {z3.h}, z12.h
	sub	z3.h, z3.h, z2.h
	zip1	z1.d, z20.d, z6.d
	trn2	z2.d, z19.d, z7.d
	zip1	z0.d, z19.d, z7.d
	trn1	z19.d, z19.d, z7.d
	str	z3, [x5]
	trn2	z3.d, z20.d, z6.d
	addvl	x5, sp, #16
	trn1	z20.d, z20.d, z6.d
	zip1	z6.d, z21.d, z9.d
	zip2	z29.d, z20.d, z19.d
	add	x5, x5, 64
	trn2	z20.d, z22.d, z8.d
	trn2	z19.d, z21.d, z9.d
	zip1	z0.d, z1.d, z0.d
	zip2	z5.d, z20.d, z19.d
	zip1	z1.d, z3.d, z2.d
	zip1	z7.d, z22.d, z8.d
	zip2	z3.d, z3.d, z2.d
	zip1	z2.d, z7.d, z6.d
	zip1	z6.d, z20.d, z19.d
	ld1h	z19.h, p7/z, [x9]
	ldr	z20, [x5]
	addvl	x5, sp, #17
	trn1	z21.d, z21.d, z9.d
	add	x5, x5, 64
	ldr	z9, [x5]
	trn1	z22.d, z22.d, z8.d
	addvl	x5, sp, #18
	zip2	z4.d, z22.d, z21.d
	movi	d22, #0
	add	x5, x5, 64
	ldr	z7, [x5]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z19.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z7.h
	mov	z7.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z19.h
	ldr	z19, [x5]
	addvl	x5, sp, #20
	sdot	z20.d, z4.h, z9.h
	add	x5, x5, 64
	sdot	z20.d, z5.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	ldr	z20, [x5]
	addvl	x5, sp, #19
	rshrnb	z21.h, z21.s, #4
	add	x5, x5, 64
	ldr	z7, [x5]
	uzp1	z21.h, z21.h, z21.h
	addvl	x5, sp, #21
	add	x5, x5, 64
	ldr	z9, [x5]
	addvl	x5, sp, #22
	add	x5, x5, 64
	ldr	z19, [x5]
	str	q21, [x1, 64]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z7.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z19.h
	mov	z19.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z19.h
	ldr	z19, [x5]
	addvl	x5, sp, #24
	sdot	z20.d, z2.h, z7.h
	add	x5, x5, 64
	sdot	z20.d, z4.h, z9.h
	sdot	z20.d, z5.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	ldr	z20, [x5]
	addvl	x5, sp, #23
	add	x5, x5, 64
	ldr	z7, [x5]
	rshrnb	z21.h, z21.s, #4
	addvl	x5, sp, #25
	uzp1	z21.h, z21.h, z21.h
	add	x5, x5, 64
	ldr	z9, [x5]
	addvl	x5, sp, #26
	add	x5, x5, 64
	ldr	z19, [x5]
	str	q21, [x1, 192]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z7.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z19.h
	mov	z19.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z19.h
	ldr	z19, [x5]
	add	x5, x3, 416
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 448
	sdot	z20.d, z2.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 480
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 512
	sdot	z20.d, z5.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 544
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 320]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 576
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 608
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 640
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 672
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 448]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 704
	ld1h	z7.h, p7/z, [x5]
	sdot	z20.d, z4.h, z9.h
	add	x5, x3, 736
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 768
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 800
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 576]
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z21.d, z0.h, z8.h
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 704]
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 832
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 864
	ld1h	z9.h, p7/z, [x5]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	add	x5, x3, 896
	ld1h	z19.h, p7/z, [x5]
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	add	x5, x3, 928
	sdot	z21.d, z0.h, z8.h
	sdot	z20.d, z2.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 960
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 992
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1024
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1056
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 832]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1088
	ld1h	z7.h, p7/z, [x5]
	sdot	z20.d, z4.h, z9.h
	add	x5, x3, 1120
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1152
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1184
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 960]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1216
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 1248
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1280
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1312
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1088]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1344
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 1376
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1408
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1440
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1216]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1472
	ld1h	z7.h, p7/z, [x5]
	sdot	z20.d, z4.h, z9.h
	add	x5, x3, 1504
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1536
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1568
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1344]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1600
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 1632
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 1472]
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1664
	ld1h	z19.h, p7/z, [x5]
	add	x5, x3, 1696
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1728
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 1760
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1792
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1824
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1600]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 1856
	ld1h	z7.h, p7/z, [x5]
	sdot	z20.d, z4.h, z9.h
	add	x5, x3, 1888
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1920
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	uzp1	z21.s, z21.s, z20.s
	add	x5, x3, 1952
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z20.d, z4.h, z9.h
	str	q21, [x1, 1728]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x5]
	add	x5, x3, 1984
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 2016
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x5]
	add	x5, x3, 2048
	uzp1	z21.s, z21.s, z20.s
	ld1h	z20.h, p7/z, [x5]
	rshrnb	z21.h, z21.s, #4
	add	x5, sp, 64
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 1856]
	movprfx	z7, z22
	sdot	z7.d, z6.h, z8.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z8.h
	sdot	z21.d, z0.h, z9.h
	sdot	z21.d, z29.h, z19.h
	ldr	z29, [x5]
	addvl	x5, sp, #4
	sdot	z7.d, z2.h, z9.h
	add	x5, x5, 64
	ldr	z9, [x5]
	sdot	z7.d, z4.h, z19.h
	addvl	x5, sp, #2
	sdot	z7.d, z5.h, z20.h
	sdot	z21.d, z3.h, z20.h
	add	x5, x5, 64
	ldr	z19, [x5]
	uzp1	z21.s, z21.s, z7.s
	addvl	x5, sp, #6
	rshrnb	z21.h, z21.s, #4
	uzp1	z21.h, z21.h, z21.h
	add	x5, x5, 64
	ldr	z2, [x5]
	zip1	z20.d, z19.d, z2.d
	str	q21, [x1, 1984]
	zip1	z21.d, z29.d, z9.d
	zip1	z21.d, z21.d, z20.d
	mov	z20.d, z19.d
	ldr	z19, [x5]
	addvl	x5, sp, #8
	add	x5, x5, 64
	trn2	z29.d, z29.d, z9.d
	ldr	z9, [x5]
	addvl	x5, sp, #12
	trn2	z20.d, z20.d, z19.d
	zip1	z29.d, z29.d, z20.d
	add	x5, x5, 64
	ldr	z7, [x5]
	zip1	z19.d, z9.d, z7.d
	addvl	x5, sp, #10
	add	x5, x5, 64
	ldr	z8, [x5]
	addvl	x5, sp, #14
	add	x5, x5, 64
	ldr	z5, [x5]
	zip1	z20.d, z8.d, z5.d
	zip1	z19.d, z19.d, z20.d
	trn2	z20.d, z9.d, z7.d
	mov	z9.d, z8.d
	ldr	z8, [x5]
	add	x5, x3, 2080
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2112
	trn2	z9.d, z9.d, z8.d
	ld1h	z6.h, p7/z, [x5]
	add	x5, x3, 2144
	zip1	z20.d, z20.d, z9.d
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z9.d, z21.h, z7.h
	sdot	z8.d, z19.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2176
	uzp1	z9.s, z9.s, z8.s
	rshrnb	z9.h, z9.s, #4
	uzp1	z9.h, z9.h, z9.h
	str	q9, [x1, 128]
	ld1h	z6.h, p7/z, [x5]
	add	x5, x3, 2208
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z9.d, z21.h, z7.h
	sdot	z8.d, z19.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2240
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x5]
	rshrnb	z9.h, z9.s, #4
	add	x5, x3, 2272
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 384]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2304
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x5]
	rshrnb	z9.h, z9.s, #4
	add	x5, x3, 2336
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 640]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2368
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x5]
	rshrnb	z9.h, z9.s, #4
	add	x5, x3, 2400
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 896]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2432
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x5]
	rshrnb	z9.h, z9.s, #4
	add	x5, x3, 2464
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 1152]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x5]
	add	x5, x3, 2496
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x5]
	rshrnb	z9.h, z9.s, #4
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	add	x5, x3, 2528
	sdot	z8.d, z19.h, z7.h
	uzp1	z9.h, z9.h, z9.h
	str	q9, [x1, 1408]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	uzp1	z9.s, z9.s, z8.s
	ld1h	z8.h, p7/z, [x5]
	add	x5, x3, 2560
	rshrnb	z9.h, z9.s, #4
	ld1h	z7.h, p7/z, [x5]
	uzp1	z9.h, z9.h, z9.h
	addvl	x5, sp, #1
	str	q9, [x1, 1664]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z7.h
	add	x5, x5, 64
	movprfx	z29, z22
	sdot	z29.d, z20.h, z7.h
	sdot	z29.d, z19.h, z8.h
	sdot	z9.d, z21.h, z8.h
	uzp1	z9.s, z9.s, z29.s
	ldr	z29, [x5]
	addvl	x5, sp, #5
	rshrnb	z9.h, z9.s, #4
	uzp1	z9.h, z9.h, z9.h
	add	x5, x5, 64
	ldr	z21, [x5]
	zip1	z29.d, z29.d, z21.d
	addvl	x5, sp, #3
	add	x5, x5, 64
	ldr	z21, [x5]
	addvl	x5, sp, #7
	add	x5, x5, 64
	ldr	z20, [x5]
	zip1	z21.d, z21.d, z20.d
	addvl	x5, sp, #9
	zip1	z21.d, z29.d, z21.d
	add	x5, x5, 64
	ldr	z29, [x5]
	addvl	x5, sp, #13
	add	x5, x5, 64
	ldr	z20, [x5]
	zip1	z29.d, z29.d, z20.d
	addvl	x5, sp, #11
	add	x5, x5, 64
	ldr	z20, [x5]
	addvl	x5, sp, #15
	add	x5, x5, 64
	ldr	z19, [x5]
	zip1	z20.d, z20.d, z19.d
	add	x5, x3, 2592
	zip1	z29.d, z29.d, z20.d
	ld1h	z19.h, p7/z, [x5]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	str	q9, [x1, 1920]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #4
	uzp1	z20.h, z20.h, z20.h
	add	x5, x3, 2624
	ld1h	z19.h, p7/z, [x5]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	str	q20, [x1, 256]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #4
	uzp1	z20.h, z20.h, z20.h
	add	x5, x3, 2656
	str	q20, [x1, 768]
	ld1h	z19.h, p7/z, [x5]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #4
	uzp1	z20.h, z20.h, z20.h
	add	x5, x3, 2688
	ld1h	z19.h, p7/z, [x5]
	str	q20, [x1, 1280]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	zip1	z21.d, z25.d, z16.d
	sdot	z22.d, z29.h, z19.h
	zip2	z25.d, z25.d, z16.d
	zip1	z29.d, z15.d, z30.d
	uzp1	z20.s, z20.s, z22.s
	zip2	z30.d, z15.d, z30.d
	zip1	z22.d, z29.d, z21.d
	rshrnb	z20.h, z20.s, #4
	zip2	z29.d, z29.d, z21.d
	uzp1	z20.h, z20.h, z20.h
	zip1	z21.d, z30.d, z25.d
	str	q20, [x1, 1792]
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z25.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z20.d, z10.d, z27.d
	zip1	z25.d, z23.d, z11.d
	zip2	z27.d, z10.d, z27.d
	zip2	z23.d, z23.d, z11.d
	zip1	z16.d, z20.d, z25.d
	zip1	z19.d, z27.d, z23.d
	zip2	z20.d, z20.d, z25.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z23.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	saddlb	z23.s, z30.h, z16.h
	saddlt	z30.s, z30.h, z16.h
	saddlb	z25.s, z22.h, z27.h
	saddlt	z27.s, z22.h, z27.h
	add	z25.s, z25.s, z23.s
	add	z27.s, z27.s, z30.s
	saddlb	z23.s, z29.h, z19.h
	saddlb	z30.s, z21.h, z20.h
	saddlt	z29.s, z29.h, z19.h
	saddlt	z21.s, z21.h, z20.h
	add	z23.s, z23.s, z30.s
	add	z29.s, z29.s, z21.s
#APP
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z30.s, z25.s, z27.s
	zip2	z25.s, z25.s, z27.s
	zip1	z22.s, z29.s, z23.s
	zip2	z29.s, z29.s, z23.s
	add	z30.s, z30.s, z22.s
	add	z29.s, z25.s, z29.s
	uzp2	z25.d, z30.d, z29.d
#APP
// 42 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z30.d, z30.d, z29.d
	add	x5, x3, 2720
	add	z27.s, z25.s, z30.s
	ld1w	z22.s, p7/z, [x5]
	sub	z30.s, z30.s, z25.s
	movprfx	z23, z27
	mul	z23.s, p7/m, z23.s, z22.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	add	x5, x3, 2752
	uzp1	z23.s, z23.s, z23.s
	ld1w	z29.s, p7/z, [x5]
	rshrnb	z23.h, z23.s, #4
	movprfx	z25, z30
	mul	z25.s, p7/m, z25.s, z29.s
	uzp1	z23.h, z23.h, z23.h
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	uzp1	z25.s, z25.s, z25.s
	rshrnb	z25.h, z25.s, #4
	uzp1	z25.h, z25.h, z25.h
	add	x5, x3, 2784
	str	d25, [x1, 512]
	ld1w	z25.s, p7/z, [x5]
	mul	z27.s, p7/m, z27.s, z25.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	uzp1	z27.h, z27.h, z27.h
	add	x5, x3, 2816
	str	d27, [x1, 1024]
	ld1w	z27.s, p7/z, [x5]
	mul	z30.s, p7/m, z30.s, z27.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	zip1	z21.d, z26.d, z18.d
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #4
	uzp1	z30.h, z30.h, z30.h
	zip2	z26.d, z26.d, z18.d
	str	d30, [x1, 1536]
	zip1	z30.d, z31.d, z17.d
	zip2	z31.d, z31.d, z17.d
	zip1	z20.d, z30.d, z21.d
	zip2	z30.d, z30.d, z21.d
	zip1	z21.d, z31.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip1	z19.d, z28.d, z13.d
	zip1	z26.d, z24.d, z14.d
	zip2	z28.d, z28.d, z13.d
	zip2	z24.d, z24.d, z14.d
	zip1	z17.d, z19.d, z26.d
	zip1	z18.d, z28.d, z24.d
	zip2	z19.d, z19.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z24.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z24.s, z31.h, z17.h
	saddlt	z31.s, z31.h, z17.h
	saddlb	z26.s, z20.h, z28.h
	saddlt	z28.s, z20.h, z28.h
	add	z26.s, z26.s, z24.s
	add	z28.s, z28.s, z31.s
	saddlb	z24.s, z30.h, z18.h
	saddlb	z31.s, z21.h, z19.h
	saddlt	z30.s, z30.h, z18.h
	saddlt	z21.s, z21.h, z19.h
	add	z24.s, z24.s, z31.s
	add	z30.s, z30.s, z21.s
#APP
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z26.s, z28.s
	zip1	z21.s, z30.s, z24.s
	zip2	z26.s, z26.s, z28.s
	add	z31.s, z31.s, z21.s
	zip2	z30.s, z30.s, z24.s
	add	z30.s, z26.s, z30.s
	uzp2	z28.d, z31.d, z30.d
#APP
// 42 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z30.d
	add	z30.s, z28.s, z31.s
	sub	z31.s, z31.s, z28.s
	movprfx	z28, z30
	mul	z28.s, p7/m, z28.s, z22.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	uzp1	z28.s, z28.s, z28.s
	mul	z29.s, p7/m, z29.s, z31.s
	rshrnb	z28.h, z28.s, #4
	uzp1	z28.h, z28.h, z28.h
	stp	d23, d28, [x1]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	uzp1	z29.s, z29.s, z29.s
	mul	z30.s, p7/m, z30.s, z25.s
	rshrnb	z29.h, z29.s, #4
	uzp1	z29.h, z29.h, z29.h
	str	d29, [x1, 520]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z30.s, z30.s
	mul	z31.s, p7/m, z31.s, z27.s
	rshrnb	z30.h, z30.s, #4
	uzp1	z30.h, z30.h, z30.h
	str	d30, [x1, 1032]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	uzp1	z31.s, z31.s, z31.s
	add	x1, x1, 16
	rshrnb	z31.h, z31.s, #4
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x1, 1528]
	add	x4, x4, x2, lsl 4
	cmp	x14, x1
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
	addvl	sp, sp, #27
	.cfi_def_cfa_offset 64
	add	sp, sp, 64
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE9:
	.size	_ZL9op_pass_4PKsPsl, .-_ZL9op_pass_4PKsPsl
	.align	2
	.p2align 5,,15
	.type	_ZL10op_pass_11PKsPsl.constprop.0, %function
_ZL10op_pass_11PKsPsl.constprop.0:
.LFB12:
	.cfi_startproc
	addvl	sp, sp, #-27
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xd8,0x1e,0x22
	adrp	x2, .LANCHOR0
	ptrue	p7.b, all
	sub	sp, sp, #96
	.cfi_escape 0xf,0xb,0x8f,0,0x92,0x2e,0,0x8,0xd8,0x1e,0x23,0x60,0x22
	add	x2, x2, :lo12:.LANCHOR0
	add	x4, x2, 64
	add	x18, x0, 96
	add	x17, x0, 128
	add	x16, x0, 160
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	add	x30, x0, 64
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #16
	str	x19, [sp, 16]
	add	x4, x4, 96
	stp	d8, d9, [sp, 32]
	add	x15, x0, 192
	add	x14, x0, 224
	stp	d10, d11, [sp, 48]
	add	x13, x0, 256
	add	x12, x0, 288
	stp	d12, d13, [sp, 64]
	add	x11, x0, 320
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x48,0x2,0x8f,0x20
	.cfi_escape 0x10,0x49,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x38
	.cfi_escape 0x10,0x4c,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x4d,0x3,0x8f,0xc8,0
	ld1h	z12.h, p7/z, [x2]
	add	x10, x0, 352
	stp	d14, d15, [sp, 80]
	.cfi_escape 0x10,0x4e,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x4f,0x3,0x8f,0xd8,0
	add	x9, x0, 384
	str	z31, [x4]
	add	x4, x2, 96
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #17
	add	x8, x0, 416
	add	x4, x4, 96
	str	z31, [x4]
	add	x7, x0, 448
	add	x4, x2, 128
	ld1h	z31.h, p7/z, [x4]
	add	x6, x0, 480
	addvl	x4, sp, #18
	add	x5, x2, 32
	add	x4, x4, 96
	str	z31, [x4]
	add	x19, x0, 32
	add	x4, x2, 160
	ld1h	z31.h, p7/z, [x4]
	mov	x3, 0
	addvl	x4, sp, #19
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 192
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #20
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 224
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #21
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 256
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 288
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #23
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 320
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #24
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 352
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #25
	add	x4, x4, 96
	str	z31, [x4]
	add	x4, x2, 384
	ld1h	z31.h, p7/z, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 96
	str	z31, [x4]
.L7:
	add	x4, sp, 96
	ld1h	z15.h, p7/z, [x0, x3, lsl 1]
	ld1h	z10.h, p7/z, [x19, x3, lsl 1]
	rev	z31.h, z10.h
	sub	z20.h, z15.h, z31.h
	add	z31.h, z15.h, z31.h
	rev	z30.h, z31.h
	sub	z29.h, z31.h, z30.h
	str	z29, [x4]
	addvl	x4, sp, #1
	add	z31.h, z31.h, z30.h
	tbl	z30.h, {z31.h}, z12.h
	add	x4, x4, 96
	sub	z31.h, z31.h, z30.h
	str	z31, [x4]
	addvl	x4, sp, #2
	ld1h	z25.h, p7/z, [x30, x3, lsl 1]
	ld1h	z23.h, p7/z, [x18, x3, lsl 1]
	add	x4, x4, 96
	rev	z31.h, z23.h
	sub	z19.h, z25.h, z31.h
	add	z31.h, z25.h, z31.h
	rev	z30.h, z31.h
	sub	z28.h, z31.h, z30.h
	str	z28, [x4]
	addvl	x4, sp, #3
	add	z31.h, z31.h, z30.h
	add	x4, x4, 96
	tbl	z30.h, {z31.h}, z12.h
	sub	z30.h, z31.h, z30.h
	str	z30, [x4]
	addvl	x4, sp, #4
	ld1h	z30.h, p7/z, [x17, x3, lsl 1]
	add	x4, x4, 96
	ld1h	z27.h, p7/z, [x16, x3, lsl 1]
	rev	z31.h, z27.h
	sub	z6.h, z30.h, z31.h
	add	z31.h, z30.h, z31.h
	rev	z28.h, z31.h
	sub	z9.h, z31.h, z28.h
	str	z9, [x4]
	addvl	x4, sp, #5
	add	x4, x4, 96
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z12.h
	sub	z26.h, z31.h, z28.h
	str	z26, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 96
	ld1h	z16.h, p7/z, [x15, x3, lsl 1]
	ld1h	z11.h, p7/z, [x14, x3, lsl 1]
	rev	z31.h, z11.h
	sub	z7.h, z16.h, z31.h
	add	z31.h, z16.h, z31.h
	rev	z28.h, z31.h
	sub	z8.h, z31.h, z28.h
	str	z8, [x4]
	addvl	x4, sp, #7
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z12.h
	add	x4, x4, 96
	sub	z24.h, z31.h, z28.h
	str	z24, [x4]
	addvl	x4, sp, #8
	ld1h	z31.h, p7/z, [x13, x3, lsl 1]
	ld1h	z28.h, p7/z, [x12, x3, lsl 1]
	add	x4, x4, 96
	rev	z26.h, z28.h
	sub	z22.h, z31.h, z26.h
	add	z26.h, z31.h, z26.h
	rev	z24.h, z26.h
	sub	z21.h, z26.h, z24.h
	str	z21, [x4]
	addvl	x4, sp, #9
	add	z26.h, z26.h, z24.h
	add	x4, x4, 96
	tbl	z24.h, {z26.h}, z12.h
	sub	z18.h, z26.h, z24.h
	str	z18, [x4]
	addvl	x4, sp, #10
	ld1h	z26.h, p7/z, [x11, x3, lsl 1]
	add	x4, x4, 96
	ld1h	z24.h, p7/z, [x10, x3, lsl 1]
	rev	z18.h, z24.h
	sub	z21.h, z26.h, z18.h
	add	z18.h, z26.h, z18.h
	rev	z17.h, z18.h
	sub	z14.h, z18.h, z17.h
	str	z14, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 96
	add	z18.h, z18.h, z17.h
	tbl	z17.h, {z18.h}, z12.h
	sub	z17.h, z18.h, z17.h
	str	z17, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 96
	ld1h	z17.h, p7/z, [x9, x3, lsl 1]
	ld1h	z13.h, p7/z, [x8, x3, lsl 1]
	rev	z18.h, z13.h
	sub	z8.h, z17.h, z18.h
	add	z18.h, z17.h, z18.h
	rev	z14.h, z18.h
	sub	z5.h, z18.h, z14.h
	str	z5, [x4]
	addvl	x4, sp, #13
	add	z18.h, z18.h, z14.h
	tbl	z14.h, {z18.h}, z12.h
	add	x4, x4, 96
	sub	z4.h, z18.h, z14.h
	str	z4, [x4]
	addvl	x4, sp, #14
	ld1h	z18.h, p7/z, [x7, x3, lsl 1]
	ld1h	z14.h, p7/z, [x6, x3, lsl 1]
	add	x4, x4, 96
	rev	z3.h, z14.h
	sub	z9.h, z18.h, z3.h
	add	z3.h, z18.h, z3.h
	rev	z2.h, z3.h
	sub	z4.h, z3.h, z2.h
	str	z4, [x4]
	addvl	x4, sp, #15
	add	z3.h, z3.h, z2.h
	add	x4, x4, 96
	tbl	z2.h, {z3.h}, z12.h
	sub	z3.h, z3.h, z2.h
	zip1	z1.d, z20.d, z6.d
	trn2	z2.d, z19.d, z7.d
	zip1	z0.d, z19.d, z7.d
	trn1	z19.d, z19.d, z7.d
	str	z3, [x4]
	trn2	z3.d, z20.d, z6.d
	addvl	x4, sp, #16
	trn1	z20.d, z20.d, z6.d
	zip1	z6.d, z21.d, z9.d
	zip2	z29.d, z20.d, z19.d
	add	x4, x4, 96
	trn2	z20.d, z22.d, z8.d
	trn2	z19.d, z21.d, z9.d
	zip1	z0.d, z1.d, z0.d
	zip2	z5.d, z20.d, z19.d
	zip1	z1.d, z3.d, z2.d
	zip1	z7.d, z22.d, z8.d
	zip2	z3.d, z3.d, z2.d
	zip1	z2.d, z7.d, z6.d
	zip1	z6.d, z20.d, z19.d
	ld1h	z19.h, p7/z, [x5]
	ldr	z20, [x4]
	addvl	x4, sp, #17
	trn1	z21.d, z21.d, z9.d
	add	x4, x4, 96
	ldr	z9, [x4]
	trn1	z22.d, z22.d, z8.d
	addvl	x4, sp, #18
	zip2	z4.d, z22.d, z21.d
	movi	d22, #0
	add	x4, x4, 96
	ldr	z7, [x4]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z19.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z7.h
	mov	z7.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z19.h
	ldr	z19, [x4]
	addvl	x4, sp, #20
	sdot	z20.d, z4.h, z9.h
	add	x4, x4, 96
	sdot	z20.d, z5.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	ldr	z20, [x4]
	addvl	x4, sp, #19
	rshrnb	z21.h, z21.s, #11
	add	x4, x4, 96
	ldr	z7, [x4]
	uzp1	z21.h, z21.h, z21.h
	addvl	x4, sp, #21
	ptrue	p6.d, all
	add	x4, x4, 96
	ldr	z9, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 96
	ldr	z19, [x4]
	str	q21, [x1, 64]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z7.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z19.h
	mov	z19.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z19.h
	ldr	z19, [x4]
	addvl	x4, sp, #24
	sdot	z20.d, z2.h, z7.h
	add	x4, x4, 96
	sdot	z20.d, z4.h, z9.h
	sdot	z20.d, z5.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	ldr	z20, [x4]
	addvl	x4, sp, #23
	add	x4, x4, 96
	ldr	z7, [x4]
	rshrnb	z21.h, z21.s, #11
	addvl	x4, sp, #25
	uzp1	z21.h, z21.h, z21.h
	add	x4, x4, 96
	ldr	z9, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 96
	ldr	z19, [x4]
	str	q21, [x1, 192]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z20.h
	sdot	z21.d, z0.h, z7.h
	sdot	z21.d, z29.h, z9.h
	sdot	z21.d, z3.h, z19.h
	mov	z19.d, z20.d
	movprfx	z20, z22
	sdot	z20.d, z6.h, z19.h
	ldr	z19, [x4]
	add	x4, x2, 416
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 448
	sdot	z20.d, z2.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 480
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 512
	sdot	z20.d, z5.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 544
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 320]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 576
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 608
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 640
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 672
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 448]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 704
	ld1h	z7.h, p7/z, [x4]
	sdot	z20.d, z4.h, z9.h
	add	x4, x2, 736
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 768
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 800
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 576]
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z21.d, z0.h, z8.h
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 704]
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 832
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 864
	ld1h	z9.h, p7/z, [x4]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	add	x4, x2, 896
	ld1h	z19.h, p7/z, [x4]
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	add	x4, x2, 928
	sdot	z21.d, z0.h, z8.h
	sdot	z20.d, z2.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 960
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 992
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1024
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1056
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 832]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1088
	ld1h	z7.h, p7/z, [x4]
	sdot	z20.d, z4.h, z9.h
	add	x4, x2, 1120
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1152
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1184
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 960]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1216
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 1248
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1280
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1312
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1088]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1344
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 1376
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1408
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1440
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1216]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1472
	ld1h	z7.h, p7/z, [x4]
	sdot	z20.d, z4.h, z9.h
	add	x4, x2, 1504
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1536
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1568
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1344]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1600
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 1632
	sdot	z20.d, z4.h, z9.h
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	uzp1	z21.s, z21.s, z20.s
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 1472]
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1664
	ld1h	z19.h, p7/z, [x4]
	add	x4, x2, 1696
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1728
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 1760
	sdot	z21.d, z29.h, z9.h
	sdot	z20.d, z4.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1792
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1824
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	str	q21, [x1, 1600]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 1856
	ld1h	z7.h, p7/z, [x4]
	sdot	z20.d, z4.h, z9.h
	add	x4, x2, 1888
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1920
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	uzp1	z21.s, z21.s, z20.s
	add	x4, x2, 1952
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	movprfx	z20, z22
	sdot	z20.d, z6.h, z7.h
	sdot	z20.d, z2.h, z8.h
	sdot	z20.d, z4.h, z9.h
	str	q21, [x1, 1728]
	movprfx	z21, z22
	sdot	z21.d, z1.h, z7.h
	sdot	z21.d, z0.h, z8.h
	sdot	z21.d, z29.h, z9.h
	ld1h	z9.h, p7/z, [x4]
	add	x4, x2, 1984
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 2016
	sdot	z20.d, z5.h, z19.h
	sdot	z21.d, z3.h, z19.h
	ld1h	z19.h, p7/z, [x4]
	add	x4, x2, 2048
	uzp1	z21.s, z21.s, z20.s
	ld1h	z20.h, p7/z, [x4]
	rshrnb	z21.h, z21.s, #11
	add	x4, sp, 96
	uzp1	z21.h, z21.h, z21.h
	str	q21, [x1, 1856]
	movprfx	z7, z22
	sdot	z7.d, z6.h, z8.h
	movprfx	z21, z22
	sdot	z21.d, z1.h, z8.h
	sdot	z21.d, z0.h, z9.h
	sdot	z21.d, z29.h, z19.h
	ldr	z29, [x4]
	addvl	x4, sp, #4
	sdot	z7.d, z2.h, z9.h
	add	x4, x4, 96
	ldr	z9, [x4]
	sdot	z7.d, z4.h, z19.h
	addvl	x4, sp, #2
	sdot	z7.d, z5.h, z20.h
	sdot	z21.d, z3.h, z20.h
	add	x4, x4, 96
	ldr	z19, [x4]
	uzp1	z21.s, z21.s, z7.s
	addvl	x4, sp, #6
	rshrnb	z21.h, z21.s, #11
	uzp1	z21.h, z21.h, z21.h
	add	x4, x4, 96
	ldr	z2, [x4]
	zip1	z20.d, z19.d, z2.d
	str	q21, [x1, 1984]
	zip1	z21.d, z29.d, z9.d
	zip1	z21.d, z21.d, z20.d
	mov	z20.d, z19.d
	ldr	z19, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 96
	trn2	z29.d, z29.d, z9.d
	ldr	z9, [x4]
	addvl	x4, sp, #12
	trn2	z20.d, z20.d, z19.d
	zip1	z29.d, z29.d, z20.d
	add	x4, x4, 96
	ldr	z7, [x4]
	zip1	z19.d, z9.d, z7.d
	addvl	x4, sp, #10
	add	x4, x4, 96
	ldr	z8, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 96
	ldr	z5, [x4]
	zip1	z20.d, z8.d, z5.d
	zip1	z19.d, z19.d, z20.d
	trn2	z20.d, z9.d, z7.d
	mov	z9.d, z8.d
	ldr	z8, [x4]
	add	x4, x2, 2080
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2112
	trn2	z9.d, z9.d, z8.d
	ld1h	z6.h, p7/z, [x4]
	add	x4, x2, 2144
	zip1	z20.d, z20.d, z9.d
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z9.d, z21.h, z7.h
	sdot	z8.d, z19.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2176
	uzp1	z9.s, z9.s, z8.s
	rshrnb	z9.h, z9.s, #11
	uzp1	z9.h, z9.h, z9.h
	str	q9, [x1, 128]
	ld1h	z6.h, p7/z, [x4]
	add	x4, x2, 2208
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z9.d, z21.h, z7.h
	sdot	z8.d, z19.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2240
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x4]
	rshrnb	z9.h, z9.s, #11
	add	x4, x2, 2272
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 384]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2304
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x4]
	rshrnb	z9.h, z9.s, #11
	add	x4, x2, 2336
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 640]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2368
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x4]
	rshrnb	z9.h, z9.s, #11
	add	x4, x2, 2400
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 896]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2432
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x4]
	rshrnb	z9.h, z9.s, #11
	add	x4, x2, 2464
	uzp1	z9.h, z9.h, z9.h
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	sdot	z8.d, z19.h, z7.h
	str	q9, [x1, 1152]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	ld1h	z7.h, p7/z, [x4]
	add	x4, x2, 2496
	uzp1	z9.s, z9.s, z8.s
	ld1h	z6.h, p7/z, [x4]
	rshrnb	z9.h, z9.s, #11
	movprfx	z8, z22
	sdot	z8.d, z20.h, z6.h
	add	x4, x2, 2528
	sdot	z8.d, z19.h, z7.h
	uzp1	z9.h, z9.h, z9.h
	str	q9, [x1, 1408]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z6.h
	sdot	z9.d, z21.h, z7.h
	uzp1	z9.s, z9.s, z8.s
	ld1h	z8.h, p7/z, [x4]
	add	x4, x2, 2560
	rshrnb	z9.h, z9.s, #11
	ld1h	z7.h, p7/z, [x4]
	uzp1	z9.h, z9.h, z9.h
	addvl	x4, sp, #1
	str	q9, [x1, 1664]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z7.h
	add	x4, x4, 96
	movprfx	z29, z22
	sdot	z29.d, z20.h, z7.h
	sdot	z29.d, z19.h, z8.h
	sdot	z9.d, z21.h, z8.h
	uzp1	z9.s, z9.s, z29.s
	ldr	z29, [x4]
	addvl	x4, sp, #5
	rshrnb	z9.h, z9.s, #11
	uzp1	z9.h, z9.h, z9.h
	add	x4, x4, 96
	ldr	z21, [x4]
	zip1	z29.d, z29.d, z21.d
	addvl	x4, sp, #3
	add	x4, x4, 96
	ldr	z21, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 96
	ldr	z20, [x4]
	zip1	z21.d, z21.d, z20.d
	addvl	x4, sp, #9
	zip1	z21.d, z29.d, z21.d
	add	x4, x4, 96
	ldr	z29, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 96
	ldr	z20, [x4]
	zip1	z29.d, z29.d, z20.d
	addvl	x4, sp, #11
	add	x4, x4, 96
	ldr	z20, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 96
	ldr	z19, [x4]
	zip1	z20.d, z20.d, z19.d
	add	x4, x2, 2592
	zip1	z29.d, z29.d, z20.d
	ld1h	z19.h, p7/z, [x4]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	str	q9, [x1, 1920]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #11
	uzp1	z20.h, z20.h, z20.h
	add	x4, x2, 2624
	ld1h	z19.h, p7/z, [x4]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	str	q20, [x1, 256]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #11
	uzp1	z20.h, z20.h, z20.h
	add	x4, x2, 2656
	str	q20, [x1, 768]
	ld1h	z19.h, p7/z, [x4]
	movprfx	z9, z22
	sdot	z9.d, z29.h, z19.h
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	uzp1	z20.s, z20.s, z9.s
	rshrnb	z20.h, z20.s, #11
	uzp1	z20.h, z20.h, z20.h
	add	x4, x2, 2688
	ld1h	z19.h, p7/z, [x4]
	str	q20, [x1, 1280]
	movprfx	z20, z22
	sdot	z20.d, z21.h, z19.h
	zip1	z21.d, z25.d, z16.d
	sdot	z22.d, z29.h, z19.h
	zip2	z25.d, z25.d, z16.d
	zip1	z29.d, z15.d, z30.d
	uzp1	z20.s, z20.s, z22.s
	zip2	z30.d, z15.d, z30.d
	zip1	z22.d, z29.d, z21.d
	rshrnb	z20.h, z20.s, #11
	zip2	z29.d, z29.d, z21.d
	uzp1	z20.h, z20.h, z20.h
	zip1	z21.d, z30.d, z25.d
	str	q20, [x1, 1792]
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z30.d, z30.d, z25.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z20.d, z10.d, z27.d
	zip1	z25.d, z23.d, z11.d
	zip2	z27.d, z10.d, z27.d
	zip2	z23.d, z23.d, z11.d
	zip1	z16.d, z20.d, z25.d
	zip1	z19.d, z27.d, z23.d
	zip2	z20.d, z20.d, z25.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z19.d, p6/m, z19.d
// 0 "" 2
#NO_APP
	zip2	z27.d, z27.d, z23.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z27.d, p6/m, z27.d
// 0 "" 2
#NO_APP
	saddlb	z23.s, z30.h, z16.h
	saddlt	z30.s, z30.h, z16.h
	saddlb	z25.s, z22.h, z27.h
	saddlt	z27.s, z22.h, z27.h
	add	z25.s, z25.s, z23.s
	add	z27.s, z27.s, z30.s
	saddlb	z23.s, z29.h, z19.h
	saddlb	z30.s, z21.h, z20.h
	saddlt	z29.s, z29.h, z19.h
	saddlt	z21.s, z21.h, z20.h
	add	z23.s, z23.s, z30.s
	add	z29.s, z29.s, z21.s
#APP
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z23.d, p6/m, z23.d
// 0 "" 2
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z29.d, p6/m, z29.d
// 0 "" 2
#NO_APP
	zip1	z30.s, z25.s, z27.s
	zip2	z25.s, z25.s, z27.s
	zip1	z22.s, z29.s, z23.s
	zip2	z29.s, z29.s, z23.s
	add	z30.s, z30.s, z22.s
	add	z29.s, z25.s, z29.s
	uzp2	z25.d, z30.d, z29.d
#APP
// 42 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z25.d, p6/m, z25.d
// 0 "" 2
#NO_APP
	ptrue	p5.s, all
	uzp1	z30.d, z30.d, z29.d
	add	x4, x2, 2720
	add	z27.s, z25.s, z30.s
	ld1w	z22.s, p7/z, [x4]
	sub	z30.s, z30.s, z25.s
	movprfx	z23, z27
	mul	z23.s, p7/m, z23.s, z22.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z23.s, p5/m, z23.s, z23.s
// 0 "" 2
#NO_APP
	add	x4, x2, 2752
	uzp1	z23.s, z23.s, z23.s
	ld1w	z29.s, p7/z, [x4]
	rshrnb	z23.h, z23.s, #11
	movprfx	z25, z30
	mul	z25.s, p7/m, z25.s, z29.s
	uzp1	z23.h, z23.h, z23.h
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z25.s, p5/m, z25.s, z25.s
// 0 "" 2
#NO_APP
	uzp1	z25.s, z25.s, z25.s
	rshrnb	z25.h, z25.s, #11
	uzp1	z25.h, z25.h, z25.h
	add	x4, x2, 2784
	str	d25, [x1, 512]
	ld1w	z25.s, p7/z, [x4]
	mul	z27.s, p7/m, z27.s, z25.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z27.s, p5/m, z27.s, z27.s
// 0 "" 2
#NO_APP
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	uzp1	z27.h, z27.h, z27.h
	add	x4, x2, 2816
	str	d27, [x1, 1024]
	ld1w	z27.s, p7/z, [x4]
	mul	z30.s, p7/m, z30.s, z27.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	zip1	z21.d, z26.d, z18.d
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	zip2	z26.d, z26.d, z18.d
	str	d30, [x1, 1536]
	zip1	z30.d, z31.d, z17.d
	zip2	z31.d, z31.d, z17.d
	zip1	z20.d, z30.d, z21.d
	zip2	z30.d, z30.d, z21.d
	zip1	z21.d, z31.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z21.d, p6/m, z21.d
// 0 "" 2
#NO_APP
	zip2	z31.d, z31.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z31.d, p6/m, z31.d
// 0 "" 2
#NO_APP
	zip1	z19.d, z28.d, z13.d
	zip1	z26.d, z24.d, z14.d
	zip2	z28.d, z28.d, z13.d
	zip2	z24.d, z24.d, z14.d
	zip1	z17.d, z19.d, z26.d
	zip1	z18.d, z28.d, z24.d
	zip2	z19.d, z19.d, z26.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z18.d, p6/m, z18.d
// 0 "" 2
#NO_APP
	zip2	z28.d, z28.d, z24.d
#APP
// 24 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revh z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	saddlb	z24.s, z31.h, z17.h
	saddlt	z31.s, z31.h, z17.h
	saddlb	z26.s, z20.h, z28.h
	saddlt	z28.s, z20.h, z28.h
	add	z26.s, z26.s, z24.s
	add	z28.s, z28.s, z31.s
	saddlb	z24.s, z30.h, z18.h
	saddlb	z31.s, z21.h, z19.h
	saddlt	z30.s, z30.h, z18.h
	saddlt	z21.s, z21.h, z19.h
	add	z24.s, z24.s, z31.s
	add	z30.s, z30.s, z21.s
#APP
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z24.d, p6/m, z24.d
// 0 "" 2
// 33 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z30.d, p6/m, z30.d
// 0 "" 2
#NO_APP
	zip1	z31.s, z26.s, z28.s
	zip1	z21.s, z30.s, z24.s
	zip2	z26.s, z26.s, z28.s
	add	z31.s, z31.s, z21.s
	zip2	z30.s, z30.s, z24.s
	add	z30.s, z26.s, z30.s
	uzp2	z28.d, z31.d, z30.d
#APP
// 42 "kernels/dct32/candidates/best_op_r8.cpp" 1
	revw z28.d, p6/m, z28.d
// 0 "" 2
#NO_APP
	uzp1	z31.d, z31.d, z30.d
	add	z30.s, z28.s, z31.s
	sub	z31.s, z31.s, z28.s
	movprfx	z28, z30
	mul	z28.s, p7/m, z28.s, z22.s
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z28.s, p5/m, z28.s, z28.s
// 0 "" 2
#NO_APP
	uzp1	z28.s, z28.s, z28.s
	mul	z29.s, p7/m, z29.s, z31.s
	rshrnb	z28.h, z28.s, #11
	uzp1	z28.h, z28.h, z28.h
	stp	d23, d28, [x1]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z29.s, p5/m, z29.s, z29.s
// 0 "" 2
#NO_APP
	uzp1	z29.s, z29.s, z29.s
	mul	z30.s, p7/m, z30.s, z25.s
	rshrnb	z29.h, z29.s, #11
	uzp1	z29.h, z29.h, z29.h
	str	d29, [x1, 520]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z30.s, p5/m, z30.s, z30.s
// 0 "" 2
#NO_APP
	uzp1	z30.s, z30.s, z30.s
	mul	z31.s, p7/m, z31.s, z27.s
	rshrnb	z30.h, z30.s, #11
	uzp1	z30.h, z30.h, z30.h
	str	d30, [x1, 1032]
#APP
// 51 "kernels/dct32/candidates/best_op_r8.cpp" 1
	addp z31.s, p5/m, z31.s, z31.s
// 0 "" 2
#NO_APP
	uzp1	z31.s, z31.s, z31.s
	add	x3, x3, 256
	rshrnb	z31.h, z31.s, #11
	uzp1	z31.h, z31.h, z31.h
	str	d31, [x1, 1544]
	add	x1, x1, 16
	cmp	x3, 1024
	bne	.L7
	ldr	x19, [sp, 16]
	ldp	x29, x30, [sp]
	ldp	d8, d9, [sp, 32]
	ldp	d10, d11, [sp, 48]
	ldp	d12, d13, [sp, 64]
	ldp	d14, d15, [sp, 80]
	.cfi_restore 19
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
	addvl	sp, sp, #27
	.cfi_def_cfa_offset 96
	add	sp, sp, 96
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE12:
	.size	_ZL10op_pass_11PKsPsl.constprop.0, .-_ZL10op_pass_11PKsPsl.constprop.0
	.align	2
	.p2align 5,,15
	.global	dynopt_dct32_sve2_shared
	.type	dynopt_dct32_sve2_shared, %function
dynopt_dct32_sve2_shared:
.LFB11:
	.cfi_startproc
	sub	sp, sp, #2064
	.cfi_def_cfa_offset 2064
	mov	x15, x1
	add	x1, sp, 16
	stp	x29, x30, [sp]
	.cfi_offset 29, -2064
	.cfi_offset 30, -2056
	mov	x29, sp
	bl	_ZL9op_pass_4PKsPsl
	add	x0, sp, 16
	mov	x1, x15
	bl	_ZL10op_pass_11PKsPsl.constprop.0
	ldp	x29, x30, [sp]
	add	sp, sp, 2064
	.cfi_restore 29
	.cfi_restore 30
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE11:
	.size	dynopt_dct32_sve2_shared, .-dynopt_dct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
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
	.type	_ZL6K0EVEN, %object
	.size	_ZL6K0EVEN, 128
_ZL6K0EVEN:
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	64
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	83
	.word	36
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	64
	.word	-64
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.word	36
	.word	-83
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
