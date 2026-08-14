	.arch armv8.2-a+crc+sve2
	.file	"scatter.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB4:
	.cfi_startproc
	addvl	sp, sp, #-31
	.cfi_escape 0xf,0x9,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x22
	ptrue	p7.b, all
	mov	z24.s, #31
	sub	sp, sp, #2112
	.cfi_escape 0xf,0xc,0x8f,0,0x92,0x2e,0,0x8,0xf8,0x1e,0x23,0xc0,0x10,0x22
	mov	z26.s, #78
	mov	z25.s, #61
	addvl	x3, sp, #16
	mov	z5.s, #13
	mov	z27.s, #85
	add	x3, x3, 64
	mov	z23.s, #82
	mov	z3.s, #46
	stp	d8, d9, [sp]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	mov	z8.d, z24.d
	add	x4, x1, x2, lsl 4
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ld1sh	z31.s, p7/z, [x0]
	str	z31, [x3]
	add	x3, x0, 64
	ld1sh	z28.s, p7/z, [x3]
	add	x3, x0, 128
	ld1sh	z21.s, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 192
	ld1sh	z9.s, p7/z, [x3]
	add	x3, x0, 256
	ld1sh	z14.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z14, [x3]
	add	x3, x0, 320
	ld1sh	z10.s, p7/z, [x3]
	add	x3, x0, 384
	ld1sh	z1.s, p7/z, [x3]
	add	x3, x0, 448
	ld1sh	z11.s, p7/z, [x3]
	add	x3, x0, 512
	ld1sh	z12.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z12, [x3]
	add	x3, x0, 576
	ld1sh	z12.s, p7/z, [x3]
	add	x3, x0, 640
	ld1sh	z2.s, p7/z, [x3]
	add	x3, x0, 704
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 768
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 832
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 896
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 960
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 1024
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, x0, 1088
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 1152
	ld1sh	z4.s, p7/z, [x3]
	add	x3, x0, 1216
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 1280
	ld1sh	z30.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z30, [x3]
	mov	z30.s, #88
	add	x3, x0, 1344
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1408
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 1472
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1536
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 1600
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1664
	ld1sh	z6.s, p7/z, [x3]
	add	x3, x0, 1728
	ld1sh	z21.s, p7/z, [x3]
	add	x3, x0, 1792
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	str	z29, [x3]
	mov	z29.s, #90
	add	x3, x0, 1856
	ld1sh	z22.s, p7/z, [x3]
	add	x3, x0, 1920
	ld1sh	z31.s, p7/z, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 1984
	ld1sh	z7.s, p7/z, [x3]
	add	x3, sp, 64
	str	z28, [x3]
	mul	z28.s, z28.s, #90
	movprfx	z31, z28
	mla	z31.s, p7/m, z9.s, z29.s
	mla	z31.s, p7/m, z10.s, z30.s
	mov	z30.s, #73
	mla	z31.s, p7/m, z11.s, z27.s
	addvl	x3, sp, #1
	mla	z31.s, p7/m, z12.s, z23.s
	mla	z31.s, p7/m, z13.s, z26.s
	mov	z26.s, #67
	mla	z31.s, p7/m, z14.s, z30.s
	mov	z30.s, #38
	mla	z31.s, p7/m, z15.s, z26.s
	mla	z31.s, p7/m, z16.s, z25.s
	mov	z25.s, #54
	mla	z31.s, p7/m, z17.s, z25.s
	mla	z31.s, p7/m, z18.s, z3.s
	mla	z31.s, p7/m, z19.s, z30.s
	mla	z31.s, p7/m, z20.s, z24.s
	mov	z24.s, #22
	mla	z31.s, p7/m, z21.s, z24.s
	mla	z31.s, p7/m, z22.s, z5.s
	mov	z5.s, #4
	mla	z31.s, p7/m, z7.s, z5.s
	add	x3, x3, 64
	str	z31, [x3]
	mov	z31.s, #-31
	mov	z5.s, #-4
	mla	z28.s, p7/m, z9.s, z23.s
	mla	z28.s, p7/m, z10.s, z26.s
	mla	z28.s, p7/m, z11.s, z3.s
	mla	z28.s, p7/m, z12.s, z24.s
	mla	z28.s, p7/m, z13.s, z5.s
	mla	z28.s, p7/m, z14.s, z31.s
	mov	z31.s, #-54
	addvl	x3, sp, #2
	mla	z28.s, p7/m, z15.s, z31.s
	mov	z0.d, z31.d
	mov	z24.s, #-85
	mov	z31.s, #-73
	mov	z23.s, #-61
	mov	z30.s, #-90
	mov	z3.s, #-38
	mla	z28.s, p7/m, z16.s, z31.s
	add	x3, x3, 64
	mov	z31.s, #-78
	mla	z28.s, p7/m, z17.s, z24.s
	mov	z24.s, #-88
	mla	z28.s, p7/m, z18.s, z30.s
	mla	z28.s, p7/m, z19.s, z24.s
	mla	z28.s, p7/m, z20.s, z31.s
	mla	z28.s, p7/m, z21.s, z23.s
	mov	z23.s, #-13
	mla	z28.s, p7/m, z22.s, z3.s
	mla	z28.s, p7/m, z7.s, z23.s
	str	z28, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #88
	mla	z28.s, p7/m, z9.s, z26.s
	mla	z28.s, p7/m, z10.s, z8.s
	mov	z8.s, #38
	mla	z28.s, p7/m, z11.s, z23.s
	mov	z23.s, #-82
	mla	z28.s, p7/m, z12.s, z0.s
	mov	z0.d, z8.d
	mla	z28.s, p7/m, z13.s, z23.s
	mov	z23.s, #-46
	mla	z28.s, p7/m, z14.s, z30.s
	mla	z28.s, p7/m, z15.s, z31.s
	mla	z28.s, p7/m, z16.s, z23.s
	mla	z28.s, p7/m, z17.s, z5.s
	mla	z28.s, p7/m, z18.s, z8.s
	mov	z8.s, #73
	mla	z28.s, p7/m, z19.s, z8.s
	mov	z8.s, #61
	mla	z28.s, p7/m, z20.s, z29.s
	mla	z28.s, p7/m, z21.s, z27.s
	mla	z28.s, p7/m, z22.s, z8.s
	addvl	x3, sp, #3
	mov	z8.d, z28.d
	mov	z28.s, #22
	mla	z8.s, p7/m, z7.s, z28.s
	add	x3, x3, 64
	str	z8, [x3]
	mov	z8.s, #46
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, p7/m, z28.s, z27.s
	mla	z28.s, p7/m, z9.s, z8.s
	mov	z8.s, #-13
	mla	z28.s, p7/m, z10.s, z8.s
	mov	z8.s, #-67
	mla	z28.s, p7/m, z11.s, z8.s
	mla	z28.s, p7/m, z12.s, z30.s
	mov	z8.s, #-73
	mla	z28.s, p7/m, z13.s, z8.s
	addvl	x3, sp, #4
	mov	z8.s, #-22
	mla	z28.s, p7/m, z14.s, z8.s
	mla	z28.s, p7/m, z15.s, z0.s
	mov	z8.s, #82
	mla	z28.s, p7/m, z16.s, z8.s
	add	x3, x3, 64
	mov	z8.s, #88
	mla	z28.s, p7/m, z17.s, z8.s
	mla	z28.s, p7/m, z18.s, z25.s
	mov	z8.s, #-61
	mla	z28.s, p7/m, z19.s, z5.s
	mla	z28.s, p7/m, z20.s, z8.s
	mla	z28.s, p7/m, z21.s, z30.s
	mov	z0.d, z8.d
	movprfx	z8, z28
	mla	z8.s, p7/m, z22.s, z31.s
	mov	z28.s, #-31
	mla	z8.s, p7/m, z7.s, z28.s
	str	z8, [x3]
	mov	z8.s, #22
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #82
	mla	z28.s, p7/m, z9.s, z8.s
	mov	z8.s, #-54
	mla	z28.s, p7/m, z10.s, z8.s
	mov	z8.s, #13
	mla	z28.s, p7/m, z11.s, z30.s
	mla	z28.s, p7/m, z12.s, z0.s
	mov	z0.d, z8.d
	mla	z28.s, p7/m, z13.s, z8.s
	mov	z8.s, #78
	mla	z28.s, p7/m, z14.s, z8.s
	mla	z28.s, p7/m, z15.s, z27.s
	mov	z8.s, #31
	mla	z28.s, p7/m, z16.s, z8.s
	mla	z28.s, p7/m, z17.s, z23.s
	mov	z8.s, #-67
	mla	z28.s, p7/m, z18.s, z30.s
	mla	z28.s, p7/m, z19.s, z8.s
	mov	z8.s, #4
	mla	z28.s, p7/m, z20.s, z8.s
	addvl	x3, sp, #5
	mov	z8.s, #73
	mla	z28.s, p7/m, z21.s, z8.s
	add	x3, x3, 64
	mov	z8.s, #88
	mla	z28.s, p7/m, z22.s, z8.s
	mov	z8.s, #38
	mla	z28.s, p7/m, z7.s, z8.s
	str	z28, [x3]
	mov	z8.s, #-82
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #78
	mla	z28.s, p7/m, z9.s, z5.s
	mla	z28.s, p7/m, z10.s, z8.s
	mov	z8.s, #-73
	mla	z28.s, p7/m, z11.s, z8.s
	mla	z28.s, p7/m, z12.s, z0.s
	mov	z8.s, #-22
	mla	z28.s, p7/m, z13.s, z27.s
	mov	z0.d, z8.d
	mla	z28.s, p7/m, z14.s, z26.s
	mla	z28.s, p7/m, z15.s, z8.s
	mov	z8.s, #-61
	mla	z28.s, p7/m, z16.s, z24.s
	addvl	x3, sp, #6
	mla	z28.s, p7/m, z17.s, z8.s
	mov	z8.s, #31
	add	x3, x3, 64
	mla	z28.s, p7/m, z18.s, z8.s
	mov	z8.s, #-31
	mla	z28.s, p7/m, z19.s, z29.s
	mla	z28.s, p7/m, z20.s, z25.s
	mla	z28.s, p7/m, z21.s, z3.s
	mla	z28.s, p7/m, z22.s, z30.s
	mla	z28.s, p7/m, z7.s, z23.s
	str	z28, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #73
	mla	z28.s, p7/m, z9.s, z8.s
	mov	z8.s, #78
	mla	z28.s, p7/m, z10.s, z30.s
	mla	z28.s, p7/m, z11.s, z0.s
	mla	z28.s, p7/m, z12.s, z8.s
	mov	z8.s, #-13
	mla	z28.s, p7/m, z13.s, z26.s
	mla	z28.s, p7/m, z14.s, z3.s
	mla	z28.s, p7/m, z15.s, z30.s
	mla	z28.s, p7/m, z16.s, z8.s
	mov	z8.s, #82
	addvl	x3, sp, #7
	mla	z28.s, p7/m, z17.s, z8.s
	mov	z0.d, z8.d
	mov	z8.s, #61
	add	x3, x3, 64
	mla	z28.s, p7/m, z18.s, z8.s
	mov	z8.s, #-54
	mla	z28.s, p7/m, z19.s, z23.s
	mla	z28.s, p7/m, z20.s, z24.s
	mla	z28.s, p7/m, z21.s, z5.s
	mla	z28.s, p7/m, z22.s, z27.s
	mla	z28.s, p7/m, z7.s, z25.s
	str	z28, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, p7/m, z28.s, z26.s
	mla	z28.s, p7/m, z9.s, z8.s
	mov	z8.s, #38
	mla	z28.s, p7/m, z10.s, z31.s
	mla	z28.s, p7/m, z11.s, z8.s
	mov	z8.s, #-22
	mla	z28.s, p7/m, z12.s, z27.s
	mla	z28.s, p7/m, z13.s, z8.s
	mov	z8.s, #4
	mla	z28.s, p7/m, z14.s, z30.s
	mla	z28.s, p7/m, z15.s, z8.s
	mov	z8.s, #13
	mla	z28.s, p7/m, z16.s, z29.s
	mla	z28.s, p7/m, z17.s, z8.s
	mov	z8.s, #-31
	mla	z28.s, p7/m, z18.s, z24.s
	addvl	x3, sp, #8
	mla	z28.s, p7/m, z19.s, z8.s
	mov	z8.s, #46
	mla	z28.s, p7/m, z20.s, z0.s
	mla	z28.s, p7/m, z21.s, z8.s
	add	x3, x3, 64
	mov	z8.s, #-73
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z8.s
	mov	z28.s, #-61
	mla	z0.s, p7/m, z7.s, z28.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #61
	mla	z28.s, p7/m, z9.s, z8.s
	mov	z8.s, #82
	mla	z28.s, p7/m, z10.s, z23.s
	mla	z28.s, p7/m, z11.s, z8.s
	mov	z8.s, #31
	addvl	x3, sp, #9
	mla	z28.s, p7/m, z12.s, z8.s
	mov	z8.s, #-13
	mla	z28.s, p7/m, z13.s, z24.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z14.s, z8.s
	mov	z8.s, #22
	mla	z28.s, p7/m, z15.s, z29.s
	mla	z28.s, p7/m, z16.s, z5.s
	mla	z28.s, p7/m, z17.s, z30.s
	mla	z28.s, p7/m, z18.s, z8.s
	mla	z28.s, p7/m, z19.s, z27.s
	mla	z28.s, p7/m, z20.s, z3.s
	mov	z3.s, #-85
	mla	z28.s, p7/m, z21.s, z31.s
	mov	z8.s, #-61
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z25.s
	mla	z0.s, p7/m, z7.s, z26.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, p7/m, z28.s, z25.s
	mla	z28.s, p7/m, z9.s, z3.s
	mov	z3.s, #88
	mla	z28.s, p7/m, z10.s, z5.s
	mla	z28.s, p7/m, z11.s, z3.s
	mov	z3.s, #13
	mla	z28.s, p7/m, z12.s, z23.s
	mla	z28.s, p7/m, z13.s, z8.s
	mov	z8.s, #82
	addvl	x3, sp, #10
	mla	z28.s, p7/m, z14.s, z8.s
	mov	z8.s, #38
	mla	z28.s, p7/m, z15.s, z3.s
	mov	z3.s, #-22
	mla	z28.s, p7/m, z16.s, z30.s
	mla	z28.s, p7/m, z17.s, z8.s
	mla	z28.s, p7/m, z18.s, z26.s
	mla	z28.s, p7/m, z19.s, z31.s
	mla	z28.s, p7/m, z20.s, z3.s
	mla	z28.s, p7/m, z21.s, z29.s
	add	x3, x3, 64
	mov	z8.s, #-31
	mov	z3.s, #31
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z8.s
	mov	z28.s, #-73
	mov	z8.s, #38
	mla	z0.s, p7/m, z7.s, z28.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #46
	mla	z28.s, p7/m, z9.s, z30.s
	mla	z28.s, p7/m, z10.s, z8.s
	mla	z28.s, p7/m, z11.s, z25.s
	mla	z28.s, p7/m, z12.s, z30.s
	mla	z28.s, p7/m, z13.s, z3.s
	mov	z3.s, #61
	mla	z28.s, p7/m, z14.s, z3.s
	mov	z3.s, #-85
	mla	z28.s, p7/m, z15.s, z24.s
	mov	z8.s, #22
	mla	z28.s, p7/m, z16.s, z8.s
	mla	z28.s, p7/m, z17.s, z26.s
	mla	z28.s, p7/m, z18.s, z3.s
	mov	z3.s, #13
	mla	z28.s, p7/m, z19.s, z3.s
	mov	z3.s, #73
	addvl	x3, sp, #11
	mla	z28.s, p7/m, z20.s, z3.s
	mov	z3.s, #-82
	mla	z28.s, p7/m, z21.s, z3.s
	add	x3, x3, 64
	mov	z3.s, #4
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z3.s
	mov	z28.s, #78
	mov	z3.s, #73
	mla	z0.s, p7/m, z7.s, z28.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #38
	mla	z28.s, p7/m, z9.s, z24.s
	mla	z28.s, p7/m, z10.s, z3.s
	mla	z28.s, p7/m, z11.s, z5.s
	mov	z5.s, #-67
	mla	z28.s, p7/m, z12.s, z5.s
	addvl	x3, sp, #12
	mov	z5.s, #-31
	mla	z28.s, p7/m, z13.s, z29.s
	mov	z3.s, #61
	mla	z28.s, p7/m, z14.s, z23.s
	mla	z28.s, p7/m, z15.s, z5.s
	mov	z5.s, #13
	mla	z28.s, p7/m, z16.s, z27.s
	mla	z28.s, p7/m, z17.s, z31.s
	mla	z28.s, p7/m, z18.s, z5.s
	mla	z28.s, p7/m, z19.s, z3.s
	mla	z28.s, p7/m, z20.s, z30.s
	mla	z28.s, p7/m, z21.s, z25.s
	add	x3, x3, 64
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z8.s
	mov	z5.s, #4
	mov	z28.s, #-82
	mov	z8.s, #-61
	mla	z0.s, p7/m, z7.s, z28.s
	mov	z3.s, #-38
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #31
	mla	z28.s, p7/m, z9.s, z31.s
	mla	z28.s, p7/m, z10.s, z29.s
	mla	z28.s, p7/m, z11.s, z8.s
	mla	z28.s, p7/m, z12.s, z5.s
	mov	z5.s, #82
	mla	z28.s, p7/m, z13.s, z25.s
	addvl	x3, sp, #13
	mla	z28.s, p7/m, z14.s, z24.s
	mla	z28.s, p7/m, z15.s, z5.s
	mov	z5.s, #-22
	mla	z28.s, p7/m, z16.s, z3.s
	mov	z3.s, #73
	mla	z28.s, p7/m, z17.s, z5.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z18.s, z3.s
	mov	z5.d, z3.d
	mla	z28.s, p7/m, z19.s, z30.s
	mov	z3.s, #-13
	mla	z28.s, p7/m, z20.s, z26.s
	mla	z28.s, p7/m, z21.s, z3.s
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z23.s
	mla	z0.s, p7/m, z7.s, z27.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #22
	mla	z28.s, p7/m, z9.s, z8.s
	mla	z28.s, p7/m, z10.s, z27.s
	mla	z28.s, p7/m, z11.s, z30.s
	mla	z28.s, p7/m, z12.s, z5.s
	mov	z5.s, #-4
	mov	z3.s, #-38
	mla	z28.s, p7/m, z13.s, z3.s
	mla	z28.s, p7/m, z14.s, z5.s
	mov	z5.s, #46
	mla	z28.s, p7/m, z15.s, z5.s
	addvl	x3, sp, #14
	mov	z5.s, #-82
	mla	z28.s, p7/m, z16.s, z31.s
	mla	z28.s, p7/m, z17.s, z29.s
	mla	z28.s, p7/m, z18.s, z5.s
	mov	z5.s, #-13
	mla	z28.s, p7/m, z19.s, z25.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z20.s, z5.s
	mov	z5.s, #-31
	mla	z28.s, p7/m, z21.s, z5.s
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z26.s
	mla	z0.s, p7/m, z7.s, z24.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	mul	z28.s, z28.s, #13
	mla	z28.s, p7/m, z9.s, z3.s
	mov	z3.s, #61
	addvl	x3, sp, #15
	mla	z28.s, p7/m, z10.s, z3.s
	mov	z8.s, #-73
	mov	z3.s, #88
	mla	z28.s, p7/m, z11.s, z31.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z12.s, z3.s
	mov	z3.s, #4
	mla	z28.s, p7/m, z13.s, z30.s
	mla	z28.s, p7/m, z14.s, z27.s
	mla	z28.s, p7/m, z15.s, z8.s
	mov	z8.s, #22
	mla	z28.s, p7/m, z16.s, z25.s
	mla	z28.s, p7/m, z17.s, z5.s
	mla	z28.s, p7/m, z18.s, z3.s
	mla	z28.s, p7/m, z19.s, z8.s
	mla	z28.s, p7/m, z20.s, z23.s
	mla	z28.s, p7/m, z21.s, z26.s
	mov	z5.d, z8.d
	mov	z3.s, #-82
	movprfx	z0, z28
	mla	z0.s, p7/m, z22.s, z3.s
	mla	z0.s, p7/m, z7.s, z29.s
	str	z0, [x3]
	add	x3, sp, 64
	ldr	z28, [x3]
	lsl	z8.s, z28.s, #2
	addvl	x3, sp, #28
	mov	z28.s, #-13
	mad	z9.s, p7/m, z28.s, z8.s
	mov	z8.s, #38
	mad	z10.s, p7/m, z5.s, z9.s
	mov	z5.s, #-31
	mad	z11.s, p7/m, z5.s, z10.s
	mad	z12.s, p7/m, z8.s, z11.s
	mad	z13.s, p7/m, z23.s, z12.s
	add	x3, x3, 64
	mad	z14.s, p7/m, z25.s, z13.s
	mov	z13.s, #-61
	mad	z15.s, p7/m, z13.s, z14.s
	mad	z16.s, p7/m, z26.s, z15.s
	mov	z28.s, #-73
	mad	z17.s, p7/m, z28.s, z16.s
	mov	z16.s, #78
	mad	z18.s, p7/m, z16.s, z17.s
	mad	z19.s, p7/m, z3.s, z18.s
	mad	z20.s, p7/m, z27.s, z19.s
	mad	z21.s, p7/m, z24.s, z20.s
	mad	z22.s, p7/m, z29.s, z21.s
	movprfx	z15, z22
	mla	z15.s, p7/m, z7.s, z30.s
	str	z15, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z7, [x3]
	mov	z22.s, #80
	addvl	x3, sp, #21
	mov	z15.s, #43
	mov	z14.s, #70
	add	x3, x3, 64
	ldr	z3, [x3]
	mov	z12.s, #87
	addvl	x3, sp, #24
	mov	z17.s, #57
	movprfx	z28, z7
	mul	z28.s, p7/m, z28.s, z29.s
	add	x3, x3, 64
	ldr	z5, [x3]
	mla	z28.s, p7/m, z1.s, z12.s
	addvl	x3, sp, #27
	mla	z28.s, p7/m, z2.s, z22.s
	mov	z10.s, #25
	add	x3, x3, 64
	ldr	z8, [x3]
	mov	z22.s, #9
	add	x3, sp, 64
	mla	z28.s, p7/m, z3.s, z14.s
	mla	z28.s, p7/m, z4.s, z17.s
	mla	z28.s, p7/m, z5.s, z15.s
	movprfx	z9, z28
	mla	z9.s, p7/m, z6.s, z10.s
	mla	z9.s, p7/m, z8.s, z22.s
	str	z9, [x3]
	addvl	x3, sp, #17
	mov	z16.s, #-80
	add	x3, x3, 64
	mov	z13.s, #-25
	movprfx	z18, z7
	mul	z18.s, p7/m, z18.s, z14.s
	movprfx	z20, z7
	mul	z20.s, p7/m, z20.s, z12.s
	mov	z28.s, #-70
	mla	z20.s, p7/m, z1.s, z17.s
	movprfx	z9, z7
	mul	z9.s, p7/m, z9.s, z17.s
	mla	z20.s, p7/m, z2.s, z22.s
	mla	z9.s, p7/m, z1.s, z16.s
	mov	z21.s, #-43
	mla	z9.s, p7/m, z2.s, z13.s
	mla	z20.s, p7/m, z3.s, z21.s
	mla	z9.s, p7/m, z3.s, z29.s
	mla	z20.s, p7/m, z4.s, z16.s
	mla	z20.s, p7/m, z5.s, z30.s
	mla	z20.s, p7/m, z6.s, z28.s
	mla	z20.s, p7/m, z8.s, z13.s
	str	z20, [x3]
	addvl	x3, sp, #18
	mov	z19.s, #-87
	mad	z21.s, p7/m, z1.s, z18.s
	add	x3, x3, 64
	movprfx	z20, z7
	mul	z20.s, z20.s, #80
	mov	z18.s, #-9
	mla	z20.s, p7/m, z1.s, z22.s
	mad	z18.s, p7/m, z4.s, z9.s
	mla	z20.s, p7/m, z2.s, z28.s
	movprfx	z9, z7
	mul	z9.s, p7/m, z9.s, z15.s
	mla	z20.s, p7/m, z3.s, z19.s
	mla	z9.s, p7/m, z1.s, z30.s
	mla	z20.s, p7/m, z4.s, z13.s
	mla	z20.s, p7/m, z5.s, z17.s
	mad	z17.s, p7/m, z2.s, z9.s
	movprfx	z0, z7
	mul	z0.s, p7/m, z0.s, z22.s
	mla	z21.s, p7/m, z2.s, z19.s
	mov	z11.s, #-57
	mla	z21.s, p7/m, z3.s, z22.s
	mla	z18.s, p7/m, z5.s, z19.s
	mla	z21.s, p7/m, z4.s, z29.s
	mla	z18.s, p7/m, z6.s, z15.s
	mla	z21.s, p7/m, z5.s, z10.s
	mla	z18.s, p7/m, z8.s, z14.s
	mad	z10.s, p7/m, z3.s, z17.s
	movprfx	z17, z7
	mul	z17.s, z17.s, #25
	mad	z19.s, p7/m, z4.s, z10.s
	mla	z17.s, p7/m, z1.s, z28.s
	mla	z19.s, p7/m, z5.s, z14.s
	mad	z1.s, p7/m, z13.s, z0.s
	mla	z17.s, p7/m, z2.s, z29.s
	mad	z2.s, p7/m, z15.s, z1.s
	mla	z17.s, p7/m, z3.s, z16.s
	mad	z3.s, p7/m, z11.s, z2.s
	mla	z17.s, p7/m, z4.s, z15.s
	mad	z4.s, p7/m, z14.s, z3.s
	ldr	z14, [x3]
	addvl	x3, sp, #20
	mla	z21.s, p7/m, z6.s, z16.s
	add	x3, x3, 64
	mla	z21.s, p7/m, z8.s, z11.s
	mla	z17.s, p7/m, z5.s, z22.s
	mla	z17.s, p7/m, z6.s, z11.s
	ldr	z11, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z10, [x3]
	mov	z28.s, #50
	addvl	x3, sp, #26
	mla	z17.s, p7/m, z8.s, z12.s
	mad	z5.s, p7/m, z16.s, z4.s
	add	x3, x3, 64
	ldr	z1, [x3]
	mla	z20.s, p7/m, z6.s, z29.s
	addvl	x3, sp, #19
	mla	z20.s, p7/m, z8.s, z15.s
	mla	z19.s, p7/m, z6.s, z22.s
	add	x3, x3, 64
	mov	z22.s, #75
	mad	z6.s, p7/m, z12.s, z5.s
	ldr	z12, [x3]
	movprfx	z15, z14
	mul	z15.s, z15.s, #89
	addvl	x3, sp, #25
	mla	z15.s, p7/m, z11.s, z22.s
	mla	z15.s, p7/m, z10.s, z28.s
	mov	z28.s, #-18
	movprfx	z9, z14
	mul	z9.s, p7/m, z9.s, z22.s
	mov	z7.s, #-89
	mla	z9.s, p7/m, z11.s, z28.s
	add	x3, x3, 64
	movprfx	z28, z14
	mul	z28.s, z28.s, #50
	mla	z28.s, p7/m, z11.s, z7.s
	mla	z19.s, p7/m, z8.s, z16.s
	mla	z6.s, p7/m, z8.s, z30.s
	mov	z16.s, #-50
	mov	z8.s, #18
	mla	z15.s, p7/m, z1.s, z8.s
	mad	z8.s, p7/m, z10.s, z28.s
	movprfx	z28, z14
	mul	z28.s, z28.s, #18
	mla	z28.s, p7/m, z11.s, z16.s
	ldr	z11, [x3]
	mla	z28.s, p7/m, z10.s, z22.s
	addvl	x3, sp, #16
	mla	z9.s, p7/m, z10.s, z7.s
	add	x3, x3, 64
	mad	z7.s, p7/m, z1.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #83
	mov	z14.s, #36
	mov	z13.s, #-83
	mad	z14.s, p7/m, z11.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #36
	mad	z13.s, p7/m, z11.s, z28.s
	ldr	z11, [x3]
	addvl	x3, sp, #22
	mla	z9.s, p7/m, z1.s, z16.s
	lsl	z16.s, z11.s, #6
	add	x3, x3, 64
	ldr	z12, [x3]
	mla	z8.s, p7/m, z1.s, z22.s
	add	x3, sp, 64
	mov	z22.s, #64
	mov	z28.s, #-64
	mad	z22.s, p7/m, z12.s, z16.s
	mad	z28.s, p7/m, z12.s, z16.s
	add	z16.s, z22.s, z14.s
	add	z10.s, z16.s, z15.s
	sub	z16.s, z16.s, z15.s
	ldr	z15, [x3]
	addvl	x3, sp, #17
	sub	z22.s, z22.s, z14.s
	add	z14.s, z28.s, z13.s
	add	x3, x3, 64
	ldr	z1, [x3]
	sub	z28.s, z28.s, z13.s
	add	z12.s, z28.s, z8.s
	sub	z28.s, z28.s, z8.s
	add	z0.s, z28.s, z19.s
	sub	z28.s, z28.s, z19.s
	ldr	z19, [x3]
	add	x3, sp, 64
	add	z11.s, z14.s, z9.s
	sub	z14.s, z14.s, z9.s
	add	z9.s, z10.s, z15.s
	sub	z10.s, z10.s, z15.s
	str	z10, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	add	z13.s, z22.s, z7.s
	add	z2.s, z13.s, z21.s
	sub	z13.s, z13.s, z21.s
	ldr	z21, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	add	z21.s, z9.s, z21.s
	str	z21, [x3]
	addvl	x3, sp, #2
	sub	z22.s, z22.s, z7.s
	add	z7.s, z12.s, z20.s
	add	x3, x3, 64
	sub	z12.s, z12.s, z20.s
	ldr	z20, [x3]
	addvl	x3, sp, #3
	add	z8.s, z11.s, z1.s
	sub	z11.s, z11.s, z19.s
	add	x3, x3, 64
	ldr	z19, [x3]
	add	z1.s, z22.s, z18.s
	addvl	x3, sp, #4
	sub	z22.s, z22.s, z18.s
	add	z4.s, z16.s, z6.s
	add	x3, x3, 64
	ldr	z18, [x3]
	sub	z6.s, z16.s, z6.s
	addvl	x3, sp, #5
	add	z16.s, z8.s, z20.s
	add	z3.s, z14.s, z17.s
	add	x3, x3, 64
	ldr	z21, [x3]
	sub	z14.s, z14.s, z17.s
	addvl	x3, sp, #6
	add	z17.s, z7.s, z19.s
	add	z19.s, z1.s, z21.s
	add	x3, x3, 64
	ldr	z20, [x3]
	add	z20.s, z0.s, z20.s
	addvl	x3, sp, #7
	add	z18.s, z2.s, z18.s
	sqrshrnb	z16.h, z16.s, #7
	add	x3, x3, 64
	ldr	z21, [x3]
	add	z21.s, z3.s, z21.s
	addvl	x3, sp, #8
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z5.s, z4.s, z5.s
	addvl	x3, sp, #9
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z15.s, z6.s, z10.s
	addvl	x3, sp, #17
	sunpklo	z17.s, z17.h
	sqrshrnb	z18.h, z18.s, #7
	add	x3, x3, 64
	str	z15, [x3]
	uzp1	z18.h, z18.h, z18.h
	addvl	x3, sp, #10
	sunpklo	z18.s, z18.h
	sqrshrnb	z19.h, z19.s, #7
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z15.s, z14.s, z10.s
	addvl	x3, sp, #18
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x3, x3, 64
	str	z15, [x3]
	sqrshrnb	z20.h, z20.s, #7
	addvl	x3, sp, #11
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z10.s, z28.s, z10.s
	addvl	x3, sp, #19
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x3, x3, 64
	str	z10, [x3]
	sunpklo	z21.s, z21.h
	addvl	x3, sp, #12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z15.s, z22.s, z10.s
	addvl	x3, sp, #20
	sunpklo	z5.s, z5.h
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z10.s, z13.s, z10.s
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z10, [x3]
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z15.s, z12.s, z10.s
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z15, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z10.s, z11.s, z10.s
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z10, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z15, [x3]
	add	x3, sp, 64
	ldr	z10, [x3]
	add	z10.s, z10.s, z15.s
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z10, [x3]
	add	x3, sp, 64
	ldr	z10, [x3]
	sub	z10.s, z10.s, z15.s
	addvl	x3, sp, #15
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	add	x3, x3, 64
	ldr	z15, [x3]
	sub	z15.s, z11.s, z15.s
	add	x3, sp, 64
	str	z15, [x3]
	sunpklo	z10.s, z10.h
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z11, [x3]
	sub	z12.s, z12.s, z11.s
	addvl	x3, sp, #13
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	add	x3, x3, 64
	ldr	z11, [x3]
	sub	z13.s, z13.s, z11.s
	addvl	x3, sp, #12
	sunpklo	z12.s, z12.h
	sqrshrnb	z13.h, z13.s, #7
	add	x3, x3, 64
	ldr	z11, [x3]
	sub	z11.s, z22.s, z11.s
	str	z11, [x3]
	addvl	x3, sp, #11
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z11.s, z28.s, z22.s
	str	z11, [x3]
	addvl	x3, sp, #10
	sunpklo	z13.s, z13.h
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z14.s, z14.s, z22.s
	addvl	x3, sp, #9
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z6.s, z6.s, z28.s
	addvl	x3, sp, #8
	sunpklo	z14.s, z14.h
	sqrshrnb	z6.h, z6.s, #7
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z4.s, z4.s, z22.s
	addvl	x3, sp, #7
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z3.s, z3.s, z22.s
	addvl	x3, sp, #6
	sqrshrnb	z4.h, z4.s, #7
	uzp1	z4.h, z4.h, z4.h
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z0.s, z0.s, z28.s
	addvl	x3, sp, #5
	sunpklo	z4.s, z4.h
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z1.s, z1.s, z22.s
	addvl	x3, sp, #4
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z2.s, z2.s, z28.s
	addvl	x3, sp, #3
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z7.s, z7.s, z22.s
	addvl	x3, sp, #2
	sunpklo	z0.s, z0.h
	sqrshrnb	z1.h, z1.s, #7
	add	x3, x3, 64
	ldr	z28, [x3]
	sub	z8.s, z8.s, z28.s
	addvl	x3, sp, #1
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x3, x3, 64
	ldr	z22, [x3]
	sub	z9.s, z9.s, z22.s
	mov	w3, 8
	whilelo	p6.s, wzr, w3
	sqrshrnb	z2.h, z2.s, #7
	addvl	x3, sp, #16
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x3, x3, 64
	ldr	z28, [x3]
	sqrshrnb	z15.h, z28.s, #7
	mov	w3, 32
	index	z28.s, #0, w3
	uzp1	z15.h, z15.h, z15.h
	addvl	x3, sp, #31
	sunpklo	z15.s, z15.h
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 64
	st1h	z15.s, p6, [x3, z28.s, sxtw 1]
	uzp1	z7.h, z7.h, z7.h
	addvl	x3, sp, #31
	sunpklo	z7.s, z7.h
	sqrshrnb	z8.h, z8.s, #7
	add	x3, x3, 66
	st1h	z16.s, p6, [x3, z28.s, sxtw 1]
	uzp1	z8.h, z8.h, z8.h
	addvl	x3, sp, #31
	sunpklo	z8.s, z8.h
	sqrshrnb	z9.h, z9.s, #7
	add	x3, x3, 68
	st1h	z17.s, p6, [x3, z28.s, sxtw 1]
	uzp1	z9.h, z9.h, z9.h
	addvl	x3, sp, #31
	sunpklo	z9.s, z9.h
	add	x3, x3, 70
	st1h	z18.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 72
	st1h	z19.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 74
	st1h	z20.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 76
	st1h	z21.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 78
	st1h	z5.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z22.h, z15.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 80
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z22.h, z15.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 82
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z21, [x3]
	sqrshrnb	z22.h, z21.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 84
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z22.h, z15.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 86
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z21, [x3]
	sqrshrnb	z22.h, z21.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 88
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z15, [x3]
	sqrshrnb	z22.h, z15.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 90
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z21, [x3]
	sqrshrnb	z22.h, z21.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 92
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z21, [x3]
	sqrshrnb	z22.h, z21.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 94
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 96
	st1h	z10.s, p6, [x3, z28.s, sxtw 1]
	add	x3, sp, 64
	ldr	z22, [x3]
	sqrshrnb	z11.h, z22.s, #7
	addvl	x3, sp, #31
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	add	x3, x3, 98
	st1h	z11.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 100
	st1h	z12.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 102
	st1h	z13.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z11, [x3]
	sqrshrnb	z22.h, z11.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 104
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z11, [x3]
	sqrshrnb	z22.h, z11.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 106
	st1h	z22.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 108
	st1h	z14.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 110
	st1h	z6.s, p6, [x3, z28.s, sxtw 1]
	mov	z6.s, #73
	addvl	x3, sp, #31
	add	x3, x3, 112
	st1h	z4.s, p6, [x3, z28.s, sxtw 1]
	mov	z4.s, #82
	addvl	x3, sp, #31
	add	x3, x3, 114
	st1h	z3.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 116
	st1h	z0.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 118
	st1h	z1.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 120
	st1h	z2.s, p6, [x3, z28.s, sxtw 1]
	mov	z2.s, #88
	addvl	x3, sp, #31
	add	x3, x3, 122
	st1h	z7.s, p6, [x3, z28.s, sxtw 1]
	mov	z7.s, #38
	addvl	x3, sp, #31
	add	x3, x3, 124
	st1h	z8.s, p6, [x3, z28.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 126
	st1h	z9.s, p6, [x3, z28.s, sxtw 1]
	add	x3, x0, 16
	ld1sh	z21.s, p7/z, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 80
	ld1sh	z1.s, p7/z, [x3]
	add	x3, x0, 144
	ld1sh	z21.s, p7/z, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 208
	ld1sh	z8.s, p7/z, [x3]
	add	x3, x0, 272
	ld1sh	z10.s, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	str	z10, [x3]
	add	x3, x0, 336
	ld1sh	z9.s, p7/z, [x3]
	add	x3, x0, 400
	ld1sh	z0.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z0, [x3]
	add	x3, x0, 464
	ld1sh	z10.s, p7/z, [x3]
	add	x3, x0, 528
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 592
	ld1sh	z11.s, p7/z, [x3]
	add	x3, x0, 656
	ld1sh	z3.s, p7/z, [x3]
	add	x3, x0, 720
	ld1sh	z12.s, p7/z, [x3]
	add	x3, x0, 784
	ld1sh	z19.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z19, [x3]
	add	x3, x0, 848
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 912
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z28, [x3]
	add	x3, x0, 976
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 1040
	ld1sh	z15.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z15, [x3]
	add	x3, x0, 1104
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 1168
	ld1sh	z5.s, p7/z, [x3]
	add	x3, x0, 1232
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 1296
	ld1sh	z18.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z18, [x3]
	add	x3, x0, 1360
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 1424
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z28, [x3]
	add	x3, x0, 1488
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 1552
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 1616
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1680
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	str	z28, [x3]
	add	x3, x0, 1744
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1808
	ld1sh	z21.s, p7/z, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 1872
	ld1sh	z21.s, p7/z, [x3]
	add	x3, x0, 1936
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z29.s
	movprfx	z22, z28
	mla	z22.s, p7/m, z8.s, z29.s
	mla	z22.s, p7/m, z9.s, z2.s
	mov	z2.s, #78
	mla	z22.s, p7/m, z10.s, z27.s
	mla	z22.s, p7/m, z11.s, z4.s
	mla	z22.s, p7/m, z12.s, z2.s
	mov	z2.s, #61
	mla	z22.s, p7/m, z13.s, z6.s
	mov	z6.s, #46
	mla	z22.s, p7/m, z14.s, z26.s
	mla	z22.s, p7/m, z15.s, z2.s
	mov	z2.d, z6.d
	mla	z22.s, p7/m, z16.s, z25.s
	mla	z22.s, p7/m, z17.s, z6.s
	mov	z6.s, #31
	mla	z22.s, p7/m, z18.s, z7.s
	mov	z7.s, #22
	mla	z22.s, p7/m, z19.s, z6.s
	mov	z6.s, #13
	mla	z22.s, p7/m, z20.s, z7.s
	mla	z22.s, p7/m, z21.s, z6.s
	add	x3, x0, 2000
	mov	z6.d, z22.d
	ld1sh	z0.s, p7/z, [x3]
	mov	z22.s, #4
	mla	z6.s, p7/m, z0.s, z22.s
	add	x3, sp, 64
	str	z6, [x3]
	mov	z6.s, #-31
	mla	z28.s, p7/m, z8.s, z4.s
	mov	z4.s, #-4
	mla	z28.s, p7/m, z9.s, z26.s
	mla	z28.s, p7/m, z10.s, z2.s
	mla	z28.s, p7/m, z11.s, z7.s
	mla	z28.s, p7/m, z12.s, z4.s
	mla	z28.s, p7/m, z13.s, z6.s
	mov	z6.s, #-85
	mov	z7.s, #-73
	mov	z22.s, #-54
	mov	z2.s, #-38
	mla	z28.s, p7/m, z14.s, z22.s
	mla	z28.s, p7/m, z15.s, z7.s
	mla	z28.s, p7/m, z16.s, z6.s
	mov	z6.s, #-61
	mla	z28.s, p7/m, z17.s, z30.s
	mla	z28.s, p7/m, z18.s, z24.s
	mla	z28.s, p7/m, z19.s, z31.s
	mla	z28.s, p7/m, z20.s, z6.s
	mla	z28.s, p7/m, z21.s, z2.s
	addvl	x3, sp, #1
	mov	z2.d, z28.d
	mov	z28.s, #-13
	mla	z2.s, p7/m, z0.s, z28.s
	mov	z22.d, z28.d
	add	x3, x3, 64
	movprfx	z28, z1
	mul	z28.s, z28.s, #88
	mla	z28.s, p7/m, z8.s, z26.s
	str	z2, [x3]
	mov	z2.s, #31
	mla	z28.s, p7/m, z9.s, z2.s
	mla	z28.s, p7/m, z10.s, z22.s
	mov	z22.s, #-54
	mov	z2.s, #73
	mla	z28.s, p7/m, z11.s, z22.s
	mov	z22.s, #-82
	mla	z28.s, p7/m, z12.s, z22.s
	mov	z22.s, #38
	mla	z28.s, p7/m, z13.s, z30.s
	mla	z28.s, p7/m, z14.s, z31.s
	mla	z28.s, p7/m, z15.s, z23.s
	mla	z28.s, p7/m, z16.s, z4.s
	mla	z28.s, p7/m, z17.s, z22.s
	mla	z28.s, p7/m, z18.s, z2.s
	mov	z2.s, #61
	mla	z28.s, p7/m, z19.s, z29.s
	mla	z28.s, p7/m, z20.s, z27.s
	mla	z28.s, p7/m, z21.s, z2.s
	addvl	x3, sp, #2
	mov	z2.d, z28.d
	mov	z28.s, #22
	mla	z2.s, p7/m, z0.s, z28.s
	add	x3, x3, 64
	str	z2, [x3]
	mov	z2.s, #46
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z27.s
	mla	z28.s, p7/m, z8.s, z2.s
	mov	z2.s, #-13
	mla	z28.s, p7/m, z9.s, z2.s
	mov	z2.s, #-67
	mla	z28.s, p7/m, z10.s, z2.s
	mla	z28.s, p7/m, z11.s, z30.s
	mla	z28.s, p7/m, z12.s, z7.s
	mov	z7.s, #-22
	mla	z28.s, p7/m, z13.s, z7.s
	mov	z7.s, #82
	mla	z28.s, p7/m, z14.s, z22.s
	mla	z28.s, p7/m, z15.s, z7.s
	mov	z7.s, #88
	mla	z28.s, p7/m, z16.s, z7.s
	mov	z7.s, #-31
	mla	z28.s, p7/m, z17.s, z25.s
	addvl	x3, sp, #3
	mla	z28.s, p7/m, z18.s, z4.s
	mla	z28.s, p7/m, z19.s, z6.s
	mla	z28.s, p7/m, z20.s, z30.s
	mla	z28.s, p7/m, z21.s, z31.s
	mla	z28.s, p7/m, z0.s, z7.s
	mov	z7.s, #22
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #82
	mla	z28.s, p7/m, z8.s, z7.s
	mov	z7.s, #-54
	mla	z28.s, p7/m, z9.s, z7.s
	mov	z7.s, #13
	mla	z28.s, p7/m, z10.s, z30.s
	mov	z2.s, #78
	mla	z28.s, p7/m, z11.s, z6.s
	mla	z28.s, p7/m, z12.s, z7.s
	mov	z7.s, #31
	mla	z28.s, p7/m, z13.s, z2.s
	mov	z2.s, #-67
	mla	z28.s, p7/m, z14.s, z27.s
	mla	z28.s, p7/m, z15.s, z7.s
	mov	z7.s, #4
	mla	z28.s, p7/m, z16.s, z23.s
	addvl	x3, sp, #4
	mla	z28.s, p7/m, z17.s, z30.s
	mla	z28.s, p7/m, z18.s, z2.s
	mov	z2.s, #73
	mla	z28.s, p7/m, z19.s, z7.s
	mov	z7.s, #88
	mla	z28.s, p7/m, z20.s, z2.s
	mla	z28.s, p7/m, z21.s, z7.s
	mla	z28.s, p7/m, z0.s, z22.s
	add	x3, x3, 64
	mov	z7.s, #-82
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #78
	mla	z28.s, p7/m, z8.s, z4.s
	mov	z4.s, #13
	mla	z28.s, p7/m, z9.s, z7.s
	mov	z2.s, #31
	mov	z7.s, #-73
	mla	z28.s, p7/m, z10.s, z7.s
	mla	z28.s, p7/m, z11.s, z4.s
	mov	z4.s, #-22
	mla	z28.s, p7/m, z12.s, z27.s
	addvl	x3, sp, #5
	mla	z28.s, p7/m, z13.s, z26.s
	mla	z28.s, p7/m, z14.s, z4.s
	mov	z4.s, #-31
	mla	z28.s, p7/m, z15.s, z24.s
	mla	z28.s, p7/m, z16.s, z6.s
	mla	z28.s, p7/m, z17.s, z2.s
	mov	z2.s, #-38
	mla	z28.s, p7/m, z18.s, z29.s
	mla	z28.s, p7/m, z19.s, z25.s
	mla	z28.s, p7/m, z20.s, z2.s
	mla	z28.s, p7/m, z21.s, z30.s
	mla	z28.s, p7/m, z0.s, z23.s
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #73
	mla	z28.s, p7/m, z8.s, z4.s
	mov	z4.s, #-22
	mla	z28.s, p7/m, z9.s, z30.s
	mla	z28.s, p7/m, z10.s, z4.s
	mov	z4.s, #78
	mla	z28.s, p7/m, z11.s, z4.s
	mla	z28.s, p7/m, z12.s, z26.s
	mov	z4.s, #-13
	mla	z28.s, p7/m, z13.s, z2.s
	mla	z28.s, p7/m, z14.s, z30.s
	mla	z28.s, p7/m, z15.s, z4.s
	mov	z4.s, #82
	mla	z28.s, p7/m, z16.s, z4.s
	mov	z4.s, #61
	mla	z28.s, p7/m, z17.s, z4.s
	addvl	x3, sp, #6
	mov	z4.s, #-4
	mla	z28.s, p7/m, z18.s, z23.s
	mla	z28.s, p7/m, z19.s, z24.s
	mla	z28.s, p7/m, z20.s, z4.s
	mov	z4.s, #-54
	mla	z28.s, p7/m, z21.s, z27.s
	mla	z28.s, p7/m, z0.s, z25.s
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z26.s
	mla	z28.s, p7/m, z8.s, z4.s
	mov	z4.s, #4
	mla	z28.s, p7/m, z9.s, z31.s
	mla	z28.s, p7/m, z10.s, z22.s
	mov	z22.s, #-22
	mla	z28.s, p7/m, z11.s, z27.s
	mla	z28.s, p7/m, z12.s, z22.s
	mov	z22.s, #13
	mla	z28.s, p7/m, z13.s, z30.s
	mla	z28.s, p7/m, z14.s, z4.s
	mov	z4.s, #-31
	mla	z28.s, p7/m, z15.s, z29.s
	addvl	x3, sp, #7
	mla	z28.s, p7/m, z16.s, z22.s
	mov	z22.s, #46
	mla	z28.s, p7/m, z17.s, z24.s
	mla	z28.s, p7/m, z18.s, z4.s
	mov	z4.s, #82
	mla	z28.s, p7/m, z19.s, z4.s
	mla	z28.s, p7/m, z20.s, z22.s
	mla	z28.s, p7/m, z21.s, z7.s
	mla	z28.s, p7/m, z0.s, z6.s
	mov	z6.s, #31
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #61
	mla	z28.s, p7/m, z8.s, z7.s
	mla	z28.s, p7/m, z9.s, z23.s
	mla	z28.s, p7/m, z10.s, z4.s
	mla	z28.s, p7/m, z11.s, z6.s
	mov	z6.s, #-13
	mla	z28.s, p7/m, z12.s, z24.s
	mla	z28.s, p7/m, z13.s, z6.s
	mov	z6.s, #22
	mla	z28.s, p7/m, z14.s, z29.s
	mov	z4.s, #-4
	addvl	x3, sp, #8
	mla	z28.s, p7/m, z15.s, z4.s
	mov	z22.s, #-85
	mla	z28.s, p7/m, z16.s, z30.s
	mla	z28.s, p7/m, z17.s, z6.s
	mov	z6.s, #-61
	mla	z28.s, p7/m, z18.s, z27.s
	mla	z28.s, p7/m, z19.s, z2.s
	mla	z28.s, p7/m, z20.s, z31.s
	mla	z28.s, p7/m, z21.s, z25.s
	mla	z28.s, p7/m, z0.s, z26.s
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z25.s
	mla	z28.s, p7/m, z8.s, z22.s
	mov	z22.s, #13
	mla	z28.s, p7/m, z9.s, z4.s
	mov	z4.s, #88
	mla	z28.s, p7/m, z10.s, z4.s
	mla	z28.s, p7/m, z11.s, z23.s
	mla	z28.s, p7/m, z12.s, z6.s
	mov	z6.s, #82
	addvl	x3, sp, #9
	mla	z28.s, p7/m, z13.s, z6.s
	mov	z2.s, #-22
	mla	z28.s, p7/m, z14.s, z22.s
	mov	z4.s, #-31
	mov	z22.s, #38
	mla	z28.s, p7/m, z15.s, z30.s
	mov	z6.s, #31
	mla	z28.s, p7/m, z16.s, z22.s
	mla	z28.s, p7/m, z17.s, z26.s
	mla	z28.s, p7/m, z18.s, z31.s
	mla	z28.s, p7/m, z19.s, z2.s
	mla	z28.s, p7/m, z20.s, z29.s
	mla	z28.s, p7/m, z21.s, z4.s
	mla	z28.s, p7/m, z0.s, z7.s
	add	x3, x3, 64
	mov	z2.s, #61
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #46
	mla	z28.s, p7/m, z8.s, z30.s
	mla	z28.s, p7/m, z9.s, z22.s
	mla	z28.s, p7/m, z10.s, z25.s
	mla	z28.s, p7/m, z11.s, z30.s
	mla	z28.s, p7/m, z12.s, z6.s
	mov	z6.s, #22
	mla	z28.s, p7/m, z13.s, z2.s
	mov	z2.s, #73
	mla	z28.s, p7/m, z14.s, z24.s
	mla	z28.s, p7/m, z15.s, z6.s
	mov	z6.s, #-85
	mla	z28.s, p7/m, z16.s, z26.s
	mov	z4.d, z2.d
	mla	z28.s, p7/m, z17.s, z6.s
	mov	z6.s, #13
	mla	z28.s, p7/m, z18.s, z6.s
	mla	z28.s, p7/m, z19.s, z2.s
	mov	z2.s, #-82
	mla	z28.s, p7/m, z20.s, z2.s
	mov	z2.s, #4
	mla	z28.s, p7/m, z21.s, z2.s
	addvl	x3, sp, #10
	mov	z2.d, z28.d
	mov	z28.s, #78
	mla	z2.s, p7/m, z0.s, z28.s
	add	x3, x3, 64
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z22.s
	mla	z28.s, p7/m, z8.s, z24.s
	mla	z28.s, p7/m, z9.s, z4.s
	mov	z4.s, #-4
	str	z2, [x3]
	mov	z2.s, #-67
	mla	z28.s, p7/m, z10.s, z4.s
	mov	z4.s, #-31
	mla	z28.s, p7/m, z11.s, z2.s
	mov	z2.s, #61
	mla	z28.s, p7/m, z12.s, z29.s
	mla	z28.s, p7/m, z13.s, z23.s
	mla	z28.s, p7/m, z14.s, z4.s
	mla	z28.s, p7/m, z15.s, z27.s
	mla	z28.s, p7/m, z16.s, z31.s
	mla	z28.s, p7/m, z17.s, z6.s
	mov	z6.s, #22
	mla	z28.s, p7/m, z18.s, z2.s
	mla	z28.s, p7/m, z19.s, z30.s
	mla	z28.s, p7/m, z20.s, z25.s
	mla	z28.s, p7/m, z21.s, z6.s
	addvl	x3, sp, #11
	mov	z6.d, z28.d
	mov	z4.s, #4
	mov	z28.s, #-82
	mov	z2.s, #-38
	mla	z6.s, p7/m, z0.s, z28.s
	add	x3, x3, 64
	movprfx	z28, z1
	mul	z28.s, z28.s, #31
	mla	z28.s, p7/m, z8.s, z31.s
	mla	z28.s, p7/m, z9.s, z29.s
	str	z6, [x3]
	mov	z6.s, #-61
	mla	z28.s, p7/m, z10.s, z6.s
	mla	z28.s, p7/m, z11.s, z4.s
	mov	z4.s, #82
	mla	z28.s, p7/m, z12.s, z25.s
	mla	z28.s, p7/m, z13.s, z24.s
	mla	z28.s, p7/m, z14.s, z4.s
	mla	z28.s, p7/m, z15.s, z2.s
	mov	z2.s, #-22
	mla	z28.s, p7/m, z16.s, z2.s
	addvl	x3, sp, #12
	mov	z2.s, #73
	mla	z28.s, p7/m, z17.s, z2.s
	mov	z4.d, z2.d
	mla	z28.s, p7/m, z18.s, z30.s
	mov	z2.s, #-13
	mla	z28.s, p7/m, z19.s, z26.s
	mla	z28.s, p7/m, z20.s, z2.s
	movprfx	z2, z28
	mla	z2.s, p7/m, z21.s, z23.s
	mla	z2.s, p7/m, z0.s, z27.s
	movprfx	z28, z1
	mul	z28.s, z28.s, #22
	mla	z28.s, p7/m, z8.s, z6.s
	mla	z28.s, p7/m, z9.s, z27.s
	mla	z28.s, p7/m, z10.s, z30.s
	mla	z28.s, p7/m, z11.s, z4.s
	mov	z4.s, #-4
	add	x3, x3, 64
	str	z2, [x3]
	mov	z2.s, #-38
	mla	z28.s, p7/m, z12.s, z2.s
	mla	z28.s, p7/m, z13.s, z4.s
	mov	z4.s, #46
	mla	z28.s, p7/m, z14.s, z4.s
	mov	z4.s, #-82
	mla	z28.s, p7/m, z15.s, z31.s
	mla	z28.s, p7/m, z16.s, z29.s
	mla	z28.s, p7/m, z17.s, z4.s
	mov	z4.s, #-13
	mla	z28.s, p7/m, z18.s, z25.s
	addvl	x3, sp, #13
	mla	z28.s, p7/m, z19.s, z4.s
	mov	z4.s, #-31
	mla	z28.s, p7/m, z20.s, z4.s
	mla	z28.s, p7/m, z21.s, z26.s
	mla	z28.s, p7/m, z0.s, z24.s
	add	x3, x3, 64
	str	z28, [x3]
	movprfx	z28, z1
	mul	z28.s, z28.s, #13
	mla	z28.s, p7/m, z8.s, z2.s
	mov	z2.s, #61
	mla	z28.s, p7/m, z9.s, z2.s
	addvl	x3, sp, #29
	mad	z31.s, p7/m, z10.s, z28.s
	mov	z28.s, #88
	add	x3, x3, 64
	mla	z31.s, p7/m, z11.s, z28.s
	mov	z28.s, #4
	mla	z31.s, p7/m, z12.s, z30.s
	mov	z2.s, #-82
	mla	z31.s, p7/m, z13.s, z27.s
	mla	z31.s, p7/m, z14.s, z7.s
	mla	z31.s, p7/m, z15.s, z25.s
	mla	z31.s, p7/m, z16.s, z4.s
	mla	z31.s, p7/m, z17.s, z28.s
	mov	z28.s, #22
	mla	z31.s, p7/m, z18.s, z28.s
	mla	z31.s, p7/m, z19.s, z23.s
	mla	z31.s, p7/m, z20.s, z26.s
	mla	z31.s, p7/m, z21.s, z2.s
	mla	z31.s, p7/m, z0.s, z29.s
	str	z31, [x3]
	addvl	x3, sp, #14
	lsl	z1.s, z1.s, #2
	mov	z31.s, #-13
	add	x3, x3, 64
	mad	z8.s, p7/m, z31.s, z1.s
	mad	z9.s, p7/m, z28.s, z8.s
	mad	z10.s, p7/m, z4.s, z9.s
	mad	z11.s, p7/m, z22.s, z10.s
	mad	z12.s, p7/m, z23.s, z11.s
	mad	z13.s, p7/m, z25.s, z12.s
	mad	z14.s, p7/m, z6.s, z13.s
	mad	z15.s, p7/m, z26.s, z14.s
	mov	z26.s, #78
	mad	z16.s, p7/m, z7.s, z15.s
	mad	z17.s, p7/m, z26.s, z16.s
	mad	z18.s, p7/m, z2.s, z17.s
	mad	z19.s, p7/m, z27.s, z18.s
	mad	z20.s, p7/m, z24.s, z19.s
	mad	z21.s, p7/m, z29.s, z20.s
	movprfx	z23, z21
	mla	z23.s, p7/m, z0.s, z30.s
	str	z23, [x3]
	addvl	x3, sp, #16
	mov	z14.s, #-70
	mov	z24.s, #80
	add	x3, x3, 64
	ldr	z17, [x3]
	mov	z23.s, #9
	addvl	x3, sp, #18
	mov	z16.s, #57
	mov	z13.s, #87
	add	x3, x3, 64
	ldr	z18, [x3]
	mov	z15.s, #-25
	addvl	x3, sp, #21
	movprfx	z28, z17
	mul	z28.s, p7/m, z28.s, z29.s
	mov	z20.s, #25
	add	x3, x3, 64
	ldr	z8, [x3]
	mla	z28.s, p7/m, z18.s, z13.s
	addvl	x3, sp, #24
	mla	z28.s, p7/m, z3.s, z24.s
	movprfx	z27, z17
	mul	z27.s, p7/m, z27.s, z13.s
	add	x3, x3, 64
	ldr	z9, [x3]
	mov	z24.s, #-80
	addvl	x3, sp, #26
	mla	z27.s, p7/m, z18.s, z16.s
	mov	z11.s, #-43
	add	x3, x3, 64
	ldr	z10, [x3]
	mla	z27.s, p7/m, z3.s, z23.s
	addvl	x3, sp, #28
	mla	z27.s, p7/m, z8.s, z11.s
	mov	z1.d, z14.d
	add	x3, x3, 64
	ldr	z26, [x3]
	mla	z27.s, p7/m, z5.s, z24.s
	addvl	x3, sp, #17
	mla	z27.s, p7/m, z9.s, z30.s
	movprfx	z31, z17
	mul	z31.s, z31.s, #80
	mla	z27.s, p7/m, z10.s, z14.s
	mla	z31.s, p7/m, z18.s, z23.s
	mla	z31.s, p7/m, z3.s, z14.s
	mov	z14.s, #-87
	mla	z31.s, p7/m, z8.s, z14.s
	mla	z31.s, p7/m, z5.s, z15.s
	mla	z31.s, p7/m, z9.s, z16.s
	mov	z19.s, #43
	mov	z21.s, #70
	mla	z27.s, p7/m, z26.s, z15.s
	mla	z28.s, p7/m, z8.s, z21.s
	mad	z29.s, p7/m, z10.s, z31.s
	mla	z28.s, p7/m, z5.s, z16.s
	mov	z31.d, z26.d
	mla	z29.s, p7/m, z26.s, z19.s
	mla	z28.s, p7/m, z9.s, z19.s
	mov	z30.s, #90
	mla	z28.s, p7/m, z10.s, z20.s
	add	x3, x3, 64
	mla	z28.s, p7/m, z26.s, z23.s
	mov	z0.s, #-9
	movprfx	z26, z17
	mul	z26.s, p7/m, z26.s, z21.s
	mla	z26.s, p7/m, z18.s, z11.s
	mov	z11.d, z20.d
	mla	z26.s, p7/m, z3.s, z14.s
	mla	z26.s, p7/m, z8.s, z23.s
	mla	z26.s, p7/m, z5.s, z30.s
	mla	z26.s, p7/m, z9.s, z20.s
	mov	z20.s, #-57
	mla	z26.s, p7/m, z10.s, z24.s
	mov	z22.d, z20.d
	mla	z26.s, p7/m, z31.s, z20.s
	movprfx	z25, z17
	mul	z25.s, p7/m, z25.s, z16.s
	mov	z20.d, z24.d
	mla	z25.s, p7/m, z18.s, z24.s
	movprfx	z24, z17
	mul	z24.s, p7/m, z24.s, z19.s
	mla	z25.s, p7/m, z3.s, z15.s
	mla	z25.s, p7/m, z8.s, z30.s
	mla	z25.s, p7/m, z5.s, z0.s
	mov	z0.s, #-90
	mla	z25.s, p7/m, z9.s, z14.s
	mla	z24.s, p7/m, z18.s, z0.s
	mla	z25.s, p7/m, z10.s, z19.s
	mla	z24.s, p7/m, z3.s, z16.s
	mla	z25.s, p7/m, z31.s, z21.s
	mla	z24.s, p7/m, z8.s, z11.s
	mov	z16.d, z21.d
	mla	z24.s, p7/m, z5.s, z14.s
	mla	z24.s, p7/m, z9.s, z21.s
	mov	z21.d, z23.d
	mla	z24.s, p7/m, z10.s, z23.s
	movprfx	z23, z17
	mul	z23.s, p7/m, z23.s, z11.s
	mla	z24.s, p7/m, z31.s, z20.s
	mla	z23.s, p7/m, z18.s, z1.s
	mla	z23.s, p7/m, z3.s, z30.s
	mov	z30.d, z31.d
	mla	z23.s, p7/m, z8.s, z20.s
	mla	z23.s, p7/m, z5.s, z19.s
	mla	z23.s, p7/m, z9.s, z21.s
	mla	z23.s, p7/m, z10.s, z22.s
	mla	z23.s, p7/m, z31.s, z13.s
	movprfx	z31, z17
	mul	z31.s, z31.s, #9
	mla	z31.s, p7/m, z18.s, z15.s
	mad	z3.s, p7/m, z19.s, z31.s
	movprfx	z4, z3
	mla	z4.s, p7/m, z8.s, z22.s
	mad	z5.s, p7/m, z16.s, z4.s
	movprfx	z6, z5
	mla	z6.s, p7/m, z9.s, z20.s
	movprfx	z7, z6
	mla	z7.s, p7/m, z10.s, z13.s
	ldr	z10, [x3]
	addvl	x3, sp, #20
	mov	z3.s, #50
	mov	z18.s, #-18
	add	x3, x3, 64
	ldr	z13, [x3]
	mla	z7.s, p7/m, z30.s, z0.s
	addvl	x3, sp, #23
	mov	z30.s, #75
	movprfx	z20, z10
	mul	z20.s, z20.s, #89
	add	x3, x3, 64
	ldr	z21, [x3]
	mla	z20.s, p7/m, z13.s, z30.s
	addvl	x3, sp, #27
	mla	z20.s, p7/m, z21.s, z3.s
	movprfx	z19, z10
	mul	z19.s, p7/m, z19.s, z30.s
	add	x3, x3, 64
	ldr	z31, [x3]
	mov	z3.s, #18
	addvl	x3, sp, #19
	mla	z19.s, p7/m, z13.s, z18.s
	movprfx	z17, z10
	mul	z17.s, p7/m, z17.s, z3.s
	add	x3, x3, 64
	movprfx	z18, z10
	mul	z18.s, z18.s, #50
	ldr	z10, [x3]
	addvl	x3, sp, #25
	mov	z11.s, #-89
	mov	z14.s, #-50
	add	x3, x3, 64
	ldr	z9, [x3]
	mla	z19.s, p7/m, z21.s, z11.s
	addvl	x3, sp, #15
	mla	z18.s, p7/m, z13.s, z11.s
	mla	z17.s, p7/m, z13.s, z14.s
	add	x3, x3, 64
	mla	z18.s, p7/m, z21.s, z3.s
	mla	z17.s, p7/m, z21.s, z30.s
	movprfx	z16, z10
	mul	z16.s, z16.s, #83
	mov	z21.s, #36
	mla	z16.s, p7/m, z9.s, z21.s
	movprfx	z22, z10
	mul	z22.s, p7/m, z22.s, z21.s
	mov	z10.s, #-83
	mla	z22.s, p7/m, z9.s, z10.s
	ldr	z9, [x3]
	addvl	x3, sp, #22
	mla	z20.s, p7/m, z31.s, z3.s
	add	x3, x3, 64
	ldr	z10, [x3]
	mla	z18.s, p7/m, z31.s, z30.s
	mla	z17.s, p7/m, z31.s, z11.s
	mla	z19.s, p7/m, z31.s, z14.s
	add	x3, sp, 64
	lsl	z31.s, z9.s, #6
	mov	z9.s, #64
	movprfx	z30, z31
	mla	z30.s, p7/m, z9.s, z10.s
	mov	z9.d, z10.d
	add	z21.s, z30.s, z16.s
	mov	z10.s, #-64
	sub	z30.s, z30.s, z16.s
	mla	z31.s, p7/m, z9.s, z10.s
	add	z16.s, z31.s, z22.s
	sub	z31.s, z31.s, z22.s
	add	z22.s, z31.s, z18.s
	sub	z31.s, z31.s, z18.s
	add	z3.s, z31.s, z24.s
	sub	z31.s, z31.s, z24.s
	ldr	z24, [x3]
	addvl	x3, sp, #1
	add	z13.s, z21.s, z20.s
	sub	z21.s, z21.s, z20.s
	add	x3, x3, 64
	ldr	z20, [x3]
	add	z15.s, z30.s, z17.s
	addvl	x3, sp, #2
	sub	z30.s, z30.s, z17.s
	add	z8.s, z30.s, z25.s
	add	x3, x3, 64
	sub	z30.s, z30.s, z25.s
	ldr	z25, [x3]
	addvl	x3, sp, #3
	add	z12.s, z13.s, z28.s
	add	z17.s, z12.s, z24.s
	add	x3, x3, 64
	ldr	z24, [x3]
	add	z14.s, z16.s, z19.s
	addvl	x3, sp, #16
	add	z11.s, z14.s, z27.s
	add	z9.s, z15.s, z26.s
	add	x3, x3, 64
	add	z18.s, z11.s, z20.s
	add	z20.s, z9.s, z24.s
	str	z20, [x3]
	addvl	x3, sp, #4
	add	z1.s, z21.s, z7.s
	add	x3, x3, 64
	sub	z7.s, z21.s, z7.s
	ldr	z21, [x3]
	addvl	x3, sp, #5
	sub	z15.s, z15.s, z26.s
	add	z10.s, z22.s, z29.s
	add	x3, x3, 64
	ldr	z26, [x3]
	sub	z16.s, z16.s, z19.s
	addvl	x3, sp, #6
	add	z19.s, z10.s, z25.s
	sub	z14.s, z14.s, z27.s
	add	x3, x3, 64
	ldr	z25, [x3]
	sub	z29.s, z22.s, z29.s
	addvl	x3, sp, #7
	add	z22.s, z3.s, z26.s
	sub	z13.s, z13.s, z28.s
	add	x3, x3, 64
	ldr	z24, [x3]
	add	z2.s, z16.s, z23.s
	addvl	x3, sp, #8
	sub	z16.s, z16.s, z23.s
	add	z23.s, z2.s, z25.s
	add	x3, x3, 64
	ldr	z27, [x3]
	add	z25.s, z7.s, z27.s
	addvl	x3, sp, #15
	add	z24.s, z1.s, z24.s
	add	z21.s, z8.s, z21.s
	add	x3, x3, 64
	str	z7, [x3]
	sqrshrnb	z17.h, z17.s, #7
	addvl	x3, sp, #9
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x3, 64
	ldr	z26, [x3]
	add	z26.s, z16.s, z26.s
	addvl	x3, sp, #10
	sqrshrnb	z18.h, z18.s, #7
	uzp1	z18.h, z18.h, z18.h
	add	x3, x3, 64
	ldr	z28, [x3]
	add	z27.s, z31.s, z28.s
	addvl	x3, sp, #11
	sunpklo	z18.s, z18.h
	sqrshrnb	z19.h, z19.s, #7
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z28.s, z30.s, z5.s
	addvl	x3, sp, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x3, x3, 64
	ldr	z6, [x3]
	add	z6.s, z15.s, z6.s
	addvl	x3, sp, #13
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z5.s, z29.s, z5.s
	addvl	x3, sp, #29
	sunpklo	z21.s, z21.h
	sqrshrnb	z22.h, z22.s, #7
	add	x3, x3, 64
	ldr	z7, [x3]
	add	z4.s, z14.s, z7.s
	addvl	x3, sp, #14
	sub	z14.s, z14.s, z7.s
	uzp1	z22.h, z22.h, z22.h
	add	x3, x3, 64
	ldr	z20, [x3]
	add	z20.s, z13.s, z20.s
	addvl	x3, sp, #17
	sunpklo	z22.s, z22.h
	sqrshrnb	z23.h, z23.s, #7
	add	x3, x3, 64
	str	z20, [x3]
	uzp1	z23.h, z23.h, z23.h
	addvl	x3, sp, #14
	sunpklo	z23.s, z23.h
	sqrshrnb	z24.h, z24.s, #7
	add	x3, x3, 64
	ldr	z20, [x3]
	sub	z13.s, z13.s, z20.s
	addvl	x3, sp, #13
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x3, x3, 64
	ldr	z7, [x3]
	sub	z29.s, z29.s, z7.s
	str	z29, [x3]
	addvl	x3, sp, #12
	sqrshrnb	z25.h, z25.s, #7
	add	x3, x3, 64
	ldr	z29, [x3]
	sub	z15.s, z15.s, z29.s
	addvl	x3, sp, #11
	uzp1	z25.h, z25.h, z25.h
	sunpklo	z25.s, z25.h
	add	x3, x3, 64
	ldr	z29, [x3]
	sub	z30.s, z30.s, z29.s
	addvl	x3, sp, #10
	sqrshrnb	z26.h, z26.s, #7
	uzp1	z26.h, z26.h, z26.h
	add	x3, x3, 64
	ldr	z29, [x3]
	sub	z29.s, z31.s, z29.s
	str	z29, [x3]
	addvl	x3, sp, #9
	sunpklo	z26.s, z26.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z16.s, z16.s, z31.s
	addvl	x3, sp, #8
	sqrshrnb	z27.h, z27.s, #7
	uzp1	z27.h, z27.h, z27.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sunpklo	z27.s, z27.h
	addvl	x3, sp, #15
	sqrshrnb	z28.h, z28.s, #7
	uzp1	z28.h, z28.h, z28.h
	add	x3, x3, 64
	ldr	z7, [x3]
	sub	z7.s, z7.s, z31.s
	addvl	x3, sp, #7
	sunpklo	z28.s, z28.h
	sqrshrnb	z6.h, z6.s, #7
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z1.s, z1.s, z31.s
	addvl	x3, sp, #6
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z2.s, z2.s, z31.s
	addvl	x3, sp, #5
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z3.s, z3.s, z31.s
	addvl	x3, sp, #4
	sunpklo	z5.s, z5.h
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z8.s, z8.s, z31.s
	addvl	x3, sp, #3
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z9.s, z9.s, z31.s
	addvl	x3, sp, #2
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z10.s, z10.s, z31.s
	addvl	x3, sp, #1
	sunpklo	z13.s, z13.h
	sqrshrnb	z14.h, z14.s, #7
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z11.s, z11.s, z31.s
	add	x3, sp, 64
	ldr	z31, [x3]
	sub	z12.s, z12.s, z31.s
	mov	w3, 32
	index	z31.s, #0, w3
	uzp1	z14.h, z14.h, z14.h
	addvl	x3, sp, #31
	sunpklo	z14.s, z14.h
	sqrshrnb	z15.h, z15.s, #7
	add	x3, x3, 576
	st1h	z17.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z15.h, z15.h, z15.h
	addvl	x3, sp, #31
	sunpklo	z15.s, z15.h
	sqrshrnb	z30.h, z30.s, #7
	add	x3, x3, 578
	st1h	z18.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z30.h, z30.h, z30.h
	addvl	x3, sp, #31
	sunpklo	z30.s, z30.h
	sqrshrnb	z16.h, z16.s, #7
	add	x3, x3, 580
	st1h	z19.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z16.h, z16.h, z16.h
	addvl	x3, sp, #16
	sunpklo	z16.s, z16.h
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 64
	ldr	z20, [x3]
	sqrshrnb	z20.h, z20.s, #7
	addvl	x3, sp, #31
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	add	x3, x3, 582
	st1h	z20.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z7.h, z7.h, z7.h
	addvl	x3, sp, #31
	sunpklo	z7.s, z7.h
	sqrshrnb	z1.h, z1.s, #7
	add	x3, x3, 584
	st1h	z21.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z1.h, z1.h, z1.h
	addvl	x3, sp, #31
	sunpklo	z1.s, z1.h
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 586
	st1h	z22.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z2.h, z2.h, z2.h
	addvl	x3, sp, #31
	sunpklo	z2.s, z2.h
	sqrshrnb	z3.h, z3.s, #7
	add	x3, x3, 588
	st1h	z23.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z3.h, z3.h, z3.h
	addvl	x3, sp, #31
	sunpklo	z3.s, z3.h
	sqrshrnb	z8.h, z8.s, #7
	add	x3, x3, 590
	st1h	z24.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z8.h, z8.h, z8.h
	addvl	x3, sp, #31
	sunpklo	z8.s, z8.h
	sqrshrnb	z9.h, z9.s, #7
	add	x3, x3, 592
	st1h	z25.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z9.h, z9.h, z9.h
	addvl	x3, sp, #31
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #7
	add	x3, x3, 594
	st1h	z26.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z10.h, z10.h, z10.h
	addvl	x3, sp, #31
	sunpklo	z10.s, z10.h
	sqrshrnb	z11.h, z11.s, #7
	add	x3, x3, 596
	st1h	z27.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z11.h, z11.h, z11.h
	addvl	x3, sp, #31
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 598
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z12.h, z12.h, z12.h
	addvl	x3, sp, #31
	sunpklo	z12.s, z12.h
	mov	z27.s, #82
	add	x3, x3, 600
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	mov	z6.s, #54
	addvl	x3, sp, #31
	add	x3, x3, 602
	st1h	z5.s, p6, [x3, z31.s, sxtw 1]
	mov	z5.s, #61
	addvl	x3, sp, #31
	add	x3, x3, 604
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z24, [x3]
	sqrshrnb	z28.h, z24.s, #7
	addvl	x3, sp, #31
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x3, x3, 606
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	mov	z28.s, #38
	addvl	x3, sp, #31
	add	x3, x3, 608
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 610
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z29, [x3]
	sqrshrnb	z29.h, z29.s, #7
	addvl	x3, sp, #31
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	add	x3, x3, 612
	st1h	z29.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 614
	st1h	z15.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 616
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z29, [x3]
	sqrshrnb	z30.h, z29.s, #7
	addvl	x3, sp, #31
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x3, x3, 618
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 620
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 622
	st1h	z7.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 624
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	mov	z1.s, #31
	addvl	x3, sp, #31
	mov	z4.d, z1.d
	add	x3, x3, 626
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	mov	z2.s, #73
	addvl	x3, sp, #31
	add	x3, x3, 628
	st1h	z3.s, p6, [x3, z31.s, sxtw 1]
	mov	z3.s, #4
	addvl	x3, sp, #31
	add	x3, x3, 630
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	mov	z8.s, #90
	addvl	x3, sp, #31
	add	x3, x3, 632
	st1h	z9.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 634
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 636
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 638
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	mov	z12.s, #78
	add	x3, x0, 32
	ld1sh	z24.s, p7/z, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	str	z24, [x3]
	add	x3, x0, 96
	ld1sh	z11.s, p7/z, [x3]
	add	x3, x0, 160
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #16
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 224
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 288
	ld1sh	z24.s, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	str	z24, [x3]
	add	x3, x0, 352
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 416
	ld1sh	z25.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z25, [x3]
	add	x3, x0, 480
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 544
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 608
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 672
	ld1sh	z24.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z24, [x3]
	add	x3, x0, 736
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 800
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z29, [x3]
	add	x3, x0, 864
	ld1sh	z18.s, p7/z, [x3]
	add	x3, x0, 928
	ld1sh	z10.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z10, [x3]
	add	x3, x0, 992
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1056
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z9, [x3]
	add	x3, x0, 1120
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1184
	ld1sh	z21.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z21, [x3]
	add	x3, x0, 1248
	ld1sh	z21.s, p7/z, [x3]
	add	x3, x0, 1312
	ld1sh	z9.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z9, [x3]
	add	x3, x0, 1376
	ld1sh	z22.s, p7/z, [x3]
	add	x3, x0, 1440
	ld1sh	z25.s, p7/z, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	str	z25, [x3]
	add	x3, x0, 1504
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1568
	ld1sh	z24.s, p7/z, [x3]
	addvl	x3, sp, #27
	add	x3, x3, 64
	str	z24, [x3]
	add	x3, x0, 1632
	ld1sh	z24.s, p7/z, [x3]
	add	x3, x0, 1696
	ld1sh	z29.s, p7/z, [x3]
	addvl	x3, sp, #28
	add	x3, x3, 64
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, z29.s, #90
	add	x3, x0, 1760
	ld1sh	z25.s, p7/z, [x3]
	movprfx	z30, z29
	mla	z30.s, p7/m, z8.s, z13.s
	add	x3, x0, 1824
	ld1sh	z7.s, p7/z, [x3]
	mov	z8.s, #88
	addvl	x3, sp, #29
	mla	z30.s, p7/m, z14.s, z8.s
	mov	z8.s, #85
	add	x3, x3, 64
	str	z7, [x3]
	mla	z30.s, p7/m, z15.s, z8.s
	add	x3, x0, 1888
	ld1sh	z26.s, p7/z, [x3]
	mov	z7.s, #67
	add	x3, x0, 1952
	ld1sh	z10.s, p7/z, [x3]
	mla	z30.s, p7/m, z16.s, z27.s
	addvl	x3, sp, #30
	mla	z30.s, p7/m, z17.s, z12.s
	mla	z30.s, p7/m, z18.s, z2.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z19.s, z7.s
	mla	z30.s, p7/m, z20.s, z5.s
	mov	z5.s, #46
	mla	z30.s, p7/m, z21.s, z6.s
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z28.s
	mla	z30.s, p7/m, z24.s, z1.s
	mov	z1.s, #22
	mla	z30.s, p7/m, z25.s, z1.s
	mla	z29.s, p7/m, z13.s, z27.s
	mov	z12.s, #-78
	mla	z29.s, p7/m, z14.s, z7.s
	mla	z29.s, p7/m, z15.s, z5.s
	mov	z5.s, #-85
	str	z10, [x3]
	mov	z10.s, #13
	add	x3, x0, 2016
	movprfx	z28, z30
	mla	z28.s, p7/m, z26.s, z10.s
	ld1sh	z9.s, p7/z, [x3]
	mov	z30.s, #-31
	mla	z28.s, p7/m, z9.s, z3.s
	mla	z29.s, p7/m, z16.s, z1.s
	add	x3, sp, 64
	mov	z27.s, #-73
	str	z28, [x3]
	mov	z28.s, #-4
	mla	z29.s, p7/m, z17.s, z28.s
	mla	z29.s, p7/m, z18.s, z30.s
	mov	z30.s, #-54
	mla	z29.s, p7/m, z19.s, z30.s
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z5.s
	mov	z5.s, #-88
	mla	z29.s, p7/m, z22.s, z0.s
	mla	z29.s, p7/m, z23.s, z5.s
	mla	z29.s, p7/m, z24.s, z12.s
	mov	z12.s, #-38
	mov	z27.s, #-13
	addvl	x3, sp, #1
	mov	z2.s, #-61
	mla	z29.s, p7/m, z25.s, z2.s
	mla	z29.s, p7/m, z26.s, z12.s
	mov	z12.s, #-78
	mla	z29.s, p7/m, z9.s, z27.s
	add	x3, x3, 64
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, z29.s, #88
	mla	z29.s, p7/m, z13.s, z7.s
	mla	z29.s, p7/m, z14.s, z4.s
	mov	z4.s, #-82
	mla	z29.s, p7/m, z15.s, z27.s
	mla	z29.s, p7/m, z16.s, z30.s
	mla	z29.s, p7/m, z17.s, z4.s
	mla	z29.s, p7/m, z18.s, z0.s
	mla	z29.s, p7/m, z19.s, z12.s
	mov	z12.s, #38
	mov	z4.s, #-46
	mov	z2.d, z12.d
	mla	z29.s, p7/m, z20.s, z4.s
	mla	z29.s, p7/m, z21.s, z28.s
	mla	z29.s, p7/m, z22.s, z12.s
	mov	z12.s, #73
	mla	z29.s, p7/m, z23.s, z12.s
	mov	z12.s, #90
	mla	z29.s, p7/m, z24.s, z12.s
	mov	z12.s, #61
	mla	z29.s, p7/m, z25.s, z8.s
	addvl	x3, sp, #2
	mla	z29.s, p7/m, z26.s, z12.s
	mov	z12.s, #46
	mla	z29.s, p7/m, z9.s, z1.s
	add	x3, x3, 64
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, p7/m, z29.s, z8.s
	mla	z29.s, p7/m, z13.s, z12.s
	mov	z12.s, #-67
	mla	z29.s, p7/m, z14.s, z27.s
	mov	z27.s, #-22
	mla	z29.s, p7/m, z15.s, z12.s
	mov	z12.s, #-73
	mla	z29.s, p7/m, z16.s, z0.s
	mla	z29.s, p7/m, z17.s, z12.s
	mla	z29.s, p7/m, z18.s, z27.s
	mov	z27.s, #88
	mla	z29.s, p7/m, z19.s, z2.s
	mov	z2.s, #82
	mla	z29.s, p7/m, z20.s, z2.s
	mov	z2.d, z27.d
	mla	z29.s, p7/m, z21.s, z27.s
	mov	z27.s, #-78
	mla	z29.s, p7/m, z22.s, z6.s
	mov	z12.s, #-61
	mla	z29.s, p7/m, z23.s, z28.s
	addvl	x3, sp, #3
	mla	z29.s, p7/m, z24.s, z12.s
	mla	z29.s, p7/m, z25.s, z0.s
	mla	z29.s, p7/m, z26.s, z27.s
	mov	z27.s, #-31
	mla	z29.s, p7/m, z9.s, z27.s
	add	x3, x3, 64
	mov	z27.s, #78
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, z29.s, #82
	mla	z29.s, p7/m, z13.s, z1.s
	mla	z29.s, p7/m, z14.s, z30.s
	mla	z29.s, p7/m, z15.s, z0.s
	mla	z29.s, p7/m, z16.s, z12.s
	mov	z12.s, #-67
	mla	z29.s, p7/m, z17.s, z10.s
	mla	z29.s, p7/m, z18.s, z27.s
	mov	z27.s, #31
	mla	z29.s, p7/m, z19.s, z8.s
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z4.s
	mla	z29.s, p7/m, z22.s, z0.s
	mla	z29.s, p7/m, z23.s, z12.s
	mov	z12.s, #73
	mla	z29.s, p7/m, z24.s, z3.s
	addvl	x3, sp, #4
	mla	z29.s, p7/m, z25.s, z12.s
	mov	z3.s, #-82
	mla	z29.s, p7/m, z26.s, z2.s
	mov	z12.s, #38
	mla	z29.s, p7/m, z9.s, z12.s
	add	x3, x3, 64
	mov	z12.s, #-73
	mov	z2.s, #-61
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, z29.s, #78
	mla	z29.s, p7/m, z13.s, z28.s
	mla	z29.s, p7/m, z14.s, z3.s
	mov	z3.s, #-22
	mla	z29.s, p7/m, z15.s, z12.s
	mla	z29.s, p7/m, z16.s, z10.s
	mla	z29.s, p7/m, z17.s, z8.s
	mla	z29.s, p7/m, z18.s, z7.s
	mla	z29.s, p7/m, z19.s, z3.s
	mla	z29.s, p7/m, z20.s, z5.s
	mla	z29.s, p7/m, z21.s, z2.s
	mla	z29.s, p7/m, z22.s, z27.s
	mov	z27.s, #90
	mla	z29.s, p7/m, z23.s, z27.s
	addvl	x3, sp, #5
	mov	z27.s, #-38
	mla	z29.s, p7/m, z24.s, z6.s
	mov	z2.d, z27.d
	mla	z29.s, p7/m, z25.s, z27.s
	mov	z27.s, #-31
	mla	z29.s, p7/m, z26.s, z0.s
	mla	z29.s, p7/m, z9.s, z4.s
	add	x3, x3, 64
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, z29.s, #73
	mla	z29.s, p7/m, z13.s, z27.s
	mov	z27.s, #78
	mla	z29.s, p7/m, z14.s, z0.s
	mla	z29.s, p7/m, z15.s, z3.s
	mov	z3.s, #61
	mla	z29.s, p7/m, z16.s, z27.s
	addvl	x3, sp, #6
	mla	z29.s, p7/m, z17.s, z7.s
	mov	z27.s, #-13
	mla	z29.s, p7/m, z18.s, z2.s
	mov	z2.s, #82
	mla	z29.s, p7/m, z19.s, z0.s
	mla	z29.s, p7/m, z20.s, z27.s
	mla	z29.s, p7/m, z21.s, z2.s
	mla	z29.s, p7/m, z22.s, z3.s
	mov	z3.s, #-78
	mla	z29.s, p7/m, z23.s, z4.s
	mla	z29.s, p7/m, z24.s, z5.s
	mla	z29.s, p7/m, z25.s, z28.s
	mla	z29.s, p7/m, z26.s, z8.s
	mla	z29.s, p7/m, z9.s, z6.s
	add	x3, x3, 64
	str	z29, [x3]
	movprfx	z29, z11
	mul	z29.s, p7/m, z29.s, z7.s
	mad	z30.s, p7/m, z13.s, z29.s
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #-22
	mov	z29.s, #38
	mla	z30.s, p7/m, z15.s, z29.s
	mla	z30.s, p7/m, z16.s, z8.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #4
	mla	z30.s, p7/m, z18.s, z0.s
	mla	z30.s, p7/m, z19.s, z3.s
	mov	z3.s, #90
	mla	z30.s, p7/m, z20.s, z3.s
	mov	z3.s, #-31
	mla	z30.s, p7/m, z21.s, z10.s
	mla	z30.s, p7/m, z22.s, z5.s
	mla	z30.s, p7/m, z23.s, z3.s
	mov	z3.s, #46
	mla	z30.s, p7/m, z24.s, z2.s
	addvl	x3, sp, #7
	mla	z30.s, p7/m, z25.s, z3.s
	mov	z3.s, #-61
	mla	z30.s, p7/m, z26.s, z12.s
	mla	z30.s, p7/m, z9.s, z3.s
	add	x3, x3, 64
	mov	z3.s, #31
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #61
	mla	z30.s, p7/m, z13.s, z12.s
	mla	z30.s, p7/m, z14.s, z4.s
	mla	z30.s, p7/m, z15.s, z2.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z5.s
	mla	z30.s, p7/m, z18.s, z27.s
	mov	z27.s, #90
	mla	z30.s, p7/m, z19.s, z27.s
	mov	z27.s, #-38
	mla	z30.s, p7/m, z20.s, z28.s
	mla	z30.s, p7/m, z21.s, z0.s
	mla	z30.s, p7/m, z22.s, z1.s
	mla	z30.s, p7/m, z23.s, z8.s
	mla	z30.s, p7/m, z24.s, z27.s
	mov	z27.s, #-78
	addvl	x3, sp, #8
	mla	z30.s, p7/m, z25.s, z27.s
	mov	z27.s, #-85
	mla	z30.s, p7/m, z26.s, z6.s
	mla	z30.s, p7/m, z9.s, z7.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z6.s
	mla	z30.s, p7/m, z13.s, z27.s
	mov	z27.s, #88
	mla	z30.s, p7/m, z14.s, z28.s
	mla	z30.s, p7/m, z15.s, z27.s
	mov	z27.s, #-61
	mla	z30.s, p7/m, z16.s, z4.s
	mla	z30.s, p7/m, z17.s, z27.s
	mov	z27.s, #-78
	mla	z30.s, p7/m, z18.s, z2.s
	mla	z30.s, p7/m, z19.s, z10.s
	mla	z30.s, p7/m, z20.s, z0.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z7.s
	mla	z30.s, p7/m, z23.s, z27.s
	mov	z27.s, #-22
	mla	z30.s, p7/m, z24.s, z27.s
	mov	z27.s, #90
	addvl	x3, sp, #9
	mla	z30.s, p7/m, z25.s, z27.s
	mov	z27.s, #-31
	mla	z30.s, p7/m, z26.s, z27.s
	mla	z30.s, p7/m, z9.s, z12.s
	add	x3, x3, 64
	str	z30, [x3]
	movprfx	z30, z11
	mul	z30.s, z30.s, #46
	mla	z30.s, p7/m, z13.s, z0.s
	mla	z30.s, p7/m, z14.s, z29.s
	mla	z30.s, p7/m, z15.s, z6.s
	mla	z30.s, p7/m, z16.s, z0.s
	mla	z30.s, p7/m, z17.s, z3.s
	mov	z3.s, #61
	mla	z30.s, p7/m, z18.s, z3.s
	mov	z27.d, z3.d
	mov	z3.s, #-85
	mla	z30.s, p7/m, z19.s, z5.s
	mla	z30.s, p7/m, z20.s, z1.s
	mla	z30.s, p7/m, z21.s, z7.s
	mla	z30.s, p7/m, z22.s, z3.s
	mov	z3.s, #-82
	mla	z30.s, p7/m, z23.s, z10.s
	mov	z12.s, #73
	mla	z30.s, p7/m, z24.s, z12.s
	mla	z30.s, p7/m, z25.s, z3.s
	mov	z3.s, #4
	mla	z30.s, p7/m, z26.s, z3.s
	addvl	x3, sp, #10
	mov	z3.d, z30.d
	mov	z30.s, #78
	mla	z3.s, p7/m, z9.s, z30.s
	add	x3, x3, 64
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z29.s
	mla	z30.s, p7/m, z13.s, z5.s
	mla	z30.s, p7/m, z14.s, z12.s
	mov	z12.s, #-67
	str	z3, [x3]
	mov	z3.s, #-31
	mla	z30.s, p7/m, z15.s, z28.s
	mla	z30.s, p7/m, z16.s, z12.s
	mov	z12.s, #90
	mla	z30.s, p7/m, z17.s, z12.s
	mla	z30.s, p7/m, z18.s, z4.s
	mla	z30.s, p7/m, z19.s, z3.s
	mov	z3.s, #-78
	mla	z30.s, p7/m, z20.s, z8.s
	mla	z30.s, p7/m, z21.s, z3.s
	addvl	x3, sp, #11
	mad	z10.s, p7/m, z22.s, z30.s
	mov	z30.s, #-82
	mla	z10.s, p7/m, z23.s, z27.s
	mov	z27.s, #-78
	mla	z10.s, p7/m, z24.s, z0.s
	add	x3, x3, 64
	mla	z10.s, p7/m, z25.s, z6.s
	mov	z3.s, #4
	mla	z10.s, p7/m, z26.s, z1.s
	mla	z10.s, p7/m, z9.s, z30.s
	movprfx	z30, z11
	mul	z30.s, z30.s, #31
	mla	z30.s, p7/m, z13.s, z27.s
	mov	z27.s, #-38
	mla	z30.s, p7/m, z14.s, z12.s
	mov	z12.s, #-61
	mla	z30.s, p7/m, z15.s, z12.s
	mla	z30.s, p7/m, z16.s, z3.s
	mla	z30.s, p7/m, z17.s, z6.s
	mla	z30.s, p7/m, z18.s, z5.s
	mla	z30.s, p7/m, z19.s, z2.s
	mla	z30.s, p7/m, z20.s, z27.s
	mov	z12.s, #-22
	mad	z12.s, p7/m, z21.s, z30.s
	mov	z30.s, #73
	str	z10, [x3]
	addvl	x3, sp, #12
	mla	z12.s, p7/m, z22.s, z30.s
	mov	z10.d, z30.d
	mla	z12.s, p7/m, z23.s, z0.s
	mov	z30.s, #-13
	mla	z12.s, p7/m, z24.s, z7.s
	add	x3, x3, 64
	mla	z12.s, p7/m, z25.s, z30.s
	mla	z12.s, p7/m, z26.s, z4.s
	mla	z12.s, p7/m, z9.s, z8.s
	mov	z3.d, z30.d
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z1.s
	str	z12, [x3]
	addvl	x3, sp, #13
	mov	z12.s, #-61
	mla	z30.s, p7/m, z13.s, z12.s
	mla	z30.s, p7/m, z14.s, z8.s
	mla	z30.s, p7/m, z15.s, z0.s
	mla	z30.s, p7/m, z16.s, z10.s
	mov	z10.d, z27.d
	mla	z30.s, p7/m, z17.s, z27.s
	mov	z27.s, #-78
	mla	z30.s, p7/m, z18.s, z28.s
	mov	z28.s, #46
	mov	z2.d, z27.d
	mla	z30.s, p7/m, z19.s, z28.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z20.s, z27.s
	mov	z28.s, #90
	mov	z27.s, #-82
	mla	z30.s, p7/m, z21.s, z28.s
	mov	z28.d, z3.d
	mla	z30.s, p7/m, z22.s, z27.s
	mov	z27.s, #-31
	mla	z30.s, p7/m, z23.s, z6.s
	mla	z30.s, p7/m, z24.s, z3.s
	mov	z3.s, #61
	mla	z30.s, p7/m, z25.s, z27.s
	movprfx	z12, z30
	mla	z12.s, p7/m, z26.s, z7.s
	mla	z12.s, p7/m, z9.s, z5.s
	str	z12, [x3]
	addvl	x3, sp, #14
	movprfx	z30, z11
	mul	z30.s, z30.s, #13
	mov	z27.s, #-31
	mla	z30.s, p7/m, z13.s, z10.s
	add	x3, x3, 64
	mla	z30.s, p7/m, z14.s, z3.s
	mov	z3.s, #4
	mla	z30.s, p7/m, z15.s, z2.s
	mov	z12.s, #-73
	mov	z10.s, #88
	mla	z30.s, p7/m, z16.s, z10.s
	mla	z30.s, p7/m, z17.s, z0.s
	mla	z30.s, p7/m, z18.s, z8.s
	mla	z30.s, p7/m, z19.s, z12.s
	mla	z30.s, p7/m, z20.s, z6.s
	mla	z30.s, p7/m, z21.s, z27.s
	mov	z27.s, #-82
	mla	z30.s, p7/m, z22.s, z3.s
	mov	z3.s, #90
	mla	z30.s, p7/m, z23.s, z1.s
	mla	z30.s, p7/m, z24.s, z4.s
	mla	z30.s, p7/m, z25.s, z7.s
	mla	z30.s, p7/m, z26.s, z27.s
	mla	z30.s, p7/m, z9.s, z3.s
	str	z30, [x3]
	addvl	x3, sp, #16
	mov	z30.s, #-31
	add	x3, x3, 64
	lsl	z11.s, z11.s, #2
	mad	z13.s, p7/m, z28.s, z11.s
	mad	z14.s, p7/m, z1.s, z13.s
	mad	z15.s, p7/m, z30.s, z14.s
	mov	z30.s, #-61
	mad	z16.s, p7/m, z29.s, z15.s
	mad	z17.s, p7/m, z4.s, z16.s
	mad	z18.s, p7/m, z6.s, z17.s
	mad	z19.s, p7/m, z30.s, z18.s
	mad	z20.s, p7/m, z7.s, z19.s
	ldr	z7, [x3]
	addvl	x3, sp, #18
	mad	z21.s, p7/m, z12.s, z20.s
	mov	z20.s, #78
	add	x3, x3, 64
	ldr	z18, [x3]
	mad	z22.s, p7/m, z20.s, z21.s
	addvl	x3, sp, #20
	mad	z23.s, p7/m, z27.s, z22.s
	mad	z24.s, p7/m, z8.s, z23.s
	add	x3, x3, 64
	mad	z25.s, p7/m, z5.s, z24.s
	mad	z26.s, p7/m, z3.s, z25.s
	movprfx	z6, z26
	mla	z6.s, p7/m, z9.s, z0.s
	ldr	z26, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z25, [x3]
	mov	z16.s, #57
	addvl	x3, sp, #24
	mov	z8.s, #25
	mov	z2.s, #-70
	add	x3, x3, 64
	ldr	z30, [x3]
	mov	z13.s, #80
	addvl	x3, sp, #26
	mov	z20.d, z26.d
	mov	z19.s, #43
	add	x3, x3, 64
	ldr	z28, [x3]
	mov	z23.s, #9
	addvl	x3, sp, #28
	mov	z22.s, #-80
	mov	z17.s, #70
	add	x3, x3, 64
	ldr	z27, [x3]
	mov	z1.s, #87
	addvl	x3, sp, #30
	mov	z21.d, z16.d
	movprfx	z14, z7
	mul	z14.s, p7/m, z14.s, z3.s
	add	x3, x3, 64
	ldr	z4, [x3]
	mla	z14.s, p7/m, z18.s, z1.s
	addvl	x3, sp, #17
	mla	z14.s, p7/m, z26.s, z13.s
	movprfx	z11, z7
	mul	z11.s, p7/m, z11.s, z17.s
	mla	z14.s, p7/m, z25.s, z17.s
	movprfx	z13, z7
	mul	z13.s, p7/m, z13.s, z1.s
	mla	z14.s, p7/m, z30.s, z16.s
	mla	z13.s, p7/m, z18.s, z16.s
	mla	z14.s, p7/m, z28.s, z19.s
	mov	z16.s, #-87
	mla	z14.s, p7/m, z27.s, z8.s
	mla	z13.s, p7/m, z26.s, z23.s
	mov	z5.d, z25.d
	mov	z29.s, #-43
	mov	z26.d, z2.d
	mla	z13.s, p7/m, z25.s, z29.s
	mla	z11.s, p7/m, z18.s, z29.s
	mla	z13.s, p7/m, z30.s, z22.s
	mla	z11.s, p7/m, z20.s, z16.s
	mla	z13.s, p7/m, z28.s, z0.s
	mla	z11.s, p7/m, z25.s, z23.s
	mla	z13.s, p7/m, z27.s, z2.s
	mla	z11.s, p7/m, z30.s, z3.s
	add	x3, x3, 64
	mla	z11.s, p7/m, z28.s, z8.s
	movprfx	z12, z7
	mul	z12.s, z12.s, #80
	mla	z12.s, p7/m, z18.s, z23.s
	mla	z12.s, p7/m, z20.s, z2.s
	mov	z2.d, z8.d
	mov	z8.s, #-57
	mov	z15.s, #-25
	mla	z12.s, p7/m, z25.s, z16.s
	mla	z11.s, p7/m, z27.s, z22.s
	mla	z12.s, p7/m, z30.s, z15.s
	mla	z11.s, p7/m, z4.s, z8.s
	mov	z29.d, z8.d
	movprfx	z10, z7
	mul	z10.s, p7/m, z10.s, z21.s
	movprfx	z9, z7
	mul	z9.s, p7/m, z9.s, z19.s
	mla	z10.s, p7/m, z18.s, z22.s
	mla	z9.s, p7/m, z18.s, z0.s
	mla	z10.s, p7/m, z20.s, z15.s
	mla	z9.s, p7/m, z20.s, z21.s
	mla	z10.s, p7/m, z25.s, z3.s
	mla	z9.s, p7/m, z5.s, z2.s
	mov	z8.d, z16.d
	mov	z25.s, #-9
	mla	z9.s, p7/m, z30.s, z8.s
	mla	z10.s, p7/m, z30.s, z25.s
	mla	z10.s, p7/m, z28.s, z16.s
	mov	z16.d, z5.d
	mov	z5.d, z30.d
	movprfx	z30, z7
	mul	z30.s, z30.s, #25
	mla	z30.s, p7/m, z18.s, z26.s
	ldr	z26, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	mla	z13.s, p7/m, z4.s, z15.s
	movprfx	z8, z30
	mla	z8.s, p7/m, z3.s, z20.s
	movprfx	z30, z7
	mul	z30.s, z30.s, #9
	mla	z30.s, p7/m, z18.s, z15.s
	ldr	z15, [x3]
	addvl	x3, sp, #25
	movprfx	z7, z30
	mla	z7.s, p7/m, z20.s, z19.s
	mla	z12.s, p7/m, z28.s, z21.s
	add	x3, x3, 64
	mla	z12.s, p7/m, z27.s, z3.s
	mla	z10.s, p7/m, z27.s, z19.s
	mla	z12.s, p7/m, z4.s, z19.s
	mla	z8.s, p7/m, z16.s, z22.s
	mla	z8.s, p7/m, z5.s, z19.s
	ldr	z19, [x3]
	addvl	x3, sp, #29
	mla	z7.s, p7/m, z16.s, z29.s
	add	x3, x3, 64
	mla	z7.s, p7/m, z5.s, z17.s
	mov	z30.s, #50
	mla	z7.s, p7/m, z28.s, z22.s
	mla	z7.s, p7/m, z27.s, z1.s
	mla	z7.s, p7/m, z4.s, z0.s
	ldr	z0, [x3]
	addvl	x3, sp, #19
	mov	z2.s, #75
	mla	z9.s, p7/m, z28.s, z17.s
	mla	z8.s, p7/m, z28.s, z23.s
	mla	z9.s, p7/m, z27.s, z23.s
	mla	z8.s, p7/m, z27.s, z29.s
	mla	z9.s, p7/m, z4.s, z22.s
	mla	z8.s, p7/m, z4.s, z1.s
	movprfx	z21, z26
	mul	z21.s, p7/m, z21.s, z2.s
	mov	z1.s, #18
	add	x3, x3, 64
	movprfx	z22, z26
	mul	z22.s, z22.s, #89
	movprfx	z20, z26
	mul	z20.s, z20.s, #50
	mla	z22.s, p7/m, z15.s, z2.s
	mla	z22.s, p7/m, z19.s, z30.s
	movprfx	z30, z26
	mul	z30.s, p7/m, z30.s, z1.s
	mov	z26.s, #-18
	mla	z14.s, p7/m, z4.s, z23.s
	mla	z21.s, p7/m, z15.s, z26.s
	mov	z23.s, #-89
	mov	z26.d, z19.d
	mla	z21.s, p7/m, z19.s, z23.s
	mla	z20.s, p7/m, z15.s, z23.s
	mov	z16.s, #-50
	mla	z20.s, p7/m, z19.s, z1.s
	movprfx	z19, z30
	mla	z19.s, p7/m, z15.s, z16.s
	ldr	z30, [x3]
	addvl	x3, sp, #27
	mla	z10.s, p7/m, z4.s, z17.s
	add	x3, x3, 64
	ldr	z25, [x3]
	mla	z19.s, p7/m, z26.s, z2.s
	addvl	x3, sp, #15
	mla	z19.s, p7/m, z0.s, z23.s
	mov	z17.s, #36
	add	x3, x3, 64
	movprfx	z26, z30
	mul	z26.s, p7/m, z26.s, z17.s
	movprfx	z27, z30
	mul	z27.s, z27.s, #83
	mov	z23.s, #-83
	mla	z27.s, p7/m, z25.s, z17.s
	mla	z26.s, p7/m, z25.s, z23.s
	ldr	z25, [x3]
	addvl	x3, sp, #23
	mla	z22.s, p7/m, z0.s, z1.s
	add	x3, x3, 64
	mla	z21.s, p7/m, z0.s, z16.s
	mla	z20.s, p7/m, z0.s, z2.s
	ldr	z0, [x3]
	add	x3, sp, 64
	lsl	z30.s, z25.s, #6
	mov	z16.s, #-64
	mov	z25.s, #64
	movprfx	z29, z30
	mla	z29.s, p7/m, z25.s, z0.s
	mla	z30.s, p7/m, z0.s, z16.s
	add	z28.s, z29.s, z27.s
	sub	z29.s, z29.s, z27.s
	add	z27.s, z30.s, z26.s
	sub	z30.s, z30.s, z26.s
	add	z26.s, z29.s, z19.s
	sub	z29.s, z29.s, z19.s
	add	z19.s, z26.s, z11.s
	sub	z26.s, z26.s, z11.s
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	z23.s, z28.s, z22.s
	add	x3, x3, 64
	sub	z28.s, z28.s, z22.s
	add	z15.s, z28.s, z7.s
	sub	z28.s, z28.s, z7.s
	ldr	z7, [x3]
	addvl	x3, sp, #15
	add	x3, x3, 64
	add	z24.s, z27.s, z21.s
	sub	z27.s, z27.s, z21.s
	add	z21.s, z24.s, z13.s
	add	z7.s, z21.s, z7.s
	str	z7, [x3]
	addvl	x3, sp, #2
	add	z22.s, z23.s, z14.s
	add	z0.s, z22.s, z11.s
	add	x3, x3, 64
	ldr	z11, [x3]
	add	z16.s, z27.s, z8.s
	addvl	x3, sp, #3
	sub	z27.s, z27.s, z8.s
	add	z25.s, z30.s, z20.s
	add	x3, x3, 64
	ldr	z7, [x3]
	sub	z30.s, z30.s, z20.s
	addvl	x3, sp, #4
	add	z20.s, z25.s, z12.s
	add	z1.s, z20.s, z11.s
	add	x3, x3, 64
	ldr	z8, [x3]
	add	z2.s, z19.s, z7.s
	addvl	x3, sp, #5
	sub	z23.s, z23.s, z14.s
	add	z18.s, z29.s, z10.s
	add	x3, x3, 64
	ldr	z11, [x3]
	add	z3.s, z18.s, z8.s
	addvl	x3, sp, #6
	sub	z24.s, z24.s, z13.s
	sub	z25.s, z25.s, z12.s
	add	x3, x3, 64
	ldr	z7, [x3]
	add	z17.s, z30.s, z9.s
	addvl	x3, sp, #7
	add	z4.s, z17.s, z11.s
	add	z5.s, z16.s, z7.s
	add	x3, x3, 64
	ldr	z14, [x3]
	add	z8.s, z15.s, z14.s
	addvl	x3, sp, #16
	sub	z29.s, z29.s, z10.s
	sub	z30.s, z30.s, z9.s
	add	x3, x3, 64
	str	z8, [x3]
	sqrshrnb	z0.h, z0.s, #7
	addvl	x3, sp, #8
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z7.s, z28.s, z13.s
	addvl	x3, sp, #9
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x3, x3, 64
	ldr	z8, [x3]
	add	z8.s, z27.s, z8.s
	addvl	x3, sp, #10
	sunpklo	z1.s, z1.h
	sqrshrnb	z2.h, z2.s, #7
	add	x3, x3, 64
	ldr	z12, [x3]
	add	z9.s, z30.s, z12.s
	addvl	x3, sp, #11
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x3, x3, 64
	ldr	z11, [x3]
	add	z10.s, z29.s, z11.s
	addvl	x3, sp, #12
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 64
	ldr	z14, [x3]
	add	z11.s, z26.s, z14.s
	addvl	x3, sp, #13
	sunpklo	z3.s, z3.h
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z12.s, z25.s, z13.s
	addvl	x3, sp, #14
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x3, x3, 64
	ldr	z14, [x3]
	add	z13.s, z24.s, z14.s
	add	z14.s, z23.s, z6.s
	sub	z23.s, z23.s, z6.s
	ldr	z6, [x3]
	addvl	x3, sp, #13
	sub	z24.s, z24.s, z6.s
	sqrshrnb	z5.h, z5.s, #7
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z25.s, z25.s, z6.s
	addvl	x3, sp, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z26.s, z26.s, z6.s
	addvl	x3, sp, #11
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z29.s, z29.s, z6.s
	addvl	x3, sp, #10
	sunpklo	z7.s, z7.h
	sqrshrnb	z8.h, z8.s, #7
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z30.s, z30.s, z6.s
	addvl	x3, sp, #9
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z27.s, z27.s, z6.s
	addvl	x3, sp, #8
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z28.s, z28.s, z6.s
	addvl	x3, sp, #7
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #7
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z15.s, z15.s, z6.s
	addvl	x3, sp, #6
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z16.s, z16.s, z6.s
	addvl	x3, sp, #5
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z17.s, z17.s, z6.s
	addvl	x3, sp, #4
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #7
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z18.s, z18.s, z6.s
	addvl	x3, sp, #3
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z19.s, z19.s, z6.s
	addvl	x3, sp, #2
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z20.s, z20.s, z6.s
	addvl	x3, sp, #1
	sunpklo	z13.s, z13.h
	sqrshrnb	z14.h, z14.s, #7
	add	x3, x3, 64
	ldr	z6, [x3]
	sub	z21.s, z21.s, z6.s
	add	x3, sp, 64
	ldr	z6, [x3]
	sub	z22.s, z22.s, z6.s
	addvl	x3, sp, #31
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	add	x3, x3, 1088
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z23.h, z23.s, #7
	addvl	x3, sp, #15
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sqrshrnb	z0.h, z6.s, #7
	addvl	x3, sp, #31
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x3, x3, 1090
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z24.h, z24.s, #7
	addvl	x3, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x3, x3, 1092
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z25.h, z25.s, #7
	addvl	x3, sp, #31
	uzp1	z25.h, z25.h, z25.h
	sunpklo	z25.s, z25.h
	add	x3, x3, 1094
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z26.h, z26.s, #7
	addvl	x3, sp, #31
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	add	x3, x3, 1096
	st1h	z3.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z29.h, z29.s, #7
	addvl	x3, sp, #31
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	add	x3, x3, 1098
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z30.h, z30.s, #7
	addvl	x3, sp, #31
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	add	x3, x3, 1100
	st1h	z5.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z27.h, z27.s, #7
	addvl	x3, sp, #16
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	add	x3, x3, 64
	ldr	z6, [x3]
	sqrshrnb	z6.h, z6.s, #7
	addvl	x3, sp, #31
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x3, x3, 1102
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z28.h, z28.s, #7
	addvl	x3, sp, #31
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x3, x3, 1104
	st1h	z7.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z15.h, z15.s, #7
	addvl	x3, sp, #31
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x3, x3, 1106
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z16.h, z16.s, #7
	addvl	x3, sp, #31
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x3, x3, 1108
	st1h	z9.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z17.h, z17.s, #7
	addvl	x3, sp, #31
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x3, 1110
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z18.h, z18.s, #7
	addvl	x3, sp, #31
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, x3, 1112
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z19.h, z19.s, #7
	addvl	x3, sp, #31
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x3, x3, 1114
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z20.h, z20.s, #7
	addvl	x3, sp, #31
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	add	x3, x3, 1116
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z21.h, z21.s, #7
	addvl	x3, sp, #31
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x3, x3, 1118
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z22.h, z22.s, #7
	addvl	x3, sp, #31
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x3, 1120
	st1h	z23.s, p6, [x3, z31.s, sxtw 1]
	mov	z10.s, #82
	addvl	x3, sp, #31
	mov	z0.s, #46
	mov	z9.s, #22
	add	x3, x3, 1122
	st1h	z24.s, p6, [x3, z31.s, sxtw 1]
	mov	z5.s, #4
	addvl	x3, sp, #31
	add	x3, x3, 1124
	st1h	z25.s, p6, [x3, z31.s, sxtw 1]
	mov	z25.s, #61
	addvl	x3, sp, #31
	add	x3, x3, 1126
	st1h	z26.s, p6, [x3, z31.s, sxtw 1]
	mov	z26.s, #88
	addvl	x3, sp, #31
	add	x3, x3, 1128
	st1h	z29.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1130
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	mov	z30.s, #78
	addvl	x3, sp, #31
	add	x3, x3, 1132
	st1h	z27.s, p6, [x3, z31.s, sxtw 1]
	mov	z27.s, #90
	addvl	x3, sp, #31
	add	x3, x3, 1134
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1136
	st1h	z15.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1138
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1140
	st1h	z17.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1142
	st1h	z18.s, p6, [x3, z31.s, sxtw 1]
	mov	z18.s, #31
	addvl	x3, sp, #31
	add	x3, x3, 1144
	st1h	z19.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1146
	st1h	z20.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1148
	st1h	z21.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #31
	add	x3, x3, 1150
	st1h	z22.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 48
	ld1sh	z11.s, p7/z, [x3]
	addvl	x3, sp, #17
	add	x3, x3, 64
	str	z11, [x3]
	add	x3, x0, 112
	ld1sh	z31.s, p7/z, [x3]
	add	x3, x0, 176
	ld1sh	z1.s, p7/z, [x3]
	add	x3, x0, 240
	ld1sh	z11.s, p7/z, [x3]
	add	x3, x0, 304
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #18
	add	x3, x3, 64
	str	z7, [x3]
	add	x3, x0, 368
	ld1sh	z12.s, p7/z, [x3]
	add	x3, x0, 432
	ld1sh	z2.s, p7/z, [x3]
	add	x3, x0, 496
	ld1sh	z13.s, p7/z, [x3]
	add	x3, x0, 560
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #19
	add	x3, x3, 64
	str	z7, [x3]
	add	x3, x0, 624
	ld1sh	z14.s, p7/z, [x3]
	add	x3, x0, 688
	ld1sh	z3.s, p7/z, [x3]
	add	x3, x0, 752
	ld1sh	z15.s, p7/z, [x3]
	add	x3, x0, 816
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #20
	add	x3, x3, 64
	str	z8, [x3]
	add	x3, x0, 880
	ld1sh	z16.s, p7/z, [x3]
	add	x3, x0, 944
	ld1sh	z4.s, p7/z, [x3]
	add	x3, x0, 1008
	ld1sh	z17.s, p7/z, [x3]
	add	x3, x0, 1072
	ld1sh	z22.s, p7/z, [x3]
	addvl	x3, sp, #21
	add	x3, x3, 64
	str	z22, [x3]
	add	x3, x0, 1136
	ld1sh	z29.s, p7/z, [x3]
	add	x3, x0, 1200
	ld1sh	z20.s, p7/z, [x3]
	addvl	x3, sp, #22
	add	x3, x3, 64
	str	z20, [x3]
	add	x3, x0, 1264
	ld1sh	z19.s, p7/z, [x3]
	add	x3, x0, 1328
	ld1sh	z22.s, p7/z, [x3]
	addvl	x3, sp, #23
	add	x3, x3, 64
	str	z22, [x3]
	add	x3, x0, 1392
	ld1sh	z20.s, p7/z, [x3]
	add	x3, x0, 1456
	ld1sh	z6.s, p7/z, [x3]
	add	x3, x0, 1520
	ld1sh	z21.s, p7/z, [x3]
	add	x3, x0, 1584
	ld1sh	z7.s, p7/z, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	str	z7, [x3]
	add	x3, x0, 1648
	ld1sh	z22.s, p7/z, [x3]
	add	x3, x0, 1712
	ld1sh	z7.s, p7/z, [x3]
	add	x3, x0, 1776
	ld1sh	z23.s, p7/z, [x3]
	add	x3, x0, 1840
	ld1sh	z8.s, p7/z, [x3]
	addvl	x3, sp, #25
	add	x3, x3, 64
	str	z8, [x3]
	add	x3, x0, 1904
	ld1sh	z24.s, p7/z, [x3]
	add	x3, x0, 1968
	add	x0, x0, 2032
	ld1sh	z28.s, p7/z, [x3]
	addvl	x3, sp, #26
	add	x3, x3, 64
	str	z28, [x3]
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #1
	movprfx	z28, z31
	mul	z28.s, z28.s, #90
	add	x0, x0, 64
	str	z31, [x0]
	movprfx	z31, z28
	mla	z31.s, p7/m, z11.s, z27.s
	add	x0, sp, 64
	mla	z31.s, p7/m, z12.s, z26.s
	mov	z26.s, #85
	mla	z31.s, p7/m, z13.s, z26.s
	mla	z31.s, p7/m, z14.s, z10.s
	mla	z31.s, p7/m, z15.s, z30.s
	mov	z30.s, #73
	mla	z31.s, p7/m, z16.s, z30.s
	str	z29, [x0]
	mov	z30.s, #67
	addvl	x0, sp, #2
	mla	z31.s, p7/m, z17.s, z30.s
	mla	z31.s, p7/m, z29.s, z25.s
	mov	z25.s, #38
	mov	z29.s, #54
	add	x0, x0, 64
	mla	z31.s, p7/m, z19.s, z29.s
	mla	z31.s, p7/m, z20.s, z0.s
	mla	z31.s, p7/m, z21.s, z25.s
	mov	z25.s, #13
	mla	z31.s, p7/m, z22.s, z18.s
	mla	z31.s, p7/m, z23.s, z9.s
	mla	z31.s, p7/m, z24.s, z25.s
	mla	z31.s, p7/m, z8.s, z5.s
	str	z31, [x0]
	add	x0, sp, 64
	mov	z31.s, #-31
	mov	z18.s, #-4
	mla	z28.s, p7/m, z11.s, z10.s
	mov	z5.s, #-54
	mla	z28.s, p7/m, z12.s, z30.s
	mla	z28.s, p7/m, z13.s, z0.s
	ldr	z0, [x0]
	mla	z28.s, p7/m, z14.s, z9.s
	addvl	x0, sp, #3
	mla	z28.s, p7/m, z15.s, z18.s
	mla	z28.s, p7/m, z16.s, z31.s
	mov	z31.s, #-73
	mla	z28.s, p7/m, z17.s, z5.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z0.s, z31.s
	mov	z5.s, #-78
	mov	z31.s, #-85
	mov	z9.s, #-61
	mov	z25.s, #-88
	mla	z28.s, p7/m, z19.s, z31.s
	mov	z10.d, z5.d
	mov	z31.s, #-90
	mla	z28.s, p7/m, z20.s, z31.s
	mla	z28.s, p7/m, z21.s, z25.s
	mla	z28.s, p7/m, z22.s, z5.s
	mov	z5.s, #-38
	mla	z28.s, p7/m, z23.s, z9.s
	mov	z9.s, #-13
	mla	z28.s, p7/m, z24.s, z5.s
	mla	z28.s, p7/m, z8.s, z9.s
	str	z28, [x0]
	addvl	x0, sp, #1
	mov	z0.s, #31
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #88
	mla	z28.s, p7/m, z11.s, z30.s
	mla	z28.s, p7/m, z12.s, z0.s
	mla	z28.s, p7/m, z13.s, z9.s
	mov	z9.s, #-54
	add	x0, sp, 64
	mla	z28.s, p7/m, z14.s, z9.s
	mov	z9.s, #-82
	mla	z28.s, p7/m, z15.s, z9.s
	mla	z28.s, p7/m, z16.s, z31.s
	mla	z28.s, p7/m, z17.s, z10.s
	mov	z10.s, #38
	ldr	z0, [x0]
	mov	z9.s, #-46
	addvl	x0, sp, #4
	mla	z28.s, p7/m, z0.s, z9.s
	mla	z28.s, p7/m, z19.s, z18.s
	mla	z28.s, p7/m, z20.s, z10.s
	mov	z10.s, #73
	mla	z28.s, p7/m, z21.s, z10.s
	mla	z28.s, p7/m, z22.s, z27.s
	mla	z28.s, p7/m, z23.s, z26.s
	add	x0, x0, 64
	mov	z10.s, #61
	movprfx	z0, z28
	mla	z0.s, p7/m, z24.s, z10.s
	mov	z28.s, #22
	mla	z0.s, p7/m, z8.s, z28.s
	mov	z10.s, #-13
	str	z0, [x0]
	addvl	x0, sp, #1
	mov	z0.s, #46
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, p7/m, z28.s, z26.s
	mla	z28.s, p7/m, z11.s, z0.s
	mov	z0.s, #-67
	mla	z28.s, p7/m, z12.s, z10.s
	mov	z10.s, #-73
	mla	z28.s, p7/m, z13.s, z0.s
	mov	z0.s, #-22
	mla	z28.s, p7/m, z14.s, z31.s
	mla	z28.s, p7/m, z15.s, z10.s
	mov	z10.s, #38
	mla	z28.s, p7/m, z16.s, z0.s
	add	x0, sp, 64
	ldr	z0, [x0]
	mla	z28.s, p7/m, z17.s, z10.s
	mov	z10.s, #82
	addvl	x0, sp, #5
	mla	z28.s, p7/m, z0.s, z10.s
	mov	z0.s, #88
	mov	z10.s, #-61
	mla	z28.s, p7/m, z19.s, z0.s
	mla	z28.s, p7/m, z20.s, z29.s
	mla	z28.s, p7/m, z21.s, z18.s
	mla	z28.s, p7/m, z22.s, z10.s
	mla	z28.s, p7/m, z23.s, z31.s
	add	x0, x0, 64
	mov	z10.s, #-78
	movprfx	z0, z28
	mla	z0.s, p7/m, z24.s, z10.s
	mov	z28.s, #-31
	mla	z0.s, p7/m, z8.s, z28.s
	mov	z10.s, #22
	str	z0, [x0]
	addvl	x0, sp, #1
	mov	z0.s, #-54
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #82
	mla	z28.s, p7/m, z11.s, z10.s
	mov	z10.s, #-61
	mla	z28.s, p7/m, z12.s, z0.s
	mov	z0.s, #13
	mla	z28.s, p7/m, z13.s, z31.s
	add	x0, sp, 64
	mla	z28.s, p7/m, z14.s, z10.s
	ldr	z10, [x0]
	mla	z28.s, p7/m, z15.s, z0.s
	mov	z0.s, #78
	addvl	x0, sp, #6
	mla	z28.s, p7/m, z16.s, z0.s
	mov	z0.s, #31
	mla	z28.s, p7/m, z17.s, z26.s
	mla	z28.s, p7/m, z10.s, z0.s
	mov	z10.s, #4
	mla	z28.s, p7/m, z19.s, z9.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z20.s, z31.s
	mov	z0.s, #-67
	mla	z28.s, p7/m, z21.s, z0.s
	mla	z28.s, p7/m, z22.s, z10.s
	mov	z10.s, #73
	mov	z0.s, #88
	mla	z28.s, p7/m, z23.s, z10.s
	mov	z10.s, #38
	mla	z28.s, p7/m, z24.s, z0.s
	mla	z28.s, p7/m, z8.s, z10.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	mov	z10.s, #-82
	mov	z0.s, #13
	ldr	z28, [x0]
	add	x0, sp, 64
	mul	z28.s, z28.s, #78
	mla	z28.s, p7/m, z11.s, z18.s
	mla	z28.s, p7/m, z12.s, z10.s
	mov	z10.s, #-73
	mla	z28.s, p7/m, z13.s, z10.s
	mla	z28.s, p7/m, z14.s, z0.s
	mov	z0.s, #-22
	mla	z28.s, p7/m, z15.s, z26.s
	mla	z28.s, p7/m, z16.s, z30.s
	mla	z28.s, p7/m, z17.s, z0.s
	ldr	z0, [x0]
	addvl	x0, sp, #7
	mla	z28.s, p7/m, z0.s, z25.s
	add	x0, x0, 64
	mov	z10.s, #-61
	mov	z0.s, #31
	mla	z28.s, p7/m, z19.s, z10.s
	mla	z28.s, p7/m, z20.s, z0.s
	mla	z28.s, p7/m, z21.s, z27.s
	mla	z28.s, p7/m, z22.s, z29.s
	mla	z28.s, p7/m, z23.s, z5.s
	mla	z28.s, p7/m, z24.s, z31.s
	mla	z28.s, p7/m, z8.s, z9.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	mov	z10.s, #-31
	mov	z0.s, #-22
	ldr	z28, [x0]
	add	x0, sp, 64
	mul	z28.s, z28.s, #73
	mla	z28.s, p7/m, z11.s, z10.s
	mov	z10.s, #-13
	mla	z28.s, p7/m, z12.s, z31.s
	mla	z28.s, p7/m, z13.s, z0.s
	mov	z0.s, #78
	mla	z28.s, p7/m, z14.s, z0.s
	ldr	z0, [x0]
	mla	z28.s, p7/m, z15.s, z30.s
	addvl	x0, sp, #8
	mla	z28.s, p7/m, z16.s, z5.s
	mla	z28.s, p7/m, z17.s, z31.s
	mla	z28.s, p7/m, z0.s, z10.s
	mov	z10.s, #82
	add	x0, x0, 64
	mla	z28.s, p7/m, z19.s, z10.s
	mov	z10.s, #61
	mov	z0.s, #-54
	mla	z28.s, p7/m, z20.s, z10.s
	mov	z10.s, #-78
	mla	z28.s, p7/m, z21.s, z9.s
	mla	z28.s, p7/m, z22.s, z25.s
	mla	z28.s, p7/m, z23.s, z18.s
	mla	z28.s, p7/m, z24.s, z26.s
	mla	z28.s, p7/m, z8.s, z29.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, p7/m, z28.s, z30.s
	mla	z28.s, p7/m, z11.s, z0.s
	mov	z0.s, #-22
	mla	z28.s, p7/m, z12.s, z10.s
	mov	z10.s, #38
	add	x0, sp, 64
	mla	z28.s, p7/m, z13.s, z10.s
	mov	z10.s, #4
	mla	z28.s, p7/m, z14.s, z26.s
	mla	z28.s, p7/m, z15.s, z0.s
	ldr	z0, [x0]
	mla	z28.s, p7/m, z16.s, z31.s
	addvl	x0, sp, #9
	mla	z28.s, p7/m, z17.s, z10.s
	mov	z10.s, #-31
	mla	z28.s, p7/m, z0.s, z27.s
	mov	z0.s, #13
	add	x0, x0, 64
	mla	z28.s, p7/m, z19.s, z0.s
	mov	z0.s, #46
	mla	z28.s, p7/m, z20.s, z25.s
	mla	z28.s, p7/m, z21.s, z10.s
	mov	z10.s, #82
	mla	z28.s, p7/m, z22.s, z10.s
	mla	z28.s, p7/m, z23.s, z0.s
	mov	z10.s, #-73
	movprfx	z0, z28
	mla	z0.s, p7/m, z24.s, z10.s
	mov	z28.s, #-61
	mla	z0.s, p7/m, z8.s, z28.s
	str	z0, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	mov	z0.s, #31
	add	x0, sp, 64
	mul	z28.s, z28.s, #61
	mla	z28.s, p7/m, z11.s, z10.s
	mov	z10.s, #82
	mla	z28.s, p7/m, z12.s, z9.s
	mla	z28.s, p7/m, z13.s, z10.s
	mla	z28.s, p7/m, z14.s, z0.s
	ldr	z0, [x0]
	addvl	x0, sp, #10
	add	x0, x0, 64
	mov	z10.s, #-13
	mla	z28.s, p7/m, z15.s, z25.s
	mla	z28.s, p7/m, z16.s, z10.s
	mov	z10.s, #22
	mla	z28.s, p7/m, z17.s, z27.s
	mla	z28.s, p7/m, z0.s, z18.s
	mov	z0.s, #-85
	mla	z28.s, p7/m, z19.s, z31.s
	mla	z28.s, p7/m, z20.s, z10.s
	mla	z28.s, p7/m, z21.s, z26.s
	mla	z28.s, p7/m, z22.s, z5.s
	mov	z5.s, #-78
	mla	z28.s, p7/m, z23.s, z5.s
	mla	z28.s, p7/m, z24.s, z29.s
	mla	z28.s, p7/m, z8.s, z30.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, p7/m, z28.s, z29.s
	mla	z28.s, p7/m, z11.s, z0.s
	mov	z0.s, #88
	mla	z28.s, p7/m, z12.s, z18.s
	add	x0, sp, 64
	mla	z28.s, p7/m, z13.s, z0.s
	mov	z10.s, #-61
	mov	z0.s, #13
	mla	z28.s, p7/m, z14.s, z9.s
	mla	z28.s, p7/m, z15.s, z10.s
	mov	z10.s, #82
	mla	z28.s, p7/m, z16.s, z10.s
	mla	z28.s, p7/m, z17.s, z0.s
	ldr	z0, [x0]
	addvl	x0, sp, #11
	mla	z28.s, p7/m, z0.s, z31.s
	mov	z10.s, #38
	add	x0, x0, 64
	mla	z28.s, p7/m, z19.s, z10.s
	mla	z28.s, p7/m, z20.s, z30.s
	mla	z28.s, p7/m, z21.s, z5.s
	mov	z5.s, #-22
	mla	z28.s, p7/m, z22.s, z5.s
	mla	z28.s, p7/m, z23.s, z27.s
	mov	z0.d, z10.d
	mov	z10.s, #-31
	movprfx	z5, z28
	mla	z5.s, p7/m, z24.s, z10.s
	mov	z28.s, #-73
	mla	z5.s, p7/m, z8.s, z28.s
	str	z5, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	mov	z5.s, #61
	ldr	z28, [x0]
	add	x0, sp, 64
	mul	z28.s, z28.s, #46
	mla	z28.s, p7/m, z11.s, z31.s
	mla	z28.s, p7/m, z12.s, z0.s
	mov	z0.s, #31
	mla	z28.s, p7/m, z13.s, z29.s
	mla	z28.s, p7/m, z14.s, z31.s
	mla	z28.s, p7/m, z15.s, z0.s
	mla	z28.s, p7/m, z16.s, z5.s
	mov	z5.s, #-85
	ldr	z0, [x0]
	mla	z28.s, p7/m, z17.s, z25.s
	mov	z10.s, #22
	addvl	x0, sp, #12
	mla	z28.s, p7/m, z0.s, z10.s
	mla	z28.s, p7/m, z19.s, z30.s
	mla	z28.s, p7/m, z20.s, z5.s
	mov	z5.s, #73
	add	x0, x0, 64
	mov	z0.s, #13
	mla	z28.s, p7/m, z21.s, z0.s
	mla	z28.s, p7/m, z22.s, z5.s
	mov	z5.s, #-82
	mov	z0.s, #78
	mla	z28.s, p7/m, z23.s, z5.s
	mov	z5.s, #4
	mla	z28.s, p7/m, z24.s, z5.s
	mla	z28.s, p7/m, z8.s, z0.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	mov	z5.s, #73
	add	x0, sp, 64
	mul	z28.s, z28.s, #38
	mla	z28.s, p7/m, z11.s, z25.s
	mla	z28.s, p7/m, z12.s, z5.s
	mla	z28.s, p7/m, z13.s, z18.s
	mov	z18.s, #-67
	ldr	z0, [x0]
	mla	z28.s, p7/m, z14.s, z18.s
	addvl	x0, sp, #13
	mov	z18.s, #-31
	mla	z28.s, p7/m, z15.s, z27.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z16.s, z9.s
	mov	z5.s, #61
	mla	z28.s, p7/m, z17.s, z18.s
	mov	z18.s, #-78
	mla	z28.s, p7/m, z0.s, z26.s
	mov	z0.s, #13
	mla	z28.s, p7/m, z19.s, z18.s
	mla	z28.s, p7/m, z20.s, z0.s
	mla	z28.s, p7/m, z21.s, z5.s
	mla	z28.s, p7/m, z22.s, z31.s
	mla	z28.s, p7/m, z23.s, z29.s
	mla	z28.s, p7/m, z24.s, z10.s
	mov	z10.d, z28.d
	mov	z28.s, #-82
	mla	z10.s, p7/m, z8.s, z28.s
	str	z10, [x0]
	addvl	x0, sp, #1
	mov	z5.s, #-38
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #31
	add	x0, sp, 64
	ldr	z0, [x0]
	mla	z28.s, p7/m, z11.s, z18.s
	addvl	x0, sp, #14
	mov	z18.s, #4
	mla	z28.s, p7/m, z12.s, z27.s
	mov	z10.s, #-61
	add	x0, x0, 64
	mla	z28.s, p7/m, z13.s, z10.s
	mla	z28.s, p7/m, z14.s, z18.s
	mov	z18.s, #82
	mla	z28.s, p7/m, z15.s, z29.s
	mla	z28.s, p7/m, z16.s, z25.s
	mla	z28.s, p7/m, z17.s, z18.s
	mla	z28.s, p7/m, z0.s, z5.s
	mov	z5.s, #73
	mov	z0.s, #-22
	mov	z18.d, z5.d
	mla	z28.s, p7/m, z19.s, z0.s
	mla	z28.s, p7/m, z20.s, z5.s
	mov	z5.s, #-13
	mla	z28.s, p7/m, z21.s, z31.s
	mla	z28.s, p7/m, z22.s, z30.s
	mla	z28.s, p7/m, z23.s, z5.s
	mla	z28.s, p7/m, z24.s, z9.s
	mla	z28.s, p7/m, z8.s, z26.s
	str	z28, [x0]
	addvl	x0, sp, #1
	mov	z5.s, #-38
	mov	z0.s, #46
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #22
	mla	z28.s, p7/m, z11.s, z10.s
	mla	z28.s, p7/m, z12.s, z26.s
	mla	z28.s, p7/m, z13.s, z31.s
	mla	z28.s, p7/m, z14.s, z18.s
	mov	z18.s, #-4
	mla	z28.s, p7/m, z15.s, z5.s
	add	x0, sp, 64
	mla	z28.s, p7/m, z16.s, z18.s
	mov	z18.s, #-78
	mla	z28.s, p7/m, z17.s, z0.s
	ldr	z0, [x0]
	mov	z10.d, z18.d
	mla	z28.s, p7/m, z0.s, z18.s
	addvl	x0, sp, #15
	mov	z18.s, #-82
	mla	z28.s, p7/m, z19.s, z27.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z20.s, z18.s
	mov	z18.s, #-13
	mla	z28.s, p7/m, z21.s, z29.s
	mla	z28.s, p7/m, z22.s, z18.s
	mov	z18.s, #-31
	mla	z28.s, p7/m, z23.s, z18.s
	mla	z28.s, p7/m, z24.s, z30.s
	mla	z28.s, p7/m, z8.s, z25.s
	str	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #13
	add	x0, sp, 64
	mla	z28.s, p7/m, z11.s, z5.s
	mov	z5.s, #61
	mla	z28.s, p7/m, z12.s, z5.s
	mla	z28.s, p7/m, z13.s, z10.s
	mov	z10.s, #-73
	mov	z0.s, #88
	mla	z28.s, p7/m, z14.s, z0.s
	mla	z28.s, p7/m, z15.s, z31.s
	mla	z28.s, p7/m, z16.s, z26.s
	mla	z28.s, p7/m, z17.s, z10.s
	ldr	z10, [x0]
	addvl	x0, sp, #16
	mla	z28.s, p7/m, z10.s, z29.s
	mov	z5.s, #4
	mov	z10.s, #22
	add	x0, x0, 64
	mla	z28.s, p7/m, z19.s, z18.s
	mov	z0.d, z18.d
	mla	z28.s, p7/m, z20.s, z5.s
	mov	z18.d, z10.d
	mla	z28.s, p7/m, z21.s, z10.s
	mov	z5.s, #-82
	mla	z28.s, p7/m, z22.s, z9.s
	mla	z28.s, p7/m, z23.s, z30.s
	movprfx	z10, z28
	mla	z10.s, p7/m, z24.s, z5.s
	mla	z10.s, p7/m, z8.s, z27.s
	str	z10, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z28, [x0]
	lsl	z10.s, z28.s, #2
	add	x0, sp, 64
	mov	z28.s, #-13
	mad	z11.s, p7/m, z28.s, z10.s
	mov	z10.s, #38
	mad	z12.s, p7/m, z18.s, z11.s
	ldr	z18, [x0]
	mad	z13.s, p7/m, z0.s, z12.s
	addvl	x0, sp, #27
	mad	z14.s, p7/m, z10.s, z13.s
	mad	z15.s, p7/m, z9.s, z14.s
	add	x0, x0, 64
	mad	z16.s, p7/m, z29.s, z15.s
	mov	z15.s, #-61
	mad	z17.s, p7/m, z15.s, z16.s
	mov	z28.s, #-73
	mad	z18.s, p7/m, z30.s, z17.s
	mov	z17.s, #78
	mad	z19.s, p7/m, z28.s, z18.s
	mad	z20.s, p7/m, z17.s, z19.s
	mad	z21.s, p7/m, z5.s, z20.s
	mad	z22.s, p7/m, z26.s, z21.s
	mad	z23.s, p7/m, z25.s, z22.s
	mad	z24.s, p7/m, z27.s, z23.s
	movprfx	z12, z24
	mla	z12.s, p7/m, z8.s, z31.s
	str	z12, [x0]
	addvl	x0, sp, #22
	mov	z17.s, #43
	mov	z16.s, #70
	mov	z14.s, #87
	mov	z19.s, #57
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z27.s
	mov	z12.s, #25
	mla	z28.s, p7/m, z2.s, z14.s
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z24.s, #80
	mla	z28.s, p7/m, z3.s, z24.s
	mla	z28.s, p7/m, z4.s, z16.s
	mla	z28.s, p7/m, z8.s, z19.s
	mla	z28.s, p7/m, z6.s, z17.s
	movprfx	z11, z28
	mla	z11.s, p7/m, z7.s, z12.s
	ldr	z10, [x3]
	mov	z24.s, #9
	mov	z18.s, #-80
	movprfx	z0, z11
	mla	z0.s, p7/m, z10.s, z24.s
	mov	z15.s, #-25
	movprfx	z22, z1
	mul	z22.s, p7/m, z22.s, z14.s
	mov	z28.s, #-70
	mla	z22.s, p7/m, z2.s, z19.s
	add	x0, sp, 64
	mla	z22.s, p7/m, z3.s, z24.s
	mov	z23.s, #-43
	mla	z22.s, p7/m, z4.s, z23.s
	mla	z22.s, p7/m, z8.s, z18.s
	mla	z22.s, p7/m, z6.s, z31.s
	movprfx	z11, z22
	mla	z11.s, p7/m, z7.s, z28.s
	mla	z11.s, p7/m, z10.s, z15.s
	movprfx	z20, z1
	mul	z20.s, p7/m, z20.s, z16.s
	str	z11, [x0]
	movprfx	z11, z1
	mul	z11.s, p7/m, z11.s, z19.s
	addvl	x0, sp, #18
	mla	z11.s, p7/m, z2.s, z18.s
	mla	z11.s, p7/m, z3.s, z15.s
	mla	z11.s, p7/m, z4.s, z27.s
	mov	z21.s, #-87
	mad	z23.s, p7/m, z2.s, z20.s
	add	x0, x0, 64
	mla	z23.s, p7/m, z3.s, z21.s
	movprfx	z22, z1
	mul	z22.s, z22.s, #80
	mla	z23.s, p7/m, z4.s, z24.s
	mla	z22.s, p7/m, z2.s, z24.s
	mla	z23.s, p7/m, z8.s, z27.s
	mla	z22.s, p7/m, z3.s, z28.s
	mla	z23.s, p7/m, z6.s, z12.s
	mla	z22.s, p7/m, z4.s, z21.s
	mov	z20.s, #-9
	mla	z22.s, p7/m, z8.s, z15.s
	mad	z20.s, p7/m, z8.s, z11.s
	mla	z22.s, p7/m, z6.s, z19.s
	movprfx	z11, z1
	mul	z11.s, p7/m, z11.s, z17.s
	mla	z11.s, p7/m, z2.s, z31.s
	mad	z19.s, p7/m, z3.s, z11.s
	mad	z12.s, p7/m, z4.s, z19.s
	mla	z20.s, p7/m, z6.s, z21.s
	mad	z21.s, p7/m, z8.s, z12.s
	ldr	z12, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	movprfx	z19, z1
	mul	z19.s, z19.s, #25
	mul	z1.s, p7/m, z1.s, z24.s
	mla	z19.s, p7/m, z2.s, z28.s
	mad	z2.s, p7/m, z15.s, z1.s
	mla	z19.s, p7/m, z3.s, z27.s
	mad	z3.s, p7/m, z17.s, z2.s
	mov	z13.s, #-57
	mla	z19.s, p7/m, z4.s, z18.s
	mad	z4.s, p7/m, z13.s, z3.s
	ldr	z3, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	movprfx	z5, z4
	mla	z5.s, p7/m, z8.s, z16.s
	mla	z22.s, p7/m, z7.s, z27.s
	mla	z23.s, p7/m, z7.s, z18.s
	mla	z20.s, p7/m, z7.s, z17.s
	mla	z21.s, p7/m, z6.s, z16.s
	mla	z19.s, p7/m, z8.s, z17.s
	mla	z21.s, p7/m, z7.s, z24.s
	mla	z19.s, p7/m, z6.s, z24.s
	mad	z6.s, p7/m, z18.s, z5.s
	mla	z19.s, p7/m, z7.s, z13.s
	mad	z7.s, p7/m, z14.s, z6.s
	mla	z19.s, p7/m, z10.s, z14.s
	ldr	z14, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	mov	z28.s, #50
	mla	z22.s, p7/m, z10.s, z17.s
	mla	z23.s, p7/m, z10.s, z13.s
	ldr	z13, [x0]
	mov	z24.s, #75
	addvl	x0, sp, #19
	movprfx	z17, z12
	mul	z17.s, z17.s, #89
	mla	z17.s, p7/m, z3.s, z24.s
	mla	z17.s, p7/m, z14.s, z28.s
	mov	z28.s, #-18
	mla	z20.s, p7/m, z10.s, z16.s
	mov	z8.s, #-89
	movprfx	z16, z12
	mul	z16.s, p7/m, z16.s, z24.s
	add	x0, x0, 64
	mla	z16.s, p7/m, z3.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #50
	mla	z28.s, p7/m, z3.s, z8.s
	mla	z21.s, p7/m, z10.s, z18.s
	mla	z7.s, p7/m, z10.s, z31.s
	mov	z10.s, #18
	mla	z17.s, p7/m, z13.s, z10.s
	mad	z10.s, p7/m, z14.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #18
	ldr	z12, [x0]
	addvl	x0, sp, #24
	mov	z18.s, #-50
	add	x0, x0, 64
	mla	z28.s, p7/m, z3.s, z18.s
	ldr	z3, [x0]
	mla	z28.s, p7/m, z14.s, z24.s
	addvl	x0, sp, #17
	mla	z16.s, p7/m, z14.s, z8.s
	add	x0, x0, 64
	mad	z8.s, p7/m, z13.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #83
	mov	z15.s, #36
	mov	z14.s, #-83
	mad	z15.s, p7/m, z3.s, z28.s
	movprfx	z28, z12
	mul	z28.s, z28.s, #36
	mad	z14.s, p7/m, z3.s, z28.s
	ldr	z3, [x0]
	addvl	x0, sp, #21
	mla	z16.s, p7/m, z13.s, z18.s
	lsl	z18.s, z3.s, #6
	add	x0, x0, 64
	ldr	z12, [x0]
	mla	z10.s, p7/m, z13.s, z24.s
	add	x0, sp, 64
	mov	z24.s, #64
	mov	z28.s, #-64
	mad	z24.s, p7/m, z12.s, z18.s
	mad	z28.s, p7/m, z12.s, z18.s
	add	z18.s, z24.s, z15.s
	sub	z24.s, z24.s, z15.s
	add	z15.s, z28.s, z14.s
	add	z12.s, z15.s, z16.s
	sub	z15.s, z15.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z11.s, z18.s, z17.s
	sub	z28.s, z28.s, z14.s
	add	z13.s, z28.s, z10.s
	sub	z28.s, z28.s, z10.s
	add	z10.s, z11.s, z0.s
	sub	z11.s, z11.s, z0.s
	str	z11, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 64
	add	z6.s, z13.s, z22.s
	sub	z13.s, z13.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #3
	add	z14.s, z24.s, z8.s
	add	x0, x0, 64
	sub	z24.s, z24.s, z8.s
	add	z8.s, z12.s, z16.s
	sub	z12.s, z12.s, z16.s
	add	z16.s, z10.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #4
	add	z1.s, z24.s, z20.s
	sub	z24.s, z24.s, z20.s
	add	x0, x0, 64
	ldr	z20, [x0]
	sub	z18.s, z18.s, z17.s
	add	x0, sp, 64
	str	z6, [x0]
	add	z17.s, z8.s, z22.s
	addvl	x0, sp, #5
	add	z0.s, z28.s, z21.s
	sub	z28.s, z28.s, z21.s
	add	x0, x0, 64
	ldr	z22, [x0]
	add	z2.s, z14.s, z23.s
	addvl	x0, sp, #6
	sub	z14.s, z14.s, z23.s
	add	z4.s, z15.s, z19.s
	add	x0, x0, 64
	ldr	z21, [x0]
	sub	z15.s, z15.s, z19.s
	addvl	x0, sp, #7
	add	z19.s, z2.s, z22.s
	add	z5.s, z18.s, z7.s
	add	x0, x0, 64
	ldr	z23, [x0]
	sub	z7.s, z18.s, z7.s
	addvl	x0, sp, #8
	add	z18.s, z6.s, z20.s
	add	z20.s, z1.s, z21.s
	add	x0, x0, 64
	ldr	z22, [x0]
	add	z21.s, z0.s, z23.s
	addvl	x0, sp, #9
	add	z22.s, z4.s, z22.s
	sqrshrnb	z16.h, z16.s, #7
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z23.s, z5.s, z23.s
	addvl	x0, sp, #10
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x0, x0, 64
	ldr	z6, [x0]
	add	z6.s, z7.s, z6.s
	addvl	x0, sp, #11
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z3.s, z15.s, z11.s
	addvl	x0, sp, #17
	sunpklo	z17.s, z17.h
	sqrshrnb	z18.h, z18.s, #7
	add	x0, x0, 64
	str	z3, [x0]
	uzp1	z18.h, z18.h, z18.h
	addvl	x0, sp, #12
	sunpklo	z18.s, z18.h
	sqrshrnb	z19.h, z19.s, #7
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z3.s, z28.s, z11.s
	addvl	x0, sp, #18
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x0, x0, 64
	str	z3, [x0]
	sqrshrnb	z20.h, z20.s, #7
	addvl	x0, sp, #13
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z3.s, z24.s, z11.s
	addvl	x0, sp, #19
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x0, x0, 64
	str	z3, [x0]
	sunpklo	z21.s, z21.h
	addvl	x0, sp, #14
	sqrshrnb	z22.h, z22.s, #7
	uzp1	z22.h, z22.h, z22.h
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z3.s, z14.s, z11.s
	addvl	x0, sp, #20
	sunpklo	z22.s, z22.h
	sqrshrnb	z23.h, z23.s, #7
	add	x0, x0, 64
	str	z3, [x0]
	uzp1	z23.h, z23.h, z23.h
	addvl	x0, sp, #15
	sunpklo	z23.s, z23.h
	sqrshrnb	z6.h, z6.s, #7
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z3.s, z13.s, z11.s
	addvl	x0, sp, #21
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x0, x0, 64
	str	z3, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z11.s, z12.s, z11.s
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z11, [x0]
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z3, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z11.s, z11.s, z3.s
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z11, [x0]
	sub	z11.s, z11.s, z3.s
	addvl	x0, sp, #16
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z12.s, z12.s, z3.s
	addvl	x0, sp, #1
	sunpklo	z11.s, z11.h
	add	x0, x0, 64
	str	z12, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z13.s, z13.s, z12.s
	addvl	x0, sp, #14
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z14.s, z14.s, z12.s
	addvl	x0, sp, #13
	sunpklo	z13.s, z13.h
	sqrshrnb	z14.h, z14.s, #7
	add	x0, x0, 64
	ldr	z12, [x0]
	sub	z3.s, z24.s, z12.s
	str	z3, [x0]
	addvl	x0, sp, #12
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	ldr	z24, [x0]
	sub	z3.s, z28.s, z24.s
	str	z3, [x0]
	addvl	x0, sp, #11
	sunpklo	z14.s, z14.h
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z15.s, z15.s, z28.s
	addvl	x0, sp, #10
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	add	x0, x0, 64
	ldr	z24, [x0]
	sub	z7.s, z7.s, z24.s
	addvl	x0, sp, #9
	sunpklo	z15.s, z15.h
	sqrshrnb	z7.h, z7.s, #7
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z5.s, z5.s, z28.s
	addvl	x0, sp, #8
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x0, x0, 64
	ldr	z24, [x0]
	sub	z4.s, z4.s, z24.s
	addvl	x0, sp, #7
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x0, x0, 64
	ldr	z24, [x0]
	sub	z0.s, z0.s, z24.s
	addvl	x0, sp, #6
	sunpklo	z5.s, z5.h
	sqrshrnb	z4.h, z4.s, #7
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z1.s, z1.s, z28.s
	addvl	x0, sp, #5
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z2.s, z2.s, z28.s
	addvl	x0, sp, #4
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 64
	ldr	z24, [x0]
	sunpklo	z0.s, z0.h
	add	x0, sp, 64
	ldr	z28, [x0]
	sub	z3.s, z28.s, z24.s
	addvl	x0, sp, #3
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z8.s, z8.s, z28.s
	addvl	x0, sp, #2
	sunpklo	z1.s, z1.h
	sqrshrnb	z2.h, z2.s, #7
	add	x0, x0, 64
	ldr	z28, [x0]
	sub	z10.s, z10.s, z28.s
	mov	w0, 32
	index	z28.s, #0, w0
	uzp1	z2.h, z2.h, z2.h
	addvl	x0, sp, #31
	sunpklo	z2.s, z2.h
	sqrshrnb	z3.h, z3.s, #7
	add	x0, x0, 1600
	st1h	z16.s, p6, [x0, z28.s, sxtw 1]
	uzp1	z3.h, z3.h, z3.h
	addvl	x0, sp, #31
	sunpklo	z3.s, z3.h
	sqrshrnb	z8.h, z8.s, #7
	add	x0, x0, 1602
	st1h	z17.s, p6, [x0, z28.s, sxtw 1]
	uzp1	z8.h, z8.h, z8.h
	addvl	x0, sp, #31
	sunpklo	z8.s, z8.h
	sqrshrnb	z10.h, z10.s, #7
	add	x0, x0, 1604
	st1h	z18.s, p6, [x0, z28.s, sxtw 1]
	uzp1	z10.h, z10.h, z10.h
	addvl	x0, sp, #31
	sunpklo	z10.s, z10.h
	add	x0, x0, 1606
	st1h	z19.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1608
	st1h	z20.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1610
	st1h	z21.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1612
	st1h	z22.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1614
	st1h	z23.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1616
	st1h	z6.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1618
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1620
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1622
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1624
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1626
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1628
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1630
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1632
	st1h	z11.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z12.h, z24.s, #7
	addvl	x0, sp, #31
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x0, x0, 1634
	st1h	z12.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1636
	st1h	z13.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1638
	st1h	z14.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1640
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	sqrshrnb	z24.h, z12.s, #7
	addvl	x0, sp, #31
	uzp1	z24.h, z24.h, z24.h
	sunpklo	z24.s, z24.h
	add	x0, x0, 1642
	st1h	z24.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1644
	st1h	z15.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1646
	st1h	z7.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1648
	st1h	z5.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1650
	st1h	z4.s, p6, [x0, z28.s, sxtw 1]
	mov	z4.s, #13
	addvl	x0, sp, #31
	add	x0, x0, 1652
	st1h	z0.s, p6, [x0, z28.s, sxtw 1]
	mov	z0.s, #88
	addvl	x0, sp, #31
	add	x0, x0, 1654
	st1h	z1.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1656
	st1h	z2.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1658
	st1h	z3.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 1660
	st1h	z8.s, p6, [x0, z28.s, sxtw 1]
	mov	z8.s, #73
	addvl	x0, sp, #31
	add	x0, x0, 1662
	st1h	z10.s, p6, [x0, z28.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 64
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	str	z12, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 128
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 192
	ld1sh	z1.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 256
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 320
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	str	z3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 384
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 448
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 512
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 576
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z3, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 640
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 704
	ld1sh	z3.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, p7/m, z3.s, z27.s
	addvl	x0, sp, #31
	movprfx	z2, z3
	mla	z2.s, p7/m, z12.s, z27.s
	mla	z2.s, p7/m, z13.s, z0.s
	add	x0, x0, 768
	ld1sh	z16.s, p7/z, [x0]
	mla	z2.s, p7/m, z14.s, z26.s
	addvl	x0, sp, #31
	mov	z0.s, #38
	add	x0, x0, 832
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 896
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 960
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1024
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1088
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1152
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1216
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z6, [x0]
	mov	z6.s, #78
	addvl	x0, sp, #31
	add	x0, x0, 1280
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1344
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1408
	ld1sh	z21.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1472
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z7, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1536
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1600
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1664
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1728
	ld1sh	z28.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z28, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1792
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1856
	ld1sh	z7.s, p7/z, [x0]
	str	z7, [x3]
	addvl	x0, sp, #31
	mov	z7.s, #82
	mla	z2.s, p7/m, z15.s, z7.s
	add	x0, x0, 1920
	ld1sh	z28.s, p7/z, [x0]
	mla	z2.s, p7/m, z16.s, z6.s
	addvl	x0, sp, #31
	mla	z2.s, p7/m, z17.s, z8.s
	mov	z8.s, #61
	add	x0, x0, 1984
	mla	z2.s, p7/m, z18.s, z30.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z2.s, p7/m, z19.s, z8.s
	addvl	x0, sp, #27
	mov	z8.s, #46
	mla	z2.s, p7/m, z20.s, z29.s
	add	x0, x0, 64
	mla	z2.s, p7/m, z21.s, z8.s
	mov	z8.s, #31
	mla	z2.s, p7/m, z22.s, z0.s
	mla	z2.s, p7/m, z23.s, z8.s
	mov	z8.s, #22
	mla	z2.s, p7/m, z24.s, z8.s
	str	z10, [x0]
	addvl	x0, sp, #31
	movprfx	z8, z2
	mla	z8.s, p7/m, z28.s, z4.s
	mla	z3.s, p7/m, z12.s, z7.s
	add	x0, x0, 2048
	mov	z6.s, #4
	ld1sh	z10.s, p7/z, [x0]
	mov	z7.s, #46
	mla	z8.s, p7/m, z10.s, z6.s
	mov	z2.s, #-31
	mla	z3.s, p7/m, z13.s, z30.s
	add	x0, sp, 64
	mla	z3.s, p7/m, z14.s, z7.s
	mov	z7.s, #-4
	str	z8, [x0]
	mov	z8.s, #22
	mla	z3.s, p7/m, z15.s, z8.s
	mla	z3.s, p7/m, z16.s, z7.s
	mla	z3.s, p7/m, z17.s, z2.s
	mov	z2.s, #-54
	mla	z3.s, p7/m, z18.s, z2.s
	mov	z6.s, #-85
	mov	z2.s, #-73
	mla	z3.s, p7/m, z19.s, z2.s
	mla	z3.s, p7/m, z20.s, z6.s
	mov	z2.s, #-78
	mla	z3.s, p7/m, z21.s, z31.s
	mov	z8.d, z2.d
	mla	z3.s, p7/m, z22.s, z25.s
	mov	z6.s, #-38
	mla	z3.s, p7/m, z23.s, z2.s
	mov	z2.s, #-61
	addvl	x0, sp, #1
	mla	z3.s, p7/m, z24.s, z2.s
	mov	z2.s, #31
	mla	z3.s, p7/m, z28.s, z6.s
	mov	z6.s, #-13
	mla	z3.s, p7/m, z10.s, z6.s
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, z3.s, #88
	mla	z3.s, p7/m, z12.s, z30.s
	mla	z3.s, p7/m, z13.s, z2.s
	mov	z2.s, #-54
	mla	z3.s, p7/m, z14.s, z6.s
	mla	z3.s, p7/m, z15.s, z2.s
	mov	z2.s, #-82
	mla	z3.s, p7/m, z16.s, z2.s
	mla	z3.s, p7/m, z17.s, z31.s
	mov	z2.d, z0.d
	mla	z3.s, p7/m, z18.s, z8.s
	mla	z3.s, p7/m, z19.s, z9.s
	mla	z3.s, p7/m, z20.s, z7.s
	mla	z3.s, p7/m, z21.s, z0.s
	mov	z0.s, #73
	mla	z3.s, p7/m, z22.s, z0.s
	mov	z0.s, #61
	mla	z3.s, p7/m, z23.s, z27.s
	addvl	x0, sp, #2
	mla	z3.s, p7/m, z24.s, z26.s
	mov	z8.s, #22
	mla	z3.s, p7/m, z28.s, z0.s
	mov	z0.s, #46
	mla	z3.s, p7/m, z10.s, z8.s
	add	x0, x0, 64
	mov	z8.s, #-22
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, p7/m, z3.s, z26.s
	mla	z3.s, p7/m, z12.s, z0.s
	mov	z0.s, #-67
	mla	z3.s, p7/m, z13.s, z6.s
	mla	z3.s, p7/m, z14.s, z0.s
	mov	z0.s, #-73
	mla	z3.s, p7/m, z15.s, z31.s
	mla	z3.s, p7/m, z16.s, z0.s
	mla	z3.s, p7/m, z17.s, z8.s
	mov	z8.s, #82
	mla	z3.s, p7/m, z18.s, z2.s
	mla	z3.s, p7/m, z19.s, z8.s
	mov	z8.s, #88
	mla	z3.s, p7/m, z20.s, z8.s
	mla	z3.s, p7/m, z21.s, z29.s
	mov	z8.s, #-61
	mla	z3.s, p7/m, z22.s, z7.s
	mov	z6.d, z8.d
	mla	z3.s, p7/m, z23.s, z8.s
	mov	z8.s, #-78
	mla	z3.s, p7/m, z24.s, z31.s
	mla	z3.s, p7/m, z28.s, z8.s
	addvl	x0, sp, #3
	mov	z8.d, z3.d
	mov	z3.s, #-31
	mla	z8.s, p7/m, z10.s, z3.s
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #22
	movprfx	z3, z11
	mul	z3.s, z3.s, #82
	mla	z3.s, p7/m, z12.s, z8.s
	mov	z8.s, #-54
	mla	z3.s, p7/m, z13.s, z8.s
	mov	z8.d, z6.d
	mla	z3.s, p7/m, z14.s, z31.s
	mla	z3.s, p7/m, z15.s, z6.s
	mov	z6.s, #78
	mla	z3.s, p7/m, z16.s, z4.s
	mla	z3.s, p7/m, z17.s, z6.s
	mov	z6.s, #31
	mla	z3.s, p7/m, z18.s, z26.s
	mla	z3.s, p7/m, z19.s, z6.s
	mov	z6.s, #-67
	mla	z3.s, p7/m, z20.s, z9.s
	mla	z3.s, p7/m, z21.s, z31.s
	mla	z3.s, p7/m, z22.s, z6.s
	mov	z6.s, #4
	mla	z3.s, p7/m, z23.s, z6.s
	mov	z6.s, #73
	mla	z3.s, p7/m, z24.s, z6.s
	addvl	x0, sp, #4
	mov	z6.s, #88
	mla	z3.s, p7/m, z28.s, z6.s
	mla	z3.s, p7/m, z10.s, z2.s
	mov	z6.s, #-82
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, z3.s, #78
	mla	z3.s, p7/m, z12.s, z7.s
	mov	z7.s, #-22
	mla	z3.s, p7/m, z13.s, z6.s
	mov	z6.s, #31
	mla	z3.s, p7/m, z14.s, z0.s
	addvl	x0, sp, #5
	mla	z3.s, p7/m, z15.s, z4.s
	mla	z3.s, p7/m, z16.s, z26.s
	mla	z3.s, p7/m, z17.s, z30.s
	mla	z3.s, p7/m, z18.s, z7.s
	mov	z7.s, #-31
	mla	z3.s, p7/m, z19.s, z25.s
	mla	z3.s, p7/m, z20.s, z8.s
	mla	z3.s, p7/m, z21.s, z6.s
	mov	z6.s, #-38
	mla	z3.s, p7/m, z22.s, z27.s
	mla	z3.s, p7/m, z23.s, z29.s
	mla	z3.s, p7/m, z24.s, z6.s
	mla	z3.s, p7/m, z28.s, z31.s
	mla	z3.s, p7/m, z10.s, z9.s
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, z3.s, #73
	mla	z3.s, p7/m, z12.s, z7.s
	mov	z7.s, #-22
	mla	z3.s, p7/m, z13.s, z31.s
	mla	z3.s, p7/m, z14.s, z7.s
	mov	z7.s, #78
	mla	z3.s, p7/m, z15.s, z7.s
	mov	z7.s, #-13
	mla	z3.s, p7/m, z16.s, z30.s
	mla	z3.s, p7/m, z17.s, z6.s
	mla	z3.s, p7/m, z18.s, z31.s
	mla	z3.s, p7/m, z19.s, z7.s
	mov	z7.s, #82
	mla	z3.s, p7/m, z20.s, z7.s
	mov	z7.s, #61
	mla	z3.s, p7/m, z21.s, z7.s
	mov	z7.s, #-4
	mla	z3.s, p7/m, z22.s, z9.s
	addvl	x0, sp, #6
	mla	z3.s, p7/m, z23.s, z25.s
	mla	z3.s, p7/m, z24.s, z7.s
	mov	z7.s, #-54
	mla	z3.s, p7/m, z28.s, z26.s
	mla	z3.s, p7/m, z10.s, z29.s
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, p7/m, z3.s, z30.s
	mla	z3.s, p7/m, z12.s, z7.s
	mov	z7.s, #-78
	mla	z3.s, p7/m, z13.s, z7.s
	mla	z3.s, p7/m, z14.s, z2.s
	mov	z7.s, #-22
	mla	z3.s, p7/m, z15.s, z26.s
	mla	z3.s, p7/m, z16.s, z7.s
	mov	z7.s, #4
	mla	z3.s, p7/m, z17.s, z31.s
	mla	z3.s, p7/m, z18.s, z7.s
	mov	z7.s, #-31
	mla	z3.s, p7/m, z19.s, z27.s
	mla	z3.s, p7/m, z20.s, z4.s
	mov	z4.s, #46
	mla	z3.s, p7/m, z21.s, z25.s
	mla	z3.s, p7/m, z22.s, z7.s
	mov	z7.s, #82
	mla	z3.s, p7/m, z23.s, z7.s
	mla	z3.s, p7/m, z24.s, z4.s
	movprfx	z4, z3
	mla	z4.s, p7/m, z28.s, z0.s
	mla	z4.s, p7/m, z10.s, z8.s
	mov	z8.s, #31
	addvl	x0, sp, #7
	movprfx	z3, z11
	mul	z3.s, z3.s, #61
	mla	z3.s, p7/m, z12.s, z0.s
	mla	z3.s, p7/m, z13.s, z9.s
	mla	z3.s, p7/m, z14.s, z7.s
	mla	z3.s, p7/m, z15.s, z8.s
	mov	z8.s, #-13
	mla	z3.s, p7/m, z16.s, z25.s
	add	x0, x0, 64
	mla	z3.s, p7/m, z17.s, z8.s
	mov	z8.s, #22
	mla	z3.s, p7/m, z18.s, z27.s
	mov	z7.s, #-4
	mla	z3.s, p7/m, z19.s, z7.s
	mla	z3.s, p7/m, z20.s, z31.s
	mla	z3.s, p7/m, z21.s, z8.s
	mov	z8.s, #-78
	mla	z3.s, p7/m, z22.s, z26.s
	mla	z3.s, p7/m, z23.s, z6.s
	mla	z3.s, p7/m, z24.s, z8.s
	str	z4, [x0]
	movprfx	z4, z3
	mla	z4.s, p7/m, z28.s, z29.s
	addvl	x0, sp, #8
	mla	z4.s, p7/m, z10.s, z30.s
	movprfx	z3, z11
	mul	z3.s, p7/m, z3.s, z29.s
	add	x0, x0, 64
	mov	z8.s, #-61
	str	z4, [x0]
	mov	z4.s, #-85
	mla	z3.s, p7/m, z12.s, z4.s
	mla	z3.s, p7/m, z13.s, z7.s
	mov	z7.s, #88
	mla	z3.s, p7/m, z14.s, z7.s
	mov	z7.s, #82
	mla	z3.s, p7/m, z15.s, z9.s
	mla	z3.s, p7/m, z16.s, z8.s
	mov	z8.s, #-78
	mla	z3.s, p7/m, z17.s, z7.s
	mov	z4.s, #13
	addvl	x0, sp, #9
	mla	z3.s, p7/m, z18.s, z4.s
	mov	z7.s, #-31
	mla	z3.s, p7/m, z19.s, z31.s
	mla	z3.s, p7/m, z20.s, z2.s
	mla	z3.s, p7/m, z21.s, z30.s
	mla	z3.s, p7/m, z22.s, z8.s
	mov	z8.s, #-22
	mla	z3.s, p7/m, z23.s, z8.s
	mla	z3.s, p7/m, z24.s, z27.s
	mla	z3.s, p7/m, z28.s, z7.s
	mla	z3.s, p7/m, z10.s, z0.s
	add	x0, x0, 64
	str	z3, [x0]
	movprfx	z3, z11
	mul	z3.s, z3.s, #46
	mla	z3.s, p7/m, z12.s, z31.s
	mla	z3.s, p7/m, z13.s, z2.s
	mov	z8.s, #22
	mad	z29.s, p7/m, z14.s, z3.s
	mov	z0.s, #31
	mla	z29.s, p7/m, z15.s, z31.s
	mov	z3.s, #61
	mla	z29.s, p7/m, z16.s, z0.s
	mla	z29.s, p7/m, z17.s, z3.s
	mla	z29.s, p7/m, z18.s, z25.s
	mla	z29.s, p7/m, z19.s, z8.s
	mov	z7.d, z3.d
	mad	z30.s, p7/m, z20.s, z29.s
	mov	z3.s, #-85
	mov	z29.s, #-82
	mla	z30.s, p7/m, z21.s, z3.s
	mov	z3.s, #73
	mla	z30.s, p7/m, z22.s, z4.s
	mla	z30.s, p7/m, z23.s, z3.s
	mla	z30.s, p7/m, z24.s, z29.s
	mov	z29.s, #4
	mla	z30.s, p7/m, z28.s, z29.s
	mov	z0.d, z8.d
	mov	z8.d, z29.d
	mov	z29.d, z30.d
	mov	z30.s, #78
	mla	z29.s, p7/m, z10.s, z30.s
	movprfx	z30, z11
	mul	z30.s, p7/m, z30.s, z2.s
	mad	z25.s, p7/m, z12.s, z30.s
	mla	z25.s, p7/m, z13.s, z3.s
	mov	z30.s, #-4
	mad	z30.s, p7/m, z14.s, z25.s
	mov	z25.s, #-67
	mla	z30.s, p7/m, z15.s, z25.s
	mad	z27.s, p7/m, z16.s, z30.s
	addvl	x0, sp, #10
	mad	z9.s, p7/m, z17.s, z27.s
	mov	z27.s, #-31
	movprfx	z30, z9
	mla	z30.s, p7/m, z27.s, z18.s
	add	x0, x0, 64
	mad	z26.s, p7/m, z19.s, z30.s
	mov	z27.s, #-78
	movprfx	z30, z26
	mla	z30.s, p7/m, z27.s, z20.s
	mla	z30.s, p7/m, z21.s, z4.s
	mla	z30.s, p7/m, z22.s, z7.s
	mad	z31.s, p7/m, z23.s, z30.s
	str	z29, [x0]
	mov	z29.d, z3.d
	mov	z3.s, #54
	mla	z31.s, p7/m, z24.s, z3.s
	addvl	x0, sp, #11
	movprfx	z9, z31
	mla	z9.s, p7/m, z28.s, z0.s
	mov	z31.s, #-82
	mla	z9.s, p7/m, z10.s, z31.s
	add	x0, x0, 64
	mov	z25.s, #-88
	mov	z30.s, #82
	str	z9, [x0]
	mov	z9.s, #-78
	mov	z26.s, #-61
	movprfx	z31, z11
	mul	z31.s, z31.s, #31
	mla	z31.s, p7/m, z12.s, z9.s
	mov	z9.s, #90
	mla	z31.s, p7/m, z13.s, z9.s
	mla	z31.s, p7/m, z14.s, z26.s
	mla	z31.s, p7/m, z15.s, z8.s
	mla	z31.s, p7/m, z16.s, z3.s
	mla	z31.s, p7/m, z17.s, z25.s
	mov	z25.d, z6.d
	mla	z31.s, p7/m, z18.s, z30.s
	mov	z30.s, #-22
	mla	z31.s, p7/m, z19.s, z6.s
	mov	z6.s, #-13
	mov	z9.s, #67
	mov	z27.d, z0.d
	mla	z31.s, p7/m, z20.s, z30.s
	mov	z0.s, #85
	mov	z30.s, #-90
	mla	z31.s, p7/m, z21.s, z29.s
	mov	z7.d, z6.d
	mla	z31.s, p7/m, z22.s, z30.s
	addvl	x0, sp, #12
	mla	z31.s, p7/m, z23.s, z9.s
	mla	z31.s, p7/m, z24.s, z6.s
	mov	z6.s, #-46
	mla	z31.s, p7/m, z28.s, z6.s
	mla	z31.s, p7/m, z10.s, z0.s
	mov	z6.d, z25.d
	add	x0, x0, 64
	mov	z4.s, #46
	str	z31, [x0]
	movprfx	z31, z11
	mul	z31.s, p7/m, z31.s, z27.s
	mla	z31.s, p7/m, z12.s, z26.s
	mla	z31.s, p7/m, z13.s, z0.s
	mla	z31.s, p7/m, z14.s, z30.s
	mla	z31.s, p7/m, z15.s, z29.s
	mla	z31.s, p7/m, z16.s, z25.s
	mov	z25.s, #-82
	mov	z29.s, #-78
	addvl	x0, sp, #13
	mov	z8.s, #-4
	mla	z31.s, p7/m, z17.s, z8.s
	mla	z31.s, p7/m, z18.s, z4.s
	mov	z4.s, #90
	mla	z31.s, p7/m, z19.s, z29.s
	mla	z31.s, p7/m, z20.s, z4.s
	mla	z31.s, p7/m, z21.s, z25.s
	mov	z25.s, #-31
	mla	z31.s, p7/m, z22.s, z3.s
	mla	z31.s, p7/m, z23.s, z7.s
	mla	z31.s, p7/m, z24.s, z25.s
	add	x0, x0, 64
	movprfx	z8, z31
	mla	z8.s, p7/m, z28.s, z9.s
	mov	z31.s, #-88
	mla	z8.s, p7/m, z10.s, z31.s
	movprfx	z31, z11
	mul	z31.s, z31.s, #13
	mla	z31.s, p7/m, z12.s, z6.s
	mov	z6.s, #88
	str	z8, [x0]
	addvl	x0, sp, #28
	add	x0, x0, 64
	mov	z8.s, #61
	mla	z31.s, p7/m, z13.s, z8.s
	mla	z31.s, p7/m, z14.s, z29.s
	mla	z31.s, p7/m, z15.s, z6.s
	mov	z6.s, #4
	mla	z31.s, p7/m, z16.s, z30.s
	mov	z29.s, #-73
	mla	z31.s, p7/m, z17.s, z0.s
	mov	z8.s, #-82
	mla	z31.s, p7/m, z18.s, z29.s
	mla	z31.s, p7/m, z19.s, z3.s
	mla	z31.s, p7/m, z20.s, z25.s
	mla	z31.s, p7/m, z21.s, z6.s
	mov	z6.s, #-46
	mla	z31.s, p7/m, z22.s, z27.s
	mla	z31.s, p7/m, z23.s, z6.s
	mla	z31.s, p7/m, z24.s, z9.s
	mla	z31.s, p7/m, z28.s, z8.s
	mla	z31.s, p7/m, z10.s, z4.s
	str	z31, [x0]
	addvl	x0, sp, #16
	lsl	z11.s, z11.s, #2
	mad	z12.s, p7/m, z7.s, z11.s
	add	x0, x0, 64
	ldr	z11, [x0]
	mad	z13.s, p7/m, z27.s, z12.s
	addvl	x0, sp, #18
	mad	z14.s, p7/m, z25.s, z13.s
	mov	z31.s, #78
	add	x0, x0, 64
	mad	z15.s, p7/m, z2.s, z14.s
	mad	z16.s, p7/m, z6.s, z15.s
	mad	z17.s, p7/m, z3.s, z16.s
	mad	z18.s, p7/m, z26.s, z17.s
	mad	z19.s, p7/m, z9.s, z18.s
	mad	z20.s, p7/m, z29.s, z19.s
	mad	z21.s, p7/m, z31.s, z20.s
	mad	z22.s, p7/m, z8.s, z21.s
	ldr	z8, [x0]
	addvl	x0, sp, #21
	mad	z23.s, p7/m, z0.s, z22.s
	add	x0, x0, 64
	ldr	z6, [x0]
	mov	z22.s, #-88
	addvl	x0, sp, #23
	mad	z24.s, p7/m, z22.s, z23.s
	mov	z21.s, #25
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z28.s, p7/m, z4.s, z24.s
	addvl	x0, sp, #25
	mov	z24.s, #80
	mad	z10.s, p7/m, z30.s, z28.s
	add	x0, x0, 64
	ldr	z12, [x0]
	mov	z17.s, #70
	addvl	x0, sp, #27
	mov	z16.s, #57
	mov	z13.s, #87
	add	x0, x0, 64
	ldr	z29, [x0]
	mov	z23.d, z4.d
	movprfx	z28, z1
	mul	z28.s, p7/m, z28.s, z4.s
	mov	z19.s, #43
	mla	z28.s, p7/m, z11.s, z13.s
	mov	z14.d, z21.d
	mla	z28.s, p7/m, z8.s, z24.s
	mov	z31.s, #-43
	mla	z28.s, p7/m, z5.s, z17.s
	mov	z24.s, #-80
	mla	z28.s, p7/m, z6.s, z16.s
	addvl	x0, sp, #15
	mla	z28.s, p7/m, z7.s, z19.s
	mla	z28.s, p7/m, z12.s, z21.s
	mov	z21.s, #-70
	mov	z20.s, #9
	mov	z15.s, #-25
	mov	z18.s, #-87
	movprfx	z27, z1
	mul	z27.s, p7/m, z27.s, z13.s
	movprfx	z25, z1
	mul	z25.s, p7/m, z25.s, z17.s
	mla	z27.s, p7/m, z11.s, z16.s
	mla	z25.s, p7/m, z11.s, z31.s
	mla	z27.s, p7/m, z8.s, z20.s
	mla	z25.s, p7/m, z8.s, z18.s
	mla	z27.s, p7/m, z5.s, z31.s
	mla	z25.s, p7/m, z5.s, z20.s
	mla	z27.s, p7/m, z6.s, z24.s
	mov	z4.d, z21.d
	mla	z27.s, p7/m, z7.s, z30.s
	mov	z22.d, z14.d
	mla	z27.s, p7/m, z12.s, z21.s
	add	x0, x0, 64
	movprfx	z26, z1
	mul	z26.s, z26.s, #80
	mla	z26.s, p7/m, z11.s, z20.s
	mla	z26.s, p7/m, z8.s, z21.s
	mov	z21.d, z23.d
	mla	z26.s, p7/m, z5.s, z18.s
	mla	z25.s, p7/m, z6.s, z21.s
	mla	z26.s, p7/m, z6.s, z15.s
	mla	z25.s, p7/m, z7.s, z14.s
	mla	z26.s, p7/m, z7.s, z16.s
	mla	z25.s, p7/m, z12.s, z24.s
	mla	z26.s, p7/m, z12.s, z23.s
	mov	z14.s, #-9
	mla	z26.s, p7/m, z29.s, z19.s
	mov	z23.d, z19.d
	mov	z19.d, z24.d
	mov	z24.s, #-57
	mov	z31.d, z24.d
	mla	z25.s, p7/m, z29.s, z24.s
	movprfx	z24, z1
	mul	z24.s, p7/m, z24.s, z16.s
	mla	z24.s, p7/m, z11.s, z19.s
	mla	z24.s, p7/m, z8.s, z15.s
	mla	z24.s, p7/m, z5.s, z21.s
	mla	z24.s, p7/m, z6.s, z14.s
	mov	z14.d, z18.d
	mla	z24.s, p7/m, z7.s, z18.s
	mov	z18.d, z23.d
	mla	z24.s, p7/m, z12.s, z23.s
	movprfx	z23, z1
	mul	z23.s, p7/m, z23.s, z18.s
	mla	z23.s, p7/m, z11.s, z30.s
	mla	z23.s, p7/m, z8.s, z16.s
	mla	z23.s, p7/m, z5.s, z22.s
	movprfx	z22, z1
	mul	z22.s, z22.s, #25
	mla	z23.s, p7/m, z6.s, z14.s
	mla	z22.s, p7/m, z11.s, z4.s
	mla	z23.s, p7/m, z7.s, z17.s
	mla	z22.s, p7/m, z8.s, z21.s
	mul	z1.s, z1.s, #9
	mla	z22.s, p7/m, z5.s, z19.s
	mov	z21.d, z31.d
	mla	z22.s, p7/m, z6.s, z18.s
	mla	z22.s, p7/m, z7.s, z20.s
	mla	z22.s, p7/m, z12.s, z31.s
	movprfx	z31, z1
	mla	z31.s, p7/m, z11.s, z15.s
	mla	z22.s, p7/m, z29.s, z13.s
	mla	z31.s, p7/m, z8.s, z18.s
	mad	z5.s, p7/m, z21.s, z31.s
	mad	z6.s, p7/m, z17.s, z5.s
	mad	z7.s, p7/m, z19.s, z6.s
	movprfx	z8, z7
	mla	z8.s, p7/m, z12.s, z13.s
	ldr	z13, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z18, [x0]
	ldr	z7, [x3]
	addvl	x0, sp, #22
	mov	z2.s, #50
	mla	z28.s, p7/m, z29.s, z20.s
	add	x0, x0, 64
	ldr	z31, [x0]
	mov	z1.s, #75
	addvl	x0, sp, #17
	mla	z23.s, p7/m, z12.s, z20.s
	mov	z20.s, #18
	add	x0, x0, 64
	ldr	z11, [x0]
	mla	z23.s, p7/m, z29.s, z19.s
	addvl	x0, sp, #24
	movprfx	z19, z13
	mul	z19.s, z19.s, #89
	mla	z19.s, p7/m, z18.s, z1.s
	add	x0, x0, 64
	mla	z19.s, p7/m, z31.s, z2.s
	mov	z2.d, z13.d
	movprfx	z12, z2
	mul	z12.s, z12.s, #50
	mul	z2.s, p7/m, z2.s, z20.s
	mla	z27.s, p7/m, z29.s, z15.s
	mla	z19.s, p7/m, z7.s, z20.s
	mov	z15.s, #-89
	mov	z14.s, #-50
	mla	z12.s, p7/m, z18.s, z15.s
	mla	z12.s, p7/m, z31.s, z20.s
	movprfx	z20, z2
	mla	z20.s, p7/m, z18.s, z14.s
	ldr	z2, [x0]
	addvl	x0, sp, #14
	mla	z24.s, p7/m, z29.s, z17.s
	add	x0, x0, 64
	mla	z12.s, p7/m, z7.s, z1.s
	mla	z20.s, p7/m, z31.s, z1.s
	mul	z13.s, p7/m, z13.s, z1.s
	mov	z5.s, #-18
	mov	z1.s, #36
	mla	z13.s, p7/m, z18.s, z5.s
	movprfx	z17, z11
	mul	z17.s, p7/m, z17.s, z1.s
	movprfx	z18, z11
	mul	z18.s, z18.s, #83
	mov	z4.s, #-83
	mla	z18.s, p7/m, z2.s, z1.s
	mla	z17.s, p7/m, z2.s, z4.s
	ldr	z2, [x0]
	addvl	x0, sp, #20
	mla	z20.s, p7/m, z7.s, z15.s
	add	x0, x0, 64
	ldr	z11, [x0]
	mla	z8.s, p7/m, z29.s, z30.s
	add	x0, sp, 64
	mla	z13.s, p7/m, z31.s, z15.s
	lsl	z31.s, z2.s, #6
	mov	z15.s, #-64
	mov	z2.s, #64
	movprfx	z29, z31
	mla	z29.s, p7/m, z2.s, z11.s
	mla	z31.s, p7/m, z11.s, z15.s
	add	z21.s, z29.s, z18.s
	sub	z29.s, z29.s, z18.s
	add	z18.s, z31.s, z17.s
	sub	z31.s, z31.s, z17.s
	add	z17.s, z29.s, z20.s
	sub	z29.s, z29.s, z20.s
	add	z4.s, z29.s, z24.s
	sub	z29.s, z29.s, z24.s
	ldr	z24, [x0]
	addvl	x0, sp, #14
	mla	z13.s, p7/m, z7.s, z14.s
	add	x0, x0, 64
	add	z14.s, z21.s, z19.s
	sub	z21.s, z21.s, z19.s
	add	z19.s, z14.s, z28.s
	str	z19, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z16.s, z31.s, z12.s
	sub	z31.s, z31.s, z12.s
	add	z20.s, z31.s, z23.s
	sub	z31.s, z31.s, z23.s
	ldr	z23, [x0]
	addvl	x0, sp, #17
	add	z15.s, z18.s, z13.s
	add	z19.s, z19.s, z24.s
	add	x0, x0, 64
	add	z12.s, z15.s, z27.s
	add	z24.s, z12.s, z23.s
	str	z24, [x0]
	addvl	x0, sp, #2
	sub	z14.s, z14.s, z28.s
	add	x0, x0, 64
	ldr	z28, [x0]
	add	z11.s, z16.s, z26.s
	addvl	x0, sp, #15
	sub	z18.s, z18.s, z13.s
	add	z13.s, z17.s, z25.s
	add	x0, x0, 64
	str	z11, [x0]
	sub	z15.s, z15.s, z27.s
	addvl	x0, sp, #16
	add	z1.s, z21.s, z8.s
	sub	z8.s, z21.s, z8.s
	add	x0, x0, 64
	str	z13, [x0]
	add	z21.s, z11.s, z28.s
	addvl	x0, sp, #3
	add	z2.s, z18.s, z22.s
	sub	z18.s, z18.s, z22.s
	add	x0, x0, 64
	ldr	z24, [x0]
	add	z22.s, z13.s, z24.s
	addvl	x0, sp, #4
	sub	z16.s, z16.s, z26.s
	sub	z17.s, z17.s, z25.s
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z23.s, z4.s, z23.s
	addvl	x0, sp, #5
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	add	x0, x0, 64
	ldr	z27, [x0]
	add	z24.s, z20.s, z27.s
	addvl	x0, sp, #6
	sunpklo	z19.s, z19.h
	sqrshrnb	z21.h, z21.s, #12
	add	x0, x0, 64
	ldr	z28, [x0]
	add	z25.s, z2.s, z28.s
	addvl	x0, sp, #7
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x0, x0, 64
	ldr	z7, [x0]
	add	z26.s, z1.s, z7.s
	addvl	x0, sp, #8
	sqrshrnb	z22.h, z22.s, #12
	uzp1	z22.h, z22.h, z22.h
	add	x0, x0, 64
	ldr	z27, [x0]
	add	z27.s, z8.s, z27.s
	addvl	x0, sp, #9
	sunpklo	z22.s, z22.h
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z28.s, z18.s, z5.s
	addvl	x0, sp, #10
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	add	x0, x0, 64
	ldr	z7, [x0]
	add	z7.s, z31.s, z7.s
	addvl	x0, sp, #11
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	add	x0, x0, 64
	ldr	z6, [x0]
	sunpklo	z24.s, z24.h
	addvl	x0, sp, #12
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x0, x0, 64
	ldr	z5, [x0]
	add	z5.s, z17.s, z5.s
	addvl	x0, sp, #13
	sunpklo	z25.s, z25.h
	sqrshrnb	z26.h, z26.s, #12
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z13.s, z16.s, z13.s
	addvl	x0, sp, #18
	uzp1	z26.h, z26.h, z26.h
	sunpklo	z26.s, z26.h
	add	x0, x0, 64
	str	z13, [x0]
	sqrshrnb	z27.h, z27.s, #12
	addvl	x0, sp, #28
	uzp1	z27.h, z27.h, z27.h
	sunpklo	z27.s, z27.h
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z11.s, z15.s, z13.s
	addvl	x0, sp, #19
	sub	z15.s, z15.s, z13.s
	sqrshrnb	z28.h, z28.s, #12
	add	x0, x0, 64
	str	z11, [x0]
	add	z11.s, z14.s, z10.s
	addvl	x0, sp, #20
	sub	z14.s, z14.s, z10.s
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	str	z11, [x0]
	sunpklo	z28.s, z28.h
	addvl	x0, sp, #13
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	add	x0, x0, 64
	ldr	z13, [x0]
	sub	z16.s, z16.s, z13.s
	addvl	x0, sp, #12
	sunpklo	z7.s, z7.h
	add	z6.s, z29.s, z6.s
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z17.s, z17.s, z10.s
	addvl	x0, sp, #11
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z13.s, z29.s, z10.s
	str	z13, [x0]
	addvl	x0, sp, #10
	sunpklo	z6.s, z6.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z11.s, z31.s, z10.s
	str	z11, [x0]
	addvl	x0, sp, #9
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z18.s, z18.s, z10.s
	addvl	x0, sp, #8
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z8.s, z8.s, z31.s
	addvl	x0, sp, #7
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z1.s, z1.s, z10.s
	addvl	x0, sp, #6
	sunpklo	z14.s, z14.h
	sqrshrnb	z15.h, z15.s, #12
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z2.s, z2.s, z31.s
	addvl	x0, sp, #5
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z10.s, z20.s, z10.s
	str	z10, [x0]
	addvl	x0, sp, #4
	sqrshrnb	z16.h, z16.s, #12
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z4.s, z4.s, z10.s
	addvl	x0, sp, #16
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x0, x0, 64
	ldr	z13, [x0]
	sqrshrnb	z17.h, z17.s, #12
	addvl	x0, sp, #3
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z10.s, z13.s, z10.s
	addvl	x0, sp, #2
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 64
	ldr	z20, [x0]
	sunpklo	z18.s, z18.h
	addvl	x0, sp, #15
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	add	x0, x0, 64
	ldr	z11, [x0]
	sub	z11.s, z11.s, z20.s
	addvl	x0, sp, #1
	sunpklo	z8.s, z8.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z12.s, z12.s, z31.s
	add	x0, sp, 64
	ldr	z20, [x0]
	uzp1	z1.h, z1.h, z1.h
	addvl	x0, sp, #14
	sunpklo	z1.s, z1.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z13.s, z31.s, z20.s
	addvl	x0, sp, #17
	index	z31.s, #0, w2
	st1h	z19.s, p6, [x1, z31.s, sxtw 1]
	add	x0, x0, 64
	ldr	z20, [x0]
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x1, 2
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 4
	uzp1	z2.h, z2.h, z2.h
	st1h	z21.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 6
	sunpklo	z2.s, z2.h
	st1h	z22.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 8
	st1h	z23.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 10
	st1h	z24.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 12
	st1h	z25.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 14
	st1h	z26.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 16
	st1h	z27.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 18
	st1h	z28.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 20
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 22
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 24
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #18
	mov	z5.s, #88
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 26
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 28
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 30
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 32
	st1h	z14.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 34
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 36
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 38
	st1h	z17.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 40
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 42
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 44
	st1h	z18.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 46
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 48
	mov	z8.s, #82
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 50
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z24, [x0]
	sqrshrnb	z29.h, z24.s, #12
	add	x0, x1, 52
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 54
	sqrshrnb	z29.h, z4.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 56
	sqrshrnb	z29.h, z10.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 58
	sqrshrnb	z29.h, z11.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 60
	sqrshrnb	z29.h, z12.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 62
	sqrshrnb	z29.h, z13.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 80
	ld1sh	z24.s, p7/z, [x0]
	mov	z12.s, #73
	addvl	x0, sp, #16
	add	x0, x0, 64
	str	z24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 144
	ld1sh	z29.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 208
	ld1sh	z27.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 272
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 336
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 400
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 464
	ld1sh	z2.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 528
	ld1sh	z15.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 592
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 656
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 720
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z24, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 784
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 848
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 912
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 976
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1040
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1104
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1168
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1232
	ld1sh	z28.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z28, [x0]
	mov	z28.s, #90
	addvl	x0, sp, #31
	add	x0, x0, 1296
	ld1sh	z21.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1360
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1424
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1488
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1552
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1616
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z11, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1680
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1744
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1808
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1872
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z11, [x0]
	mov	z11.s, #78
	addvl	x0, sp, #31
	add	x0, x0, 1936
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2000
	ld1sh	z1.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2064
	ld1sh	z10.s, p7/z, [x0]
	add	x0, sp, 64
	str	z29, [x0]
	mul	z29.s, z29.s, #90
	mad	z28.s, p7/m, z13.s, z29.s
	mla	z28.s, p7/m, z14.s, z5.s
	mla	z28.s, p7/m, z15.s, z0.s
	mla	z28.s, p7/m, z16.s, z8.s
	mla	z28.s, p7/m, z17.s, z11.s
	mov	z11.s, #38
	mov	z8.s, #31
	mla	z28.s, p7/m, z18.s, z12.s
	mov	z5.s, #61
	mla	z28.s, p7/m, z19.s, z9.s
	mov	z12.s, #46
	mla	z28.s, p7/m, z20.s, z5.s
	mla	z28.s, p7/m, z21.s, z3.s
	mla	z28.s, p7/m, z22.s, z12.s
	mla	z28.s, p7/m, z23.s, z11.s
	mov	z11.s, #22
	mla	z28.s, p7/m, z24.s, z8.s
	mla	z28.s, p7/m, z25.s, z11.s
	mov	z5.d, z11.d
	addvl	x0, sp, #1
	mov	z11.s, #13
	movprfx	z12, z28
	mla	z12.s, p7/m, z26.s, z11.s
	mov	z28.s, #4
	mla	z12.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #82
	mad	z28.s, p7/m, z13.s, z29.s
	mov	z29.s, #-31
	str	z12, [x0]
	mov	z12.s, #46
	mla	z28.s, p7/m, z14.s, z9.s
	mla	z28.s, p7/m, z15.s, z12.s
	mov	z12.s, #-4
	mla	z28.s, p7/m, z16.s, z5.s
	mla	z28.s, p7/m, z17.s, z12.s
	mla	z28.s, p7/m, z18.s, z29.s
	mov	z29.s, #-73
	mov	z5.s, #-54
	mla	z28.s, p7/m, z19.s, z5.s
	mla	z28.s, p7/m, z20.s, z29.s
	mov	z29.s, #-85
	mla	z28.s, p7/m, z21.s, z29.s
	mov	z29.s, #-88
	mla	z28.s, p7/m, z22.s, z30.s
	mla	z28.s, p7/m, z23.s, z29.s
	mov	z29.s, #-78
	mla	z28.s, p7/m, z24.s, z29.s
	addvl	x0, sp, #2
	mov	z29.s, #-61
	mla	z28.s, p7/m, z25.s, z29.s
	add	x0, x0, 64
	mov	z29.s, #-38
	movprfx	z5, z28
	mla	z5.s, p7/m, z26.s, z29.s
	mov	z28.s, #-13
	mov	z29.d, z28.d
	mla	z5.s, p7/m, z10.s, z28.s
	str	z5, [x0]
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #88
	mla	z28.s, p7/m, z13.s, z9.s
	mla	z28.s, p7/m, z14.s, z8.s
	mla	z28.s, p7/m, z15.s, z29.s
	mov	z29.s, #-82
	mov	z5.s, #-54
	mla	z28.s, p7/m, z16.s, z5.s
	mla	z28.s, p7/m, z17.s, z29.s
	mov	z29.s, #-78
	mla	z28.s, p7/m, z18.s, z30.s
	mla	z28.s, p7/m, z19.s, z29.s
	mov	z29.s, #-46
	mla	z28.s, p7/m, z20.s, z29.s
	mov	z29.s, #38
	mla	z28.s, p7/m, z21.s, z12.s
	mla	z28.s, p7/m, z22.s, z29.s
	mov	z29.s, #73
	mla	z28.s, p7/m, z23.s, z29.s
	mov	z5.s, #61
	mov	z29.s, #90
	mla	z28.s, p7/m, z24.s, z29.s
	mla	z28.s, p7/m, z25.s, z0.s
	addvl	x0, sp, #3
	movprfx	z29, z28
	mla	z29.s, p7/m, z26.s, z5.s
	mov	z28.s, #22
	mla	z29.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #46
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, p7/m, z28.s, z0.s
	mla	z28.s, p7/m, z13.s, z29.s
	mov	z29.s, #-13
	mla	z28.s, p7/m, z14.s, z29.s
	mov	z29.s, #-67
	mla	z28.s, p7/m, z15.s, z29.s
	mov	z29.s, #-73
	mla	z28.s, p7/m, z16.s, z30.s
	mla	z28.s, p7/m, z17.s, z29.s
	mov	z29.s, #-22
	mla	z28.s, p7/m, z18.s, z29.s
	addvl	x0, sp, #4
	mov	z29.s, #38
	mla	z28.s, p7/m, z19.s, z29.s
	add	x0, x0, 64
	mov	z29.s, #82
	mla	z28.s, p7/m, z20.s, z29.s
	mov	z29.s, #88
	mla	z28.s, p7/m, z21.s, z29.s
	mla	z28.s, p7/m, z22.s, z3.s
	mov	z29.s, #-61
	mla	z28.s, p7/m, z23.s, z12.s
	mla	z28.s, p7/m, z24.s, z29.s
	mov	z29.s, #-78
	mla	z28.s, p7/m, z25.s, z30.s
	mla	z28.s, p7/m, z26.s, z29.s
	mov	z29.d, z28.d
	mov	z28.s, #-31
	mla	z29.s, p7/m, z10.s, z28.s
	str	z29, [x0]
	mov	z29.s, #22
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #82
	mla	z28.s, p7/m, z13.s, z29.s
	mov	z29.s, #-54
	mla	z28.s, p7/m, z14.s, z29.s
	mla	z28.s, p7/m, z15.s, z30.s
	mov	z29.s, #-61
	mla	z28.s, p7/m, z16.s, z29.s
	mla	z28.s, p7/m, z17.s, z11.s
	mov	z29.s, #78
	mla	z28.s, p7/m, z18.s, z29.s
	mla	z28.s, p7/m, z19.s, z0.s
	mov	z29.s, #-46
	mla	z28.s, p7/m, z20.s, z8.s
	mla	z28.s, p7/m, z21.s, z29.s
	mov	z29.s, #-67
	mla	z28.s, p7/m, z22.s, z30.s
	mla	z28.s, p7/m, z23.s, z29.s
	mov	z29.s, #4
	mla	z28.s, p7/m, z24.s, z29.s
	addvl	x0, sp, #5
	mov	z29.s, #73
	mla	z28.s, p7/m, z25.s, z29.s
	add	x0, x0, 64
	mov	z29.s, #88
	mla	z28.s, p7/m, z26.s, z29.s
	mov	z29.s, #38
	mla	z28.s, p7/m, z10.s, z29.s
	str	z28, [x0]
	mov	z29.s, #-82
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #78
	mla	z28.s, p7/m, z13.s, z12.s
	mla	z28.s, p7/m, z14.s, z29.s
	mov	z29.s, #-73
	mla	z28.s, p7/m, z15.s, z29.s
	mla	z28.s, p7/m, z16.s, z11.s
	mov	z29.s, #-22
	mla	z28.s, p7/m, z17.s, z0.s
	mla	z28.s, p7/m, z18.s, z9.s
	mla	z28.s, p7/m, z19.s, z29.s
	mov	z29.s, #-88
	mla	z28.s, p7/m, z20.s, z29.s
	mov	z29.s, #-61
	mla	z28.s, p7/m, z21.s, z29.s
	mla	z28.s, p7/m, z22.s, z8.s
	mov	z29.s, #90
	mla	z28.s, p7/m, z23.s, z29.s
	mla	z28.s, p7/m, z24.s, z3.s
	mov	z29.s, #-38
	mla	z28.s, p7/m, z25.s, z29.s
	addvl	x0, sp, #6
	movprfx	z29, z28
	mla	z29.s, p7/m, z26.s, z30.s
	mov	z28.s, #-46
	mla	z29.s, p7/m, z10.s, z28.s
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #-31
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, z28.s, #73
	mla	z28.s, p7/m, z13.s, z29.s
	mov	z29.s, #-22
	mla	z28.s, p7/m, z14.s, z30.s
	mla	z28.s, p7/m, z15.s, z29.s
	mov	z29.s, #78
	mla	z28.s, p7/m, z16.s, z29.s
	mov	z29.s, #-38
	mla	z28.s, p7/m, z17.s, z9.s
	mla	z28.s, p7/m, z18.s, z29.s
	mov	z29.s, #-13
	mla	z28.s, p7/m, z19.s, z30.s
	mla	z28.s, p7/m, z20.s, z29.s
	mov	z29.s, #82
	addvl	x0, sp, #7
	mla	z28.s, p7/m, z21.s, z29.s
	mov	z29.s, #-46
	mla	z28.s, p7/m, z22.s, z5.s
	add	x0, x0, 64
	mla	z28.s, p7/m, z23.s, z29.s
	mov	z29.s, #-88
	mla	z28.s, p7/m, z24.s, z29.s
	mla	z28.s, p7/m, z25.s, z12.s
	mla	z28.s, p7/m, z26.s, z0.s
	mla	z28.s, p7/m, z10.s, z3.s
	str	z28, [x0]
	add	x0, sp, 64
	ldr	z28, [x0]
	mul	z28.s, p7/m, z28.s, z9.s
	mov	z29.s, #-54
	mad	z29.s, p7/m, z13.s, z28.s
	mov	z28.s, #-78
	mla	z29.s, p7/m, z14.s, z28.s
	addvl	x0, sp, #8
	mov	z28.s, #38
	mla	z29.s, p7/m, z15.s, z28.s
	mla	z29.s, p7/m, z16.s, z0.s
	mov	z28.s, #-22
	mla	z29.s, p7/m, z17.s, z28.s
	mla	z29.s, p7/m, z18.s, z30.s
	mov	z28.s, #4
	mla	z29.s, p7/m, z19.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #90
	mla	z29.s, p7/m, z20.s, z28.s
	mla	z29.s, p7/m, z21.s, z11.s
	mov	z28.s, #-88
	mla	z29.s, p7/m, z22.s, z28.s
	mov	z28.s, #-31
	mla	z29.s, p7/m, z23.s, z28.s
	mov	z28.s, #82
	mla	z29.s, p7/m, z24.s, z28.s
	mov	z28.s, #46
	mla	z29.s, p7/m, z25.s, z28.s
	mov	z28.s, #-73
	mla	z29.s, p7/m, z26.s, z28.s
	mov	z28.d, z29.d
	mov	z29.s, #-61
	mla	z28.s, p7/m, z10.s, z29.s
	str	z28, [x0]
	mov	z28.s, #-73
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, p7/m, z29.s, z5.s
	mla	z29.s, p7/m, z13.s, z28.s
	mov	z28.s, #-46
	mla	z29.s, p7/m, z14.s, z28.s
	addvl	x0, sp, #9
	mov	z28.s, #82
	mla	z29.s, p7/m, z15.s, z28.s
	mla	z29.s, p7/m, z16.s, z8.s
	mov	z28.s, #-88
	mla	z29.s, p7/m, z17.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-13
	mla	z29.s, p7/m, z18.s, z28.s
	mov	z28.s, #90
	mla	z29.s, p7/m, z19.s, z28.s
	mla	z29.s, p7/m, z20.s, z12.s
	mov	z28.s, #22
	mla	z29.s, p7/m, z21.s, z30.s
	mla	z29.s, p7/m, z22.s, z28.s
	mov	z28.s, #-38
	mla	z29.s, p7/m, z23.s, z0.s
	mla	z29.s, p7/m, z24.s, z28.s
	mov	z28.s, #-78
	mla	z29.s, p7/m, z25.s, z28.s
	mla	z29.s, p7/m, z26.s, z3.s
	mla	z29.s, p7/m, z10.s, z9.s
	mov	z28.s, #-85
	str	z29, [x0]
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, p7/m, z29.s, z3.s
	mla	z29.s, p7/m, z13.s, z28.s
	mla	z29.s, p7/m, z14.s, z12.s
	mov	z12.s, #88
	mla	z29.s, p7/m, z15.s, z12.s
	mov	z12.s, #-46
	mla	z29.s, p7/m, z16.s, z12.s
	mov	z12.s, #82
	mov	z28.s, #-61
	mla	z29.s, p7/m, z17.s, z28.s
	mla	z29.s, p7/m, z18.s, z12.s
	mov	z12.s, #-78
	mov	z28.s, #38
	mla	z29.s, p7/m, z19.s, z11.s
	mla	z29.s, p7/m, z20.s, z30.s
	mla	z29.s, p7/m, z21.s, z28.s
	mla	z29.s, p7/m, z22.s, z9.s
	mla	z29.s, p7/m, z23.s, z12.s
	mov	z12.s, #-22
	mla	z29.s, p7/m, z24.s, z12.s
	mov	z12.s, #90
	addvl	x0, sp, #10
	mla	z29.s, p7/m, z25.s, z12.s
	mov	z12.s, #-31
	mla	z29.s, p7/m, z26.s, z12.s
	add	x0, x0, 64
	mov	z12.d, z29.d
	mov	z29.s, #-73
	mla	z12.s, p7/m, z10.s, z29.s
	str	z12, [x0]
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, z29.s, #46
	mla	z29.s, p7/m, z13.s, z30.s
	mla	z29.s, p7/m, z14.s, z28.s
	mla	z29.s, p7/m, z15.s, z3.s
	mla	z29.s, p7/m, z16.s, z30.s
	mla	z29.s, p7/m, z17.s, z8.s
	mov	z8.s, #-88
	mla	z29.s, p7/m, z18.s, z5.s
	mla	z29.s, p7/m, z19.s, z8.s
	mov	z8.s, #22
	mov	z12.s, #-82
	mla	z29.s, p7/m, z20.s, z8.s
	mov	z8.s, #-85
	mla	z29.s, p7/m, z21.s, z9.s
	mla	z29.s, p7/m, z22.s, z8.s
	mov	z8.s, #73
	mla	z29.s, p7/m, z23.s, z11.s
	mla	z29.s, p7/m, z24.s, z8.s
	mla	z29.s, p7/m, z25.s, z12.s
	mov	z12.s, #4
	mla	z29.s, p7/m, z26.s, z12.s
	addvl	x0, sp, #11
	mov	z12.d, z29.d
	mov	z29.s, #78
	mla	z12.s, p7/m, z10.s, z29.s
	add	x0, x0, 64
	str	z12, [x0]
	mov	z12.s, #-88
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, p7/m, z29.s, z28.s
	mla	z29.s, p7/m, z13.s, z12.s
	mov	z12.s, #-4
	mla	z29.s, p7/m, z14.s, z8.s
	mla	z29.s, p7/m, z15.s, z12.s
	mov	z8.s, #-67
	mad	z8.s, p7/m, z16.s, z29.s
	mov	z29.s, #90
	mla	z8.s, p7/m, z17.s, z29.s
	mov	z29.s, #-46
	mov	z12.s, #-31
	mla	z8.s, p7/m, z18.s, z29.s
	mov	z29.s, #-78
	mla	z8.s, p7/m, z19.s, z12.s
	mla	z8.s, p7/m, z20.s, z0.s
	mla	z8.s, p7/m, z21.s, z29.s
	mov	z12.d, z29.d
	mad	z11.s, p7/m, z22.s, z8.s
	addvl	x0, sp, #12
	mov	z8.s, #22
	mla	z11.s, p7/m, z23.s, z5.s
	mov	z29.s, #-82
	mla	z11.s, p7/m, z24.s, z30.s
	mla	z11.s, p7/m, z25.s, z3.s
	mla	z11.s, p7/m, z26.s, z8.s
	mla	z11.s, p7/m, z10.s, z29.s
	add	x0, x0, 64
	mov	z5.s, #4
	str	z11, [x0]
	mov	z11.s, #90
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, z29.s, #31
	mla	z29.s, p7/m, z13.s, z12.s
	mla	z29.s, p7/m, z14.s, z11.s
	mov	z11.s, #-61
	mla	z29.s, p7/m, z15.s, z11.s
	mla	z29.s, p7/m, z16.s, z5.s
	mov	z5.s, #-88
	mla	z29.s, p7/m, z17.s, z3.s
	mov	z12.s, #82
	mla	z29.s, p7/m, z18.s, z5.s
	mov	z5.s, #-22
	mla	z29.s, p7/m, z19.s, z12.s
	addvl	x0, sp, #13
	mov	z12.s, #-38
	mla	z29.s, p7/m, z20.s, z12.s
	mla	z29.s, p7/m, z21.s, z5.s
	mov	z5.s, #-13
	mov	z12.s, #73
	add	x0, x0, 64
	mla	z29.s, p7/m, z22.s, z12.s
	mla	z29.s, p7/m, z23.s, z30.s
	mla	z29.s, p7/m, z24.s, z9.s
	mla	z29.s, p7/m, z25.s, z5.s
	mov	z5.s, #-46
	mla	z29.s, p7/m, z26.s, z5.s
	mla	z29.s, p7/m, z10.s, z0.s
	str	z29, [x0]
	add	x0, sp, 64
	ldr	z29, [x0]
	mul	z29.s, p7/m, z29.s, z8.s
	mla	z29.s, p7/m, z13.s, z11.s
	mla	z29.s, p7/m, z14.s, z0.s
	mla	z29.s, p7/m, z15.s, z30.s
	mla	z29.s, p7/m, z16.s, z12.s
	mov	z12.s, #-4
	mov	z11.s, #-38
	mov	z5.s, #90
	mla	z29.s, p7/m, z17.s, z11.s
	mla	z29.s, p7/m, z18.s, z12.s
	mov	z12.s, #46
	mla	z29.s, p7/m, z19.s, z12.s
	addvl	x0, sp, #14
	mov	z12.s, #-78
	mla	z29.s, p7/m, z20.s, z12.s
	mla	z29.s, p7/m, z21.s, z5.s
	mov	z5.s, #-82
	mov	z12.s, #-31
	mla	z29.s, p7/m, z22.s, z5.s
	mov	z5.s, #-13
	mla	z29.s, p7/m, z23.s, z3.s
	mla	z29.s, p7/m, z24.s, z5.s
	mla	z29.s, p7/m, z25.s, z12.s
	add	x0, x0, 64
	movprfx	z12, z29
	mla	z12.s, p7/m, z26.s, z9.s
	mov	z29.s, #-88
	mla	z12.s, p7/m, z10.s, z29.s
	mov	z5.s, #61
	str	z12, [x0]
	add	x0, sp, 64
	mov	z12.s, #-78
	ldr	z29, [x0]
	addvl	x0, sp, #15
	mul	z29.s, z29.s, #13
	mla	z29.s, p7/m, z13.s, z11.s
	mov	z11.s, #88
	mla	z29.s, p7/m, z14.s, z5.s
	mov	z5.s, #4
	mla	z29.s, p7/m, z15.s, z12.s
	mov	z12.s, #-31
	mla	z29.s, p7/m, z16.s, z11.s
	add	x0, x0, 64
	mla	z29.s, p7/m, z17.s, z30.s
	mov	z11.s, #-73
	mla	z29.s, p7/m, z18.s, z0.s
	mla	z29.s, p7/m, z19.s, z11.s
	mla	z29.s, p7/m, z20.s, z3.s
	mla	z29.s, p7/m, z21.s, z12.s
	mov	z12.s, #-46
	mla	z29.s, p7/m, z22.s, z5.s
	mov	z5.s, #-82
	mla	z29.s, p7/m, z23.s, z8.s
	mla	z29.s, p7/m, z24.s, z12.s
	mla	z29.s, p7/m, z25.s, z9.s
	mla	z29.s, p7/m, z26.s, z5.s
	mov	z5.d, z29.d
	mov	z29.s, #90
	mla	z5.s, p7/m, z10.s, z29.s
	str	z5, [x0]
	add	x0, sp, 64
	ldr	z29, [x0]
	mov	z5.s, #-13
	lsl	z12.s, z29.s, #2
	addvl	x0, sp, #19
	mad	z13.s, p7/m, z5.s, z12.s
	add	x0, x0, 64
	mad	z14.s, p7/m, z8.s, z13.s
	mov	z12.s, #-31
	mov	z13.s, #-46
	mad	z15.s, p7/m, z12.s, z14.s
	mov	z29.s, #-61
	mad	z16.s, p7/m, z28.s, z15.s
	mad	z17.s, p7/m, z13.s, z16.s
	mad	z18.s, p7/m, z3.s, z17.s
	mad	z19.s, p7/m, z29.s, z18.s
	mad	z20.s, p7/m, z9.s, z19.s
	mad	z21.s, p7/m, z11.s, z20.s
	ldr	z28, [x0]
	mov	z20.s, #78
	addvl	x0, sp, #22
	mad	z22.s, p7/m, z20.s, z21.s
	mov	z21.s, #-82
	mad	z23.s, p7/m, z21.s, z22.s
	mad	z24.s, p7/m, z0.s, z23.s
	add	x0, x0, 64
	mov	z23.s, #-88
	mad	z25.s, p7/m, z23.s, z24.s
	mov	z24.s, #90
	mad	z26.s, p7/m, z24.s, z25.s
	movprfx	z21, z26
	mla	z21.s, p7/m, z10.s, z30.s
	ldr	z29, [x0]
	mov	z10.s, #25
	addvl	x0, sp, #17
	str	z21, [x3]
	mov	z21.s, #80
	mov	z22.s, #43
	mov	z23.s, #87
	mov	z16.s, #57
	mov	z14.d, z10.d
	mov	z18.s, #-25
	movprfx	z13, z27
	mul	z13.s, p7/m, z13.s, z24.s
	mov	z19.s, #-70
	mla	z13.s, p7/m, z2.s, z23.s
	add	x0, x0, 64
	mla	z13.s, p7/m, z28.s, z21.s
	mov	z8.s, #-9
	mov	z21.s, #70
	mla	z13.s, p7/m, z4.s, z21.s
	mla	z13.s, p7/m, z29.s, z16.s
	mla	z13.s, p7/m, z6.s, z22.s
	mla	z13.s, p7/m, z7.s, z10.s
	mov	z10.s, #-43
	mov	z9.d, z10.d
	mov	z26.s, #9
	mov	z25.s, #-80
	mov	z17.s, #-87
	movprfx	z12, z27
	mul	z12.s, p7/m, z12.s, z23.s
	movprfx	z0, z27
	mul	z0.s, p7/m, z0.s, z14.s
	mla	z12.s, p7/m, z2.s, z16.s
	mov	z20.d, z19.d
	mla	z12.s, p7/m, z28.s, z26.s
	mla	z0.s, p7/m, z2.s, z20.s
	mla	z12.s, p7/m, z4.s, z10.s
	mla	z0.s, p7/m, z28.s, z24.s
	mla	z12.s, p7/m, z29.s, z25.s
	movprfx	z10, z27
	mul	z10.s, p7/m, z10.s, z21.s
	mla	z12.s, p7/m, z6.s, z30.s
	mla	z10.s, p7/m, z2.s, z9.s
	mla	z12.s, p7/m, z7.s, z19.s
	mla	z10.s, p7/m, z28.s, z17.s
	mla	z12.s, p7/m, z1.s, z18.s
	mla	z10.s, p7/m, z4.s, z26.s
	mla	z0.s, p7/m, z4.s, z25.s
	mla	z10.s, p7/m, z29.s, z24.s
	mla	z0.s, p7/m, z29.s, z22.s
	movprfx	z11, z27
	mul	z11.s, z11.s, #80
	mla	z11.s, p7/m, z2.s, z26.s
	mla	z11.s, p7/m, z28.s, z19.s
	mov	z19.d, z16.d
	mla	z11.s, p7/m, z4.s, z17.s
	movprfx	z9, z27
	mul	z9.s, p7/m, z9.s, z19.s
	mla	z11.s, p7/m, z29.s, z18.s
	mla	z9.s, p7/m, z2.s, z25.s
	mla	z11.s, p7/m, z6.s, z16.s
	mla	z9.s, p7/m, z28.s, z18.s
	mla	z11.s, p7/m, z7.s, z24.s
	mla	z9.s, p7/m, z4.s, z24.s
	mov	z24.d, z29.d
	mla	z9.s, p7/m, z29.s, z8.s
	movprfx	z8, z27
	mul	z8.s, p7/m, z8.s, z22.s
	mla	z8.s, p7/m, z2.s, z30.s
	mla	z8.s, p7/m, z28.s, z19.s
	mla	z8.s, p7/m, z4.s, z14.s
	mla	z8.s, p7/m, z29.s, z17.s
	movprfx	z29, z27
	mul	z29.s, z29.s, #9
	mad	z2.s, p7/m, z18.s, z29.s
	ldr	z18, [x0]
	addvl	x0, sp, #20
	mla	z10.s, p7/m, z6.s, z14.s
	mov	z16.s, #-57
	add	x0, x0, 64
	ldr	z14, [x0]
	movprfx	z3, z2
	mla	z3.s, p7/m, z28.s, z22.s
	addvl	x0, sp, #23
	mad	z4.s, p7/m, z16.s, z3.s
	mla	z10.s, p7/m, z7.s, z25.s
	add	x0, x0, 64
	ldr	z27, [x0]
	mla	z10.s, p7/m, z1.s, z16.s
	addvl	x0, sp, #25
	mla	z0.s, p7/m, z6.s, z26.s
	mov	z19.s, #50
	add	x0, x0, 64
	mla	z0.s, p7/m, z7.s, z16.s
	ldr	z16, [x0]
	addvl	x0, sp, #18
	mla	z13.s, p7/m, z1.s, z26.s
	movprfx	z5, z4
	mla	z5.s, p7/m, z24.s, z21.s
	mla	z9.s, p7/m, z6.s, z17.s
	mla	z8.s, p7/m, z6.s, z21.s
	mla	z9.s, p7/m, z7.s, z22.s
	mad	z6.s, p7/m, z25.s, z5.s
	mla	z9.s, p7/m, z1.s, z21.s
	mla	z8.s, p7/m, z7.s, z26.s
	add	x0, x0, 64
	mla	z8.s, p7/m, z1.s, z25.s
	mov	z26.s, #75
	mov	z25.s, #-89
	movprfx	z21, z18
	mul	z21.s, z21.s, #89
	mla	z21.s, p7/m, z14.s, z26.s
	mla	z21.s, p7/m, z27.s, z19.s
	mov	z19.s, #-18
	mla	z11.s, p7/m, z1.s, z22.s
	movprfx	z20, z18
	mul	z20.s, p7/m, z20.s, z26.s
	mov	z22.s, #18
	mla	z20.s, p7/m, z14.s, z19.s
	mov	z17.s, #-50
	mla	z20.s, p7/m, z27.s, z25.s
	movprfx	z19, z18
	mul	z19.s, z19.s, #50
	mul	z18.s, p7/m, z18.s, z22.s
	mla	z19.s, p7/m, z14.s, z25.s
	mla	z18.s, p7/m, z14.s, z17.s
	mla	z18.s, p7/m, z27.s, z26.s
	mla	z18.s, p7/m, z16.s, z25.s
	ldr	z25, [x0]
	addvl	x0, sp, #24
	mla	z20.s, p7/m, z16.s, z17.s
	mov	z17.s, #36
	add	x0, x0, 64
	ldr	z14, [x0]
	mla	z19.s, p7/m, z27.s, z22.s
	addvl	x0, sp, #16
	mla	z19.s, p7/m, z16.s, z26.s
	movprfx	z26, z25
	mul	z26.s, z26.s, #83
	add	x0, x0, 64
	mla	z26.s, p7/m, z14.s, z17.s
	mul	z25.s, p7/m, z25.s, z17.s
	ldr	z17, [x0]
	addvl	x0, sp, #21
	mla	z21.s, p7/m, z16.s, z22.s
	add	x0, x0, 64
	mov	z22.s, #-83
	mla	z25.s, p7/m, z14.s, z22.s
	ldr	z22, [x0]
	addvl	x0, sp, #1
	lsl	z29.s, z17.s, #6
	add	x0, x0, 64
	mov	z17.s, #64
	mov	z16.s, #-64
	movprfx	z28, z29
	mla	z28.s, p7/m, z17.s, z22.s
	mla	z29.s, p7/m, z22.s, z16.s
	add	z27.s, z28.s, z26.s
	add	z22.s, z27.s, z21.s
	sub	z27.s, z27.s, z21.s
	add	z21.s, z22.s, z13.s
	sub	z22.s, z22.s, z13.s
	ldr	z13, [x0]
	add	x0, sp, 64
	str	z21, [x0]
	addvl	x0, sp, #2
	sub	z28.s, z28.s, z26.s
	add	x0, x0, 64
	add	z26.s, z29.s, z25.s
	sub	z29.s, z29.s, z25.s
	add	z25.s, z28.s, z18.s
	sub	z28.s, z28.s, z18.s
	add	z18.s, z25.s, z10.s
	sub	z25.s, z25.s, z10.s
	ldr	z10, [x0]
	addvl	x0, sp, #3
	add	x0, x0, 64
	mad	z7.s, p7/m, z23.s, z6.s
	ldr	z6, [x0]
	addvl	x0, sp, #4
	mla	z0.s, p7/m, z1.s, z23.s
	add	z23.s, z26.s, z20.s
	add	x0, x0, 64
	sub	z26.s, z26.s, z20.s
	add	z15.s, z26.s, z0.s
	sub	z26.s, z26.s, z0.s
	add	z0.s, z21.s, z13.s
	ldr	z13, [x0]
	addvl	x0, sp, #16
	add	z21.s, z18.s, z13.s
	mla	z7.s, p7/m, z1.s, z30.s
	add	x0, x0, 64
	str	z21, [x0]
	add	z20.s, z23.s, z12.s
	addvl	x0, sp, #5
	add	z1.s, z20.s, z10.s
	add	z17.s, z28.s, z9.s
	add	x0, x0, 64
	ldr	z10, [x0]
	add	z24.s, z29.s, z19.s
	addvl	x0, sp, #17
	sub	z29.s, z29.s, z19.s
	add	z19.s, z24.s, z11.s
	add	x0, x0, 64
	add	z2.s, z19.s, z6.s
	add	z6.s, z17.s, z10.s
	str	z6, [x0]
	addvl	x0, sp, #6
	sub	z28.s, z28.s, z9.s
	add	x0, x0, 64
	ldr	z6, [x0]
	add	z16.s, z29.s, z8.s
	addvl	x0, sp, #7
	sub	z29.s, z29.s, z8.s
	add	z14.s, z27.s, z7.s
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z4.s, z15.s, z9.s
	addvl	x0, sp, #8
	sub	z27.s, z27.s, z7.s
	add	z3.s, z16.s, z6.s
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z5.s, z14.s, z13.s
	addvl	x0, sp, #9
	sub	z24.s, z24.s, z11.s
	ldr	z21, [x3]
	add	x0, x0, 64
	ldr	z10, [x0]
	add	z6.s, z27.s, z10.s
	addvl	x0, sp, #10
	sub	z23.s, z23.s, z12.s
	lsl	x3, x2, 4
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z7.s, z26.s, z9.s
	addvl	x0, sp, #11
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 64
	ldr	z8, [x0]
	add	z8.s, z29.s, z8.s
	addvl	x0, sp, #12
	sunpklo	z0.s, z0.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z9.s, z28.s, z13.s
	addvl	x0, sp, #13
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x0, x0, 64
	ldr	z10, [x0]
	add	z10.s, z25.s, z10.s
	addvl	x0, sp, #14
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z11.s, z24.s, z13.s
	addvl	x0, sp, #15
	sunpklo	z2.s, z2.h
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z12.s, z23.s, z13.s
	addvl	x0, sp, #18
	add	z13.s, z22.s, z21.s
	sub	z22.s, z22.s, z21.s
	add	x0, x0, 64
	str	z22, [x0]
	uzp1	z3.h, z3.h, z3.h
	addvl	x0, sp, #15
	sunpklo	z3.s, z3.h
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z23.s, z23.s, z22.s
	addvl	x0, sp, #14
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z24.s, z24.s, z22.s
	addvl	x0, sp, #13
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z25.s, z25.s, z22.s
	addvl	x0, sp, #12
	sunpklo	z5.s, z5.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z28.s, z28.s, z22.s
	addvl	x0, sp, #11
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z29.s, z29.s, z22.s
	addvl	x0, sp, #10
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z26.s, z26.s, z22.s
	addvl	x0, sp, #9
	sunpklo	z7.s, z7.h
	sqrshrnb	z8.h, z8.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z27.s, z27.s, z22.s
	addvl	x0, sp, #8
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z14.s, z14.s, z22.s
	addvl	x0, sp, #7
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z15.s, z15.s, z22.s
	addvl	x0, sp, #6
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z16.s, z16.s, z22.s
	addvl	x0, sp, #5
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z17.s, z17.s, z22.s
	addvl	x0, sp, #4
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z18.s, z18.s, z22.s
	addvl	x0, sp, #3
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #12
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z19.s, z19.s, z22.s
	addvl	x0, sp, #2
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sub	z20.s, z20.s, z22.s
	addvl	x0, sp, #1
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 64
	ldr	z22, [x0]
	sunpklo	z13.s, z13.h
	add	x0, sp, 64
	ldr	z21, [x0]
	st1h	z0.s, p6, [x4, z31.s, sxtw 1]
	add	x0, x3, 2
	sub	z21.s, z21.s, z22.s
	sqrshrnb	z23.h, z23.s, #12
	add	x5, x1, x0
	st1h	z1.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z23.h, z23.h, z23.h
	add	x5, x0, 2
	sunpklo	z23.s, z23.h
	sqrshrnb	z24.h, z24.s, #12
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z24.h, z24.h, z24.h
	addvl	x5, sp, #16
	sunpklo	z24.s, z24.h
	sqrshrnb	z25.h, z25.s, #12
	add	x5, x5, 64
	ldr	z22, [x5]
	sqrshrnb	z2.h, z22.s, #12
	add	x5, x0, 4
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z25.h, z25.h, z25.h
	addvl	x5, sp, #17
	sunpklo	z25.s, z25.h
	sqrshrnb	z28.h, z28.s, #12
	add	x5, x5, 64
	ldr	z22, [x5]
	sqrshrnb	z2.h, z22.s, #12
	add	x5, x0, 6
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z28.h, z28.h, z28.h
	add	x5, x0, 8
	sunpklo	z28.s, z28.h
	sqrshrnb	z29.h, z29.s, #12
	add	x5, x1, x5
	st1h	z3.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z29.h, z29.h, z29.h
	add	x5, x0, 10
	sunpklo	z29.s, z29.h
	sqrshrnb	z26.h, z26.s, #12
	add	x5, x1, x5
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z26.h, z26.h, z26.h
	add	x5, x0, 12
	sunpklo	z26.s, z26.h
	sqrshrnb	z27.h, z27.s, #12
	add	x5, x1, x5
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z27.h, z27.h, z27.h
	add	x5, x3, 16
	sunpklo	z27.s, z27.h
	sqrshrnb	z14.h, z14.s, #12
	add	x5, x1, x5
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z14.h, z14.h, z14.h
	add	x5, x0, 16
	sunpklo	z14.s, z14.h
	sqrshrnb	z15.h, z15.s, #12
	add	x5, x1, x5
	st1h	z7.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z15.h, z15.h, z15.h
	add	x5, x0, 18
	sunpklo	z15.s, z15.h
	sqrshrnb	z16.h, z16.s, #12
	add	x5, x1, x5
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z16.h, z16.h, z16.h
	add	x5, x0, 20
	sunpklo	z16.s, z16.h
	sqrshrnb	z17.h, z17.s, #12
	add	x5, x1, x5
	st1h	z9.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z17.h, z17.h, z17.h
	add	x5, x0, 22
	sunpklo	z17.s, z17.h
	sqrshrnb	z18.h, z18.s, #12
	add	x5, x1, x5
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z18.h, z18.h, z18.h
	add	x5, x0, 24
	sunpklo	z18.s, z18.h
	sqrshrnb	z19.h, z19.s, #12
	add	x5, x1, x5
	st1h	z11.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z19.h, z19.h, z19.h
	add	x5, x0, 26
	sunpklo	z19.s, z19.h
	sqrshrnb	z20.h, z20.s, #12
	add	x5, x1, x5
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z20.h, z20.h, z20.h
	add	x5, x0, 28
	sunpklo	z20.s, z20.h
	sqrshrnb	z21.h, z21.s, #12
	add	x5, x1, x5
	st1h	z13.s, p6, [x5, z31.s, sxtw 1]
	uzp1	z21.h, z21.h, z21.h
	addvl	x5, sp, #18
	sunpklo	z21.s, z21.h
	mov	z2.s, #61
	add	x5, x5, 64
	ldr	z22, [x5]
	sqrshrnb	z22.h, z22.s, #12
	add	x5, x3, 32
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x5, x1, x5
	st1h	z22.s, p6, [x5, z31.s, sxtw 1]
	mov	z1.s, #38
	add	x5, x0, 32
	mov	z4.s, #22
	mov	z3.s, #46
	add	x5, x1, x5
	st1h	z23.s, p6, [x5, z31.s, sxtw 1]
	mov	z7.s, #31
	add	x5, x0, 34
	mov	z0.s, #4
	add	x4, x4, x3
	add	x5, x1, x5
	st1h	z24.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 36
	add	x5, x1, x5
	st1h	z25.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 38
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	mov	z28.s, #90
	add	x5, x0, 40
	add	x5, x1, x5
	st1h	z29.s, p6, [x5, z31.s, sxtw 1]
	mov	z29.s, #88
	add	x5, x0, 42
	add	x5, x1, x5
	st1h	z26.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 44
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x3, 48
	add	x5, x1, x5
	st1h	z14.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 48
	add	x5, x1, x5
	st1h	z15.s, p6, [x5, z31.s, sxtw 1]
	mov	z15.s, #82
	add	x5, x0, 50
	add	x5, x1, x5
	st1h	z16.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 52
	add	x5, x1, x5
	st1h	z17.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 54
	add	x5, x1, x5
	st1h	z18.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 56
	add	x5, x1, x5
	st1h	z19.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 58
	add	x0, x0, 60
	add	x5, x1, x5
	add	x0, x1, x0
	st1h	z20.s, p6, [x5, z31.s, sxtw 1]
	st1h	z21.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #31
	add	x5, x3, 1
	add	x0, x0, 96
	ld1sh	z26.s, p7/z, [x0]
	add	x3, x3, x4
	addvl	x0, sp, #13
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 160
	ld1sh	z11.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 224
	ld1sh	z5.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 288
	ld1sh	z12.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 352
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	str	z6, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 416
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 480
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 544
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 608
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 672
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 736
	ld1sh	z21.s, p7/z, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	str	z21, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 800
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 864
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 928
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 992
	ld1sh	z8.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1056
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1120
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1184
	ld1sh	z21.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1248
	ld1sh	z9.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z9, [x0]
	mov	z9.s, #73
	addvl	x0, sp, #31
	add	x0, x0, 1312
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1376
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1440
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1504
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1568
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1632
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1696
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1760
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1824
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1888
	ld1sh	z10.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z10, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1952
	ld1sh	z27.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 2016
	ld1sh	z14.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z14, [x0]
	movprfx	z14, z11
	mul	z14.s, z14.s, #90
	mad	z28.s, p7/m, z12.s, z14.s
	mla	z28.s, p7/m, z13.s, z29.s
	mov	z29.s, #85
	mla	z28.s, p7/m, z16.s, z29.s
	mla	z28.s, p7/m, z17.s, z15.s
	mov	z15.s, #78
	addvl	x0, sp, #31
	mla	z28.s, p7/m, z18.s, z15.s
	mov	z15.s, #67
	mla	z28.s, p7/m, z19.s, z9.s
	mla	z28.s, p7/m, z20.s, z15.s
	mla	z28.s, p7/m, z21.s, z2.s
	mov	z2.s, #54
	add	x0, x0, 2080
	mla	z28.s, p7/m, z22.s, z2.s
	ld1sh	z10.s, p7/z, [x0]
	mla	z28.s, p7/m, z23.s, z3.s
	mov	z2.s, #13
	mla	z28.s, p7/m, z24.s, z1.s
	mla	z28.s, p7/m, z25.s, z7.s
	mla	z28.s, p7/m, z26.s, z4.s
	mla	z28.s, p7/m, z27.s, z2.s
	mla	z28.s, p7/m, z10.s, z0.s
	add	x0, sp, 64
	mov	z0.s, #82
	mov	z2.s, #-31
	str	z28, [x0]
	movprfx	z28, z14
	mla	z28.s, p7/m, z0.s, z12.s
	mov	z14.d, z4.d
	mla	z28.s, p7/m, z13.s, z15.s
	mla	z28.s, p7/m, z16.s, z3.s
	mov	z3.s, #-54
	mla	z28.s, p7/m, z17.s, z4.s
	mov	z4.s, #-88
	mov	z0.s, #-4
	mov	z7.s, #-85
	mla	z28.s, p7/m, z18.s, z0.s
	mla	z28.s, p7/m, z19.s, z2.s
	mov	z2.d, z3.d
	mla	z28.s, p7/m, z20.s, z3.s
	mov	z3.s, #-73
	mla	z28.s, p7/m, z21.s, z3.s
	mla	z28.s, p7/m, z22.s, z7.s
	mla	z28.s, p7/m, z23.s, z30.s
	mla	z28.s, p7/m, z24.s, z4.s
	mov	z4.s, #-61
	mov	z7.s, #-78
	mla	z28.s, p7/m, z25.s, z7.s
	mla	z28.s, p7/m, z26.s, z4.s
	mov	z4.s, #-38
	mla	z28.s, p7/m, z27.s, z4.s
	mov	z4.s, #-13
	addvl	x0, sp, #1
	mla	z28.s, p7/m, z10.s, z4.s
	mov	z4.s, #31
	add	x0, x0, 64
	str	z28, [x0]
	movprfx	z28, z11
	mul	z28.s, z28.s, #88
	mla	z28.s, p7/m, z12.s, z15.s
	mla	z28.s, p7/m, z13.s, z4.s
	mov	z4.s, #-13
	mla	z28.s, p7/m, z16.s, z4.s
	mla	z28.s, p7/m, z17.s, z2.s
	mov	z4.s, #-46
	mov	z2.s, #-82
	mla	z28.s, p7/m, z18.s, z2.s
	mla	z28.s, p7/m, z19.s, z30.s
	mla	z28.s, p7/m, z20.s, z7.s
	mla	z28.s, p7/m, z21.s, z4.s
	mla	z28.s, p7/m, z22.s, z0.s
	mov	z0.d, z1.d
	mla	z28.s, p7/m, z23.s, z1.s
	mov	z1.s, #90
	mla	z28.s, p7/m, z24.s, z9.s
	mla	z28.s, p7/m, z25.s, z1.s
	mov	z1.s, #61
	mla	z28.s, p7/m, z26.s, z29.s
	addvl	x0, sp, #2
	mla	z28.s, p7/m, z27.s, z1.s
	movprfx	z1, z28
	mla	z1.s, p7/m, z10.s, z14.s
	add	x0, x0, 64
	mov	z28.s, #-13
	str	z1, [x0]
	mov	z1.s, #46
	movprfx	z14, z11
	mul	z14.s, p7/m, z14.s, z29.s
	mla	z14.s, p7/m, z12.s, z1.s
	mov	z1.s, #-67
	mla	z14.s, p7/m, z13.s, z28.s
	mov	z28.s, #82
	mla	z14.s, p7/m, z16.s, z1.s
	mov	z1.s, #-22
	mla	z14.s, p7/m, z17.s, z30.s
	mla	z14.s, p7/m, z18.s, z3.s
	mla	z14.s, p7/m, z19.s, z1.s
	mla	z14.s, p7/m, z20.s, z0.s
	mla	z14.s, p7/m, z21.s, z28.s
	mov	z28.s, #88
	mla	z14.s, p7/m, z22.s, z28.s
	addvl	x0, sp, #3
	mov	z28.s, #54
	mla	z14.s, p7/m, z23.s, z28.s
	add	x0, x0, 64
	mov	z28.s, #-4
	mla	z14.s, p7/m, z24.s, z28.s
	mov	z28.s, #-61
	mla	z14.s, p7/m, z25.s, z28.s
	mla	z14.s, p7/m, z26.s, z30.s
	mla	z14.s, p7/m, z27.s, z7.s
	mov	z7.d, z14.d
	mov	z28.s, #22
	mov	z14.s, #-31
	mla	z7.s, p7/m, z10.s, z14.s
	str	z7, [x0]
	movprfx	z14, z11
	mul	z14.s, z14.s, #82
	mov	z7.s, #-54
	mla	z14.s, p7/m, z12.s, z28.s
	mla	z14.s, p7/m, z13.s, z7.s
	mla	z14.s, p7/m, z16.s, z30.s
	mov	z30.s, #-61
	mov	z28.d, z30.d
	mla	z14.s, p7/m, z17.s, z30.s
	mov	z30.s, #13
	mla	z14.s, p7/m, z18.s, z30.s
	mov	z30.s, #78
	mov	z7.s, #-67
	mla	z14.s, p7/m, z19.s, z30.s
	mov	z30.s, #31
	mla	z14.s, p7/m, z20.s, z29.s
	mla	z14.s, p7/m, z21.s, z30.s
	mov	z30.s, #-90
	mla	z14.s, p7/m, z22.s, z4.s
	mla	z14.s, p7/m, z23.s, z30.s
	mla	z14.s, p7/m, z24.s, z7.s
	mov	z7.s, #4
	addvl	x0, sp, #4
	mla	z14.s, p7/m, z25.s, z7.s
	mov	z7.s, #88
	mla	z14.s, p7/m, z26.s, z9.s
	mla	z14.s, p7/m, z27.s, z7.s
	mla	z14.s, p7/m, z10.s, z0.s
	add	x0, x0, 64
	str	z14, [x0]
	mov	z14.s, #-4
	movprfx	z0, z11
	mul	z0.s, z0.s, #78
	mla	z0.s, p7/m, z12.s, z14.s
	mov	z14.s, #13
	mla	z0.s, p7/m, z13.s, z2.s
	mla	z0.s, p7/m, z16.s, z3.s
	mla	z0.s, p7/m, z17.s, z14.s
	mov	z14.s, #-88
	mla	z0.s, p7/m, z18.s, z29.s
	mov	z3.s, #54
	mla	z0.s, p7/m, z19.s, z15.s
	mla	z0.s, p7/m, z20.s, z1.s
	mla	z0.s, p7/m, z21.s, z14.s
	mov	z14.s, #31
	mla	z0.s, p7/m, z22.s, z28.s
	mla	z0.s, p7/m, z23.s, z14.s
	mov	z14.s, #90
	mla	z0.s, p7/m, z24.s, z14.s
	mla	z0.s, p7/m, z25.s, z3.s
	mov	z3.s, #-38
	addvl	x0, sp, #5
	mla	z0.s, p7/m, z26.s, z3.s
	mov	z3.s, #-31
	mla	z0.s, p7/m, z27.s, z30.s
	mla	z0.s, p7/m, z10.s, z4.s
	add	x0, x0, 64
	str	z0, [x0]
	movprfx	z0, z11
	mul	z0.s, p7/m, z0.s, z9.s
	mla	z0.s, p7/m, z12.s, z3.s
	mov	z3.s, #-38
	mla	z0.s, p7/m, z13.s, z30.s
	mov	z7.s, #78
	mla	z0.s, p7/m, z16.s, z1.s
	mla	z0.s, p7/m, z17.s, z7.s
	mla	z0.s, p7/m, z18.s, z15.s
	mla	z0.s, p7/m, z19.s, z3.s
	mov	z3.s, #82
	mla	z0.s, p7/m, z20.s, z30.s
	mov	z7.s, #-13
	mla	z0.s, p7/m, z21.s, z7.s
	mla	z0.s, p7/m, z22.s, z3.s
	mov	z3.s, #61
	mov	z7.s, #-88
	mla	z0.s, p7/m, z23.s, z3.s
	mov	z3.s, #-4
	mla	z0.s, p7/m, z24.s, z4.s
	mla	z0.s, p7/m, z25.s, z7.s
	mla	z0.s, p7/m, z26.s, z3.s
	addvl	x0, sp, #6
	movprfx	z7, z0
	mla	z7.s, p7/m, z27.s, z29.s
	mov	z0.s, #54
	mla	z7.s, p7/m, z10.s, z0.s
	add	x0, x0, 64
	str	z7, [x0]
	mov	z7.s, #-54
	movprfx	z0, z11
	mul	z0.s, p7/m, z0.s, z15.s
	mla	z0.s, p7/m, z12.s, z7.s
	mov	z7.s, #-78
	mov	z3.s, #38
	mla	z0.s, p7/m, z13.s, z7.s
	mov	z7.s, #4
	mla	z0.s, p7/m, z16.s, z3.s
	mov	z3.s, #-31
	mla	z0.s, p7/m, z17.s, z29.s
	mla	z0.s, p7/m, z18.s, z1.s
	mla	z0.s, p7/m, z19.s, z30.s
	mla	z0.s, p7/m, z20.s, z7.s
	mov	z7.s, #13
	mla	z0.s, p7/m, z21.s, z14.s
	mla	z0.s, p7/m, z22.s, z7.s
	mov	z7.s, #-88
	mla	z0.s, p7/m, z23.s, z7.s
	mla	z0.s, p7/m, z24.s, z3.s
	mov	z3.s, #82
	addvl	x0, sp, #7
	mla	z0.s, p7/m, z25.s, z3.s
	mov	z7.s, #46
	mov	z3.s, #-73
	mla	z0.s, p7/m, z26.s, z7.s
	mla	z0.s, p7/m, z27.s, z3.s
	mla	z0.s, p7/m, z10.s, z28.s
	mov	z28.s, #82
	add	x0, x0, 64
	str	z0, [x0]
	movprfx	z0, z11
	mul	z0.s, z0.s, #61
	mla	z0.s, p7/m, z12.s, z3.s
	mla	z0.s, p7/m, z13.s, z4.s
	mla	z0.s, p7/m, z16.s, z28.s
	mov	z28.s, #-88
	mov	z7.s, #31
	mla	z0.s, p7/m, z17.s, z7.s
	mla	z0.s, p7/m, z18.s, z28.s
	mov	z28.s, #-13
	mla	z0.s, p7/m, z19.s, z28.s
	mov	z28.s, #22
	mla	z0.s, p7/m, z20.s, z14.s
	mov	z3.s, #-4
	mla	z0.s, p7/m, z21.s, z3.s
	mla	z0.s, p7/m, z22.s, z30.s
	mla	z0.s, p7/m, z23.s, z28.s
	mov	z28.s, #-38
	mla	z0.s, p7/m, z24.s, z29.s
	mov	z7.s, #-78
	mla	z0.s, p7/m, z25.s, z28.s
	addvl	x0, sp, #8
	mla	z0.s, p7/m, z26.s, z7.s
	mov	z28.s, #54
	mla	z0.s, p7/m, z27.s, z28.s
	mla	z0.s, p7/m, z10.s, z15.s
	add	x0, x0, 64
	str	z0, [x0]
	movprfx	z0, z11
	mul	z0.s, p7/m, z0.s, z28.s
	mov	z28.s, #-85
	mla	z0.s, p7/m, z12.s, z28.s
	mla	z0.s, p7/m, z13.s, z3.s
	mov	z28.s, #-61
	mov	z3.s, #88
	mla	z0.s, p7/m, z16.s, z3.s
	mla	z0.s, p7/m, z17.s, z4.s
	mla	z0.s, p7/m, z18.s, z28.s
	mov	z28.s, #82
	mov	z3.s, #38
	mla	z0.s, p7/m, z19.s, z28.s
	mov	z28.s, #13
	mla	z0.s, p7/m, z20.s, z28.s
	mla	z0.s, p7/m, z21.s, z30.s
	mla	z0.s, p7/m, z22.s, z3.s
	mla	z0.s, p7/m, z23.s, z15.s
	mla	z0.s, p7/m, z24.s, z7.s
	mla	z0.s, p7/m, z25.s, z1.s
	mla	z0.s, p7/m, z26.s, z14.s
	addvl	x0, sp, #9
	mov	z28.s, #-31
	movprfx	z3, z0
	mla	z3.s, p7/m, z27.s, z28.s
	mov	z0.s, #-73
	mla	z3.s, p7/m, z10.s, z0.s
	add	x0, x0, 64
	str	z3, [x0]
	mov	z3.s, #38
	movprfx	z0, z11
	mul	z0.s, z0.s, #46
	mov	z28.s, #-88
	mla	z0.s, p7/m, z12.s, z30.s
	mla	z0.s, p7/m, z13.s, z3.s
	mov	z3.s, #54
	mov	z7.s, #31
	mla	z0.s, p7/m, z16.s, z3.s
	mov	z3.s, #61
	mla	z0.s, p7/m, z17.s, z30.s
	mla	z0.s, p7/m, z18.s, z7.s
	mla	z0.s, p7/m, z19.s, z3.s
	mla	z0.s, p7/m, z20.s, z28.s
	mov	z28.s, #22
	mla	z0.s, p7/m, z21.s, z28.s
	mov	z3.d, z28.d
	mov	z28.s, #-85
	mla	z0.s, p7/m, z22.s, z15.s
	mla	z0.s, p7/m, z23.s, z28.s
	mov	z28.s, #13
	mla	z0.s, p7/m, z24.s, z28.s
	mla	z0.s, p7/m, z25.s, z9.s
	mla	z0.s, p7/m, z26.s, z2.s
	addvl	x0, sp, #10
	mov	z7.s, #4
	movprfx	z28, z0
	mla	z28.s, p7/m, z27.s, z7.s
	mov	z0.s, #78
	mla	z28.s, p7/m, z10.s, z0.s
	add	x0, x0, 64
	str	z28, [x0]
	mov	z28.s, #-88
	movprfx	z0, z11
	mul	z0.s, z0.s, #38
	mla	z0.s, p7/m, z12.s, z28.s
	mov	z28.s, #-4
	mla	z0.s, p7/m, z13.s, z9.s
	mla	z0.s, p7/m, z16.s, z28.s
	mov	z28.s, #-67
	mad	z28.s, p7/m, z17.s, z0.s
	mov	z0.s, #-31
	mla	z28.s, p7/m, z18.s, z14.s
	mla	z28.s, p7/m, z19.s, z4.s
	mla	z28.s, p7/m, z20.s, z0.s
	mov	z0.s, #13
	mla	z28.s, p7/m, z21.s, z29.s
	mov	z7.s, #-78
	mla	z28.s, p7/m, z22.s, z7.s
	mla	z28.s, p7/m, z23.s, z0.s
	mov	z0.s, #61
	addvl	x0, sp, #11
	mla	z28.s, p7/m, z24.s, z0.s
	mov	z9.s, #-88
	mla	z28.s, p7/m, z25.s, z30.s
	mov	z0.s, #54
	mla	z28.s, p7/m, z26.s, z0.s
	mla	z28.s, p7/m, z27.s, z3.s
	mla	z28.s, p7/m, z10.s, z2.s
	mov	z3.s, #-61
	add	x0, x0, 64
	str	z28, [x0]
	movprfx	z28, z11
	mul	z28.s, z28.s, #31
	mla	z28.s, p7/m, z12.s, z7.s
	mov	z7.s, #4
	mla	z28.s, p7/m, z13.s, z14.s
	mla	z28.s, p7/m, z16.s, z3.s
	mla	z28.s, p7/m, z17.s, z7.s
	mla	z28.s, p7/m, z18.s, z0.s
	mla	z28.s, p7/m, z19.s, z9.s
	mov	z9.s, #82
	mla	z28.s, p7/m, z20.s, z9.s
	mov	z0.s, #-13
	mov	z9.s, #-38
	mla	z28.s, p7/m, z21.s, z9.s
	mov	z7.d, z9.d
	mad	z1.s, p7/m, z22.s, z28.s
	mov	z9.s, #73
	movprfx	z28, z11
	mul	z28.s, z28.s, #22
	mla	z28.s, p7/m, z12.s, z3.s
	mov	z3.s, #-4
	mla	z1.s, p7/m, z23.s, z9.s
	mla	z28.s, p7/m, z13.s, z29.s
	mla	z28.s, p7/m, z16.s, z30.s
	mla	z28.s, p7/m, z17.s, z9.s
	mov	z9.d, z7.d
	mla	z28.s, p7/m, z18.s, z7.s
	mov	z7.s, #46
	mla	z28.s, p7/m, z19.s, z3.s
	mov	z3.s, #54
	mla	z28.s, p7/m, z20.s, z7.s
	addvl	x0, sp, #12
	mov	z7.s, #-78
	mla	z28.s, p7/m, z21.s, z7.s
	mla	z28.s, p7/m, z22.s, z14.s
	mla	z28.s, p7/m, z23.s, z2.s
	mla	z28.s, p7/m, z24.s, z3.s
	mov	z3.s, #-31
	mla	z28.s, p7/m, z25.s, z0.s
	mla	z28.s, p7/m, z26.s, z3.s
	add	x0, x0, 64
	movprfx	z3, z28
	mla	z3.s, p7/m, z27.s, z15.s
	mov	z28.s, #-88
	mla	z3.s, p7/m, z10.s, z28.s
	str	z3, [x0]
	addvl	x0, sp, #26
	mov	z3.s, #-73
	add	x0, x0, 64
	movprfx	z28, z11
	mul	z28.s, z28.s, #13
	mla	z28.s, p7/m, z12.s, z9.s
	mov	z9.s, #61
	mla	z28.s, p7/m, z13.s, z9.s
	mla	z28.s, p7/m, z16.s, z7.s
	mov	z7.s, #88
	mla	z28.s, p7/m, z17.s, z7.s
	mla	z28.s, p7/m, z18.s, z30.s
	mla	z28.s, p7/m, z19.s, z29.s
	mla	z28.s, p7/m, z20.s, z3.s
	mov	z3.s, #-31
	mov	z9.s, #54
	mov	z7.s, #4
	mla	z28.s, p7/m, z21.s, z9.s
	lsl	z11.s, z11.s, #2
	mla	z28.s, p7/m, z22.s, z3.s
	mov	z3.s, #22
	mla	z28.s, p7/m, z23.s, z7.s
	mla	z28.s, p7/m, z24.s, z3.s
	mla	z28.s, p7/m, z25.s, z4.s
	mla	z28.s, p7/m, z26.s, z15.s
	mla	z28.s, p7/m, z27.s, z2.s
	mla	z28.s, p7/m, z10.s, z14.s
	str	z28, [x0]
	addvl	x0, sp, #16
	mad	z12.s, p7/m, z0.s, z11.s
	add	x0, x0, 64
	mov	z11.s, #-31
	mad	z13.s, p7/m, z3.s, z12.s
	mad	z16.s, p7/m, z11.s, z13.s
	ldr	z11, [x0]
	addvl	x0, sp, #19
	mov	z3.s, #38
	mad	z17.s, p7/m, z3.s, z16.s
	add	x0, x0, 64
	mad	z18.s, p7/m, z4.s, z17.s
	mad	z19.s, p7/m, z9.s, z18.s
	ldr	z9, [x0]
	addvl	x0, sp, #21
	mov	z18.s, #-61
	add	x0, x0, 64
	ldr	z3, [x0]
	mad	z20.s, p7/m, z18.s, z19.s
	addvl	x0, sp, #23
	mad	z21.s, p7/m, z15.s, z20.s
	mla	z1.s, p7/m, z24.s, z30.s
	add	x0, x0, 64
	mov	z12.s, #-73
	mad	z22.s, p7/m, z12.s, z21.s
	mov	z21.s, #78
	mad	z23.s, p7/m, z21.s, z22.s
	mad	z24.s, p7/m, z2.s, z23.s
	ldr	z7, [x0]
	mla	z1.s, p7/m, z25.s, z15.s
	addvl	x0, sp, #25
	mad	z25.s, p7/m, z29.s, z24.s
	mla	z1.s, p7/m, z26.s, z0.s
	mov	z24.s, #-88
	mla	z1.s, p7/m, z27.s, z4.s
	mad	z26.s, p7/m, z24.s, z25.s
	mad	z27.s, p7/m, z14.s, z26.s
	mov	z19.s, #43
	mla	z1.s, p7/m, z10.s, z29.s
	mov	z18.s, #70
	mad	z10.s, p7/m, z30.s, z27.s
	mov	z16.s, #87
	mov	z12.s, #57
	movprfx	z21, z5
	mul	z21.s, p7/m, z21.s, z18.s
	movprfx	z28, z5
	mul	z28.s, p7/m, z28.s, z14.s
	mov	z22.s, #25
	mla	z28.s, p7/m, z6.s, z16.s
	add	x0, x0, 64
	mov	z27.s, #80
	mla	z28.s, p7/m, z11.s, z27.s
	mla	z28.s, p7/m, z8.s, z18.s
	mla	z28.s, p7/m, z9.s, z12.s
	mla	z28.s, p7/m, z3.s, z19.s
	mla	z28.s, p7/m, z7.s, z22.s
	ldr	z4, [x0]
	mov	z24.s, #9
	mov	z20.s, #-80
	movprfx	z2, z28
	mla	z2.s, p7/m, z4.s, z24.s
	mov	z17.s, #-25
	mov	z23.s, #-87
	movprfx	z27, z5
	mul	z27.s, p7/m, z27.s, z16.s
	mov	z25.s, #-70
	mla	z27.s, p7/m, z6.s, z12.s
	addvl	x0, sp, #14
	mla	z27.s, p7/m, z11.s, z24.s
	mov	z28.s, #-43
	movprfx	z26, z5
	mul	z26.s, z26.s, #80
	mla	z27.s, p7/m, z8.s, z28.s
	mla	z26.s, p7/m, z6.s, z24.s
	mad	z28.s, p7/m, z6.s, z21.s
	mla	z26.s, p7/m, z11.s, z25.s
	mov	z21.d, z11.d
	mla	z28.s, p7/m, z11.s, z23.s
	movprfx	z11, z5
	mul	z11.s, p7/m, z11.s, z12.s
	mla	z11.s, p7/m, z6.s, z20.s
	mla	z11.s, p7/m, z21.s, z17.s
	mla	z11.s, p7/m, z8.s, z14.s
	mov	z0.d, z21.d
	mla	z26.s, p7/m, z8.s, z23.s
	mla	z28.s, p7/m, z8.s, z24.s
	mla	z26.s, p7/m, z9.s, z17.s
	mla	z28.s, p7/m, z9.s, z14.s
	mla	z26.s, p7/m, z3.s, z12.s
	mla	z28.s, p7/m, z3.s, z22.s
	add	x0, x0, 64
	mov	z21.s, #-9
	mad	z21.s, p7/m, z9.s, z11.s
	movprfx	z11, z5
	mul	z11.s, p7/m, z11.s, z19.s
	mla	z21.s, p7/m, z3.s, z23.s
	mla	z11.s, p7/m, z6.s, z30.s
	mad	z12.s, p7/m, z0.s, z11.s
	mad	z22.s, p7/m, z8.s, z12.s
	mla	z22.s, p7/m, z9.s, z23.s
	movprfx	z23, z5
	mul	z23.s, z23.s, #25
	mul	z5.s, p7/m, z5.s, z24.s
	mla	z23.s, p7/m, z6.s, z25.s
	mad	z6.s, p7/m, z17.s, z5.s
	mla	z27.s, p7/m, z9.s, z20.s
	mla	z26.s, p7/m, z7.s, z14.s
	mla	z27.s, p7/m, z3.s, z30.s
	mla	z28.s, p7/m, z7.s, z20.s
	mla	z27.s, p7/m, z7.s, z25.s
	mov	z13.s, #-57
	mla	z21.s, p7/m, z7.s, z19.s
	mla	z22.s, p7/m, z3.s, z18.s
	mla	z23.s, p7/m, z0.s, z14.s
	mla	z22.s, p7/m, z7.s, z24.s
	mla	z23.s, p7/m, z8.s, z20.s
	mla	z23.s, p7/m, z9.s, z19.s
	mla	z23.s, p7/m, z3.s, z24.s
	mov	z24.d, z7.d
	mla	z23.s, p7/m, z7.s, z13.s
	movprfx	z7, z6
	mla	z7.s, p7/m, z0.s, z19.s
	ldr	z6, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	mla	z27.s, p7/m, z4.s, z17.s
	mla	z26.s, p7/m, z4.s, z19.s
	mla	z28.s, p7/m, z4.s, z13.s
	mla	z21.s, p7/m, z4.s, z18.s
	mla	z22.s, p7/m, z4.s, z20.s
	mla	z23.s, p7/m, z4.s, z16.s
	mad	z8.s, p7/m, z13.s, z7.s
	mad	z9.s, p7/m, z18.s, z8.s
	mad	z20.s, p7/m, z3.s, z9.s
	mla	z20.s, p7/m, z24.s, z16.s
	mla	z20.s, p7/m, z4.s, z30.s
	ldr	z4, [x0]
	addvl	x0, sp, #20
	mov	z25.s, #50
	add	x0, x0, 64
	ldr	z8, [x0]
	mov	z24.s, #75
	addvl	x0, sp, #24
	movprfx	z19, z6
	mul	z19.s, z19.s, #89
	mla	z19.s, p7/m, z4.s, z24.s
	add	x0, x0, 64
	ldr	z12, [x0]
	mla	z19.s, p7/m, z8.s, z25.s
	addvl	x0, sp, #15
	mov	z25.s, #-18
	movprfx	z18, z6
	mul	z18.s, p7/m, z18.s, z24.s
	mov	z16.s, #-89
	mla	z18.s, p7/m, z4.s, z25.s
	mov	z13.s, #-50
	add	x0, x0, 64
	movprfx	z25, z6
	mul	z25.s, z25.s, #50
	mla	z25.s, p7/m, z4.s, z16.s
	mla	z18.s, p7/m, z8.s, z16.s
	mov	z17.s, #18
	mla	z18.s, p7/m, z12.s, z13.s
	mla	z19.s, p7/m, z12.s, z17.s
	mad	z17.s, p7/m, z8.s, z25.s
	movprfx	z25, z6
	mul	z25.s, z25.s, #18
	mla	z25.s, p7/m, z4.s, z13.s
	ldr	z13, [x0]
	addvl	x0, sp, #22
	mla	z25.s, p7/m, z8.s, z24.s
	add	x0, x0, 64
	mla	z17.s, p7/m, z12.s, z24.s
	ldr	z24, [x0]
	mad	z16.s, p7/m, z12.s, z25.s
	addvl	x0, sp, #13
	movprfx	z25, z13
	mul	z25.s, z25.s, #83
	add	x0, x0, 64
	mov	z12.s, #36
	mad	z12.s, p7/m, z24.s, z25.s
	movprfx	z25, z13
	mul	z25.s, z25.s, #36
	mov	z13.s, #-83
	mad	z13.s, p7/m, z24.s, z25.s
	ldr	z25, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z6, [x0]
	lsl	z11.s, z25.s, #6
	addvl	x0, sp, #13
	mov	z24.s, #64
	mad	z24.s, p7/m, z6.s, z11.s
	add	x0, x0, 64
	add	z9.s, z24.s, z12.s
	add	z3.s, z9.s, z19.s
	sub	z9.s, z9.s, z19.s
	add	z19.s, z3.s, z2.s
	str	z19, [x0]
	add	x0, sp, 64
	mov	z25.s, #-64
	mad	z25.s, p7/m, z6.s, z11.s
	add	z8.s, z25.s, z13.s
	add	z4.s, z8.s, z18.s
	sub	z8.s, z8.s, z18.s
	sub	z0.s, z4.s, z27.s
	add	z18.s, z4.s, z27.s
	ldr	z27, [x0]
	addvl	x0, sp, #13
	sub	z24.s, z24.s, z12.s
	add	z6.s, z24.s, z16.s
	add	x0, x0, 64
	sub	z24.s, z24.s, z16.s
	add	z16.s, z6.s, z28.s
	sub	z6.s, z6.s, z28.s
	ldr	z28, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	sub	z25.s, z25.s, z13.s
	add	z5.s, z25.s, z17.s
	sub	z25.s, z25.s, z17.s
	add	z17.s, z5.s, z26.s
	sub	z5.s, z5.s, z26.s
	ldr	z26, [x0]
	addvl	x0, sp, #2
	add	z11.s, z8.s, z23.s
	add	x0, x0, 64
	sub	z8.s, z8.s, z23.s
	ldr	z23, [x0]
	addvl	x0, sp, #3
	add	z12.s, z25.s, z22.s
	sub	z25.s, z25.s, z22.s
	add	x0, x0, 64
	ldr	z22, [x0]
	add	z7.s, z28.s, z27.s
	addvl	x0, sp, #4
	add	z19.s, z9.s, z20.s
	sub	z9.s, z9.s, z20.s
	add	x0, x0, 64
	ldr	z27, [x0]
	add	z20.s, z18.s, z26.s
	addvl	x0, sp, #5
	add	z13.s, z24.s, z21.s
	sub	z24.s, z24.s, z21.s
	add	x0, x0, 64
	ldr	z26, [x0]
	add	z21.s, z17.s, z23.s
	addvl	x0, sp, #6
	add	z23.s, z13.s, z27.s
	sub	z3.s, z3.s, z2.s
	add	x0, x0, 64
	ldr	z27, [x0]
	add	z27.s, z11.s, z27.s
	addvl	x0, sp, #14
	add	z26.s, z12.s, z26.s
	add	z22.s, z16.s, z22.s
	add	x0, x0, 64
	str	z19, [x0]
	sqrshrnb	z7.h, z7.s, #12
	addvl	x0, sp, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x0, x0, 64
	ldr	z28, [x0]
	add	z28.s, z19.s, z28.s
	addvl	x0, sp, #8
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	add	x0, x0, 64
	ldr	z2, [x0]
	add	z2.s, z9.s, z2.s
	addvl	x0, sp, #9
	sunpklo	z20.s, z20.h
	sqrshrnb	z21.h, z21.s, #12
	add	x0, x0, 64
	ldr	z4, [x0]
	add	z4.s, z8.s, z4.s
	addvl	x0, sp, #15
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x0, x0, 64
	str	z4, [x0]
	sqrshrnb	z22.h, z22.s, #12
	addvl	x0, sp, #10
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x0, x0, 64
	ldr	z4, [x0]
	add	z4.s, z25.s, z4.s
	addvl	x0, sp, #16
	sqrshrnb	z23.h, z23.s, #12
	uzp1	z23.h, z23.h, z23.h
	add	x0, x0, 64
	str	z4, [x0]
	sunpklo	z23.s, z23.h
	addvl	x0, sp, #11
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x0, x0, 64
	ldr	z19, [x0]
	add	z4.s, z24.s, z19.s
	addvl	x0, sp, #17
	sunpklo	z26.s, z26.h
	sqrshrnb	z27.h, z27.s, #12
	add	x0, x0, 64
	str	z4, [x0]
	add	z4.s, z6.s, z1.s
	addvl	x0, sp, #18
	sub	z6.s, z6.s, z1.s
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	str	z4, [x0]
	sunpklo	z27.s, z27.h
	addvl	x0, sp, #12
	sqrshrnb	z28.h, z28.s, #12
	uzp1	z28.h, z28.h, z28.h
	add	x0, x0, 64
	ldr	z4, [x0]
	add	z4.s, z5.s, z4.s
	addvl	x0, sp, #19
	sunpklo	z28.s, z28.h
	sqrshrnb	z2.h, z2.s, #12
	add	x0, x0, 64
	str	z4, [x0]
	uzp1	z2.h, z2.h, z2.h
	addvl	x0, sp, #26
	sunpklo	z2.s, z2.h
	sqrshrnb	z6.h, z6.s, #12
	add	x0, x0, 64
	ldr	z4, [x0]
	add	z19.s, z0.s, z4.s
	addvl	x0, sp, #20
	sub	z4.s, z0.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z3.s, z10.s
	addvl	x0, sp, #21
	sub	z3.s, z3.s, z10.s
	sqrshrnb	z3.h, z3.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	uzp1	z3.h, z3.h, z3.h
	addvl	x0, sp, #12
	sunpklo	z3.s, z3.h
	uzp1	z4.h, z4.h, z4.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z5.s, z5.s, z10.s
	addvl	x0, sp, #11
	sunpklo	z4.s, z4.h
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z19, [x0]
	sub	z24.s, z24.s, z19.s
	addvl	x0, sp, #10
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z25.s, z25.s, z10.s
	addvl	x0, sp, #9
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z8.s, z8.s, z10.s
	addvl	x0, sp, #8
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z9.s, z9.s, z10.s
	addvl	x0, sp, #14
	sunpklo	z24.s, z24.h
	sqrshrnb	z25.h, z25.s, #12
	add	x0, x0, 64
	ldr	z1, [x0]
	uzp1	z25.h, z25.h, z25.h
	addvl	x0, sp, #7
	sunpklo	z25.s, z25.h
	sqrshrnb	z8.h, z8.s, #12
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z10.s, z1.s, z10.s
	addvl	x0, sp, #6
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x0, x0, 64
	ldr	z0, [x0]
	sub	z11.s, z11.s, z0.s
	addvl	x0, sp, #5
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 64
	ldr	z1, [x0]
	sub	z12.s, z12.s, z1.s
	addvl	x0, sp, #4
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #12
	add	x0, x0, 64
	ldr	z0, [x0]
	sub	z13.s, z13.s, z0.s
	addvl	x0, sp, #3
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x0, x0, 64
	ldr	z1, [x0]
	sub	z16.s, z16.s, z1.s
	addvl	x0, sp, #2
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	add	x0, x0, 64
	ldr	z0, [x0]
	sub	z17.s, z17.s, z0.s
	addvl	x0, sp, #1
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #12
	add	x0, x0, 64
	ldr	z1, [x0]
	sub	z18.s, z18.s, z1.s
	add	x0, sp, 64
	ldr	z1, [x0]
	uzp1	z12.h, z12.h, z12.h
	addvl	x0, sp, #13
	sunpklo	z12.s, z12.h
	sqrshrnb	z13.h, z13.s, #12
	add	x0, x0, 64
	ldr	z19, [x0]
	st1h	z7.s, p6, [x4, z31.s, sxtw 1]
	lsl	x0, x5, 1
	add	x5, x1, x5, lsl 1
	st1h	z20.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 2
	sub	z19.s, z19.s, z1.s
	uzp1	z13.h, z13.h, z13.h
	add	x5, x1, x5
	st1h	z21.s, p6, [x5, z31.s, sxtw 1]
	sunpklo	z13.s, z13.h
	add	x5, x0, 4
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	add	x5, x1, x5
	st1h	z22.s, p6, [x5, z31.s, sxtw 1]
	sunpklo	z16.s, z16.h
	add	x5, x0, 6
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	add	x5, x1, x5
	st1h	z23.s, p6, [x5, z31.s, sxtw 1]
	sunpklo	z17.s, z17.h
	add	x5, x0, 8
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	add	x5, x1, x5
	st1h	z26.s, p6, [x5, z31.s, sxtw 1]
	sunpklo	z18.s, z18.h
	add	x5, x0, 10
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	add	x5, x1, x5
	st1h	z27.s, p6, [x5, z31.s, sxtw 1]
	sunpklo	z19.s, z19.h
	add	x5, x0, 12
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 14
	add	x5, x1, x5
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	mov	z2.s, #88
	addvl	x5, sp, #15
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z1.h, z27.s, #12
	add	x5, x0, 16
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x5, x1, x5
	st1h	z1.s, p6, [x5, z31.s, sxtw 1]
	mov	z1.s, #78
	addvl	x5, sp, #16
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z0.h, z27.s, #12
	add	x5, x0, 18
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x5, x1, x5
	st1h	z0.s, p6, [x5, z31.s, sxtw 1]
	mov	z0.s, #61
	addvl	x5, sp, #17
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z28.h, z27.s, #12
	add	x5, x0, 20
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, sp, #18
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z28.h, z27.s, #12
	add	x5, x0, 22
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, sp, #19
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z28.h, z27.s, #12
	add	x5, x0, 24
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, sp, #20
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z28.h, z27.s, #12
	add	x5, x0, 26
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, sp, #21
	add	x5, x5, 64
	ldr	z27, [x5]
	sqrshrnb	z28.h, z27.s, #12
	add	x5, x0, 28
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x5, x1, x5
	st1h	z28.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x1, x2, lsl 5
	add	x2, x2, x2, lsl 1
	add	x5, x5, 32
	st1h	z3.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 32
	add	x5, x1, x5
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 34
	add	x5, x1, x5
	st1h	z5.s, p6, [x5, z31.s, sxtw 1]
	mov	z5.s, #31
	add	x5, x0, 36
	add	x5, x1, x5
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 38
	add	x5, x1, x5
	st1h	z24.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 40
	add	x5, x1, x5
	st1h	z25.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 42
	add	x5, x1, x5
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	mov	z8.s, #22
	add	x5, x0, 44
	add	x5, x1, x5
	st1h	z9.s, p6, [x5, z31.s, sxtw 1]
	mov	z9.s, #73
	add	x5, x0, 46
	mov	z3.d, z9.d
	add	x5, x1, x5
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	mov	z10.s, #82
	add	x5, x0, 48
	add	x5, x1, x5
	st1h	z11.s, p6, [x5, z31.s, sxtw 1]
	mov	z11.s, #54
	add	x5, x0, 50
	add	x5, x1, x5
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 52
	add	x5, x1, x5
	st1h	z13.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 54
	add	x5, x1, x5
	st1h	z16.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 56
	add	x5, x1, x5
	st1h	z17.s, p6, [x5, z31.s, sxtw 1]
	add	x5, x0, 58
	add	x0, x0, 60
	add	x5, x1, x5
	add	x0, x1, x0
	st1h	z18.s, p6, [x5, z31.s, sxtw 1]
	st1h	z19.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, sp, #31
	add	x0, x0, 112
	ld1sh	z27.s, p7/z, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 64
	str	z27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 176
	ld1sh	z6.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 240
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	str	z19, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 304
	ld1sh	z7.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 368
	ld1sh	z27.s, p7/z, [x0]
	addvl	x0, sp, #15
	add	x0, x0, 64
	str	z27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 432
	ld1sh	z16.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 496
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #16
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 560
	ld1sh	z17.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 624
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #17
	add	x0, x0, 64
	str	z25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 688
	ld1sh	z18.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 752
	ld1sh	z27.s, p7/z, [x0]
	addvl	x0, sp, #18
	add	x0, x0, 64
	str	z27, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 816
	ld1sh	z19.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 880
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #19
	add	x0, x0, 64
	str	z23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 944
	ld1sh	z20.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1008
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	str	z25, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1072
	ld1sh	z21.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1136
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #21
	add	x0, x0, 64
	str	z22, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1200
	ld1sh	z22.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1264
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #22
	add	x0, x0, 64
	str	z23, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1328
	ld1sh	z23.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1392
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #23
	add	x0, x0, 64
	str	z13, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1456
	ld1sh	z24.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1520
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	str	z26, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1584
	ld1sh	z25.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1648
	ld1sh	z4.s, p7/z, [x0]
	addvl	x0, sp, #25
	add	x0, x0, 64
	str	z4, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1712
	ld1sh	z26.s, p7/z, [x0]
	addvl	x0, sp, #31
	add	x0, x0, 1776
	ld1sh	z13.s, p7/z, [x0]
	addvl	x0, sp, #26
	add	x0, x0, 64
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, p7/m, z13.s, z14.s
	addvl	x0, sp, #31
	movprfx	z12, z13
	mla	z12.s, p7/m, z7.s, z14.s
	mla	z12.s, p7/m, z16.s, z2.s
	add	x0, x0, 1840
	ld1sh	z27.s, p7/z, [x0]
	mla	z12.s, p7/m, z17.s, z29.s
	addvl	x0, sp, #31
	mla	z12.s, p7/m, z18.s, z10.s
	mla	z12.s, p7/m, z19.s, z1.s
	add	x0, x0, 1904
	ld1sh	z4.s, p7/z, [x0]
	mla	z12.s, p7/m, z20.s, z9.s
	addvl	x0, sp, #27
	mov	z9.s, #46
	mla	z12.s, p7/m, z21.s, z15.s
	add	x0, x0, 64
	str	z4, [x0]
	mla	z12.s, p7/m, z22.s, z0.s
	addvl	x0, sp, #31
	mla	z12.s, p7/m, z23.s, z11.s
	mla	z13.s, p7/m, z7.s, z10.s
	add	x0, x0, 1968
	ld1sh	z28.s, p7/z, [x0]
	mov	z11.s, #38
	addvl	x0, sp, #31
	mla	z12.s, p7/m, z24.s, z9.s
	mla	z13.s, p7/m, z16.s, z15.s
	add	x0, x0, 2032
	ld1sh	z4.s, p7/z, [x0]
	mla	z12.s, p7/m, z25.s, z11.s
	addvl	x0, sp, #28
	mla	z12.s, p7/m, z26.s, z5.s
	mla	z13.s, p7/m, z17.s, z9.s
	add	x0, x0, 64
	str	z4, [x0]
	mla	z12.s, p7/m, z27.s, z8.s
	addvl	x0, sp, #31
	mov	z5.s, #13
	mov	z0.s, #4
	add	x0, x0, 2096
	movprfx	z2, z12
	mla	z2.s, p7/m, z28.s, z5.s
	ld1sh	z4.s, p7/z, [x0]
	mov	z9.s, #-85
	mla	z2.s, p7/m, z4.s, z0.s
	addvl	x0, sp, #29
	mov	z1.s, #-4
	mla	z13.s, p7/m, z18.s, z8.s
	mov	z12.s, #-73
	mla	z13.s, p7/m, z19.s, z1.s
	add	x0, x0, 64
	mov	z5.s, #-54
	mov	z0.s, #-88
	str	z2, [x0]
	mov	z2.s, #-31
	mla	z13.s, p7/m, z20.s, z2.s
	mla	z13.s, p7/m, z21.s, z5.s
	mla	z13.s, p7/m, z22.s, z12.s
	mla	z13.s, p7/m, z23.s, z9.s
	mov	z9.s, #-38
	mov	z5.s, #-61
	mla	z13.s, p7/m, z24.s, z30.s
	mov	z10.s, #-78
	mla	z13.s, p7/m, z25.s, z0.s
	mov	z0.s, #31
	mla	z13.s, p7/m, z26.s, z10.s
	mla	z13.s, p7/m, z27.s, z5.s
	mla	z13.s, p7/m, z28.s, z9.s
	mov	z9.s, #-13
	mla	z13.s, p7/m, z4.s, z9.s
	add	x0, sp, 64
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, z13.s, #88
	mla	z13.s, p7/m, z7.s, z15.s
	mla	z13.s, p7/m, z16.s, z0.s
	mov	z0.s, #-54
	mla	z13.s, p7/m, z17.s, z9.s
	mla	z13.s, p7/m, z18.s, z0.s
	mov	z0.s, #-82
	mla	z13.s, p7/m, z19.s, z0.s
	mov	z0.s, #-46
	mla	z13.s, p7/m, z20.s, z30.s
	mla	z13.s, p7/m, z21.s, z10.s
	mla	z13.s, p7/m, z22.s, z0.s
	mla	z13.s, p7/m, z23.s, z1.s
	mla	z13.s, p7/m, z24.s, z11.s
	mla	z13.s, p7/m, z25.s, z3.s
	mov	z3.s, #61
	mla	z13.s, p7/m, z26.s, z14.s
	addvl	x0, sp, #1
	mla	z13.s, p7/m, z27.s, z29.s
	mla	z13.s, p7/m, z28.s, z3.s
	mov	z3.s, #46
	mla	z13.s, p7/m, z4.s, z8.s
	add	x0, x0, 64
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, p7/m, z13.s, z29.s
	mla	z13.s, p7/m, z7.s, z3.s
	mov	z3.s, #-67
	mla	z13.s, p7/m, z16.s, z9.s
	mla	z13.s, p7/m, z17.s, z3.s
	mla	z13.s, p7/m, z18.s, z30.s
	mla	z13.s, p7/m, z19.s, z12.s
	mov	z12.s, #82
	mov	z3.s, #-22
	mla	z13.s, p7/m, z20.s, z3.s
	mla	z13.s, p7/m, z21.s, z11.s
	mla	z13.s, p7/m, z22.s, z12.s
	mov	z12.s, #88
	addvl	x0, sp, #2
	mla	z13.s, p7/m, z23.s, z12.s
	mov	z12.s, #54
	mla	z13.s, p7/m, z24.s, z12.s
	mla	z13.s, p7/m, z25.s, z1.s
	mla	z13.s, p7/m, z26.s, z5.s
	mla	z13.s, p7/m, z27.s, z30.s
	mla	z13.s, p7/m, z28.s, z10.s
	mla	z13.s, p7/m, z4.s, z2.s
	add	x0, x0, 64
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, z13.s, #82
	mla	z13.s, p7/m, z7.s, z8.s
	mov	z8.s, #-54
	mov	z12.s, #-67
	mla	z13.s, p7/m, z16.s, z8.s
	mov	z8.s, #78
	mla	z13.s, p7/m, z17.s, z30.s
	mov	z10.s, #13
	mla	z13.s, p7/m, z18.s, z5.s
	mla	z13.s, p7/m, z19.s, z10.s
	mla	z13.s, p7/m, z20.s, z8.s
	mov	z8.s, #31
	mla	z13.s, p7/m, z21.s, z29.s
	mla	z13.s, p7/m, z22.s, z8.s
	mla	z13.s, p7/m, z23.s, z0.s
	mla	z13.s, p7/m, z24.s, z30.s
	mla	z13.s, p7/m, z25.s, z12.s
	mov	z12.s, #4
	mla	z13.s, p7/m, z26.s, z12.s
	mov	z12.s, #73
	mla	z13.s, p7/m, z27.s, z12.s
	addvl	x0, sp, #3
	mov	z12.s, #88
	mla	z13.s, p7/m, z28.s, z12.s
	mla	z13.s, p7/m, z4.s, z11.s
	mov	z12.s, #-82
	add	x0, x0, 64
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, z13.s, #78
	mla	z13.s, p7/m, z7.s, z1.s
	mla	z13.s, p7/m, z16.s, z12.s
	mov	z12.s, #-73
	mla	z13.s, p7/m, z17.s, z12.s
	mla	z13.s, p7/m, z18.s, z10.s
	mov	z10.s, #-88
	mla	z13.s, p7/m, z19.s, z29.s
	mla	z13.s, p7/m, z20.s, z15.s
	mla	z13.s, p7/m, z21.s, z3.s
	mla	z13.s, p7/m, z22.s, z10.s
	mov	z10.s, #54
	mla	z13.s, p7/m, z23.s, z5.s
	addvl	x0, sp, #4
	mla	z13.s, p7/m, z24.s, z8.s
	mla	z13.s, p7/m, z25.s, z14.s
	mla	z13.s, p7/m, z26.s, z10.s
	mov	z10.s, #-38
	mla	z13.s, p7/m, z27.s, z10.s
	mla	z13.s, p7/m, z28.s, z30.s
	mla	z13.s, p7/m, z4.s, z0.s
	add	x0, x0, 64
	mov	z8.s, #78
	str	z13, [x0]
	movprfx	z13, z6
	mul	z13.s, z13.s, #73
	mla	z13.s, p7/m, z7.s, z2.s
	mla	z13.s, p7/m, z16.s, z30.s
	mla	z13.s, p7/m, z17.s, z3.s
	mla	z13.s, p7/m, z18.s, z8.s
	mov	z8.s, #-88
	mad	z15.s, p7/m, z19.s, z13.s
	mov	z13.s, #82
	mla	z15.s, p7/m, z20.s, z10.s
	mov	z10.s, #61
	mla	z15.s, p7/m, z21.s, z30.s
	mla	z15.s, p7/m, z22.s, z9.s
	mla	z15.s, p7/m, z23.s, z13.s
	mla	z15.s, p7/m, z24.s, z10.s
	mla	z15.s, p7/m, z25.s, z0.s
	mla	z15.s, p7/m, z26.s, z8.s
	mla	z15.s, p7/m, z27.s, z1.s
	addvl	x0, sp, #5
	movprfx	z8, z15
	mla	z8.s, p7/m, z28.s, z29.s
	mov	z15.s, #54
	mla	z8.s, p7/m, z4.s, z15.s
	add	x0, x0, 64
	str	z8, [x0]
	mov	z8.s, #-54
	movprfx	z15, z6
	mul	z15.s, z15.s, #67
	mla	z15.s, p7/m, z7.s, z8.s
	mov	z8.s, #-78
	mla	z15.s, p7/m, z16.s, z8.s
	mla	z15.s, p7/m, z17.s, z11.s
	mad	z29.s, p7/m, z18.s, z15.s
	mov	z15.s, #4
	mla	z29.s, p7/m, z19.s, z3.s
	mla	z29.s, p7/m, z20.s, z30.s
	mla	z29.s, p7/m, z21.s, z15.s
	mov	z15.s, #13
	mla	z29.s, p7/m, z22.s, z14.s
	mla	z29.s, p7/m, z23.s, z15.s
	mov	z15.s, #-88
	addvl	x0, sp, #6
	mla	z29.s, p7/m, z24.s, z15.s
	mov	z8.s, #31
	mla	z29.s, p7/m, z25.s, z2.s
	mov	z15.s, #46
	mla	z29.s, p7/m, z26.s, z13.s
	mla	z29.s, p7/m, z27.s, z15.s
	mla	z29.s, p7/m, z28.s, z12.s
	mla	z29.s, p7/m, z4.s, z5.s
	add	x0, x0, 64
	str	z29, [x0]
	movprfx	z29, z6
	mul	z29.s, p7/m, z29.s, z10.s
	mla	z29.s, p7/m, z7.s, z12.s
	mla	z29.s, p7/m, z16.s, z0.s
	mla	z29.s, p7/m, z17.s, z13.s
	mla	z29.s, p7/m, z18.s, z8.s
	mov	z8.s, #-88
	mla	z29.s, p7/m, z19.s, z8.s
	mla	z29.s, p7/m, z20.s, z9.s
	mov	z8.s, #22
	mad	z14.s, p7/m, z21.s, z29.s
	mov	z13.s, #54
	mov	z12.s, #85
	movprfx	z29, z14
	mla	z29.s, p7/m, z1.s, z22.s
	addvl	x0, sp, #7
	mov	z14.s, #67
	mla	z29.s, p7/m, z23.s, z30.s
	mov	z30.s, #-78
	mla	z29.s, p7/m, z24.s, z8.s
	mov	z8.s, #-38
	mla	z29.s, p7/m, z25.s, z12.s
	mla	z29.s, p7/m, z26.s, z8.s
	mla	z29.s, p7/m, z27.s, z30.s
	mla	z29.s, p7/m, z28.s, z13.s
	mla	z29.s, p7/m, z4.s, z14.s
	movprfx	z15, z6
	mul	z15.s, p7/m, z15.s, z13.s
	add	x0, x0, 64
	str	z29, [x0]
	mov	z29.s, #-85
	mla	z15.s, p7/m, z7.s, z29.s
	mla	z15.s, p7/m, z16.s, z1.s
	mov	z1.s, #88
	mla	z15.s, p7/m, z17.s, z1.s
	mov	z1.s, #82
	mla	z15.s, p7/m, z18.s, z0.s
	mla	z15.s, p7/m, z19.s, z5.s
	mov	z5.s, #13
	mla	z15.s, p7/m, z20.s, z1.s
	mov	z1.s, #-90
	mla	z15.s, p7/m, z21.s, z5.s
	mov	z5.s, #90
	mla	z15.s, p7/m, z22.s, z1.s
	mla	z15.s, p7/m, z23.s, z11.s
	mla	z15.s, p7/m, z24.s, z14.s
	mla	z15.s, p7/m, z25.s, z30.s
	mla	z15.s, p7/m, z26.s, z3.s
	mla	z15.s, p7/m, z27.s, z5.s
	mla	z15.s, p7/m, z28.s, z2.s
	mov	z2.d, z15.d
	mov	z15.s, #-73
	addvl	x0, sp, #8
	mla	z2.s, p7/m, z4.s, z15.s
	movprfx	z15, z6
	mul	z15.s, z15.s, #46
	mla	z15.s, p7/m, z7.s, z1.s
	mla	z15.s, p7/m, z16.s, z11.s
	mov	z11.s, #31
	mla	z15.s, p7/m, z17.s, z13.s
	add	x0, x0, 64
	mla	z15.s, p7/m, z18.s, z1.s
	mla	z15.s, p7/m, z19.s, z11.s
	mov	z11.s, #-88
	mla	z15.s, p7/m, z20.s, z10.s
	mla	z15.s, p7/m, z21.s, z11.s
	str	z2, [x0]
	mov	z2.s, #22
	mla	z15.s, p7/m, z22.s, z2.s
	mla	z15.s, p7/m, z23.s, z14.s
	mov	z2.s, #-82
	mad	z29.s, p7/m, z24.s, z15.s
	mov	z15.s, #13
	mla	z29.s, p7/m, z25.s, z15.s
	addvl	x0, sp, #9
	mov	z15.s, #73
	mla	z29.s, p7/m, z26.s, z15.s
	mla	z29.s, p7/m, z27.s, z2.s
	mov	z2.s, #4
	mla	z29.s, p7/m, z28.s, z2.s
	add	x0, x0, 64
	mov	z2.d, z29.d
	mov	z29.s, #78
	mla	z2.s, p7/m, z4.s, z29.s
	str	z2, [x0]
	mov	z2.s, #-4
	movprfx	z29, z6
	mul	z29.s, z29.s, #38
	mla	z29.s, p7/m, z7.s, z11.s
	mla	z29.s, p7/m, z16.s, z15.s
	mla	z29.s, p7/m, z17.s, z2.s
	mov	z2.s, #-67
	mla	z29.s, p7/m, z18.s, z2.s
	mla	z29.s, p7/m, z19.s, z5.s
	mov	z2.s, #-31
	mla	z29.s, p7/m, z20.s, z0.s
	mla	z29.s, p7/m, z21.s, z2.s
	mla	z29.s, p7/m, z22.s, z12.s
	mla	z29.s, p7/m, z23.s, z30.s
	addvl	x0, sp, #10
	mov	z2.s, #13
	mad	z2.s, p7/m, z24.s, z29.s
	mov	z29.s, #22
	mla	z2.s, p7/m, z25.s, z10.s
	mla	z2.s, p7/m, z26.s, z1.s
	mla	z2.s, p7/m, z27.s, z13.s
	mla	z2.s, p7/m, z28.s, z29.s
	add	x0, x0, 64
	mov	z10.s, #-82
	movprfx	z29, z2
	mla	z29.s, p7/m, z4.s, z10.s
	mov	z2.s, #-61
	mov	z10.s, #4
	str	z29, [x0]
	addvl	x0, sp, #11
	movprfx	z29, z6
	mul	z29.s, z29.s, #31
	mla	z29.s, p7/m, z7.s, z30.s
	mla	z29.s, p7/m, z16.s, z5.s
	mla	z29.s, p7/m, z17.s, z2.s
	mov	z2.s, #82
	mla	z29.s, p7/m, z18.s, z10.s
	mla	z29.s, p7/m, z19.s, z13.s
	mla	z29.s, p7/m, z20.s, z11.s
	mla	z29.s, p7/m, z21.s, z2.s
	mla	z29.s, p7/m, z22.s, z8.s
	mla	z29.s, p7/m, z23.s, z3.s
	mla	z29.s, p7/m, z24.s, z15.s
	mla	z29.s, p7/m, z25.s, z1.s
	mla	z29.s, p7/m, z26.s, z14.s
	mla	z29.s, p7/m, z27.s, z9.s
	mov	z2.s, #-61
	movprfx	z10, z29
	mla	z10.s, p7/m, z28.s, z0.s
	add	x0, x0, 64
	mla	z10.s, p7/m, z4.s, z12.s
	movprfx	z29, z6
	mul	z29.s, z29.s, #22
	mov	z3.s, #-4
	mla	z29.s, p7/m, z7.s, z2.s
	mla	z29.s, p7/m, z16.s, z12.s
	mla	z29.s, p7/m, z17.s, z1.s
	mad	z15.s, p7/m, z18.s, z29.s
	mov	z29.s, #46
	mla	z15.s, p7/m, z19.s, z8.s
	mla	z15.s, p7/m, z20.s, z3.s
	mov	z3.s, #-31
	mad	z29.s, p7/m, z21.s, z15.s
	mla	z29.s, p7/m, z22.s, z30.s
	mla	z29.s, p7/m, z23.s, z5.s
	str	z10, [x0]
	addvl	x0, sp, #12
	mov	z10.s, #-82
	mla	z29.s, p7/m, z24.s, z10.s
	mla	z29.s, p7/m, z25.s, z13.s
	mla	z29.s, p7/m, z26.s, z9.s
	mla	z29.s, p7/m, z27.s, z3.s
	add	x0, x0, 64
	movprfx	z10, z29
	mla	z10.s, p7/m, z28.s, z14.s
	movprfx	z29, z6
	mul	z29.s, z29.s, #13
	mla	z10.s, p7/m, z4.s, z11.s
	mla	z29.s, p7/m, z7.s, z8.s
	mov	z8.s, #61
	mad	z8.s, p7/m, z16.s, z29.s
	mov	z29.s, #-73
	mad	z30.s, p7/m, z17.s, z8.s
	str	z10, [x0]
	addvl	x0, sp, #14
	mov	z10.s, #88
	mla	z30.s, p7/m, z18.s, z10.s
	mla	z30.s, p7/m, z19.s, z1.s
	mla	z30.s, p7/m, z20.s, z12.s
	mla	z30.s, p7/m, z21.s, z29.s
	mla	z30.s, p7/m, z22.s, z13.s
	mla	z30.s, p7/m, z23.s, z3.s
	mov	z8.d, z3.d
	mov	z15.s, #22
	add	x0, x0, 64
	lsl	z6.s, z6.s, #2
	mov	z3.s, #4
	mad	z7.s, p7/m, z9.s, z6.s
	mad	z3.s, p7/m, z24.s, z30.s
	mad	z16.s, p7/m, z15.s, z7.s
	mov	z30.s, #38
	mad	z17.s, p7/m, z8.s, z16.s
	mad	z18.s, p7/m, z30.s, z17.s
	mad	z19.s, p7/m, z0.s, z18.s
	mad	z20.s, p7/m, z13.s, z19.s
	ldr	z19, [x0]
	addvl	x0, sp, #16
	mla	z3.s, p7/m, z25.s, z15.s
	add	x0, x0, 64
	ldr	z16, [x0]
	mad	z21.s, p7/m, z2.s, z20.s
	addvl	x0, sp, #18
	mad	z22.s, p7/m, z14.s, z21.s
	mla	z3.s, p7/m, z26.s, z0.s
	add	x0, x0, 64
	ldr	z18, [x0]
	mad	z23.s, p7/m, z29.s, z22.s
	addvl	x0, sp, #20
	mla	z3.s, p7/m, z27.s, z14.s
	mov	z10.s, #-82
	add	x0, x0, 64
	ldr	z15, [x0]
	mla	z3.s, p7/m, z28.s, z10.s
	addvl	x0, sp, #22
	mov	z29.s, #78
	mad	z24.s, p7/m, z29.s, z23.s
	add	x0, x0, 64
	ldr	z8, [x0]
	mad	z25.s, p7/m, z10.s, z24.s
	addvl	x0, sp, #24
	mad	z26.s, p7/m, z12.s, z25.s
	mad	z27.s, p7/m, z11.s, z26.s
	add	x0, x0, 64
	ldr	z17, [x0]
	mad	z28.s, p7/m, z5.s, z27.s
	addvl	x0, sp, #26
	mov	z29.s, #-80
	mla	z3.s, p7/m, z4.s, z5.s
	add	x0, x0, 64
	ldr	z7, [x0]
	mad	z4.s, p7/m, z1.s, z28.s
	addvl	x0, sp, #28
	mov	z28.s, #57
	mov	z25.s, #-25
	movprfx	z20, z19
	mul	z20.s, p7/m, z20.s, z28.s
	add	x0, x0, 64
	mla	z20.s, p7/m, z16.s, z29.s
	mov	z30.s, #80
	mla	z20.s, p7/m, z18.s, z25.s
	mla	z20.s, p7/m, z15.s, z5.s
	ldr	z6, [x0]
	mov	z27.s, #43
	mov	z26.s, #70
	mov	z24.s, #87
	movprfx	z13, z19
	mul	z13.s, p7/m, z13.s, z5.s
	movprfx	z12, z19
	mul	z12.s, p7/m, z12.s, z24.s
	mla	z13.s, p7/m, z16.s, z24.s
	mla	z12.s, p7/m, z16.s, z28.s
	mla	z13.s, p7/m, z18.s, z30.s
	mov	z10.s, #-87
	mov	z30.s, #9
	mla	z13.s, p7/m, z15.s, z26.s
	mov	z22.s, #-70
	mla	z13.s, p7/m, z8.s, z28.s
	addvl	x0, sp, #15
	movprfx	z11, z19
	mul	z11.s, z11.s, #80
	mov	z9.s, #-9
	mla	z11.s, p7/m, z16.s, z30.s
	mad	z9.s, p7/m, z8.s, z20.s
	mla	z11.s, p7/m, z18.s, z22.s
	movprfx	z20, z19
	mul	z20.s, p7/m, z20.s, z27.s
	mla	z11.s, p7/m, z15.s, z10.s
	mla	z20.s, p7/m, z16.s, z1.s
	mla	z11.s, p7/m, z8.s, z25.s
	mla	z11.s, p7/m, z17.s, z28.s
	mad	z28.s, p7/m, z18.s, z20.s
	mla	z13.s, p7/m, z17.s, z27.s
	mla	z12.s, p7/m, z18.s, z30.s
	movprfx	z14, z19
	mul	z14.s, p7/m, z14.s, z26.s
	mov	z21.s, #25
	mov	z23.s, #-43
	mla	z13.s, p7/m, z7.s, z21.s
	mla	z12.s, p7/m, z15.s, z23.s
	mla	z14.s, p7/m, z16.s, z23.s
	mla	z12.s, p7/m, z8.s, z29.s
	mla	z14.s, p7/m, z18.s, z10.s
	mla	z12.s, p7/m, z17.s, z1.s
	mla	z14.s, p7/m, z15.s, z30.s
	mla	z12.s, p7/m, z7.s, z22.s
	mla	z14.s, p7/m, z8.s, z5.s
	add	x0, x0, 64
	mla	z14.s, p7/m, z17.s, z21.s
	mad	z21.s, p7/m, z15.s, z28.s
	movprfx	z28, z19
	mul	z28.s, z28.s, #25
	mad	z22.s, p7/m, z16.s, z28.s
	mla	z13.s, p7/m, z6.s, z30.s
	mla	z11.s, p7/m, z7.s, z5.s
	mla	z14.s, p7/m, z7.s, z29.s
	mla	z11.s, p7/m, z6.s, z27.s
	mov	z23.s, #-57
	mla	z9.s, p7/m, z17.s, z10.s
	mad	z5.s, p7/m, z18.s, z22.s
	mla	z9.s, p7/m, z7.s, z27.s
	mad	z10.s, p7/m, z8.s, z21.s
	mla	z5.s, p7/m, z15.s, z29.s
	mla	z10.s, p7/m, z17.s, z26.s
	mov	z22.d, z17.d
	mla	z10.s, p7/m, z7.s, z30.s
	mla	z5.s, p7/m, z8.s, z27.s
	mov	z17.d, z8.d
	mov	z20.d, z7.d
	movprfx	z8, z5
	mla	z8.s, p7/m, z22.s, z30.s
	movprfx	z30, z19
	mul	z30.s, z30.s, #9
	mla	z8.s, p7/m, z7.s, z23.s
	mla	z30.s, p7/m, z16.s, z25.s
	movprfx	z7, z30
	mla	z7.s, p7/m, z18.s, z27.s
	ldr	z27, [x0]
	addvl	x0, sp, #19
	mla	z9.s, p7/m, z6.s, z26.s
	add	x0, x0, 64
	mla	z7.s, p7/m, z15.s, z23.s
	mla	z7.s, p7/m, z17.s, z26.s
	ldr	z26, [x0]
	addvl	x0, sp, #23
	mla	z8.s, p7/m, z6.s, z24.s
	add	x0, x0, 64
	mla	z7.s, p7/m, z22.s, z29.s
	mla	z7.s, p7/m, z20.s, z24.s
	ldr	z24, [x0]
	addvl	x0, sp, #27
	mla	z10.s, p7/m, z6.s, z29.s
	add	x0, x0, 64
	mov	z29.s, #50
	mla	z14.s, p7/m, z6.s, z23.s
	ldr	z23, [x0]
	mov	z30.s, #75
	mov	z19.s, #-89
	addvl	x0, sp, #17
	movprfx	z22, z27
	mul	z22.s, z22.s, #89
	movprfx	z28, z27
	mul	z28.s, z28.s, #50
	mla	z22.s, p7/m, z26.s, z30.s
	mla	z28.s, p7/m, z26.s, z19.s
	mla	z22.s, p7/m, z24.s, z29.s
	mov	z29.s, #-18
	movprfx	z21, z27
	mul	z21.s, p7/m, z21.s, z30.s
	add	x0, x0, 64
	mla	z21.s, p7/m, z26.s, z29.s
	mov	z20.s, #18
	mla	z21.s, p7/m, z24.s, z19.s
	mla	z22.s, p7/m, z23.s, z20.s
	mov	z29.s, #-50
	mad	z20.s, p7/m, z24.s, z28.s
	mla	z21.s, p7/m, z23.s, z29.s
	movprfx	z28, z27
	mul	z28.s, z28.s, #18
	mad	z29.s, p7/m, z26.s, z28.s
	mla	z20.s, p7/m, z23.s, z30.s
	mad	z30.s, p7/m, z24.s, z29.s
	ldr	z29, [x0]
	addvl	x0, sp, #25
	mad	z19.s, p7/m, z23.s, z30.s
	movprfx	z30, z29
	mul	z30.s, z30.s, #83
	add	x0, x0, 64
	ldr	z28, [x0]
	mov	z27.s, #36
	addvl	x0, sp, #13
	mad	z27.s, p7/m, z28.s, z30.s
	movprfx	z30, z29
	mul	z30.s, z30.s, #36
	add	x0, x0, 64
	mov	z26.s, #-83
	mad	z26.s, p7/m, z28.s, z30.s
	ldr	z30, [x0]
	addvl	x0, sp, #21
	mla	z12.s, p7/m, z6.s, z25.s
	add	x0, x0, 64
	ldr	z25, [x0]
	lsl	z28.s, z30.s, #6
	addvl	x0, sp, #29
	mov	z29.s, #64
	mov	z30.s, #-64
	add	x0, x0, 64
	ldr	z2, [x0]
	mad	z30.s, p7/m, z25.s, z28.s
	add	x0, sp, 64
	mad	z29.s, p7/m, z25.s, z28.s
	add	z28.s, z29.s, z27.s
	add	z23.s, z28.s, z22.s
	sub	z28.s, z28.s, z22.s
	add	z22.s, z23.s, z13.s
	sub	z23.s, z23.s, z13.s
	ldr	z13, [x0]
	addvl	x0, sp, #13
	add	x0, x0, 64
	mla	z7.s, p7/m, z6.s, z1.s
	sub	z29.s, z29.s, z27.s
	add	z27.s, z30.s, z26.s
	add	z24.s, z27.s, z21.s
	sub	z27.s, z27.s, z21.s
	add	z21.s, z24.s, z12.s
	add	z6.s, z21.s, z13.s
	str	z6, [x0]
	addvl	x0, sp, #1
	sub	z30.s, z30.s, z26.s
	add	z26.s, z29.s, z19.s
	add	x0, x0, 64
	sub	z29.s, z29.s, z19.s
	add	z19.s, z26.s, z14.s
	sub	z26.s, z26.s, z14.s
	ldr	z14, [x0]
	addvl	x0, sp, #2
	add	x0, x0, 64
	sub	z24.s, z24.s, z12.s
	ldr	z12, [x0]
	addvl	x0, sp, #14
	add	z5.s, z19.s, z12.s
	add	z25.s, z30.s, z20.s
	add	x0, x0, 64
	str	z5, [x0]
	sub	z30.s, z30.s, z20.s
	addvl	x0, sp, #3
	add	z20.s, z25.s, z11.s
	sub	z25.s, z25.s, z11.s
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z18.s, z29.s, z9.s
	addvl	x0, sp, #15
	sub	z29.s, z29.s, z9.s
	add	z9.s, z18.s, z11.s
	add	x0, x0, 64
	str	z9, [x0]
	add	z17.s, z30.s, z10.s
	addvl	x0, sp, #4
	sub	z30.s, z30.s, z10.s
	add	z15.s, z28.s, z7.s
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z28.s, z28.s, z7.s
	addvl	x0, sp, #16
	add	z7.s, z17.s, z10.s
	add	z16.s, z27.s, z8.s
	add	x0, x0, 64
	str	z7, [x0]
	sub	z27.s, z27.s, z8.s
	addvl	x0, sp, #5
	add	z1.s, z20.s, z14.s
	add	z0.s, z22.s, z2.s
	add	x0, x0, 64
	ldr	z8, [x0]
	add	z5.s, z16.s, z8.s
	addvl	x0, sp, #6
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z6.s, z15.s, z9.s
	addvl	x0, sp, #7
	sunpklo	z0.s, z0.h
	sqrshrnb	z1.h, z1.s, #12
	add	x0, x0, 64
	ldr	z7, [x0]
	add	z7.s, z28.s, z7.s
	addvl	x0, sp, #8
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	add	x0, x0, 64
	ldr	z14, [x0]
	add	z8.s, z27.s, z14.s
	addvl	x0, sp, #9
	sub	z22.s, z22.s, z2.s
	sqrshrnb	z5.h, z5.s, #12
	add	x0, x0, 64
	ldr	z12, [x0]
	add	z9.s, z30.s, z12.s
	addvl	x0, sp, #10
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x0, x0, 64
	ldr	z14, [x0]
	add	z10.s, z29.s, z14.s
	addvl	x0, sp, #11
	add	z14.s, z23.s, z4.s
	sub	z23.s, z23.s, z4.s
	add	x0, x0, 64
	ldr	z11, [x0]
	add	z11.s, z26.s, z11.s
	addvl	x0, sp, #12
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z12.s, z25.s, z13.s
	add	z13.s, z24.s, z3.s
	sub	z24.s, z24.s, z3.s
	ldr	z3, [x0]
	addvl	x0, sp, #11
	sub	z25.s, z25.s, z3.s
	sunpklo	z6.s, z6.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z26.s, z26.s, z4.s
	addvl	x0, sp, #10
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z29.s, z29.s, z4.s
	addvl	x0, sp, #9
	sunpklo	z7.s, z7.h
	sqrshrnb	z8.h, z8.s, #12
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z30.s, z30.s, z3.s
	addvl	x0, sp, #8
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z27.s, z27.s, z4.s
	addvl	x0, sp, #7
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z28.s, z28.s, z3.s
	addvl	x0, sp, #6
	sunpklo	z9.s, z9.h
	sqrshrnb	z10.h, z10.s, #12
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z15.s, z15.s, z4.s
	addvl	x0, sp, #5
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z16.s, z16.s, z3.s
	addvl	x0, sp, #4
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z17.s, z17.s, z4.s
	addvl	x0, sp, #3
	sunpklo	z11.s, z11.h
	sqrshrnb	z12.h, z12.s, #12
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z18.s, z18.s, z3.s
	addvl	x0, sp, #2
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sub	z19.s, z19.s, z4.s
	addvl	x0, sp, #1
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 64
	ldr	z3, [x0]
	sub	z20.s, z20.s, z3.s
	add	x0, sp, 64
	ldr	z4, [x0]
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	addvl	x0, sp, #13
	sub	z21.s, z21.s, z4.s
	sunpklo	z13.s, z13.h
	add	x0, x0, 64
	ldr	z4, [x0]
	sqrshrnb	z0.h, z4.s, #12
	lsl	x0, x2, 4
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x0, x0, 2
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	add	x3, x1, x0
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z14.s, z14.h
	add	x3, x0, 2
	sqrshrnb	z23.h, z23.s, #12
	uzp1	z23.h, z23.h, z23.h
	add	x3, x1, x3
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z23.s, z23.h
	addvl	x3, sp, #14
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	add	x3, x3, 64
	ldr	z4, [x3]
	sqrshrnb	z2.h, z4.s, #12
	add	x3, x0, 4
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	add	x3, x1, x3
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z24.s, z24.h
	addvl	x3, sp, #15
	sqrshrnb	z25.h, z25.s, #12
	uzp1	z25.h, z25.h, z25.h
	add	x3, x3, 64
	ldr	z4, [x3]
	sqrshrnb	z3.h, z4.s, #12
	add	x3, x0, 6
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	add	x3, x1, x3
	st1h	z3.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z25.s, z25.h
	addvl	x3, sp, #16
	sqrshrnb	z26.h, z26.s, #12
	uzp1	z26.h, z26.h, z26.h
	add	x3, x3, 64
	ldr	z4, [x3]
	sqrshrnb	z4.h, z4.s, #12
	add	x3, x0, 8
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	add	x3, x1, x3
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z26.s, z26.h
	add	x3, x0, 10
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	add	x3, x1, x3
	st1h	z5.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z29.s, z29.h
	add	x3, x0, 12
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	add	x3, x1, x3
	st1h	z6.s, p6, [x3, z31.s, sxtw 1]
	sunpklo	z30.s, z30.h
	add	x3, x0, 14
	add	x2, x1, x2, lsl 4
	sqrshrnb	z27.h, z27.s, #12
	add	x3, x1, x3
	st1h	z7.s, p6, [x3, z31.s, sxtw 1]
	uzp1	z27.h, z27.h, z27.h
	add	x3, x0, 16
	sunpklo	z27.s, z27.h
	add	x2, x2, 48
	add	x3, x1, x3
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z28.h, z28.s, #12
	add	x3, x0, 18
	uzp1	z28.h, z28.h, z28.h
	sunpklo	z28.s, z28.h
	add	x3, x1, x3
	st1h	z9.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z15.h, z15.s, #12
	add	x3, x0, 20
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	add	x3, x1, x3
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z16.h, z16.s, #12
	add	x3, x0, 22
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x3, x1, x3
	st1h	z11.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z17.h, z17.s, #12
	add	x3, x0, 24
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	add	x3, x1, x3
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z18.h, z18.s, #12
	add	x3, x0, 26
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, x1, x3
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z19.h, z19.s, #12
	add	x3, x0, 28
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	add	x3, x1, x3
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z20.h, z20.s, #12
	add	x3, x0, 30
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	add	x3, x1, x3
	st1h	z23.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z21.h, z21.s, #12
	add	x3, x0, 32
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x3, x1, x3
	st1h	z24.s, p6, [x3, z31.s, sxtw 1]
	sqrshrnb	z22.h, z22.s, #12
	add	x3, x0, 34
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z22.s, z22.h
	add	x3, x1, x3
	st1h	z25.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 36
	add	x3, x1, x3
	st1h	z26.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 38
	add	x3, x1, x3
	st1h	z29.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 40
	add	x3, x1, x3
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 42
	add	x3, x1, x3
	st1h	z27.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 44
	add	x3, x1, x3
	st1h	z28.s, p6, [x3, z31.s, sxtw 1]
	st1h	z15.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 48
	add	x2, x1, x2
	st1h	z16.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 50
	add	x2, x1, x2
	st1h	z17.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 52
	add	x2, x1, x2
	st1h	z18.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 54
	add	x2, x1, x2
	st1h	z19.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 56
	add	x2, x1, x2
	st1h	z20.s, p6, [x2, z31.s, sxtw 1]
	add	x2, x0, 58
	add	x0, x0, 60
	add	x2, x1, x2
	st1h	z21.s, p6, [x2, z31.s, sxtw 1]
	add	x1, x1, x0
	st1h	z22.s, p6, [x1, z31.s, sxtw 1]
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
	addvl	sp, sp, #31
	.cfi_def_cfa_offset 2112
	add	sp, sp, 2112
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	dynopt_idct32_sve2_shared, .-dynopt_idct32_sve2_shared
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
