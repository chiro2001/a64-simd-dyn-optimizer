
kernels/sad/candidates/best_sve2.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <dynopt_sad_16x16_sve2>:
   0:	aa0003e4 	mov	x4, x0
   4:	52800205 	mov	w5, #0x10                  	// #16
   8:	2518e127 	ptrue	p7.b, vl16
   c:	d2800000 	mov	x0, #0x0                   	// #0
  10:	3dc0009f 	ldr	q31, [x4]
  14:	710004a5 	subs	w5, w5, #0x1
  18:	3dc0005e 	ldr	q30, [x2]
  1c:	040d1ffe 	uabd	z30.b, p7/m, z30.b, z31.b
  20:	8b030042 	add	x2, x2, x3
  24:	04013fdf 	uaddv	d31, p7, z30.b
  28:	9e6603e6 	fmov	x6, d31
  2c:	8b010084 	add	x4, x4, x1
  30:	8b060000 	add	x0, x0, x6
  34:	54fffee1 	b.ne	10 <dynopt_sad_16x16_sve2+0x10>  // b.any
  38:	d65f03c0 	ret
