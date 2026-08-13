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
	mov	x8, x2
	ptrue	p7.b, all
	sub	sp, sp, #272
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x23,0x90,0x2,0x22
	adrp	x2, .LANCHOR0
	add	x12, x0, x8, lsl 1
	add	x0, x0, 32
	add	x11, x0, x8, lsl 1
	add	x0, x1, 64
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	mov	x10, x1
	add	x9, x8, x8, lsl 1
	stp	x25, x26, [sp, 64]
	.cfi_escape 0x10,0x19,0x3,0x8f,0xc0,0
	.cfi_escape 0x10,0x1a,0x3,0x8f,0xc8,0
	add	x26, x2, :lo12:.LANCHOR0
	add	x2, x26, 32
	str	x0, [sp, 248]
	add	x0, x8, x8, lsl 2
	str	x0, [sp, 256]
	add	x0, x26, 64
	str	x0, [sp, 264]
	add	x0, x26, 96
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #17
	stp	x19, x20, [sp, 16]
	add	x0, x0, 272
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
	.cfi_escape 0x10,0x17,0x2,0x8f,0x30
	.cfi_escape 0x10,0x18,0x2,0x8f,0x38
	.cfi_escape 0x10,0x1b,0x3,0x8f,0xd0,0
	.cfi_escape 0x10,0x1c,0x3,0x8f,0xd8,0
	.cfi_escape 0x10,0x48,0x3,0x8f,0xe0,0
	.cfi_escape 0x10,0x49,0x3,0x8f,0xe8,0
	.cfi_escape 0x10,0x4a,0x3,0x8f,0xf0,0
	.cfi_escape 0x10,0x4b,0x3,0x8f,0xf8,0
	.cfi_escape 0x10,0x4c,0x3,0x8f,0x80,0x1
	.cfi_escape 0x10,0x4d,0x3,0x8f,0x88,0x1
	ld1w	z13.s, p7/z, [x26]
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	ld1h	z14.h, p7/z, [x2]
	str	z31, [x0]
	add	x0, x26, 128
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 160
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 192
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 224
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 256
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 288
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 320
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 352
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 384
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #26
	add	x0, x0, 272
	str	z31, [x0]
	add	x0, x26, 416
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 272
	str	z31, [x0]
.L2:
	sub	x0, x12, x8, lsl 1
	ld1h	z31.h, p7/z, [x0]
	sunpklo	z30.s, z31.h
	sub	x0, x11, x8, lsl 1
	ld1h	z28.h, p7/z, [x0]
	rev	z28.h, z28.h
	sunpklo	z27.s, z28.h
	sub	z29.h, z31.h, z28.h
	sunpkhi	z26.s, z28.h
	add	x0, sp, 272
	add	z30.s, z30.s, z27.s
	sunpkhi	z27.s, z31.h
	add	z31.h, z31.h, z28.h
	rev	z28.h, z31.h
	sub	z20.h, z31.h, z28.h
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z14.h
	sub	z31.h, z31.h, z28.h
	str	z31, [x0]
	addvl	x0, sp, #1
	add	z27.s, z27.s, z26.s
	add	x0, x0, 272
	rev	z27.s, z27.s
	add	z30.s, z30.s, z27.s
	rev	z31.s, z30.s
	add	z31.s, z30.s, z31.s
	tbl	z30.s, {z31.s}, z13.s
	add	z28.s, z31.s, z30.s
	str	z28, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 272
	sub	z30.s, z31.s, z30.s
	ld1h	z27.h, p7/z, [x11]
	rev	z27.h, z27.h
	sunpklo	z26.s, z27.h
	str	z30, [x0]
	addvl	x0, sp, #3
	ld1h	z31.h, p7/z, [x12]
	sunpkhi	z25.s, z27.h
	sub	z30.h, z31.h, z27.h
	add	x0, x0, 272
	sunpklo	z28.s, z31.h
	add	z28.s, z28.s, z26.s
	sunpkhi	z26.s, z31.h
	add	z31.h, z31.h, z27.h
	rev	z27.h, z31.h
	sub	z21.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	tbl	z27.h, {z31.h}, z14.h
	sub	z27.h, z31.h, z27.h
	str	z27, [x0]
	addvl	x0, sp, #4
	add	z26.s, z26.s, z25.s
	rev	z26.s, z26.s
	add	x0, x0, 272
	add	z28.s, z28.s, z26.s
	rev	z31.s, z28.s
	add	z31.s, z28.s, z31.s
	tbl	z28.s, {z31.s}, z13.s
	add	z27.s, z31.s, z28.s
	str	z27, [x0]
	addvl	x0, sp, #5
	sub	z26.s, z31.s, z28.s
	add	x0, x0, 272
	str	z26, [x0]
	ld1h	z26.h, p7/z, [x11, x8, lsl 1]
	addvl	x0, sp, #6
	rev	z26.h, z26.h
	sunpklo	z25.s, z26.h
	ld1h	z31.h, p7/z, [x12, x8, lsl 1]
	sunpkhi	z24.s, z26.h
	sub	z28.h, z31.h, z26.h
	add	x0, x0, 272
	sunpklo	z27.s, z31.h
	add	z27.s, z27.s, z25.s
	sunpkhi	z25.s, z31.h
	add	z31.h, z31.h, z26.h
	add	z25.s, z25.s, z24.s
	rev	z26.h, z31.h
	rev	z25.s, z25.s
	sub	z15.h, z31.h, z26.h
	add	z27.s, z27.s, z25.s
	add	z31.h, z31.h, z26.h
	tbl	z26.h, {z31.h}, z14.h
	sub	z25.h, z31.h, z26.h
	str	z25, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 272
	rev	z31.s, z27.s
	add	z31.s, z27.s, z31.s
	tbl	z27.s, {z31.s}, z13.s
	add	z25.s, z31.s, z27.s
	str	z25, [x0]
	addvl	x0, sp, #8
	sub	z24.s, z31.s, z27.s
	addvl	x2, sp, #15
	add	x0, x0, 272
	str	z24, [x0]
	add	x2, x2, 272
	add	x0, x12, x8, lsl 2
	ld1h	z26.h, p7/z, [x0]
	sunpklo	z24.s, z26.h
	add	x0, x11, x8, lsl 2
	ld1h	z25.h, p7/z, [x0]
	rev	z25.h, z25.h
	addvl	x0, sp, #9
	sunpklo	z27.s, z25.h
	sub	z31.h, z26.h, z25.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z23.s, z25.h
	add	x0, x0, 272
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z16.h, z26.h, z25.h
	add	z26.h, z26.h, z25.h
	tbl	z25.h, {z26.h}, z14.h
	sub	z23.h, z26.h, z25.h
	str	z23, [x0]
	addvl	x0, sp, #10
	rev	z27.s, z27.s
	add	z27.s, z24.s, z27.s
	add	x0, x0, 272
	rev	z26.s, z27.s
	add	z27.s, z27.s, z26.s
	tbl	z26.s, {z27.s}, z13.s
	add	z23.s, z27.s, z26.s
	str	z23, [x0]
	addvl	x0, sp, #11
	sub	z22.s, z27.s, z26.s
	ld1h	z25.h, p7/z, [x11, x9, lsl 1]
	add	x0, x0, 272
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	str	z22, [x0]
	addvl	x0, sp, #12
	ld1h	z26.h, p7/z, [x12, x9, lsl 1]
	sunpkhi	z23.s, z25.h
	sub	z4.h, z26.h, z25.h
	add	x0, x0, 272
	sunpklo	z24.s, z26.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	add	z27.s, z27.s, z23.s
	rev	z25.h, z26.h
	rev	z27.s, z27.s
	add	z27.s, z24.s, z27.s
	sub	z5.h, z26.h, z25.h
	rev	z17.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z17.s, z27.s, z17.s
	tbl	z25.h, {z26.h}, z14.h
	tbl	z27.s, {z17.s}, z13.s
	sub	z19.h, z26.h, z25.h
	str	z19, [x0]
	add	x0, x12, x8, lsl 3
	add	z9.s, z17.s, z27.s
	ld1h	z26.h, p7/z, [x0]
	sub	z17.s, z17.s, z27.s
	add	x0, x11, x8, lsl 3
	ld1h	z25.h, p7/z, [x0]
	rev	z25.h, z25.h
	sunpklo	z27.s, z25.h
	sub	z3.h, z26.h, z25.h
	sunpkhi	z23.s, z25.h
	sunpklo	z24.s, z26.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z7.h, z26.h, z25.h
	addvl	x0, sp, #13
	add	z26.h, z26.h, z25.h
	rev	z27.s, z27.s
	tbl	z25.h, {z26.h}, z14.h
	add	z27.s, z24.s, z27.s
	sub	z18.h, z26.h, z25.h
	add	x0, x0, 272
	str	z18, [x0]
	rev	z18.s, z27.s
	add	z18.s, z27.s, z18.s
	tbl	z27.s, {z18.s}, z13.s
	ldr	x1, [sp, 256]
	add	z10.s, z18.s, z27.s
	ld1h	z24.h, p7/z, [x11, x1, lsl 1]
	sub	z18.s, z18.s, z27.s
	rev	z24.h, z24.h
	addvl	x0, sp, #14
	sunpklo	z27.s, z24.h
	ld1h	z25.h, p7/z, [x12, x1, lsl 1]
	sunpkhi	z22.s, z24.h
	sub	z26.h, z25.h, z24.h
	add	x0, x0, 272
	sunpklo	z23.s, z25.h
	add	z23.s, z23.s, z27.s
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z24.h
	rev	z24.h, z25.h
	sub	z6.h, z25.h, z24.h
	add	z25.h, z25.h, z24.h
	tbl	z24.h, {z25.h}, z14.h
	sub	z12.h, z25.h, z24.h
	str	z12, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 272
	add	z27.s, z27.s, z22.s
	rev	z27.s, z27.s
	add	z27.s, z23.s, z27.s
	rev	z25.s, z27.s
	add	z27.s, z27.s, z25.s
	tbl	z25.s, {z27.s}, z13.s
	sub	z19.s, z27.s, z25.s
	str	z19, [x0]
	add	x0, x12, x9, lsl 2
	add	z11.s, z27.s, z25.s
	ld1h	z25.h, p7/z, [x0]
	add	x0, x11, x9, lsl 2
	ld1h	z24.h, p7/z, [x0]
	rev	z24.h, z24.h
	sunpklo	z27.s, z24.h
	sub	z22.h, z25.h, z24.h
	sunpkhi	z19.s, z24.h
	sunpklo	z23.s, z25.h
	addvl	x0, sp, #16
	add	z23.s, z23.s, z27.s
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z24.h
	rev	z24.h, z25.h
	add	x0, x0, 272
	sub	z8.h, z25.h, z24.h
	add	z27.s, z27.s, z19.s
	add	z25.h, z25.h, z24.h
	rev	z27.s, z27.s
	tbl	z24.h, {z25.h}, z14.h
	add	z27.s, z23.s, z27.s
	sub	z2.h, z25.h, z24.h
	zip1	z23.d, z28.d, z26.d
	trn2	z24.d, z28.d, z26.d
	rev	z19.s, z27.s
	trn1	z28.d, z28.d, z26.d
	add	z19.s, z27.s, z19.s
	tbl	z27.s, {z19.s}, z13.s
	str	z2, [x0]
	ldr	x0, [sp, 264]
	add	z12.s, z19.s, z27.s
	zip1	z25.d, z29.d, z4.d
	sub	z19.s, z19.s, z27.s
	zip1	z26.d, z30.d, z3.d
	trn2	z27.d, z29.d, z4.d
	trn1	z29.d, z29.d, z4.d
	zip2	z29.d, z29.d, z28.d
	trn2	z28.d, z30.d, z3.d
	trn1	z30.d, z30.d, z3.d
	ld1h	z3.h, p7/z, [x0]
	addvl	x0, sp, #17
	zip1	z25.d, z25.d, z23.d
	trn2	z4.d, z31.d, z22.d
	zip1	z23.d, z27.d, z24.d
	add	x0, x0, 272
	zip2	z27.d, z27.d, z24.d
	zip1	z24.d, z31.d, z22.d
	zip1	z26.d, z26.d, z24.d
	zip1	z24.d, z28.d, z4.d
	zip2	z28.d, z28.d, z4.d
	ldr	z4, [x0]
	addvl	x0, sp, #18
	trn1	z31.d, z31.d, z22.d
	add	x0, x0, 272
	ldr	z1, [x0]
	zip2	z30.d, z30.d, z31.d
	addvl	x0, sp, #19
	movi	d31, #0
	mov	z2.d, z4.d
	add	x0, x0, 272
	ldr	z0, [x0]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	addvl	x0, sp, #21
	movprfx	z4, z31
	sdot	z4.d, z24.h, z2.h
	sdot	z4.d, z26.h, z3.h
	add	x0, x0, 272
	sdot	z4.d, z30.h, z1.h
	sdot	z4.d, z28.h, z0.h
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	sdot	z22.d, z25.h, z3.h
	sdot	z22.d, z29.h, z1.h
	sdot	z22.d, z27.h, z0.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	ldr	z4, [x0]
	addvl	x0, sp, #20
	mov	z3.d, z4.d
	umov	w17, v9.s[0]
	add	x0, x0, 272
	ldr	z2, [x0]
	umov	w14, v9.s[1]
	addvl	x0, sp, #22
	umov	w7, v11.s[1]
	add	x0, x0, 272
	ldr	z1, [x0]
	umov	w15, v10.s[0]
	addvl	x0, sp, #23
	umov	w13, v10.s[1]
	add	x0, x0, 272
	ldr	z0, [x0]
	str	q22, [x10, 64]
	addvl	x0, sp, #25
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z3.h
	add	x0, x0, 272
	sdot	z4.d, z26.h, z2.h
	sdot	z4.d, z30.h, z1.h
	sdot	z4.d, z28.h, z0.h
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	sdot	z22.d, z25.h, z2.h
	sdot	z22.d, z29.h, z1.h
	sdot	z22.d, z27.h, z0.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	ldr	z4, [x0]
	addvl	x0, sp, #24
	mov	z3.d, z4.d
	add	x0, x0, 272
	ldr	z2, [x0]
	umov	w6, v12.s[1]
	addvl	x0, sp, #26
	add	x22, x13, x15
	add	x0, x0, 272
	ldr	z1, [x0]
	umov	w27, v18.s[0]
	addvl	x0, sp, #27
	sbfiz	x22, x22, 2, 58
	add	x0, x0, 272
	ldr	z0, [x0]
	str	q22, [x10, 192]
	add	x0, x26, 448
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z3.h
	sdot	z22.d, z25.h, z2.h
	sdot	z4.d, z26.h, z2.h
	sdot	z22.d, z29.h, z1.h
	sdot	z4.d, z30.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 480
	sdot	z22.d, z27.h, z0.h
	sdot	z4.d, z28.h, z0.h
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 512
	ld1h	z2.h, p7/z, [x0]
	uzp1	z22.s, z22.s, z22.s
	add	x0, x26, 544
	rshrnb	z22.h, z22.s, #4
	ld1h	z3.h, p7/z, [x0]
	uzp1	z4.s, z4.s, z4.s
	add	x0, x26, 576
	rshrnb	z4.h, z4.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 320]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 608
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 640
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 672
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 704
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 448]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 736
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 768
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 800
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 832
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	str	q22, [x10, 576]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z4.h, z4.s, #4
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	str	q22, [x10, 704]
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 864
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 896
	ld1h	z2.h, p7/z, [x0]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	add	x0, x26, 928
	ld1h	z3.h, p7/z, [x0]
	sdot	z22.d, z25.h, z1.h
	add	x0, x26, 960
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 992
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1024
	sdot	z22.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1056
	sdot	z22.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z22.s, z22.s, z22.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z22.h, z22.s, #4
	add	x0, x26, 1088
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	trn1	z22.h, z22.h, z4.h
	str	q22, [x10, 832]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1120
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1152
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1184
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 1216
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 960]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1248
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x26, 1280
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1312
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 1344
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 1088]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1376
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1408
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1440
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 1472
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 1216]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1504
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1536
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1568
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 1600
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x10, 1344]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1632
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x26, 1664
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z29.h, z2.h
	uzp1	z4.s, z4.s, z4.s
	sdot	z22.d, z27.h, z3.h
	rshrnb	z4.h, z4.s, #4
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	str	q22, [x10, 1472]
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1696
	ld1h	z3.h, p7/z, [x0]
	add	x0, x26, 1728
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1760
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1792
	sdot	z22.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1824
	sdot	z22.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z22.s, z22.s, z22.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z22.h, z22.s, #4
	add	x0, x26, 1856
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #4
	trn1	z22.h, z22.h, z4.h
	str	q22, [x10, 1600]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 1888
	ld1h	z0.h, p7/z, [x0]
	add	x0, x26, 1920
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 1952
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 1984
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z4.d, z30.h, z2.h
	str	q22, [x10, 1728]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x26, 2016
	ld1h	z1.h, p7/z, [x0]
	add	x0, x26, 2048
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #4
	add	x0, x26, 2080
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z4.h
	ld1h	z4.h, p7/z, [x0]
	add	x0, x26, 2112
	str	q22, [x10, 1856]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z1.h
	sdot	z22.d, z25.h, z2.h
	sdot	z22.d, z29.h, z3.h
	movprfx	z29, z31
	sdot	z29.d, z24.h, z1.h
	sdot	z29.d, z26.h, z2.h
	ld1h	z26.h, p7/z, [x0]
	sdot	z29.d, z30.h, z3.h
	add	x0, x26, 2144
	sdot	z29.d, z28.h, z4.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #4
	ld1h	z25.h, p7/z, [x0]
	zip1	z28.d, z16.d, z8.d
	add	x0, x26, 2176
	sdot	z22.d, z27.h, z4.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #4
	trn1	z22.h, z22.h, z29.h
	zip1	z29.d, z15.d, z6.d
	zip1	z30.d, z20.d, z5.d
	trn2	z15.d, z15.d, z6.d
	zip1	z30.d, z30.d, z29.d
	trn2	z20.d, z20.d, z5.d
	zip1	z29.d, z21.d, z7.d
	zip1	z20.d, z20.d, z15.d
	zip1	z29.d, z29.d, z28.d
	trn2	z21.d, z21.d, z7.d
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	trn2	z16.d, z16.d, z8.d
	sdot	z28.d, z30.h, z26.h
	zip1	z21.d, z21.d, z16.d
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x26, 2208
	uzp1	z28.s, z28.s, z28.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z28.h, z28.s, #4
	add	x0, x26, 2240
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	trn1	z28.h, z28.h, z27.h
	str	q28, [x10, 128]
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z27.d, z29.h, z26.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x26, 2272
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x26, 2304
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x10, 384]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x26, 2336
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x26, 2368
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x10, 640]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x26, 2400
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #4
	add	x0, x26, 2432
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	str	q28, [x10, 896]
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q22, [x10, 1984]
	sdot	z28.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z27.h, z27.s, #4
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	str	q28, [x10, 1152]
	ld1h	z26.h, p7/z, [x0]
	add	x0, x26, 2464
	ld1h	z25.h, p7/z, [x0]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	add	x0, x26, 2496
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z28.d, z30.h, z26.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z27.s, z27.s, z27.s
	add	x0, x26, 2528
	rshrnb	z27.h, z27.s, #4
	ld1h	z25.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x26, 2560
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x10, 1408]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	add	x0, x26, 2592
	ld1h	z26.h, p7/z, [x0]
	str	q28, [x10, 1664]
	add	x0, sp, 272
	movprfx	z28, z31
	sdot	z28.d, z20.h, z26.h
	sdot	z28.d, z30.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z21.h, z26.h
	sdot	z30.d, z29.h, z27.h
	ldr	z29, [x0]
	addvl	x0, sp, #12
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #4
	add	x0, x0, 272
	ldr	z21, [x0]
	uzp1	z28.s, z28.s, z28.s
	addvl	x0, sp, #6
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z30.h
	add	x0, x0, 272
	zip1	z30.d, z29.d, z21.d
	ldr	z29, [x0]
	addvl	x0, sp, #14
	umov	w5, v19.s[0]
	add	x0, x0, 272
	ldr	z21, [x0]
	zip1	z29.d, z29.d, z21.d
	addvl	x0, sp, #3
	zip1	z29.d, z30.d, z29.d
	add	x10, x10, 16
	add	x0, x0, 272
	ldr	z21, [x0]
	add	x12, x12, x8, lsl 4
	addvl	x0, sp, #13
	add	x11, x11, x8, lsl 4
	add	x0, x0, 272
	ldr	z20, [x0]
	zip1	z30.d, z21.d, z20.d
	addvl	x0, sp, #9
	add	x0, x0, 272
	ldr	z21, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 272
	ldr	z20, [x0]
	str	q28, [x10, 1904]
	add	x0, x26, 2624
	zip1	z28.d, z21.d, z20.d
	ld1h	z26.h, p7/z, [x0]
	zip1	z30.d, z30.d, z28.d
	add	x0, x26, 2656
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x26, 2688
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x10, 240]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x26, 2720
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #4
	str	q28, [x10, 752]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	addvl	x0, sp, #1
	str	q28, [x10, 1264]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z27.h
	add	x0, x0, 272
	sdot	z31.d, z30.h, z27.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #4
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #4
	trn1	z28.h, z28.h, z31.h
	ldr	z31, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 272
	umov	w30, v31.s[0]
	umov	w3, v31.s[1]
	ldr	z31, [x0]
	add	x0, sp, 172
	str	q28, [x10, 1776]
	st1	{v31.s}[0], [x0]
	add	x0, sp, 176
	st1	{v31.s}[1], [x0]
	addvl	x0, sp, #4
	add	x0, x0, 272
	ldr	z31, [x0]
	umov	w28, v31.s[0]
	addvl	x0, sp, #5
	umov	w1, v31.s[1]
	add	x0, x0, 272
	ldr	z31, [x0]
	add	x0, sp, 180
	st1	{v31.s}[0], [x0]
	add	x0, sp, 184
	st1	{v31.s}[1], [x0]
	addvl	x0, sp, #7
	add	x0, x0, 272
	ldr	z31, [x0]
	umov	w18, v31.s[0]
	addvl	x0, sp, #8
	umov	w20, v31.s[1]
	add	x0, x0, 272
	ldr	z31, [x0]
	str	w3, [sp, 160]
	add	x0, sp, 188
	ldr	x4, [sp, 160]
	st1	{v31.s}[0], [x0]
	add	x0, sp, 192
	add	x3, x4, x30
	add	x21, x20, x18
	add	x4, x1, x28
	st1	{v31.s}[1], [x0]
	addvl	x0, sp, #10
	add	x0, x0, 272
	ldr	z31, [x0]
	umov	w16, v31.s[0]
	addvl	x0, sp, #11
	umov	w19, v31.s[1]
	add	x0, x0, 272
	ldr	z31, [x0]
	ubfiz	x3, x3, 2, 58
	add	x0, sp, 196
	sbfiz	x21, x21, 2, 58
	str	x21, [sp, 232]
	add	x21, x14, x17
	st1	{v31.s}[0], [x0]
	add	x0, sp, 200
	sbfiz	x21, x21, 2, 58
	add	x23, x19, x16
	str	x21, [sp, 240]
	st1	{v31.s}[1], [x0]
	add	x0, sp, 204
	ldr	z31, [x2]
	umov	w24, v31.s[0]
	umov	w25, v31.s[1]
	fmov	d31, x3
	add	x3, sp, 232
	st1	{v17.s}[0], [x0]
	add	x0, sp, 208
	add	x2, sp, 224
	sbfiz	x23, x23, 2, 58
	ld1	{v31.h}[1], [x3]
	add	x3, sp, 240
	st1	{v17.s}[1], [x0]
	add	x0, sp, 212
	st1	{v12.s}[0], [x2]
	umov	w2, v19.s[1]
	ld1	{v31.h}[2], [x3]
	ubfiz	x3, x4, 2, 58
	st1	{v18.s}[1], [x0]
	umov	w0, v11.s[0]
	fmov	d30, x3
	mov	w3, 36
	ins	v30.h[1], w23
	ldr	w23, [sp, 184]
	str	w0, [sp, 216]
	ldr	x21, [sp, 216]
	ins	v30.h[2], w22
	ldp	w22, w4, [sp, 172]
	add	x21, x7, x21
	sbfiz	x0, x21, 2, 58
	ldr	x21, [sp, 224]
	smull	x4, w4, w3
	ins	v31.h[3], w0
	ldr	w0, [sp, 188]
	add	x21, x6, x21
	sbfiz	x21, x21, 2, 58
	ins	v30.h[3], w21
	mov	w21, 83
	smaddl	x4, w22, w21, x4
	smull	x22, w23, w3
	ldr	w23, [sp, 180]
	zip1	v31.8h, v31.8h, v30.8h
	add	x4, x4, 8
	smaddl	x22, w23, w21, x22
	ldr	w23, [sp, 192]
	str	q31, [x10, -16]
	add	x22, x22, 8
	smull	x23, w23, w3
	smaddl	x23, w0, w21, x23
	ldr	w0, [sp, 200]
	add	x23, x23, 8
	fmov	d31, x23
	smull	x23, w0, w3
	ldr	w0, [sp, 196]
	sshr	d25, d31, 4
	smaddl	x23, w0, w21, x23
	ldr	w0, [sp, 208]
	add	x23, x23, 8
	fmov	d31, x23
	smull	x23, w0, w3
	ldr	w0, [sp, 204]
	sshr	d27, d31, 4
	smaddl	x23, w0, w21, x23
	ldr	w0, [sp, 212]
	add	x23, x23, 8
	fmov	d31, x23
	smull	x23, w0, w3
	sshr	d26, d31, 4
	smaddl	x23, w27, w21, x23
	ldr	w0, [sp, 160]
	add	x23, x23, 8
	fmov	d31, x23
	smull	x23, w25, w3
	smaddl	x23, w24, w21, x23
	sshr	d28, d31, 4
	add	x23, x23, 8
	fmov	d31, x23
	smull	x23, w2, w3
	smaddl	x21, w5, w21, x23
	sshr	d30, d31, 4
	ldr	w23, [sp, 184]
	add	x21, x21, 8
	fmov	d31, x21
	mov	w21, 64
	sshr	d29, d31, 4
	fmov	d31, x4
	mov	w4, -64
	ushr	d31, d31, 4
	smull	x20, w20, w4
	smaddl	x18, w18, w21, x20
	smull	x13, w13, w4
	ins	v31.h[1], v25.h[0]
	smull	x19, w19, w4
	smaddl	x15, w15, w21, x13
	ldr	w13, [sp, 216]
	smaddl	x16, w16, w21, x19
	smull	x14, w14, w4
	ins	v31.h[2], v26.h[0]
	smaddl	x17, w17, w21, x14
	smull	x7, w7, w4
	smaddl	x7, w13, w21, x7
	ldr	w13, [sp, 224]
	smull	x6, w6, w4
	ins	v31.h[3], v30.h[0]
	fmov	d30, x22
	smull	x0, w0, w4
	ldr	w22, [sp, 172]
	ushr	d30, d30, 4
	smull	x1, w1, w4
	smaddl	x0, w30, w21, x0
	smaddl	x4, w13, w21, x6
	mov	w6, -83
	smaddl	x1, w28, w21, x1
	ins	v30.h[1], v27.h[0]
	ubfx	x0, x0, 4, 16
	smull	x2, w2, w6
	ubfx	x1, x1, 4, 16
	smaddl	x5, w5, w3, x2
	ins	v30.h[2], v28.h[0]
	add	x5, x5, 8
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x10, 496]
	fmov	d31, x18
	sshr	d25, d31, 4
	fmov	d31, x16
	sshr	d27, d31, 4
	fmov	d31, x17
	sshr	d26, d31, 4
	fmov	d31, x15
	sshr	d28, d31, 4
	fmov	d31, x7
	ldr	w7, [sp, 188]
	sshr	d30, d31, 4
	fmov	d31, x4
	sshr	d29, d31, 4
	fmov	d31, x0
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v30.h[0]
	fmov	d30, x1
	smull	x1, w23, w6
	ins	v30.h[1], v27.h[0]
	ldp	w4, w23, [sp, 176]
	ins	v30.h[2], v28.h[0]
	smaddl	x1, w23, w3, x1
	ldr	w23, [sp, 192]
	smull	x0, w4, w6
	smaddl	x0, w22, w3, x0
	add	x1, x1, 8
	ins	v30.h[3], v29.h[0]
	smull	x4, w23, w6
	add	x0, x0, 8
	smaddl	x4, w7, w3, x4
	ldr	w7, [sp, 196]
	zip1	v31.8h, v31.8h, v30.8h
	add	x4, x4, 8
	str	q31, [x10, 1008]
	fmov	d31, x4
	ldr	w4, [sp, 200]
	sshr	d25, d31, 4
	smull	x4, w4, w6
	smaddl	x4, w7, w3, x4
	add	x4, x4, 8
	fmov	d31, x4
	ldp	w7, w4, [sp, 204]
	sshr	d27, d31, 4
	smull	x4, w4, w6
	smaddl	x4, w7, w3, x4
	add	x4, x4, 8
	fmov	d31, x4
	ldr	w4, [sp, 212]
	sshr	d26, d31, 4
	smull	x4, w4, w6
	smaddl	x4, w27, w3, x4
	add	x4, x4, 8
	fmov	d31, x4
	smull	x4, w25, w6
	smaddl	x4, w24, w3, x4
	sshr	d28, d31, 4
	add	x4, x4, 8
	fmov	d31, x4
	sshr	d30, d31, 4
	fmov	d31, x5
	sshr	d29, d31, 4
	fmov	d31, x0
	ldr	x0, [sp, 248]
	ushr	d31, d31, 4
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v30.h[0]
	fmov	d30, x1
	ushr	d30, d30, 4
	ins	v30.h[1], v27.h[0]
	ins	v30.h[2], v28.h[0]
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x10, 1520]
	cmp	x0, x10
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
	.cfi_def_cfa_offset 272
	add	sp, sp, 272
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
	mov	x15, x0
	ptrue	p7.b, all
	sub	sp, sp, #352
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xe0,0x1e,0x23,0xe0,0x2,0x22
	adrp	x0, .LANCHOR0
	add	x14, x0, :lo12:.LANCHOR0
	mov	x17, x1
	add	x0, x14, 32
	mov	x16, 0
	stp	x29, x30, [sp]
	.cfi_escape 0x10,0x1d,0x2,0x8f,0
	.cfi_escape 0x10,0x1e,0x2,0x8f,0x8
	mov	x29, sp
	stp	d14, d15, [sp, 144]
	.cfi_escape 0x10,0x4e,0x3,0x8f,0x90,0x1
	.cfi_escape 0x10,0x4f,0x3,0x8f,0x98,0x1
	ld1h	z14.h, p7/z, [x0]
	add	x0, x15, 32
	str	x0, [sp, 336]
	add	x0, x15, 64
	str	x0, [sp, 224]
	add	x0, x15, 96
	str	x0, [sp, 232]
	add	x0, x15, 128
	str	x0, [sp, 240]
	add	x0, x15, 160
	str	x0, [sp, 248]
	add	x0, x15, 192
	str	x0, [sp, 256]
	add	x0, x15, 224
	str	x0, [sp, 264]
	add	x0, x15, 256
	str	x0, [sp, 272]
	add	x0, x15, 288
	str	x0, [sp, 280]
	add	x0, x15, 320
	str	x0, [sp, 288]
	add	x0, x15, 352
	str	x0, [sp, 296]
	add	x0, x15, 384
	str	x0, [sp, 304]
	add	x0, x15, 416
	str	x0, [sp, 312]
	add	x0, x15, 448
	str	x0, [sp, 320]
	add	x0, x15, 480
	str	x0, [sp, 328]
	add	x0, x14, 64
	str	x0, [sp, 216]
	add	x0, x14, 96
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #17
	stp	x19, x20, [sp, 16]
	add	x0, x0, 352
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	stp	d8, d9, [sp, 96]
	stp	d10, d11, [sp, 112]
	stp	d12, d13, [sp, 128]
	.cfi_escape 0x10,0x13,0x2,0x8f,0x10
	.cfi_escape 0x10,0x14,0x2,0x8f,0x18
	.cfi_escape 0x10,0x15,0x2,0x8f,0x20
	.cfi_escape 0x10,0x16,0x2,0x8f,0x28
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
	ld1w	z13.s, p7/z, [x14]
	str	z31, [x0]
	add	x0, x14, 128
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #18
	str	x15, [sp, 344]
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 160
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 192
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 224
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 256
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 288
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 320
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 352
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 384
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #26
	add	x0, x0, 352
	str	z31, [x0]
	add	x0, x14, 416
	ld1h	z31.h, p7/z, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 352
	str	z31, [x0]
.L7:
	ldr	x0, [sp, 344]
	ld1h	z31.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z30.s, z31.h
	addvl	x1, sp, #10
	ldr	x0, [sp, 336]
	ld1h	z28.h, p7/z, [x0, x16, lsl 1]
	rev	z28.h, z28.h
	sunpklo	z27.s, z28.h
	sub	z29.h, z31.h, z28.h
	sunpkhi	z26.s, z28.h
	add	x0, sp, 352
	add	z30.s, z30.s, z27.s
	sunpkhi	z27.s, z31.h
	add	z31.h, z31.h, z28.h
	rev	z28.h, z31.h
	sub	z20.h, z31.h, z28.h
	add	z31.h, z31.h, z28.h
	tbl	z28.h, {z31.h}, z14.h
	sub	z31.h, z31.h, z28.h
	str	z31, [x0]
	addvl	x0, sp, #1
	add	z27.s, z27.s, z26.s
	add	x0, x0, 352
	rev	z27.s, z27.s
	add	z30.s, z30.s, z27.s
	rev	z31.s, z30.s
	add	z31.s, z30.s, z31.s
	tbl	z30.s, {z31.s}, z13.s
	add	z28.s, z31.s, z30.s
	str	z28, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 352
	sub	z30.s, z31.s, z30.s
	str	z30, [x0]
	ldr	x0, [sp, 224]
	ld1h	z31.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z28.s, z31.h
	add	x1, x1, 352
	ldr	x0, [sp, 232]
	ld1h	z27.h, p7/z, [x0, x16, lsl 1]
	rev	z27.h, z27.h
	addvl	x0, sp, #3
	sunpklo	z26.s, z27.h
	sub	z30.h, z31.h, z27.h
	sunpkhi	z25.s, z27.h
	add	x0, x0, 352
	add	z28.s, z28.s, z26.s
	sunpkhi	z26.s, z31.h
	add	z31.h, z31.h, z27.h
	rev	z27.h, z31.h
	sub	z21.h, z31.h, z27.h
	add	z31.h, z31.h, z27.h
	tbl	z27.h, {z31.h}, z14.h
	sub	z27.h, z31.h, z27.h
	str	z27, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 352
	add	z26.s, z26.s, z25.s
	rev	z26.s, z26.s
	add	z28.s, z28.s, z26.s
	rev	z31.s, z28.s
	add	z31.s, z28.s, z31.s
	tbl	z28.s, {z31.s}, z13.s
	add	z27.s, z31.s, z28.s
	str	z27, [x0]
	addvl	x0, sp, #5
	sub	z26.s, z31.s, z28.s
	add	x17, x17, 16
	add	x0, x0, 352
	str	z26, [x0]
	ldr	x0, [sp, 240]
	ld1h	z31.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z27.s, z31.h
	ldr	x0, [sp, 248]
	ld1h	z26.h, p7/z, [x0, x16, lsl 1]
	rev	z26.h, z26.h
	addvl	x0, sp, #6
	sunpklo	z25.s, z26.h
	sub	z28.h, z31.h, z26.h
	sunpkhi	z24.s, z26.h
	add	x0, x0, 352
	add	z27.s, z27.s, z25.s
	sunpkhi	z25.s, z31.h
	add	z31.h, z31.h, z26.h
	add	z25.s, z25.s, z24.s
	rev	z26.h, z31.h
	rev	z25.s, z25.s
	sub	z15.h, z31.h, z26.h
	add	z27.s, z27.s, z25.s
	add	z31.h, z31.h, z26.h
	tbl	z26.h, {z31.h}, z14.h
	sub	z25.h, z31.h, z26.h
	str	z25, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 352
	rev	z31.s, z27.s
	add	z31.s, z27.s, z31.s
	tbl	z27.s, {z31.s}, z13.s
	add	z25.s, z31.s, z27.s
	str	z25, [x0]
	addvl	x0, sp, #8
	sub	z24.s, z31.s, z27.s
	add	x0, x0, 352
	str	z24, [x0]
	ldr	x0, [sp, 256]
	ld1h	z26.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z24.s, z26.h
	ldr	x0, [sp, 264]
	ld1h	z25.h, p7/z, [x0, x16, lsl 1]
	rev	z25.h, z25.h
	addvl	x0, sp, #9
	sunpklo	z27.s, z25.h
	sub	z31.h, z26.h, z25.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z23.s, z25.h
	add	x0, x0, 352
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z16.h, z26.h, z25.h
	add	z26.h, z26.h, z25.h
	tbl	z25.h, {z26.h}, z14.h
	sub	z23.h, z26.h, z25.h
	str	z23, [x0]
	addvl	x0, sp, #10
	rev	z27.s, z27.s
	add	z27.s, z24.s, z27.s
	add	x0, x0, 352
	rev	z26.s, z27.s
	add	z27.s, z27.s, z26.s
	tbl	z26.s, {z27.s}, z13.s
	add	z23.s, z27.s, z26.s
	str	z23, [x0]
	addvl	x0, sp, #11
	sub	z22.s, z27.s, z26.s
	add	x0, x0, 352
	str	z22, [x0]
	ldr	x0, [sp, 272]
	ld1h	z26.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z24.s, z26.h
	ldr	x0, [sp, 280]
	ld1h	z25.h, p7/z, [x0, x16, lsl 1]
	rev	z25.h, z25.h
	addvl	x0, sp, #12
	sunpklo	z27.s, z25.h
	sub	z4.h, z26.h, z25.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z23.s, z25.h
	add	x0, x0, 352
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z5.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z24.s, z27.s
	tbl	z25.h, {z26.h}, z14.h
	sub	z19.h, z26.h, z25.h
	str	z19, [x0]
	ldr	x0, [sp, 288]
	rev	z17.s, z27.s
	ld1h	z26.h, p7/z, [x0, x16, lsl 1]
	add	z17.s, z27.s, z17.s
	ldr	x0, [sp, 296]
	tbl	z27.s, {z17.s}, z13.s
	ld1h	z25.h, p7/z, [x0, x16, lsl 1]
	add	z9.s, z17.s, z27.s
	rev	z25.h, z25.h
	sub	z17.s, z17.s, z27.s
	addvl	x0, sp, #13
	sunpklo	z27.s, z25.h
	sub	z3.h, z26.h, z25.h
	sunpkhi	z23.s, z25.h
	add	x0, x0, 352
	sunpklo	z24.s, z26.h
	add	z24.s, z24.s, z27.s
	sunpkhi	z27.s, z26.h
	add	z26.h, z26.h, z25.h
	rev	z25.h, z26.h
	add	z27.s, z27.s, z23.s
	sub	z7.h, z26.h, z25.h
	rev	z27.s, z27.s
	add	z26.h, z26.h, z25.h
	add	z27.s, z24.s, z27.s
	tbl	z25.h, {z26.h}, z14.h
	sub	z18.h, z26.h, z25.h
	str	z18, [x0]
	ldr	x0, [sp, 304]
	rev	z18.s, z27.s
	ld1h	z25.h, p7/z, [x0, x16, lsl 1]
	add	z18.s, z27.s, z18.s
	tbl	z27.s, {z18.s}, z13.s
	add	z10.s, z18.s, z27.s
	ldr	x0, [sp, 312]
	sub	z18.s, z18.s, z27.s
	ld1h	z24.h, p7/z, [x0, x16, lsl 1]
	addvl	x0, sp, #14
	rev	z24.h, z24.h
	sunpklo	z27.s, z24.h
	sub	z26.h, z25.h, z24.h
	sunpkhi	z22.s, z24.h
	add	x0, x0, 352
	sunpklo	z23.s, z25.h
	add	z23.s, z23.s, z27.s
	sunpkhi	z27.s, z25.h
	add	z25.h, z25.h, z24.h
	rev	z24.h, z25.h
	sub	z6.h, z25.h, z24.h
	add	z25.h, z25.h, z24.h
	tbl	z24.h, {z25.h}, z14.h
	sub	z12.h, z25.h, z24.h
	str	z12, [x0]
	addvl	x0, sp, #15
	add	z27.s, z27.s, z22.s
	add	x0, x0, 352
	rev	z27.s, z27.s
	add	z27.s, z23.s, z27.s
	rev	z25.s, z27.s
	add	z27.s, z27.s, z25.s
	umov	w13, v9.s[0]
	tbl	z25.s, {z27.s}, z13.s
	sub	z19.s, z27.s, z25.s
	str	z19, [x0]
	ldr	x0, [sp, 320]
	add	z11.s, z27.s, z25.s
	ld1h	z25.h, p7/z, [x0, x16, lsl 1]
	sunpklo	z23.s, z25.h
	umov	w21, v9.s[1]
	ldr	x0, [sp, 328]
	ld1h	z24.h, p7/z, [x0, x16, lsl 1]
	rev	z24.h, z24.h
	sunpklo	z27.s, z24.h
	sub	z22.h, z25.h, z24.h
	add	z23.s, z23.s, z27.s
	sunpkhi	z19.s, z24.h
	sunpkhi	z27.s, z25.h
	addvl	x0, sp, #16
	add	z25.h, z25.h, z24.h
	rev	z24.h, z25.h
	add	x0, x0, 352
	sub	z8.h, z25.h, z24.h
	add	z27.s, z27.s, z19.s
	add	z25.h, z25.h, z24.h
	rev	z27.s, z27.s
	tbl	z24.h, {z25.h}, z14.h
	add	z27.s, z23.s, z27.s
	sub	z2.h, z25.h, z24.h
	zip1	z23.d, z28.d, z26.d
	trn2	z24.d, z28.d, z26.d
	rev	z19.s, z27.s
	trn1	z28.d, z28.d, z26.d
	add	z19.s, z27.s, z19.s
	tbl	z27.s, {z19.s}, z13.s
	str	z2, [x0]
	ldr	x0, [sp, 216]
	add	z12.s, z19.s, z27.s
	zip1	z25.d, z29.d, z4.d
	sub	z19.s, z19.s, z27.s
	zip1	z26.d, z30.d, z3.d
	trn2	z27.d, z29.d, z4.d
	trn1	z29.d, z29.d, z4.d
	zip2	z29.d, z29.d, z28.d
	trn2	z28.d, z30.d, z3.d
	trn1	z30.d, z30.d, z3.d
	ld1h	z3.h, p7/z, [x0]
	addvl	x0, sp, #17
	zip1	z25.d, z25.d, z23.d
	trn2	z4.d, z31.d, z22.d
	zip1	z23.d, z27.d, z24.d
	add	x0, x0, 352
	zip2	z27.d, z27.d, z24.d
	zip1	z24.d, z31.d, z22.d
	zip1	z26.d, z26.d, z24.d
	zip1	z24.d, z28.d, z4.d
	zip2	z28.d, z28.d, z4.d
	ldr	z4, [x0]
	addvl	x0, sp, #18
	trn1	z31.d, z31.d, z22.d
	mov	z2.d, z4.d
	add	x0, x0, 352
	ldr	z1, [x0]
	zip2	z30.d, z30.d, z31.d
	addvl	x0, sp, #19
	movi	d31, #0
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	add	x0, x0, 352
	ldr	z0, [x0]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z2.h
	addvl	x0, sp, #21
	sdot	z4.d, z26.h, z3.h
	sdot	z4.d, z30.h, z1.h
	add	x0, x0, 352
	sdot	z4.d, z28.h, z0.h
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	sdot	z22.d, z25.h, z3.h
	sdot	z22.d, z29.h, z1.h
	sdot	z22.d, z27.h, z0.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	ldr	z4, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 352
	ldr	z2, [x0]
	mov	z3.d, z4.d
	addvl	x0, sp, #22
	umov	w10, v10.s[0]
	add	x0, x0, 352
	ldr	z1, [x0]
	umov	w20, v10.s[1]
	addvl	x0, sp, #23
	umov	w12, v11.s[0]
	add	x0, x0, 352
	ldr	z0, [x0]
	str	q22, [x17, 48]
	addvl	x0, sp, #25
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z3.h
	add	x0, x0, 352
	sdot	z4.d, z26.h, z2.h
	sdot	z4.d, z30.h, z1.h
	sdot	z4.d, z28.h, z0.h
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	sdot	z22.d, z25.h, z2.h
	sdot	z22.d, z29.h, z1.h
	sdot	z22.d, z27.h, z0.h
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	ldr	z4, [x0]
	addvl	x0, sp, #24
	mov	z3.d, z4.d
	add	x0, x0, 352
	ldr	z2, [x0]
	umov	w19, v11.s[1]
	addvl	x0, sp, #26
	umov	w9, v12.s[0]
	add	x0, x0, 352
	ldr	z1, [x0]
	umov	w18, v12.s[1]
	addvl	x0, sp, #27
	umov	w6, v19.s[1]
	add	x0, x0, 352
	ldr	z0, [x0]
	str	q22, [x17, 176]
	add	x0, x14, 448
	movprfx	z22, z31
	sdot	z22.d, z23.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z3.h
	sdot	z22.d, z25.h, z2.h
	sdot	z4.d, z26.h, z2.h
	sdot	z22.d, z29.h, z1.h
	sdot	z4.d, z30.h, z1.h
	sdot	z22.d, z27.h, z0.h
	sdot	z4.d, z28.h, z0.h
	uzp1	z22.s, z22.s, z22.s
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z22.h, z22.s, #11
	rshrnb	z4.h, z4.s, #11
	trn1	z22.h, z22.h, z4.h
	str	q22, [x17, 304]
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 480
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 512
	ld1h	z2.h, p7/z, [x0]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	add	x0, x14, 544
	ld1h	z3.h, p7/z, [x0]
	sdot	z22.d, z25.h, z1.h
	add	x0, x14, 576
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 608
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 640
	sdot	z22.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 672
	sdot	z22.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z22.s, z22.s, z22.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z22.h, z22.s, #11
	add	x0, x14, 704
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	trn1	z22.h, z22.h, z4.h
	str	q22, [x17, 432]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 736
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 768
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 800
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 832
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 560]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 864
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x14, 896
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 928
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 960
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 688]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 992
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1024
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1056
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1088
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 816]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1120
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1152
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1184
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1216
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 944]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1248
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x14, 1280
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z29.h, z2.h
	uzp1	z4.s, z4.s, z4.s
	sdot	z22.d, z27.h, z3.h
	rshrnb	z4.h, z4.s, #11
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	str	q22, [x17, 1072]
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1312
	ld1h	z3.h, p7/z, [x0]
	add	x0, x14, 1344
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1376
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1408
	sdot	z22.d, z29.h, z2.h
	sdot	z4.d, z30.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1440
	sdot	z22.d, z27.h, z3.h
	sdot	z4.d, z28.h, z3.h
	uzp1	z22.s, z22.s, z22.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z22.h, z22.s, #11
	add	x0, x14, 1472
	uzp1	z4.s, z4.s, z4.s
	rshrnb	z4.h, z4.s, #11
	trn1	z22.h, z22.h, z4.h
	str	q22, [x17, 1200]
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1504
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1536
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1568
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1600
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 1328]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1632
	ld1h	z0.h, p7/z, [x0]
	sdot	z4.d, z30.h, z2.h
	add	x0, x14, 1664
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1696
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1728
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 1456]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1760
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1792
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1824
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1856
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	str	q22, [x17, 1584]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 1888
	ld1h	z0.h, p7/z, [x0]
	add	x0, x14, 1920
	sdot	z4.d, z30.h, z2.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 1952
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 1984
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	movprfx	z4, z31
	sdot	z4.d, z24.h, z0.h
	sdot	z4.d, z26.h, z1.h
	sdot	z4.d, z30.h, z2.h
	str	q22, [x17, 1712]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z0.h
	sdot	z22.d, z25.h, z1.h
	sdot	z22.d, z29.h, z2.h
	ld1h	z2.h, p7/z, [x0]
	add	x0, x14, 2016
	ld1h	z1.h, p7/z, [x0]
	add	x0, x14, 2048
	sdot	z4.d, z28.h, z3.h
	sdot	z22.d, z27.h, z3.h
	uzp1	z4.s, z4.s, z4.s
	ld1h	z3.h, p7/z, [x0]
	rshrnb	z4.h, z4.s, #11
	add	x0, x14, 2080
	uzp1	z22.s, z22.s, z22.s
	rshrnb	z22.h, z22.s, #11
	trn1	z22.h, z22.h, z4.h
	ld1h	z4.h, p7/z, [x0]
	add	x0, x14, 2112
	str	q22, [x17, 1840]
	movprfx	z22, z31
	sdot	z22.d, z23.h, z1.h
	sdot	z22.d, z25.h, z2.h
	sdot	z22.d, z29.h, z3.h
	movprfx	z29, z31
	sdot	z29.d, z24.h, z1.h
	sdot	z22.d, z27.h, z4.h
	sdot	z29.d, z26.h, z2.h
	uzp1	z22.s, z22.s, z22.s
	sdot	z29.d, z30.h, z3.h
	rshrnb	z22.h, z22.s, #11
	sdot	z29.d, z28.h, z4.h
	uzp1	z29.s, z29.s, z29.s
	rshrnb	z29.h, z29.s, #11
	trn1	z22.h, z22.h, z29.h
	str	q22, [x17, 1968]
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2144
	zip1	z29.d, z15.d, z6.d
	ld1h	z25.h, p7/z, [x0]
	zip1	z28.d, z16.d, z8.d
	add	x0, x14, 2176
	zip1	z30.d, z20.d, z5.d
	trn2	z15.d, z15.d, z6.d
	zip1	z30.d, z30.d, z29.d
	trn2	z20.d, z20.d, z5.d
	zip1	z29.d, z21.d, z7.d
	zip1	z20.d, z20.d, z15.d
	zip1	z29.d, z29.d, z28.d
	trn2	z21.d, z21.d, z7.d
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	trn2	z16.d, z16.d, z8.d
	sdot	z28.d, z30.h, z26.h
	zip1	z21.d, z21.d, z16.d
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2208
	uzp1	z28.s, z28.s, z28.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z28.h, z28.s, #11
	add	x0, x14, 2240
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x17, 112]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2272
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #11
	add	x0, x14, 2304
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x17, 368]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2336
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #11
	add	x0, x14, 2368
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x17, 624]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2400
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #11
	add	x0, x14, 2432
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	str	q28, [x17, 880]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2464
	uzp1	z27.s, z27.s, z27.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z27.h, z27.s, #11
	add	x0, x14, 2496
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x17, 1136]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	add	x0, x14, 2528
	uzp1	z28.s, z28.s, z28.s
	ld1h	z25.h, p7/z, [x0]
	rshrnb	z28.h, z28.s, #11
	add	x0, x14, 2560
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z21.h, z25.h
	sdot	z27.d, z29.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x17, 1392]
	movprfx	z28, z31
	sdot	z28.d, z20.h, z25.h
	sdot	z28.d, z30.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	add	x0, x14, 2592
	ld1h	z26.h, p7/z, [x0]
	str	q28, [x17, 1648]
	add	x0, sp, 352
	movprfx	z28, z31
	sdot	z28.d, z20.h, z26.h
	sdot	z28.d, z30.h, z27.h
	movprfx	z30, z31
	sdot	z30.d, z21.h, z26.h
	sdot	z30.d, z29.h, z27.h
	ldr	z29, [x0]
	addvl	x0, sp, #12
	uzp1	z30.s, z30.s, z30.s
	rshrnb	z30.h, z30.s, #11
	add	x0, x0, 352
	ldr	z21, [x0]
	uzp1	z28.s, z28.s, z28.s
	addvl	x0, sp, #6
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z30.h
	add	x0, x0, 352
	zip1	z30.d, z29.d, z21.d
	ldr	z29, [x0]
	addvl	x0, sp, #14
	umov	w8, v19.s[0]
	add	x0, x0, 352
	ldr	z21, [x0]
	zip1	z29.d, z29.d, z21.d
	addvl	x0, sp, #3
	zip1	z29.d, z30.d, z29.d
	add	x16, x16, 256
	add	x0, x0, 352
	ldr	z21, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 352
	ldr	z20, [x0]
	zip1	z30.d, z21.d, z20.d
	addvl	x0, sp, #9
	add	x0, x0, 352
	ldr	z21, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 352
	ldr	z20, [x0]
	str	q28, [x17, 1904]
	add	x0, x14, 2624
	zip1	z28.d, z21.d, z20.d
	ld1h	z26.h, p7/z, [x0]
	zip1	z30.d, z30.d, z28.d
	add	x0, x14, 2656
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x14, 2688
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x17, 240]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	ld1h	z26.h, p7/z, [x0]
	uzp1	z28.s, z28.s, z28.s
	add	x0, x14, 2720
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	movprfx	z27, z31
	sdot	z27.d, z30.h, z26.h
	uzp1	z27.s, z27.s, z27.s
	rshrnb	z27.h, z27.s, #11
	str	q28, [x17, 752]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z26.h
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z27.h
	ld1h	z27.h, p7/z, [x0]
	addvl	x0, sp, #1
	str	q28, [x17, 1264]
	movprfx	z28, z31
	sdot	z28.d, z29.h, z27.h
	add	x0, x0, 352
	sdot	z31.d, z30.h, z27.h
	uzp1	z31.s, z31.s, z31.s
	rshrnb	z31.h, z31.s, #11
	uzp1	z28.s, z28.s, z28.s
	rshrnb	z28.h, z28.s, #11
	trn1	z28.h, z28.h, z31.h
	ldr	z31, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 352
	umov	w2, v31.s[0]
	umov	w30, v31.s[1]
	ldr	z31, [x0]
	addvl	x0, sp, #4
	add	x0, x0, 352
	umov	w7, v31.s[0]
	umov	w25, v31.s[1]
	ldr	z31, [x0]
	addvl	x0, sp, #5
	add	x0, x0, 352
	umov	w4, v31.s[0]
	umov	w28, v31.s[1]
	ldr	z31, [x0]
	addvl	x0, sp, #7
	add	x0, x0, 352
	umov	w22, v31.s[0]
	umov	w24, v31.s[1]
	ldr	z31, [x0]
	addvl	x0, sp, #8
	add	x0, x0, 352
	umov	w15, v31.s[0]
	umov	w27, v31.s[1]
	ldr	z31, [x0]
	add	x0, sp, 180
	str	q28, [x17, 1776]
	add	x3, x28, x4
	st1	{v31.s}[0], [x0]
	umov	w0, v31.s[1]
	ldr	z31, [x1]
	addvl	x1, sp, #11
	umov	w11, v31.s[0]
	add	x1, x1, 352
	umov	w26, v31.s[1]
	ldr	z31, [x1]
	add	x1, sp, 188
	add	x5, x27, x15
	lsl	x3, x3, 6
	lsl	x5, x5, 6
	add	x3, x3, 1024
	st1	{v31.s}[0], [x1]
	add	x1, sp, 192
	add	x5, x5, 1024
	str	w0, [sp, 184]
	st1	{v31.s}[1], [x1]
	add	x1, sp, 196
	st1	{v17.s}[0], [x1]
	add	x1, sp, 200
	st1	{v17.s}[1], [x1]
	add	x1, sp, 204
	st1	{v18.s}[0], [x1]
	add	x1, sp, 208
	st1	{v18.s}[1], [x1]
	addvl	x1, sp, #15
	add	x1, x1, 352
	ldr	z31, [x1]
	umov	w23, v31.s[1]
	add	x1, sp, 212
	st1	{v31.s}[0], [x1]
	fmov	d31, x5
	add	x5, x26, x11
	add	x1, x30, x2
	sshr	d25, d31, 11
	lsl	x5, x5, 6
	lsl	x1, x1, 6
	add	x5, x5, 1024
	fmov	d31, x5
	add	x5, x21, x13
	add	x1, x1, 1024
	sshr	d27, d31, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	add	x5, x20, x10
	sshr	d26, d31, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	add	x5, x19, x12
	sshr	d28, d31, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	add	x5, x18, x9
	sshr	d30, d31, 11
	lsl	x5, x5, 6
	add	x5, x5, 1024
	fmov	d31, x5
	mov	w5, 83
	sshr	d29, d31, 11
	fmov	d31, x1
	mov	w1, 36
	ushr	d31, d31, 11
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v30.h[0]
	fmov	d30, x3
	smull	x3, w25, w1
	ushr	d30, d30, 11
	smaddl	x3, w7, w5, x3
	add	x3, x3, 1024
	ins	v30.h[1], v27.h[0]
	ins	v30.h[2], v28.h[0]
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x17, -16]
	stp	w7, w22, [sp, 172]
	smull	x7, w24, w1
	smaddl	x7, w22, w5, x7
	smull	x22, w0, w1
	ldr	w0, [sp, 180]
	add	x7, x7, 1024
	smaddl	x22, w0, w5, x22
	ldr	w0, [sp, 192]
	add	x22, x22, 1024
	fmov	d31, x22
	smull	x22, w0, w1
	ldr	w0, [sp, 188]
	sshr	d25, d31, 11
	smaddl	x22, w0, w5, x22
	ldr	w0, [sp, 200]
	add	x22, x22, 1024
	fmov	d31, x22
	smull	x22, w0, w1
	ldr	w0, [sp, 196]
	sshr	d27, d31, 11
	smaddl	x22, w0, w5, x22
	ldr	w0, [sp, 208]
	add	x22, x22, 1024
	fmov	d31, x22
	smull	x22, w0, w1
	ldr	w0, [sp, 204]
	sshr	d26, d31, 11
	smaddl	x22, w0, w5, x22
	ldr	w0, [sp, 212]
	add	x22, x22, 1024
	fmov	d31, x22
	smull	x22, w23, w1
	smaddl	x22, w0, w5, x22
	sshr	d28, d31, 11
	add	x22, x22, 1024
	fmov	d31, x22
	smull	x22, w6, w1
	smaddl	x5, w8, w5, x22
	sshr	d30, d31, 11
	add	x5, x5, 1024
	fmov	d31, x5
	mov	w5, -64
	sshr	d29, d31, 11
	fmov	d31, x3
	mov	w3, 64
	smull	x27, w27, w5
	ushr	d31, d31, 11
	smull	x26, w26, w5
	smaddl	x15, w15, w3, x27
	smaddl	x11, w11, w3, x26
	add	x15, x15, 1024
	smull	x21, w21, w5
	ins	v31.h[1], v25.h[0]
	smaddl	x13, w13, w3, x21
	add	x11, x11, 1024
	smull	x20, w20, w5
	smaddl	x10, w10, w3, x20
	add	x13, x13, 1024
	smull	x19, w19, w5
	ins	v31.h[2], v26.h[0]
	smaddl	x12, w12, w3, x19
	add	x10, x10, 1024
	smull	x18, w18, w5
	smaddl	x9, w9, w3, x18
	add	x12, x12, 1024
	smull	x30, w30, w5
	ins	v31.h[3], v30.h[0]
	fmov	d30, x7
	ldp	w7, w22, [sp, 172]
	ushr	d30, d30, 11
	smaddl	x2, w2, w3, x30
	add	x9, x9, 1024
	smull	x28, w28, w5
	ldr	w5, [sp, 180]
	add	x2, x2, 1024
	smaddl	x4, w4, w3, x28
	ins	v30.h[1], v27.h[0]
	add	x4, x4, 1024
	ins	v30.h[2], v28.h[0]
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x17, 496]
	fmov	d31, x15
	sshr	d25, d31, 11
	fmov	d31, x11
	sshr	d27, d31, 11
	fmov	d31, x13
	sshr	d26, d31, 11
	fmov	d31, x10
	sshr	d28, d31, 11
	fmov	d31, x12
	sshr	d30, d31, 11
	fmov	d31, x9
	sshr	d29, d31, 11
	fmov	d31, x2
	mov	w2, -83
	ushr	d31, d31, 11
	smull	x24, w24, w2
	smaddl	x3, w22, w1, x24
	ldr	w22, [sp, 184]
	smull	x23, w23, w2
	ins	v31.h[1], v25.h[0]
	smull	x6, w6, w2
	smaddl	x8, w8, w1, x6
	add	x3, x3, 1024
	smull	x25, w25, w2
	smaddl	x0, w7, w1, x25
	add	x8, x8, 1024
	ins	v31.h[2], v26.h[0]
	add	x0, x0, 1024
	ins	v31.h[3], v30.h[0]
	fmov	d30, x4
	smull	x4, w22, w2
	ushr	d30, d30, 11
	smaddl	x4, w5, w1, x4
	ldr	w5, [sp, 188]
	add	x4, x4, 1024
	ins	v30.h[1], v27.h[0]
	ins	v30.h[2], v28.h[0]
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x17, 1008]
	fmov	d31, x4
	ldr	w4, [sp, 192]
	sshr	d25, d31, 11
	smull	x4, w4, w2
	smaddl	x4, w5, w1, x4
	add	x4, x4, 1024
	fmov	d31, x4
	ldp	w5, w4, [sp, 196]
	sshr	d27, d31, 11
	smull	x4, w4, w2
	smaddl	x4, w5, w1, x4
	add	x4, x4, 1024
	fmov	d31, x4
	ldp	w5, w4, [sp, 204]
	sshr	d26, d31, 11
	smull	x4, w4, w2
	smaddl	x4, w5, w1, x4
	add	x4, x4, 1024
	fmov	d31, x4
	ldr	w4, [sp, 212]
	sshr	d28, d31, 11
	smaddl	x4, w4, w1, x23
	add	x4, x4, 1024
	fmov	d31, x4
	sshr	d30, d31, 11
	fmov	d31, x8
	sshr	d29, d31, 11
	fmov	d31, x0
	ushr	d31, d31, 11
	ins	v31.h[1], v25.h[0]
	ins	v31.h[2], v26.h[0]
	ins	v31.h[3], v30.h[0]
	fmov	d30, x3
	ushr	d30, d30, 11
	ins	v30.h[1], v27.h[0]
	ins	v30.h[2], v28.h[0]
	ins	v30.h[3], v29.h[0]
	zip1	v31.8h, v31.8h, v30.8h
	str	q31, [x17, 1520]
	cmp	x16, 1024
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
	.cfi_def_cfa_offset 352
	add	sp, sp, 352
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
