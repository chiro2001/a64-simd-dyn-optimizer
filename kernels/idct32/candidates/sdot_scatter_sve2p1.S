	.arch armv9.4-a+crc
	.file	"sdot_scatter_sve2p1.cpp"
	.text
	.align	2
	.p2align 5,,15
	.global	dynopt_idct32_sve2_shared
	.type	dynopt_idct32_sve2_shared, %function
dynopt_idct32_sve2_shared:
.LFB5:
	.cfi_startproc
	mov	x13, 45
	cntb	x12, all, mul #4
	movi	d31, #0
	add	x3, x0, 64
	add	x4, x0, 192
	mov	z29.d, z31.d
	mul	x12, x12, x13
	sub	sp, sp, x12
	.cfi_escape 0xf,0xa,0x8f,0,0x92,0x2e,0,0xa,0xa0,0x5,0x1e,0x22
	sub	sp, sp, #2112
	.cfi_escape 0xf,0xd,0x8f,0,0x92,0x2e,0,0xa,0xa0,0x5,0x1e,0x23,0xc0,0x10,0x22
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
	ldr	z30, [x4]
	ldr	z22, [x3]
	add	x4, x0, 448
	zip1	z22.h, z22.h, z30.h
	ldr	z30, [x4]
	add	x3, x0, 320
	ldr	z15, [x3]
	add	x4, x0, 704
	add	x3, x0, 576
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x4]
	ldr	z16, [x3]
	add	x4, x0, 960
	add	x3, x0, 832
	zip1	z16.h, z16.h, z30.h
	ldr	z30, [x4]
	ldr	z17, [x3]
	add	x4, x0, 1216
	add	x3, x0, 1088
	zip1	z17.h, z17.h, z30.h
	ldr	z30, [x4]
	ldr	z18, [x3]
	add	x4, x0, 1472
	add	x3, x0, 1344
	zip1	z18.h, z18.h, z30.h
	ldr	z30, [x4]
	ldr	z19, [x3]
	add	x4, x0, 1728
	add	x3, x0, 1600
	zip1	z19.h, z19.h, z30.h
	ldr	z30, [x4]
	ldr	z20, [x3]
	add	x4, x0, 1984
	add	x3, x0, 1856
	zip1	z20.h, z20.h, z30.h
	ldr	z30, [x4]
	ldr	z21, [x3]
	add	x4, sp, 64
	zip1	z21.h, z21.h, z30.h
	adrp	x3, _ZL6CDOT_O
	add	x3, x3, :lo12:_ZL6CDOT_O
	ldr	z30, [x3]
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z30.h
// 0 "" 2
#NO_APP
	add	x4, x3, 32
	ldr	z28, [x4]
	addvl	x4, sp, #1
	add	x4, x4, 64
	str	z28, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	add	x4, x3, 64
	ldr	z27, [x4]
	addvl	x4, sp, #2
	add	x4, x4, 64
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	add	x4, x3, 96
	ldr	z24, [x4]
	addvl	x4, sp, #3
	add	x4, x4, 64
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 128
	ldr	z23, [x4]
	addvl	x4, sp, #4
	add	x4, x4, 64
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	add	x4, x3, 160
	ldr	z14, [x4]
	addvl	x4, sp, #5
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 192
	ldr	z13, [x4]
	addvl	x4, sp, #6
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 224
	ldr	z12, [x4]
	addvl	x4, sp, #7
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 256
	ldr	z11, [x4]
	mov	z28.d, z31.d
	addvl	x4, sp, #8
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 288
	ldr	z10, [x4]
	addvl	x4, sp, #9
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 320
	ldr	z9, [x4]
	addvl	x4, sp, #10
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 352
	ldr	z8, [x4]
	addvl	x4, sp, #11
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 384
	ldr	z7, [x4]
	addvl	x4, sp, #12
	add	x4, x4, 64
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	add	x4, x3, 416
	ldr	z6, [x4]
	addvl	x4, sp, #13
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 448
	ldr	z5, [x4]
	addvl	x4, sp, #14
	add	x4, x4, 64
	str	z5, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z5.h
// 0 "" 2
#NO_APP
	add	x4, x3, 480
	ldr	z3, [x4]
	addvl	x4, sp, #15
	add	x4, x4, 64
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 512
	ldr	z2, [x4]
	mov	z30.d, z31.d
	addvl	x4, sp, #16
	add	x4, x4, 64
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	add	x4, x3, 544
	ldr	z1, [x4]
	addvl	x4, sp, #17
	add	x4, x4, 64
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 576
	ldr	z0, [x4]
	addvl	x4, sp, #18
	add	x4, x4, 64
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 608
	ldr	z26, [x4]
	addvl	x4, sp, #19
	add	x4, x4, 64
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	add	x4, x3, 640
	ldr	z25, [x4]
	addvl	x4, sp, #20
	add	x4, x4, 64
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	add	x4, x3, 672
	ldr	z4, [x4]
	addvl	x4, sp, #21
	add	x4, x4, 64
	str	z4, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z4.h
// 0 "" 2
#NO_APP
	add	x4, x3, 704
	ldr	z5, [x4]
	addvl	x4, sp, #22
	add	x4, x4, 64
	str	z5, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z5.h
// 0 "" 2
#NO_APP
	add	x4, x3, 736
	mov	z5.d, z30.d
	ldr	z30, [x4]
	addvl	x4, sp, #23
	add	x4, x4, 64
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	add	x4, x3, 768
	ldr	z27, [x4]
	mov	z30.d, z31.d
	addvl	x4, sp, #24
	add	x4, x4, 64
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z27.h
// 0 "" 2
#NO_APP
	add	x4, x3, 800
	ldr	z14, [x4]
	addvl	x4, sp, #25
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 832
	ldr	z26, [x4]
	addvl	x4, sp, #26
	add	x4, x4, 64
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	add	x4, x3, 864
	ldr	z13, [x4]
	addvl	x4, sp, #27
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 896
	ldr	z12, [x4]
	addvl	x4, sp, #28
	add	x4, x4, 64
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 928
	ldr	z11, [x4]
	addvl	x4, sp, #29
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	add	x4, x3, 960
	ldr	z10, [x4]
	addvl	x4, sp, #30
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 992
	ldr	z9, [x4]
	mov	z4.d, z30.d
	addvl	x4, sp, #31
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1024
	ldr	z8, [x4]
	mov	z30.d, z31.d
	cntb	x4
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 1056
	ldr	z7, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1088
	ldr	z6, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 1120
	ldr	z3, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1152
	ldr	z2, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1184
	ldr	z1, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1216
	ldr	z0, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1248
	ldr	z23, [x4]
	lsl	x5, x5, 3
	mov	z25.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z25, [x4]
	add	x4, x3, 1280
	ldr	z25, [x4]
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1312
	ldr	z24, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1344
	ldr	z23, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1376
	ldr	z27, [x4]
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1408
	ldr	z24, [x4]
	cntb	x4, all, mul #11
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z24.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1440
	ldr	z25, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1472
	ldr	z14, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 1504
	mov	z9.d, z30.d
	lsl	x5, x5, 4
	ldr	z30, [x4]
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z30.d, z31.d
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
	add	x4, x3, 1536
	ldr	z9, [x4]
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 1568
	ldr	z0, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1600
	ldr	z13, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1632
	ldr	z12, [x4]
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1664
	ldr	z11, [x4]
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 1696
	ldr	z10, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1728
	ldr	z8, [x4]
	rdvl	x4, #27
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1760
	ldr	z7, [x4]
	mov	z6.d, z30.d
	cntb	x4, all, mul #11
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x5, #22
	mov	z30.d, z31.d
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z6, [x4]
	add	x4, x3, 1792
	ldr	z6, [x4]
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 1824
	ldr	z3, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1856
	ldr	z2, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 1888
	ldr	z1, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1920
	ldr	z26, [x4]
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 1952
	ldr	z23, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1984
	ldr	z14, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 1
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2016
	mov	z24.d, z30.d
	lsl	x5, x5, 6
	ldr	z30, [x4]
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z30.d, z31.d
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z24, [x4]
	add	x4, x3, 2048
	ldr	z24, [x4]
	cntb	x4
	lsl	x4, x4, 6
	add	x4, sp, x4
	add	x4, x4, 64
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 2080
	ldr	z27, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z27, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2112
	ldr	z25, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2144
	ldr	z26, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2176
	ldr	z0, [x4]
	rdvl	x4, #17
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 2208
	ldr	z9, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 2240
	ldr	z7, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 2272
	ldr	z13, [x4]
	lsl	x5, x5, 3
	mov	z11.d, z30.d
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z13.h
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
	str	z11, [x4]
	add	x4, x3, 2304
	ldr	z11, [x4]
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 2336
	ldr	z12, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 2368
	ldr	z10, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2400
	ldr	z8, [x4]
	cntb	x4, all, mul #5
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2432
	ldr	z6, [x4]
	rdvl	x4, #19
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	add	x4, x3, 2464
	ldr	z3, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2496
	ldr	z2, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 2528
	ldr	z1, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	mov	z27.d, z31.d
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
	add	x4, x3, 2560
	ldr	z30, [x4]
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z22.h, z30.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2592
	ldr	z14, [x4]
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2624
	ldr	z26, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z26, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 2656
	ldr	z23, [x4]
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2688
	ldr	z13, [x4]
	rdvl	x4, #21
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2720
	ldr	z7, [x4]
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 2752
	ldr	z24, [x4]
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z24, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 2784
	ldr	z0, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2816
	ldr	z25, [x4]
	mov	z26.d, z31.d
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z25, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z22.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	add	x4, x3, 2848
	ldr	z1, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2880
	ldr	z6, [x4]
	cntb	x4, all, mul #6
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2912
	ldr	z12, [x4]
	cntb	x4, all, mul #13
	lsl	x5, x4, 3
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2944
	ldr	z10, [x4]
	rdvl	x4, #23
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	add	x4, x3, 2976
	ldr	z8, [x4]
	cntb	x4, all, mul #3
	lsl	x5, x4, 5
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3008
	ldr	z3, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3040
	ldr	z2, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3072
	ldr	z9, [x4]
	mov	z25.d, z31.d
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3104
	ldr	z11, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	add	x4, x3, 3136
	ldr	z30, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3168
	ldr	z13, [x4]
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3200
	ldr	z14, [x4]
	rdvl	x4, #25
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	add	x4, x3, 3232
	ldr	z1, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3264
	ldr	z23, [x4]
	cntb	x4, all, mul #6
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z23, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x4, x3, 3296
	ldr	z7, [x4]
	lsl	x6, x5, 4
	add	x5, x5, x6
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3328
	ldr	z6, [x4]
	mov	z24.d, z31.d
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	add	x4, x3, 3360
	ldr	z0, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	add	x4, x3, 3392
	ldr	z2, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	add	x4, x3, 3424
	ldr	z12, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3456
	ldr	z10, [x4]
	rdvl	x4, #27
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	add	x4, x3, 3488
	ldr	z8, [x4]
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3520
	ldr	z11, [x4]
	rdvl	x4, #22
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 3552
	ldr	z3, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3584
	ldr	z9, [x4]
	mov	z23.d, z31.d
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	add	x4, x3, 3616
	ldr	z30, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z30, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	add	x4, x3, 3648
	ldr	z13, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3680
	ldr	z14, [x4]
	rdvl	x4, #23
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z14, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3712
	ldr	z1, [x4]
	rdvl	x4, #29
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3744
	ldr	z7, [x4]
	cntb	x4, all, mul #13
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 3776
	ldr	z0, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3808
	ldr	z6, [x4]
	cntb	x4, all, mul #7
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3840
	ldr	z2, [x4]
	mov	z30.d, z31.d
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	add	x4, x3, 3872
	ldr	z22, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z22, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 3904
	ldr	z15, [x4]
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 3936
	ldr	z16, [x4]
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	add	x4, x3, 3968
	ldr	z17, [x4]
	rdvl	x4, #31
	lsl	x4, x4, 2
	add	x4, sp, x4
	add	x4, x4, 64
	str	z17, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	add	x4, x3, 4000
	ldr	z18, [x4]
	rdvl	x4, #25
	add	x4, x4, x4, lsl 2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 4032
	ldr	z19, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4
	add	x3, x3, 4064
	ldr	z20, [x3]
	lsl	x4, x4, 7
	mov	z22.d, z30.d
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x0, 128
	ldr	z19, [x4]
	add	x5, x0, 384
	add	x4, x0, 640
	ldr	z30, [x5]
	ldr	z20, [x4]
	add	x4, x0, 1152
	ldr	z21, [x4]
	add	x5, x0, 896
	add	x4, x0, 1664
	zip1	z19.h, z19.h, z30.h
	ldr	z30, [x5]
	add	x5, x0, 1408
	ldr	z18, [x5]
	zip1	z20.h, z20.h, z30.h
	ldr	z30, [x4]
	add	x4, x0, 1920
	zip1	z21.h, z21.h, z18.h
	ldr	z18, [x4]
	cntb	x4
	adrp	x3, .LANCHOR0
	lsl	x4, x4, 7
	add	x3, x3, :lo12:.LANCHOR0
	ldr	z16, [x3]
	add	x4, sp, x4
	mov	z17.d, z31.d
	zip1	z30.h, z30.h, z18.h
	add	x4, x4, 64
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 32
	ldr	z18, [x4]
	lsl	x5, x5, 7
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 64
	ldr	z15, [x4]
	lsl	x5, x5, 6
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 96
	ldr	z16, [x4]
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z16, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z30.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 128
	ldr	z18, [x4]
	lsl	x5, x5, 5
	mov	z16.d, z31.d
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5
	add	x4, x3, 160
	ldr	z15, [x4]
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 192
	ldr	z18, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 224
	ldr	z15, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z15, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	add	x4, x3, 256
	ldr	z18, [x4]
	mov	z15.d, z31.d
	rdvl	x4, #17
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 288
	ldr	z18, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	add	x4, x3, 320
	ldr	z18, [x4]
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 352
	ldr	z11, [x4]
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z11, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 384
	ldr	z8, [x4]
	lsl	x5, x5, 4
	mov	z14.d, z31.d
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	add	x4, x3, 416
	ldr	z10, [x4]
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z10, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 448
	ldr	z3, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 480
	ldr	z12, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z12, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	add	x4, x3, 512
	ldr	z9, [x4]
	mov	z11.d, z31.d
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	add	x4, sp, x4
	add	x4, x4, 64
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 544
	ldr	z13, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 576
	ldr	z7, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 608
	ldr	z18, [x4]
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z18, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	add	x4, x3, 640
	ldr	z1, [x4]
	lsl	x5, x5, 3
	mov	z10.d, z31.d
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z1, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 672
	ldr	z6, [x4]
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z6, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	add	x4, x3, 704
	ldr	z2, [x4]
	cntb	x4, all, mul #10
	lsl	x5, x4, 4
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z2, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	add	x4, x3, 736
	ldr	z0, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z0, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z30.h, z0.h
// 0 "" 2
#NO_APP
	add	x4, x3, 768
	ldr	z3, [x4]
	mov	z12.d, z31.d
	rdvl	x4, #19
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z3, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	add	x4, x3, 800
	ldr	z8, [x4]
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z8, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	add	x4, x3, 832
	ldr	z9, [x4]
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z9, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	add	x4, x3, 864
	ldr	z13, [x4]
	cntb	x4, all, mul #5
	lsl	x5, x4, 5
	sub	x4, x5, x4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z13, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	add	x4, x3, 896
	ldr	z7, [x4]
	lsl	x5, x5, 3
	mov	z13.d, z31.d
	addvl	x4, x5, #-4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z7, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 928
	ldr	z19, [x4]
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 960
	ldr	z20, [x4]
	lsl	x5, x5, 4
	addvl	x4, x5, #-2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 992
	ldr	z21, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x0, 768
	ldr	z30, [x4]
	add	x5, x0, 256
	add	x4, x0, 1280
	ldr	z21, [x5]
	zip1	z21.h, z21.h, z30.h
	ldr	z30, [x4]
	add	x4, x3, 1024
	ldr	z19, [x4]
	cntb	x4, all, mul #5
	add	x5, x0, 1792
	ldr	z20, [x5]
	lsl	x4, x4, 5
	zip1	z30.h, z30.h, z20.h
	mov	z9.d, z31.d
	add	x4, sp, x4
	add	x4, x4, 64
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	add	x4, x3, 1056
	ldr	z20, [x4]
	lsl	x5, x5, 5
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1088
	ldr	z20, [x4]
	mov	z8.d, z31.d
	rdvl	x4, #18
	add	x4, x4, x4, lsl 3
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x4, x3, 1120
	ldr	z19, [x4]
	lsl	x6, x5, 3
	add	x5, x5, x6
	lsl	x5, x5, 1
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	add	x4, x3, 1152
	ldr	z20, [x4]
	lsl	x5, x5, 3
	mov	z3.d, z31.d
	addvl	x4, x5, #4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x4, x3, 1184
	ldr	z19, [x4]
	cntb	x4, all, mul #5
	add	x4, x4, x4, lsl 5
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	add	x4, x3, 1216
	ldr	z20, [x4]
	lsl	x5, x5, 3
	mov	z2.d, z31.d
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x4, x5, #2
	add	x4, x4, 64
	add	x4, sp, x4
	str	z20, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1248
	ldr	z21, [x4]
	lsl	x5, x5, 3
	addvl	x4, x5, #-1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	add	x4, x0, 1536
	ldr	z30, [x4]
	add	x5, x0, 512
	add	x4, x3, 1280
	ldr	z19, [x4]
	ldr	z21, [x5]
	rdvl	x4, #21
	zip1	z21.h, z21.h, z30.h
	mov	z30.d, z31.d
	lsl	x4, x4, 3
	add	x4, sp, x4
	add	x4, x4, 64
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	add	x4, x3, 1312
	ldr	z19, [x4]
	lsl	x5, x5, 3
	mov	z7.d, z31.d
	addvl	x4, x5, #1
	add	x4, x4, 64
	add	x4, sp, x4
	str	z19, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	add	x4, x0, 1024
	ldr	z21, [x4]
	ldr	z19, [x0]
	add	x4, x3, 1344
	zip1	z19.h, z19.h, z21.h
	ldr	z21, [x4]
	cntb	x4, all, mul #10
	mov	z20.d, z31.d
	add	x4, x4, x4, lsl 4
	add	x4, x4, 64
	add	x4, sp, x4
	str	z21, [x4]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z21.h
// 0 "" 2
#NO_APP
	add	x3, x3, 1376
	ldr	z1, [x3]
	mov	z21.d, z31.d
	rdvl	x3, #19
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	str	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x7, #20
	cntb	x3, all, mul #12
	add	z19.s, z20.s, z30.s
	lsl	x7, x7, 2
	lsl	x5, x3, 4
	add	z6.s, z19.s, z9.s
	incb	x7, all, mul #4
	sub	x3, x5, x3
	add	z0.s, z6.s, z17.s
	cntb	x5, all, mul #12
	rdvl	x8, #21
	sub	z20.s, z20.s, z30.s
	lsl	x6, x5, 4
	lsl	x7, x7, 1
	add	z18.s, z0.s, z29.s
	sub	x5, x6, x5
	addvl	x6, x7, #4
	sqrshrnb	z18.h, z18.s, #7
	add	x6, x6, 64
	mov	w4, 8
	whilelo	p6.s, wzr, w4
	add	x6, sp, x6
	lsl	x8, x8, 1
	str	z0, [x6]
	mov	w4, 32
	cntb	x6, all, mul #12
	index	z30.s, #0, w4
	add	x3, x3, 64
	incb	x8
	uzp1	z18.h, z18.h, z18.h
	add	x3, sp, x3
	lsl	x7, x6, 4
	sunpklo	z18.s, z18.h
	cntb	x4, all, mul #12
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	sub	x6, x7, x6
	addvl	x3, x7, #-12
	lsl	x8, x8, 2
	add	z18.s, z21.s, z7.s
	lsl	x7, x4, 4
	add	x5, x5, 66
	sub	z21.s, z21.s, z7.s
	sub	x4, x7, x4
	addvl	x7, x8, #1
	add	z7.s, z18.s, z8.s
	add	x7, x7, 64
	add	z1.s, z7.s, z16.s
	add	x5, sp, x5
	add	x7, sp, x7
	add	x6, x6, 68
	str	z1, [x7]
	add	x6, sp, x6
	add	z1.s, z1.s, z28.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	sub	z18.s, z18.s, z8.s
	add	z8.s, z21.s, z3.s
	lsl	x7, x5, 4
	sub	z21.s, z21.s, z3.s
	add	z3.s, z8.s, z15.s
	add	z1.s, z3.s, z5.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z30.s, sxtw 1]
	cntb	x6, all, mul #12
	sub	x5, x7, x5
	add	x3, x3, 70
	sub	z19.s, z19.s, z9.s
	lsl	x7, x6, 4
	add	x3, sp, x3
	add	z9.s, z20.s, z2.s
	sub	x6, x7, x6
	sub	z20.s, z20.s, z2.s
	add	z2.s, z9.s, z14.s
	add	x6, x6, 76
	add	z1.s, z2.s, z4.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	add	x7, sp, x6
	add	z1.s, z20.s, z11.s
	lsl	x6, x3, 4
	rdvl	x9, #22
	sub	z20.s, z20.s, z11.s
	sub	x3, x6, x3
	cntb	x6, all, mul #12
	add	z11.s, z18.s, z12.s
	lsl	x8, x6, 4
	lsl	x9, x9, 3
	sub	z18.s, z18.s, z12.s
	sub	x6, x8, x6
	add	x4, x4, 72
	sub	z9.s, z9.s, z14.s
	addvl	x8, x9, #-2
	add	x4, sp, x4
	sub	z8.s, z8.s, z15.s
	add	x8, x8, 64
	cntb	x9, all, mul #11
	sub	z7.s, z7.s, z16.s
	add	x8, sp, x8
	ldr	z0, [x8]
	add	z0.s, z1.s, z0.s
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x4, z30.s, sxtw 1]
	cntb	x4, all, mul #12
	lsl	x9, x9, 4
	lsl	x8, x4, 4
	add	x5, x5, 74
	add	z0.s, z21.s, z10.s
	sub	x4, x8, x4
	addvl	x8, x9, #-1
	sub	z21.s, z21.s, z10.s
	add	x5, sp, x5
	add	x8, x8, 64
	add	z15.s, z21.s, z27.s
	add	x8, sp, x8
	ldr	z10, [x8]
	rdvl	x9, #22
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	lsl	x9, x9, 3
	lsl	x8, x5, 4
	sqrshrnb	z15.h, z15.s, #7
	sub	x5, x8, x5
	addvl	x8, x9, #2
	uzp1	z15.h, z15.h, z15.h
	add	x8, x8, 64
	add	x3, x3, 78
	sunpklo	z15.s, z15.h
	add	x8, sp, x8
	ldr	z10, [x8]
	add	z12.s, z11.s, z10.s
	cntb	x8, all, mul #11
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x7, z30.s, sxtw 1]
	cntb	x7, all, mul #11
	lsl	x7, x7, 4
	lsl	x8, x8, 3
	add	z12.s, z19.s, z13.s
	add	x3, sp, x3
	add	x7, sp, x7
	sub	z19.s, z19.s, z13.s
	incb	x8
	add	x7, x7, 64
	ldr	z13, [x7]
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	lsl	x7, x3, 4
	lsl	x8, x8, 1
	add	z16.s, z9.s, z25.s
	sub	x3, x7, x3
	addvl	x7, x8, #1
	sqrshrnb	z16.h, z16.s, #7
	add	x7, x7, 64
	add	x6, x6, 80
	uzp1	z16.h, z16.h, z16.h
	add	x7, sp, x7
	ldr	z13, [x7]
	add	x6, sp, x6
	cntb	x7, all, mul #11
	add	z14.s, z19.s, z13.s
	add	x4, x4, 82
	lsl	x7, x7, 4
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x6, z30.s, sxtw 1]
	addvl	x6, x7, #1
	add	x4, sp, x4
	add	x6, x6, 64
	sunpklo	z16.s, z16.h
	add	x6, sp, x6
	ldr	z14, [x6]
	add	x5, x5, 84
	add	z14.s, z18.s, z14.s
	add	x3, x3, 86
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z30.s, sxtw 1]
	cntb	x4, all, mul #12
	add	x5, sp, x5
	st1h	z15.s, p6, [x5, z30.s, sxtw 1]
	lsl	x6, x4, 4
	add	x3, sp, x3
	add	z15.s, z20.s, z26.s
	sub	x4, x6, x4
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	x4, x4, 88
	add	x3, x3, 90
	sub	z6.s, z6.s, z17.s
	add	x4, sp, x4
	add	x3, sp, x3
	st1h	z16.s, p6, [x4, z30.s, sxtw 1]
	add	z16.s, z8.s, z24.s
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	x3, x3, 92
	add	z16.s, z7.s, z23.s
	sqrshrnb	z16.h, z16.s, #7
	add	x3, sp, x3
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	z17.s, z6.s, z22.s
	add	x3, x3, 94
	sqrshrnb	z17.h, z17.s, #7
	uzp1	z17.h, z17.h, z17.h
	add	x3, sp, x3
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	sub	z6.s, z6.s, z22.s
	sqrshrnb	z6.h, z6.s, #7
	add	x3, x3, 96
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z30.s, sxtw 1]
	sub	z7.s, z7.s, z23.s
	addvl	x3, x6, #-12
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	add	x3, x3, 98
	sunpklo	z7.s, z7.h
	sub	z8.s, z8.s, z24.s
	add	x3, sp, x3
	st1h	z7.s, p6, [x3, z30.s, sxtw 1]
	sqrshrnb	z8.h, z8.s, #7
	addvl	x3, x6, #-12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x3, x3, 100
	sub	z9.s, z9.s, z25.s
	sqrshrnb	z9.h, z9.s, #7
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z30.s, sxtw 1]
	uzp1	z9.h, z9.h, z9.h
	addvl	x3, x6, #-12
	sunpklo	z9.s, z9.h
	sub	z20.s, z20.s, z26.s
	add	x3, x3, 102
	sqrshrnb	z20.h, z20.s, #7
	uzp1	z20.h, z20.h, z20.h
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z30.s, sxtw 1]
	sunpklo	z20.s, z20.h
	addvl	x3, x6, #-12
	sub	z21.s, z21.s, z27.s
	sqrshrnb	z21.h, z21.s, #7
	add	x3, x3, 104
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z30.s, sxtw 1]
	sub	z19.s, z19.s, z13.s
	addvl	x3, x6, #-12
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 106
	sunpklo	z19.s, z19.h
	sub	z11.s, z11.s, z10.s
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z30.s, sxtw 1]
	sqrshrnb	z11.h, z11.s, #7
	addvl	x3, x7, #1
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	add	x3, x3, 64
	rdvl	x4, #21
	sub	z2.s, z2.s, z4.s
	add	x3, sp, x3
	ldr	z22, [x3]
	sub	z18.s, z18.s, z22.s
	addvl	x3, x6, #-12
	sqrshrnb	z18.h, z18.s, #7
	uzp1	z18.h, z18.h, z18.h
	add	x3, x3, 108
	sunpklo	z18.s, z18.h
	lsl	x4, x4, 1
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	incb	x4
	addvl	x3, x6, #-12
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x3, x3, 110
	sunpklo	z2.s, z2.h
	lsl	x4, x4, 2
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z30.s, sxtw 1]
	sub	z3.s, z3.s, z5.s
	cntb	x3, all, mul #11
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	lsl	x3, x3, 4
	sunpklo	z3.s, z3.h
	add	x5, x0, 336
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
	sub	z12.s, z12.s, z17.s
	addvl	x3, x6, #-12
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	add	x3, x3, 112
	sunpklo	z12.s, z12.h
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	x3, x3, 114
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z0.s, z0.s, z17.s
	addvl	x3, x6, #-12
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x3, x3, 116
	sunpklo	z0.s, z0.h
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x9, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z1.s, z1.s, z17.s
	addvl	x3, x6, #-12
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x3, x3, 118
	sunpklo	z1.s, z1.h
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	x3, x3, 120
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x6, #-12
	add	x3, x3, 122
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z4, [x3]
	incb	x4, all, mul #4
	addvl	x3, x6, #-12
	sub	z4.s, z4.s, z28.s
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 124
	lsl	x4, x4, 1
	uzp1	z4.h, z4.h, z4.h
	add	x3, sp, x3
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z5.s, z17.s, z29.s
	addvl	x3, x6, #-12
	sqrshrnb	z5.h, z5.s, #7
	add	x6, x0, 208
	add	x3, x3, 126
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	add	x4, sp, x3
	add	x3, x0, 80
	st1h	z5.s, p6, [x4, z30.s, sxtw 1]
	ldr	z22, [x3]
	ldr	z30, [x6]
	add	x3, x0, 592
	ldr	z16, [x3]
	add	x4, x0, 464
	add	x3, x0, 848
	zip1	z22.h, z22.h, z30.h
	ldr	z30, [x4]
	ldr	z17, [x3]
	ldr	z15, [x5]
	add	x4, x0, 720
	add	x3, x0, 1104
	zip1	z15.h, z15.h, z30.h
	ldr	z30, [x4]
	ldr	z18, [x3]
	add	x4, x0, 976
	add	x3, x0, 1360
	zip1	z16.h, z16.h, z30.h
	ldr	z30, [x4]
	ldr	z19, [x3]
	add	x4, x0, 1232
	add	x3, x0, 1616
	zip1	z17.h, z17.h, z30.h
	ldr	z30, [x4]
	ldr	z20, [x3]
	add	x4, x0, 1488
	add	x3, x0, 1872
	zip1	z18.h, z18.h, z30.h
	ldr	z30, [x4]
	ldr	z21, [x3]
	add	x4, x0, 1744
	add	x3, x0, 2000
	ldr	z29, [x3]
	zip1	z19.h, z19.h, z30.h
	ldr	z30, [x4]
	add	x3, sp, 64
	zip1	z20.h, z20.h, z30.h
	zip1	z21.h, z21.h, z29.h
	ldr	z29, [x3]
	mov	z30.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z5.d, z30.d
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	mov	z30.d, z31.d
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z4.d, z30.d
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	mov	z30.d, z31.d
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z29.d, z30.d
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, x9, #-2
	mov	z30.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z29, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	mov	z29.d, z30.d
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, x7, #-1
	mov	z30.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z29, [x3]
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z28.d, z30.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z30.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z28, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z29.d, z30.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, x7, #1
	mov	z30.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z29, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z28.d, z30.d
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, x8, #1
	mov	z30.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z29, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z29.d, z30.d
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, x9, #2
	add	x3, x3, 64
	add	x3, sp, x3
	str	z29, [x3]
	mov	z29.d, z31.d
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z28.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z27.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z22.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z26.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z22.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z25.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	mov	z24.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z23.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	mov	z30.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z22.d, z30.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 400
	ldr	z30, [x3]
	add	x4, x0, 144
	add	x3, x0, 656
	ldr	z20, [x3]
	ldr	z19, [x4]
	add	x3, x0, 1168
	ldr	z21, [x3]
	add	x4, x0, 912
	add	x3, x0, 1680
	zip1	z19.h, z19.h, z30.h
	ldr	z30, [x4]
	add	x4, x0, 1424
	ldr	z18, [x4]
	zip1	z20.h, z20.h, z30.h
	ldr	z30, [x3]
	add	x3, x0, 1936
	zip1	z21.h, z21.h, z18.h
	ldr	z18, [x3]
	cntb	x3
	mov	z17.d, z31.d
	lsl	x3, x3, 7
	zip1	z30.h, z30.h, z18.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z16.d, z31.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z30.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z15.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z30.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z14.d, z31.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z30.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z11.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z30.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z10.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z30.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z12.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z30.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z13.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	add	x3, x0, 784
	ldr	z30, [x3]
	add	x4, x0, 272
	add	x3, x0, 1296
	ldr	z21, [x4]
	zip1	z21.h, z21.h, z30.h
	ldr	z30, [x3]
	add	x3, x0, 1808
	ldr	z20, [x3]
	cntb	x3, all, mul #5
	mov	z9.d, z31.d
	zip1	z30.h, z30.h, z20.h
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z8.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z3.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z30.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z2.d, z31.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1552
	ldr	z30, [x3]
	add	x4, x0, 528
	rdvl	x3, #21
	ldr	z21, [x4]
	mov	z18.d, z31.d
	lsl	x3, x3, 3
	zip1	z30.h, z21.h, z30.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z7.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1040
	ldr	z30, [x3]
	add	x4, x0, 16
	cntb	x3, all, mul #10
	ldr	z21, [x4]
	mov	z20.d, z31.d
	add	x3, x3, x3, lsl 4
	zip1	z30.h, z21.h, z30.h
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z30.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z21.d, z31.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z30.h, z19.h
// 0 "" 2
#NO_APP
	mov	w4, 32
	cntb	x3, all, mul #12
	index	z30.s, #0, w4
	lsl	x5, x3, 4
	cntb	x4, all, mul #12
	add	z19.s, z20.s, z18.s
	sub	x3, x5, x3
	lsl	x5, x4, 4
	add	z6.s, z19.s, z9.s
	sub	x4, x5, x4
	rdvl	x7, #20
	add	z0.s, z6.s, z17.s
	add	x4, x4, 578
	lsl	x7, x7, 2
	sub	z20.s, z20.s, z18.s
	add	x5, sp, x4
	cntb	x4, all, mul #12
	add	z18.s, z0.s, z5.s
	lsl	x6, x4, 4
	incb	x7, all, mul #4
	sqrshrnb	z18.h, z18.s, #7
	sub	x4, x6, x4
	add	x3, x3, 576
	uzp1	z18.h, z18.h, z18.h
	add	x4, x4, 580
	lsl	x7, x7, 1
	sunpklo	z18.s, z18.h
	add	x6, sp, x4
	addvl	x4, x7, #4
	sub	z19.s, z19.s, z9.s
	add	x4, x4, 64
	add	x3, sp, x3
	add	z9.s, z20.s, z2.s
	add	x4, sp, x4
	rdvl	x8, #21
	str	z0, [x4]
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	lsl	x8, x8, 1
	cntb	x3, all, mul #12
	lsl	x4, x3, 4
	incb	x8
	add	z18.s, z21.s, z7.s
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	sub	z21.s, z21.s, z7.s
	lsl	x7, x4, 4
	lsl	x8, x8, 2
	add	z7.s, z18.s, z8.s
	sub	x4, x7, x4
	addvl	x7, x8, #1
	add	z1.s, z7.s, z16.s
	add	x7, x7, 64
	sub	z18.s, z18.s, z8.s
	add	z8.s, z21.s, z3.s
	add	x7, sp, x7
	str	z1, [x7]
	add	z1.s, z1.s, z4.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	sub	z21.s, z21.s, z3.s
	lsl	x7, x5, 4
	add	z3.s, z8.s, z15.s
	cntb	x8, all, mul #11
	sub	x5, x7, x5
	addvl	x7, x9, #-2
	sub	z20.s, z20.s, z2.s
	add	x7, x7, 64
	lsl	x8, x8, 4
	add	z2.s, z9.s, z14.s
	add	x7, sp, x7
	ldr	z0, [x7]
	add	z1.s, z3.s, z0.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z30.s, sxtw 1]
	cntb	x6, all, mul #12
	add	x3, x3, 582
	lsl	x7, x6, 4
	add	x3, sp, x3
	sub	z9.s, z9.s, z14.s
	sub	x6, x7, x6
	add	x4, x4, 584
	sub	z8.s, z8.s, z15.s
	add	x6, x6, 588
	add	x4, sp, x4
	sub	z7.s, z7.s, z16.s
	add	x7, sp, x6
	addvl	x6, x8, #-1
	add	z16.s, z9.s, z25.s
	add	x6, x6, 64
	cntb	x9, all, mul #11
	sqrshrnb	z16.h, z16.s, #7
	add	x6, sp, x6
	ldr	z0, [x6]
	add	z1.s, z2.s, z0.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	add	z1.s, z20.s, z11.s
	lsl	x6, x3, 4
	lsl	x9, x9, 4
	sub	z20.s, z20.s, z11.s
	sub	x3, x6, x3
	cntb	x6, all, mul #12
	add	z11.s, z18.s, z12.s
	lsl	x8, x6, 4
	add	x5, x5, 586
	sub	z18.s, z18.s, z12.s
	sub	x6, x8, x6
	cntb	x8, all, mul #11
	uzp1	z16.h, z16.h, z16.h
	lsl	x8, x8, 4
	add	x5, sp, x5
	sunpklo	z16.s, z16.h
	add	x8, sp, x8
	add	x3, x3, 590
	sub	z6.s, z6.s, z17.s
	add	x8, x8, 64
	ldr	z0, [x8]
	add	z0.s, z1.s, z0.s
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x4, z30.s, sxtw 1]
	cntb	x4, all, mul #12
	add	z0.s, z21.s, z10.s
	lsl	x8, x4, 4
	sub	z21.s, z21.s, z10.s
	add	x3, sp, x3
	sub	x4, x8, x4
	addvl	x8, x9, #1
	add	z15.s, z21.s, z27.s
	cntb	x9, all, mul #11
	add	x8, x8, 64
	sqrshrnb	z15.h, z15.s, #7
	lsl	x9, x9, 3
	add	x8, sp, x8
	ldr	z10, [x8]
	incb	x9
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	lsl	x9, x9, 1
	uzp1	z15.h, z15.h, z15.h
	lsl	x8, x5, 4
	add	x6, x6, 592
	sunpklo	z15.s, z15.h
	sub	x5, x8, x5
	addvl	x8, x9, #1
	add	z17.s, z6.s, z22.s
	add	x8, x8, 64
	add	x6, sp, x6
	sqrshrnb	z17.h, z17.s, #7
	add	x8, sp, x8
	ldr	z10, [x8]
	add	z12.s, z11.s, z10.s
	rdvl	x8, #22
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	lsl	x8, x8, 3
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x7, z30.s, sxtw 1]
	addvl	x7, x8, #2
	add	z12.s, z19.s, z13.s
	sub	z19.s, z19.s, z13.s
	add	x7, x7, 64
	add	z14.s, z19.s, z29.s
	add	x4, x4, 594
	add	x7, sp, x7
	ldr	z13, [x7]
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	sqrshrnb	z14.h, z14.s, #7
	lsl	x7, x3, 4
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	sub	x3, x7, x3
	st1h	z14.s, p6, [x6, z30.s, sxtw 1]
	add	x4, sp, x4
	add	z14.s, z18.s, z28.s
	add	x5, x5, 596
	add	x3, x3, 598
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z30.s, sxtw 1]
	add	x5, sp, x5
	add	x3, sp, x3
	st1h	z15.s, p6, [x5, z30.s, sxtw 1]
	addvl	x4, x7, #-12
	add	z15.s, z20.s, z26.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	x4, x4, 600
	add	x3, x3, 602
	add	x4, sp, x4
	st1h	z16.s, p6, [x4, z30.s, sxtw 1]
	add	x3, sp, x3
	add	z16.s, z8.s, z24.s
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	z16.s, z7.s, z23.s
	sqrshrnb	z16.h, z16.s, #7
	add	x3, x3, 604
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	add	x3, sp, x3
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	uzp1	z17.h, z17.h, z17.h
	addvl	x3, x7, #-12
	sunpklo	z17.s, z17.h
	sub	z6.s, z6.s, z22.s
	add	x3, x3, 606
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x3, sp, x3
	st1h	z17.s, p6, [x3, z30.s, sxtw 1]
	sunpklo	z6.s, z6.h
	addvl	x3, x7, #-12
	sub	z7.s, z7.s, z23.s
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 608
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z30.s, sxtw 1]
	sub	z8.s, z8.s, z24.s
	addvl	x3, x7, #-12
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	add	x3, x3, 610
	sunpklo	z8.s, z8.h
	sub	z9.s, z9.s, z25.s
	add	x3, sp, x3
	st1h	z7.s, p6, [x3, z30.s, sxtw 1]
	sqrshrnb	z9.h, z9.s, #7
	addvl	x3, x7, #-12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x3, x3, 612
	sub	z20.s, z20.s, z26.s
	sqrshrnb	z20.h, z20.s, #7
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z30.s, sxtw 1]
	uzp1	z20.h, z20.h, z20.h
	addvl	x3, x7, #-12
	sunpklo	z20.s, z20.h
	sub	z21.s, z21.s, z27.s
	add	x3, x3, 614
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z30.s, sxtw 1]
	sunpklo	z21.s, z21.h
	addvl	x3, x7, #-12
	sub	z18.s, z18.s, z28.s
	sqrshrnb	z18.h, z18.s, #7
	add	x3, x3, 616
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z30.s, sxtw 1]
	sub	z19.s, z19.s, z29.s
	addvl	x3, x7, #-12
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 618
	sunpklo	z19.s, z19.h
	cntb	x4, all, mul #11
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 4
	addvl	x3, x7, #-12
	sub	z11.s, z11.s, z10.s
	sqrshrnb	z11.h, z11.s, #7
	add	x3, x3, 620
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	add	x6, x0, 224
	addvl	x3, x7, #-12
	add	x5, x0, 352
	add	x3, x3, 622
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x8, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z12.s, z12.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	add	x3, x3, 624
	sunpklo	z12.s, z12.h
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	x3, x3, 626
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z0.s, z0.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x3, x3, 628
	sunpklo	z0.s, z0.h
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
	sub	z1.s, z1.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x3, x3, 630
	sunpklo	z1.s, z1.h
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z2.s, z2.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x3, x3, 632
	sunpklo	z2.s, z2.h
	incb	x4
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x8, #-2
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z3.s, z3.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 634
	sunpklo	z3.s, z3.h
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z17, [x3]
	incb	x4, all, mul #4
	addvl	x3, x7, #-12
	sub	z4.s, z17.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 636
	lsl	x4, x4, 1
	uzp1	z4.h, z4.h, z4.h
	add	x3, sp, x3
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z5.s, z17.s, z5.s
	addvl	x3, x7, #-12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x3, x3, 638
	sunpklo	z5.s, z5.h
	add	x4, sp, x3
	add	x3, x0, 96
	st1h	z5.s, p6, [x4, z30.s, sxtw 1]
	ldr	z15, [x3]
	ldr	z29, [x6]
	add	x3, x0, 608
	ldr	z17, [x3]
	add	x4, x0, 480
	add	x3, x0, 864
	zip1	z15.h, z15.h, z29.h
	ldr	z29, [x4]
	ldr	z18, [x3]
	ldr	z16, [x5]
	add	x4, x0, 736
	add	x3, x0, 1120
	zip1	z16.h, z16.h, z29.h
	ldr	z29, [x4]
	ldr	z19, [x3]
	add	x4, x0, 992
	add	x3, x0, 1376
	zip1	z17.h, z17.h, z29.h
	ldr	z29, [x4]
	ldr	z20, [x3]
	add	x4, x0, 1248
	add	x3, x0, 1632
	zip1	z18.h, z18.h, z29.h
	ldr	z29, [x4]
	ldr	z21, [x3]
	add	x4, x0, 1504
	add	x3, x0, 1888
	zip1	z19.h, z19.h, z29.h
	ldr	z29, [x4]
	add	x4, x0, 1760
	ldr	z28, [x4]
	zip1	z20.h, z20.h, z29.h
	ldr	z29, [x3]
	add	x3, x0, 2016
	ldr	z27, [x3]
	zip1	z21.h, z21.h, z28.h
	add	x3, sp, 64
	zip1	z29.h, z29.h, z27.h
	ldr	z27, [x3]
	mov	z28.d, z31.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z5.d, z28.d
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z29.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	mov	z28.d, z31.d
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z4.d, z28.d
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z29.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	mov	z28.d, z31.d
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z22.d, z28.d
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, x8, #-2
	mov	z28.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z22, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	mov	z28.d, z31.d
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z28, [x3]
	mov	z28.d, z31.d
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z27.d, z28.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z28.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, x9, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	mov	z28.d, z31.d
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z26.d, z28.d
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, x8, #2
	mov	z28.d, z31.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z26, [x3]
	cntb	x3
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z27.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z29.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z26.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z29.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z25.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z29.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z24.d, z31.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	add	x4, x4, x4, lsl 4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z29.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	mov	z23.d, z31.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z29.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z22.d, z31.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z29.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z29.h, z21.h
// 0 "" 2
#NO_APP
	add	x3, x0, 416
	ldr	z29, [x3]
	add	x4, x0, 160
	add	x3, x0, 672
	ldr	z19, [x3]
	ldr	z18, [x4]
	add	x3, x0, 1184
	ldr	z20, [x3]
	add	x4, x0, 928
	add	x3, x0, 1696
	ldr	z21, [x3]
	zip1	z18.h, z18.h, z29.h
	add	x3, x0, 1952
	ldr	z16, [x3]
	ldr	z29, [x4]
	cntb	x3
	add	x4, x0, 1440
	zip1	z19.h, z19.h, z29.h
	lsl	x3, x3, 7
	ldr	z29, [x4]
	zip1	z21.h, z21.h, z16.h
	add	x3, sp, x3
	zip1	z20.h, z20.h, z29.h
	movi	d29, #0
	add	x3, x3, 64
	ldr	z16, [x3]
	mov	z17.d, z29.d
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z18.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z16.d, z29.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z18.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z15.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z14.d, z29.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z11.d, z29.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z10.d, z29.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z12.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z13.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 800
	ldr	z21, [x3]
	add	x4, x0, 288
	add	x3, x0, 1312
	ldr	z20, [x4]
	zip1	z20.h, z20.h, z21.h
	ldr	z21, [x3]
	add	x3, x0, 1824
	ldr	z19, [x3]
	cntb	x3, all, mul #5
	zip1	z21.h, z21.h, z19.h
	mov	z9.d, z29.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z8.d, z29.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z3.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z2.d, z29.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1568
	ldr	z21, [x3]
	add	x4, x0, 544
	rdvl	x3, #21
	ldr	z20, [x4]
	mov	z18.d, z29.d
	lsl	x3, x3, 3
	zip1	z21.h, z20.h, z21.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z7.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1056
	ldr	z19, [x3]
	add	x4, x0, 32
	cntb	x3, all, mul #10
	ldr	z21, [x4]
	mov	z20.d, z29.d
	add	x3, x3, x3, lsl 4
	zip1	z19.h, z21.h, z19.h
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z21.d, z29.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x4, x7, #-12
	addvl	x3, x7, #-12
	add	z19.s, z20.s, z18.s
	add	x4, x4, 1090
	add	x3, x3, 1088
	add	z6.s, z19.s, z9.s
	add	x5, sp, x4
	addvl	x4, x7, #-12
	add	z1.s, z6.s, z17.s
	rdvl	x7, #20
	add	x4, x4, 1092
	sub	z20.s, z20.s, z18.s
	lsl	x7, x7, 2
	add	x6, sp, x4
	add	z18.s, z1.s, z5.s
	incb	x7, all, mul #4
	add	x3, sp, x3
	sqrshrnb	z18.h, z18.s, #7
	rdvl	x8, #21
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	lsl	x7, x7, 1
	lsl	x8, x8, 1
	sub	z19.s, z19.s, z9.s
	addvl	x4, x7, #4
	incb	x8
	add	z9.s, z20.s, z2.s
	add	x4, x4, 64
	sub	z20.s, z20.s, z2.s
	add	z2.s, z9.s, z14.s
	add	x4, sp, x4
	str	z1, [x4]
	lsl	x8, x8, 2
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	add	z18.s, z21.s, z7.s
	lsl	x4, x3, 4
	sub	z21.s, z21.s, z7.s
	add	z7.s, z18.s, z8.s
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	add	z0.s, z7.s, z16.s
	lsl	x7, x4, 4
	add	z1.s, z0.s, z4.s
	sqrshrnb	z1.h, z1.s, #7
	sub	x4, x7, x4
	addvl	x7, x8, #1
	uzp1	z1.h, z1.h, z1.h
	add	x7, x7, 64
	sunpklo	z1.s, z1.h
	rdvl	x8, #22
	add	x7, sp, x7
	str	z0, [x7]
	lsl	x8, x8, 3
	st1h	z1.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	sub	z18.s, z18.s, z8.s
	lsl	x7, x5, 4
	add	z8.s, z21.s, z3.s
	sub	z21.s, z21.s, z3.s
	sub	x5, x7, x5
	addvl	x7, x8, #-2
	add	z3.s, z8.s, z15.s
	add	x7, x7, 64
	cntb	x8, all, mul #11
	sub	z9.s, z9.s, z14.s
	add	x7, sp, x7
	ldr	z0, [x7]
	add	z1.s, z3.s, z0.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z30.s, sxtw 1]
	cntb	x6, all, mul #12
	lsl	x8, x8, 4
	lsl	x7, x6, 4
	add	x3, x3, 1094
	sub	z8.s, z8.s, z15.s
	sub	x6, x7, x6
	add	x3, sp, x3
	sub	z7.s, z7.s, z16.s
	add	x6, x6, 1100
	add	x4, x4, 1096
	add	z16.s, z9.s, z24.s
	add	x7, sp, x6
	addvl	x6, x8, #-1
	sqrshrnb	z16.h, z16.s, #7
	add	x6, x6, 64
	add	x4, sp, x4
	uzp1	z16.h, z16.h, z16.h
	add	x6, sp, x6
	ldr	z0, [x6]
	add	z1.s, z2.s, z0.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	add	z1.s, z20.s, z11.s
	lsl	x6, x3, 4
	cntb	x9, all, mul #11
	sub	z20.s, z20.s, z11.s
	sub	x3, x6, x3
	cntb	x6, all, mul #12
	add	z11.s, z18.s, z12.s
	lsl	x8, x6, 4
	lsl	x9, x9, 4
	sub	z18.s, z18.s, z12.s
	sub	x6, x8, x6
	cntb	x8, all, mul #11
	sunpklo	z16.s, z16.h
	lsl	x8, x8, 4
	add	x5, x5, 1098
	sub	z6.s, z6.s, z17.s
	add	x8, sp, x8
	add	x5, sp, x5
	add	z17.s, z6.s, z31.s
	add	x8, x8, 64
	ldr	z0, [x8]
	add	z0.s, z1.s, z0.s
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x4, z30.s, sxtw 1]
	cntb	x4, all, mul #12
	add	z0.s, z21.s, z10.s
	lsl	x8, x4, 4
	sub	z21.s, z21.s, z10.s
	add	x3, x3, 1102
	sub	x4, x8, x4
	addvl	x8, x9, #1
	add	z15.s, z21.s, z26.s
	cntb	x9, all, mul #11
	add	x8, x8, 64
	sqrshrnb	z15.h, z15.s, #7
	lsl	x9, x9, 3
	add	x8, sp, x8
	ldr	z10, [x8]
	incb	x9
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x5, z30.s, sxtw 1]
	cntb	x5, all, mul #12
	lsl	x9, x9, 1
	uzp1	z15.h, z15.h, z15.h
	lsl	x8, x5, 4
	add	x3, sp, x3
	sunpklo	z15.s, z15.h
	sub	x5, x8, x5
	addvl	x8, x9, #1
	sqrshrnb	z17.h, z17.s, #7
	add	x8, x8, 64
	add	x6, x6, 1104
	uzp1	z17.h, z17.h, z17.h
	add	x8, sp, x8
	ldr	z10, [x8]
	add	z12.s, z11.s, z10.s
	rdvl	x8, #22
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	lsl	x8, x8, 3
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x7, z30.s, sxtw 1]
	addvl	x7, x8, #2
	add	z12.s, z19.s, z13.s
	sub	z19.s, z19.s, z13.s
	add	x7, x7, 64
	add	x6, sp, x6
	add	z14.s, z19.s, z28.s
	add	x7, sp, x7
	ldr	z13, [x7]
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #12
	add	x4, x4, 1106
	lsl	x7, x3, 4
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sub	x3, x7, x3
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x6, z30.s, sxtw 1]
	add	x4, sp, x4
	add	z14.s, z18.s, z27.s
	add	x5, x5, 1108
	add	x3, x3, 1110
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z30.s, sxtw 1]
	add	x5, sp, x5
	add	x3, sp, x3
	st1h	z15.s, p6, [x5, z30.s, sxtw 1]
	addvl	x4, x7, #-12
	add	z15.s, z20.s, z25.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	x4, x4, 1112
	add	x3, x3, 1114
	sunpklo	z17.s, z17.h
	add	x4, sp, x4
	add	x3, sp, x3
	st1h	z16.s, p6, [x4, z30.s, sxtw 1]
	add	z16.s, z8.s, z23.s
	sqrshrnb	z16.h, z16.s, #7
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	x3, x3, 1116
	add	z16.s, z7.s, z22.s
	sqrshrnb	z16.h, z16.s, #7
	add	x3, sp, x3
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	sub	z6.s, z6.s, z31.s
	add	x3, x3, 1118
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x3, sp, x3
	st1h	z17.s, p6, [x3, z30.s, sxtw 1]
	sunpklo	z6.s, z6.h
	addvl	x3, x7, #-12
	sub	z7.s, z7.s, z22.s
	sqrshrnb	z7.h, z7.s, #7
	add	x3, x3, 1120
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x3, sp, x3
	st1h	z6.s, p6, [x3, z30.s, sxtw 1]
	sub	z8.s, z8.s, z23.s
	addvl	x3, x7, #-12
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	add	x3, x3, 1122
	sunpklo	z8.s, z8.h
	sub	z9.s, z9.s, z24.s
	add	x3, sp, x3
	st1h	z7.s, p6, [x3, z30.s, sxtw 1]
	sqrshrnb	z9.h, z9.s, #7
	addvl	x3, x7, #-12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x3, x3, 1124
	sub	z20.s, z20.s, z25.s
	sqrshrnb	z20.h, z20.s, #7
	add	x3, sp, x3
	st1h	z8.s, p6, [x3, z30.s, sxtw 1]
	uzp1	z20.h, z20.h, z20.h
	addvl	x3, x7, #-12
	sunpklo	z20.s, z20.h
	sub	z21.s, z21.s, z26.s
	add	x3, x3, 1126
	sqrshrnb	z21.h, z21.s, #7
	uzp1	z21.h, z21.h, z21.h
	add	x3, sp, x3
	st1h	z9.s, p6, [x3, z30.s, sxtw 1]
	sunpklo	z21.s, z21.h
	addvl	x3, x7, #-12
	sub	z18.s, z18.s, z27.s
	sqrshrnb	z18.h, z18.s, #7
	add	x3, x3, 1128
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x3, sp, x3
	st1h	z20.s, p6, [x3, z30.s, sxtw 1]
	sub	z19.s, z19.s, z28.s
	addvl	x3, x7, #-12
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x3, x3, 1130
	sunpklo	z19.s, z19.h
	cntb	x4, all, mul #11
	add	x3, sp, x3
	st1h	z21.s, p6, [x3, z30.s, sxtw 1]
	lsl	x4, x4, 4
	addvl	x3, x7, #-12
	sub	z11.s, z11.s, z10.s
	sqrshrnb	z11.h, z11.s, #7
	add	x3, x3, 1132
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	add	x3, sp, x3
	st1h	z18.s, p6, [x3, z30.s, sxtw 1]
	add	x6, x0, 240
	addvl	x3, x7, #-12
	add	x5, x0, 368
	add	x3, x3, 1134
	add	x3, sp, x3
	st1h	z19.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x8, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z12.s, z12.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z12.h, z12.s, #7
	uzp1	z12.h, z12.h, z12.h
	add	x3, x3, 1136
	sunpklo	z12.s, z12.h
	add	x3, sp, x3
	st1h	z12.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x7, #-12
	add	x3, x3, 1138
	add	x3, sp, x3
	st1h	z11.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	cntb	x4, all, mul #11
	add	x3, x3, 64
	lsl	x4, x4, 4
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z0.s, z0.s, z31.s
	addvl	x3, x7, #-12
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x3, x3, 1140
	sunpklo	z0.s, z0.h
	add	x3, sp, x3
	st1h	z0.s, p6, [x3, z30.s, sxtw 1]
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z17, [x3]
	sub	z1.s, z1.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x3, x3, 1142
	sunpklo	z1.s, z1.h
	add	x3, sp, x3
	st1h	z1.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #-1
	rdvl	x4, #21
	add	x3, x3, 64
	lsl	x4, x4, 1
	add	x3, sp, x3
	ldr	z31, [x3]
	sub	z2.s, z2.s, z31.s
	addvl	x3, x7, #-12
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x3, x3, 1144
	sunpklo	z2.s, z2.h
	incb	x4
	add	x3, sp, x3
	st1h	z2.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x8, #-2
	lsl	x4, x4, 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
	sub	z3.s, z3.s, z17.s
	addvl	x3, x7, #-12
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x3, x3, 1146
	sunpklo	z3.s, z3.h
	add	x3, sp, x3
	st1h	z3.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #1
	rdvl	x4, #20
	add	x3, x3, 64
	lsl	x4, x4, 2
	add	x3, sp, x3
	ldr	z17, [x3]
	incb	x4, all, mul #4
	addvl	x3, x7, #-12
	sub	z4.s, z17.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	add	x3, x3, 1148
	lsl	x4, x4, 1
	uzp1	z4.h, z4.h, z4.h
	add	x3, sp, x3
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x3, z30.s, sxtw 1]
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z4, [x3]
	sub	z5.s, z4.s, z5.s
	addvl	x3, x7, #-12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x3, x3, 1150
	sunpklo	z5.s, z5.h
	add	x4, sp, x3
	add	x3, x0, 112
	st1h	z5.s, p6, [x4, z30.s, sxtw 1]
	ldr	z21, [x3]
	ldr	z31, [x6]
	add	x3, x0, 624
	ldr	z15, [x3]
	add	x4, x0, 496
	add	x3, x0, 880
	zip1	z21.h, z21.h, z31.h
	ldr	z31, [x4]
	ldr	z16, [x3]
	ldr	z14, [x5]
	add	x4, x0, 752
	add	x3, x0, 1136
	zip1	z14.h, z14.h, z31.h
	ldr	z31, [x4]
	ldr	z17, [x3]
	add	x4, x0, 1008
	add	x3, x0, 1392
	zip1	z15.h, z15.h, z31.h
	ldr	z31, [x4]
	ldr	z18, [x3]
	add	x4, x0, 1264
	add	x3, x0, 1648
	zip1	z16.h, z16.h, z31.h
	ldr	z31, [x4]
	ldr	z19, [x3]
	add	x4, x0, 1520
	add	x3, x0, 1904
	zip1	z17.h, z17.h, z31.h
	ldr	z31, [x4]
	ldr	z20, [x3]
	add	x4, x0, 1776
	add	x3, x0, 2032
	zip1	z18.h, z18.h, z31.h
	ldr	z31, [x4]
	ldr	z30, [x3]
	zip1	z19.h, z19.h, z31.h
	add	x3, sp, 64
	ldr	z27, [x3]
	mov	z31.d, z29.d
	zip1	z20.h, z20.h, z30.h
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #1
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #2
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #4
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #5
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #6
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #7
	mov	z5.d, z31.d
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #8
	mov	z31.d, z29.d
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #9
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #10
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #11
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #12
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #13
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #14
	add	x3, x3, 64
	ldr	z4, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #15
	mov	z4.d, z31.d
	add	x3, x3, 64
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #16
	mov	z31.d, z29.d
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #17
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #18
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #19
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #20
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #21
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #22
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z30.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #23
	mov	z28.d, z31.d
	add	x3, x3, 64
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x3, x8, #-2
	mov	z31.d, z29.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z28, [x3]
	addvl	x3, sp, #24
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #25
	add	x3, x3, 64
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #26
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #27
	add	x3, x3, 64
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #28
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #29
	add	x3, x3, 64
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #30
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x3, sp, #31
	mov	z27.d, z31.d
	add	x3, x3, 64
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z31.d, z29.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z27, [x3]
	cntb	x3
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	mov	z28.d, z31.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z31.d, z29.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	str	z28, [x3]
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	mov	z26.d, z31.d
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	mov	z31.d, z29.d
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	str	z26, [x3]
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z30, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z28, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x3, x8, #2
	mov	z30.d, z29.d
	add	x3, x3, 64
	add	x3, sp, x3
	str	z31, [x3]
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z14.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z15.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z17.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 1
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z19.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z26, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z20.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z28.d, z29.d
	lsl	x3, x3, 6
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 5
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z27, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z27.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z14.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z26.d, z29.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z25, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 2
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z24, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	mov	z25.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z22, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #11
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x4, x3, 3
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z24.d, z29.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #3
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z14.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #6
	lsl	x4, x4, 4
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z23, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x4, #25
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z31.h
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
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	mov	z23.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #13
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #26
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #27
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #22
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	mov	z22.d, z29.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #7
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z14.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #14
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #23
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #29
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z1, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z31, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	mov	z31.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z2, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #15
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	decb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z21, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #31
	lsl	x3, x3, 2
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	add	x3, x3, x3, lsl 2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z17, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4
	mov	z21.d, z31.d
	lsl	x4, x4, 7
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	add	x3, x0, 432
	ldr	z31, [x3]
	add	x4, x0, 176
	add	x3, x0, 688
	ldr	z19, [x3]
	ldr	z18, [x4]
	add	x3, x0, 1200
	ldr	z20, [x3]
	add	x4, x0, 944
	add	x3, x0, 1712
	zip1	z18.h, z18.h, z31.h
	ldr	z31, [x4]
	zip1	z19.h, z19.h, z31.h
	ldr	z31, [x3]
	add	x3, x0, 1968
	ldr	z16, [x3]
	cntb	x3
	add	x4, x0, 1456
	lsl	x3, x3, 7
	ldr	z17, [x4]
	zip1	z31.h, z31.h, z16.h
	add	x3, sp, x3
	zip1	z20.h, z20.h, z17.h
	mov	z17.d, z29.d
	add	x3, x3, 64
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z18.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 7
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 6
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 6
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z16, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z16.d, z29.d
	lsl	x4, x4, 5
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z18.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4
	lsl	x4, x4, 5
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z15, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z31.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	mov	z15.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #2
	lsl	x4, x4, 4
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z14, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z11, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z31.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z14.d, z29.d
	lsl	x4, x4, 4
	incb	x4, all, mul #4
	lsl	x4, x4, 1
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #17
	lsl	x4, x4, 1
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z10, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z12, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z31.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	mov	z12.d, z29.d
	lsl	x3, x3, 4
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 4
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 3
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 3
	incb	x4
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #4
	mov	z10.d, z29.d
	lsl	x4, x4, 3
	incb	x4, all, mul #4
	lsl	x4, x4, 2
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	lsl	x4, x4, 2
	incb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z6, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x4, x3, 4
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #19
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z9, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z31.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	mov	z11.d, z29.d
	lsl	x3, x3, 3
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z7, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z8, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x4, #18
	lsl	x4, x4, 1
	incb	x4, all, mul #2
	lsl	x4, x4, 2
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z0, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x4, x3, 5
	sub	x3, x4, x3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z13, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z13.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #-4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z3, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 3
	decb	x4
	lsl	x4, x4, 2
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	lsl	x4, x4, 4
	addvl	x3, x4, #-2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 816
	ldr	z31, [x3]
	add	x4, x0, 304
	add	x3, x0, 1328
	ldr	z20, [x4]
	zip1	z20.h, z20.h, z31.h
	ldr	z31, [x3]
	add	x3, x0, 1840
	ldr	z19, [x3]
	cntb	x3, all, mul #5
	zip1	z31.h, z31.h, z19.h
	mov	z1.d, z29.d
	lsl	x3, x3, 5
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #5
	lsl	x4, x4, 5
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z1.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	mov	z9.d, z29.d
	add	x3, x3, x3, lsl 3
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z19, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #9
	add	x4, x4, x4, lsl 3
	lsl	x4, x4, 1
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #20
	mov	z3.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #4
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	add	x3, x3, x3, lsl 5
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x4, all, mul #10
	mov	z2.d, z29.d
	lsl	x4, x4, 3
	incb	x4, all, mul #2
	lsl	x4, x4, 1
	addvl	x3, x4, #2
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z18, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	lsl	x4, x4, 3
	addvl	x3, x4, #-1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 1584
	ldr	z31, [x3]
	add	x4, x0, 560
	rdvl	x3, #21
	ldr	z20, [x4]
	mov	z18.d, z29.d
	lsl	x3, x3, 3
	zip1	z31.h, z20.h, z31.h
	add	x3, sp, x3
	add	x3, x3, 64
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x4, #21
	mov	z8.d, z29.d
	lsl	x4, x4, 3
	addvl	x3, x4, #1
	add	x3, x3, 64
	add	x3, sp, x3
	ldr	z20, [x3]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	add	x3, x0, 48
	add	x0, x0, 1072
	ldr	z31, [x0]
	cntb	x0, all, mul #10
	ldr	z19, [x3]
	mov	z20.d, z29.d
	add	x0, x0, x0, lsl 4
	zip1	z31.h, z19.h, z31.h
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	rdvl	x6, #21
	add	z19.s, z20.s, z18.s
	lsl	x5, x5, 2
	lsl	x6, x6, 1
	add	z6.s, z19.s, z1.s
	incb	x5, all, mul #4
	incb	x6
	add	z7.s, z6.s, z17.s
	addvl	x0, x7, #-12
	mov	w3, 32
	index	z31.s, #0, w3
	lsl	x5, x5, 1
	lsl	x6, x6, 2
	sub	z20.s, z20.s, z18.s
	addvl	x4, x5, #4
	addvl	x5, x6, #1
	add	z18.s, z29.s, z8.s
	add	x4, x4, 64
	add	x0, x0, 1600
	sub	z29.s, z29.s, z8.s
	add	x4, sp, x4
	add	x5, x5, 64
	str	z7, [x4]
	add	x0, sp, x0
	add	x5, sp, x5
	add	z7.s, z7.s, z5.s
	sqrshrnb	z7.h, z7.s, #7
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	add	z7.s, z18.s, z9.s
	add	z0.s, z7.s, z16.s
	str	z0, [x5]
	addvl	x5, x7, #-12
	addvl	x3, x7, #-12
	addvl	x0, x7, #-12
	add	x5, x5, 1610
	add	z8.s, z0.s, z4.s
	add	x6, sp, x5
	add	x3, x3, 1602
	sqrshrnb	z8.h, z8.s, #7
	addvl	x5, x8, #-2
	add	x0, x0, 1604
	uzp1	z8.h, z8.h, z8.h
	add	x3, sp, x3
	add	x0, sp, x0
	sunpklo	z8.s, z8.h
	add	x5, x5, 64
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	sub	z18.s, z18.s, z9.s
	add	x5, sp, x5
	ldr	z0, [x5]
	add	z8.s, z29.s, z3.s
	addvl	x4, x7, #-12
	sub	z29.s, z29.s, z3.s
	addvl	x3, x7, #-12
	add	z3.s, z8.s, z15.s
	cntb	x7, all, mul #11
	add	z9.s, z3.s, z0.s
	sqrshrnb	z9.h, z9.s, #7
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #12
	lsl	x7, x7, 4
	lsl	x5, x0, 4
	add	x4, x4, 1606
	add	z9.s, z20.s, z2.s
	sub	x0, x5, x0
	addvl	x5, x7, #-1
	sub	z20.s, z20.s, z2.s
	add	x4, sp, x4
	add	x5, x5, 64
	add	z2.s, z9.s, z14.s
	add	x5, sp, x5
	sub	z19.s, z19.s, z1.s
	ldr	z1, [x5]
	add	z1.s, z2.s, z1.s
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x4, z31.s, sxtw 1]
	cntb	x4, all, mul #12
	lsl	x5, x4, 4
	add	x3, x3, 1608
	add	z1.s, z20.s, z12.s
	sub	x4, x5, x4
	add	x3, sp, x3
	sub	z20.s, z20.s, z12.s
	add	x4, x4, 1614
	cntb	x8, all, mul #11
	add	z12.s, z19.s, z13.s
	add	x5, sp, x4
	cntb	x4, all, mul #11
	sub	z19.s, z19.s, z13.s
	lsl	x4, x4, 4
	lsl	x8, x8, 4
	add	z13.s, z12.s, z30.s
	add	x4, sp, x4
	add	x0, x0, 1612
	sqrshrnb	z13.h, z13.s, #7
	add	x4, x4, 64
	ldr	z0, [x4]
	add	z0.s, z1.s, z0.s
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	cntb	x3, all, mul #12
	add	z0.s, z29.s, z10.s
	lsl	x4, x3, 4
	sub	z29.s, z29.s, z10.s
	add	x0, sp, x0
	sub	x3, x4, x3
	cntb	x4, all, mul #12
	uzp1	z13.h, z13.h, z13.h
	lsl	x7, x4, 4
	sunpklo	z13.s, z13.h
	add	x3, x3, 1616
	sub	x4, x7, x4
	addvl	x7, x8, #1
	sub	z9.s, z9.s, z14.s
	add	x7, x7, 64
	add	x3, sp, x3
	sub	z8.s, z8.s, z15.s
	add	x7, sp, x7
	ldr	z10, [x7]
	add	z10.s, z0.s, z10.s
	rdvl	x7, #22
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	lsl	x7, x7, 3
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #2
	add	z10.s, z18.s, z11.s
	sub	z18.s, z18.s, z11.s
	add	x6, x6, 64
	add	x4, x4, 1618
	add	z14.s, z18.s, z27.s
	add	x6, sp, x6
	ldr	z11, [x6]
	add	z11.s, z10.s, z11.s
	sqrshrnb	z11.h, z11.s, #7
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #12
	add	x4, sp, x4
	lsl	x6, x0, 4
	st1h	z13.s, p6, [x5, z31.s, sxtw 1]
	add	z13.s, z19.s, z28.s
	sub	x0, x6, x0
	sqrshrnb	z13.h, z13.s, #7
	uzp1	z13.h, z13.h, z13.h
	add	x0, x0, 1620
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x3, z31.s, sxtw 1]
	add	x0, sp, x0
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z31.s, sxtw 1]
	addvl	x3, x6, #-12
	add	z14.s, z29.s, z26.s
	sqrshrnb	z14.h, z14.s, #7
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	add	x3, x3, 1622
	add	x0, x0, 1624
	add	z15.s, z20.s, z25.s
	add	x3, sp, x3
	add	x0, sp, x0
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x3, z31.s, sxtw 1]
	add	z15.s, z9.s, z24.s
	sqrshrnb	z15.h, z15.s, #7
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	add	x0, x0, 1626
	add	z15.s, z8.s, z23.s
	sqrshrnb	z15.h, z15.s, #7
	add	x0, sp, x0
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	sub	z7.s, z7.s, z16.s
	add	x0, x0, 1628
	add	z16.s, z7.s, z22.s
	sqrshrnb	z16.h, z16.s, #7
	add	x0, sp, x0
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	sub	z6.s, z6.s, z17.s
	add	x0, x0, 1630
	add	z17.s, z6.s, z21.s
	sqrshrnb	z17.h, z17.s, #7
	add	x0, sp, x0
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	sub	z6.s, z6.s, z21.s
	add	x0, x0, 1632
	sqrshrnb	z6.h, z6.s, #7
	uzp1	z6.h, z6.h, z6.h
	add	x0, sp, x0
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	sub	z7.s, z7.s, z22.s
	sqrshrnb	z7.h, z7.s, #7
	add	x0, x0, 1634
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	add	x0, sp, x0
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	sub	z8.s, z8.s, z23.s
	addvl	x0, x6, #-12
	sqrshrnb	z8.h, z8.s, #7
	uzp1	z8.h, z8.h, z8.h
	add	x0, x0, 1636
	sunpklo	z8.s, z8.h
	sub	z9.s, z9.s, z24.s
	add	x0, sp, x0
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	sqrshrnb	z9.h, z9.s, #7
	addvl	x0, x6, #-12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	add	x0, x0, 1638
	sub	z20.s, z20.s, z25.s
	sqrshrnb	z20.h, z20.s, #7
	add	x0, sp, x0
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	uzp1	z20.h, z20.h, z20.h
	addvl	x0, x6, #-12
	sunpklo	z20.s, z20.h
	sub	z29.s, z29.s, z26.s
	add	x0, x0, 1640
	sqrshrnb	z29.h, z29.s, #7
	uzp1	z29.h, z29.h, z29.h
	add	x0, sp, x0
	st1h	z20.s, p6, [x0, z31.s, sxtw 1]
	sunpklo	z29.s, z29.h
	addvl	x0, x6, #-12
	sub	z18.s, z18.s, z27.s
	sqrshrnb	z18.h, z18.s, #7
	add	x0, x0, 1642
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	add	x0, sp, x0
	st1h	z29.s, p6, [x0, z31.s, sxtw 1]
	sub	z19.s, z19.s, z28.s
	addvl	x0, x6, #-12
	sqrshrnb	z19.h, z19.s, #7
	uzp1	z19.h, z19.h, z19.h
	add	x0, x0, 1644
	sunpklo	z19.s, z19.h
	sub	z12.s, z12.s, z30.s
	add	x0, sp, x0
	st1h	z18.s, p6, [x0, z31.s, sxtw 1]
	sqrshrnb	z12.h, z12.s, #7
	addvl	x0, x6, #-12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	add	x0, x0, 1646
	rdvl	x3, #21
	add	x0, sp, x0
	st1h	z19.s, p6, [x0, z31.s, sxtw 1]
	lsl	x3, x3, 1
	addvl	x0, x6, #-12
	incb	x3
	add	x0, x0, 1648
	add	x0, sp, x0
	st1h	z12.s, p6, [x0, z31.s, sxtw 1]
	lsl	x3, x3, 2
	addvl	x0, x7, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
	sub	z10.s, z10.s, z17.s
	addvl	x0, x6, #-12
	sqrshrnb	z10.h, z10.s, #7
	uzp1	z10.h, z10.h, z10.h
	add	x0, x0, 1650
	sunpklo	z10.s, z10.h
	add	x0, sp, x0
	st1h	z10.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x8, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
	sub	z0.s, z0.s, z29.s
	addvl	x0, x6, #-12
	sqrshrnb	z0.h, z0.s, #7
	uzp1	z0.h, z0.h, z0.h
	add	x0, x0, 1652
	sunpklo	z0.s, z0.h
	add	x0, sp, x0
	st1h	z0.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
	sub	z1.s, z1.s, z17.s
	addvl	x0, x6, #-12
	sqrshrnb	z1.h, z1.s, #7
	uzp1	z1.h, z1.h, z1.h
	add	x0, x0, 1654
	sunpklo	z1.s, z1.h
	add	x0, sp, x0
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x8, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
	sub	z2.s, z2.s, z29.s
	addvl	x0, x6, #-12
	sqrshrnb	z2.h, z2.s, #7
	uzp1	z2.h, z2.h, z2.h
	add	x0, x0, 1656
	sunpklo	z2.s, z2.h
	add	x0, sp, x0
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x7, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
	sub	z3.s, z3.s, z29.s
	addvl	x0, x6, #-12
	sqrshrnb	z3.h, z3.s, #7
	uzp1	z3.h, z3.h, z3.h
	add	x0, x0, 1658
	sunpklo	z3.s, z3.h
	add	x0, sp, x0
	st1h	z3.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	rdvl	x3, #20
	add	x0, x0, 64
	lsl	x3, x3, 2
	add	x0, sp, x0
	ldr	z29, [x0]
	incb	x3, all, mul #4
	addvl	x0, x6, #-12
	sub	z4.s, z29.s, z4.s
	sqrshrnb	z4.h, z4.s, #7
	add	x0, x0, 1660
	lsl	x3, x3, 1
	uzp1	z4.h, z4.h, z4.h
	add	x0, sp, x0
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
	sub	z5.s, z29.s, z5.s
	addvl	x0, x6, #-12
	sqrshrnb	z5.h, z5.s, #7
	uzp1	z5.h, z5.h, z5.h
	add	x0, x0, 1662
	sunpklo	z5.s, z5.h
	movi	d29, #0
	add	x0, sp, x0
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x6, #-12
	add	x0, x0, 128
	add	x0, sp, x0
	ldr	z22, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 256
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z22.h, z22.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 384
	add	x0, sp, x0
	ldr	z15, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 512
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z15.h, z15.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 640
	add	x0, sp, x0
	ldr	z16, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 768
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z16.h, z16.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 896
	add	x0, sp, x0
	ldr	z17, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1024
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z17.h, z17.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 1152
	add	x0, sp, x0
	ldr	z18, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1280
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z18.h, z18.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 1408
	add	x0, sp, x0
	ldr	z19, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1536
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z19.h, z19.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 1664
	add	x0, sp, x0
	ldr	z20, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1792
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z20.h, z20.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 1920
	add	x0, sp, x0
	ldr	z21, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 2048
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z21.h, z21.h, z31.h
	add	x0, sp, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	movi	d31, #0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	mov	z4.d, z31.d
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	movi	d31, #0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z29.d, z31.d
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x0, x7, #-2
	movi	d31, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z29.d, z31.d
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x0, x8, #-1
	movi	d31, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z29.d, z31.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	movi	d31, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z29, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z28.d, z31.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	addvl	x0, x8, #1
	movi	d31, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z28, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z28.d, z31.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, x9, #1
	movi	d31, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z28, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z27.d, z31.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, x7, #2
	movi	d29, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z27, [x0]
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z31.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d28, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	movi	d27, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	movi	d26, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z22.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	movi	d25, #0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z22.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	movi	d24, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	movi	d23, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z31.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	movi	d31, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z31.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z22.d, z31.d
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-12
	movi	d17, #0
	add	x0, x0, 192
	add	x0, sp, x0
	ldr	z19, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 448
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z19.h, z19.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 704
	add	x0, sp, x0
	ldr	z20, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 960
	add	x0, sp, x0
	ldr	z31, [x0]
	zip1	z20.h, z20.h, z31.h
	addvl	x0, x6, #-12
	add	x0, x0, 1216
	add	x0, sp, x0
	ldr	z21, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1472
	add	x0, sp, x0
	ldr	z18, [x0]
	zip1	z21.h, z21.h, z18.h
	addvl	x0, x6, #-12
	add	x0, x0, 1728
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1984
	add	x0, sp, x0
	ldr	z18, [x0]
	zip1	z31.h, z31.h, z18.h
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z31.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d16, #0
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	movi	d15, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z31.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d14, #0
	lsl	x3, x3, 4
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z31.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d11, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z31.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d10, #0
	lsl	x3, x3, 3
	incb	x3, all, mul #4
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z31.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	movi	d12, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z31.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	movi	d13, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-12
	movi	d9, #0
	add	x0, x0, 320
	add	x0, sp, x0
	ldr	z21, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 832
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z21.h, z21.h, z20.h
	addvl	x0, x6, #-12
	add	x0, x0, 1344
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1856
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z31.h, z31.h, z20.h
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	movi	d8, #0
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z31.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	movi	d3, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	movi	d2, #0
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-12
	movi	d18, #0
	add	x0, x0, 576
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1600
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z31.h, z31.h, z21.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	movi	d7, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	addvl	x0, x6, #-12
	movi	d20, #0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z31, [x0]
	addvl	x0, x6, #-12
	add	x0, x0, 1088
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z31.h, z31.h, z21.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z31.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	movi	d21, #0
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z31.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	rdvl	x7, #21
	add	z19.s, z20.s, z18.s
	lsl	x3, x3, 2
	lsl	x7, x7, 1
	add	z6.s, z19.s, z9.s
	incb	x3, all, mul #4
	incb	x7
	add	z0.s, z6.s, z17.s
	index	z31.s, #0, w2
	sub	z20.s, z20.s, z18.s
	add	z18.s, z0.s, z5.s
	lsl	x3, x3, 1
	lsl	x7, x7, 2
	sqrshrnb	z18.h, z18.s, #12
	addvl	x0, x3, #4
	addvl	x6, x7, #1
	uzp1	z18.h, z18.h, z18.h
	add	x0, x0, 64
	add	x6, x6, 64
	sunpklo	z18.s, z18.h
	add	x0, sp, x0
	rdvl	x7, #22
	str	z0, [x0]
	st1h	z18.s, p6, [x1, z31.s, sxtw 1]
	add	x6, sp, x6
	lsl	x7, x7, 3
	add	z18.s, z21.s, z7.s
	sub	z21.s, z21.s, z7.s
	add	z7.s, z18.s, z8.s
	add	z1.s, z7.s, z16.s
	str	z1, [x6]
	addvl	x6, x7, #-2
	cntb	x7, all, mul #11
	add	x4, x1, 2
	add	z1.s, z1.s, z4.s
	add	x5, x1, 4
	add	x6, x6, 64
	sqrshrnb	z1.h, z1.s, #12
	lsl	x7, x7, 4
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x4, z31.s, sxtw 1]
	add	x6, sp, x6
	ldr	z0, [x6]
	sub	z18.s, z18.s, z8.s
	add	x7, sp, x7
	add	z8.s, z21.s, z3.s
	sub	z21.s, z21.s, z3.s
	add	z3.s, z8.s, z15.s
	add	z1.s, z3.s, z0.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x8, #-1
	cntb	x8, all, mul #11
	add	x7, x7, 64
	lsl	x8, x8, 4
	sub	z19.s, z19.s, z9.s
	add	x5, x5, 64
	add	x0, x1, 6
	add	z9.s, z20.s, z2.s
	add	x5, sp, x5
	ldr	z1, [x5]
	sub	z20.s, z20.s, z2.s
	add	z2.s, z9.s, z14.s
	add	z1.s, z2.s, z1.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	ldr	z0, [x7]
	addvl	x7, x8, #1
	add	z1.s, z20.s, z11.s
	add	x7, x7, 64
	add	z0.s, z1.s, z0.s
	sqrshrnb	z0.h, z0.s, #12
	add	x7, sp, x7
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	add	x3, x1, 8
	st1h	z0.s, p6, [x3, z31.s, sxtw 1]
	add	z0.s, z21.s, z10.s
	sub	z21.s, z21.s, z10.s
	ldr	z10, [x7]
	addvl	x7, x9, #1
	add	x7, x7, 64
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #12
	add	x7, sp, x7
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x4, x1, 10
	st1h	z10.s, p6, [x4, z31.s, sxtw 1]
	ldr	z10, [x7]
	rdvl	x7, #22
	add	x6, x1, 12
	sub	z20.s, z20.s, z11.s
	lsl	x7, x7, 3
	add	z11.s, z18.s, z12.s
	sub	z18.s, z18.s, z12.s
	add	z12.s, z11.s, z10.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #2
	add	x6, x6, 64
	add	z12.s, z19.s, z13.s
	add	x0, x1, 14
	add	x6, sp, x6
	sub	z19.s, z19.s, z13.s
	ldr	z13, [x6]
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x0, z31.s, sxtw 1]
	sub	z9.s, z9.s, z14.s
	add	x5, x1, 16
	add	z14.s, z19.s, z29.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x5, z31.s, sxtw 1]
	add	x3, x1, 18
	add	z14.s, z18.s, z28.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	sub	z8.s, z8.s, z15.s
	add	x4, x1, 20
	add	z15.s, z21.s, z27.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x4, z31.s, sxtw 1]
	add	x0, x1, 22
	add	z15.s, z20.s, z26.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x0, z31.s, sxtw 1]
	add	x3, x1, 24
	add	x0, x1, 26
	sub	z7.s, z7.s, z16.s
	add	z16.s, z9.s, z25.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	add	z16.s, z8.s, z24.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 28
	add	z16.s, z7.s, z23.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 30
	sub	z6.s, z6.s, z17.s
	add	z17.s, z6.s, z22.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 32
	sub	z6.s, z6.s, z22.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 34
	sub	z7.s, z7.s, z23.s
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 36
	sub	z8.s, z8.s, z24.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 38
	sub	z9.s, z9.s, z25.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 40
	sub	z20.s, z20.s, z26.s
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 42
	sub	z21.s, z21.s, z27.s
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	st1h	z21.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 44
	sub	z18.s, z18.s, z28.s
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	st1h	z18.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 46
	sub	z19.s, z19.s, z29.s
	cntb	x3, all, mul #11
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 48
	ldr	z29, [x6]
	lsl	x3, x3, 4
	sub	z12.s, z12.s, z29.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x0, z31.s, sxtw 1]
	add	x0, x1, 50
	sub	z11.s, z11.s, z10.s
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	cntb	x3, all, mul #11
	movi	d29, #0
	add	x0, x0, 64
	lsl	x3, x3, 4
	add	x0, sp, x0
	ldr	z17, [x0]
	sub	z0.s, z0.s, z17.s
	add	x0, x1, 52
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
	sub	z1.s, z1.s, z17.s
	add	x0, x1, 54
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #-1
	add	x0, x0, 64
	rdvl	x3, #21
	add	x0, sp, x0
	ldr	z17, [x0]
	lsl	x3, x3, 1
	add	x0, x1, 56
	sub	z2.s, z2.s, z17.s
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x7, #-2
	incb	x3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
	lsl	x3, x3, 2
	add	x0, x1, 58
	sub	z3.s, z3.s, z17.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #1
	rdvl	x3, #20
	lsl	x3, x3, 2
	add	x0, x0, 64
	incb	x3, all, mul #4
	add	x0, sp, x0
	ldr	z17, [x0]
	add	x0, x1, 60
	sub	z4.s, z17.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	lsl	x3, x3, 1
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x0, z31.s, sxtw 1]
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
	sub	z5.s, z17.s, z5.s
	add	x0, x1, 62
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 144
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 272
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z14.h, z14.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 400
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 528
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z15.h, z15.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 656
	add	x0, sp, x0
	ldr	z16, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 784
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z16.h, z16.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 912
	add	x0, sp, x0
	ldr	z17, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1040
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z17.h, z17.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1168
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1296
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z18.h, z18.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1424
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1552
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z19.h, z19.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1680
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1808
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z20.h, z20.h, z28.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1936
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 2064
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z21.h, z21.h, z28.h
	add	x0, sp, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	movi	d29, #0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	mov	z4.d, z29.d
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	movi	d29, #0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z28.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, x7, #-2
	movi	d29, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z28, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	movi	d29, #0
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	mov	z28.d, z29.d
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	movi	d29, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z28, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	mov	z28.d, z29.d
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	movi	d29, #0
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z28, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z11.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, x9, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	movi	d29, #0
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3
	mov	z27.d, z29.d
	lsl	x3, x3, 6
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0
	movi	d29, #0
	str	z27, [x6]
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 5
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d28, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	movi	d27, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 2
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	movi	d26, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #11
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x3, x0, 3
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	movi	d25, #0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #6
	lsl	x3, x3, 4
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #25
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #3
	add	x3, x3, x3, lsl 4
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	movi	d24, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z14.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #13
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #26
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x3, #27
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	movi	d23, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z14.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #7
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #14
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	movi	d22, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z14.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #15
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	decb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 208
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 464
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z18.h, z18.h, z21.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 720
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 976
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z19.h, z19.h, z21.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1232
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1488
	add	x0, sp, x0
	ldr	z17, [x0]
	zip1	z20.h, z20.h, z17.h
	cntb	x0, all, mul #12
	movi	d17, #0
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1744
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 2000
	add	x0, sp, x0
	ldr	z16, [x0]
	zip1	z21.h, z21.h, z16.h
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z18.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 7
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 6
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 6
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d16, #0
	lsl	x3, x3, 5
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z18.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3
	lsl	x3, x3, 5
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	movi	d15, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #2
	lsl	x3, x3, 4
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d14, #0
	lsl	x3, x3, 4
	incb	x3, all, mul #4
	lsl	x3, x3, 1
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x3, #17
	lsl	x3, x3, 1
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z21.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d11, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 4
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 3
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 3
	incb	x3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #4
	movi	d10, #0
	lsl	x3, x3, 3
	incb	x3, all, mul #4
	lsl	x3, x3, 2
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	lsl	x3, x3, 2
	incb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x3, #19
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	movi	d12, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x3, #18
	lsl	x3, x3, 1
	incb	x3, all, mul #2
	lsl	x3, x3, 2
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x3, x0, 5
	sub	x0, x3, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	movi	d13, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 3
	decb	x3
	lsl	x3, x3, 2
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	lsl	x3, x3, 4
	addvl	x0, x3, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	movi	d9, #0
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 336
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 848
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z20.h, z20.h, z19.h
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1360
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1872
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z21.h, z21.h, z19.h
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #5
	lsl	x3, x3, 5
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	movi	d8, #0
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #9
	add	x3, x3, x3, lsl 3
	lsl	x3, x3, 1
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x3, #20
	movi	d3, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z21.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x3, all, mul #10
	movi	d2, #0
	lsl	x3, x3, 3
	incb	x3, all, mul #2
	lsl	x3, x3, 1
	addvl	x0, x3, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	lsl	x3, x3, 3
	addvl	x0, x3, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	movi	d18, #0
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 592
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1616
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z21.h, z21.h, z20.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x3, #21
	movi	d7, #0
	lsl	x3, x3, 3
	addvl	x0, x3, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z21.h, z20.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	movi	d20, #0
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 80
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x3, x0, 4
	sub	x0, x3, x0
	add	x0, x0, 1104
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z19.h, z19.h, z21.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z19.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	movi	d21, #0
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x6, #20
	rdvl	x10, #21
	add	z19.s, z20.s, z18.s
	lsl	x6, x6, 2
	lsl	x10, x10, 1
	add	z6.s, z19.s, z9.s
	incb	x6, all, mul #4
	incb	x10
	add	z0.s, z6.s, z17.s
	sub	z20.s, z20.s, z18.s
	lsl	x0, x2, 4
	add	z18.s, z0.s, z5.s
	lsl	x6, x6, 1
	lsl	x10, x10, 2
	sqrshrnb	z18.h, z18.s, #12
	addvl	x5, x6, #4
	addvl	x9, x10, #1
	uzp1	z18.h, z18.h, z18.h
	add	x5, x5, 64
	add	x9, x9, 64
	sunpklo	z18.s, z18.h
	add	x5, sp, x5
	str	z0, [x5]
	add	x9, sp, x9
	add	x4, x1, x2, lsl 4
	st1h	z18.s, p6, [x4, z31.s, sxtw 1]
	add	x0, x0, 2
	add	z18.s, z21.s, z7.s
	cntb	x11, all, mul #11
	sub	z21.s, z21.s, z7.s
	add	z7.s, z18.s, z8.s
	add	z1.s, z7.s, z16.s
	str	z1, [x9]
	rdvl	x9, #22
	add	x7, x1, x0
	add	z1.s, z1.s, z4.s
	lsl	x9, x9, 3
	lsl	x11, x11, 4
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x7, z31.s, sxtw 1]
	addvl	x7, x9, #-2
	addvl	x9, x11, #-1
	sub	z18.s, z18.s, z8.s
	cntb	x11, all, mul #11
	add	x3, x0, 2
	add	z8.s, z21.s, z3.s
	lsl	x11, x11, 4
	add	x7, x7, 64
	sub	z21.s, z21.s, z3.s
	add	x11, sp, x11
	cntb	x12, all, mul #11
	add	z3.s, z8.s, z15.s
	add	x3, x1, x3
	add	x7, sp, x7
	ldr	z0, [x7]
	add	x6, x0, 4
	add	z1.s, z3.s, z0.s
	add	x11, x11, 64
	lsl	x12, x12, 4
	add	x9, x9, 64
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x3, z31.s, sxtw 1]
	add	x6, x1, x6
	add	x9, sp, x9
	ldr	z1, [x9]
	sub	z19.s, z19.s, z9.s
	add	z9.s, z20.s, z2.s
	sub	z20.s, z20.s, z2.s
	add	z2.s, z9.s, z14.s
	add	z1.s, z2.s, z1.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z31.s, sxtw 1]
	ldr	z0, [x11]
	addvl	x11, x12, #1
	cntb	x12, all, mul #11
	lsl	x12, x12, 3
	add	x11, x11, 64
	add	z1.s, z20.s, z11.s
	incb	x12
	add	x11, sp, x11
	add	z0.s, z1.s, z0.s
	add	x8, x0, 6
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	lsl	x12, x12, 1
	sunpklo	z0.s, z0.h
	add	x8, x1, x8
	st1h	z0.s, p6, [x8, z31.s, sxtw 1]
	add	z0.s, z21.s, z10.s
	sub	z21.s, z21.s, z10.s
	ldr	z10, [x11]
	addvl	x11, x12, #1
	add	x5, x0, 8
	add	x11, x11, 64
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #12
	add	x11, sp, x11
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x5, x1, x5
	add	x10, x0, 10
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	ldr	z10, [x11]
	rdvl	x11, #22
	add	x10, x1, x10
	lsl	x11, x11, 3
	sub	z20.s, z20.s, z11.s
	add	z11.s, z18.s, z12.s
	sub	z18.s, z18.s, z12.s
	add	z12.s, z11.s, z10.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x10, z31.s, sxtw 1]
	addvl	x10, x11, #2
	lsl	x3, x2, 4
	add	z12.s, z19.s, z13.s
	add	x7, x0, 12
	add	x10, x10, 64
	sub	z19.s, z19.s, z13.s
	add	x7, x1, x7
	add	x10, sp, x10
	ldr	z13, [x10]
	add	x9, x3, 16
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x7, z31.s, sxtw 1]
	sub	z9.s, z9.s, z14.s
	add	x9, x1, x9
	add	z14.s, z19.s, z29.s
	add	x6, x0, 16
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x9, z31.s, sxtw 1]
	add	x6, x1, x6
	add	z14.s, z18.s, z28.s
	add	x8, x0, 18
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x6, z31.s, sxtw 1]
	sub	z8.s, z8.s, z15.s
	add	x8, x1, x8
	add	z15.s, z21.s, z27.s
	add	x5, x0, 20
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x8, z31.s, sxtw 1]
	add	x5, x1, x5
	add	z15.s, z20.s, z26.s
	add	x7, x0, 22
	add	x6, x0, 24
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x5, z31.s, sxtw 1]
	add	x7, x1, x7
	add	x6, x1, x6
	sub	z7.s, z7.s, z16.s
	add	z16.s, z9.s, z25.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x7, z31.s, sxtw 1]
	add	x5, x0, 26
	add	z16.s, z8.s, z24.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 28
	add	x5, x1, x5
	add	z16.s, z7.s, z23.s
	add	x6, x1, x6
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x5, z31.s, sxtw 1]
	sub	z6.s, z6.s, z17.s
	add	x5, x3, 32
	add	z17.s, z6.s, z22.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 32
	add	x5, x1, x5
	sub	z6.s, z6.s, z22.s
	add	x6, x1, x6
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	sub	z7.s, z7.s, z23.s
	add	x5, x0, 34
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 36
	add	x5, x1, x5
	add	x6, x1, x6
	sub	z8.s, z8.s, z24.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	sub	z9.s, z9.s, z25.s
	add	x5, x0, 38
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 40
	add	x5, x1, x5
	add	x6, x1, x6
	sub	z20.s, z20.s, z26.s
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x5, z31.s, sxtw 1]
	sub	z21.s, z21.s, z27.s
	add	x5, x0, 42
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	st1h	z21.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 44
	add	x5, x1, x5
	sub	z18.s, z18.s, z28.s
	add	x6, x1, x6
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	st1h	z18.s, p6, [x5, z31.s, sxtw 1]
	sub	z19.s, z19.s, z29.s
	add	x5, x3, 48
	cntb	x7, all, mul #11
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 48
	ldr	z17, [x10]
	add	x5, x1, x5
	add	x6, x1, x6
	lsl	x7, x7, 4
	sub	z12.s, z12.s, z17.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	sub	z11.s, z11.s, z10.s
	add	x5, x0, 50
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #1
	add	x5, x1, x5
	add	x6, x6, 64
	cntb	x7, all, mul #11
	movi	d29, #0
	add	x6, sp, x6
	ldr	z21, [x6]
	sub	z0.s, z0.s, z21.s
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #11
	add	x6, x0, 52
	lsl	x5, x5, 4
	add	x6, x1, x6
	add	x5, sp, x5
	lsl	x7, x7, 4
	add	x5, x5, 64
	ldr	z17, [x5]
	sub	z1.s, z1.s, z17.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #-1
	rdvl	x7, #21
	add	x5, x0, 54
	add	x6, x6, 64
	lsl	x7, x7, 1
	add	x6, sp, x6
	ldr	z17, [x6]
	add	x5, x1, x5
	incb	x7
	sub	z2.s, z2.s, z17.s
	add	x6, x0, 56
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x11, #-2
	add	x6, x1, x6
	lsl	x7, x7, 2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z17, [x5]
	sub	z3.s, z3.s, z17.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #1
	add	x5, x0, 58
	add	x6, x6, 64
	add	x5, x1, x5
	add	x6, sp, x6
	ldr	z17, [x6]
	add	x0, x0, 60
	rdvl	x6, #20
	sub	z4.s, z17.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	lsl	x6, x6, 2
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	incb	x6, all, mul #4
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	add	x0, x1, x0
	lsl	x6, x6, 1
	addvl	x5, x6, #4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z4, [x5]
	sub	z5.s, z4.s, z5.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 160
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 288
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z21.h, z21.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 416
	add	x0, sp, x0
	ldr	z14, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 544
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z14.h, z14.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 672
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 800
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z15.h, z15.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 928
	add	x0, sp, x0
	ldr	z16, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1056
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z16.h, z16.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1184
	add	x0, sp, x0
	ldr	z17, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1312
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z17.h, z17.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1440
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1568
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z18.h, z18.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1696
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1824
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z19.h, z19.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1952
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 2080
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z20.h, z20.h, z28.h
	add	x0, sp, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	movi	d29, #0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	mov	z4.d, z29.d
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	movi	d29, #0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z27.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, x11, #-2
	movi	d29, #0
	add	x0, x0, 64
	add	x0, sp, x0
	str	z27, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z27.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	movi	d29, #0
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z27, [x0]
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	str	z29, [x0]
	movi	d29, #0
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z26.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	movi	d29, #0
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z26, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z23.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, x12, #1
	add	x0, x0, 64
	add	x0, sp, x0
	str	z29, [x0]
	movi	d29, #0
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0
	movi	d28, #0
	str	z29, [x10]
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z14.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 5
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z15.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z16.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d27, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z14.h, z24.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z15.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z16.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	movi	d26, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z14.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z24, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z24.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	movi	d25, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z14.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z15.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x5, x0, 3
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	movi	d24, #0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z14.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z16.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z17.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x5, x5, x5, lsl 4
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z23, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z20.h, z23.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	movi	d23, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z14.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z15.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z16.h, z29.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z20.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	movi	d22, #0
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z21.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z14.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z15.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z16.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z19.h, z29.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z22.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	movi	d29, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z14.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z15.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z16.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z21.d, z29.d
	lsl	x5, x5, 7
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z21.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	movi	d16, #0
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 224
	add	x0, sp, x0
	ldr	z17, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 480
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z17.h, z17.h, z29.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 736
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 992
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z18.h, z18.h, z29.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1248
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1504
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z19.h, z19.h, z29.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1760
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 2016
	add	x0, sp, x0
	ldr	z29, [x0]
	zip1	z20.h, z20.h, z29.h
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z17.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 7
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z18.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	movi	d15, #0
	lsl	x5, x5, 5
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z18.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z15.s, z20.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	movi	d14, #0
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z14.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	movi	d29, #0
	lsl	x5, x5, 4
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z30.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z30, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z30.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	movi	d30, #0
	mov	z11.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z17.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z10.d, z30.d
	lsl	x5, x5, 3
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z17.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z18.h, z0.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z20.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z12.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z17.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z18.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z19.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z0, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z20.h, z0.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z13.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z18.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z19.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z9.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 352
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 864
	add	x0, sp, x0
	ldr	z18, [x0]
	zip1	z19.h, z19.h, z18.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1376
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1888
	add	x0, sp, x0
	ldr	z18, [x0]
	zip1	z20.h, z20.h, z18.h
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z8.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x5, x5, x5, lsl 3
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z3.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z3.s, z20.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	mov	z2.d, z30.d
	lsl	x5, x5, 3
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z19.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z2.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z17.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 608
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1632
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z20.h, z20.h, z19.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	mov	z7.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z20.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z19.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 96
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1120
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z18.h, z18.h, z20.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z20, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z18.h, z20.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z20.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x6, #20
	rdvl	x11, #21
	add	z18.s, z19.s, z17.s
	lsl	x6, x6, 2
	lsl	x11, x11, 1
	add	z6.s, z18.s, z9.s
	incb	x6, all, mul #4
	incb	x11
	add	z1.s, z6.s, z16.s
	lsl	x0, x2, 5
	sub	z19.s, z19.s, z17.s
	add	x4, x4, x3
	lsl	x6, x6, 1
	lsl	x11, x11, 2
	add	z17.s, z1.s, z5.s
	addvl	x5, x6, #4
	addvl	x10, x11, #1
	sqrshrnb	z17.h, z17.s, #12
	add	x5, x5, 64
	add	x0, x0, 2
	uzp1	z17.h, z17.h, z17.h
	add	x5, sp, x5
	str	z1, [x5]
	sunpklo	z17.s, z17.h
	add	x10, x10, 64
	st1h	z17.s, p6, [x4, z31.s, sxtw 1]
	rdvl	x11, #22
	add	x9, x1, x0
	add	x10, sp, x10
	add	z17.s, z20.s, z7.s
	lsl	x11, x11, 3
	sub	z20.s, z20.s, z7.s
	add	z7.s, z17.s, z8.s
	add	z0.s, z7.s, z15.s
	str	z0, [x10]
	add	z1.s, z0.s, z4.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x9, z31.s, sxtw 1]
	addvl	x9, x11, #-2
	cntb	x11, all, mul #11
	add	x9, x9, 64
	lsl	x11, x11, 4
	sub	z17.s, z17.s, z8.s
	add	x9, sp, x9
	ldr	z0, [x9]
	add	x7, x0, 2
	addvl	x9, x11, #-1
	cntb	x11, all, mul #11
	add	z8.s, z20.s, z3.s
	lsl	x11, x11, 4
	add	x9, x9, 64
	sub	z20.s, z20.s, z3.s
	add	x11, sp, x11
	cntb	x12, all, mul #11
	add	z3.s, z8.s, z14.s
	add	x7, x1, x7
	add	x9, sp, x9
	add	z1.s, z3.s, z0.s
	add	x6, x0, 4
	add	x11, x11, 64
	sqrshrnb	z1.h, z1.s, #12
	lsl	x12, x12, 4
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x7, z31.s, sxtw 1]
	ldr	z0, [x9]
	add	x6, x1, x6
	sub	z18.s, z18.s, z9.s
	add	z9.s, z19.s, z2.s
	sub	z19.s, z19.s, z2.s
	add	z2.s, z9.s, z29.s
	add	z1.s, z2.s, z0.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z31.s, sxtw 1]
	ldr	z0, [x11]
	addvl	x11, x12, #1
	cntb	x12, all, mul #11
	lsl	x12, x12, 3
	add	x11, x11, 64
	add	z1.s, z19.s, z11.s
	incb	x12
	add	x11, sp, x11
	add	z0.s, z1.s, z0.s
	add	x8, x0, 6
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	lsl	x12, x12, 1
	sunpklo	z0.s, z0.h
	add	x8, x1, x8
	st1h	z0.s, p6, [x8, z31.s, sxtw 1]
	add	z0.s, z20.s, z10.s
	sub	z20.s, z20.s, z10.s
	ldr	z10, [x11]
	addvl	x11, x12, #1
	add	x5, x0, 8
	add	x11, x11, 64
	add	z10.s, z0.s, z10.s
	sqrshrnb	z10.h, z10.s, #12
	add	x11, sp, x11
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	add	x5, x1, x5
	add	x10, x0, 10
	st1h	z10.s, p6, [x5, z31.s, sxtw 1]
	ldr	z10, [x11]
	rdvl	x11, #22
	add	x10, x1, x10
	lsl	x11, x11, 3
	sub	z19.s, z19.s, z11.s
	add	z11.s, z17.s, z12.s
	sub	z17.s, z17.s, z12.s
	add	z12.s, z11.s, z10.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x10, z31.s, sxtw 1]
	addvl	x10, x11, #2
	add	x7, x0, 12
	add	z12.s, z18.s, z13.s
	add	x10, x10, 64
	add	x7, x1, x7
	sub	z18.s, z18.s, z13.s
	add	x10, sp, x10
	ldr	z13, [x10]
	add	x9, x0, 14
	add	z13.s, z12.s, z13.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x7, z31.s, sxtw 1]
	sub	z9.s, z9.s, z29.s
	add	x9, x1, x9
	add	z29.s, z18.s, z28.s
	add	x6, x0, 16
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x9, z31.s, sxtw 1]
	add	x6, x1, x6
	add	z29.s, z17.s, z27.s
	add	x8, x0, 18
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x6, z31.s, sxtw 1]
	add	x8, x1, x8
	add	z29.s, z20.s, z26.s
	add	x5, x0, 20
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x8, z31.s, sxtw 1]
	add	x5, x1, x5
	add	z29.s, z19.s, z25.s
	add	x7, x0, 22
	add	x6, x0, 24
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x5, z31.s, sxtw 1]
	add	x7, x1, x7
	add	x6, x1, x6
	add	z29.s, z9.s, z24.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x7, z31.s, sxtw 1]
	sub	z8.s, z8.s, z14.s
	add	x5, x0, 26
	add	z29.s, z8.s, z23.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 28
	add	x5, x1, x5
	add	x6, x1, x6
	sub	z7.s, z7.s, z15.s
	add	z29.s, z7.s, z22.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x5, z31.s, sxtw 1]
	sub	z6.s, z6.s, z16.s
	add	x5, x1, x2, lsl 5
	add	z29.s, z6.s, z21.s
	sqrshrnb	z29.h, z29.s, #12
	uzp1	z29.h, z29.h, z29.h
	sunpklo	z29.s, z29.h
	st1h	z29.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 32
	add	x6, x1, x6
	add	x5, x5, 32
	sub	z6.s, z6.s, z21.s
	sqrshrnb	z6.h, z6.s, #12
	uzp1	z6.h, z6.h, z6.h
	sunpklo	z6.s, z6.h
	st1h	z6.s, p6, [x5, z31.s, sxtw 1]
	sub	z7.s, z7.s, z22.s
	add	x5, x0, 34
	sqrshrnb	z7.h, z7.s, #12
	uzp1	z7.h, z7.h, z7.h
	sunpklo	z7.s, z7.h
	st1h	z7.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 36
	add	x5, x1, x5
	add	x6, x1, x6
	sub	z8.s, z8.s, z23.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x5, z31.s, sxtw 1]
	sub	z9.s, z9.s, z24.s
	add	x5, x0, 38
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 40
	add	x5, x1, x5
	sub	z19.s, z19.s, z25.s
	add	x6, x1, x6
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x5, z31.s, sxtw 1]
	sub	z20.s, z20.s, z26.s
	add	x5, x0, 42
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 44
	add	x5, x1, x5
	add	x6, x1, x6
	sub	z17.s, z17.s, z27.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x5, z31.s, sxtw 1]
	sub	z18.s, z18.s, z28.s
	add	x5, x0, 46
	cntb	x7, all, mul #11
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	st1h	z18.s, p6, [x6, z31.s, sxtw 1]
	add	x6, x0, 48
	ldr	z20, [x10]
	add	x5, x1, x5
	add	x6, x1, x6
	lsl	x7, x7, 4
	sub	z12.s, z12.s, z20.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x5, z31.s, sxtw 1]
	sub	z11.s, z11.s, z10.s
	add	x5, x0, 50
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #1
	add	x5, x1, x5
	mov	z29.d, z30.d
	add	x6, x6, 64
	cntb	x7, all, mul #11
	add	x6, sp, x6
	ldr	z20, [x6]
	sub	z0.s, z0.s, z20.s
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x5, z31.s, sxtw 1]
	cntb	x5, all, mul #11
	add	x6, x0, 52
	lsl	x5, x5, 4
	add	x6, x1, x6
	add	x5, sp, x5
	lsl	x7, x7, 4
	add	x5, x5, 64
	ldr	z20, [x5]
	sub	z1.s, z1.s, z20.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #-1
	rdvl	x7, #21
	add	x5, x0, 54
	add	x6, x6, 64
	lsl	x7, x7, 1
	add	x6, sp, x6
	ldr	z20, [x6]
	add	x5, x1, x5
	incb	x7
	sub	z2.s, z2.s, z20.s
	add	x6, x0, 56
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x5, z31.s, sxtw 1]
	addvl	x5, x11, #-2
	add	x6, x1, x6
	lsl	x7, x7, 2
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z20, [x5]
	sub	z3.s, z3.s, z20.s
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x6, z31.s, sxtw 1]
	addvl	x6, x7, #1
	add	x5, x0, 58
	add	x6, x6, 64
	add	x5, x1, x5
	add	x6, sp, x6
	ldr	z20, [x6]
	add	x0, x0, 60
	rdvl	x6, #20
	sub	z4.s, z20.s, z4.s
	sqrshrnb	z4.h, z4.s, #12
	lsl	x6, x6, 2
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	incb	x6, all, mul #4
	st1h	z4.s, p6, [x5, z31.s, sxtw 1]
	add	x0, x1, x0
	lsl	x6, x6, 1
	addvl	x5, x6, #4
	add	x5, x5, 64
	add	x5, sp, x5
	ldr	z20, [x5]
	sub	z5.s, z20.s, z5.s
	sqrshrnb	z5.h, z5.s, #12
	uzp1	z5.h, z5.h, z5.h
	sunpklo	z5.s, z5.h
	st1h	z5.s, p6, [x0, z31.s, sxtw 1]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 176
	add	x0, sp, x0
	ldr	z24, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 304
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z24.h, z24.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 432
	add	x0, sp, x0
	ldr	z17, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 560
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z17.h, z17.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 688
	add	x0, sp, x0
	ldr	z18, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 816
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z18.h, z18.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 944
	add	x0, sp, x0
	ldr	z19, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1072
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z19.h, z19.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1200
	add	x0, sp, x0
	ldr	z20, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1328
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z20.h, z20.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1456
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1584
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z21.h, z21.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1712
	add	x0, sp, x0
	ldr	z22, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1840
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z22.h, z22.h, z28.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1968
	add	x0, sp, x0
	ldr	z23, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 2096
	add	x0, sp, x0
	ldr	z28, [x0]
	zip1	z23.h, z23.h, z28.h
	add	x0, sp, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z27.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #1
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z0.d, z29.d
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z0.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	mov	z29.d, z30.d
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #10
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z9.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #11
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #12
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #13
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #14
	add	x0, x0, 64
	ldr	z4, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z4.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #15
	mov	z4.d, z29.d
	add	x0, x0, 64
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z4.s, z23.h, z3.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #16
	mov	z29.d, z30.d
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z2.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #17
	add	x0, x0, 64
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #18
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #19
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #20
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #21
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z28.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #22
	add	x0, x0, 64
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #23
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #2
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z5, [x0]
	addvl	x0, sp, #24
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #25
	add	x0, x0, 64
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #26
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #27
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z13.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #28
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #29
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #30
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #31
	mov	z5.d, z29.d
	add	x0, x0, 64
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #3
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z5, [x0]
	cntb	x0
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z5.d, z29.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #4
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z5, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	mov	z27.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z29, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z23.h, z29.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #5
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z27, [x0]
	cntb	x0, all, mul #3
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z5.d, z29.d
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #6
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z5, [x0]
	cntb	x0, all, mul #7
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z26.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 1
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z5.d, z29.d
	lsl	x5, x5, 6
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z26.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #7
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z5, [x0]
	cntb	x0
	lsl	x0, x0, 6
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z28.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z27, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z27.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 5
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	mov	z27.d, z29.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #8
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z27, [x0]
	cntb	x0, all, mul #9
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	mov	z28.d, z29.d
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z23.h, z7.h
// 0 "" 2
#NO_APP
	addvl	x0, sp, #9
	mov	z29.d, z30.d
	add	x0, x0, 64
	str	z28, [x0]
	cntb	x0, all, mul #5
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z24.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z17.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z18.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z28, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z19.h, z28.h
// 0 "" 2
#NO_APP
	rdvl	x0, #21
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z21.h, z25.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 2
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z22.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z29.s, z23.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #11
	mov	z28.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z24.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #11
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z17.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z18.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	lsl	x5, x0, 3
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z19.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z21.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z28.s, z23.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	mov	z27.d, z30.d
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z24.h, z10.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z17.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #6
	lsl	x5, x5, 4
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z18.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #3
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z19.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z20.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #25
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z21.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #6
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z22.h, z1.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #3
	add	x5, x5, x5, lsl 4
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z26, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z27.s, z23.h, z26.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	mov	z26.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z24.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #13
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z17.h, z13.h
// 0 "" 2
#NO_APP
	rdvl	x5, #26
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z18.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z25, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z19.h, z25.h
// 0 "" 2
#NO_APP
	rdvl	x0, #27
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z20.h, z12.h
// 0 "" 2
#NO_APP
	rdvl	x5, #27
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z21.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x0, #22
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z22.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z26.s, z23.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	mov	z25.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z24.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #7
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z17.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #14
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z18.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x0, #23
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z19.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #29
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z20.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #13
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z22.h, z8.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #7
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z25.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #15
	mov	z16.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z24.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #15
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z17.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	decb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z18.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z19.h, z15.h
// 0 "" 2
#NO_APP
	rdvl	x0, #31
	lsl	x0, x0, 2
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z20.h, z17.h
// 0 "" 2
#NO_APP
	rdvl	x0, #25
	add	x0, x0, x0, lsl 2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z17, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z17.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z22.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5
	mov	z24.d, z16.d
	lsl	x5, x5, 7
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z19, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z24.s, z23.h, z19.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 240
	add	x0, sp, x0
	ldr	z15, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 496
	add	x0, sp, x0
	ldr	z23, [x0]
	zip1	z15.h, z15.h, z23.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 752
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1008
	add	x0, sp, x0
	ldr	z23, [x0]
	zip1	z21.h, z21.h, z23.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1264
	add	x0, sp, x0
	ldr	z22, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1520
	add	x0, sp, x0
	ldr	z20, [x0]
	zip1	z22.h, z22.h, z20.h
	cntb	x0, all, mul #12
	mov	z20.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1776
	add	x0, sp, x0
	ldr	z23, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 2032
	add	x0, sp, x0
	ldr	z19, [x0]
	zip1	z23.h, z23.h, z19.h
	cntb	x0
	lsl	x0, x0, 7
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z15.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 7
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z18, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z21.h, z18.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 6
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z16, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z22.h, z16.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 6
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z20.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z19.d, z30.d
	lsl	x5, x5, 5
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z15.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5
	lsl	x5, x5, 5
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z21.h, z14.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z22.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z14, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z19.s, z23.h, z14.h
// 0 "" 2
#NO_APP
	rdvl	x0, #17
	mov	z18.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z15.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z21.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #2
	lsl	x5, x5, 4
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z11, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z18.s, z23.h, z11.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z17.d, z30.d
	lsl	x5, x5, 4
	incb	x5, all, mul #4
	lsl	x5, x5, 1
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z15.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x5, #17
	lsl	x5, x5, 1
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z10, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z21.h, z10.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z22.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z17.s, z23.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	mov	z16.d, z30.d
	lsl	x0, x0, 4
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z7, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z15.h, z7.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 4
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z21.h, z1.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 3
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 3
	incb	x5
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z13, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z16.s, z23.h, z13.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #4
	mov	z7.d, z30.d
	lsl	x5, x5, 3
	incb	x5, all, mul #4
	lsl	x5, x5, 2
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z12, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z15.h, z12.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	lsl	x5, x5, 2
	incb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z6, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z21.h, z6.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #10
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z22.h, z3.h
// 0 "" 2
#NO_APP
	rdvl	x5, #19
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z9, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z7.s, z23.h, z9.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	mov	z6.d, z30.d
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z15.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #9
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z8, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z21.h, z8.h
// 0 "" 2
#NO_APP
	rdvl	x5, #18
	lsl	x5, x5, 1
	incb	x5, all, mul #2
	lsl	x5, x5, 2
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z22.h, z2.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	lsl	x5, x0, 5
	sub	x0, x5, x0
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z2, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z6.s, z23.h, z2.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z5.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #-4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z3, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z15.h, z3.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 3
	decb	x5
	lsl	x5, x5, 2
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z15, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z21.h, z15.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	lsl	x5, x5, 4
	addvl	x0, x5, #-2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z5.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z9.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 368
	add	x0, sp, x0
	ldr	z22, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 880
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z22.h, z22.h, z21.h
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1392
	add	x0, sp, x0
	ldr	z23, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1904
	add	x0, sp, x0
	ldr	z21, [x0]
	zip1	z23.h, z23.h, z21.h
	cntb	x0, all, mul #5
	lsl	x0, x0, 5
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #5
	lsl	x5, x5, 5
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z9.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #18
	mov	z10.d, z30.d
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #9
	add	x5, x5, x5, lsl 3
	lsl	x5, x5, 1
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z10.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x5, #20
	mov	z11.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #5
	add	x0, x0, x0, lsl 5
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z11.s, z23.h, z21.h
// 0 "" 2
#NO_APP
	cntb	x5, all, mul #10
	mov	z12.d, z30.d
	lsl	x5, x5, 3
	incb	x5, all, mul #2
	lsl	x5, x5, 1
	addvl	x0, x5, #2
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	lsl	x5, x5, 3
	addvl	x0, x5, #-1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z12.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z8.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 624
	add	x0, sp, x0
	ldr	z23, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1648
	add	x0, sp, x0
	ldr	z22, [x0]
	zip1	z23.h, z23.h, z22.h
	rdvl	x0, #21
	lsl	x0, x0, 3
	add	x0, sp, x0
	add	x0, x0, 64
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z8.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	rdvl	x5, #21
	mov	z13.d, z30.d
	lsl	x5, x5, 3
	addvl	x0, x5, #1
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z22, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z13.s, z23.h, z22.h
// 0 "" 2
#NO_APP
	cntb	x0, all, mul #12
	mov	z23.d, z30.d
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 112
	add	x0, sp, x0
	ldr	z21, [x0]
	cntb	x0, all, mul #12
	lsl	x5, x0, 4
	sub	x0, x5, x0
	add	x0, x0, 1136
	add	x0, sp, x0
	ldr	z22, [x0]
	zip1	z22.h, z21.h, z22.h
	cntb	x0, all, mul #10
	add	x0, x0, x0, lsl 4
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z21, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z23.s, z22.h, z21.h
// 0 "" 2
#NO_APP
	rdvl	x0, #19
	add	x0, x0, x0, lsl 3
	add	x0, x0, 64
	add	x0, sp, x0
	ldr	z1, [x0]
#APP
// 260 "kernels/idct32/candidates/sdot_scatter_sve2p1.cpp" 1
	sdot z30.s, z22.h, z1.h
// 0 "" 2
#NO_APP
	add	x2, x2, x2, lsl 1
	add	z22.s, z23.s, z8.s
	add	x3, x3, x4
	add	z1.s, z22.s, z9.s
	add	x0, sp, 64
	add	z21.s, z1.s, z20.s
	lsl	x2, x2, 3
	str	z21, [x0]
	addvl	x5, sp, #2
	add	x4, x2, 1
	add	z21.s, z21.s, z0.s
	sqrshrnb	z21.h, z21.s, #12
	uzp1	z21.h, z21.h, z21.h
	sunpklo	z21.s, z21.h
	st1h	z21.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x5, x5, 64
	add	z21.s, z30.s, z13.s
	add	x3, x3, 64
	str	z4, [x3]
	lsl	x0, x4, 1
	add	z2.s, z21.s, z10.s
	add	x4, x1, x4, lsl 1
	add	z15.s, z2.s, z19.s
	sub	z30.s, z30.s, z13.s
	add	z14.s, z15.s, z4.s
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x4, z31.s, sxtw 1]
	ldr	z13, [x5]
	addvl	x5, sp, #3
	add	x3, x0, 2
	add	x5, x5, 64
	add	x4, x1, x3
	add	z3.s, z30.s, z11.s
	sub	z23.s, z23.s, z8.s
	add	z14.s, z3.s, z18.s
	add	z13.s, z14.s, z13.s
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x4, z31.s, sxtw 1]
	ldr	z8, [x5]
	addvl	x5, sp, #4
	add	z4.s, z23.s, z12.s
	add	x3, x0, 4
	add	z13.s, z4.s, z17.s
	add	x5, x5, 64
	add	z8.s, z13.s, z8.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x3, x1, x3
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	ldr	z8, [x5]
	addvl	x5, sp, #5
	add	x4, x0, 6
	add	x3, x0, 8
	sub	z23.s, z23.s, z12.s
	add	x5, x5, 64
	add	z12.s, z23.s, z16.s
	add	z8.s, z12.s, z8.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	add	x4, x1, x4
	add	x3, x1, x3
	st1h	z8.s, p6, [x4, z31.s, sxtw 1]
	ldr	z8, [x5]
	addvl	x5, sp, #6
	add	x4, x0, 10
	add	x5, x5, 64
	sub	z30.s, z30.s, z11.s
	add	z11.s, z30.s, z7.s
	add	z8.s, z11.s, z8.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 12
	ldr	z8, [x5]
	add	x4, x1, x4
	add	x3, x1, x3
	addvl	x5, sp, #7
	sub	z21.s, z21.s, z10.s
	add	z10.s, z21.s, z6.s
	add	z8.s, z10.s, z8.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x4, z31.s, sxtw 1]
	add	x5, x5, 64
	ldr	z8, [x5]
	add	x4, x0, 14
	sub	z22.s, z22.s, z9.s
	add	z9.s, z22.s, z5.s
	add	z8.s, z9.s, z8.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #8
	add	x4, x1, x4
	sub	z22.s, z22.s, z5.s
	add	x3, x3, 64
	ldr	z5, [x3]
	add	z8.s, z22.s, z5.s
	add	x3, x0, 16
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x4, z31.s, sxtw 1]
	addvl	x4, sp, #9
	add	x3, x1, x3
	add	x4, x4, 64
	sub	z21.s, z21.s, z6.s
	ldr	z6, [x4]
	add	x4, x0, 18
	add	z8.s, z21.s, z6.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 20
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z30.s, z30.s, z7.s
	add	z8.s, z30.s, z29.s
	sqrshrnb	z8.h, z8.s, #12
	uzp1	z8.h, z8.h, z8.h
	sunpklo	z8.s, z8.h
	st1h	z8.s, p6, [x4, z31.s, sxtw 1]
	sub	z23.s, z23.s, z16.s
	add	x4, x0, 22
	add	z16.s, z23.s, z28.s
	sqrshrnb	z16.h, z16.s, #12
	uzp1	z16.h, z16.h, z16.h
	sunpklo	z16.s, z16.h
	st1h	z16.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 24
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z4.s, z4.s, z17.s
	add	z17.s, z4.s, z27.s
	sqrshrnb	z17.h, z17.s, #12
	uzp1	z17.h, z17.h, z17.h
	sunpklo	z17.s, z17.h
	st1h	z17.s, p6, [x4, z31.s, sxtw 1]
	sub	z3.s, z3.s, z18.s
	add	x4, x0, 26
	add	z18.s, z3.s, z26.s
	sqrshrnb	z18.h, z18.s, #12
	uzp1	z18.h, z18.h, z18.h
	sunpklo	z18.s, z18.h
	st1h	z18.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 28
	add	x4, x1, x4
	sub	z2.s, z2.s, z19.s
	add	x3, x1, x3
	add	z19.s, z2.s, z25.s
	sqrshrnb	z19.h, z19.s, #12
	uzp1	z19.h, z19.h, z19.h
	sunpklo	z19.s, z19.h
	st1h	z19.s, p6, [x4, z31.s, sxtw 1]
	sub	z1.s, z1.s, z20.s
	add	x4, x0, 30
	add	z20.s, z1.s, z24.s
	sqrshrnb	z20.h, z20.s, #12
	uzp1	z20.h, z20.h, z20.h
	sunpklo	z20.s, z20.h
	st1h	z20.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 32
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z1.s, z1.s, z24.s
	sqrshrnb	z1.h, z1.s, #12
	uzp1	z1.h, z1.h, z1.h
	sunpklo	z1.s, z1.h
	st1h	z1.s, p6, [x4, z31.s, sxtw 1]
	sub	z2.s, z2.s, z25.s
	add	x4, x0, 34
	sqrshrnb	z2.h, z2.s, #12
	uzp1	z2.h, z2.h, z2.h
	sunpklo	z2.s, z2.h
	st1h	z2.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 36
	add	x4, x1, x4
	sub	z3.s, z3.s, z26.s
	add	x3, x1, x3
	sqrshrnb	z3.h, z3.s, #12
	uzp1	z3.h, z3.h, z3.h
	sunpklo	z3.s, z3.h
	st1h	z3.s, p6, [x4, z31.s, sxtw 1]
	sub	z4.s, z4.s, z27.s
	add	x4, x0, 38
	sqrshrnb	z4.h, z4.s, #12
	uzp1	z4.h, z4.h, z4.h
	sunpklo	z4.s, z4.h
	st1h	z4.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 40
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z23.s, z23.s, z28.s
	sqrshrnb	z23.h, z23.s, #12
	uzp1	z23.h, z23.h, z23.h
	sunpklo	z23.s, z23.h
	st1h	z23.s, p6, [x4, z31.s, sxtw 1]
	add	x2, x1, x2, lsl 1
	add	x4, x0, 42
	sub	z30.s, z30.s, z29.s
	sqrshrnb	z30.h, z30.s, #12
	uzp1	z30.h, z30.h, z30.h
	sunpklo	z30.s, z30.h
	st1h	z30.s, p6, [x3, z31.s, sxtw 1]
	add	x3, x0, 44
	add	x4, x1, x4
	add	x3, x1, x3
	sub	z21.s, z21.s, z6.s
	add	x2, x2, 48
	sub	z22.s, z22.s, z5.s
	sqrshrnb	z21.h, z21.s, #12
	sqrshrnb	z22.h, z22.s, #12
	uzp1	z21.h, z21.h, z21.h
	uzp1	z22.h, z22.h, z22.h
	sunpklo	z21.s, z21.h
	sunpklo	z22.s, z22.h
	st1h	z21.s, p6, [x4, z31.s, sxtw 1]
	st1h	z22.s, p6, [x3, z31.s, sxtw 1]
	ldr	z28, [x5]
	add	x3, x0, 48
	sub	z9.s, z9.s, z28.s
	sqrshrnb	z9.h, z9.s, #12
	uzp1	z9.h, z9.h, z9.h
	sunpklo	z9.s, z9.h
	st1h	z9.s, p6, [x2, z31.s, sxtw 1]
	addvl	x2, sp, #6
	add	x3, x1, x3
	add	x2, x2, 64
	ldr	z29, [x2]
	add	x2, x0, 50
	sub	z10.s, z10.s, z29.s
	sqrshrnb	z10.h, z10.s, #12
	uzp1	z10.h, z10.h, z10.h
	sunpklo	z10.s, z10.h
	st1h	z10.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #5
	add	x2, x1, x2
	add	x3, x3, 64
	ldr	z27, [x3]
	sub	z11.s, z11.s, z27.s
	add	x3, x0, 52
	sqrshrnb	z11.h, z11.s, #12
	uzp1	z11.h, z11.h, z11.h
	sunpklo	z11.s, z11.h
	st1h	z11.s, p6, [x2, z31.s, sxtw 1]
	addvl	x2, sp, #4
	add	x3, x1, x3
	add	x2, x2, 64
	ldr	z30, [x2]
	add	x2, x0, 54
	sub	z12.s, z12.s, z30.s
	sqrshrnb	z12.h, z12.s, #12
	uzp1	z12.h, z12.h, z12.h
	sunpklo	z12.s, z12.h
	st1h	z12.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #3
	add	x2, x1, x2
	add	x3, x3, 64
	ldr	z8, [x3]
	sub	z13.s, z13.s, z8.s
	add	x3, x0, 56
	sqrshrnb	z13.h, z13.s, #12
	uzp1	z13.h, z13.h, z13.h
	sunpklo	z13.s, z13.h
	st1h	z13.s, p6, [x2, z31.s, sxtw 1]
	addvl	x2, sp, #2
	add	x3, x1, x3
	add	x2, x2, 64
	ldr	z13, [x2]
	mov	x13, 45
	cntb	x12, all, mul #4
	sub	z14.s, z14.s, z13.s
	add	x2, x0, 58
	sqrshrnb	z14.h, z14.s, #12
	uzp1	z14.h, z14.h, z14.h
	sunpklo	z14.s, z14.h
	st1h	z14.s, p6, [x3, z31.s, sxtw 1]
	addvl	x3, sp, #1
	add	x2, x1, x2
	mul	x12, x12, x13
	add	x3, x3, 64
	ldr	z4, [x3]
	add	x0, x0, 60
	sub	z15.s, z15.s, z4.s
	sqrshrnb	z15.h, z15.s, #12
	uzp1	z15.h, z15.h, z15.h
	sunpklo	z15.s, z15.h
	st1h	z15.s, p6, [x2, z31.s, sxtw 1]
	add	x1, x1, x0
	add	x2, sp, 64
	ldr	z21, [x2]
	sub	z0.s, z21.s, z0.s
	sqrshrnb	z0.h, z0.s, #12
	uzp1	z0.h, z0.h, z0.h
	sunpklo	z0.s, z0.h
	st1h	z0.s, p6, [x1, z31.s, sxtw 1]
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
	add	sp, sp, x12
	.cfi_def_cfa_offset 2112
	add	sp, sp, 2112
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
