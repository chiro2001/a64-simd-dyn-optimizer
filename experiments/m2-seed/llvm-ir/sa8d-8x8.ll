; ModuleID = 'experiments/m2-seed/llvm-ir/pixel-prim.ll'
source_filename = "third_party/x265/source/common/aarch64/pixel-prim.cpp"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable
define hidden noundef i32 @_ZN12_GLOBAL__N_110sa8d8_neonILi8ELi8EEEiPKhlS2_l(ptr nocapture noundef readonly %pix1, i64 noundef %i_pix1, ptr nocapture noundef readonly %pix2, i64 noundef %i_pix2) #0 {
entry:
  %mul3.i.i = shl nsw i64 %i_pix1, 2
  %mul5.i.i = shl nsw i64 %i_pix2, 2
  %0 = load <8 x i8>, ptr %pix1, align 1
  %add.ptr.i.i.i.i = getelementptr inbounds i8, ptr %pix1, i64 %i_pix1
  %1 = load <8 x i8>, ptr %add.ptr.i.i.i.i, align 1
  %add.ptr.1.i.i.i.i = getelementptr inbounds i8, ptr %add.ptr.i.i.i.i, i64 %i_pix1
  %2 = load <8 x i8>, ptr %add.ptr.1.i.i.i.i, align 1
  %add.ptr.2.i.i.i.i = getelementptr inbounds i8, ptr %add.ptr.1.i.i.i.i, i64 %i_pix1
  %3 = load <8 x i8>, ptr %add.ptr.2.i.i.i.i, align 1
  %4 = load <8 x i8>, ptr %pix2, align 1
  %add.ptr.i32.i.i.i = getelementptr inbounds i8, ptr %pix2, i64 %i_pix2
  %5 = load <8 x i8>, ptr %add.ptr.i32.i.i.i, align 1
  %add.ptr.1.i34.i.i.i = getelementptr inbounds i8, ptr %add.ptr.i32.i.i.i, i64 %i_pix2
  %6 = load <8 x i8>, ptr %add.ptr.1.i34.i.i.i, align 1
  %add.ptr.2.i36.i.i.i = getelementptr inbounds i8, ptr %add.ptr.1.i34.i.i.i, i64 %i_pix2
  %7 = load <8 x i8>, ptr %add.ptr.2.i36.i.i.i, align 1
  %vmovl.i2.i29.i.i.i = zext <8 x i8> %0 to <8 x i16>
  %vmovl.i.i30.i.i.i = zext <8 x i8> %4 to <8 x i16>
  %sub.i31.i.i.i = sub nsw <8 x i16> %vmovl.i2.i29.i.i.i, %vmovl.i.i30.i.i.i
  %vmovl.i2.i26.i.i.i = zext <8 x i8> %1 to <8 x i16>
  %vmovl.i.i27.i.i.i = zext <8 x i8> %5 to <8 x i16>
  %sub.i28.i.i.i = sub nsw <8 x i16> %vmovl.i2.i26.i.i.i, %vmovl.i.i27.i.i.i
  %vmovl.i2.i23.i.i.i = zext <8 x i8> %2 to <8 x i16>
  %vmovl.i.i24.i.i.i = zext <8 x i8> %6 to <8 x i16>
  %sub.i25.i.i.i = sub nsw <8 x i16> %vmovl.i2.i23.i.i.i, %vmovl.i.i24.i.i.i
  %vmovl.i2.i.i.i.i = zext <8 x i8> %3 to <8 x i16>
  %vmovl.i.i.i.i.i = zext <8 x i8> %7 to <8 x i16>
  %sub.i.i.i.i = sub nsw <8 x i16> %vmovl.i2.i.i.i.i, %vmovl.i.i.i.i.i
  %add.ptr4.i.i = getelementptr inbounds i8, ptr %pix1, i64 %mul3.i.i
  %add.ptr6.i.i = getelementptr inbounds i8, ptr %pix2, i64 %mul5.i.i
  %8 = load <8 x i8>, ptr %add.ptr4.i.i, align 1
  %add.ptr.i.i17.i.i = getelementptr inbounds i8, ptr %add.ptr4.i.i, i64 %i_pix1
  %9 = load <8 x i8>, ptr %add.ptr.i.i17.i.i, align 1
  %add.ptr.1.i.i18.i.i = getelementptr inbounds i8, ptr %add.ptr.i.i17.i.i, i64 %i_pix1
  %10 = load <8 x i8>, ptr %add.ptr.1.i.i18.i.i, align 1
  %add.ptr.2.i.i19.i.i = getelementptr inbounds i8, ptr %add.ptr.1.i.i18.i.i, i64 %i_pix1
  %11 = load <8 x i8>, ptr %add.ptr.2.i.i19.i.i, align 1
  %12 = load <8 x i8>, ptr %add.ptr6.i.i, align 1
  %add.ptr.i32.i20.i.i = getelementptr inbounds i8, ptr %add.ptr6.i.i, i64 %i_pix2
  %13 = load <8 x i8>, ptr %add.ptr.i32.i20.i.i, align 1
  %add.ptr.1.i34.i21.i.i = getelementptr inbounds i8, ptr %add.ptr.i32.i20.i.i, i64 %i_pix2
  %14 = load <8 x i8>, ptr %add.ptr.1.i34.i21.i.i, align 1
  %add.ptr.2.i36.i22.i.i = getelementptr inbounds i8, ptr %add.ptr.1.i34.i21.i.i, i64 %i_pix2
  %15 = load <8 x i8>, ptr %add.ptr.2.i36.i22.i.i, align 1
  %vmovl.i2.i29.i23.i.i = zext <8 x i8> %8 to <8 x i16>
  %vmovl.i.i30.i24.i.i = zext <8 x i8> %12 to <8 x i16>
  %sub.i31.i25.i.i = sub nsw <8 x i16> %vmovl.i2.i29.i23.i.i, %vmovl.i.i30.i24.i.i
  %vmovl.i2.i26.i26.i.i = zext <8 x i8> %9 to <8 x i16>
  %vmovl.i.i27.i27.i.i = zext <8 x i8> %13 to <8 x i16>
  %sub.i28.i28.i.i = sub nsw <8 x i16> %vmovl.i2.i26.i26.i.i, %vmovl.i.i27.i27.i.i
  %vmovl.i2.i23.i30.i.i = zext <8 x i8> %10 to <8 x i16>
  %vmovl.i.i24.i31.i.i = zext <8 x i8> %14 to <8 x i16>
  %sub.i25.i32.i.i = sub nsw <8 x i16> %vmovl.i2.i23.i30.i.i, %vmovl.i.i24.i31.i.i
  %vmovl.i2.i.i34.i.i = zext <8 x i8> %11 to <8 x i16>
  %vmovl.i.i.i35.i.i = zext <8 x i8> %15 to <8 x i16>
  %sub.i.i36.i.i = sub nsw <8 x i16> %vmovl.i2.i.i34.i.i, %vmovl.i.i.i35.i.i
  %add.i.i.i.i.i.i = add nsw <8 x i16> %sub.i28.i.i.i, %sub.i31.i.i.i
  %sub.i.i.i.i.i.i = sub nsw <8 x i16> %sub.i31.i.i.i, %sub.i28.i.i.i
  %add.i.i14.i.i.i.i = add nsw <8 x i16> %sub.i.i.i.i, %sub.i25.i.i.i
  %sub.i.i15.i.i.i.i = sub nsw <8 x i16> %sub.i25.i.i.i, %sub.i.i.i.i
  %add.i.i16.i.i.i.i = add nsw <8 x i16> %add.i.i14.i.i.i.i, %add.i.i.i.i.i.i
  %sub.i.i17.i.i.i.i = sub nsw <8 x i16> %add.i.i.i.i.i.i, %add.i.i14.i.i.i.i
  %add.i.i18.i.i.i.i = add nsw <8 x i16> %sub.i.i15.i.i.i.i, %sub.i.i.i.i.i.i
  %sub.i.i19.i.i.i.i = sub nsw <8 x i16> %sub.i.i.i.i.i.i, %sub.i.i15.i.i.i.i
  %add.i.i.i27.i.i.i = add nsw <8 x i16> %sub.i28.i28.i.i, %sub.i31.i25.i.i
  %sub.i.i.i28.i.i.i = sub nsw <8 x i16> %sub.i31.i25.i.i, %sub.i28.i28.i.i
  %add.i.i14.i31.i.i.i = add nsw <8 x i16> %sub.i.i36.i.i, %sub.i25.i32.i.i
  %sub.i.i15.i32.i.i.i = sub nsw <8 x i16> %sub.i25.i32.i.i, %sub.i.i36.i.i
  %add.i.i16.i34.i.i.i = add nsw <8 x i16> %add.i.i14.i31.i.i.i, %add.i.i.i27.i.i.i
  %sub.i.i17.i35.i.i.i = sub nsw <8 x i16> %add.i.i.i27.i.i.i, %add.i.i14.i31.i.i.i
  %add.i.i18.i38.i.i.i = add nsw <8 x i16> %sub.i.i15.i32.i.i.i, %sub.i.i.i28.i.i.i
  %sub.i.i19.i39.i.i.i = sub nsw <8 x i16> %sub.i.i.i28.i.i.i, %sub.i.i15.i32.i.i.i
  %add.i.i.i.i.i = add nsw <8 x i16> %add.i.i16.i34.i.i.i, %add.i.i16.i.i.i.i
  %sub.i.i.i.i.i = sub nsw <8 x i16> %add.i.i16.i.i.i.i, %add.i.i16.i34.i.i.i
  %add.i.i40.i.i.i = add nsw <8 x i16> %add.i.i18.i38.i.i.i, %add.i.i18.i.i.i.i
  %sub.i.i41.i.i.i = sub nsw <8 x i16> %add.i.i18.i.i.i.i, %add.i.i18.i38.i.i.i
  %add.i.i42.i.i.i = add nsw <8 x i16> %sub.i.i17.i35.i.i.i, %sub.i.i17.i.i.i.i
  %sub.i.i43.i.i.i = sub nsw <8 x i16> %sub.i.i17.i.i.i.i, %sub.i.i17.i35.i.i.i
  %add.i.i44.i.i.i = add nsw <8 x i16> %sub.i.i19.i39.i.i.i, %sub.i.i19.i.i.i.i
  %sub.i.i45.i.i.i = sub nsw <8 x i16> %sub.i.i19.i.i.i.i, %sub.i.i19.i39.i.i.i
  %shuffle.i.i.i.i.i.i = shufflevector <8 x i16> %add.i.i.i.i.i, <8 x i16> %add.i.i40.i.i.i, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %shuffle.i4.i.i.i.i.i = shufflevector <8 x i16> %add.i.i.i.i.i, <8 x i16> %add.i.i40.i.i.i, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %shuffle.i.i14.i.i.i.i = shufflevector <8 x i16> %add.i.i42.i.i.i, <8 x i16> %add.i.i44.i.i.i, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %shuffle.i4.i15.i.i.i.i = shufflevector <8 x i16> %add.i.i42.i.i.i, <8 x i16> %add.i.i44.i.i.i, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %add.i.i.i.i14.i.i = add nsw <8 x i16> %shuffle.i4.i.i.i.i.i, %shuffle.i.i.i.i.i.i
  %sub.i.i.i.i15.i.i = sub nsw <8 x i16> %shuffle.i.i.i.i.i.i, %shuffle.i4.i.i.i.i.i
  %add.i.i16.i.i16.i.i = add nsw <8 x i16> %shuffle.i4.i15.i.i.i.i, %shuffle.i.i14.i.i.i.i
  %sub.i.i17.i.i17.i.i = sub nsw <8 x i16> %shuffle.i.i14.i.i.i.i, %shuffle.i4.i15.i.i.i.i
  %16 = bitcast <8 x i16> %add.i.i.i.i14.i.i to <4 x i32>
  %17 = bitcast <8 x i16> %add.i.i16.i.i16.i.i to <4 x i32>
  %shuffle.i.i18.i.i.i.i = shufflevector <4 x i32> %16, <4 x i32> %17, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %shuffle.i8.i.i.i.i.i = shufflevector <4 x i32> %16, <4 x i32> %17, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %18 = bitcast <8 x i16> %sub.i.i.i.i15.i.i to <4 x i32>
  %19 = bitcast <8 x i16> %sub.i.i17.i.i17.i.i to <4 x i32>
  %shuffle.i.i19.i.i.i.i = shufflevector <4 x i32> %18, <4 x i32> %19, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %shuffle.i8.i20.i.i.i.i = shufflevector <4 x i32> %18, <4 x i32> %19, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %shuffle.i.i.i49.i.i.i = shufflevector <8 x i16> %sub.i.i.i.i.i, <8 x i16> %sub.i.i41.i.i.i, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %shuffle.i4.i.i50.i.i.i = shufflevector <8 x i16> %sub.i.i.i.i.i, <8 x i16> %sub.i.i41.i.i.i, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %shuffle.i.i14.i53.i.i.i = shufflevector <8 x i16> %sub.i.i43.i.i.i, <8 x i16> %sub.i.i45.i.i.i, <8 x i32> <i32 0, i32 8, i32 2, i32 10, i32 4, i32 12, i32 6, i32 14>
  %shuffle.i4.i15.i54.i.i.i = shufflevector <8 x i16> %sub.i.i43.i.i.i, <8 x i16> %sub.i.i45.i.i.i, <8 x i32> <i32 1, i32 9, i32 3, i32 11, i32 5, i32 13, i32 7, i32 15>
  %add.i.i.i55.i.i.i = add nsw <8 x i16> %shuffle.i4.i.i50.i.i.i, %shuffle.i.i.i49.i.i.i
  %sub.i.i.i56.i.i.i = sub nsw <8 x i16> %shuffle.i.i.i49.i.i.i, %shuffle.i4.i.i50.i.i.i
  %add.i.i16.i57.i.i.i = add nsw <8 x i16> %shuffle.i4.i15.i54.i.i.i, %shuffle.i.i14.i53.i.i.i
  %sub.i.i17.i58.i.i.i = sub nsw <8 x i16> %shuffle.i.i14.i53.i.i.i, %shuffle.i4.i15.i54.i.i.i
  %20 = bitcast <8 x i16> %add.i.i.i55.i.i.i to <4 x i32>
  %21 = bitcast <8 x i16> %add.i.i16.i57.i.i.i to <4 x i32>
  %shuffle.i.i18.i60.i.i.i = shufflevector <4 x i32> %20, <4 x i32> %21, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %shuffle.i8.i.i61.i.i.i = shufflevector <4 x i32> %20, <4 x i32> %21, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %22 = bitcast <8 x i16> %sub.i.i.i56.i.i.i to <4 x i32>
  %23 = bitcast <8 x i16> %sub.i.i17.i58.i.i.i to <4 x i32>
  %shuffle.i.i19.i64.i.i.i = shufflevector <4 x i32> %22, <4 x i32> %23, <4 x i32> <i32 0, i32 4, i32 2, i32 6>
  %shuffle.i8.i20.i65.i.i.i = shufflevector <4 x i32> %22, <4 x i32> %23, <4 x i32> <i32 1, i32 5, i32 3, i32 7>
  %24 = bitcast <4 x i32> %shuffle.i.i18.i.i.i.i to <8 x i16>
  %25 = bitcast <4 x i32> %shuffle.i8.i.i.i.i.i to <8 x i16>
  %add.i.i.i19.i.i = add <8 x i16> %25, %24
  %vabs1.i.i.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.abs.v8i16(<8 x i16> %add.i.i.i19.i.i)
  %vabd2.i.i.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.sabd.v8i16(<8 x i16> %24, <8 x i16> %25)
  %26 = bitcast <4 x i32> %shuffle.i.i19.i.i.i.i to <8 x i16>
  %27 = bitcast <4 x i32> %shuffle.i8.i20.i.i.i.i to <8 x i16>
  %add.i.i66.i.i.i = add <8 x i16> %27, %26
  %vabs1.i.i67.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.abs.v8i16(<8 x i16> %add.i.i66.i.i.i)
  %vabd2.i.i68.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.sabd.v8i16(<8 x i16> %26, <8 x i16> %27)
  %28 = bitcast <4 x i32> %shuffle.i.i18.i60.i.i.i to <8 x i16>
  %29 = bitcast <4 x i32> %shuffle.i8.i.i61.i.i.i to <8 x i16>
  %add.i.i69.i.i.i = add <8 x i16> %29, %28
  %vabs1.i.i70.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.abs.v8i16(<8 x i16> %add.i.i69.i.i.i)
  %vabd2.i.i71.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.sabd.v8i16(<8 x i16> %28, <8 x i16> %29)
  %30 = bitcast <4 x i32> %shuffle.i.i19.i64.i.i.i to <8 x i16>
  %31 = bitcast <4 x i32> %shuffle.i8.i20.i65.i.i.i to <8 x i16>
  %add.i.i72.i.i.i = add <8 x i16> %31, %30
  %vabs1.i.i73.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.abs.v8i16(<8 x i16> %add.i.i72.i.i.i)
  %vabd2.i.i74.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.sabd.v8i16(<8 x i16> %30, <8 x i16> %31)
  %32 = bitcast <8 x i16> %vabs1.i.i.i.i.i to <2 x i64>
  %33 = bitcast <8 x i16> %vabs1.i.i70.i.i.i to <2 x i64>
  %shuffle.i.i.i.i.i = shufflevector <2 x i64> %32, <2 x i64> %33, <2 x i32> <i32 0, i32 2>
  %shuffle.i8.i.i.i.i = shufflevector <2 x i64> %32, <2 x i64> %33, <2 x i32> <i32 1, i32 3>
  %34 = bitcast <8 x i16> %vabs1.i.i67.i.i.i to <2 x i64>
  %35 = bitcast <8 x i16> %vabs1.i.i73.i.i.i to <2 x i64>
  %shuffle.i.i75.i.i.i = shufflevector <2 x i64> %34, <2 x i64> %35, <2 x i32> <i32 0, i32 2>
  %shuffle.i8.i76.i.i.i = shufflevector <2 x i64> %34, <2 x i64> %35, <2 x i32> <i32 1, i32 3>
  %36 = bitcast <8 x i16> %vabd2.i.i.i.i.i to <2 x i64>
  %37 = bitcast <8 x i16> %vabd2.i.i71.i.i.i to <2 x i64>
  %shuffle.i.i77.i.i.i = shufflevector <2 x i64> %36, <2 x i64> %37, <2 x i32> <i32 0, i32 2>
  %shuffle.i8.i78.i.i.i = shufflevector <2 x i64> %36, <2 x i64> %37, <2 x i32> <i32 1, i32 3>
  %38 = bitcast <8 x i16> %vabd2.i.i68.i.i.i to <2 x i64>
  %39 = bitcast <8 x i16> %vabd2.i.i74.i.i.i to <2 x i64>
  %shuffle.i.i79.i.i.i = shufflevector <2 x i64> %38, <2 x i64> %39, <2 x i32> <i32 0, i32 2>
  %shuffle.i8.i80.i.i.i = shufflevector <2 x i64> %38, <2 x i64> %39, <2 x i32> <i32 1, i32 3>
  %40 = bitcast <2 x i64> %shuffle.i.i.i.i.i to <8 x i16>
  %41 = bitcast <2 x i64> %shuffle.i8.i.i.i.i to <8 x i16>
  %vmax2.i47.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.umax.v8i16(<8 x i16> %40, <8 x i16> %41)
  %42 = bitcast <2 x i64> %shuffle.i.i75.i.i.i to <8 x i16>
  %43 = bitcast <2 x i64> %shuffle.i8.i76.i.i.i to <8 x i16>
  %vmax2.i46.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.umax.v8i16(<8 x i16> %42, <8 x i16> %43)
  %44 = bitcast <2 x i64> %shuffle.i.i77.i.i.i to <8 x i16>
  %45 = bitcast <2 x i64> %shuffle.i8.i78.i.i.i to <8 x i16>
  %vmax2.i45.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.umax.v8i16(<8 x i16> %44, <8 x i16> %45)
  %46 = bitcast <2 x i64> %shuffle.i.i79.i.i.i to <8 x i16>
  %47 = bitcast <2 x i64> %shuffle.i8.i80.i.i.i to <8 x i16>
  %vmax2.i.i.i.i = tail call noundef <8 x i16> @llvm.aarch64.neon.umax.v8i16(<8 x i16> %46, <8 x i16> %47)
  %add.i.i.i = add <8 x i16> %vmax2.i46.i.i.i, %vmax2.i47.i.i.i
  %add.i10.i.i = add <8 x i16> %add.i.i.i, %vmax2.i45.i.i.i
  %add.i.i = add <8 x i16> %add.i10.i.i, %vmax2.i.i.i.i
  %vaddlv.i.i = tail call noundef i32 @llvm.aarch64.neon.uaddlv.i32.v8i16(<8 x i16> %add.i.i)
  %add.i = add i32 %vaddlv.i.i, 1
  %shr.i = lshr i32 %add.i, 1
  ret i32 %shr.i
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.aarch64.neon.abs.v8i16(<8 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.aarch64.neon.sabd.v8i16(<8 x i16>, <8 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare <8 x i16> @llvm.aarch64.neon.umax.v8i16(<8 x i16>, <8 x i16>) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i32 @llvm.aarch64.neon.uaddlv.i32.v8i16(<8 x i16>) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: read) uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(none) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
