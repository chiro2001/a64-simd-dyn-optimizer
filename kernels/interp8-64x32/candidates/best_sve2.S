	.file	"best_sve2.cpp"
	.text
	.globl	dynopt_interp8_64x32_sve2       // -- Begin function dynopt_interp8_64x32_sve2
	.p2align	2
	.type	dynopt_interp8_64x32_sve2,@function
dynopt_interp8_64x32_sve2:              // @dynopt_interp8_64x32_sve2
	.cfi_startproc
// %bb.0:
	sub	w8, w4, #1
	mov	w10, #2                         // =0x2
	adrp	x9, _ZL3CB2
	add	x9, x9, :lo12:_ZL3CB2
	cmp	w8, #3
	adrp	x8, _ZL3CB4
	add	x8, x8, :lo12:_ZL3CB4
	csel	w10, w4, w10, lo
	adrp	x12, _ZL3CB3
	add	x12, x12, :lo12:_ZL3CB3
	cmp	w10, #3
	adrp	x13, _ZL3CB5
	add	x13, x13, :lo12:_ZL3CB5
	adrp	x11, _ZL3CB0
	add	x11, x11, :lo12:_ZL3CB0
	csel	x8, x8, x9, eq
	csel	x9, x13, x12, eq
	cmp	w10, #1
	csel	x8, x11, x8, eq
	ptrue	p2.b
	adrp	x10, _ZL3CB1
	add	x10, x10, :lo12:_ZL3CB1
	ldr	z0, [x8]
	mov	x8, #-3                         // =0xfffffffffffffffd
	csel	x9, x10, x9, eq
	ld1b	{ z19.b }, p2/z, [x0, x8]
	adrp	x10, _ZL4IX0B
	add	x10, x10, :lo12:_ZL4IX0B
	ldr	z1, [x9]
	adrp	x9, _ZL4IX1B
	add	x9, x9, :lo12:_ZL4IX1B
	ldr	z5, [x10]
	mov	w10, #45                        // =0x2d
	ldr	z4, [x9]
	adrp	x9, _ZL5IX0B8
	add	x9, x9, :lo12:_ZL5IX0B8
	ldr	z2, [x9]
	adrp	x9, _ZL5IX1B8
	add	x9, x9, :lo12:_ZL5IX1B8
	sub	z19.b, z19.b, #128              // =0x80
	ldr	z3, [x9]
	adrp	x9, _ZL6IX0B16
	add	x9, x9, :lo12:_ZL6IX0B16
	mov	z6.h, #4096                     // =0x1000
	ld1b	{ z17.b }, p2/z, [x0, x10]
	ldr	z7, [x9]
	adrp	x9, _ZL6IX1B16
	add	x9, x9, :lo12:_ZL6IX1B16
	ldr	z16, [x9]
	mov	w9, #21                         // =0x15
	tbl	z20.b, { z19.b }, z5.b
	ld1b	{ z18.b }, p2/z, [x0, x9]
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	ptrue	p0.h
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	ptrue	p1.b, vl8
	tbl	z22.b, { z19.b }, z3.b
	mov	w11, #8                         // =0x8
	sub	z18.b, z18.b, #128              // =0x80
	mov	w12, #16                        // =0x10
	mov	w13, #24                        // =0x18
	mov	w14, #32                        // =0x20
	sqrshrunb	z20.b, z20.h, #6
	sub	z17.b, z17.b, #128              // =0x80
	mov	w15, #40                        // =0x28
	mov	w16, #48                        // =0x30
	mov	w17, #56                        // =0x38
	add	x18, x0, x1
	add	x5, x2, x3
	lsl	x4, x1, #1
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x2, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x2, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x2, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x2, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x2, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x2, x17]
	ld1b	{ z19.b }, p2/z, [x18, x8]
	ld1b	{ z18.b }, p2/z, [x18, x9]
	ld1b	{ z17.b }, p2/z, [x18, x10]
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x3]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x5, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x5, x17]
	add	x5, x0, x4
	add	x4, x18, x4
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	lsl	x5, x3, #1
	sub	z19.b, z19.b, #128              // =0x80
	add	x6, x2, x5
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x5]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	ld1b	{ z19.b }, p2/z, [x4, x8]
	ld1b	{ z18.b }, p2/z, [x4, x9]
	ld1b	{ z17.b }, p2/z, [x4, x10]
	add	x4, x5, x3
	add	x5, x2, x4
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	lsl	x4, x1, #2
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x5, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x5, x17]
	add	x5, x0, x4
	add	x4, x18, x4
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	lsl	x5, x3, #2
	sub	z19.b, z19.b, #128              // =0x80
	add	x6, x2, x5
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x5]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	ld1b	{ z19.b }, p2/z, [x4, x8]
	ld1b	{ z18.b }, p2/z, [x4, x9]
	ld1b	{ z17.b }, p2/z, [x4, x10]
	add	x4, x5, x3
	mov	w5, #6                          // =0x6
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	add	x5, x2, x4
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	lsl	x4, x1, #3
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sub	x6, x4, x1
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x5, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x5, x17]
	add	x5, x0, x6
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	lsl	x5, x3, #3
	sub	z19.b, z19.b, #128              // =0x80
	sub	x6, x5, x3
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x6]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x6, x2, x6
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	add	x6, x0, x4
	add	x4, x18, x4
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	add	x6, x2, x5
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x5]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	ld1b	{ z19.b }, p2/z, [x4, x8]
	ld1b	{ z18.b }, p2/z, [x4, x9]
	ld1b	{ z17.b }, p2/z, [x4, x10]
	add	x4, x5, x3
	mov	w5, #10                         // =0xa
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	mov	w5, #11                         // =0xb
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	mov	w5, #12                         // =0xc
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	mov	w5, #13                         // =0xd
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	mov	w5, #14                         // =0xe
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	madd	x6, x1, x5, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x4, x2, x4
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x4, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x4, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x4, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x4, x17]
	mul	x4, x3, x5
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	add	x5, x2, x4
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x4]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	lsl	x4, x1, #4
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sub	x6, x4, x1
	add	x18, x18, x4
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x5, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x5, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x5, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x5, x17]
	add	x5, x0, x6
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	lsl	x5, x3, #4
	sub	z19.b, z19.b, #128              // =0x80
	sub	x6, x5, x3
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x6]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x6, x2, x6
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	add	x6, x0, x4
	mov	w4, #18                         // =0x12
	ld1b	{ z19.b }, p2/z, [x6, x8]
	ld1b	{ z18.b }, p2/z, [x6, x9]
	ld1b	{ z17.b }, p2/z, [x6, x10]
	add	x6, x2, x5
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x5]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x6, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x6, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x6, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x6, x17]
	ld1b	{ z19.b }, p2/z, [x18, x8]
	ld1b	{ z18.b }, p2/z, [x18, x9]
	ld1b	{ z17.b }, p2/z, [x18, x10]
	add	x18, x5, x3
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #19                         // =0x13
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #20                         // =0x14
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x4, x1, x9, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x9
	ld1b	{ z19.b }, p2/z, [x4, x8]
	ld1b	{ z18.b }, p2/z, [x4, x9]
	ld1b	{ z17.b }, p2/z, [x4, x10]
	mov	w4, #22                         // =0x16
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #23                         // =0x17
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x4, x1, x13, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x13
	ld1b	{ z19.b }, p2/z, [x4, x8]
	ld1b	{ z18.b }, p2/z, [x4, x9]
	ld1b	{ z17.b }, p2/z, [x4, x10]
	mov	w4, #25                         // =0x19
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #26                         // =0x1a
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #27                         // =0x1b
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #28                         // =0x1c
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #29                         // =0x1d
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	mov	w4, #30                         // =0x1e
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	madd	x5, x1, x4, x0
	sub	x0, x0, x1
	add	x0, x0, x1, lsl #5
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	mul	x18, x3, x4
	ld1b	{ z19.b }, p2/z, [x5, x8]
	ld1b	{ z18.b }, p2/z, [x5, x9]
	ld1b	{ z17.b }, p2/z, [x5, x10]
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x2, x18]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x18, x2, x18
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x18, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z7.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z18.b, { z18.b }, z16.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x18, x14]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z17.b }, z4.b
	//APP
	sdot	z19.h, z18.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z18.h, z19.h, z19.h
	tbl	z19.b, { z17.b }, z5.b
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x15]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	tbl	z19.b, { z17.b }, z2.b
	//APP
	sdot	z18.h, z20.b, z1.b
	//NO_APP
	tbl	z17.b, { z17.b }, z3.b
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z18.h, z18.h, z18.h
	sqrshrunb	z18.b, z18.h, #6
	uzp1	z18.b, z18.b, z18.b
	st1b	{ z18.b }, p1, [x18, x16]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z19.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z17.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z17.h, z18.h, z18.h
	sqrshrunb	z17.b, z17.h, #6
	uzp1	z17.b, z17.b, z17.b
	st1b	{ z17.b }, p1, [x18, x17]
	ld1b	{ z19.b }, p2/z, [x0, x8]
	ld1b	{ z18.b }, p2/z, [x0, x9]
	ld1b	{ z17.b }, p2/z, [x0, x10]
	lsl	x8, x3, #5
	sub	x9, x2, x3
	sub	z19.b, z19.b, #128              // =0x80
	sub	z18.b, z18.b, #128              // =0x80
	sub	z17.b, z17.b, #128              // =0x80
	tbl	z20.b, { z19.b }, z5.b
	//APP
	movprfx	z22, z6
	sdot	z22.h, z20.b, z0.b
	//NO_APP
	tbl	z21.b, { z19.b }, z4.b
	//APP
	sdot	z22.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z2.b
	//APP
	addp	z22.h, p0/m, z22.h, z22.h
	//NO_APP
	uzp1	z20.h, z22.h, z22.h
	tbl	z22.b, { z19.b }, z3.b
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x9, x8]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	add	x8, x9, x8
	//APP
	sdot	z20.h, z22.b, z1.b
	//NO_APP
	tbl	z21.b, { z19.b }, z7.b
	tbl	z19.b, { z19.b }, z16.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	tbl	z7.b, { z18.b }, z7.b
	tbl	z16.b, { z18.b }, z16.b
	uzp1	z20.h, z20.h, z20.h
	sqrshrunb	z20.b, z20.h, #6
	uzp1	z20.b, z20.b, z20.b
	st1b	{ z20.b }, p1, [x8, x11]
	//APP
	movprfx	z20, z6
	sdot	z20.h, z21.b, z0.b
	//NO_APP
	tbl	z21.b, { z18.b }, z4.b
	//APP
	sdot	z20.h, z19.b, z1.b
	//NO_APP
	tbl	z4.b, { z17.b }, z4.b
	//APP
	addp	z20.h, p0/m, z20.h, z20.h
	//NO_APP
	uzp1	z19.h, z20.h, z20.h
	tbl	z20.b, { z18.b }, z5.b
	tbl	z5.b, { z17.b }, z5.b
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x8, x12]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	tbl	z20.b, { z18.b }, z2.b
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	tbl	z21.b, { z18.b }, z3.b
	tbl	z2.b, { z17.b }, z2.b
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	tbl	z3.b, { z17.b }, z3.b
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x8, x13]
	//APP
	movprfx	z19, z6
	sdot	z19.h, z20.b, z0.b
	//NO_APP
	//APP
	sdot	z19.h, z21.b, z1.b
	//NO_APP
	//APP
	addp	z19.h, p0/m, z19.h, z19.h
	//NO_APP
	uzp1	z19.h, z19.h, z19.h
	sqrshrunb	z19.b, z19.h, #6
	uzp1	z19.b, z19.b, z19.b
	st1b	{ z19.b }, p1, [x8, x14]
	//APP
	movprfx	z18, z6
	sdot	z18.h, z7.b, z0.b
	//NO_APP
	//APP
	sdot	z18.h, z16.b, z1.b
	//NO_APP
	//APP
	addp	z18.h, p0/m, z18.h, z18.h
	//NO_APP
	uzp1	z7.h, z18.h, z18.h
	sqrshrunb	z7.b, z7.h, #6
	uzp1	z7.b, z7.b, z7.b
	st1b	{ z7.b }, p1, [x8, x15]
	//APP
	movprfx	z7, z6
	sdot	z7.h, z5.b, z0.b
	//NO_APP
	//APP
	sdot	z7.h, z4.b, z1.b
	//NO_APP
	//APP
	addp	z7.h, p0/m, z7.h, z7.h
	//NO_APP
	uzp1	z4.h, z7.h, z7.h
	sqrshrunb	z4.b, z4.h, #6
	uzp1	z4.b, z4.b, z4.b
	st1b	{ z4.b }, p1, [x8, x16]
	//APP
	movprfx	z4, z6
	sdot	z4.h, z2.b, z0.b
	//NO_APP
	//APP
	sdot	z4.h, z3.b, z1.b
	//NO_APP
	//APP
	addp	z4.h, p0/m, z4.h, z4.h
	//NO_APP
	uzp1	z0.h, z4.h, z4.h
	sqrshrunb	z0.b, z0.h, #6
	uzp1	z0.b, z0.b, z0.b
	st1b	{ z0.b }, p1, [x8, x17]
	ret
.Lfunc_end0:
	.size	dynopt_interp8_64x32_sve2, .Lfunc_end0-dynopt_interp8_64x32_sve2
	.cfi_endproc
                                        // -- End function
	.type	_ZL3CB0,@object                 // @_ZL3CB0
	.section	.rodata.cst32,"aM",@progbits,32
_ZL3CB0:
	.ascii	"\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:\377\004\366:"
	.size	_ZL3CB0, 32

	.type	_ZL3CB4,@object                 // @_ZL3CB4
_ZL3CB4:
	.ascii	"\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021\000\001\373\021"
	.size	_ZL3CB4, 32

	.type	_ZL3CB2,@object                 // @_ZL3CB2
_ZL3CB2:
	.ascii	"\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365(\377\004\365("
	.size	_ZL3CB2, 32

	.type	_ZL3CB1,@object                 // @_ZL3CB1
_ZL3CB1:
	.asciz	"\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001\000\021\373\001"
	.size	_ZL3CB1, 32

	.type	_ZL3CB5,@object                 // @_ZL3CB5
_ZL3CB5:
	.ascii	":\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377:\366\004\377"
	.size	_ZL3CB5, 32

	.type	_ZL3CB3,@object                 // @_ZL3CB3
_ZL3CB3:
	.ascii	"(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377(\365\004\377"
	.size	_ZL3CB3, 32

	.type	_ZL4IX0B,@object                // @_ZL4IX0B
_ZL4IX0B:
	.ascii	"\000\001\002\003\001\002\003\004\002\003\004\005\003\004\005\006\004\005\006\007\005\006\007\b\006\007\b\t\007\b\t\n"
	.size	_ZL4IX0B, 32

	.type	_ZL4IX1B,@object                // @_ZL4IX1B
_ZL4IX1B:
	.ascii	"\004\005\006\007\005\006\007\b\006\007\b\t\007\b\t\n\b\t\n\013\t\n\013\f\n\013\f\r\013\f\r\016"
	.size	_ZL4IX1B, 32

	.type	_ZL5IX0B8,@object               // @_ZL5IX0B8
_ZL5IX0B8:
	.ascii	"\b\t\n\013\t\n\013\f\n\013\f\r\013\f\r\016\f\r\016\017\r\016\017\020\016\017\020\021\017\020\021\022"
	.size	_ZL5IX0B8, 32

	.type	_ZL5IX1B8,@object               // @_ZL5IX1B8
_ZL5IX1B8:
	.ascii	"\f\r\016\017\r\016\017\020\016\017\020\021\017\020\021\022\020\021\022\023\021\022\023\024\022\023\024\025\023\024\025\026"
	.size	_ZL5IX1B8, 32

	.type	_ZL6IX0B16,@object              // @_ZL6IX0B16
_ZL6IX0B16:
	.ascii	"\020\021\022\023\021\022\023\024\022\023\024\025\023\024\025\026\024\025\026\027\025\026\027\030\026\027\030\031\027\030\031\032"
	.size	_ZL6IX0B16, 32

	.type	_ZL6IX1B16,@object              // @_ZL6IX1B16
_ZL6IX1B16:
	.ascii	"\024\025\026\027\025\026\027\030\026\027\030\031\027\030\031\032\030\031\032\033\031\032\033\034\032\033\034\035\033\034\035\036"
	.size	_ZL6IX1B16, 32

	.ident	"clang version 22.1.8"
	.section	".note.GNU-stack","",@progbits
	.addrsig
