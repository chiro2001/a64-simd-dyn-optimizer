.arch armv8.2-a+sve2
.text
stp d15, d14, [sp, #-0x50]!
stp d13, d12, [sp, #0x10]
stp d11, d10, [sp, #0x20]
stp d9, d8, [sp, #0x30]
stp x29, x30, [sp, #0x40]
add x29, sp, #0x40
sub x9, sp, #1, lsl #12
sub x9, x9, #0x7b0
addvl x9, x9, #0xffffffffffffffe0
addvl x9, x9, #0xffffffffffffffe0
addvl x9, x9, #0xfffffffffffffff7
and sp, x9, #0xffffffffffffffe0
add x8, sp, #1, lsl #12
lsl x12, x2, #1
lsl x13, x2, #2
add x8, x8, #0x3b0
mov x10, xzr
add x9, sp, #0x3a0
add x11, x8, #0x20
mov x14, #-2
mov w15, #0x10
add x16, sp, #0xfb0
add x17, sp, #0xdb0
add x18, sp, #0xcb0
add x2, sp, #0xbb0
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
add x3, x0, x12
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], x13
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x3]
add x3, x17, x15
add x14, x14, #2
cmp x14, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v20.8h, v3.8h
ext v19.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v17.16b, v18.16b, v18.16b, #8
ext v20.16b, v20.16b, v20.16b, #8
saddl2 v22.4s, v19.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl v27.4s, v19.4h, v5.4h
saddl2 v18.4s, v20.8h, v0.8h
saddl2 v23.4s, v17.8h, v1.8h
saddl v26.4s, v21.4h, v4.4h
saddl v28.4s, v17.4h, v1.4h
saddl v29.4s, v20.4h, v0.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v24.4s, v16.4s
rev64 v30.4s, v27.4s
rev64 v23.4s, v23.4s
rev64 v25.4s, v18.4s
sub v4.8h, v5.8h, v19.8h
rev64 v31.4s, v28.4s
sub v6.8h, v0.8h, v20.8h
sub v0.8h, v1.8h, v17.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
stp q21, q4, [x11, #-0x20]
ext v23.16b, v23.16b, v23.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v5.16b, v31.16b, v31.16b, #8
stp q6, q0, [x11], #0x40
add v8.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
sub v2.4s, v26.4s, v22.4s
add v27.4s, v29.4s, v23.4s
add v25.4s, v25.4s, v28.4s
ext v28.16b, v30.16b, v30.16b, #8
sub v4.4s, v29.4s, v23.4s
sub v5.4s, v18.4s, v5.4s
add v30.4s, v8.4s, v24.4s
sub v7.4s, v8.4s, v24.4s
add v9.4s, v27.4s, v25.4s
sub v6.4s, v27.4s, v25.4s
sub v3.4s, v16.4s, v28.4s
zip2 v1.2d, v30.2d, v9.2d
mov v30.d[1], v9.d[0]
stp q7, q6, [x3, #-0x10]
uzp1 v2.8h, v2.8h, v3.8h
uzp1 v3.8h, v4.8h, v5.8h
add x3, x16, x15
add x15, x15, #0x20
rev64 v1.4s, v1.4s
stp q2, q3, [x3, #-0x10]
add v0.4s, v1.4s, v30.4s
sub v1.4s, v30.4s, v1.4s
str q0, [x18, x10]
str q1, [x2, x10]
add x10, x10, #0x10
ldr q0, [x8]
sub x8, x29, #0x40
sub x10, x29, #0x40
add x11, sp, #0x3a0
mov x12, #-1
str z0, [x8, #-0xa, mul vl]
ldr q0, [sp, #0x13d0]
add x11, x11, #0x78
str z0, [x8, #-0xb, mul vl]
ldr q0, [sp, #0x13c0]
str z0, [x8, #-0xc, mul vl]
ldr q0, [sp, #0x13f0]
str z0, [x8, #-0xd, mul vl]
ldr q0, [sp, #0x13e0]
str z0, [x8, #-0xe, mul vl]
ldr q0, [sp, #0x1410]
str z0, [x8, #-0xf, mul vl]
ldr q0, [sp, #0x1400]
str z0, [x8, #-0x10, mul vl]
ldr q0, [sp, #0x1420]
str z0, [x8, #-0x11, mul vl]
ldr q0, [sp, #0x1430]
str z0, [x8, #-0x12, mul vl]
ldr q0, [sp, #0x1450]
str z0, [x8, #-0x13, mul vl]
ldr q0, [sp, #0x1440]
str z0, [x8, #-0x14, mul vl]
ldr q0, [sp, #0x1470]
str z0, [x8, #-0x15, mul vl]
ldr q0, [sp, #0x1460]
str z0, [x8, #-0x16, mul vl]
ldr q0, [sp, #0x1490]
str z0, [x8, #-0x17, mul vl]
ldr q0, [sp, #0x1480]
str z0, [x8, #-0x18, mul vl]
ldr q0, [sp, #0x14a0]
str z0, [x8, #-0x19, mul vl]
ldr q0, [sp, #0x14b0]
str z0, [x8, #-0x1a, mul vl]
ldr q0, [sp, #0x14d0]
str z0, [x8, #-0x1b, mul vl]
ldr q0, [sp, #0x14c0]
str z0, [x8, #-0x1c, mul vl]
ldr q0, [sp, #0x14f0]
str z0, [x8, #-0x1d, mul vl]
ldr q0, [sp, #0x14e0]
str z0, [x8, #-0x1e, mul vl]
ldr q0, [sp, #0x1510]
str z0, [x8, #-0x1f, mul vl]
ldr q0, [sp, #0x1500]
str z0, [x8, #-0x20, mul vl]
ldr q0, [sp, #0x1520]
str z0, [x8, #-0x21, mul vl]
ldr q0, [sp, #0x1530]
str z0, [x8, #-0x22, mul vl]
ldr q0, [sp, #0x1550]
str z0, [x8, #-0x23, mul vl]
ldr q0, [sp, #0x1540]
str z0, [x8, #-0x24, mul vl]
ldr q0, [sp, #0x1570]
str z0, [x8, #-0x25, mul vl]
ldr q0, [sp, #0x1560]
str z0, [x8, #-0x26, mul vl]
ldr q0, [sp, #0x1590]
str z0, [x8, #-0x27, mul vl]
ldr q0, [sp, #0x1580]
str z0, [x8, #-0x28, mul vl]
adrp x8, #0x49f000
ldr x8, [x8, #0xf00]
ldr q0, [sp, #0x15a0]
str z0, [x10, #-0x29, mul vl]
ldr q0, [sp, #0x15b0]
str z0, [x10, #-0x2a, mul vl]
ldr q0, [sp, #0x15d0]
str z0, [x10, #-0x2b, mul vl]
ldr q0, [sp, #0x15c0]
str z0, [x10, #-0x2c, mul vl]
ldr q0, [sp, #0x15f0]
str z0, [x10, #-0x2d, mul vl]
ldr q0, [sp, #0x15e0]
str z0, [x10, #-0x2e, mul vl]
ldr q0, [sp, #0x1610]
str z0, [x10, #-0x2f, mul vl]
ldr q0, [sp, #0x1600]
str z0, [x10, #-0x30, mul vl]
ldr q0, [sp, #0x1620]
str z0, [x10, #-0x31, mul vl]
ldr q0, [sp, #0x1630]
str z0, [x10, #-0x32, mul vl]
ldr q0, [sp, #0x1650]
str z0, [x10, #-0x33, mul vl]
ldr q0, [sp, #0x1640]
str z0, [x10, #-0x34, mul vl]
ldr q0, [sp, #0x1670]
str z0, [x10, #-0x35, mul vl]
ldr q0, [sp, #0x1660]
str z0, [x10, #-0x36, mul vl]
ldr q0, [sp, #0x1690]
str z0, [x10, #-0x37, mul vl]
ldr q0, [sp, #0x1680]
str z0, [x10, #-0x38, mul vl]
ldr q0, [sp, #0x16a0]
str z0, [x10, #-0x39, mul vl]
ldr q0, [sp, #0x16b0]
str z0, [x10, #-0x3a, mul vl]
ldr q0, [sp, #0x16d0]
str z0, [x10, #-0x3b, mul vl]
ldr q0, [sp, #0x16c0]
str z0, [x10, #-0x3c, mul vl]
ldr q0, [sp, #0x16f0]
str z0, [x10, #-0x3d, mul vl]
ldr q0, [sp, #0x16e0]
str z0, [x10, #-0x3e, mul vl]
ldr q0, [sp, #0x1710]
str z0, [x10, #-0x3f, mul vl]
ldr q0, [sp, #0x1700]
str z0, [x10, #-0x40, mul vl]
ldr q0, [sp, #0x1720]
str z0, [x10, #-0x41, mul vl]
ldr q0, [sp, #0x1730]
str z0, [x10, #-0x42, mul vl]
ldr q0, [sp, #0x1750]
str z0, [x10, #-0x43, mul vl]
ldr q0, [sp, #0x1740]
str z0, [x10, #-0x44, mul vl]
ldr q0, [sp, #0x1770]
str z0, [x10, #-0x45, mul vl]
ldr q0, [sp, #0x1760]
str z0, [x10, #-0x46, mul vl]
ldr q0, [sp, #0x1790]
str z0, [x10, #-0x47, mul vl]
ldr q0, [sp, #0x1780]
str z0, [x10, #-0x48, mul vl]
ldr q0, [sp, #0x17a0]
str z0, [x10, #-0x49, mul vl]
add x10, x8, #0x50
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
movi v2.2d, #0000000000000000
sub x13, x29, #0x40
movi v3.2d, #0000000000000000
ldp q18, q0, [x10, #-0x10]
ldr z1, [x13, #-0xa, mul vl]
movi v5.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v7.2d, #0000000000000000
sdot z2.d, z18.h, z1.h
ldr z1, [x13, #-0xb, mul vl]
movi v20.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v21.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v27.2d, #0000000000000000
add x12, x12, #2
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0xd, mul vl]
movi v11.2d, #0000000000000000
movi v28.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v29.2d, #0000000000000000
movi v13.2d, #0000000000000000
movi v30.2d, #0000000000000000
cmp x12, #0x1e
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0xf, mul vl]
movi v14.2d, #0000000000000000
str z3, [x13, #-1, mul vl]
movi v3.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v25.2d, #0000000000000000
sdot z4.d, z18.h, z1.h
ldr z1, [x13, #-0x12, mul vl]
movi v9.2d, #0000000000000000
str z5, [x13, #-2, mul vl]
movi v5.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x10, x10, #0x80
sdot z17.d, z18.h, z1.h
ldr z1, [x13, #-0x13, mul vl]
sdot z6.d, z18.h, z1.h
ldr z1, [x13, #-0x15, mul vl]
sdot z16.d, z18.h, z1.h
ldr z1, [x13, #-0x17, mul vl]
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x1a, mul vl]
str z16, [x13, #-3, mul vl]
sdot z20.d, z18.h, z1.h
ldr z1, [x13, #-0x1b, mul vl]
mov z16.d, z7.d
movi v7.2d, #0000000000000000
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x1d, mul vl]
str z20, [x13, #-4, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x1f, mul vl]
mov z20.d, z3.d
movi v3.2d, #0000000000000000
sdot z7.d, z18.h, z1.h
ldr z1, [x13, #-0x22, mul vl]
str z5, [x13, #-5, mul vl]
movi v5.2d, #0000000000000000
sdot z19.d, z18.h, z1.h
ldr z1, [x13, #-0x23, mul vl]
mov z23.d, z7.d
ldr z7, [x13, #-3, mul vl]
sdot z21.d, z18.h, z1.h
ldr z1, [x13, #-0x25, mul vl]
mov z26.d, z19.d
ldr z19, [x13, #-4, mul vl]
sdot z3.d, z18.h, z1.h
ldr z1, [x13, #-0x27, mul vl]
str z21, [x13, #-6, mul vl]
ldr z21, [x13, #-5, mul vl]
sdot z22.d, z18.h, z1.h
ldr z1, [x13, #-0x2a, mul vl]
str z3, [x13, #-7, mul vl]
ldr z3, [x13, #-0x3a, mul vl]
sdot z5.d, z18.h, z1.h
ldr z1, [x13, #-0x2b, mul vl]
sdot z10.d, z18.h, z3.h
ldr z3, [x13, #-0x3b, mul vl]
str z22, [x13, #-8, mul vl]
ldr z22, [x13, #-6, mul vl]
sdot z27.d, z18.h, z1.h
ldr z1, [x13, #-0x2d, mul vl]
sdot z11.d, z18.h, z3.h
ldr z3, [x13, #-0x3d, mul vl]
str z5, [x13, #-9, mul vl]
mov z5.d, z17.d
mov z17.d, z20.d
mov z20.d, z23.d
sdot z28.d, z18.h, z1.h
ldr z1, [x13, #-0x2f, mul vl]
mov z23.d, z26.d
sdot z12.d, z18.h, z3.h
ldr z3, [x13, #-0x3f, mul vl]
sdot z29.d, z18.h, z1.h
ldr z1, [x13, #-0x32, mul vl]
sdot z13.d, z18.h, z3.h
ldr z3, [x13, #-0x42, mul vl]
sdot z30.d, z18.h, z1.h
ldr z1, [x13, #-0x33, mul vl]
sdot z14.d, z18.h, z3.h
ldr z3, [x13, #-0x43, mul vl]
sdot z31.d, z18.h, z1.h
ldr z1, [x13, #-0x35, mul vl]
sdot z15.d, z18.h, z3.h
ldr z3, [x13, #-0x45, mul vl]
sdot z8.d, z18.h, z1.h
ldr z1, [x13, #-0x37, mul vl]
sdot z25.d, z18.h, z3.h
ldr z3, [x13, #-0x47, mul vl]
sdot z9.d, z18.h, z1.h
ldr z1, [x13, #-1, mul vl]
sdot z24.d, z18.h, z3.h
ldr z18, [x13, #-0xc, mul vl]
mov z3.d, z2.d
ldr z2, [x13, #-2, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0xe, mul vl]
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x10, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x11, mul vl]
uzp1 v26.4s, v3.4s, v1.4s
ldr z3, [x13, #-7, mul vl]
ldr z1, [x13, #-8, mul vl]
sdot z4.d, z0.h, z18.h
ldr z18, [x13, #-0x14, mul vl]
sdot z5.d, z0.h, z18.h
ldr z18, [x13, #-0x16, mul vl]
uzp1 v4.4s, v2.4s, v4.4s
ldr z2, [x13, #-9, mul vl]
sdot z6.d, z0.h, z18.h
ldr z18, [x13, #-0x18, mul vl]
sdot z7.d, z0.h, z18.h
ldr z18, [x13, #-0x19, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x30, mul vl]
sdot z16.d, z0.h, z18.h
ldr z18, [x13, #-0x1c, mul vl]
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x31, mul vl]
sdot z19.d, z0.h, z18.h
ldr z18, [x13, #-0x1e, mul vl]
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x34, mul vl]
ldr z16, [x13, #-0x38, mul vl]
sdot z17.d, z0.h, z18.h
ldr z18, [x13, #-0x20, mul vl]
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x36, mul vl]
sdot z8.d, z0.h, z16.h
ldr z16, [x13, #-0x39, mul vl]
sdot z21.d, z0.h, z18.h
ldr z18, [x13, #-0x21, mul vl]
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v19.4s, v17.4s
ldr z17, [x13, #-0x3c, mul vl]
ldr z19, [x13, #-0x44, mul vl]
sdot z9.d, z0.h, z16.h
sdot z20.d, z0.h, z18.h
ldr z18, [x13, #-0x24, mul vl]
sdot z10.d, z0.h, z17.h
ldr z17, [x13, #-0x3e, mul vl]
sdot z14.d, z0.h, z19.h
ldr z19, [x13, #-0x46, mul vl]
sdot z23.d, z0.h, z18.h
ldr z18, [x13, #-0x26, mul vl]
uzp1 v16.4s, v21.4s, v20.4s
sdot z11.d, z0.h, z17.h
sdot z15.d, z0.h, z19.h
sdot z22.d, z0.h, z18.h
ldr z18, [x13, #-0x28, mul vl]
sdot z3.d, z0.h, z18.h
ldr z18, [x13, #-0x29, mul vl]
uzp1 v20.4s, v14.4s, v15.4s
uzp1 v17.4s, v23.4s, v22.4s
sdot z1.d, z0.h, z18.h
ldr z18, [x13, #-0x2c, mul vl]
sdot z2.d, z0.h, z18.h
ldr z18, [x13, #-0x2e, mul vl]
sdot z27.d, z0.h, z18.h
ldr z18, [x13, #-0x40, mul vl]
sdot z12.d, z0.h, z18.h
ldr z18, [x13, #-0x41, mul vl]
sdot z13.d, z0.h, z18.h
uzp1 v18.4s, v3.4s, v1.4s
addp v3.4s, v26.4s, v4.4s
ldr z4, [x13, #-0x48, mul vl]
sdot z25.d, z0.h, z4.h
ldr z4, [x13, #-0x49, mul vl]
addp v17.4s, v17.4s, v18.4s
uzp1 v18.4s, v10.4s, v11.4s
uzp1 v19.4s, v12.4s, v13.4s
sdot z24.d, z0.h, z4.h
addp v0.4s, v5.4s, v6.4s
uzp1 v4.4s, v2.4s, v27.4s
uzp1 v5.4s, v28.4s, v29.4s
addp v6.4s, v7.4s, v16.4s
uzp1 v7.4s, v30.4s, v31.4s
uzp1 v16.4s, v8.4s, v9.4s
rshrn v2.4h, v3.4s, #4
rshrn v0.4h, v0.4s, #4
uzp1 v1.4s, v25.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
rshrn v5.4h, v6.4s, #4
addp v6.4s, v18.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
rshrn v7.4h, v17.4s, #4
stp d2, d0, [x11, #-0x38]
addp v1.4s, v20.4s, v1.4s
rshrn v2.4h, v3.4s, #4
rshrn v3.4h, v6.4s, #4
rshrn v0.4h, v4.4s, #4
stp d5, d7, [x11, #-0x28]
rshrn v1.4h, v1.4s, #4
stp d2, d0, [x11, #-0x18]
stp d3, d1, [x11, #-8]
add x11, x11, #0x80
ldr q0, [sp, #0xfb0]
sub x10, x29, #0x40
add x11, sp, #0x3a0
ldr q12, [sp, #0x1170]
ldr q13, [sp, #0x1180]
ldr q14, [sp, #0x1190]
str z0, [x10, #-1, mul vl]
ldr q0, [sp, #0xfc0]
add x11, x11, #0xb8
ldr q15, [sp, #0x11a0]
mov x12, #-2
str z0, [x10, #-2, mul vl]
ldr q0, [sp, #0xfd0]
str z0, [x10, #-3, mul vl]
ldr q0, [sp, #0xfe0]
str z0, [x10, #-4, mul vl]
ldr q0, [sp, #0xff0]
str z0, [x10, #-5, mul vl]
ldr q0, [sp, #0x1000]
str z0, [x10, #-6, mul vl]
ldr q0, [sp, #0x1010]
str z0, [x10, #-7, mul vl]
ldr q0, [sp, #0x1020]
str z0, [x10, #-8, mul vl]
ldr q0, [sp, #0x1030]
str z0, [x10, #-9, mul vl]
ldr q0, [sp, #0x1040]
str z0, [x10, #-0xa, mul vl]
ldr q0, [sp, #0x1050]
str z0, [x10, #-0xb, mul vl]
ldr q0, [sp, #0x1060]
str z0, [x10, #-0xc, mul vl]
ldr q0, [sp, #0x1070]
str z0, [x10, #-0xd, mul vl]
ldr q0, [sp, #0x1080]
str z0, [x10, #-0xe, mul vl]
ldr q0, [sp, #0x1090]
str z0, [x10, #-0xf, mul vl]
ldr q0, [sp, #0x10a0]
str z0, [x10, #-0x10, mul vl]
ldr q0, [sp, #0x10b0]
str z0, [x10, #-0x11, mul vl]
ldr q0, [sp, #0x10c0]
str z0, [x10, #-0x12, mul vl]
ldr q0, [sp, #0x10d0]
str z0, [x10, #-0x13, mul vl]
ldr q0, [sp, #0x10e0]
str z0, [x10, #-0x14, mul vl]
ldr q0, [sp, #0x10f0]
str z0, [x10, #-0x15, mul vl]
ldr q0, [sp, #0x1100]
str z0, [x10, #-0x16, mul vl]
ldr q0, [sp, #0x1110]
str z0, [x10, #-0x17, mul vl]
ldr q0, [sp, #0x1120]
str z0, [x10, #-0x18, mul vl]
ldr q0, [sp, #0x1130]
str z0, [x10, #-0x19, mul vl]
ldr q0, [sp, #0x1140]
str z0, [x10, #-0x1a, mul vl]
ldr q0, [sp, #0x1150]
str z0, [x10, #-0x1b, mul vl]
ldr q0, [sp, #0x1160]
str z0, [x10, #-0x1c, mul vl]
add x10, x8, #0x80
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
movi v1.2d, #0000000000000000
sub x13, x29, #0x40
ldr q0, [x10]
ldr z5, [x13, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v3.2d, #0000000000000000
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v18.2d, #0000000000000000
ldr z19, [x13, #-9, mul vl]
sdot z1.d, z0.h, z5.h
ldr z5, [x13, #-2, mul vl]
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
ldr z24, [x13, #-0xd, mul vl]
movi v6.2d, #0000000000000000
ldr z25, [x13, #-0xf, mul vl]
ldr z28, [x13, #-0x15, mul vl]
ldr z26, [x13, #-0x11, mul vl]
sdot z2.d, z0.h, z5.h
ldr z5, [x13, #-3, mul vl]
ldr z27, [x13, #-0x13, mul vl]
sdot z20.d, z0.h, z19.h
ldr z19, [x13, #-0xa, mul vl]
movi v21.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v29.2d, #0000000000000000
ldr z30, [x13, #-0x16, mul vl]
sdot z3.d, z0.h, z5.h
ldr z5, [x13, #-4, mul vl]
ldr z8, [x13, #-0x17, mul vl]
uzp1 v2.4s, v1.4s, v2.4s
sdot z22.d, z0.h, z19.h
ldr z19, [x13, #-0xc, mul vl]
ldr z10, [x13, #-0x18, mul vl]
movi v31.2d, #0000000000000000
movi v9.2d, #0000000000000000
sdot z4.d, z0.h, z5.h
ldr z5, [x13, #-5, mul vl]
movi v11.2d, #0000000000000000
sdot z6.d, z0.h, z19.h
movi v19.2d, #0000000000000000
add x12, x12, #4
uzp1 v20.4s, v20.4s, v22.4s
movi v22.2d, #0000000000000000
cmp x12, #0x1c
sdot z7.d, z0.h, z5.h
ldr z5, [x13, #-6, mul vl]
sdot z9.d, z0.h, z13.h
uzp1 v4.4s, v3.4s, v4.4s
sdot z11.d, z0.h, z15.h
add x10, x10, #0x100
sdot z19.d, z0.h, z26.h
ldr z26, [x13, #-0x12, mul vl]
sdot z16.d, z0.h, z5.h
ldr z5, [x13, #-7, mul vl]
sdot z22.d, z0.h, z27.h
ldr z27, [x13, #-0x14, mul vl]
sdot z21.d, z0.h, z26.h
movi v26.2d, #0000000000000000
addp v2.4s, v2.4s, v4.4s
sdot z17.d, z0.h, z5.h
ldr z5, [x13, #-8, mul vl]
uzp1 v1.4s, v7.4s, v16.4s
movi v7.2d, #0000000000000000
movi v16.2d, #0000000000000000
sdot z23.d, z0.h, z27.h
movi v27.2d, #0000000000000000
rshrn v2.4h, v2.4s, #4
sdot z18.d, z0.h, z5.h
movi v5.2d, #0000000000000000
sdot z26.d, z0.h, z8.h
movi v8.2d, #0000000000000000
sdot z7.d, z0.h, z24.h
ldr z24, [x13, #-0xe, mul vl]
sdot z27.d, z0.h, z10.h
movi v10.2d, #0000000000000000
uzp1 v3.4s, v17.4s, v18.4s
ldr z17, [x13, #-0xb, mul vl]
movi v18.2d, #0000000000000000
sdot z16.d, z0.h, z24.h
movi v24.2d, #0000000000000000
sdot z8.d, z0.h, z12.h
sdot z5.d, z0.h, z17.h
movi v17.2d, #0000000000000000
sdot z10.d, z0.h, z14.h
sdot z24.d, z0.h, z28.h
movi v28.2d, #0000000000000000
sdot z17.d, z0.h, z25.h
ldr z25, [x13, #-0x10, mul vl]
uzp1 v5.4s, v5.4s, v6.4s
ldr z6, [x13, #-0x19, mul vl]
sdot z18.d, z0.h, z25.h
movi v25.2d, #0000000000000000
sdot z28.d, z0.h, z6.h
ldr z6, [x13, #-0x1a, mul vl]
addp v4.4s, v20.4s, v5.4s
sdot z25.d, z0.h, z30.h
movi v30.2d, #0000000000000000
sdot z29.d, z0.h, z6.h
uzp1 v6.4s, v7.4s, v16.4s
ldr z7, [x13, #-0x1b, mul vl]
uzp1 v16.4s, v26.4s, v27.4s
rshrn v4.4h, v4.4s, #4
sdot z30.d, z0.h, z7.h
ldr z7, [x13, #-0x1c, mul vl]
uzp1 v5.4s, v24.4s, v25.4s
sdot z31.d, z0.h, z7.h
uzp1 v7.4s, v17.4s, v18.4s
addp v0.4s, v1.4s, v3.4s
uzp1 v1.4s, v19.4s, v21.4s
uzp1 v3.4s, v22.4s, v23.4s
uzp1 v18.4s, v8.4s, v9.4s
uzp1 v19.4s, v10.4s, v11.4s
rshrn v0.4h, v0.4s, #4
addp v6.4s, v6.4s, v7.4s
uzp1 v7.4s, v28.4s, v29.4s
uzp1 v17.4s, v30.4s, v31.4s
addp v1.4s, v1.4s, v3.4s
addp v3.4s, v5.4s, v16.4s
stp d2, d0, [x11, #-0x38]
addp v2.4s, v18.4s, v19.4s
rshrn v6.4h, v6.4s, #4
addp v5.4s, v7.4s, v17.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v3.4s, #4
rshrn v2.4h, v2.4s, #4
rshrn v3.4h, v5.4s, #4
stp d4, d6, [x11, #-0x28]
stp d1, d0, [x11, #-0x18]
stp d3, d2, [x11, #-8]
add x11, x11, #0x100
ptrue p0.s, vl4
mov x11, #0x80
ldr q8, [sp, #0xdb0]
ldr q2, [sp, #0xdc0]
ldr q3, [sp, #0xdd0]
ldr q4, [sp, #0xde0]
ld1sh {z21.s}, p0/z, [x8, x11, lsl #1]
ldr q31, [sp, #0xdf0]
mov x11, #0x180
ldr q7, [sp, #0xe00]
stp q4, q3, [sp, #0x300]
add x14, sp, #1, lsl #12
ldr q15, [sp, #0xe10]
ldr q17, [sp, #0xe20]
mov x10, xzr
mul v0.4s, v21.4s, v8.4s
mul v1.4s, v21.4s, v2.4s
mul v3.4s, v21.4s, v3.4s
mul v4.4s, v21.4s, v4.4s
mul v5.4s, v21.4s, v31.4s
mul v6.4s, v21.4s, v7.4s
str q2, [sp, #0x2c0]
ldr q18, [sp, #0xe30]
ldr q19, [sp, #0xe40]
stp q7, q17, [sp, #0x2e0]
mul v7.4s, v21.4s, v15.4s
mul v17.4s, v21.4s, v17.4s
ldr q2, [sp, #0xe50]
ldr q16, [sp, #0xe60]
mul v9.4s, v21.4s, v18.4s
mul v10.4s, v21.4s, v19.4s
addp v0.4s, v0.4s, v1.4s
addp v1.4s, v3.4s, v4.4s
addp v3.4s, v5.4s, v6.4s
mul v5.4s, v21.4s, v2.4s
mul v6.4s, v21.4s, v16.4s
addp v4.4s, v7.4s, v17.4s
ldr q29, [sp, #0xeb0]
ldr q30, [sp, #0xec0]
stp q18, q16, [sp, #0x350]
ldr q17, [sp, #0xe70]
ldr q18, [sp, #0xe80]
addp v12.4s, v9.4s, v10.4s
stp q2, q19, [sp, #0x370]
ldr q19, [sp, #0xe90]
addp v14.4s, v5.4s, v6.4s
addp v24.4s, v0.4s, v1.4s
addp v2.4s, v3.4s, v4.4s
ldr q0, [sp, #0xd90]
ldr q4, [sp, #0xda0]
mul v1.4s, v21.4s, v29.4s
mul v3.4s, v21.4s, v30.4s
str q17, [sp, #0x2d0]
mul v10.4s, v21.4s, v17.4s
stp q0, q4, [sp, #0x1b0]
mul v9.4s, v21.4s, v19.4s
ldr q17, [sp, #0xef0]
stp q19, q18, [sp, #0x330]
ldr q19, [sp, #0xf00]
addp v5.4s, v12.4s, v14.4s
addp v6.4s, v0.4s, v4.4s
mul v13.4s, v21.4s, v18.4s
mul v18.4s, v21.4s, v17.4s
mul v0.4s, v21.4s, v19.4s
ldr q27, [sp, #0xed0]
ldr q22, [sp, #0xee0]
stp q5, q2, [sp, #0x220]
ldr q2, [sp, #0xf10]
ldr q4, [sp, #0xf20]
addp v25.4s, v1.4s, v3.4s
shl v1.4s, v6.4s, #6
ldr q20, [sp, #0xea0]
mul v5.4s, v21.4s, v27.4s
mul v14.4s, v21.4s, v22.4s
str q2, [sp, #0x260]
mul v3.4s, v21.4s, v2.4s
mul v2.4s, v21.4s, v4.4s
mul v11.4s, v21.4s, v20.4s
rshrn v6.4h, v24.4s, #4
addp v24.4s, v18.4s, v0.4s
rshrn v0.4h, v1.4s, #4
ld1sh {z1.s}, p0/z, [x8, x11, lsl #1]
str q22, [sp, #0x1e0]
mov v12.16b, v31.16b
str q19, [sp, #0x2b0]
addp v22.4s, v5.4s, v14.4s
addp v13.4s, v10.4s, v13.4s
addp v19.4s, v3.4s, v2.4s
stp q31, q8, [sp, #0x190]
addp v23.4s, v9.4s, v11.4s
mul v3.4s, v1.4s, v31.4s
ldp q14, q31, [sp, #0x2e0]
ldp q11, q10, [sp, #0x300]
ldr q26, [sp, #0xf30]
ldr q28, [sp, #0xf40]
ldr q5, [sp, #0xf50]
ldr q7, [sp, #0xf60]
mul v2.4s, v1.4s, v14.4s
str q20, [sp, #0x320]
mul v20.4s, v21.4s, v26.4s
str q17, [sp, #0x390]
mul v18.4s, v21.4s, v28.4s
mul v17.4s, v21.4s, v5.4s
stp q5, q7, [sp, #0x1f0]
ldr q9, [sp, #0x2c0]
mul v5.4s, v1.4s, v11.4s
str d6, [sp, #0x4a0]
mul v6.4s, v21.4s, v7.4s
mul v7.4s, v1.4s, v10.4s
addp v23.4s, v13.4s, v23.4s
stp q27, q4, [sp, #0x240]
mul v16.4s, v1.4s, v8.4s
mul v4.4s, v1.4s, v9.4s
addp v2.4s, v3.4s, v2.4s
ldr q3, [sp, #0x220]
str d0, [sp, #0x1d0]
mul v13.4s, v1.4s, v15.4s
mul v0.4s, v1.4s, v31.4s
addp v19.4s, v24.4s, v19.4s
addp v18.4s, v20.4s, v18.4s
addp v6.4s, v17.4s, v6.4s
addp v5.4s, v7.4s, v5.4s
rshrn v7.4h, v23.4s, #4
rshrn v3.4h, v3.4s, #4
ldp q17, q24, [sp, #0x350]
addp v4.4s, v16.4s, v4.4s
ldp q23, q20, [sp, #0x370]
ldr q16, [sp, #0x230]
addp v0.4s, v13.4s, v0.4s
addp v22.4s, v25.4s, v22.4s
addp v6.4s, v18.4s, v6.4s
mul v17.4s, v1.4s, v17.4s
mul v24.4s, v1.4s, v24.4s
rshrn v16.4h, v16.4s, #4
mul v20.4s, v1.4s, v20.4s
mul v23.4s, v1.4s, v23.4s
str d3, [sp, #0x4b0]
rshrn v3.4h, v19.4s, #4
addp v4.4s, v4.4s, v5.4s
addp v0.4s, v2.4s, v0.4s
str d7, [sp, #0x4b8]
rshrn v6.4h, v6.4s, #4
mul v18.4s, v1.4s, v30.4s
str d16, [sp, #0x4a8]
rshrn v16.4h, v22.4s, #4
mul v19.4s, v1.4s, v28.4s
addp v2.4s, v17.4s, v20.4s
addp v5.4s, v23.4s, v24.4s
rshrn v0.4h, v0.4s, #4
str d3, [sp, #0x4c8]
rshrn v3.4h, v4.4s, #4
ldr q4, [sp, #0x2d0]
mul v17.4s, v1.4s, v29.4s
str d6, [sp, #0x4d0]
ldr q23, [sp, #0xf90]
addp v2.4s, v2.4s, v5.4s
ldp q7, q5, [sp, #0x330]
str d16, [sp, #0x4c0]
ldr q16, [sp, #0x320]
mul v4.4s, v1.4s, v4.4s
str d3, [sp, #0x6a0]
mul v3.4s, v1.4s, v27.4s
mov x11, #0x280
mul v5.4s, v1.4s, v5.4s
ldp q27, q22, [sp, #0x1e0]
mul v7.4s, v1.4s, v7.4s
mul v16.4s, v1.4s, v16.4s
str d0, [sp, #0x6a8]
rshrn v2.4h, v2.4s, #4
stp q30, q29, [sp, #0x270]
mov w12, #0x10
mul v6.4s, v1.4s, v27.4s
stp q28, q26, [sp, #0x290]
ldr q28, [sp, #0x200]
addp v0.4s, v4.4s, v5.4s
addp v5.4s, v17.4s, v18.4s
str q23, [sp, #0x210]
ldp q18, q17, [sp, #0x250]
addp v4.4s, v7.4s, v16.4s
ldr q7, [sp, #0x390]
ldr q16, [sp, #0x2b0]
str d2, [sp, #0x6b0]
addp v3.4s, v3.4s, v6.4s
mul v6.4s, v1.4s, v26.4s
mul v20.4s, v1.4s, v28.4s
mul v7.4s, v1.4s, v7.4s
mul v16.4s, v1.4s, v16.4s
mul v17.4s, v1.4s, v17.4s
mul v18.4s, v1.4s, v18.4s
addp v2.4s, v0.4s, v4.4s
mul v4.4s, v1.4s, v22.4s
addp v29.4s, v5.4s, v3.4s
ldr q3, [sp, #0xf70]
ldr q5, [sp, #0xf80]
ld1sh {z0.s}, p0/z, [x8, x11, lsl #1]
mul v23.4s, v1.4s, v23.4s
addp v7.4s, v7.4s, v16.4s
stp q5, q3, [sp, #0x220]
mov x11, #0x380
addp v16.4s, v17.4s, v18.4s
addp v17.4s, v6.4s, v19.4s
rshrn v6.4h, v2.4s, #4
ldr q2, [sp, #0xfa0]
addp v18.4s, v4.4s, v20.4s
mul v19.4s, v1.4s, v3.4s
mul v20.4s, v1.4s, v5.4s
mul v26.4s, v0.4s, v10.4s
mul v13.4s, v0.4s, v11.4s
mul v5.4s, v1.4s, v2.4s
stp q2, q15, [sp, #0x170]
mul v4.4s, v0.4s, v12.4s
mul v3.4s, v0.4s, v14.4s
mul v2.4s, v0.4s, v15.4s
mul v1.4s, v0.4s, v31.4s
str d6, [sp, #0x6b8]
addp v6.4s, v7.4s, v16.4s
mul v24.4s, v0.4s, v8.4s
addp v16.4s, v19.4s, v20.4s
mul v25.4s, v0.4s, v9.4s
addp v7.4s, v17.4s, v18.4s
addp v5.4s, v23.4s, v5.4s
addp v18.4s, v26.4s, v13.4s
rshrn v19.4h, v29.4s, #4
addp v3.4s, v4.4s, v3.4s
addp v1.4s, v2.4s, v1.4s
rshrn v2.4h, v6.4s, #4
ldp q13, q30, [sp, #0x350]
rshrn v4.4h, v7.4s, #4
ldp q29, q31, [sp, #0x370]
addp v5.4s, v16.4s, v5.4s
addp v17.4s, v24.4s, v25.4s
addp v1.4s, v3.4s, v1.4s
str d19, [sp, #0x6c0]
mul v6.4s, v0.4s, v13.4s
mul v20.4s, v0.4s, v30.4s
str d2, [sp, #0x6c8]
mul v7.4s, v0.4s, v31.4s
mul v16.4s, v0.4s, v29.4s
rshrn v3.4h, v5.4s, #4
addp v17.4s, v17.4s, v18.4s
ldp q19, q18, [sp, #0x270]
str d4, [sp, #0x6d0]
ldp q9, q8, [sp, #0x330]
ldr q11, [sp, #0x2d0]
ldr q10, [sp, #0x320]
rshrn v1.4h, v1.4s, #4
addp v2.4s, v6.4s, v7.4s
addp v4.4s, v16.4s, v20.4s
str d3, [sp, #0x6d8]
ldp q3, q15, [sp, #0x240]
rshrn v5.4h, v17.4s, #4
mul v18.4s, v0.4s, v18.4s
mul v19.4s, v0.4s, v19.4s
mul v6.4s, v0.4s, v11.4s
mul v7.4s, v0.4s, v8.4s
mul v16.4s, v0.4s, v9.4s
mul v17.4s, v0.4s, v10.4s
mul v3.4s, v0.4s, v3.4s
mul v20.4s, v0.4s, v27.4s
addp v2.4s, v2.4s, v4.4s
str d5, [sp, #0x8a0]
ldr q14, [sp, #0x260]
ldr q25, [sp, #0x210]
addp v5.4s, v18.4s, v19.4s
ldp q18, q12, [sp, #0x2a0]
rshrn v2.4h, v2.4s, #4
ldp q24, q23, [sp, #0x220]
str d1, [sp, #0x8a8]
addp v1.4s, v6.4s, v7.4s
addp v4.4s, v16.4s, v17.4s
addp v3.4s, v3.4s, v20.4s
ldr q6, [sp, #0x390]
ldr q19, [sp, #0x290]
mul v20.4s, v0.4s, v22.4s
mul v22.4s, v0.4s, v28.4s
ldr q28, [sp, #0x170]
mul v16.4s, v0.4s, v14.4s
mul v17.4s, v0.4s, v15.4s
mul v6.4s, v0.4s, v6.4s
mul v7.4s, v0.4s, v12.4s
mul v18.4s, v0.4s, v18.4s
mul v19.4s, v0.4s, v19.4s
mul v23.4s, v0.4s, v23.4s
mul v24.4s, v0.4s, v24.4s
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v28.4s
ld1sh {z0.s}, p0/z, [x8, x11, lsl #1]
str d2, [sp, #0x8b0]
addp v2.4s, v1.4s, v4.4s
ldr q1, [sp, #0x1a0]
addp v4.4s, v16.4s, v17.4s
addp v27.4s, v5.4s, v3.4s
addp v5.4s, v18.4s, v19.4s
addp v3.4s, v6.4s, v7.4s
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x2c0]
addp v6.4s, v20.4s, v22.4s
addp v7.4s, v23.4s, v24.4s
addp v16.4s, v25.4s, v26.4s
mul v26.4s, v0.4s, v13.4s
mul v18.4s, v0.4s, v1.4s
ldr q1, [sp, #0x310]
addp v3.4s, v3.4s, v4.4s
addp v5.4s, v5.4s, v6.4s
mul v4.4s, v0.4s, v29.4s
mul v13.4s, v0.4s, v31.4s
mul v19.4s, v0.4s, v1.4s
ldr q1, [sp, #0x300]
rshrn v2.4h, v2.4s, #4
addp v6.4s, v7.4s, v16.4s
rshrn v3.4h, v3.4s, #4
adrp x11, #0x458000
mul v20.4s, v0.4s, v1.4s
ldr q1, [sp, #0x190]
rshrn v5.4h, v5.4s, #4
addp v7.4s, v17.4s, v18.4s
mov w13, #0x20
add x14, x14, #0x3b0
mul v22.4s, v0.4s, v1.4s
ldr q1, [sp, #0x2e0]
str d2, [sp, #0x8b8]
str d3, [sp, #0x8c8]
rshrn v3.4h, v6.4s, #4
add x15, sp, #0xfb0
mul v23.4s, v0.4s, v1.4s
ldr q1, [sp, #0x180]
addp v16.4s, v19.4s, v20.4s
addp v19.4s, v26.4s, v13.4s
str d5, [sp, #0x8d0]
ldr q5, [sp, #0x240]
mul v24.4s, v0.4s, v1.4s
ldr q1, [sp, #0x2f0]
rshrn v20.4h, v27.4s, #4
addp v2.4s, v7.4s, v16.4s
mul v5.4s, v0.4s, v5.4s
str d3, [sp, #0x8d8]
mul v25.4s, v0.4s, v1.4s
mul v1.4s, v0.4s, v30.4s
addp v17.4s, v22.4s, v23.4s
mul v22.4s, v0.4s, v8.4s
mul v23.4s, v0.4s, v9.4s
add x16, sp, #0xdb0
rshrn v2.4h, v2.4s, #4
str d20, [sp, #0x8c0]
add x17, sp, #0xcb0
add x18, sp, #0xbb0
addp v18.4s, v24.4s, v25.4s
addp v1.4s, v4.4s, v1.4s
mul v4.4s, v0.4s, v11.4s
mul v24.4s, v0.4s, v10.4s
str d2, [sp, #0xaa0]
addp v7.4s, v17.4s, v18.4s
ldr q18, [sp, #0x1e0]
addp v1.4s, v19.4s, v1.4s
ldp q17, q16, [sp, #0x270]
addp v4.4s, v4.4s, v22.4s
addp v6.4s, v23.4s, v24.4s
mul v18.4s, v0.4s, v18.4s
ldr q24, [sp, #0x210]
rshrn v7.4h, v7.4s, #4
rshrn v1.4h, v1.4s, #4
mul v16.4s, v0.4s, v16.4s
mul v17.4s, v0.4s, v17.4s
addp v3.4s, v4.4s, v6.4s
mul v6.4s, v0.4s, v12.4s
addp v4.4s, v5.4s, v18.4s
ldr q5, [sp, #0x390]
str d7, [sp, #0xaa8]
mul v7.4s, v0.4s, v14.4s
addp v2.4s, v16.4s, v17.4s
rshrn v3.4h, v3.4s, #4
mul v5.4s, v0.4s, v5.4s
mul v16.4s, v0.4s, v15.4s
str d1, [sp, #0xab0]
ldp q17, q1, [sp, #0x290]
ldp q18, q19, [sp, #0x1f0]
addp v2.4s, v2.4s, v4.4s
ldp q22, q20, [sp, #0x220]
str d3, [sp, #0xab8]
mul v1.4s, v0.4s, v1.4s
mul v17.4s, v0.4s, v17.4s
addp v3.4s, v5.4s, v6.4s
mul v18.4s, v0.4s, v18.4s
mul v19.4s, v0.4s, v19.4s
addp v4.4s, v7.4s, v16.4s
mul v5.4s, v0.4s, v20.4s
mul v6.4s, v0.4s, v22.4s
mul v7.4s, v0.4s, v24.4s
mul v0.4s, v0.4s, v28.4s
rshrn v2.4h, v2.4s, #4
addp v1.4s, v1.4s, v17.4s
addp v3.4s, v3.4s, v4.4s
ldr q17, [sp, #0xcb0]
addp v16.4s, v18.4s, v19.4s
ldr q18, [sp, #0xcc0]
mul v19.4s, v21.4s, v20.4s
addp v4.4s, v5.4s, v6.4s
mul v20.4s, v21.4s, v22.4s
mul v22.4s, v21.4s, v24.4s
addp v0.4s, v7.4s, v0.4s
mul v5.4s, v21.4s, v28.4s
addp v6.4s, v17.4s, v18.4s
addp v1.4s, v1.4s, v16.4s
str d2, [sp, #0xac0]
ldr q21, [x11, #0xb70]
rshrn v2.4h, v3.4s, #4
ldr q3, [sp, #0xbb0]
adrp x11, #0x458000
addp v0.4s, v4.4s, v0.4s
ldr q4, [sp, #0xbc0]
addp v7.4s, v19.4s, v20.4s
rshrn v1.4h, v1.4s, #4
mul v16.4s, v3.4s, v21.4s
shl v6.4s, v6.4s, #6
mul v19.4s, v4.4s, v21.4s
addp v5.4s, v22.4s, v5.4s
ldr q22, [x11, #0xb80]
rshrn v0.4h, v0.4s, #4
str d2, [sp, #0xac8]
adrp x11, #0x458000
rshrn v2.4h, v6.4s, #4
mul v6.4s, v18.4s, v22.4s
ldr q23, [x11, #0xb90]
str d1, [sp, #0xad0]
addp v1.4s, v7.4s, v5.4s
mul v5.4s, v17.4s, v22.4s
ldr q17, [sp, #0xbe0]
mul v3.4s, v3.4s, v23.4s
mul v4.4s, v4.4s, v23.4s
str d0, [sp, #0xad8]
addp v0.4s, v16.4s, v19.4s
ldr q16, [sp, #0xbd0]
rshrn v1.4h, v1.4s, #4
str d2, [x9]
ldr q2, [sp, #0xcd0]
addp v5.4s, v5.4s, v6.4s
ldr q7, [sp, #0xce0]
mul v6.4s, v16.4s, v21.4s
rshrn v0.4h, v0.4s, #4
mul v18.4s, v17.4s, v21.4s
mul v19.4s, v2.4s, v22.4s
mul v20.4s, v7.4s, v22.4s
mul v16.4s, v16.4s, v23.4s
mul v17.4s, v17.4s, v23.4s
addp v3.4s, v3.4s, v4.4s
str d1, [sp, #0x4d8]
ldr q1, [sp, #0xcf0]
addp v2.4s, v2.4s, v7.4s
stp q22, q21, [sp, #0x10]
mov x9, #-2
str d0, [sp, #0x5a0]
rshrn v0.4h, v5.4s, #4
ldr q5, [sp, #0xd00]
addp v4.4s, v6.4s, v18.4s
ldr q6, [sp, #0xbf0]
ldr q18, [sp, #0xc00]
addp v7.4s, v19.4s, v20.4s
addp v16.4s, v16.4s, v17.4s
shl v2.4s, v2.4s, #6
mul v17.4s, v6.4s, v21.4s
mul v19.4s, v18.4s, v21.4s
mul v6.4s, v6.4s, v23.4s
str d0, [sp, #0x7a0]
rshrn v0.4h, v3.4s, #4
addp v3.4s, v1.4s, v5.4s
mul v1.4s, v1.4s, v22.4s
mul v5.4s, v5.4s, v22.4s
rshrn v4.4h, v4.4s, #4
rshrn v7.4h, v7.4s, #4
rshrn v16.4h, v16.4s, #4
ldr q20, [sp, #0xc80]
shl v3.4s, v3.4s, #6
add x11, sp, #0x3a0
str q23, [sp]
str d0, [sp, #0x9a0]
rshrn v0.4h, v2.4s, #4
addp v2.4s, v17.4s, v19.4s
addp v1.4s, v1.4s, v5.4s
str d4, [sp, #0x5a8]
ldr q4, [sp, #0xc10]
rshrn v3.4h, v3.4s, #4
str d7, [sp, #0x7a8]
ldr q5, [sp, #0xc20]
rshrn v2.4h, v2.4s, #4
mul v7.4s, v18.4s, v23.4s
str d16, [sp, #0x9a8]
str d0, [sp, #0x3a8]
rshrn v0.4h, v1.4s, #4
ldr q1, [sp, #0xd10]
mul v16.4s, v4.4s, v21.4s
mul v17.4s, v5.4s, v21.4s
ldr q18, [sp, #0xc40]
str d3, [sp, #0x3b0]
ldr q3, [sp, #0xd20]
str d2, [sp, #0x5b0]
addp v2.4s, v6.4s, v7.4s
mul v6.4s, v1.4s, v22.4s
mul v7.4s, v3.4s, v22.4s
str d0, [sp, #0x7b0]
addp v0.4s, v1.4s, v3.4s
addp v1.4s, v16.4s, v17.4s
mul v3.4s, v4.4s, v23.4s
mul v4.4s, v5.4s, v23.4s
ldr q5, [sp, #0xd30]
ldr q16, [sp, #0xd40]
rshrn v2.4h, v2.4s, #4
ldr q17, [sp, #0xc30]
mul v19.4s, v18.4s, v21.4s
shl v0.4s, v0.4s, #6
addp v6.4s, v6.4s, v7.4s
addp v7.4s, v5.4s, v16.4s
rshrn v1.4h, v1.4s, #4
addp v3.4s, v3.4s, v4.4s
mul v4.4s, v17.4s, v21.4s
mul v5.4s, v5.4s, v22.4s
str d2, [sp, #0x9b0]
rshrn v0.4h, v0.4s, #4
rshrn v2.4h, v6.4s, #4
shl v6.4s, v7.4s, #6
mul v7.4s, v16.4s, v22.4s
str d1, [sp, #0x5b8]
rshrn v1.4h, v3.4s, #4
mul v16.4s, v18.4s, v23.4s
addp v3.4s, v4.4s, v19.4s
mul v4.4s, v17.4s, v23.4s
ldr q17, [sp, #0xd60]
str d0, [sp, #0x3b8]
addp v5.4s, v5.4s, v7.4s
str d2, [sp, #0x7b8]
rshrn v2.4h, v6.4s, #4
ldr q6, [sp, #0xd50]
str d1, [sp, #0x9b8]
rshrn v1.4h, v3.4s, #4
addp v3.4s, v4.4s, v16.4s
ldr q7, [sp, #0xd70]
ldr q16, [sp, #0xd80]
addp v4.4s, v6.4s, v17.4s
rshrn v0.4h, v5.4s, #4
ldr q5, [sp, #0xc60]
str d2, [sp, #0x3c0]
ldr q2, [sp, #0xc50]
addp v19.4s, v7.4s, v16.4s
str d1, [sp, #0x5c0]
rshrn v1.4h, v3.4s, #4
mul v18.4s, v5.4s, v21.4s
shl v3.4s, v4.4s, #6
mul v4.4s, v2.4s, v21.4s
mul v2.4s, v2.4s, v23.4s
str d0, [sp, #0x7c0]
mul v0.4s, v6.4s, v22.4s
mul v6.4s, v17.4s, v22.4s
ldr q17, [sp, #0xc70]
mul v5.4s, v5.4s, v23.4s
mul v7.4s, v7.4s, v22.4s
rshrn v3.4h, v3.4s, #4
str d1, [sp, #0x9c0]
mul v16.4s, v16.4s, v22.4s
addp v1.4s, v4.4s, v18.4s
mul v4.4s, v17.4s, v21.4s
shl v19.4s, v19.4s, #6
addp v0.4s, v0.4s, v6.4s
mul v6.4s, v20.4s, v21.4s
mul v17.4s, v17.4s, v23.4s
addp v2.4s, v2.4s, v5.4s
ldr q5, [sp, #0xca0]
str d3, [sp, #0x3c8]
ldr q3, [sp, #0xc90]
rshrn v18.4h, v19.4s, #4
mul v19.4s, v20.4s, v23.4s
rshrn v1.4h, v1.4s, #4
rshrn v0.4h, v0.4s, #4
addp v4.4s, v4.4s, v6.4s
addp v6.4s, v7.4s, v16.4s
mul v7.4s, v3.4s, v21.4s
mul v16.4s, v5.4s, v21.4s
ldp q20, q21, [sp, #0x1b0]
rshrn v2.4h, v2.4s, #4
mul v3.4s, v3.4s, v23.4s
mul v5.4s, v5.4s, v23.4s
str d1, [sp, #0x5c8]
rshrn v1.4h, v4.4s, #4
addp v17.4s, v17.4s, v19.4s
mul v20.4s, v20.4s, v22.4s
mul v21.4s, v21.4s, v22.4s
str d0, [sp, #0x7c8]
addp v0.4s, v7.4s, v16.4s
rshrn v4.4h, v6.4s, #4
str d18, [sp, #0x3d0]
str d2, [sp, #0x9c8]
addp v3.4s, v3.4s, v5.4s
rshrn v6.4h, v17.4s, #4
str d1, [sp, #0x5d0]
addp v2.4s, v20.4s, v21.4s
rshrn v0.4h, v0.4s, #4
str d4, [sp, #0x7d0]
str d6, [sp, #0x9d0]
rshrn v1.4h, v2.4s, #4
rshrn v2.4h, v3.4s, #4
ldr d3, [sp, #0x1d0]
str d0, [sp, #0x5d8]
str d3, [sp, #0x3d8]
str d1, [sp, #0x7d8]
str d2, [sp, #0x9d8]
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
mov x0, x11
add x9, x9, #2
add x11, x11, #0x80
ld1 {v4.8h, v5.8h, v6.8h, v7.8h}, [x0], #64
ld1 {v0.8h, v1.8h, v2.8h, v3.8h}, [x0]
add x0, x14, x13
cmp x9, #0x1e
rev64 v16.8h, v6.8h
rev64 v17.8h, v7.8h
rev64 v18.8h, v2.8h
rev64 v19.8h, v3.8h
ext v20.16b, v16.16b, v16.16b, #8
ext v21.16b, v17.16b, v17.16b, #8
ext v18.16b, v18.16b, v18.16b, #8
ext v19.16b, v19.16b, v19.16b, #8
saddl2 v22.4s, v20.8h, v5.8h
saddl2 v16.4s, v21.8h, v4.8h
saddl2 v23.4s, v18.8h, v1.8h
saddl2 v17.4s, v19.8h, v0.8h
saddl v26.4s, v21.4h, v4.4h
saddl v27.4s, v20.4h, v5.4h
saddl v28.4s, v19.4h, v0.4h
saddl v29.4s, v18.4h, v1.4h
sub v21.8h, v4.8h, v21.8h
rev64 v22.4s, v22.4s
rev64 v23.4s, v23.4s
rev64 v24.4s, v16.4s
rev64 v25.4s, v17.4s
rev64 v30.4s, v27.4s
sub v4.8h, v5.8h, v20.8h
sub v7.8h, v0.8h, v19.8h
sub v0.8h, v1.8h, v18.8h
ext v22.16b, v22.16b, v22.16b, #8
ext v23.16b, v23.16b, v23.16b, #8
ext v24.16b, v24.16b, v24.16b, #8
ext v25.16b, v25.16b, v25.16b, #8
ext v19.16b, v30.16b, v30.16b, #8
stp q21, q4, [x0, #-0x20]
stp q7, q0, [x0]
add x0, x15, x13
add x13, x13, #0x40
add v31.4s, v26.4s, v22.4s
add v24.4s, v24.4s, v27.4s
add v27.4s, v28.4s, v23.4s
add v25.4s, v25.4s, v29.4s
rev64 v29.4s, v29.4s
sub v3.4s, v26.4s, v22.4s
sub v0.4s, v16.4s, v19.4s
sub v4.4s, v28.4s, v23.4s
add v5.4s, v31.4s, v24.4s
add v6.4s, v27.4s, v25.4s
ext v1.16b, v29.16b, v29.16b, #8
stp q3, q0, [x0, #-0x20]
sub v0.4s, v31.4s, v24.4s
sub v3.4s, v27.4s, v25.4s
zip2 v2.2d, v5.2d, v6.2d
mov v5.d[1], v6.d[0]
sub v1.4s, v17.4s, v1.4s
rev64 v2.4s, v2.4s
stp q4, q1, [x0]
add x0, x16, x12
add x12, x12, #0x20
stp q0, q3, [x0, #-0x10]
add v1.4s, v2.4s, v5.4s
sub v0.4s, v5.4s, v2.4s
str q1, [x17, x10]
str q0, [x18, x10]
add x10, x10, #0x10
ldr q0, [sp, #0x13b0]
sub x9, x29, #0x40
add x10, x1, #0x78
mov x11, #-1
str z0, [x9, #-8, mul vl]
ldr q0, [sp, #0x13c0]
str z0, [x9, #-9, mul vl]
ldr q0, [sp, #0x13d0]
str z0, [x9, #-0xa, mul vl]
ldr q0, [sp, #0x13e0]
str z0, [x9, #-0xb, mul vl]
ldr q0, [sp, #0x13f0]
str z0, [x9, #-0xc, mul vl]
ldr q0, [sp, #0x1400]
str z0, [x9, #-0xd, mul vl]
ldr q0, [sp, #0x1410]
str z0, [x9, #-0xe, mul vl]
ldr q0, [sp, #0x1420]
str z0, [x9, #-0xf, mul vl]
ldr q0, [sp, #0x1430]
str z0, [x9, #-0x10, mul vl]
ldr q0, [sp, #0x1440]
str z0, [x9, #-0x11, mul vl]
ldr q0, [sp, #0x1450]
str z0, [x9, #-0x12, mul vl]
ldr q0, [sp, #0x1460]
str z0, [x9, #-0x13, mul vl]
ldr q0, [sp, #0x1470]
str z0, [x9, #-0x14, mul vl]
ldr q0, [sp, #0x1480]
str z0, [x9, #-0x15, mul vl]
ldr q0, [sp, #0x1490]
str z0, [x9, #-0x16, mul vl]
ldr q0, [sp, #0x14a0]
str z0, [x9, #-0x17, mul vl]
ldr q0, [sp, #0x14b0]
str z0, [x9, #-0x18, mul vl]
ldr q0, [sp, #0x14c0]
str z0, [x9, #-0x19, mul vl]
ldr q0, [sp, #0x14d0]
str z0, [x9, #-0x1a, mul vl]
ldr q0, [sp, #0x14e0]
str z0, [x9, #-0x1b, mul vl]
ldr q0, [sp, #0x14f0]
str z0, [x9, #-0x1c, mul vl]
ldr q0, [sp, #0x1500]
str z0, [x9, #-0x1d, mul vl]
ldr q0, [sp, #0x1510]
str z0, [x9, #-0x1e, mul vl]
ldr q0, [sp, #0x1520]
str z0, [x9, #-0x1f, mul vl]
ldr q0, [sp, #0x1530]
str z0, [x9, #-0x20, mul vl]
ldr q0, [sp, #0x1540]
str z0, [x9, #-0x21, mul vl]
ldr q0, [sp, #0x1550]
str z0, [x9, #-0x22, mul vl]
ldr q0, [sp, #0x1560]
str z0, [x9, #-0x23, mul vl]
ldr q0, [sp, #0x1570]
str z0, [x9, #-0x24, mul vl]
ldr q0, [sp, #0x1580]
str z0, [x9, #-0x25, mul vl]
ldr q0, [sp, #0x1590]
str z0, [x9, #-0x26, mul vl]
ldr q0, [sp, #0x15a0]
str z0, [x9, #-0x27, mul vl]
ldr q0, [sp, #0x15b0]
str z0, [x9, #-0x28, mul vl]
ldr q0, [sp, #0x15c0]
str z0, [x9, #-0x29, mul vl]
ldr q0, [sp, #0x15d0]
str z0, [x9, #-0x2a, mul vl]
ldr q0, [sp, #0x15e0]
str z0, [x9, #-0x2b, mul vl]
ldr q0, [sp, #0x15f0]
str z0, [x9, #-0x2c, mul vl]
ldr q0, [sp, #0x1600]
str z0, [x9, #-0x2d, mul vl]
ldr q0, [sp, #0x1610]
str z0, [x9, #-0x2e, mul vl]
ldr q0, [sp, #0x1620]
str z0, [x9, #-0x2f, mul vl]
ldr q0, [sp, #0x1630]
str z0, [x9, #-0x30, mul vl]
ldr q0, [sp, #0x1640]
str z0, [x9, #-0x31, mul vl]
ldr q0, [sp, #0x1650]
str z0, [x9, #-0x32, mul vl]
ldr q0, [sp, #0x1660]
str z0, [x9, #-0x33, mul vl]
ldr q0, [sp, #0x1670]
str z0, [x9, #-0x34, mul vl]
ldr q0, [sp, #0x1680]
str z0, [x9, #-0x35, mul vl]
ldr q0, [sp, #0x1690]
str z0, [x9, #-0x36, mul vl]
ldr q0, [sp, #0x16a0]
str z0, [x9, #-0x37, mul vl]
ldr q0, [sp, #0x16b0]
str z0, [x9, #-0x38, mul vl]
ldr q0, [sp, #0x16c0]
str z0, [x9, #-0x39, mul vl]
ldr q0, [sp, #0x16d0]
str z0, [x9, #-0x3a, mul vl]
ldr q0, [sp, #0x16e0]
str z0, [x9, #-0x3b, mul vl]
ldr q0, [sp, #0x16f0]
str z0, [x9, #-0x3c, mul vl]
ldr q0, [sp, #0x1700]
str z0, [x9, #-0x3d, mul vl]
ldr q0, [sp, #0x1710]
str z0, [x9, #-0x3e, mul vl]
ldr q0, [sp, #0x1720]
str z0, [x9, #-0x3f, mul vl]
ldr q0, [sp, #0x1730]
str z0, [x9, #-0x40, mul vl]
ldr q0, [sp, #0x1740]
str z0, [x9, #-0x41, mul vl]
ldr q0, [sp, #0x1750]
str z0, [x9, #-0x42, mul vl]
ldr q0, [sp, #0x1760]
str z0, [x9, #-0x43, mul vl]
ldr q0, [sp, #0x1770]
str z0, [x9, #-0x44, mul vl]
ldr q0, [sp, #0x1780]
str z0, [x9, #-0x45, mul vl]
ldr q0, [sp, #0x1790]
str z0, [x9, #-0x46, mul vl]
ldr q0, [sp, #0x17a0]
str z0, [x9, #-0x47, mul vl]
add x9, x8, #0x50
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
movi v1.2d, #0000000000000000
sub x12, x29, #0x40
movi v2.2d, #0000000000000000
ldp q21, q3, [x9, #-0x10]
ldr z0, [x12, #-8, mul vl]
movi v4.2d, #0000000000000000
movi v7.2d, #0000000000000000
movi v5.2d, #0000000000000000
movi v17.2d, #0000000000000000
movi v6.2d, #0000000000000000
movi v18.2d, #0000000000000000
sdot z1.d, z21.h, z0.h
ldr z0, [x12, #-0xa, mul vl]
movi v16.2d, #0000000000000000
movi v19.2d, #0000000000000000
movi v20.2d, #0000000000000000
movi v22.2d, #0000000000000000
movi v23.2d, #0000000000000000
movi v13.2d, #0000000000000000
add x11, x11, #2
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0xc, mul vl]
movi v30.2d, #0000000000000000
movi v14.2d, #0000000000000000
movi v31.2d, #0000000000000000
movi v15.2d, #0000000000000000
movi v8.2d, #0000000000000000
movi v28.2d, #0000000000000000
cmp x11, #0x1e
sdot z4.d, z21.h, z0.h
ldr z0, [x12, #-0xe, mul vl]
movi v9.2d, #0000000000000000
str z2, [x12, #-1, mul vl]
movi v2.2d, #0000000000000000
movi v27.2d, #0000000000000000
movi v10.2d, #0000000000000000
movi v26.2d, #0000000000000000
movi v11.2d, #0000000000000000
sdot z7.d, z21.h, z0.h
ldr z0, [x12, #-0x10, mul vl]
movi v25.2d, #0000000000000000
movi v12.2d, #0000000000000000
movi v24.2d, #0000000000000000
add x9, x9, #0x80
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x12, mul vl]
sdot z17.d, z21.h, z0.h
ldr z0, [x12, #-0x14, mul vl]
str z5, [x12, #-2, mul vl]
movi v5.2d, #0000000000000000
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x16, mul vl]
sdot z18.d, z21.h, z0.h
ldr z0, [x12, #-0x18, mul vl]
str z6, [x12, #-3, mul vl]
movi v6.2d, #0000000000000000
sdot z16.d, z21.h, z0.h
ldr z0, [x12, #-0x1a, mul vl]
sdot z19.d, z21.h, z0.h
ldr z0, [x12, #-0x1c, mul vl]
str z16, [x12, #-4, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x1e, mul vl]
sdot z20.d, z21.h, z0.h
ldr z0, [x12, #-0x20, mul vl]
mov z16.d, z2.d
movi v2.2d, #0000000000000000
sdot z5.d, z21.h, z0.h
ldr z0, [x12, #-0x22, mul vl]
sdot z22.d, z21.h, z0.h
ldr z0, [x12, #-0x24, mul vl]
mov z29.d, z5.d
ldr z5, [x12, #-4, mul vl]
sdot z6.d, z21.h, z0.h
ldr z0, [x12, #-0x26, mul vl]
sdot z23.d, z21.h, z0.h
ldr z0, [x12, #-0x28, mul vl]
str z6, [x12, #-5, mul vl]
ldr z6, [x12, #-0x38, mul vl]
sdot z2.d, z21.h, z0.h
ldr z0, [x12, #-0x2a, mul vl]
sdot z13.d, z21.h, z6.h
ldr z6, [x12, #-0x3a, mul vl]
str z23, [x12, #-6, mul vl]
mov z23.d, z29.d
sdot z30.d, z21.h, z0.h
ldr z0, [x12, #-0x2c, mul vl]
sdot z14.d, z21.h, z6.h
ldr z6, [x12, #-0x3c, mul vl]
str z2, [x12, #-7, mul vl]
ldr z2, [x12, #-2, mul vl]
sdot z31.d, z21.h, z0.h
ldr z0, [x12, #-0x2e, mul vl]
sdot z15.d, z21.h, z6.h
ldr z6, [x12, #-0x3e, mul vl]
sdot z8.d, z21.h, z0.h
ldr z0, [x12, #-0x30, mul vl]
sdot z28.d, z21.h, z6.h
ldr z6, [x12, #-0x40, mul vl]
sdot z9.d, z21.h, z0.h
ldr z0, [x12, #-0x32, mul vl]
sdot z27.d, z21.h, z6.h
ldr z6, [x12, #-0x42, mul vl]
sdot z10.d, z21.h, z0.h
ldr z0, [x12, #-0x34, mul vl]
sdot z26.d, z21.h, z6.h
ldr z6, [x12, #-0x44, mul vl]
sdot z11.d, z21.h, z0.h
ldr z0, [x12, #-0x36, mul vl]
sdot z25.d, z21.h, z6.h
ldr z6, [x12, #-0x46, mul vl]
sdot z12.d, z21.h, z0.h
ldr z0, [x12, #-1, mul vl]
sdot z24.d, z21.h, z6.h
ldr z21, [x12, #-9, mul vl]
mov z6.d, z1.d
mov z1.d, z4.d
ldr z4, [x12, #-3, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0xb, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0xd, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0xf, mul vl]
uzp1 v29.4s, v6.4s, v0.4s
ldr z6, [x12, #-5, mul vl]
ldr z0, [x12, #-6, mul vl]
sdot z7.d, z3.h, z21.h
ldr z21, [x12, #-0x11, mul vl]
sdot z2.d, z3.h, z21.h
ldr z21, [x12, #-0x13, mul vl]
uzp1 v7.4s, v1.4s, v7.4s
ldr z1, [x12, #-7, mul vl]
sdot z17.d, z3.h, z21.h
ldr z21, [x12, #-0x15, mul vl]
sdot z4.d, z3.h, z21.h
ldr z21, [x12, #-0x17, mul vl]
uzp1 v2.4s, v2.4s, v17.4s
ldr z17, [x12, #-0x2d, mul vl]
sdot z18.d, z3.h, z21.h
ldr z21, [x12, #-0x19, mul vl]
sdot z31.d, z3.h, z17.h
ldr z17, [x12, #-0x2f, mul vl]
sdot z5.d, z3.h, z21.h
ldr z21, [x12, #-0x1b, mul vl]
sdot z8.d, z3.h, z17.h
uzp1 v17.4s, v4.4s, v18.4s
ldr z18, [x12, #-0x31, mul vl]
sdot z19.d, z3.h, z21.h
ldr z21, [x12, #-0x1d, mul vl]
sdot z9.d, z3.h, z18.h
ldr z18, [x12, #-0x33, mul vl]
sdot z16.d, z3.h, z21.h
ldr z21, [x12, #-0x1f, mul vl]
sdot z10.d, z3.h, z18.h
uzp1 v18.4s, v5.4s, v19.4s
ldr z19, [x12, #-0x35, mul vl]
sdot z20.d, z3.h, z21.h
ldr z21, [x12, #-0x21, mul vl]
sdot z11.d, z3.h, z19.h
ldr z19, [x12, #-0x37, mul vl]
sdot z23.d, z3.h, z21.h
ldr z21, [x12, #-0x23, mul vl]
sdot z12.d, z3.h, z19.h
uzp1 v19.4s, v16.4s, v20.4s
ldr z20, [x12, #-0x39, mul vl]
sdot z22.d, z3.h, z21.h
ldr z21, [x12, #-0x25, mul vl]
sdot z13.d, z3.h, z20.h
ldr z20, [x12, #-0x3b, mul vl]
sdot z6.d, z3.h, z21.h
ldr z21, [x12, #-0x27, mul vl]
sdot z14.d, z3.h, z20.h
uzp1 v20.4s, v23.4s, v22.4s
ldr z22, [x12, #-0x41, mul vl]
sdot z0.d, z3.h, z21.h
ldr z21, [x12, #-0x29, mul vl]
sdot z27.d, z3.h, z22.h
ldr z22, [x12, #-0x43, mul vl]
sdot z1.d, z3.h, z21.h
ldr z21, [x12, #-0x2b, mul vl]
sdot z26.d, z3.h, z22.h
sdot z30.d, z3.h, z21.h
ldr z21, [x12, #-0x3d, mul vl]
uzp1 v23.4s, v27.4s, v26.4s
sdot z15.d, z3.h, z21.h
ldr z21, [x12, #-0x3f, mul vl]
sdot z28.d, z3.h, z21.h
uzp1 v21.4s, v6.4s, v0.4s
addp v6.4s, v29.4s, v7.4s
ldr z7, [x12, #-0x45, mul vl]
sdot z25.d, z3.h, z7.h
ldr z7, [x12, #-0x47, mul vl]
addp v20.4s, v20.4s, v21.4s
uzp1 v21.4s, v13.4s, v14.4s
uzp1 v22.4s, v15.4s, v28.4s
sdot z24.d, z3.h, z7.h
addp v3.4s, v2.4s, v17.4s
uzp1 v7.4s, v1.4s, v30.4s
uzp1 v2.4s, v31.4s, v8.4s
addp v17.4s, v18.4s, v19.4s
uzp1 v18.4s, v9.4s, v10.4s
uzp1 v19.4s, v11.4s, v12.4s
rshrn v1.4h, v6.4s, #0xb
addp v5.4s, v21.4s, v22.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v16.4h, v20.4s, #0xb
uzp1 v0.4s, v25.4s, v24.4s
addp v4.4s, v7.4s, v2.4s
rshrn v7.4h, v17.4s, #0xb
addp v6.4s, v18.4s, v19.4s
stp d1, d3, [x10, #-0x38]
rshrn v3.4h, v5.4s, #0xb
addp v0.4s, v23.4s, v0.4s
rshrn v1.4h, v4.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
stp d7, d16, [x10, #-0x28]
rshrn v0.4h, v0.4s, #0xb
stp d1, d2, [x10, #-0x18]
stp d3, d0, [x10, #-8]
add x10, x10, #0x80
ldr q1, [sp, #0xfb0]
ldr q0, [sp, #0xfc0]
add x9, x8, #0x88
ldr q31, [sp, #0x1320]
ldr q8, [sp, #0x1330]
add x10, x1, #0xb8
stp q0, q1, [sp, #0x380]
ldr q1, [sp, #0xfd0]
mov x11, #-2
ldr q0, [sp, #0xfe0]
ldr q9, [sp, #0x1340]
mov x12, #-4
ldr q10, [sp, #0x1350]
ldr q11, [sp, #0x1360]
ldr q12, [sp, #0x1370]
stp q0, q1, [sp, #0x360]
ldr q1, [sp, #0xff0]
ldr q0, [sp, #0x1000]
ldr q13, [sp, #0x1380]
ldr q14, [sp, #0x1390]
ldr q15, [sp, #0x13a0]
stp q0, q1, [sp, #0x340]
ldr q1, [sp, #0x1010]
ldr q0, [sp, #0x1020]
stp q0, q1, [sp, #0x320]
ldr q1, [sp, #0x1030]
ldr q0, [sp, #0x1040]
stp q0, q1, [sp, #0x300]
ldr q1, [sp, #0x1050]
ldr q0, [sp, #0x1060]
stp q0, q1, [sp, #0x2e0]
ldr q1, [sp, #0x1070]
ldr q0, [sp, #0x1080]
stp q0, q1, [sp, #0x2c0]
ldr q1, [sp, #0x1090]
ldr q0, [sp, #0x10a0]
stp q0, q1, [sp, #0x2a0]
ldr q1, [sp, #0x10b0]
ldr q0, [sp, #0x10c0]
stp q0, q1, [sp, #0x280]
ldr q1, [sp, #0x10d0]
ldr q0, [sp, #0x10e0]
stp q0, q1, [sp, #0x260]
ldr q1, [sp, #0x10f0]
ldr q0, [sp, #0x1100]
stp q0, q1, [sp, #0x240]
ldr q1, [sp, #0x1110]
ldr q0, [sp, #0x1120]
stp q0, q1, [sp, #0x220]
ldr q1, [sp, #0x1130]
ldr q0, [sp, #0x1140]
stp q0, q1, [sp, #0x200]
ldr q1, [sp, #0x1150]
ldr q0, [sp, #0x1160]
stp q0, q1, [sp, #0x1e0]
ldr q1, [sp, #0x1170]
ldr q0, [sp, #0x1180]
stp q0, q1, [sp, #0x1c0]
ldr q1, [sp, #0x1190]
ldr q0, [sp, #0x11a0]
stp q0, q1, [sp, #0x1a0]
ldr q1, [sp, #0x11b0]
ldr q0, [sp, #0x11c0]
stp q0, q1, [sp, #0x180]
ldr q1, [sp, #0x11d0]
ldr q0, [sp, #0x11e0]
stp q0, q1, [sp, #0x160]
ldr q1, [sp, #0x11f0]
ldr q0, [sp, #0x1200]
stp q0, q1, [sp, #0x140]
ldr q1, [sp, #0x1210]
ldr q0, [sp, #0x1220]
stp q0, q1, [sp, #0x120]
ldr q1, [sp, #0x1230]
ldr q0, [sp, #0x1240]
stp q0, q1, [sp, #0x100]
ldr q1, [sp, #0x1250]
ldr q0, [sp, #0x1260]
stp q0, q1, [sp, #0xe0]
ldr q1, [sp, #0x1270]
ldr q0, [sp, #0x1280]
stp q0, q1, [sp, #0xc0]
ldr q1, [sp, #0x1290]
ldr q0, [sp, #0x12a0]
stp q0, q1, [sp, #0xa0]
ldr q1, [sp, #0x12b0]
ldr q0, [sp, #0x12c0]
stp q0, q1, [sp, #0x80]
ldr q1, [sp, #0x12d0]
ldr q0, [sp, #0x12e0]
stp q0, q1, [sp, #0x60]
ldr q1, [sp, #0x12f0]
ldr q0, [sp, #0x1300]
stp q0, q1, [sp, #0x40]
ldr q0, [sp, #0x1310]
str q0, [sp, #0x30]
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
ld1sh {z0.s}, p0/z, [x9, x12, lsl #1]
ldp q7, q1, [sp, #0x380]
ldp q19, q28, [sp, #0x270]
add x11, x11, #4
ldp q24, q2, [sp, #0x300]
ldr q20, [sp, #0x250]
cmp x11, #0x1c
mul v5.4s, v0.4s, v1.4s
ldr q1, [sp, #0x370]
mul v19.4s, v0.4s, v19.4s
mul v2.4s, v0.4s, v2.4s
ldr q3, [sp, #0x2f0]
mul v20.4s, v0.4s, v20.4s
mul v16.4s, v0.4s, v1.4s
ldr q1, [sp, #0x350]
ldr q21, [sp, #0x230]
mul v3.4s, v0.4s, v3.4s
ldr q4, [sp, #0x2d0]
mul v17.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
mul v21.4s, v0.4s, v21.4s
ldr q22, [sp, #0x210]
mul v4.4s, v0.4s, v4.4s
ldr q6, [sp, #0x2b0]
mul v18.4s, v0.4s, v1.4s
ld1sh {z1.s}, p0/z, [x9]
ldr q23, [sp, #0x1f0]
mul v22.4s, v0.4s, v22.4s
mul v6.4s, v0.4s, v6.4s
ldr q25, [sp, #0x170]
mul v23.4s, v0.4s, v23.4s
ldr q26, [sp, #0x150]
ldr q27, [sp, #0x130]
mla v5.4s, v1.4s, v7.4s
ldr q7, [sp, #0x360]
mla v2.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2e0]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
mla v16.4s, v1.4s, v7.4s
ldr q7, [sp, #0x340]
mul v27.4s, v0.4s, v27.4s
mla v3.4s, v1.4s, v24.4s
ldr q24, [sp, #0x2c0]
mul v29.4s, v0.4s, v12.4s
mla v17.4s, v1.4s, v7.4s
ldr q7, [sp, #0x320]
add x9, x9, #0x100
mla v4.4s, v1.4s, v24.4s
mla v18.4s, v1.4s, v7.4s
ldp q7, q24, [sp, #0x290]
addp v5.4s, v5.4s, v16.4s
mla v6.4s, v1.4s, v24.4s
ldr q24, [sp, #0x190]
addp v2.4s, v2.4s, v3.4s
mul v7.4s, v0.4s, v7.4s
mla v29.4s, v1.4s, v13.4s
mul v24.4s, v0.4s, v24.4s
addp v16.4s, v17.4s, v18.4s
ldr q17, [sp, #0x1d0]
ldr q18, [sp, #0x1b0]
addp v3.4s, v4.4s, v6.4s
mla v7.4s, v1.4s, v28.4s
ldr q28, [sp, #0x260]
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v5.4s, v5.4s, v16.4s
mla v19.4s, v1.4s, v28.4s
ldr q28, [sp, #0x240]
mla v20.4s, v1.4s, v28.4s
ldr q28, [sp, #0x220]
rshrn v5.4h, v5.4s, #0xb
mla v21.4s, v1.4s, v28.4s
ldr q28, [sp, #0x200]
addp v4.4s, v7.4s, v19.4s
ldp q30, q19, [sp, #0x100]
mla v22.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1e0]
mla v23.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1c0]
addp v6.4s, v20.4s, v21.4s
mul v19.4s, v0.4s, v19.4s
ldr q20, [sp, #0xf0]
ldr q21, [sp, #0xd0]
mla v17.4s, v1.4s, v28.4s
ldr q28, [sp, #0x1a0]
mul v20.4s, v0.4s, v20.4s
mul v21.4s, v0.4s, v21.4s
mla v18.4s, v1.4s, v28.4s
ldr q28, [sp, #0x180]
addp v7.4s, v22.4s, v23.4s
ldr q22, [sp, #0xb0]
mla v19.4s, v1.4s, v30.4s
ldr q30, [sp, #0xe0]
mla v24.4s, v1.4s, v28.4s
ldr q28, [sp, #0x160]
ldr q23, [sp, #0x90]
mul v22.4s, v0.4s, v22.4s
mla v20.4s, v1.4s, v30.4s
ldr q30, [sp, #0xc0]
mla v25.4s, v1.4s, v28.4s
ldr q28, [sp, #0x140]
addp v16.4s, v17.4s, v18.4s
mul v23.4s, v0.4s, v23.4s
mla v21.4s, v1.4s, v30.4s
ldr q30, [sp, #0xa0]
mla v26.4s, v1.4s, v28.4s
ldr q28, [sp, #0x120]
mla v22.4s, v1.4s, v30.4s
mla v27.4s, v1.4s, v28.4s
addp v17.4s, v24.4s, v25.4s
ldp q24, q30, [sp, #0x70]
mul v28.4s, v0.4s, v10.4s
mla v23.4s, v1.4s, v30.4s
mul v24.4s, v0.4s, v24.4s
ldp q25, q30, [sp, #0x50]
mul v25.4s, v0.4s, v25.4s
addp v18.4s, v26.4s, v27.4s
ldr q26, [sp, #0x30]
mul v27.4s, v0.4s, v8.4s
mla v28.4s, v1.4s, v11.4s
mul v26.4s, v0.4s, v26.4s
mul v0.4s, v0.4s, v14.4s
mla v24.4s, v1.4s, v30.4s
ldr q30, [sp, #0x40]
mla v27.4s, v1.4s, v9.4s
mla v25.4s, v1.4s, v30.4s
mla v26.4s, v1.4s, v31.4s
mla v0.4s, v1.4s, v15.4s
addp v1.4s, v2.4s, v3.4s
addp v2.4s, v4.4s, v6.4s
addp v3.4s, v7.4s, v16.4s
addp v4.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v7.4s, v21.4s, v22.4s
addp v16.4s, v23.4s, v24.4s
addp v18.4s, v27.4s, v28.4s
rshrn v1.4h, v1.4s, #0xb
addp v17.4s, v25.4s, v26.4s
addp v0.4s, v29.4s, v0.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
addp v7.4s, v16.4s, v17.4s
addp v0.4s, v18.4s, v0.4s
stp d5, d1, [x10, #-0x38]
rshrn v1.4h, v6.4s, #0xb
stp d2, d3, [x10, #-0x28]
rshrn v2.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
stp d4, d1, [x10, #-0x18]
stp d2, d0, [x10, #-8]
add x10, x10, #0x100
mov x9, #0x80
ldr q2, [sp, #0xdc0]
ldr q6, [sp, #0xdd0]
ld1sh {z0.s}, p0/z, [x8, x9, lsl #1]
ldr q8, [sp, #0xdb0]
mov x9, #0x180
stp q6, q2, [sp, #0x230]
ldr q7, [sp, #0xde0]
ldr q22, [sp, #0xe00]
ldr q3, [sp, #0xe70]
ldr q4, [sp, #0xe80]
ldr q5, [sp, #0xe90]
mul v18.4s, v0.4s, v6.4s
mul v16.4s, v0.4s, v8.4s
mul v17.4s, v0.4s, v2.4s
ldr q6, [sp, #0xdf0]
mul v19.4s, v0.4s, v7.4s
ldr q21, [sp, #0xea0]
ldr q1, [sp, #0xeb0]
ldr q2, [sp, #0xec0]
mul v26.4s, v0.4s, v22.4s
stp q6, q7, [sp, #0x210]
ldr q7, [sp, #0xed0]
mul v25.4s, v0.4s, v6.4s
ldr q20, [sp, #0xee0]
ldr q11, [sp, #0xe10]
addp v16.4s, v16.4s, v17.4s
stp q7, q22, [sp, #0x1f0]
ldr q10, [sp, #0xe20]
addp v17.4s, v18.4s, v19.4s
ldr q6, [sp, #0xe30]
ldr q22, [sp, #0xe40]
mul v18.4s, v0.4s, v11.4s
stp q5, q2, [sp, #0x1b0]
mul v19.4s, v0.4s, v10.4s
mul v14.4s, v0.4s, v3.4s
stp q1, q20, [sp, #0x1d0]
mul v27.4s, v0.4s, v6.4s
mul v28.4s, v0.4s, v22.4s
str q8, [sp, #0x1a0]
mul v15.4s, v0.4s, v4.4s
ldr q23, [sp, #0xe50]
stp q4, q3, [sp, #0x2f0]
mul v4.4s, v0.4s, v1.4s
mul v3.4s, v0.4s, v2.4s
stp q22, q6, [sp, #0x2d0]
mul v6.4s, v0.4s, v5.4s
mul v5.4s, v0.4s, v21.4s
mul v2.4s, v0.4s, v7.4s
mul v1.4s, v0.4s, v20.4s
str q21, [sp, #0x310]
ldr q9, [sp, #0xe60]
addp v31.4s, v16.4s, v17.4s
addp v24.4s, v18.4s, v19.4s
addp v29.4s, v27.4s, v28.4s
addp v27.4s, v4.4s, v3.4s
ldr q17, [sp, #0xef0]
addp v22.4s, v6.4s, v5.4s
ldr q18, [sp, #0xf00]
ldr q19, [sp, #0xf10]
addp v20.4s, v2.4s, v1.4s
ldr q21, [sp, #0xf20]
ldr q5, [sp, #0xf30]
ldr q6, [sp, #0xf40]
ldr q7, [sp, #0xf50]
ldr q1, [sp, #0xf60]
ldr q16, [sp, #0xf70]
ldr q2, [sp, #0xf80]
ldr q3, [sp, #0xf90]
ldr q4, [sp, #0xfa0]
mul v12.4s, v0.4s, v23.4s
mul v13.4s, v0.4s, v9.4s
addp v30.4s, v25.4s, v26.4s
stp q21, q19, [sp, #0x250]
mul v26.4s, v0.4s, v17.4s
stp q18, q17, [sp, #0x270]
mul v17.4s, v0.4s, v18.4s
mul v25.4s, v0.4s, v19.4s
stp q10, q11, [sp, #0x290]
mul v21.4s, v0.4s, v21.4s
mul v19.4s, v0.4s, v5.4s
stp q9, q23, [sp, #0x2b0]
mul v18.4s, v0.4s, v7.4s
addp v24.4s, v30.4s, v24.4s
stp q5, q4, [sp, #0x320]
mul v5.4s, v0.4s, v6.4s
addp v23.4s, v12.4s, v13.4s
stp q3, q2, [sp, #0x340]
addp v28.4s, v14.4s, v15.4s
addp v17.4s, v26.4s, v17.4s
stp q16, q1, [sp, #0x360]
addp v20.4s, v27.4s, v20.4s
mov v27.16b, v8.16b
stp q7, q6, [sp, #0x380]
mul v6.4s, v0.4s, v1.4s
mul v7.4s, v0.4s, v16.4s
mul v1.4s, v0.4s, v2.4s
mul v2.4s, v0.4s, v3.4s
mul v0.4s, v0.4s, v4.4s
addp v16.4s, v25.4s, v21.4s
addp v5.4s, v19.4s, v5.4s
addp v23.4s, v29.4s, v23.4s
addp v22.4s, v28.4s, v22.4s
ldr q14, [sp, #0x200]
addp v4.4s, v18.4s, v6.4s
rshrn v6.4h, v31.4s, #0xb
addp v1.4s, v7.4s, v1.4s
addp v0.4s, v2.4s, v0.4s
rshrn v2.4h, v24.4s, #0xb
addp v3.4s, v17.4s, v16.4s
rshrn v7.4h, v23.4s, #0xb
ldr q17, [sp, #0x2c0]
addp v4.4s, v5.4s, v4.4s
rshrn v5.4h, v22.4s, #0xb
ldr q22, [sp, #0x310]
addp v0.4s, v1.4s, v0.4s
rshrn v1.4h, v20.4s, #0xb
stp d6, d2, [x1, #0x100]
rshrn v2.4h, v3.4s, #0xb
rshrn v3.4h, v4.4s, #0xb
ldp q31, q28, [sp, #0x230]
rshrn v0.4h, v0.4s, #0xb
stp d7, d5, [x1, #0x110]
ldp q20, q19, [sp, #0x2f0]
stp d1, d2, [x1, #0x120]
ldp q16, q7, [sp, #0x2d0]
ldp q15, q12, [sp, #0x1b0]
stp d3, d0, [x1, #0x130]
ldp q30, q29, [sp, #0x340]
ld1sh {z0.s}, p0/z, [x8, x9, lsl #1]
mov x9, #0x280
mul v1.4s, v0.4s, v8.4s
ldp q13, q8, [sp, #0x210]
mul v2.4s, v0.4s, v28.4s
mul v3.4s, v0.4s, v31.4s
mul v5.4s, v0.4s, v11.4s
mul v6.4s, v0.4s, v10.4s
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v9.4s
mul v4.4s, v0.4s, v8.4s
mul v19.4s, v0.4s, v19.4s
mul v20.4s, v0.4s, v20.4s
ldp q11, q10, [sp, #0x1d0]
ldr q9, [sp, #0x1f0]
addp v1.4s, v1.4s, v2.4s
mul v7.4s, v0.4s, v7.4s
mul v16.4s, v0.4s, v16.4s
mul v21.4s, v0.4s, v15.4s
mul v22.4s, v0.4s, v22.4s
mul v24.4s, v0.4s, v12.4s
addp v2.4s, v3.4s, v4.4s
mul v3.4s, v0.4s, v13.4s
mul v4.4s, v0.4s, v14.4s
mul v23.4s, v0.4s, v11.4s
mul v25.4s, v0.4s, v9.4s
mul v26.4s, v0.4s, v10.4s
mul v29.4s, v0.4s, v29.4s
mul v30.4s, v0.4s, v30.4s
addp v1.4s, v1.4s, v2.4s
addp v2.4s, v3.4s, v4.4s
addp v3.4s, v5.4s, v6.4s
addp v5.4s, v17.4s, v18.4s
addp v6.4s, v19.4s, v20.4s
addp v4.4s, v7.4s, v16.4s
addp v7.4s, v21.4s, v22.4s
str q1, [sp, #0x190]
ldr q1, [sp, #0x280]
addp v16.4s, v23.4s, v24.4s
addp v17.4s, v25.4s, v26.4s
ldp q24, q23, [sp, #0x380]
mul v18.4s, v0.4s, v1.4s
ldr q1, [sp, #0x270]
addp v2.4s, v2.4s, v3.4s
ldp q26, q25, [sp, #0x360]
addp v3.4s, v4.4s, v5.4s
mul v19.4s, v0.4s, v1.4s
ldr q1, [sp, #0x260]
mul v23.4s, v0.4s, v23.4s
mul v24.4s, v0.4s, v24.4s
addp v4.4s, v6.4s, v7.4s
addp v5.4s, v16.4s, v17.4s
mul v20.4s, v0.4s, v1.4s
ldr q1, [sp, #0x250]
mul v25.4s, v0.4s, v25.4s
mul v26.4s, v0.4s, v26.4s
rshrn v2.4h, v2.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
mul v21.4s, v0.4s, v1.4s
ldp q7, q1, [sp, #0x320]
addp v6.4s, v18.4s, v19.4s
rshrn v4.4h, v4.4s, #0xb
mul v22.4s, v0.4s, v7.4s
addp v17.4s, v24.4s, v25.4s
addp v18.4s, v26.4s, v29.4s
str d2, [x1, #0x308]
mul v0.4s, v0.4s, v1.4s
addp v7.4s, v20.4s, v21.4s
ldr q1, [sp, #0x190]
str d3, [x1, #0x310]
addp v16.4s, v22.4s, v23.4s
rshrn v1.4h, v1.4s, #0xb
str d4, [x1, #0x318]
addp v6.4s, v6.4s, v7.4s
addp v0.4s, v30.4s, v0.4s
addp v7.4s, v16.4s, v17.4s
str d1, [x1, #0x300]
rshrn v1.4h, v5.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
addp v0.4s, v18.4s, v0.4s
ldp q6, q5, [sp, #0x290]
rshrn v3.4h, v7.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
str d1, [x1, #0x320]
str d2, [x1, #0x328]
str d3, [x1, #0x330]
str d0, [x1, #0x338]
ld1sh {z0.s}, p0/z, [x8, x9, lsl #1]
mov x9, #0x380
mul v1.4s, v0.4s, v27.4s
mul v2.4s, v0.4s, v28.4s
mul v3.4s, v0.4s, v31.4s
mul v4.4s, v0.4s, v8.4s
ldp q8, q31, [sp, #0x2d0]
mul v21.4s, v0.4s, v15.4s
ldr q15, [sp, #0x310]
mul v5.4s, v0.4s, v5.4s
mul v6.4s, v0.4s, v6.4s
mul v25.4s, v0.4s, v9.4s
mul v26.4s, v0.4s, v10.4s
addp v1.4s, v1.4s, v2.4s
mul v7.4s, v0.4s, v31.4s
mul v16.4s, v0.4s, v8.4s
addp v2.4s, v3.4s, v4.4s
mul v3.4s, v0.4s, v13.4s
mul v4.4s, v0.4s, v14.4s
ldp q18, q13, [sp, #0x2b0]
mul v22.4s, v0.4s, v15.4s
ldp q28, q14, [sp, #0x2f0]
mul v23.4s, v0.4s, v11.4s
addp v27.4s, v1.4s, v2.4s
ldr q1, [sp, #0x320]
mul v24.4s, v0.4s, v12.4s
mul v17.4s, v0.4s, v13.4s
mul v18.4s, v0.4s, v18.4s
addp v2.4s, v3.4s, v4.4s
addp v3.4s, v5.4s, v6.4s
addp v4.4s, v7.4s, v16.4s
addp v7.4s, v21.4s, v22.4s
mul v22.4s, v0.4s, v1.4s
mul v19.4s, v0.4s, v14.4s
mul v20.4s, v0.4s, v28.4s
addp v16.4s, v23.4s, v24.4s
ldp q10, q9, [sp, #0x270]
addp v5.4s, v17.4s, v18.4s
addp v17.4s, v25.4s, v26.4s
addp v2.4s, v2.4s, v3.4s
ldp q1, q25, [sp, #0x360]
ldp q12, q11, [sp, #0x250]
addp v6.4s, v19.4s, v20.4s
ldp q24, q23, [sp, #0x380]
mul v18.4s, v0.4s, v9.4s
mul v26.4s, v0.4s, v1.4s
ldp q1, q3, [sp, #0x340]
mul v19.4s, v0.4s, v10.4s
mul v20.4s, v0.4s, v11.4s
mul v21.4s, v0.4s, v12.4s
mul v25.4s, v0.4s, v25.4s
mul v29.4s, v0.4s, v3.4s
mul v23.4s, v0.4s, v23.4s
mul v24.4s, v0.4s, v24.4s
addp v3.4s, v4.4s, v5.4s
addp v4.4s, v6.4s, v7.4s
mul v30.4s, v0.4s, v1.4s
ldr q1, [sp, #0x330]
addp v5.4s, v16.4s, v17.4s
addp v6.4s, v18.4s, v19.4s
addp v7.4s, v20.4s, v21.4s
rshrn v2.4h, v2.4s, #0xb
mul v0.4s, v0.4s, v1.4s
addp v16.4s, v22.4s, v23.4s
addp v18.4s, v26.4s, v29.4s
addp v17.4s, v24.4s, v25.4s
rshrn v1.4h, v27.4s, #0xb
rshrn v3.4h, v3.4s, #0xb
addp v6.4s, v6.4s, v7.4s
rshrn v4.4h, v4.4s, #0xb
ldr q21, [sp, #0x340]
str d2, [x1, #0x508]
ldr q24, [sp]
addp v0.4s, v30.4s, v0.4s
addp v7.4s, v16.4s, v17.4s
str d1, [x1, #0x500]
rshrn v1.4h, v5.4s, #0xb
rshrn v2.4h, v6.4s, #0xb
str d3, [x1, #0x510]
ldr q6, [sp, #0x200]
addp v0.4s, v18.4s, v0.4s
rshrn v3.4h, v7.4s, #0xb
str d4, [x1, #0x518]
ldp q5, q4, [sp, #0x210]
str d1, [x1, #0x520]
ldr q1, [sp, #0x1a0]
rshrn v0.4h, v0.4s, #0xb
str d2, [x1, #0x528]
str d3, [x1, #0x530]
ldp q3, q2, [sp, #0x230]
ldp q16, q7, [sp, #0x290]
str d0, [x1, #0x538]
ld1sh {z0.s}, p0/z, [x8, x9, lsl #1]
mul v1.4s, v0.4s, v1.4s
mul v2.4s, v0.4s, v2.4s
mul v3.4s, v0.4s, v3.4s
mul v4.4s, v0.4s, v4.4s
mul v5.4s, v0.4s, v5.4s
mul v6.4s, v0.4s, v6.4s
mul v7.4s, v0.4s, v7.4s
mul v16.4s, v0.4s, v16.4s
mul v17.4s, v0.4s, v28.4s
mul v18.4s, v0.4s, v15.4s
mul v19.4s, v0.4s, v11.4s
mul v20.4s, v0.4s, v12.4s
addp v1.4s, v1.4s, v2.4s
mul v21.4s, v0.4s, v21.4s
addp v2.4s, v3.4s, v4.4s
mul v4.4s, v0.4s, v31.4s
addp v3.4s, v7.4s, v16.4s
ldr q7, [sp, #0x2b0]
mul v16.4s, v0.4s, v14.4s
addp v1.4s, v1.4s, v2.4s
addp v2.4s, v5.4s, v6.4s
mul v5.4s, v0.4s, v8.4s
mul v6.4s, v0.4s, v13.4s
mul v7.4s, v0.4s, v7.4s
addp v2.4s, v2.4s, v3.4s
ldr q3, [sp, #0x1b0]
rshrn v1.4h, v1.4s, #0xb
addp v4.4s, v4.4s, v5.4s
mul v3.4s, v0.4s, v3.4s
addp v5.4s, v6.4s, v7.4s
addp v6.4s, v16.4s, v17.4s
ldp q16, q7, [sp, #0x1c0]
rshrn v2.4h, v2.4s, #0xb
str d1, [x1, #0x700]
addp v1.4s, v4.4s, v5.4s
mul v4.4s, v0.4s, v9.4s
mul v5.4s, v0.4s, v10.4s
addp v3.4s, v3.4s, v18.4s
ldp q18, q17, [sp, #0x1e0]
mul v7.4s, v0.4s, v7.4s
mul v16.4s, v0.4s, v16.4s
str d2, [x1, #0x708]
rshrn v1.4h, v1.4s, #0xb
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
addp v2.4s, v6.4s, v3.4s
addp v4.4s, v4.4s, v5.4s
addp v5.4s, v19.4s, v20.4s
addp v3.4s, v7.4s, v16.4s
ldp q7, q22, [sp, #0x320]
ldp q20, q19, [sp, #0x350]
str d1, [x1, #0x710]
addp v6.4s, v17.4s, v18.4s
ldp q17, q16, [sp, #0x380]
ldr q18, [sp, #0x370]
mul v7.4s, v0.4s, v7.4s
addp v4.4s, v4.4s, v5.4s
mul v19.4s, v0.4s, v19.4s
mul v20.4s, v0.4s, v20.4s
rshrn v2.4h, v2.4s, #0xb
mul v16.4s, v0.4s, v16.4s
mul v17.4s, v0.4s, v17.4s
mul v18.4s, v0.4s, v18.4s
mul v0.4s, v0.4s, v22.4s
addp v1.4s, v3.4s, v6.4s
rshrn v4.4h, v4.4s, #0xb
ldp q23, q22, [sp, #0x10]
addp v5.4s, v19.4s, v20.4s
str d2, [x1, #0x718]
addp v3.4s, v7.4s, v16.4s
addp v6.4s, v17.4s, v18.4s
ldr q17, [sp, #0xcb0]
addp v0.4s, v21.4s, v0.4s
ldr q18, [sp, #0xcc0]
ldr q7, [sp, #0xbb0]
ldr q16, [sp, #0xbc0]
rshrn v1.4h, v1.4s, #0xb
str d4, [x1, #0x728]
addp v3.4s, v3.4s, v6.4s
mul v20.4s, v18.4s, v23.4s
mul v6.4s, v7.4s, v22.4s
addp v0.4s, v5.4s, v0.4s
mul v5.4s, v17.4s, v23.4s
mul v19.4s, v16.4s, v22.4s
mul v4.4s, v7.4s, v24.4s
ldr q7, [sp, #0xbd0]
addp v17.4s, v17.4s, v18.4s
rshrn v2.4h, v3.4s, #0xb
str d1, [x1, #0x720]
rshrn v0.4h, v0.4s, #0xb
addp v3.4s, v5.4s, v20.4s
mul v5.4s, v16.4s, v24.4s
addp v1.4s, v6.4s, v19.4s
ldr q6, [sp, #0xce0]
ldr q16, [sp, #0xbe0]
ldr q19, [sp, #0xd00]
str d2, [x1, #0x730]
ldr q2, [sp, #0xcd0]
rshrn v3.4h, v3.4s, #0xb
rshrn v1.4h, v1.4s, #0xb
str d0, [x1, #0x738]
addp v0.4s, v4.4s, v5.4s
addp v4.4s, v2.4s, v6.4s
mul v5.4s, v7.4s, v22.4s
mul v18.4s, v16.4s, v22.4s
mul v2.4s, v2.4s, v23.4s
mul v7.4s, v7.4s, v24.4s
mul v16.4s, v16.4s, v24.4s
mul v21.4s, v19.4s, v23.4s
str d3, [x1, #0x400]
mul v3.4s, v6.4s, v23.4s
rshrn v0.4h, v0.4s, #0xb
str d1, [x1, #0x200]
shl v1.4s, v17.4s, #6
shl v4.4s, v4.4s, #6
ldr q6, [sp, #0xbf0]
ldr q17, [sp, #0xc00]
addp v5.4s, v5.4s, v18.4s
ldr q18, [sp, #0xcf0]
addp v7.4s, v7.4s, v16.4s
ldr q16, [sp, #0xc20]
rshrn v1.4h, v1.4s, #0xb
rshrn v4.4h, v4.4s, #0xb
addp v2.4s, v2.4s, v3.4s
str d0, [x1, #0x600]
mul v0.4s, v6.4s, v22.4s
mul v3.4s, v17.4s, v22.4s
rshrn v5.4h, v5.4s, #0xb
mul v20.4s, v18.4s, v23.4s
rshrn v2.4h, v2.4s, #0xb
stp d1, d4, [x1]
mul v1.4s, v6.4s, v24.4s
rshrn v4.4h, v7.4s, #0xb
addp v0.4s, v0.4s, v3.4s
mul v3.4s, v17.4s, v24.4s
ldr q7, [sp, #0xc10]
str d5, [x1, #0x208]
addp v5.4s, v20.4s, v21.4s
ldr q6, [sp, #0xd20]
str d2, [x1, #0x408]
ldr q2, [sp, #0xd10]
addp v17.4s, v18.4s, v19.4s
rshrn v0.4h, v0.4s, #0xb
str d4, [x1, #0x608]
mul v4.4s, v7.4s, v22.4s
addp v1.4s, v1.4s, v3.4s
rshrn v5.4h, v5.4s, #0xb
mul v18.4s, v16.4s, v22.4s
addp v3.4s, v2.4s, v6.4s
mul v2.4s, v2.4s, v23.4s
mul v6.4s, v6.4s, v23.4s
mul v7.4s, v7.4s, v24.4s
mul v16.4s, v16.4s, v24.4s
ldr q19, [sp, #0xd30]
rshrn v1.4h, v1.4s, #0xb
str d0, [x1, #0x210]
shl v0.4s, v17.4s, #6
str d5, [x1, #0x410]
ldr q5, [sp, #0xc30]
ldr q17, [sp, #0xc40]
shl v3.4s, v3.4s, #6
addp v4.4s, v4.4s, v18.4s
ldr q20, [sp, #0xd40]
mul v18.4s, v17.4s, v22.4s
addp v2.4s, v2.4s, v6.4s
rshrn v0.4h, v0.4s, #0xb
str d1, [x1, #0x610]
mul v1.4s, v5.4s, v22.4s
addp v6.4s, v7.4s, v16.4s
rshrn v3.4h, v3.4s, #0xb
rshrn v4.4h, v4.4s, #0xb
mul v7.4s, v19.4s, v23.4s
mul v16.4s, v20.4s, v23.4s
mul v5.4s, v5.4s, v24.4s
mul v17.4s, v17.4s, v24.4s
rshrn v2.4h, v2.4s, #0xb
addp v1.4s, v1.4s, v18.4s
stp d0, d3, [x1, #0x10]
rshrn v0.4h, v6.4s, #0xb
ldr q3, [sp, #0xd50]
ldr q6, [sp, #0xd60]
addp v7.4s, v7.4s, v16.4s
str d4, [x1, #0x218]
rshrn v1.4h, v1.4s, #0xb
addp v4.4s, v5.4s, v17.4s
str d2, [x1, #0x418]
addp v2.4s, v19.4s, v20.4s
addp v5.4s, v3.4s, v6.4s
mul v3.4s, v3.4s, v23.4s
str d0, [x1, #0x618]
rshrn v0.4h, v7.4s, #0xb
ldr q7, [sp, #0xc50]
rshrn v4.4h, v4.4s, #0xb
mul v6.4s, v6.4s, v23.4s
ldr q20, [sp, #0xca0]
str d1, [x1, #0x220]
ldr q1, [sp, #0xc60]
shl v2.4s, v2.4s, #6
shl v5.4s, v5.4s, #6
mul v16.4s, v7.4s, v22.4s
mul v21.4s, v20.4s, v22.4s
mul v17.4s, v1.4s, v22.4s
str d0, [x1, #0x420]
mul v1.4s, v1.4s, v24.4s
rshrn v0.4h, v2.4s, #0xb
str d4, [x1, #0x620]
ldr q2, [sp, #0xc70]
ldr q4, [sp, #0xc80]
rshrn v5.4h, v5.4s, #0xb
addp v3.4s, v3.4s, v6.4s
mul v6.4s, v7.4s, v24.4s
ldr q7, [sp, #0xd70]
mul v18.4s, v2.4s, v22.4s
addp v16.4s, v16.4s, v17.4s
ldr q17, [sp, #0xd80]
mul v19.4s, v4.4s, v22.4s
mul v2.4s, v2.4s, v24.4s
mul v4.4s, v4.4s, v24.4s
rshrn v3.4h, v3.4s, #0xb
stp d0, d5, [x1, #0x20]
mul v0.4s, v7.4s, v23.4s
mul v5.4s, v17.4s, v23.4s
addp v1.4s, v6.4s, v1.4s
addp v7.4s, v7.4s, v17.4s
ldr q17, [sp, #0xd90]
addp v6.4s, v18.4s, v19.4s
ldr q18, [sp, #0xda0]
ldr q19, [sp, #0xc90]
addp v2.4s, v2.4s, v4.4s
mul v20.4s, v20.4s, v24.4s
str d3, [x1, #0x428]
addp v0.4s, v0.4s, v5.4s
addp v4.4s, v17.4s, v18.4s
mul v5.4s, v19.4s, v22.4s
mul v17.4s, v17.4s, v23.4s
mul v18.4s, v18.4s, v23.4s
rshrn v1.4h, v1.4s, #0xb
mul v19.4s, v19.4s, v24.4s
shl v7.4s, v7.4s, #6
rshrn v16.4h, v16.4s, #0xb
rshrn v0.4h, v0.4s, #0xb
shl v4.4s, v4.4s, #6
rshrn v6.4h, v6.4s, #0xb
addp v3.4s, v5.4s, v21.4s
rshrn v2.4h, v2.4s, #0xb
str d1, [x1, #0x628]
addp v1.4s, v17.4s, v18.4s
rshrn v7.4h, v7.4s, #0xb
addp v5.4s, v19.4s, v20.4s
rshrn v4.4h, v4.4s, #0xb
str d16, [x1, #0x228]
rshrn v3.4h, v3.4s, #0xb
str d0, [x1, #0x430]
rshrn v0.4h, v1.4s, #0xb
str d6, [x1, #0x230]
rshrn v1.4h, v5.4s, #0xb
str d2, [x1, #0x630]
stp d7, d4, [x1, #0x30]
str d3, [x1, #0x238]
str d0, [x1, #0x438]
str d1, [x1, #0x638]
sub sp, x29, #0x40
ldp x29, x30, [sp, #0x40]
ldp d9, d8, [sp, #0x30]
ldp d11, d10, [sp, #0x20]
ldp d13, d12, [sp, #0x10]
ldp d15, d14, [sp], #0x50
