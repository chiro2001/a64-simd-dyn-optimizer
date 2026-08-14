
kernels/sad-32/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sad_32x32_sve2>:
   0:	aa0003e5 	mov	x5, x0
   4:	d2800000 	mov	x0, #0x0                   	// #0
   8:	52800404 	mov	w4, #0x20                  	// #32
   c:	25240fe7 	whilelo	p7.b, wzr, w4
  10:	a400bcbf 	ld1b	{z31.b}, p7/z, [x5]
  14:	a400bc5e 	ld1b	{z30.b}, p7/z, [x2]
  18:	040d1ffe 	uabd	z30.b, p7/m, z30.b, z31.b
  1c:	04013fdf 	uaddv	d31, p7, z30.b
  20:	9e6603e6 	fmov	x6, d31
  24:	8b0100a5 	add	x5, x5, x1
  28:	8b030042 	add	x2, x2, x3
  2c:	71000484 	subs	w4, w4, #0x1
  30:	8b060000 	add	x0, x0, x6
  34:	54fffee1 	b.ne	10 <dynopt_sad_32x32_sve2+0x10>  // b.any
  38:	d65f03c0 	ret
