	.arch armv9.4-a+crc
	.file	"sdot_scalar_sve2p1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB5:
	.cfi_startproc
	mov	x13, 95
	cntb	x12, all, mul #2
	add	x3, x0, 64
	mul	x12, x12, x13
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0xf0,0x5,0x1e,0x22
	sub	sp, sp, #3136
	.cfi_escape 0xf,0xd,0x8f,0,0x92,0x2e,0,0xa,0xf0,0x5,0x1e,0x23,0xc0,0x18,0x22
	stp	d8, d9, [sp]
	stp	d10, d11, [sp, 16]
	stp	d12, d13, [sp, 32]
	stp	d14, d15, [sp, 48]
	.cfi_escape 0x10,0x48,0x2,0x8f,0
	.cfi_escape 0x10,0x49,0x2,0x8f,0x8
	.cfi_escape 0x10,0x4a,0x2,0x8f,0x10
	.cfi_escape 0x10,0x4b,0x2,0x8f,0x18
	.cfi_escape 0x10,0x4c,0x2,0x8f,0x20
	.cfi_escape 0x10,0x4d,0x2,0x8f,0x28
	.cfi_escape 0x10,0x4e,0x2,0x8f,0x30
	.cfi_escape 0x10,0x4f,0x2,0x8f,0x38
	ldr	z8, [x3]
	add	x3, x0, 192
	ldr	z31, [x3]
	add	x3, x0, 320
	ldr	z9, [x3]
	add	x3, x0, 448
	zip1	z8.h, z8.h, z31.h
	ldr	z31, [x3]
	add	x3, x0, 576
	ldr	z10, [x3]
	zip1	z9.h, z9.h, z31.h
	add	x3, x0, 704
	ldr	z31, [x3]
	zip1	z10.h, z10.h, z31.h
	add	x3, x0, 832
	ldr	z11, [x3]
	add	x3, x0, 960
	ldr	z31, [x3]
	zip1	z11.h, z11.h, z31.h
	add	x3, x0, 1088
	ldr	z12, [x3]
	add	x3, x0, 1216
	ldr	z31, [x3]
	zip1	z12.h, z12.h, z31.h
	add	x3, x0, 1344
	ldr	z13, [x3]
	add	x3, x0, 1472
	ldr	z31, [x3]
	zip1	z31.h, z13.h, z31.h
	add	x3, sp, 64
	str	z31, [x3]
	add	x3, x0, 1600
	ldr	z14, [x3]
	add	x3, x0, 1728
	ldr	z31, [x3]
	zip1	z31.h, z14.h, z31.h
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	add	x3, x0, 1856
	ldr	z15, [x3]
	add	x3, x0, 1984
	ldr	z31, [x3]
	zip1	z28.h, z15.h, z31.h
	adrp	x3, _ZL6CDOT_O
	movi	d31, #0
	add	x3, x3, :lo12:_ZL6CDOT_O
	ldr	z0, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 32
	ldr	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 64
	ldr	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z2.h
// 0 "" 2
#NO_APP
	add	x4, x3, 96
	ldr	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 128
	ldr	z4, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x3, 160
	ldr	z5, [x4]
	add	x4, sp, 64
	ldr	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z29.h, z5.h
// 0 "" 2
#NO_APP
	add	x4, x3, 192
	ldr	z6, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z29.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 224
	ldr	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 256
	ldr	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 288
	ldr	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 320
	ldr	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z18.h
// 0 "" 2
#NO_APP
	add	x4, x3, 352
	ldr	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x3, 384
	ldr	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 416
	ldr	z21, [x4]
	add	x4, sp, 64
	ldr	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x3, 448
	ldr	z22, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z29, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	add	x4, x3, 480
	ldr	z23, [x4]
	mov	z29.d, z30.d
	mov	z14.d, z28.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z29.s, z28.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z30.d, z31.d
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z29, [x4]
	add	x4, x3, 512
	ldr	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 544
	ldr	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x4, x3, 576
	ldr	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z26.h
// 0 "" 2
#NO_APP
	add	x4, x3, 608
	ldr	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	add	x4, x3, 640
	ldr	z28, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	add	x4, x3, 672
	ldr	z29, [x4]
	add	x4, sp, 64
	ldr	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	add	x4, x3, 704
	ldr	z15, [x4]
	addvl	x4, sp, #2
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 736
	ldr	z15, [x4]
	addvl	x4, sp, #3
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 768
	ldr	z15, [x4]
	addvl	x4, sp, #4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 800
	ldr	z15, [x4]
	addvl	x4, sp, #5
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 832
	ldr	z15, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 864
	ldr	z15, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
	ldr	z15, [x4]
	addvl	x4, sp, #8
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 928
	ldr	z15, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 960
	ldr	z15, [x4]
	addvl	x4, sp, #10
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 992
	ldr	z15, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x6, x5, 3
	add	x5, x5, x6
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 1024
	ldr	z15, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1056
	ldr	z15, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1088
	ldr	z15, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1120
	ldr	z15, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1152
	ldr	z15, [x4]
	addvl	x4, sp, #16
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1184
	ldr	z15, [x4]
	addvl	x4, sp, #17
	add	x4, x4, 64
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1216
	ldr	z15, [x4]
	addvl	x4, sp, #18
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1248
	ldr	z15, [x4]
	addvl	x4, sp, #19
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	lsl	x5, x5, 3
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 1280
	ldr	z15, [x4]
	addvl	x4, sp, #20
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1312
	ldr	z15, [x4]
	addvl	x4, sp, #21
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1344
	ldr	z15, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1376
	ldr	z15, [x4]
	addvl	x4, sp, #23
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1408
	ldr	z15, [x4]
	addvl	x4, sp, #24
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1440
	ldr	z15, [x4]
	addvl	x4, sp, #25
	add	x4, x4, 64
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1472
	ldr	z15, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1504
	ldr	z15, [x4]
	addvl	x4, sp, #27
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 1536
	ldr	z15, [x4]
	addvl	x4, sp, #28
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1568
	ldr	z15, [x4]
	addvl	x4, sp, #29
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1600
	ldr	z15, [x4]
	addvl	x4, sp, #30
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1632
	ldr	z15, [x4]
	addvl	x4, sp, #31
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1664
	ldr	z15, [x4]
	cntb	x4
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 1696
	ldr	z15, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1728
	ldr	z15, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 1760
	ldr	z15, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 1792
	ldr	z15, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1824
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1856
	ldr	z15, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1888
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1920
	ldr	z15, [x4]
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1952
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1984
	ldr	z15, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 2016
	ldr	z15, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 2048
	ldr	z15, [x4]
	cntb	x4, all, mul #11
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2080
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2112
	ldr	z15, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 2144
	ldr	z15, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2176
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 2208
	ldr	z15, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2240
	ldr	z15, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2272
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 2304
	ldr	z15, [x4]
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 2336
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2368
	ldr	z15, [x4]
	rdvl	x4, #27
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2400
	ldr	z15, [x4]
	cntb	x4, all, mul #11
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2432
	ldr	z15, [x4]
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 2464
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2496
	ldr	z15, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 2528
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 2560
	ldr	z15, [x4]
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 2592
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2624
	ldr	z15, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2656
	ldr	z15, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2688
	ldr	z15, [x4]
	cntb	x4
	lsl	x4, x4, 6
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2720
	ldr	z15, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2752
	ldr	z15, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2784
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 2816
	ldr	z15, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2848
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2880
	ldr	z15, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2912
	ldr	z15, [x4]
	addvl	x4, x6, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2944
	ldr	z15, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2976
	ldr	z15, [x4]
	addvl	x4, x6, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 3008
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3040
	ldr	z15, [x4]
	cntb	x4, all, mul #5
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 3072
	ldr	z15, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	add	x4, x3, 3104
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 3136
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 3168
	ldr	z15, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3200
	ldr	z15, [x4]
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3232
	ldr	z15, [x4]
	addvl	x4, x6, #9
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 3264
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 3296
	ldr	z15, [x4]
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	lsl	x5, x5, 2
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 3328
	ldr	z15, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3360
	ldr	z15, [x4]
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 3392
	ldr	z15, [x4]
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 3424
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3456
	ldr	z15, [x4]
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 3488
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3520
	ldr	z15, [x4]
	cntb	x4, all, mul #6
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3552
	ldr	z15, [x4]
	cntb	x4, all, mul #13
	lsl	x5, x4, 3
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 3584
	ldr	z15, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3616
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 5
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3648
	ldr	z15, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3680
	ldr	z15, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3712
	ldr	z15, [x4]
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3744
	ldr	z15, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3776
	ldr	z15, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3808
	ldr	z15, [x4]
	mov	z13.d, z14.d
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 3840
	ldr	z15, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	add	x4, x3, 3872
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3904
	ldr	z15, [x4]
	cntb	x4, all, mul #6
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3936
	ldr	z15, [x4]
	add	x5, x5, x5, lsl 4
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3968
	ldr	z15, [x4]
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 4000
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	add	x4, sp, 64
	ldr	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	add	x4, x3, 4032
	ldr	z15, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	ldr	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	add	x3, x3, 4064
	ldr	z15, [x3]
	lsl	x4, x4, 2
	mov	z14.d, z30.d
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z13.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	lsl	x4, x4, 4
	addvl	x3, x4, #-4
	rdvl	x4, #27
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	str	z14, [x3]
	add	x4, sp, x4
	add	x3, x0, 128
	ldr	z12, [x3]
	add	x4, x4, 64
	add	x3, x0, 384
	ldr	z30, [x3]
	zip1	z12.h, z12.h, z30.h
	add	x3, x0, 640
	ldr	z13, [x3]
	add	x3, x0, 896
	ldr	z30, [x3]
	zip1	z13.h, z13.h, z30.h
	add	x3, x0, 1152
	ldr	z14, [x3]
	add	x3, x0, 1408
	ldr	z30, [x3]
	zip1	z14.h, z14.h, z30.h
	add	x3, x0, 1664
	ldr	z15, [x3]
	add	x3, x0, 1920
	ldr	z30, [x3]
	zip1	z15.h, z15.h, z30.h
	adrp	x3, .LANCHOR0
	mov	z30.d, z31.d
	add	x3, x3, :lo12:.LANCHOR0
	ldr	z11, [x3]
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	add	x4, x3, 32
	ldr	z11, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 64
	ldr	z11, [x4]
	rdvl	x4, #22
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 96
	ldr	z10, [x4]
	lsl	x5, x5, 4
	mov	z11.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
	add	x4, x3, 128
	ldr	z9, [x4]
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 160
	ldr	z9, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	add	x4, x3, 192
	ldr	z9, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 224
	ldr	z8, [x4]
	mov	z9.d, z30.d
	rdvl	x4, #23
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
	add	x4, x3, 256
	ldr	z8, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 288
	ldr	z8, [x4]
	cntb	x4, all, mul #13
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 320
	ldr	z8, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 352
	ldr	z10, [x4]
	mov	z8.d, z30.d
	cntb	x4, all, mul #7
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
	add	x4, x3, 384
	ldr	z11, [x4]
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 416
	ldr	z11, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 448
	ldr	z11, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 480
	ldr	z10, [x4]
	lsl	x5, x5, 5
	mov	z11.d, z30.d
	decb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
	add	x4, x3, 512
	ldr	z9, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 544
	ldr	z9, [x4]
	rdvl	x4, #25
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 576
	ldr	z9, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 608
	ldr	z8, [x4]
	lsl	x5, x5, 7
	mov	z9.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
	add	x4, x3, 640
	ldr	z8, [x4]
	cntb	x4
	lsl	x4, x4, 7
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 672
	ldr	z8, [x4]
	lsl	x5, x5, 7
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 704
	ldr	z8, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 736
	ldr	z8, [x4]
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	lsl	x5, x4, 4
	sub	x4, x5, x4
	cntb	x5, all, mul #4
	add	x4, x4, 64
	lsl	x5, x5, 5
	add	x4, sp, x4
	str	z30, [x4]
	mov	z30.d, z31.d
	add	x4, x3, 768
	ldr	z8, [x4]
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 800
	ldr	z8, [x4]
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 832
	ldr	z8, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 864
	ldr	z8, [x4]
	lsl	x5, x5, 3
	mov	z9.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
	ldr	z8, [x4]
	mov	z30.d, z31.d
	rdvl	x4, #17
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 928
	ldr	z8, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 960
	ldr	z13, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 992
	ldr	z13, [x4]
	lsl	x5, x5, 2
	mov	z8.d, z30.d
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x0, 256
	ldr	z30, [x4]
	lsl	x5, x5, 4
	add	x4, x0, 768
	ldr	z15, [x4]
	incb	x5, all, mul #4
	add	x4, x0, 1280
	zip1	z14.h, z30.h, z15.h
	ldr	z30, [x4]
	add	x4, x0, 1792
	ldr	z15, [x4]
	lsl	x5, x5, 1
	add	x4, x3, 1024
	ldr	z13, [x4]
	addvl	x4, x5, #4
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 1056
	ldr	z13, [x4]
	lsl	x5, x5, 1
	mov	z12.d, z13.d
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
	mov	z13.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 1088
	mov	z10.d, z13.d
	lsl	x5, x5, 3
	ldr	z13, [x4]
	mov	z30.d, z31.d
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1120
	ldr	z13, [x4]
	lsl	x5, x5, 4
	mov	z12.d, z13.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
	mov	z13.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z30.d, z31.d
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
	add	x4, x3, 1152
	ldr	z13, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1184
	ldr	z12, [x4]
	lsl	x5, x5, 4
	mov	z13.d, z30.d
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	rdvl	x5, #18
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	lsl	x5, x5, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z13, [x4]
	add	x4, x3, 1216
	ldr	z12, [x4]
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1248
	ldr	z12, [x4]
	lsl	x5, x5, 3
	mov	z14.d, z30.d
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x0, 512
	ldr	z30, [x4]
	lsl	x5, x5, 3
	add	x4, x0, 1536
	ldr	z15, [x4]
	incb	x5, all, mul #4
	add	x4, x3, 1280
	zip1	z30.h, z30.h, z15.h
	ldr	z15, [x4]
	mov	z13.d, z31.d
	lsl	x5, x5, 2
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1312
	ldr	z15, [x4]
	lsl	x5, x5, 2
	mov	z12.d, z31.d
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x0, 1024
	ldr	z15, [x4]
	ldr	z30, [x0]
	add	x4, x3, 1344
	zip1	z30.h, z30.h, z15.h
	ldr	z15, [x4]
	cntb	x4, all, mul #10
	mov	z11.d, z31.d
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	add	x3, x3, 1376
	ldr	z15, [x3]
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	z15.s, z11.s, z13.s
	add	x3, sp, 64
	sub	z30.s, z31.s, z12.s
	str	z15, [x3]
	add	z15.s, z31.s, z12.s
	ldr	z12, [x3]
	addvl	x3, sp, #1
	add	z12.s, z12.s, z10.s
	sub	z11.s, z11.s, z13.s
	add	x3, x3, 64
	str	z12, [x3]
	cntb	x4, all, mul #11
	cntb	x3, all, mul #9
	lsl	x4, x4, 4
	add	x3, x3, x3, lsl 4
	mov	x7, 0
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
	add	z31.s, z15.s, z13.s
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z12.s, z30.s, z13.s
	str	z12, [x3]
	cntb	x3, all, mul #9
	add	z12.s, z11.s, z14.s
	add	x3, x3, x3, lsl 4
	sub	z11.s, z11.s, z14.s
	sub	z30.s, z30.s, z13.s
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z15.s, z15.s, z14.s
	add	x3, sp, 64
	ldr	z14, [x3]
	sub	z14.s, z14.s, z10.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z13, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z10, [x3]
	add	z13.s, z13.s, z10.s
	add	x3, sp, 64
	str	z13, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
	add	z10.s, z31.s, z10.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z10, [x3]
	incb	x4, all, mul #2
	rdvl	x3, #19
	lsl	x3, x3, 3
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z13.s, z13.s, z10.s
	addvl	x3, x4, #2
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z13, [x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
	add	z13.s, z12.s, z10.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z13, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z10, [x3]
	add	z10.s, z11.s, z10.s
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	add	z10.s, z15.s, z9.s
	cntb	x3, all, mul #12
	sub	z9.s, z15.s, z9.s
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	ldr	z13, [x3]
	add	z13.s, z30.s, z13.s
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z13, [x3]
	add	z13.s, z14.s, z8.s
	addvl	x3, x5, #-2
	sub	z8.s, z14.s, z8.s
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z10.s, z30.s, z15.s
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z11.s, z11.s, z14.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z15, [x3]
	sub	z14.s, z12.s, z15.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z15, [x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z15.s, z30.s, z15.s
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	sub	z31.s, z31.s, z13.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z12, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z13, [x3]
	sub	z30.s, z12.s, z13.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z30, [x3]
	add	x3, sp, 64
	ldr	z12, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z13.s, z12.s, z13.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z12, [x3]
	incb	x4, all, mul #2
	rdvl	x3, #19
	add	z12.s, z30.s, z12.s
	lsl	x3, x3, 3
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z12, [x3]
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z12, [x3]
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z12.s, z12.s, z30.s
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z12, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z12.s, z12.s, z30.s
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z12, [x3]
	addvl	x3, x4, #-4
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, x4, #4
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z12.s, z12.s, z30.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z12, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z12.s, z30.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z12.s, z30.s
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z12.s, z30.s
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x5, x4, 4
	add	x3, sp, x3
	str	z30, [x3]
	sub	x4, x5, x4
	rdvl	x3, #21
	lsl	x3, x3, 3
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	add	z30.s, z8.s, z30.s
	addvl	x3, x4, #1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z9.s, z30.s
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	mov	x4, 183
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z10.s, z30.s
	cntb	x3
	mul	x3, x3, x4
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z30, [x3]
	rdvl	x3, #19
	lsl	x4, x4, 1
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z12.s, z11.s, z30.s
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z12, [x3]
	addvl	x3, x4, #4
	cntb	x4, all, mul #9
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z14.s, z30.s
	addvl	x3, x4, #1
	rdvl	x4, #21
	lsl	x4, x4, 1
	add	x3, x3, x3, lsl 2
	incb	x4
	add	x3, x3, 64
	add	x3, sp, x3
	lsl	x4, x4, 2
	str	z30, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z30.s, z15.s, z30.s
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z30, [x3]
	add	z12.s, z31.s, z30.s
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z12, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z30, [x3]
	add	z30.s, z30.s, z12.s
	addvl	x3, x4, #-4
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z30.s, z30.s, z12.s
	addvl	x3, x4, #-2
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	incb	x4
	ldr	z12, [x3]
	addvl	x3, sp, #1
	sub	z31.s, z31.s, z12.s
	add	x3, x3, 64
	lsl	x4, x4, 2
	str	z31, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z15.s, z15.s, z31.s
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z14.s, z14.s, z31.s
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z11.s, z11.s, z31.s
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z10.s, z10.s, z31.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z9.s, z9.s, z31.s
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z8.s, z8.s, z31.s
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z31.s, z12.s, z31.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z31.s, z12.s, z31.s
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z31, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	decb	x4
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z31.s, z12.s, z31.s
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #-4
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, x4, #4
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z12.s, z12.s, z31.s
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z12, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z12.s, z12.s, z31.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	str	z12, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z12, [x3]
	incb	x4, all, mul #2
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z12.s, z12.s, z31.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z12, [x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z31.s, z12.s, z31.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	add	x3, sp, 64
	ldr	z12, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z12.s, z12.s, z31.s
	add	x3, sp, 64
	str	z12, [x3]
	sqrshrnb	z31.h, z13.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 96
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z12.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 128
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
	sqrshrnb	z31.h, z12.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 160
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z12.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	rdvl	x4, #22
	add	x3, x3, 192
	lsl	x4, x4, 3
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 224
	incb	x4
	lsl	x4, x4, 1
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 256
	str	q31, [sp, x3]
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x5, x4, 4
	add	x3, x3, 288
	sub	x4, x5, x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 320
	str	q31, [sp, x3]
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x4, 183
	add	x3, x3, 352
	str	q31, [sp, x3]
	cntb	x3
	mul	x3, x3, x4
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 384
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
	sqrshrnb	z31.h, z12.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 416
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, x3, lsl 2
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 448
	str	q31, [sp, x3]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 480
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
	sqrshrnb	z31.h, z12.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 512
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 544
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z30.s, #7
	add	x3, x3, 576
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 608
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z15.s, #7
	add	x3, x3, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z14.s, #7
	add	x3, x3, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z11.s, #7
	add	x3, x3, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z10.s, #7
	add	x3, x3, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z9.s, #7
	add	x3, x3, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z8.s, #7
	add	x3, x3, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	add	x3, x3, 832
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 864
	decb	x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	rdvl	x4, #20
	sqrshrnb	z31.h, z31.s, #7
	add	x3, x3, 896
	lsl	x4, x4, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z12, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z12.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	add	x3, x3, 928
	str	q31, [sp, x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z12, [x3]
	sqrshrnb	z31.h, z12.s, #7
	addvl	x3, x4, #-2
	rdvl	x4, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x4, 1
	add	x3, x3, 960
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z12, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z12.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 992
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1024
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	add	x3, sp, 64
	ldr	z12, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z12.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1056
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x6, sp, x3
	addvl	x3, x4, #-2
	add	x3, x3, 1088
	add	x5, sp, x3
	.p2align 5,,15
.L2:
	mov	x3, 0
	.p2align 5,,15
.L3:
	ubfiz	x4, x3, 5, 32
	ldrh	w4, [x6, x4]
	strh	w4, [x5, x3, lsl 1]
	add	x3, x3, 1
	cmp	x3, 32
	bne	.L3
	add	x7, x7, 32
	add	x6, x6, 2
	add	x5, x5, 64
	cmp	x7, 256
	bne	.L2
	add	x3, x0, 80
	ldr	z8, [x3]
	add	x3, x0, 208
	ldr	z31, [x3]
	zip1	z8.h, z8.h, z31.h
	add	x3, x0, 336
	ldr	z9, [x3]
	add	x3, x0, 464
	ldr	z31, [x3]
	zip1	z9.h, z9.h, z31.h
	add	x3, x0, 592
	ldr	z10, [x3]
	add	x3, x0, 720
	ldr	z31, [x3]
	zip1	z31.h, z10.h, z31.h
	add	x3, sp, 64
	str	z31, [x3]
	add	x3, x0, 848
	ldr	z11, [x3]
	add	x3, x0, 976
	ldr	z31, [x3]
	zip1	z11.h, z11.h, z31.h
	add	x3, x0, 1104
	ldr	z12, [x3]
	add	x3, x0, 1232
	ldr	z31, [x3]
	zip1	z12.h, z12.h, z31.h
	add	x3, x0, 1360
	ldr	z13, [x3]
	add	x3, x0, 1488
	ldr	z31, [x3]
	zip1	z13.h, z13.h, z31.h
	add	x3, x0, 1616
	ldr	z14, [x3]
	add	x3, x0, 1744
	ldr	z31, [x3]
	zip1	z14.h, z14.h, z31.h
	add	x3, x0, 1872
	ldr	z15, [x3]
	add	x3, x0, 2000
	ldr	z31, [x3]
	zip1	z31.h, z15.h, z31.h
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x5, x4, 3
	add	x4, x4, x5
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 2
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	mov	z11.d, z30.d
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	lsl	x4, x4, 4
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z11, [x3]
	add	x3, x0, 144
	ldr	z12, [x3]
	add	x3, x0, 400
	ldr	z30, [x3]
	zip1	z12.h, z12.h, z30.h
	add	x3, x0, 656
	ldr	z13, [x3]
	add	x3, x0, 912
	ldr	z30, [x3]
	zip1	z13.h, z13.h, z30.h
	add	x3, x0, 1168
	ldr	z14, [x3]
	add	x3, x0, 1424
	ldr	z30, [x3]
	zip1	z14.h, z14.h, z30.h
	add	x3, x0, 1680
	ldr	z15, [x3]
	add	x3, x0, 1936
	ldr	z30, [x3]
	zip1	z15.h, z15.h, z30.h
	rdvl	x3, #27
	mov	z30.d, z31.d
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	mov	z10.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z10, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	mov	z8.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z8, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z9.d, z30.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z9, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z11.d, z30.d
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	str	z11, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	cntb	x3
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z8.d, z30.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 272
	ldr	z30, [x3]
	lsl	x4, x4, 4
	add	x3, x0, 784
	ldr	z15, [x3]
	incb	x4, all, mul #4
	add	x3, x0, 1296
	zip1	z14.h, z30.h, z15.h
	ldr	z30, [x3]
	add	x3, x0, 1808
	ldr	z15, [x3]
	lsl	x4, x4, 1
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z13.d, z30.d
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z13.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z30.d, z31.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z30.d, z31.d
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z12, [x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z14.d, z30.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 528
	ldr	z30, [x3]
	lsl	x4, x4, 3
	add	x3, x0, 1552
	ldr	z15, [x3]
	incb	x4, all, mul #4
	zip1	z30.h, z30.h, z15.h
	mov	z13.d, z31.d
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z31.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 16
	ldr	z30, [x3]
	mov	z11.d, z31.d
	add	x3, x0, 1040
	ldr	z15, [x3]
	zip1	z30.h, z30.h, z15.h
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x3]
	ldr	z13, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	rdvl	x4, #18
	add	z12.s, z11.s, z14.s
	add	x3, x3, 64
	lsl	x4, x4, 1
	sub	z11.s, z11.s, z14.s
	add	x3, sp, x3
	ldr	z31, [x3]
	incb	x4, all, mul #2
	rdvl	x3, #19
	add	z13.s, z15.s, z31.s
	lsl	x3, x3, 3
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z13, [x3]
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	ldr	z13, [x3]
	cntb	x3, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z15.s, z15.s, z14.s
	add	x3, sp, 64
	ldr	z14, [x3]
	sub	z14.s, z14.s, z9.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z31, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	add	z31.s, z31.s, z9.s
	add	x3, sp, 64
	str	z31, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z9, [x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	add	z31.s, z31.s, z9.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z9, [x3]
	add	z31.s, z13.s, z9.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	add	z31.s, z12.s, z9.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z9, [x3]
	add	z31.s, z11.s, z9.s
	addvl	x3, x4, #-4
	cntb	x4, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x4, x4, 3
	add	x3, x3, 64
	sub	z10.s, z30.s, z10.s
	decb	x4
	add	x3, sp, x3
	str	z31, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z9, [x3]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z31, [x3]
	add	z31.s, z15.s, z31.s
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z9, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z9.s, z15.s, z31.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z11.s, z11.s, z14.s
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
	sub	z30.s, z12.s, z14.s
	str	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z12, [x3]
	sub	z31.s, z13.s, z12.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #9
	add	x3, x3, 64
	add	x4, x4, x4, lsl 3
	add	x3, sp, x3
	ldr	z12, [x3]
	rdvl	x3, #19
	lsl	x4, x4, 1
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
	sub	z31.s, z15.s, z12.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z12, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	sub	z30.s, z12.s, z13.s
	add	x3, sp, 64
	ldr	z12, [x3]
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
	add	z15.s, z12.s, z13.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z15, [x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z12, [x3]
	add	z12.s, z14.s, z12.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z14, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z14, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z15, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #-1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	incb	x4
	rdvl	x3, #21
	lsl	x3, x3, 3
	lsl	x4, x4, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x5, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	sub	x4, x5, x4
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z8.s, z15.s
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z9.s, z15.s
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z14, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	mov	x4, 183
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z10.s, z15.s
	cntb	x3
	mul	x3, x3, x4
	rdvl	x4, #21
	lsl	x4, x4, 1
	incb	x4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z11.s, z15.s
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z14, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #9
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z15, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z14.s, z13.s, z15.s
	addvl	x3, x4, #1
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z15, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z14.s, z31.s, z14.s
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z13.s, z30.s, z14.s
	addvl	x3, x4, #-4
	sub	z14.s, z30.s, z14.s
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z13.s, z31.s, z14.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z13, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z15.s, z31.s, z15.s
	addvl	x3, x4, #-2
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z31, [x3]
	incb	x4
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z14.s, z30.s, z31.s
	addvl	x3, x4, #1
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z11.s, z11.s, z31.s
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z10.s, z10.s, z31.s
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z9.s, z9.s, z31.s
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z8.s, z8.s, z31.s
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z13, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z30, [x3]
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z30, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z30, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	str	z30, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #4
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	cntb	x4, all, mul #9
	add	x3, x3, 64
	add	x4, x4, x4, lsl 3
	add	x3, sp, x3
	str	z30, [x3]
	cntb	x3, all, mul #9
	lsl	x4, x4, 1
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	add	x3, sp, 64
	ldr	z30, [x3]
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	add	x3, sp, 64
	str	z13, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 64
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z12.s, #7
	add	x3, x3, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 128
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 160
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	rdvl	x4, #22
	add	x3, x3, 192
	lsl	x4, x4, 3
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 224
	incb	x4
	lsl	x4, x4, 1
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 256
	str	q31, [sp, x3]
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x5, x4, 4
	add	x3, x3, 288
	sub	x4, x5, x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 320
	str	q31, [sp, x3]
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x4, 183
	add	x3, x3, 352
	str	q31, [sp, x3]
	cntb	x3
	mul	x3, x3, x4
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 384
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 416
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, x3, lsl 2
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 448
	str	q31, [sp, x3]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 480
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 512
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	add	x3, x3, 544
	str	q31, [sp, x3]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 576
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 608
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z15.s, #7
	add	x3, x3, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z14.s, #7
	add	x3, x3, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z11.s, #7
	add	x3, x3, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z10.s, #7
	add	x3, x3, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z9.s, #7
	add	x3, x3, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z8.s, #7
	add	x3, x3, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	add	x3, x3, 832
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z30, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 864
	decb	x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z30, [x3]
	addvl	x3, x4, #-2
	rdvl	x4, #20
	sqrshrnb	z31.h, z30.s, #7
	add	x3, x3, 896
	lsl	x4, x4, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	add	x3, x3, 928
	str	q31, [sp, x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	rdvl	x4, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x4, 1
	add	x3, x3, 960
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z30, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 992
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1024
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	add	x3, sp, 64
	ldr	z13, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1056
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x6, sp, x3
	addvl	x3, x4, #-2
	add	x3, x3, 1600
	add	x5, sp, x3
	.p2align 5,,15
.L5:
	mov	x3, 0
	.p2align 5,,15
.L6:
	ubfiz	x4, x3, 5, 32
	ldrh	w4, [x6, x4]
	strh	w4, [x5, x3, lsl 1]
	add	x3, x3, 1
	cmp	x3, 32
	bne	.L6
	add	x7, x7, 32
	add	x6, x6, 2
	add	x5, x5, 64
	cmp	x7, 512
	bne	.L5
	add	x3, x0, 96
	ldr	z8, [x3]
	add	x3, x0, 224
	ldr	z31, [x3]
	zip1	z8.h, z8.h, z31.h
	add	x3, x0, 352
	ldr	z9, [x3]
	add	x3, x0, 480
	ldr	z31, [x3]
	zip1	z9.h, z9.h, z31.h
	add	x3, x0, 608
	ldr	z10, [x3]
	add	x3, x0, 736
	ldr	z31, [x3]
	zip1	z31.h, z10.h, z31.h
	add	x3, sp, 64
	str	z31, [x3]
	add	x3, x0, 864
	ldr	z11, [x3]
	add	x3, x0, 992
	ldr	z31, [x3]
	zip1	z11.h, z11.h, z31.h
	add	x3, x0, 1120
	ldr	z12, [x3]
	add	x3, x0, 1248
	ldr	z31, [x3]
	zip1	z12.h, z12.h, z31.h
	add	x3, x0, 1376
	ldr	z13, [x3]
	add	x3, x0, 1504
	ldr	z31, [x3]
	zip1	z13.h, z13.h, z31.h
	add	x3, x0, 1632
	ldr	z14, [x3]
	add	x3, x0, 1760
	ldr	z31, [x3]
	zip1	z14.h, z14.h, z31.h
	add	x3, x0, 1888
	ldr	z15, [x3]
	add	x3, x0, 2016
	ldr	z31, [x3]
	zip1	z31.h, z15.h, z31.h
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x5, x4, 3
	add	x4, x4, x5
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 2
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	mov	z11.d, z30.d
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	lsl	x4, x4, 4
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z11, [x3]
	add	x3, x0, 160
	ldr	z12, [x3]
	add	x3, x0, 416
	ldr	z30, [x3]
	zip1	z12.h, z12.h, z30.h
	add	x3, x0, 672
	ldr	z13, [x3]
	add	x3, x0, 928
	ldr	z30, [x3]
	zip1	z13.h, z13.h, z30.h
	add	x3, x0, 1184
	ldr	z14, [x3]
	add	x3, x0, 1440
	ldr	z30, [x3]
	zip1	z14.h, z14.h, z30.h
	add	x3, x0, 1696
	ldr	z15, [x3]
	add	x3, x0, 1952
	ldr	z30, [x3]
	zip1	z15.h, z15.h, z30.h
	rdvl	x3, #27
	mov	z30.d, z31.d
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	mov	z10.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z10, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	mov	z8.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z8, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z9.d, z30.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z9, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z11.d, z30.d
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	str	z11, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	cntb	x3
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z8.d, z30.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 288
	ldr	z30, [x3]
	lsl	x4, x4, 4
	add	x3, x0, 800
	ldr	z15, [x3]
	incb	x4, all, mul #4
	add	x3, x0, 1312
	zip1	z14.h, z30.h, z15.h
	ldr	z30, [x3]
	add	x3, x0, 1824
	ldr	z15, [x3]
	lsl	x4, x4, 1
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z13.d, z30.d
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z13.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z30.d, z31.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z30.d, z31.d
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z12, [x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z14.d, z30.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 544
	ldr	z30, [x3]
	lsl	x4, x4, 3
	add	x3, x0, 1568
	ldr	z15, [x3]
	incb	x4, all, mul #4
	zip1	z30.h, z30.h, z15.h
	mov	z13.d, z31.d
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z31.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 32
	ldr	z30, [x3]
	mov	z11.d, z31.d
	add	x3, x0, 1056
	ldr	z15, [x3]
	zip1	z30.h, z30.h, z15.h
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x3]
	ldr	z13, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	rdvl	x4, #18
	add	z12.s, z11.s, z14.s
	add	x3, x3, 64
	lsl	x4, x4, 1
	sub	z11.s, z11.s, z14.s
	add	x3, sp, x3
	ldr	z31, [x3]
	incb	x4, all, mul #2
	rdvl	x3, #19
	add	z13.s, z15.s, z31.s
	lsl	x3, x3, 3
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	str	z13, [x3]
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	ldr	z13, [x3]
	cntb	x3, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z15.s, z15.s, z14.s
	add	x3, sp, 64
	ldr	z14, [x3]
	sub	z14.s, z14.s, z9.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z31, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	add	z31.s, z31.s, z9.s
	add	x3, sp, 64
	str	z31, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z9, [x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	add	z31.s, z31.s, z9.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z9, [x3]
	add	z31.s, z13.s, z9.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
	add	z31.s, z12.s, z9.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z9, [x3]
	add	z31.s, z11.s, z9.s
	addvl	x3, x4, #-4
	cntb	x4, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x4, x4, 3
	add	x3, x3, 64
	sub	z10.s, z30.s, z10.s
	decb	x4
	add	x3, sp, x3
	str	z31, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z9, [x3]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z31, [x3]
	add	z31.s, z15.s, z31.s
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4
	add	x3, sp, x3
	str	z9, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z9.s, z15.s, z31.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z11.s, z11.s, z14.s
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
	sub	z30.s, z12.s, z14.s
	str	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z12, [x3]
	sub	z31.s, z13.s, z12.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z31, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #9
	add	x3, x3, 64
	add	x4, x4, x4, lsl 3
	add	x3, sp, x3
	ldr	z12, [x3]
	rdvl	x3, #19
	lsl	x4, x4, 1
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
	sub	z31.s, z15.s, z12.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z12, [x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	sub	z30.s, z12.s, z13.s
	add	x3, sp, 64
	ldr	z12, [x3]
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
	add	z15.s, z12.s, z13.s
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z15, [x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z12, [x3]
	add	z12.s, z14.s, z12.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z15, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z14, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z14, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z15, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #-1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	addvl	x3, x4, #2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	incb	x4
	rdvl	x3, #21
	lsl	x3, x3, 3
	lsl	x4, x4, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z15, [x3]
	add	z15.s, z14.s, z15.s
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z15, [x3]
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z14, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #3
	add	x3, x3, 64
	lsl	x5, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	sub	x4, x5, x4
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z8.s, z15.s
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z9.s, z15.s
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	str	z14, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	mov	x4, 183
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z15.s, z10.s, z15.s
	cntb	x3
	mul	x3, x3, x4
	rdvl	x4, #21
	lsl	x4, x4, 1
	incb	x4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z15, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z15, [x3]
	add	z14.s, z11.s, z15.s
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z14, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #9
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z15, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
	add	z14.s, z13.s, z15.s
	addvl	x3, x4, #1
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z15, [x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z14.s, z14.s, z15.s
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z14.s, z31.s, z14.s
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #12
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	add	z13.s, z30.s, z14.s
	addvl	x3, x4, #-4
	sub	z14.s, z30.s, z14.s
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z14, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z14, [x3]
	sub	z13.s, z31.s, z14.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	str	z13, [x3]
	addvl	x3, x4, #1
	rdvl	x4, #22
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z15.s, z31.s, z15.s
	addvl	x3, x4, #-2
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z31, [x3]
	incb	x4
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	lsl	x4, x4, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
	sub	z14.s, z30.s, z31.s
	addvl	x3, x4, #1
	rdvl	x4, #20
	lsl	x4, x4, 2
	add	x3, x3, 64
	incb	x4, all, mul #4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z11.s, z11.s, z31.s
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z10.s, z10.s, z31.s
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z9.s, z9.s, z31.s
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z8.s, z8.s, z31.s
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #5
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	addvl	x3, x4, #-1
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	str	z13, [x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z30, [x3]
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	str	z30, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #-1
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 64
	decb	x4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z30, [x3]
	addvl	x3, x4, #-4
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z30, [x3]
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	str	z30, [x3]
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #4
	rdvl	x4, #18
	lsl	x4, x4, 1
	add	x3, x3, 64
	incb	x4, all, mul #2
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	cntb	x4, all, mul #9
	add	x3, x3, 64
	add	x4, x4, x4, lsl 3
	add	x3, sp, x3
	str	z30, [x3]
	cntb	x3, all, mul #9
	lsl	x4, x4, 1
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z30.s, z30.s, z31.s
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	add	x3, sp, 64
	ldr	z30, [x3]
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z13.s, z30.s, z31.s
	add	x3, sp, 64
	str	z13, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 64
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z12.s, #7
	add	x3, x3, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #19
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 128
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 160
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	rdvl	x4, #22
	add	x3, x3, 192
	lsl	x4, x4, 3
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z31, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x3, x3, 224
	incb	x4
	lsl	x4, x4, 1
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 256
	str	q31, [sp, x3]
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x5, x4, 4
	add	x3, x3, 288
	sub	x4, x5, x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z31, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 320
	str	q31, [sp, x3]
	rdvl	x3, #26
	lsl	x4, x3, 3
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x4, 183
	add	x3, x3, 352
	str	q31, [sp, x3]
	cntb	x3
	mul	x3, x3, x4
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 384
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	rdvl	x3, #23
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 416
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	cntb	x4, all, mul #6
	add	x3, x3, x3, lsl 2
	lsl	x4, x4, 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 448
	str	q31, [sp, x3]
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	add	x3, x3, 480
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 512
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	add	x3, x3, 544
	str	q31, [sp, x3]
	cntb	x3, all, mul #3
	lsl	x4, x3, 6
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z31, [x3]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 576
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 608
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z15.s, #7
	add	x3, x3, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z14.s, #7
	add	x3, x3, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z11.s, #7
	add	x3, x3, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z10.s, #7
	add	x3, x3, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z9.s, #7
	add	x3, x3, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z8.s, #7
	add	x3, x3, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #10
	add	x3, x3, 832
	lsl	x4, x4, 4
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z30, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x3, x3, 864
	decb	x4
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #1
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z30, [x3]
	addvl	x3, x4, #-2
	rdvl	x4, #20
	sqrshrnb	z31.h, z30.s, #7
	add	x3, x3, 896
	lsl	x4, x4, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x3]
	addvl	x3, x4, #-4
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	ldr	z13, [x3]
	lsl	x4, x4, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x3, x4, #-2
	add	x3, x3, 928
	str	q31, [sp, x3]
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x3, sp, x3
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	rdvl	x4, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x4, 1
	add	x3, x3, 960
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	str	q31, [sp, x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	cntb	x4, all, mul #6
	add	x3, sp, x3
	lsl	x4, x4, 5
	ldr	z30, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 992
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1024
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	add	x3, sp, 64
	ldr	z13, [x3]
	addvl	x3, x4, #-2
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x3, x3, 1056
	cntb	x4, all, mul #6
	lsl	x4, x4, 5
	str	q31, [sp, x3]
	addvl	x3, x4, #-2
	cntb	x4, all, mul #6
	add	x3, x3, 64
	lsl	x4, x4, 5
	add	x6, sp, x3
	addvl	x3, x4, #-2
	add	x3, x3, 2112
	add	x5, sp, x3
	.p2align 5,,15
.L8:
	mov	x3, 0
	.p2align 5,,15
.L9:
	ubfiz	x4, x3, 5, 32
	ldrh	w4, [x6, x4]
	strh	w4, [x5, x3, lsl 1]
	add	x3, x3, 1
	cmp	x3, 32
	bne	.L9
	add	x7, x7, 32
	add	x6, x6, 2
	add	x5, x5, 64
	cmp	x7, 768
	bne	.L8
	add	x3, x0, 112
	ldr	z8, [x3]
	add	x3, x0, 240
	ldr	z31, [x3]
	zip1	z8.h, z8.h, z31.h
	add	x3, x0, 368
	ldr	z9, [x3]
	add	x3, x0, 496
	ldr	z31, [x3]
	zip1	z9.h, z9.h, z31.h
	add	x3, x0, 624
	ldr	z10, [x3]
	add	x3, x0, 752
	ldr	z31, [x3]
	zip1	z31.h, z10.h, z31.h
	add	x3, sp, 64
	str	z31, [x3]
	add	x3, x0, 880
	ldr	z11, [x3]
	add	x3, x0, 1008
	ldr	z31, [x3]
	zip1	z11.h, z11.h, z31.h
	add	x3, x0, 1136
	ldr	z12, [x3]
	add	x3, x0, 1264
	ldr	z31, [x3]
	zip1	z12.h, z12.h, z31.h
	add	x3, x0, 1392
	ldr	z13, [x3]
	add	x3, x0, 1520
	ldr	z31, [x3]
	zip1	z13.h, z13.h, z31.h
	add	x3, x0, 1648
	ldr	z14, [x3]
	add	x3, x0, 1776
	ldr	z31, [x3]
	zip1	z14.h, z14.h, z31.h
	add	x3, x0, 1904
	ldr	z15, [x3]
	add	x3, x0, 2032
	ldr	z31, [x3]
	zip1	z31.h, z15.h, z31.h
	addvl	x3, sp, #1
	add	x3, x3, 64
	str	z31, [x3]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x5, x4, 3
	add	x4, x4, x5
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	lsl	x4, x4, 2
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, x5, #9
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
	add	x3, sp, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	mov	z11.d, z30.d
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #12
	lsl	x4, x4, 4
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z11, [x3]
	add	x3, x0, 176
	ldr	z12, [x3]
	add	x3, x0, 432
	ldr	z30, [x3]
	zip1	z12.h, z12.h, z30.h
	add	x3, x0, 688
	ldr	z13, [x3]
	add	x3, x0, 944
	ldr	z30, [x3]
	zip1	z13.h, z13.h, z30.h
	add	x3, x0, 1200
	ldr	z14, [x3]
	add	x3, x0, 1456
	ldr	z30, [x3]
	zip1	z14.h, z14.h, z30.h
	add	x3, x0, 1712
	ldr	z15, [x3]
	add	x3, x0, 1968
	ldr	z30, [x3]
	zip1	z15.h, z15.h, z30.h
	rdvl	x3, #27
	mov	z30.d, z31.d
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	mov	z10.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z10, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	mov	z8.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z8, [x3]
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z9.d, z30.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z9, [x3]
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z11.d, z30.d
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	str	z11, [x3]
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #22
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z10, [x3]
	cntb	x3
	lsl	x3, x3, 7
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z10.d, z30.d
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z30.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z30, [x3]
	mov	z30.d, z31.d
	rdvl	x3, #17
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z8.d, z30.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 304
	ldr	z30, [x3]
	lsl	x4, x4, 4
	add	x3, x0, 816
	ldr	z15, [x3]
	incb	x4, all, mul #4
	add	x3, x0, 1328
	zip1	z14.h, z30.h, z15.h
	ldr	z30, [x3]
	add	x3, x0, 1840
	ldr	z15, [x3]
	lsl	x4, x4, 1
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	mov	z13.d, z30.d
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z13.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z30.d, z31.d
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	str	z13, [x3]
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	mov	z30.d, z31.d
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	rdvl	x4, #18
	add	x3, x3, 64
	lsl	x4, x4, 3
	add	x3, sp, x3
	str	z12, [x3]
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z14.d, z30.d
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	add	x3, x0, 560
	ldr	z30, [x3]
	lsl	x4, x4, 3
	add	x3, x0, 1584
	ldr	z15, [x3]
	incb	x4, all, mul #4
	zip1	z30.h, z30.h, z15.h
	mov	z13.d, z31.d
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	mov	z12.d, z31.d
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	add	x3, x0, 48
	add	x0, x0, 1072
	ldr	z15, [x0]
	cntb	x0, all, mul #10
	ldr	z30, [x3]
	mov	z11.d, z31.d
	lsl	x3, x0, 4
	zip1	z30.h, z30.h, z15.h
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x0]
	ldr	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	rdvl	x3, #18
	add	z12.s, z11.s, z14.s
	add	x0, x0, 64
	lsl	x3, x3, 1
	sub	z11.s, z11.s, z14.s
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3, all, mul #2
	rdvl	x0, #19
	add	z13.s, z15.s, z31.s
	lsl	x0, x0, 3
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	str	z13, [x0]
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	ldr	z13, [x0]
	cntb	x0, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z15.s, z15.s, z14.s
	add	x0, sp, 64
	ldr	z14, [x0]
	sub	z14.s, z14.s, z9.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z31, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z31.s, z9.s
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	add	z31.s, z31.s, z9.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z13.s, z9.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z12.s, z9.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z11.s, z9.s
	addvl	x0, x3, #-4
	cntb	x3, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x3, x3, 3
	add	x0, x0, 64
	sub	z10.s, z30.s, z10.s
	decb	x3
	add	x0, sp, x0
	str	z31, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z31.s, z15.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z15.s, z31.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z11.s, z11.s, z14.s
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z30.s, z12.s, z14.s
	str	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	sub	z31.s, z13.s, z12.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	ldr	z12, [x0]
	rdvl	x0, #19
	lsl	x3, x3, 1
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	sub	z31.s, z15.s, z12.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z12, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	sub	z30.s, z12.s, z13.s
	add	x0, sp, 64
	ldr	z12, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
	add	z15.s, z12.s, z13.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z12, [x0]
	add	z12.s, z14.s, z12.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	incb	x3
	rdvl	x0, #21
	lsl	x0, x0, 3
	lsl	x3, x3, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z15, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x4, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	sub	x3, x4, x3
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	lsl	x3, x3, 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z8.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z9.s, z15.s
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	mov	x3, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z10.s, z15.s
	cntb	x0
	mul	x0, x0, x3
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z11.s, z15.s
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z14.s, z13.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z31.s, z14.s
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z13.s, z30.s, z14.s
	addvl	x0, x3, #-4
	sub	z14.s, z30.s, z14.s
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z13.s, z31.s, z14.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z15.s, z31.s, z15.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 1
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z30, [x0]
	sub	z14.s, z30.s, z31.s
	addvl	x0, x3, #1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z11.s, z11.s, z31.s
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z10.s, z10.s, z31.s
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z9.s, z31.s
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z8.s, z8.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z30, [x0]
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z30, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #4
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	str	z30, [x0]
	cntb	x0, all, mul #9
	lsl	x3, x3, 1
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	add	x0, sp, 64
	ldr	z30, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	add	x0, sp, 64
	str	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z12.s, #7
	add	x0, x0, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 128
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 160
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	rdvl	x3, #22
	add	x0, x0, 192
	lsl	x3, x3, 3
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 224
	incb	x3
	lsl	x3, x3, 1
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 256
	str	q31, [sp, x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x3, 4
	add	x0, x0, 288
	sub	x3, x4, x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 320
	str	q31, [sp, x0]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x3, 183
	add	x0, x0, 352
	str	q31, [sp, x0]
	cntb	x0
	mul	x0, x0, x3
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 384
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 416
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, x0, lsl 2
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 448
	str	q31, [sp, x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 480
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 512
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 544
	str	q31, [sp, x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 576
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 608
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z15.s, #7
	add	x0, x0, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z14.s, #7
	add	x0, x0, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z11.s, #7
	add	x0, x0, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z10.s, #7
	add	x0, x0, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z9.s, #7
	add	x0, x0, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z8.s, #7
	add	x0, x0, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 832
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 864
	decb	x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	rdvl	x3, #20
	sqrshrnb	z31.h, z30.s, #7
	add	x0, x0, 896
	lsl	x3, x3, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 928
	str	q31, [sp, x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x0, x3, #-2
	rdvl	x3, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x3, x3, 1
	add	x0, x0, 960
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z30.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 992
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #7
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1024
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	add	x0, sp, 64
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z13.s, #7
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1056
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x5, sp, x0
	addvl	x0, x3, #-2
	add	x0, x0, 2624
	add	x4, sp, x0
	.p2align 5,,15
.L11:
	mov	x0, 0
	.p2align 5,,15
.L12:
	ubfiz	x3, x0, 5, 32
	ldrh	w3, [x5, x3]
	strh	w3, [x4, x0, lsl 1]
	add	x0, x0, 1
	cmp	x0, 32
	bne	.L12
	add	x7, x7, 32
	add	x5, x5, 2
	add	x4, x4, 64
	cmp	x7, 1024
	bne	.L11
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1152
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z8, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1280
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z8.h, z8.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1408
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1536
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z9.h, z9.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1664
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z10, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1792
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z10.h, z31.h
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1920
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2048
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z11.h, z11.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2176
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2304
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z12.h, z12.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2432
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2560
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z13.h, z13.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2688
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2816
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z14.h, z14.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2944
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3072
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z15.h, z31.h
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z31, [x0]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x4, x3, 3
	add	x3, x3, x4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 2
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #9
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	mov	z11.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #12
	lsl	x3, x3, 4
	addvl	x0, x3, #-4
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1216
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1472
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z12.h, z12.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1728
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1984
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z13.h, z13.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2240
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2496
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z14.h, z14.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2752
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3008
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z15.h, z15.h, z30.h
	rdvl	x0, #27
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z10.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z30.d, z31.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z10, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	mov	z8.d, z30.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z8, [x0]
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z9.d, z30.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z9, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z11.d, z30.d
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z30.d, z31.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	str	z11, [x0]
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z10, [x0]
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z8.d, z30.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1344
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1856
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z14.h, z30.h, z15.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2368
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 4
	add	x0, x0, 2880
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z13.d, z30.d
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z13.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z30.d, z31.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #18
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z12, [x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z14.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z13.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1600
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 3
	add	x0, x0, 2624
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z31.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z11.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1088
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 2112
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x0]
	ldr	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	rdvl	x3, #18
	add	z12.s, z11.s, z14.s
	add	x0, x0, 64
	lsl	x3, x3, 1
	sub	z11.s, z11.s, z14.s
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3, all, mul #2
	rdvl	x0, #19
	add	z13.s, z15.s, z31.s
	add	x5, x1, 64
	lsl	x0, x0, 3
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	str	z13, [x0]
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	ldr	z13, [x0]
	cntb	x0, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z15.s, z15.s, z14.s
	add	x0, sp, 64
	ldr	z14, [x0]
	sub	z14.s, z14.s, z9.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z31, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z31.s, z9.s
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	add	z31.s, z31.s, z9.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z13.s, z9.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z12.s, z9.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z11.s, z9.s
	addvl	x0, x3, #-4
	cntb	x3, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x3, x3, 3
	add	x0, x0, 64
	sub	z10.s, z30.s, z10.s
	decb	x3
	add	x0, sp, x0
	str	z31, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z31.s, z15.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z15.s, z31.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z11.s, z11.s, z14.s
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z30.s, z12.s, z14.s
	str	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	sub	z31.s, z13.s, z12.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	ldr	z12, [x0]
	rdvl	x0, #19
	lsl	x3, x3, 1
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	sub	z31.s, z15.s, z12.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z12, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	sub	z30.s, z12.s, z13.s
	add	x0, sp, 64
	ldr	z12, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
	add	z15.s, z12.s, z13.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z12, [x0]
	add	z12.s, z14.s, z12.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	incb	x3
	rdvl	x0, #21
	lsl	x0, x0, 3
	lsl	x3, x3, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z15, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x4, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	sub	x3, x4, x3
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	lsl	x3, x3, 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z8.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z9.s, z15.s
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	mov	x3, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z10.s, z15.s
	cntb	x0
	mul	x0, x0, x3
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z11.s, z15.s
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z14.s, z13.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z31.s, z14.s
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z13.s, z30.s, z14.s
	addvl	x0, x3, #-4
	sub	z14.s, z30.s, z14.s
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z13.s, z31.s, z14.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z15.s, z31.s, z15.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 1
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z30, [x0]
	sub	z14.s, z30.s, z31.s
	addvl	x0, x3, #1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z11.s, z11.s, z31.s
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z10.s, z10.s, z31.s
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z9.s, z31.s
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z8.s, z8.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z30, [x0]
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z30, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #4
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	str	z30, [x0]
	cntb	x0, all, mul #9
	lsl	x3, x3, 1
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	add	x0, sp, 64
	ldr	z30, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	add	x0, sp, 64
	str	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 128
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 160
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	rdvl	x3, #22
	add	x0, x0, 192
	lsl	x3, x3, 3
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 224
	incb	x3
	lsl	x3, x3, 1
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 256
	str	q31, [sp, x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x3, 4
	add	x0, x0, 288
	sub	x3, x4, x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 320
	str	q31, [sp, x0]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x3, 183
	add	x0, x0, 352
	str	q31, [sp, x0]
	cntb	x0
	mul	x0, x0, x3
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 384
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 416
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, x0, lsl 2
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 448
	str	q31, [sp, x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 480
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 512
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 544
	str	q31, [sp, x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 576
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 608
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z15.s, #12
	add	x0, x0, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z14.s, #12
	add	x0, x0, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z11.s, #12
	add	x0, x0, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z10.s, #12
	add	x0, x0, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z9.s, #12
	add	x0, x0, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z8.s, #12
	add	x0, x0, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 832
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 864
	decb	x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	rdvl	x3, #20
	sqrshrnb	z31.h, z30.s, #12
	add	x0, x0, 896
	lsl	x3, x3, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 928
	str	q31, [sp, x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	rdvl	x3, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x3, x3, 1
	add	x0, x0, 960
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 992
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1024
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	add	x0, sp, 64
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1056
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x7, sp, x0
	addvl	x0, x3, #-2
	add	x0, x0, 80
	add	x6, sp, x0
	.p2align 5,,15
.L14:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L15:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x0, x5
	bne	.L15
	add	x7, x7, 2
	add	x5, x0, x2, lsl 1
	cmp	x7, x6
	bne	.L14
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1168
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z8, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1296
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z8.h, z8.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1424
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1552
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z9.h, z9.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1680
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z10, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1808
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z10.h, z31.h
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1936
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2064
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z11.h, z11.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2192
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2320
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z12.h, z12.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2448
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2576
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z13.h, z13.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2704
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2832
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z14.h, z14.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2960
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3088
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z15.h, z31.h
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z31, [x0]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x4, x3, 3
	add	x3, x3, x4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 2
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #9
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	mov	z11.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #12
	lsl	x3, x3, 4
	addvl	x0, x3, #-4
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1232
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1488
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z12.h, z12.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1744
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2000
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z13.h, z13.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2256
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2512
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z14.h, z14.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2768
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3024
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z15.h, z15.h, z30.h
	rdvl	x0, #27
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z10.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z30.d, z31.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z10, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	mov	z8.d, z30.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z8, [x0]
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z9.d, z30.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z9, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z11.d, z30.d
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z30.d, z31.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	str	z11, [x0]
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z10, [x0]
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z8.d, z30.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1360
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1872
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z14.h, z30.h, z15.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2384
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 4
	add	x0, x0, 2896
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z13.d, z30.d
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z13.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z30.d, z31.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #18
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z12, [x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z14.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z13.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1616
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 3
	add	x0, x0, 2640
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z31.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z11.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1104
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 2128
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x0]
	ldr	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	rdvl	x3, #18
	add	z12.s, z11.s, z14.s
	add	x0, x0, 64
	lsl	x3, x3, 1
	sub	z11.s, z11.s, z14.s
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3, all, mul #2
	rdvl	x0, #19
	add	z13.s, z15.s, z31.s
	add	x5, x1, x2, lsl 4
	lsl	x0, x0, 3
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x5, x5, 64
	add	x0, x0, 64
	str	z13, [x0]
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	ldr	z13, [x0]
	cntb	x0, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z15.s, z15.s, z14.s
	add	x0, sp, 64
	ldr	z14, [x0]
	sub	z14.s, z14.s, z9.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z31, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z31.s, z9.s
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	add	z31.s, z31.s, z9.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z13.s, z9.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z12.s, z9.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z11.s, z9.s
	addvl	x0, x3, #-4
	cntb	x3, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x3, x3, 3
	add	x0, x0, 64
	sub	z10.s, z30.s, z10.s
	decb	x3
	add	x0, sp, x0
	str	z31, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z31.s, z15.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z15.s, z31.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z11.s, z11.s, z14.s
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z30.s, z12.s, z14.s
	str	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	sub	z31.s, z13.s, z12.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	ldr	z12, [x0]
	rdvl	x0, #19
	lsl	x3, x3, 1
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	sub	z31.s, z15.s, z12.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z12, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	sub	z30.s, z12.s, z13.s
	add	x0, sp, 64
	ldr	z12, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
	add	z15.s, z12.s, z13.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z12, [x0]
	add	z12.s, z14.s, z12.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	incb	x3
	rdvl	x0, #21
	lsl	x0, x0, 3
	lsl	x3, x3, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z15, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x4, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	sub	x3, x4, x3
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	lsl	x3, x3, 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z8.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z9.s, z15.s
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	mov	x3, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z10.s, z15.s
	cntb	x0
	mul	x0, x0, x3
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z11.s, z15.s
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z14.s, z13.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z31.s, z14.s
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z13.s, z30.s, z14.s
	addvl	x0, x3, #-4
	sub	z14.s, z30.s, z14.s
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z13.s, z31.s, z14.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z15.s, z31.s, z15.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 1
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z30, [x0]
	sub	z14.s, z30.s, z31.s
	addvl	x0, x3, #1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z11.s, z11.s, z31.s
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z10.s, z10.s, z31.s
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z9.s, z31.s
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z8.s, z8.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z30, [x0]
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z30, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #4
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	str	z30, [x0]
	cntb	x0, all, mul #9
	lsl	x3, x3, 1
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	add	x0, sp, 64
	ldr	z30, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	add	x0, sp, 64
	str	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 128
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 160
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	rdvl	x3, #22
	add	x0, x0, 192
	lsl	x3, x3, 3
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 224
	incb	x3
	lsl	x3, x3, 1
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 256
	str	q31, [sp, x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x3, 4
	add	x0, x0, 288
	sub	x3, x4, x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 320
	str	q31, [sp, x0]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x3, 183
	add	x0, x0, 352
	str	q31, [sp, x0]
	cntb	x0
	mul	x0, x0, x3
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 384
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 416
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, x0, lsl 2
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 448
	str	q31, [sp, x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 480
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 512
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 544
	str	q31, [sp, x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 576
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 608
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z15.s, #12
	add	x0, x0, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z14.s, #12
	add	x0, x0, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z11.s, #12
	add	x0, x0, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z10.s, #12
	add	x0, x0, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z9.s, #12
	add	x0, x0, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z8.s, #12
	add	x0, x0, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 832
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 864
	decb	x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	rdvl	x3, #20
	sqrshrnb	z31.h, z30.s, #12
	add	x0, x0, 896
	lsl	x3, x3, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 928
	str	q31, [sp, x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	rdvl	x3, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x3, x3, 1
	add	x0, x0, 960
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 992
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1024
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	add	x0, sp, 64
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1056
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x7, sp, x0
	.p2align 5,,15
.L17:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L18:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x0, x5
	bne	.L18
	add	x7, x7, 2
	add	x5, x0, x2, lsl 1
	cmp	x7, x6
	bne	.L17
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1184
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z8, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1312
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z8.h, z8.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1440
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1568
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z9.h, z9.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1696
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z10, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1824
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z10.h, z31.h
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1952
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2080
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z11.h, z11.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2208
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2336
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z12.h, z12.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2464
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2592
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z13.h, z13.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2720
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2848
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z14.h, z14.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2976
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3104
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z31.h, z15.h, z31.h
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z31, [x0]
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x4, x3, 3
	add	x3, x3, x4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	mov	z10.d, z11.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	lsl	x3, x3, 2
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, x4, #9
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
	add	x0, sp, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	mov	z11.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #12
	lsl	x3, x3, 4
	addvl	x0, x3, #-4
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1248
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1504
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z12.h, z12.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1760
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2016
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z13.h, z13.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2272
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2528
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z14.h, z14.h, z30.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2784
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3040
	add	x0, sp, x0
	ldr	z30, [x0]
	zip1	z15.h, z15.h, z30.h
	rdvl	x0, #27
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z10.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z30.d, z31.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z10, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	mov	z8.d, z30.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z8, [x0]
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z9.d, z30.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z9.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z9, [x0]
	cntb	x0, all, mul #15
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z11.d, z30.d
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z30.d, z31.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	str	z11, [x0]
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z10, [x0]
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z10.d, z30.d
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z10.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z30.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	mov	z30.d, z31.d
	rdvl	x0, #17
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z8.d, z30.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z8.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1376
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1888
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z14.h, z30.h, z15.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2400
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 4
	add	x0, x0, 2912
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z15.h, z30.h, z15.h
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z13.d, z30.d
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z9.d, z13.d
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z13.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z30.d, z31.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z30.d, z31.d
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #18
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z12, [x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z14.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z13.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1632
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 3
	add	x0, x0, 2656
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z31.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z12.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	mov	z11.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1120
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 2144
	add	x0, sp, x0
	ldr	z15, [x0]
	zip1	z30.h, z30.h, z15.h
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z11.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x0, sp, 64
	add	z15.s, z11.s, z13.s
	sub	z11.s, z11.s, z13.s
	str	z15, [x0]
	ldr	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	add	z15.s, z31.s, z12.s
	sub	z30.s, z31.s, z12.s
	add	z31.s, z13.s, z9.s
	str	z31, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	rdvl	x3, #18
	add	z12.s, z11.s, z14.s
	add	x0, x0, 64
	lsl	x3, x3, 1
	sub	z11.s, z11.s, z14.s
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3, all, mul #2
	rdvl	x0, #19
	add	z13.s, z15.s, z31.s
	add	x5, x1, x2, lsl 5
	lsl	x0, x0, 3
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x5, x5, 64
	add	x0, x0, 64
	str	z13, [x0]
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	ldr	z13, [x0]
	cntb	x0, all, mul #9
	add	z13.s, z30.s, z13.s
	sub	z30.s, z30.s, z14.s
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z15.s, z15.s, z14.s
	add	x0, sp, 64
	ldr	z14, [x0]
	sub	z14.s, z14.s, z9.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z31, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z31.s, z9.s
	add	x0, sp, 64
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	add	z31.s, z31.s, z9.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z13.s, z9.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z31, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
	add	z31.s, z12.s, z9.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z9, [x0]
	add	z31.s, z11.s, z9.s
	addvl	x0, x3, #-4
	cntb	x3, all, mul #5
	add	z9.s, z30.s, z10.s
	lsl	x3, x3, 3
	add	x0, x0, 64
	sub	z10.s, z30.s, z10.s
	decb	x3
	add	x0, sp, x0
	str	z31, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	add	z9.s, z14.s, z8.s
	sub	z8.s, z14.s, z8.s
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z31, [x0]
	add	z31.s, z15.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3
	add	x0, sp, x0
	str	z9, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z15.s, z31.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z11.s, z11.s, z14.s
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
	sub	z30.s, z12.s, z14.s
	str	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	sub	z31.s, z13.s, z12.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z31, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	ldr	z12, [x0]
	rdvl	x0, #19
	lsl	x3, x3, 1
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	sub	z31.s, z15.s, z12.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z12, [x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	sub	z30.s, z12.s, z13.s
	add	x0, sp, 64
	ldr	z12, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
	add	z15.s, z12.s, z13.s
	addvl	x0, sp, #1
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z12, [x0]
	add	z12.s, z14.s, z12.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	addvl	x0, x3, #2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	incb	x3
	rdvl	x0, #21
	lsl	x0, x0, 3
	lsl	x3, x3, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
	add	z15.s, z14.s, z15.s
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z15, [x0]
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #3
	add	x0, x0, 64
	lsl	x4, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	sub	x3, x4, x3
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	lsl	x3, x3, 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z8.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z9.s, z15.s
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	str	z14, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	mov	x3, 183
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z15.s, z10.s, z15.s
	cntb	x0
	mul	x0, x0, x3
	rdvl	x3, #21
	lsl	x3, x3, 1
	incb	x3
	add	x0, x0, 64
	add	x0, sp, x0
	str	z15, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z15, [x0]
	add	z14.s, z11.s, z15.s
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
	add	z14.s, z13.s, z15.s
	addvl	x0, x3, #1
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z14.s, z15.s
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z14.s, z31.s, z14.s
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #12
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	add	z13.s, z30.s, z14.s
	addvl	x0, x3, #-4
	sub	z14.s, z30.s, z14.s
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z14, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #11
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z14, [x0]
	sub	z13.s, z31.s, z14.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #1
	rdvl	x3, #22
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z15.s, z31.s, z15.s
	addvl	x0, x3, #-2
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 1
	add	x0, sp, x0
	ldr	z31, [x0]
	incb	x3
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	lsl	x3, x3, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z30, [x0]
	sub	z14.s, z30.s, z31.s
	addvl	x0, x3, #1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z11.s, z11.s, z31.s
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z10.s, z10.s, z31.s
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z9.s, z9.s, z31.s
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z8.s, z8.s, z31.s
	addvl	x0, x3, #-1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #5
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-1
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	str	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z30, [x0]
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #21
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-1
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 64
	decb	x3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	str	z30, [x0]
	addvl	x0, x3, #-4
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z13, [x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	str	z30, [x0]
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 3
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #4
	rdvl	x3, #18
	lsl	x3, x3, 1
	add	x0, x0, 64
	incb	x3, all, mul #2
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	cntb	x3, all, mul #9
	add	x0, x0, 64
	add	x3, x3, x3, lsl 3
	add	x0, sp, x0
	str	z30, [x0]
	cntb	x0, all, mul #9
	lsl	x3, x3, 1
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z30.s, z30.s, z31.s
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z30, [x0]
	add	x0, sp, 64
	ldr	z30, [x0]
	rdvl	x0, #18
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sub	z13.s, z30.s, z31.s
	add	x0, sp, 64
	str	z13, [x0]
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 64
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z12.s, #12
	add	x0, x0, 96
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 128
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 160
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	rdvl	x3, #22
	add	x0, x0, 192
	lsl	x3, x3, 3
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z31, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	add	x0, x0, 224
	incb	x3
	lsl	x3, x3, 1
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 256
	str	q31, [sp, x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #3
	uzp1	z31.h, z31.h, z31.h
	lsl	x4, x3, 4
	add	x0, x0, 288
	sub	x3, x4, x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z31, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z31.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 320
	str	q31, [sp, x0]
	rdvl	x0, #26
	lsl	x3, x0, 3
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	mov	x3, 183
	add	x0, x0, 352
	str	q31, [sp, x0]
	cntb	x0
	mul	x0, x0, x3
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 384
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	rdvl	x0, #23
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #9
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 416
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	cntb	x3, all, mul #6
	add	x0, x0, x0, lsl 2
	lsl	x3, x3, 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 448
	str	q31, [sp, x0]
	cntb	x0, all, mul #6
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	add	x0, x0, 480
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 512
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 544
	str	q31, [sp, x0]
	cntb	x0, all, mul #3
	lsl	x3, x0, 6
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #11
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 576
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 608
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z15.s, #12
	add	x0, x0, 640
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z14.s, #12
	add	x0, x0, 672
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z11.s, #12
	add	x0, x0, 704
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z10.s, #12
	add	x0, x0, 736
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z9.s, #12
	add	x0, x0, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z8.s, #12
	add	x0, x0, 800
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #10
	add	x0, x0, 832
	lsl	x3, x3, 4
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z30, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x0, x0, 864
	decb	x3
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #1
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	rdvl	x3, #20
	sqrshrnb	z31.h, z30.s, #12
	add	x0, x0, 896
	lsl	x3, x3, 3
	uzp1	z31.h, z31.h, z31.h
	str	q31, [sp, x0]
	addvl	x0, x3, #-4
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	ldr	z13, [x0]
	lsl	x3, x3, 5
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	addvl	x0, x3, #-2
	add	x0, x0, 928
	str	q31, [sp, x0]
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	cntb	x3, all, mul #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	rdvl	x3, #18
	uzp1	z31.h, z31.h, z31.h
	lsl	x3, x3, 1
	add	x0, x0, 960
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	str	q31, [sp, x0]
	addvl	x0, x3, #2
	add	x0, x0, 64
	cntb	x3, all, mul #6
	add	x0, sp, x0
	lsl	x3, x3, 5
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z30.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 992
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
	sqrshrnb	z31.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1024
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	add	x0, sp, 64
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z13.s, #12
	uzp1	z31.h, z31.h, z31.h
	add	x0, x0, 1056
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x7, sp, x0
	.p2align 5,,15
.L20:
	sub	x0, x5, #64
	mov	x3, x7
	.p2align 5,,15
.L21:
	ldrh	w4, [x3], 32
	strh	w4, [x0], 2
	cmp	x0, x5
	bne	.L21
	add	x7, x7, 2
	add	x5, x0, x2, lsl 1
	cmp	x7, x6
	bne	.L20
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1200
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z8, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1328
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z8.h, z8.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1456
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z9, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1584
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z9.h, z9.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1712
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z10, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1840
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z10.h, z10.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1968
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z11, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2096
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z11.h, z11.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2224
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2352
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z12.h, z12.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2480
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z13, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2608
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z13.h, z13.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2736
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z14, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2864
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z14.h, z14.h, z31.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2992
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3120
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z15.h, z15.h, z31.h
	movi	d31, #0
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z0.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z1.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z2.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z3.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z4.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z5.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z6.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	str	z30, [x0]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z16.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z17.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z18.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z19.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z20.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z21.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	mov	z22.d, z30.d
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z22.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z30.d, z31.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	str	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z24.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z25.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z26.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	mov	z17.d, z30.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z17.s, z15.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	mov	z30.d, z31.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	mov	z29.d, z30.d
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	mov	z30.d, z31.d
	add	x0, x0, 64
	str	z29, [x0]
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	mov	z28.d, z30.d
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	mov	z30.d, z31.d
	add	x0, x0, 64
	str	z28, [x0]
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	mov	z0.d, z30.d
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z0.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	mov	z30.d, z31.d
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z1.d, z30.d
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z1.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	mov	z2.d, z30.d
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z2.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z3.d, z30.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z3.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	mov	z4.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z4.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z5.d, z30.d
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z5.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	mov	z6.d, z30.d
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z6.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z7.d, z30.d
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z7.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	mov	z27.d, z30.d
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	mov	z30.d, z31.d
	add	x0, x0, 64
	str	z27, [x0]
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z18.d, z30.d
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z18.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z8.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z9.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z10.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z11.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z12.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z13.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	addvl	x0, sp, #6
	add	x0, x0, 64
	lsl	x3, x3, 5
	str	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1264
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1520
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z30.h, z29.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1776
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2032
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z27.h, z30.h, z29.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2288
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2544
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z26.h, z30.h, z29.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2800
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z30, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 3056
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z29.h, z30.h, z29.h
	rdvl	x0, #27
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z21.d, z30.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z21.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z30.d, z31.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	mov	z22.d, z30.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z22.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z23.d, z30.d
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z23.s, z29.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	mov	z30.d, z31.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z27.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z26.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z25.d, z30.d
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z25.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	mov	z30.d, z31.d
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z28.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z27.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z26.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z30.s, z29.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x0
	mov	z24.d, z31.d
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z24.s, z28.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z24.s, z27.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z24.s, z26.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z24.s, z29.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	mov	z20.d, z31.d
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z20.s, z28.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z20.s, z27.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z20.s, z26.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z20.s, z29.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z16.d, z31.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z16.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z16.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z16.s, z26.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z16.s, z29.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1392
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1904
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z27.h, z27.h, z29.h
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 2416
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z28, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 4
	add	x0, x0, 2928
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z28.h, z28.h, z29.h
	mov	z29.d, z31.d
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z29.s, z27.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z29.s, z28.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z26.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z26.s, z27.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z26.s, z28.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z15.d, z31.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z15.s, z27.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z15.s, z28.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z14.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z14.s, z28.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1648
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z27, [x0]
	addvl	x0, x3, #-2
	cntb	x3, all, mul #4
	lsl	x3, x3, 3
	add	x0, x0, 2672
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z27.h, z27.h, z28.h
	mov	z28.d, z31.d
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z28.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z13.d, z31.d
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z13.s, z27.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	add	x0, x0, 1136
	lsl	x3, x3, 5
	add	x0, sp, x0
	ldr	z12, [x0]
	addvl	x0, x3, #-2
	add	x0, x0, 2160
	add	x0, sp, x0
	ldr	z27, [x0]
	zip1	z12.h, z12.h, z27.h
	cntb	x0, all, mul #10
	mov	z27.d, z31.d
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z27.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scalar_sve2p1.cpp" 1
	sdot z31.s, z12.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	z12.s, z27.s, z28.s
	sub	z27.s, z27.s, z28.s
	add	x0, x0, 64
	add	z28.s, z31.s, z13.s
	add	z10.s, z28.s, z26.s
	sub	z28.s, z28.s, z26.s
	add	z26.s, z10.s, z22.s
	str	z26, [x0]
	addvl	x0, sp, #2
	sub	z31.s, z31.s, z13.s
	add	z11.s, z31.s, z15.s
	add	x0, x0, 64
	sub	z31.s, z31.s, z15.s
	add	z15.s, z11.s, z23.s
	str	z15, [x0]
	add	x0, sp, 64
	add	z9.s, z12.s, z29.s
	add	z19.s, z9.s, z21.s
	str	z19, [x0]
	rdvl	x0, #19
	lsl	x0, x0, 3
	add	z13.s, z27.s, z14.s
	sub	z27.s, z27.s, z14.s
	add	x0, sp, x0
	add	z14.s, z27.s, z30.s
	sub	z27.s, z27.s, z30.s
	add	x0, x0, 64
	ldr	z30, [x0]
	add	z15.s, z31.s, z24.s
	addvl	x0, sp, #1
	sub	z31.s, z31.s, z24.s
	sub	z10.s, z10.s, z22.s
	add	x0, x0, 64
	ldr	z24, [x0]
	add	z26.s, z28.s, z20.s
	cntb	x0, all, mul #9
	sub	z28.s, z28.s, z20.s
	sub	z11.s, z11.s, z23.s
	add	x0, x0, x0, lsl 4
	sub	z9.s, z9.s, z21.s
	sub	z12.s, z12.s, z29.s
	add	x0, x0, 64
	add	z29.s, z12.s, z16.s
	add	z30.s, z19.s, z30.s
	add	x0, sp, x0
	ldr	z22, [x0]
	sub	z12.s, z12.s, z16.s
	addvl	x0, sp, #2
	add	z19.s, z12.s, z3.s
	add	z8.s, z13.s, z25.s
	add	x0, x0, 64
	ldr	z20, [x0]
	sub	z13.s, z13.s, z25.s
	addvl	x0, sp, #3
	add	z25.s, z24.s, z22.s
	cntb	x3, all, mul #6
	add	x0, x0, 64
	ldr	z23, [x0]
	add	z23.s, z8.s, z23.s
	addvl	x0, sp, #4
	lsl	x3, x3, 5
	sqrshrnb	z30.h, z30.s, #12
	add	x0, x0, 64
	ldr	z21, [x0]
	add	z22.s, z14.s, z21.s
	addvl	x0, sp, #7
	uzp1	z30.h, z30.h, z30.h
	sqrshrnb	z25.h, z25.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z28.s, z4.s
	addvl	x0, sp, #8
	uzp1	z25.h, z25.h, z25.h
	add	z24.s, z20.s, z17.s
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z31.s, z5.s
	addvl	x0, sp, #9
	sqrshrnb	z24.h, z24.s, #12
	uzp1	z24.h, z24.h, z24.h
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z27.s, z6.s
	addvl	x0, sp, #10
	sub	z27.s, z27.s, z6.s
	sqrshrnb	z23.h, z23.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z13.s, z7.s
	addvl	x0, sp, #11
	uzp1	z23.h, z23.h, z23.h
	sqrshrnb	z22.h, z22.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	uzp1	z22.h, z22.h, z22.h
	addvl	x0, sp, #5
	add	z21.s, z15.s, z0.s
	sqrshrnb	z21.h, z21.s, #12
	add	x0, x0, 64
	ldr	z19, [x0]
	add	z19.s, z11.s, z19.s
	addvl	x0, sp, #12
	uzp1	z21.h, z21.h, z21.h
	add	z20.s, z26.s, z1.s
	add	x0, x0, 64
	str	z19, [x0]
	add	z19.s, z10.s, z18.s
	addvl	x0, sp, #13
	sub	z18.s, z10.s, z18.s
	sqrshrnb	z20.h, z20.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	uzp1	z20.h, z20.h, z20.h
	addvl	x0, sp, #6
	add	z16.s, z29.s, z2.s
	sqrshrnb	z16.h, z16.s, #12
	add	x0, x0, 64
	ldr	z19, [x0]
	add	z19.s, z9.s, z19.s
	addvl	x0, sp, #14
	uzp1	z16.h, z16.h, z16.h
	sqrshrnb	z18.h, z18.s, #12
	add	x0, x0, 64
	str	z19, [x0]
	uzp1	z18.h, z18.h, z18.h
	addvl	x0, sp, #6
	sqrshrnb	z27.h, z27.s, #12
	uzp1	z27.h, z27.h, z27.h
	add	x0, x0, 64
	ldr	z19, [x0]
	sub	z19.s, z9.s, z19.s
	addvl	x0, sp, #5
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	add	x0, x0, 64
	ldr	z10, [x0]
	sub	z11.s, z11.s, z10.s
	addvl	x0, sp, #4
	sub	z10.s, z13.s, z7.s
	sqrshrnb	z11.h, z11.s, #12
	add	x0, x0, 64
	ldr	z6, [x0]
	sub	z14.s, z14.s, z6.s
	addvl	x0, sp, #3
	uzp1	z11.h, z11.h, z11.h
	sqrshrnb	z10.h, z10.s, #12
	add	x0, x0, 64
	ldr	z7, [x0]
	sub	z8.s, z8.s, z7.s
	addvl	x0, sp, #2
	uzp1	z10.h, z10.h, z10.h
	sub	z31.s, z31.s, z5.s
	add	x0, x0, 64
	ldr	z6, [x0]
	sqrshrnb	z31.h, z31.s, #12
	addvl	x0, sp, #1
	uzp1	z31.h, z31.h, z31.h
	sub	z28.s, z28.s, z4.s
	add	x0, x0, 64
	ldr	z7, [x0]
	sqrshrnb	z28.h, z28.s, #12
	cntb	x0, all, mul #9
	uzp1	z28.h, z28.h, z28.h
	sub	z12.s, z12.s, z3.s
	add	x0, x0, x0, lsl 4
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	add	x0, x0, 64
	sub	z29.s, z29.s, z2.s
	sqrshrnb	z29.h, z29.s, #12
	add	x0, sp, x0
	ldr	z13, [x0]
	sub	z13.s, z7.s, z13.s
	add	x0, sp, 64
	ldr	z7, [x0]
	uzp1	z29.h, z29.h, z29.h
	rdvl	x0, #19
	sub	z26.s, z26.s, z1.s
	sqrshrnb	z26.h, z26.s, #12
	lsl	x0, x0, 3
	uzp1	z26.h, z26.h, z26.h
	sub	z15.s, z15.s, z0.s
	add	x0, sp, x0
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	add	x0, x0, 64
	ldr	z9, [x0]
	sqrshrnb	z14.h, z14.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z14.h, z14.h, z14.h
	add	x0, x0, 64
	lsl	x3, x3, 5
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sub	z17.s, z6.s, z17.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	str	q30, [sp, x0]
	addvl	x0, x3, #-2
	sub	z9.s, z7.s, z9.s
	add	x0, x0, 96
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q25, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 128
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q24, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 160
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q23, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 192
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q22, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 224
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q21, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 256
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q20, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 288
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q16, [sp, x0]
	addvl	x0, sp, #7
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 320
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #8
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 352
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 384
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 416
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 448
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 480
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	uzp1	z30.h, z30.h, z30.h
	cntb	x3, all, mul #6
	add	x0, x0, 512
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z30, [x0]
	sqrshrnb	z30.h, z30.s, #12
	addvl	x0, x3, #-2
	cntb	x3, all, mul #6
	uzp1	z30.h, z30.h, z30.h
	add	x0, x0, 544
	lsl	x3, x3, 5
	str	q30, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 576
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q19, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 608
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q18, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 640
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q11, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 672
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q10, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 704
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q27, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 736
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	sqrshrnb	z31.h, z9.s, #12
	add	x0, x0, 768
	uzp1	z31.h, z31.h, z31.h
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q28, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 800
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q12, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 832
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q29, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 864
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q26, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 896
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q15, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 928
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q14, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 960
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q8, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 992
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q17, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 1024
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q13, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 1056
	cntb	x3, all, mul #6
	lsl	x3, x3, 5
	str	q31, [sp, x0]
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x5, sp, x0
	add	x0, x2, x2, lsl 1
	add	x0, x1, x0, lsl 4
	add	x4, x0, 64
	.p2align 5,,15
.L23:
	sub	x0, x4, #64
	mov	x1, x5
	.p2align 5,,15
.L24:
	ldrh	w3, [x1], 32
	strh	w3, [x0], 2
	cmp	x0, x4
	bne	.L24
	add	x5, x5, 2
	add	x4, x0, x2, lsl 1
	cmp	x5, x6
	bne	.L23
	mov	x13, 95
	cntb	x12, all, mul #2
	ldp	d8, d9, [sp]
	mul	x12, x12, x13
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
	add	sp, sp, x12
	.cfi_def_cfa_offset 3136
	add	sp, sp, 3136
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	dynopt_idct32_sve2_shared, .-dynopt_idct32_sve2_shared
	.section	.rodata
	.align	3
	.set	.LANCHOR0,. + 0
	.type	_ZL7CDOT_EO, %object
	.size	_ZL7CDOT_EO, 1024
_ZL7CDOT_EO:
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	90
	.hword	87
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	80
	.hword	70
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	57
	.hword	43
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	25
	.hword	9
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	87
	.hword	57
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	9
	.hword	-43
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-80
	.hword	-90
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	-70
	.hword	-25
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	80
	.hword	9
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-70
	.hword	-87
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	-25
	.hword	57
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	90
	.hword	43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	70
	.hword	-43
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	-87
	.hword	9
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	90
	.hword	25
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	-80
	.hword	-57
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	57
	.hword	-80
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-25
	.hword	90
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	-9
	.hword	-87
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	70
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	43
	.hword	-90
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	57
	.hword	25
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	-87
	.hword	70
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	9
	.hword	-80
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	25
	.hword	-70
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	90
	.hword	-80
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	43
	.hword	9
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	-57
	.hword	87
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	9
	.hword	-25
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	43
	.hword	-57
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	70
	.hword	-80
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.hword	87
	.hword	-90
	.type	_ZL8CDOT_EEO, %object
	.size	_ZL8CDOT_EEO, 256
_ZL8CDOT_EEO:
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	89
	.hword	75
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	50
	.hword	18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	75
	.hword	-18
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	-89
	.hword	-50
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	50
	.hword	-89
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	75
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	18
	.hword	-50
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.hword	75
	.hword	-89
	.type	_ZL9CDOT_EEEO, %object
	.size	_ZL9CDOT_EEEO, 64
_ZL9CDOT_EEEO:
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	83
	.hword	36
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.hword	36
	.hword	-83
	.type	_ZL9CDOT_EEEE, %object
	.size	_ZL9CDOT_EEEE, 64
_ZL9CDOT_EEEE:
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
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.hword	64
	.hword	-64
	.type	_ZL6CDOT_O, %object
	.size	_ZL6CDOT_O, 4096
_ZL6CDOT_O:
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	90
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	88
	.hword	85
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	82
	.hword	78
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	73
	.hword	67
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	61
	.hword	54
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	46
	.hword	38
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	31
	.hword	22
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	13
	.hword	4
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	90
	.hword	82
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	67
	.hword	46
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	22
	.hword	-4
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-31
	.hword	-54
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-73
	.hword	-85
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-90
	.hword	-88
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-78
	.hword	-61
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	-38
	.hword	-13
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	88
	.hword	67
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	31
	.hword	-13
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-54
	.hword	-82
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-90
	.hword	-78
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	-46
	.hword	-4
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	38
	.hword	73
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	90
	.hword	85
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	61
	.hword	22
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	85
	.hword	46
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-13
	.hword	-67
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-90
	.hword	-73
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	-22
	.hword	38
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	82
	.hword	88
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	54
	.hword	-4
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-61
	.hword	-90
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	-78
	.hword	-31
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	82
	.hword	22
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-54
	.hword	-90
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	-61
	.hword	13
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	78
	.hword	85
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	31
	.hword	-46
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	-90
	.hword	-67
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	4
	.hword	73
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	88
	.hword	38
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	78
	.hword	-4
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	-82
	.hword	-73
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	13
	.hword	85
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	67
	.hword	-22
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	-88
	.hword	-61
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	31
	.hword	90
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	54
	.hword	-38
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	-90
	.hword	-46
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	73
	.hword	-31
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	-90
	.hword	-22
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	78
	.hword	67
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-38
	.hword	-90
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	-13
	.hword	82
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	61
	.hword	-46
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	-88
	.hword	-4
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	85
	.hword	54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	67
	.hword	-54
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	-78
	.hword	38
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	85
	.hword	-22
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	-90
	.hword	4
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	90
	.hword	13
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	-88
	.hword	-31
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	82
	.hword	46
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	-73
	.hword	-61
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	61
	.hword	-73
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	-46
	.hword	82
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	31
	.hword	-88
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-13
	.hword	90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	-4
	.hword	-90
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	22
	.hword	85
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	-38
	.hword	-78
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	67
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	54
	.hword	-85
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-4
	.hword	88
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	-46
	.hword	-61
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	82
	.hword	13
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	-90
	.hword	38
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	67
	.hword	-78
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-22
	.hword	90
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	-31
	.hword	-73
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	46
	.hword	-90
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	38
	.hword	54
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	-90
	.hword	31
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	61
	.hword	-88
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	22
	.hword	67
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	-85
	.hword	13
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	73
	.hword	-82
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	4
	.hword	78
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	38
	.hword	-88
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	73
	.hword	-4
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-67
	.hword	90
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	-46
	.hword	-31
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	85
	.hword	-78
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	13
	.hword	61
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	-90
	.hword	54
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	22
	.hword	-82
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	31
	.hword	-78
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	90
	.hword	-61
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	4
	.hword	54
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-88
	.hword	82
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	-38
	.hword	-22
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	73
	.hword	-90
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	67
	.hword	-13
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	-46
	.hword	85
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	22
	.hword	-61
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	85
	.hword	-90
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	73
	.hword	-38
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-4
	.hword	46
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-78
	.hword	90
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-82
	.hword	54
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	-13
	.hword	-31
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	67
	.hword	-88
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	13
	.hword	-38
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	61
	.hword	-78
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	88
	.hword	-90
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	85
	.hword	-73
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	54
	.hword	-31
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	4
	.hword	22
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-46
	.hword	67
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	-82
	.hword	90
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	4
	.hword	-13
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	22
	.hword	-31
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	38
	.hword	-46
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	54
	.hword	-61
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	67
	.hword	-73
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	78
	.hword	-82
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	85
	.hword	-88
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.hword	90
	.hword	-90
	.ident	"GCC: (GNU) 16.1.0"
	.section	.note.GNU-stack,"",@progbits

	.aeabi_subsection aeabi_feature_and_bits, optional, ULEB128
	.aeabi_attribute Tag_Feature_BTI, 0
	.aeabi_attribute Tag_Feature_PAC, 0
	.aeabi_attribute Tag_Feature_GCS, 0
