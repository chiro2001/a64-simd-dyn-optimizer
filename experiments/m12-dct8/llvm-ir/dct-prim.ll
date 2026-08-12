; ModuleID = 'third_party/x265/source/common/aarch64/dct-prim.cpp'
source_filename = "third_party/x265/source/common/aarch64/dct-prim.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "aarch64-unknown-linux-gnu"

@_ZN4x2654g_t8E = external local_unnamed_addr constant [8 x [8 x i16]], align 2
@_ZN4x2655g_t16E = external local_unnamed_addr constant [16 x [16 x i16]], align 2
@_ZN4x2655g_t32E = external local_unnamed_addr constant [32 x [32 x i16]], align 2

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x2659dst4_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 32)) %1, i64 noundef %2) #0 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds i16, ptr %0, i64 %2
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = shl nsw i64 %2, 2
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load <4 x i16>, ptr %8, align 2
  %10 = mul nsw i64 %2, 6
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load <4 x i16>, ptr %11, align 2
  %13 = shufflevector <4 x i16> %4, <4 x i16> %9, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %14 = shufflevector <4 x i16> %6, <4 x i16> %12, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %15 = shufflevector <8 x i16> %13, <8 x i16> %14, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %16 = shufflevector <8 x i16> %13, <8 x i16> %14, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %17 = shufflevector <8 x i16> %15, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %18 = shufflevector <8 x i16> %15, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %19 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %20 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %21 = sext <4 x i16> %17 to <4 x i32>
  %22 = sext <4 x i16> %20 to <4 x i32>
  %23 = add nsw <4 x i32> %21, %22
  %24 = sext <4 x i16> %18 to <4 x i32>
  %25 = add nsw <4 x i32> %24, %22
  %26 = sub nsw <4 x i32> %21, %24
  %27 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %19, <4 x i16> splat (i16 74))
  %28 = mul nsw <4 x i32> %23, splat (i32 29)
  %29 = add <4 x i32> %28, %27
  %30 = mul nsw <4 x i32> %25, splat (i32 55)
  %31 = add <4 x i32> %29, %30
  %32 = add nsw <4 x i32> %21, %24
  %33 = sub nsw <4 x i32> %32, %22
  %34 = mul nsw <4 x i32> %33, splat (i32 74)
  %35 = mul nsw <4 x i32> %26, splat (i32 29)
  %36 = mul nsw <4 x i32> %23, splat (i32 55)
  %37 = sub <4 x i32> %36, %27
  %38 = add <4 x i32> %37, %35
  %39 = mul nsw <4 x i32> %26, splat (i32 55)
  %40 = add <4 x i32> %39, %27
  %41 = mul nsw <4 x i32> %25, splat (i32 -29)
  %42 = add <4 x i32> %40, %41
  %43 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %31, i32 1)
  %44 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %34, i32 1)
  %45 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %38, i32 1)
  %46 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %42, i32 1)
  %47 = shufflevector <4 x i16> %43, <4 x i16> %45, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %48 = shufflevector <4 x i16> %44, <4 x i16> %46, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %49 = shufflevector <8 x i16> %47, <8 x i16> %48, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %50 = shufflevector <8 x i16> %47, <8 x i16> %48, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %51 = shufflevector <8 x i16> %49, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %52 = shufflevector <8 x i16> %49, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %53 = shufflevector <8 x i16> %50, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %54 = shufflevector <8 x i16> %50, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %55 = sext <4 x i16> %51 to <4 x i32>
  %56 = sext <4 x i16> %54 to <4 x i32>
  %57 = add nsw <4 x i32> %55, %56
  %58 = sext <4 x i16> %52 to <4 x i32>
  %59 = add nsw <4 x i32> %58, %56
  %60 = sub nsw <4 x i32> %55, %58
  %61 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %53, <4 x i16> splat (i16 74))
  %62 = mul nsw <4 x i32> %57, splat (i32 29)
  %63 = add <4 x i32> %62, %61
  %64 = mul nsw <4 x i32> %59, splat (i32 55)
  %65 = add <4 x i32> %63, %64
  %66 = add nsw <4 x i32> %55, %58
  %67 = sub nsw <4 x i32> %66, %56
  %68 = mul nsw <4 x i32> %67, splat (i32 74)
  %69 = mul nsw <4 x i32> %60, splat (i32 29)
  %70 = mul nsw <4 x i32> %57, splat (i32 55)
  %71 = sub <4 x i32> %70, %61
  %72 = add <4 x i32> %71, %69
  %73 = mul nsw <4 x i32> %60, splat (i32 55)
  %74 = add <4 x i32> %73, %61
  %75 = mul nsw <4 x i32> %59, splat (i32 -29)
  %76 = add <4 x i32> %74, %75
  %77 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %65, i32 8)
  %78 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %68, i32 8)
  %79 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %72, i32 8)
  %80 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %76, i32 8)
  store <4 x i16> %77, ptr %1, align 2
  %81 = getelementptr inbounds nuw i8, ptr %1, i64 8
  store <4 x i16> %78, ptr %81, align 2
  %82 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store <4 x i16> %79, ptr %82, align 2
  %83 = getelementptr inbounds nuw i8, ptr %1, i64 24
  store <4 x i16> %80, ptr %83, align 2
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x2659dct4_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 32)) %1, i64 noundef %2) #0 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds i16, ptr %0, i64 %2
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = shl nsw i64 %2, 2
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load <4 x i16>, ptr %8, align 2
  %10 = mul nsw i64 %2, 6
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load <4 x i16>, ptr %11, align 2
  %13 = shufflevector <4 x i16> %4, <4 x i16> %9, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %14 = shufflevector <4 x i16> %6, <4 x i16> %12, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %15 = shufflevector <8 x i16> %13, <8 x i16> %14, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %16 = shufflevector <8 x i16> %13, <8 x i16> %14, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %17 = shufflevector <8 x i16> %15, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %18 = shufflevector <8 x i16> %15, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %19 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %20 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %21 = sext <4 x i16> %17 to <4 x i32>
  %22 = sext <4 x i16> %20 to <4 x i32>
  %23 = add nsw <4 x i32> %21, %22
  %24 = sub nsw <4 x i32> %21, %22
  %25 = sext <4 x i16> %18 to <4 x i32>
  %26 = sext <4 x i16> %19 to <4 x i32>
  %27 = add nsw <4 x i32> %25, %26
  %28 = sub nsw <4 x i32> %25, %26
  %29 = add nsw <4 x i32> %23, %27
  %30 = shl nsw <4 x i32> %29, splat (i32 6)
  %31 = mul nsw <4 x i32> %24, splat (i32 83)
  %32 = mul nsw <4 x i32> %28, splat (i32 36)
  %33 = add nsw <4 x i32> %31, %32
  %34 = sub nsw <4 x i32> %23, %27
  %35 = shl nsw <4 x i32> %34, splat (i32 6)
  %36 = mul nsw <4 x i32> %24, splat (i32 36)
  %37 = mul nsw <4 x i32> %28, splat (i32 -83)
  %38 = add nsw <4 x i32> %36, %37
  %39 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %30, i32 1)
  %40 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %33, i32 1)
  %41 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %35, i32 1)
  %42 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %38, i32 1)
  %43 = shufflevector <4 x i16> %39, <4 x i16> %41, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %44 = shufflevector <4 x i16> %40, <4 x i16> %42, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %45 = shufflevector <8 x i16> %43, <8 x i16> %44, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %46 = shufflevector <8 x i16> %43, <8 x i16> %44, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %47 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %48 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %49 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %50 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %51 = sext <4 x i16> %47 to <4 x i32>
  %52 = sext <4 x i16> %50 to <4 x i32>
  %53 = add nsw <4 x i32> %51, %52
  %54 = sub nsw <4 x i32> %51, %52
  %55 = sext <4 x i16> %48 to <4 x i32>
  %56 = sext <4 x i16> %49 to <4 x i32>
  %57 = add nsw <4 x i32> %55, %56
  %58 = sub nsw <4 x i32> %55, %56
  %59 = add nsw <4 x i32> %53, %57
  %60 = shl nsw <4 x i32> %59, splat (i32 6)
  %61 = mul nsw <4 x i32> %54, splat (i32 83)
  %62 = mul nsw <4 x i32> %58, splat (i32 36)
  %63 = add nsw <4 x i32> %61, %62
  %64 = sub nsw <4 x i32> %53, %57
  %65 = shl nsw <4 x i32> %64, splat (i32 6)
  %66 = mul nsw <4 x i32> %54, splat (i32 36)
  %67 = mul nsw <4 x i32> %58, splat (i32 -83)
  %68 = add nsw <4 x i32> %66, %67
  %69 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %60, i32 8)
  %70 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %63, i32 8)
  %71 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %65, i32 8)
  %72 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %68, i32 8)
  store <4 x i16> %69, ptr %1, align 2
  %73 = getelementptr inbounds nuw i8, ptr %1, i64 8
  store <4 x i16> %70, ptr %73, align 2
  %74 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store <4 x i16> %71, ptr %74, align 2
  %75 = getelementptr inbounds nuw i8, ptr %1, i64 24
  store <4 x i16> %72, ptr %75, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x2659dct8_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 128)) %1, i64 noundef %2) #0 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = getelementptr inbounds i16, ptr %0, i64 %2
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %10 = load <4 x i16>, ptr %9, align 2
  %11 = shl nsw i64 %2, 2
  %12 = getelementptr inbounds i8, ptr %0, i64 %11
  %13 = load <4 x i16>, ptr %12, align 2
  %14 = getelementptr inbounds nuw i8, ptr %12, i64 8
  %15 = load <4 x i16>, ptr %14, align 2
  %16 = mul nsw i64 %2, 6
  %17 = getelementptr inbounds i8, ptr %0, i64 %16
  %18 = load <4 x i16>, ptr %17, align 2
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 8
  %20 = load <4 x i16>, ptr %19, align 2
  %21 = shl nsw i64 %2, 3
  %22 = getelementptr inbounds i8, ptr %0, i64 %21
  %23 = load <4 x i16>, ptr %22, align 2
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 8
  %25 = load <4 x i16>, ptr %24, align 2
  %26 = mul nsw i64 %2, 10
  %27 = getelementptr inbounds i8, ptr %0, i64 %26
  %28 = load <4 x i16>, ptr %27, align 2
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 8
  %30 = load <4 x i16>, ptr %29, align 2
  %31 = mul nsw i64 %2, 12
  %32 = getelementptr inbounds i8, ptr %0, i64 %31
  %33 = load <4 x i16>, ptr %32, align 2
  %34 = getelementptr inbounds nuw i8, ptr %32, i64 8
  %35 = load <4 x i16>, ptr %34, align 2
  %36 = mul nsw i64 %2, 14
  %37 = getelementptr inbounds i8, ptr %0, i64 %36
  %38 = load <4 x i16>, ptr %37, align 2
  %39 = getelementptr inbounds nuw i8, ptr %37, i64 8
  %40 = load <4 x i16>, ptr %39, align 2
  %41 = shufflevector <4 x i16> %6, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %42 = shufflevector <4 x i16> %10, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %43 = sext <4 x i16> %4 to <4 x i32>
  %44 = sext <4 x i16> %41 to <4 x i32>
  %45 = add nsw <4 x i32> %44, %43
  %46 = sext <4 x i16> %8 to <4 x i32>
  %47 = sext <4 x i16> %42 to <4 x i32>
  %48 = add nsw <4 x i32> %47, %46
  %49 = sub <4 x i16> %4, %41
  %50 = sub <4 x i16> %8, %42
  %51 = shufflevector <4 x i32> %45, <4 x i32> %48, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %52 = shufflevector <4 x i32> %45, <4 x i32> %48, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %53 = shufflevector <4 x i32> %52, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %54 = add nsw <4 x i32> %53, %51
  %55 = sub nsw <4 x i32> %51, %53
  %56 = shufflevector <4 x i16> %15, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %57 = shufflevector <4 x i16> %20, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %58 = sext <4 x i16> %13 to <4 x i32>
  %59 = sext <4 x i16> %56 to <4 x i32>
  %60 = add nsw <4 x i32> %59, %58
  %61 = sext <4 x i16> %18 to <4 x i32>
  %62 = sext <4 x i16> %57 to <4 x i32>
  %63 = add nsw <4 x i32> %62, %61
  %64 = sub <4 x i16> %13, %56
  %65 = sub <4 x i16> %18, %57
  %66 = shufflevector <4 x i32> %60, <4 x i32> %63, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %67 = shufflevector <4 x i32> %60, <4 x i32> %63, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %68 = shufflevector <4 x i32> %67, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %69 = add nsw <4 x i32> %68, %66
  %70 = sub nsw <4 x i32> %66, %68
  %71 = shufflevector <4 x i16> %25, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %72 = shufflevector <4 x i16> %30, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %73 = sext <4 x i16> %23 to <4 x i32>
  %74 = sext <4 x i16> %71 to <4 x i32>
  %75 = add nsw <4 x i32> %74, %73
  %76 = sext <4 x i16> %28 to <4 x i32>
  %77 = sext <4 x i16> %72 to <4 x i32>
  %78 = add nsw <4 x i32> %77, %76
  %79 = sub <4 x i16> %23, %71
  %80 = sub <4 x i16> %28, %72
  %81 = shufflevector <4 x i32> %75, <4 x i32> %78, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %82 = shufflevector <4 x i32> %75, <4 x i32> %78, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %83 = shufflevector <4 x i32> %82, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %84 = add nsw <4 x i32> %83, %81
  %85 = sub nsw <4 x i32> %81, %83
  %86 = shufflevector <4 x i16> %35, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %87 = shufflevector <4 x i16> %40, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %88 = sext <4 x i16> %33 to <4 x i32>
  %89 = sext <4 x i16> %86 to <4 x i32>
  %90 = add nsw <4 x i32> %89, %88
  %91 = sext <4 x i16> %38 to <4 x i32>
  %92 = sext <4 x i16> %87 to <4 x i32>
  %93 = add nsw <4 x i32> %92, %91
  %94 = sub <4 x i16> %33, %86
  %95 = sub <4 x i16> %38, %87
  %96 = shufflevector <4 x i32> %90, <4 x i32> %93, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %97 = shufflevector <4 x i32> %90, <4 x i32> %93, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %98 = shufflevector <4 x i32> %97, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %99 = add nsw <4 x i32> %98, %96
  %100 = sub nsw <4 x i32> %96, %98
  %101 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 16), align 2
  %102 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 48), align 2
  %103 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 80), align 2
  %104 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 112), align 2
  %105 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %49)
  %106 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %50)
  %107 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %105, <4 x i32> %106)
  %108 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %64)
  %109 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %65)
  %110 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %108, <4 x i32> %109)
  %111 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %107, <4 x i32> %110)
  %112 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %111, i32 2)
  %113 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %49)
  %114 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %50)
  %115 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %113, <4 x i32> %114)
  %116 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %64)
  %117 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %65)
  %118 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %116, <4 x i32> %117)
  %119 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %115, <4 x i32> %118)
  %120 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %119, i32 2)
  %121 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %49)
  %122 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %50)
  %123 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %121, <4 x i32> %122)
  %124 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %64)
  %125 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %65)
  %126 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %124, <4 x i32> %125)
  %127 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %123, <4 x i32> %126)
  %128 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %127, i32 2)
  %129 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %49)
  %130 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %50)
  %131 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %129, <4 x i32> %130)
  %132 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %64)
  %133 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %65)
  %134 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %132, <4 x i32> %133)
  %135 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %131, <4 x i32> %134)
  %136 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %135, i32 2)
  %137 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %54, <4 x i32> %69)
  %138 = shl <4 x i32> %137, splat (i32 6)
  %139 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %138, i32 2)
  %140 = mul nsw <4 x i32> %55, <i32 83, i32 36, i32 83, i32 36>
  %141 = mul nsw <4 x i32> %70, <i32 83, i32 36, i32 83, i32 36>
  %142 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %140, <4 x i32> %141)
  %143 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %142, i32 2)
  %144 = mul nsw <4 x i32> %54, <i32 64, i32 -64, i32 64, i32 -64>
  %145 = mul nsw <4 x i32> %69, <i32 64, i32 -64, i32 64, i32 -64>
  %146 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %144, <4 x i32> %145)
  %147 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %146, i32 2)
  %148 = mul nsw <4 x i32> %55, <i32 36, i32 -83, i32 36, i32 -83>
  %149 = mul nsw <4 x i32> %70, <i32 36, i32 -83, i32 36, i32 -83>
  %150 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %148, <4 x i32> %149)
  %151 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %150, i32 2)
  %152 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %79)
  %153 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %80)
  %154 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %152, <4 x i32> %153)
  %155 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %94)
  %156 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %95)
  %157 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %155, <4 x i32> %156)
  %158 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %154, <4 x i32> %157)
  %159 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %158, i32 2)
  %160 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %79)
  %161 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %80)
  %162 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %160, <4 x i32> %161)
  %163 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %94)
  %164 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %95)
  %165 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %163, <4 x i32> %164)
  %166 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %162, <4 x i32> %165)
  %167 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %166, i32 2)
  %168 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %79)
  %169 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %80)
  %170 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %168, <4 x i32> %169)
  %171 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %94)
  %172 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %95)
  %173 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %171, <4 x i32> %172)
  %174 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %170, <4 x i32> %173)
  %175 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %174, i32 2)
  %176 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %79)
  %177 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %80)
  %178 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %176, <4 x i32> %177)
  %179 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %94)
  %180 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %95)
  %181 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %179, <4 x i32> %180)
  %182 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %178, <4 x i32> %181)
  %183 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %182, i32 2)
  %184 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %84, <4 x i32> %99)
  %185 = shl <4 x i32> %184, splat (i32 6)
  %186 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %185, i32 2)
  %187 = mul nsw <4 x i32> %85, <i32 83, i32 36, i32 83, i32 36>
  %188 = mul nsw <4 x i32> %100, <i32 83, i32 36, i32 83, i32 36>
  %189 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %187, <4 x i32> %188)
  %190 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %189, i32 2)
  %191 = mul nsw <4 x i32> %84, <i32 64, i32 -64, i32 64, i32 -64>
  %192 = mul nsw <4 x i32> %99, <i32 64, i32 -64, i32 64, i32 -64>
  %193 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %191, <4 x i32> %192)
  %194 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %193, i32 2)
  %195 = mul nsw <4 x i32> %85, <i32 36, i32 -83, i32 36, i32 -83>
  %196 = mul nsw <4 x i32> %100, <i32 36, i32 -83, i32 36, i32 -83>
  %197 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %195, <4 x i32> %196)
  %198 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %197, i32 2)
  %199 = shufflevector <4 x i16> %186, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %200 = shufflevector <4 x i16> %159, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %201 = sext <4 x i16> %139 to <4 x i32>
  %202 = sext <4 x i16> %199 to <4 x i32>
  %203 = add nsw <4 x i32> %202, %201
  %204 = sext <4 x i16> %112 to <4 x i32>
  %205 = sext <4 x i16> %200 to <4 x i32>
  %206 = add nsw <4 x i32> %205, %204
  %207 = sub <4 x i16> %139, %199
  %208 = sub <4 x i16> %112, %200
  %209 = shufflevector <4 x i32> %203, <4 x i32> %206, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %210 = shufflevector <4 x i32> %203, <4 x i32> %206, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %211 = shufflevector <4 x i32> %210, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %212 = add nsw <4 x i32> %211, %209
  %213 = sub nsw <4 x i32> %209, %211
  %214 = shufflevector <4 x i16> %190, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %215 = shufflevector <4 x i16> %167, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %216 = sext <4 x i16> %143 to <4 x i32>
  %217 = sext <4 x i16> %214 to <4 x i32>
  %218 = add nsw <4 x i32> %217, %216
  %219 = sext <4 x i16> %120 to <4 x i32>
  %220 = sext <4 x i16> %215 to <4 x i32>
  %221 = add nsw <4 x i32> %220, %219
  %222 = sub <4 x i16> %143, %214
  %223 = sub <4 x i16> %120, %215
  %224 = shufflevector <4 x i32> %218, <4 x i32> %221, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %225 = shufflevector <4 x i32> %218, <4 x i32> %221, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %226 = shufflevector <4 x i32> %225, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %227 = add nsw <4 x i32> %226, %224
  %228 = sub nsw <4 x i32> %224, %226
  %229 = shufflevector <4 x i16> %194, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %230 = shufflevector <4 x i16> %175, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %231 = sext <4 x i16> %147 to <4 x i32>
  %232 = sext <4 x i16> %229 to <4 x i32>
  %233 = add nsw <4 x i32> %232, %231
  %234 = sext <4 x i16> %128 to <4 x i32>
  %235 = sext <4 x i16> %230 to <4 x i32>
  %236 = add nsw <4 x i32> %235, %234
  %237 = sub <4 x i16> %147, %229
  %238 = sub <4 x i16> %128, %230
  %239 = shufflevector <4 x i32> %233, <4 x i32> %236, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %240 = shufflevector <4 x i32> %233, <4 x i32> %236, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %241 = shufflevector <4 x i32> %240, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %242 = add nsw <4 x i32> %241, %239
  %243 = sub nsw <4 x i32> %239, %241
  %244 = shufflevector <4 x i16> %198, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %245 = shufflevector <4 x i16> %183, <4 x i16> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %246 = sext <4 x i16> %151 to <4 x i32>
  %247 = sext <4 x i16> %244 to <4 x i32>
  %248 = add nsw <4 x i32> %247, %246
  %249 = sext <4 x i16> %136 to <4 x i32>
  %250 = sext <4 x i16> %245 to <4 x i32>
  %251 = add nsw <4 x i32> %250, %249
  %252 = sub <4 x i16> %151, %244
  %253 = sub <4 x i16> %136, %245
  %254 = shufflevector <4 x i32> %248, <4 x i32> %251, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %255 = shufflevector <4 x i32> %248, <4 x i32> %251, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %256 = shufflevector <4 x i32> %255, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %257 = add nsw <4 x i32> %256, %254
  %258 = sub nsw <4 x i32> %254, %256
  %259 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %207)
  %260 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %208)
  %261 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %259, <4 x i32> %260)
  %262 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %222)
  %263 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %223)
  %264 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %262, <4 x i32> %263)
  %265 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %261, <4 x i32> %264)
  %266 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %265, i32 9)
  %267 = getelementptr inbounds nuw i8, ptr %1, i64 16
  store <4 x i16> %266, ptr %267, align 2
  %268 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %207)
  %269 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %208)
  %270 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %268, <4 x i32> %269)
  %271 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %222)
  %272 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %223)
  %273 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %271, <4 x i32> %272)
  %274 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %270, <4 x i32> %273)
  %275 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %274, i32 9)
  %276 = getelementptr inbounds nuw i8, ptr %1, i64 48
  store <4 x i16> %275, ptr %276, align 2
  %277 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %207)
  %278 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %208)
  %279 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %277, <4 x i32> %278)
  %280 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %222)
  %281 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %223)
  %282 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %280, <4 x i32> %281)
  %283 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %279, <4 x i32> %282)
  %284 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %283, i32 9)
  %285 = getelementptr inbounds nuw i8, ptr %1, i64 80
  store <4 x i16> %284, ptr %285, align 2
  %286 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %207)
  %287 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %208)
  %288 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %286, <4 x i32> %287)
  %289 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %222)
  %290 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %223)
  %291 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %289, <4 x i32> %290)
  %292 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %288, <4 x i32> %291)
  %293 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %292, i32 9)
  %294 = getelementptr inbounds nuw i8, ptr %1, i64 112
  store <4 x i16> %293, ptr %294, align 2
  %295 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %212, <4 x i32> %227)
  %296 = shl <4 x i32> %295, splat (i32 6)
  %297 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %296, i32 9)
  store <4 x i16> %297, ptr %1, align 2
  %298 = mul nsw <4 x i32> %213, <i32 83, i32 36, i32 83, i32 36>
  %299 = mul nsw <4 x i32> %228, <i32 83, i32 36, i32 83, i32 36>
  %300 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %298, <4 x i32> %299)
  %301 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %300, i32 9)
  %302 = getelementptr inbounds nuw i8, ptr %1, i64 32
  store <4 x i16> %301, ptr %302, align 2
  %303 = mul nsw <4 x i32> %212, <i32 64, i32 -64, i32 64, i32 -64>
  %304 = mul nsw <4 x i32> %227, <i32 64, i32 -64, i32 64, i32 -64>
  %305 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %303, <4 x i32> %304)
  %306 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %305, i32 9)
  %307 = getelementptr inbounds nuw i8, ptr %1, i64 64
  store <4 x i16> %306, ptr %307, align 2
  %308 = mul nsw <4 x i32> %213, <i32 36, i32 -83, i32 36, i32 -83>
  %309 = mul nsw <4 x i32> %228, <i32 36, i32 -83, i32 36, i32 -83>
  %310 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %308, <4 x i32> %309)
  %311 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %310, i32 9)
  %312 = getelementptr inbounds nuw i8, ptr %1, i64 96
  store <4 x i16> %311, ptr %312, align 2
  %313 = getelementptr inbounds nuw i8, ptr %1, i64 8
  %314 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %237)
  %315 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %238)
  %316 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %314, <4 x i32> %315)
  %317 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %252)
  %318 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %101, <4 x i16> %253)
  %319 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %317, <4 x i32> %318)
  %320 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %316, <4 x i32> %319)
  %321 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %320, i32 9)
  %322 = getelementptr inbounds nuw i8, ptr %1, i64 24
  store <4 x i16> %321, ptr %322, align 2
  %323 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %237)
  %324 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %238)
  %325 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %323, <4 x i32> %324)
  %326 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %252)
  %327 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %102, <4 x i16> %253)
  %328 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %326, <4 x i32> %327)
  %329 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %325, <4 x i32> %328)
  %330 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %329, i32 9)
  %331 = getelementptr inbounds nuw i8, ptr %1, i64 56
  store <4 x i16> %330, ptr %331, align 2
  %332 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %237)
  %333 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %238)
  %334 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %332, <4 x i32> %333)
  %335 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %252)
  %336 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %103, <4 x i16> %253)
  %337 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %335, <4 x i32> %336)
  %338 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %334, <4 x i32> %337)
  %339 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %338, i32 9)
  %340 = getelementptr inbounds nuw i8, ptr %1, i64 88
  store <4 x i16> %339, ptr %340, align 2
  %341 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %237)
  %342 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %238)
  %343 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %341, <4 x i32> %342)
  %344 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %252)
  %345 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %104, <4 x i16> %253)
  %346 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %344, <4 x i32> %345)
  %347 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %343, <4 x i32> %346)
  %348 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %347, i32 9)
  %349 = getelementptr inbounds nuw i8, ptr %1, i64 120
  store <4 x i16> %348, ptr %349, align 2
  %350 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %242, <4 x i32> %257)
  %351 = shl <4 x i32> %350, splat (i32 6)
  %352 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %351, i32 9)
  store <4 x i16> %352, ptr %313, align 2
  %353 = mul nsw <4 x i32> %243, <i32 83, i32 36, i32 83, i32 36>
  %354 = mul nsw <4 x i32> %258, <i32 83, i32 36, i32 83, i32 36>
  %355 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %353, <4 x i32> %354)
  %356 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %355, i32 9)
  %357 = getelementptr inbounds nuw i8, ptr %1, i64 40
  store <4 x i16> %356, ptr %357, align 2
  %358 = mul nsw <4 x i32> %242, <i32 64, i32 -64, i32 64, i32 -64>
  %359 = mul nsw <4 x i32> %257, <i32 64, i32 -64, i32 64, i32 -64>
  %360 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %358, <4 x i32> %359)
  %361 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %360, i32 9)
  %362 = getelementptr inbounds nuw i8, ptr %1, i64 72
  store <4 x i16> %361, ptr %362, align 2
  %363 = mul nsw <4 x i32> %243, <i32 36, i32 -83, i32 36, i32 -83>
  %364 = mul nsw <4 x i32> %258, <i32 36, i32 -83, i32 36, i32 -83>
  %365 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %363, <4 x i32> %364)
  %366 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %365, i32 9)
  %367 = getelementptr inbounds nuw i8, ptr %1, i64 104
  store <4 x i16> %366, ptr %367, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26510dct16_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, i64 noundef %2) local_unnamed_addr #2 {
  %4 = alloca [16 x <8 x i16>], align 16
  %5 = alloca [16 x <4 x i32>], align 16
  %6 = alloca [16 x <4 x i32>], align 16
  %7 = alloca [16 x <4 x i32>], align 16
  %8 = alloca [16 x <8 x i16>], align 16
  %9 = alloca [16 x <4 x i32>], align 16
  %10 = alloca [16 x <4 x i32>], align 16
  %11 = alloca [16 x <4 x i32>], align 16
  %12 = alloca [256 x i16], align 32
  call void @llvm.lifetime.start.p0(ptr nonnull %12) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #10
  br label %13

13:                                               ; preds = %13, %3
  %14 = phi i64 [ 0, %3 ], [ %68, %13 ]
  %15 = mul nsw i64 %14, %2
  %16 = getelementptr inbounds i16, ptr %0, i64 %15
  %17 = load <8 x i16>, ptr %16, align 2
  %18 = getelementptr inbounds nuw i8, ptr %16, i64 16
  %19 = load <8 x i16>, ptr %18, align 2
  %20 = shufflevector <8 x i16> %19, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %21 = or disjoint i64 %14, 1
  %22 = mul nsw i64 %21, %2
  %23 = getelementptr inbounds i16, ptr %0, i64 %22
  %24 = load <8 x i16>, ptr %23, align 2
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 16
  %26 = load <8 x i16>, ptr %25, align 2
  %27 = shufflevector <8 x i16> %26, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %28 = shufflevector <8 x i16> %17, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %29 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %30 = sext <4 x i16> %28 to <4 x i32>
  %31 = sext <4 x i16> %29 to <4 x i32>
  %32 = add nsw <4 x i32> %31, %30
  %33 = shufflevector <8 x i16> %17, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %34 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %35 = sext <4 x i16> %33 to <4 x i32>
  %36 = sext <4 x i16> %34 to <4 x i32>
  %37 = add nsw <4 x i32> %36, %35
  %38 = shufflevector <8 x i16> %24, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <8 x i16> %27, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %40 = sext <4 x i16> %38 to <4 x i32>
  %41 = sext <4 x i16> %39 to <4 x i32>
  %42 = add nsw <4 x i32> %41, %40
  %43 = shufflevector <8 x i16> %24, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %44 = shufflevector <8 x i16> %27, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %45 = sext <4 x i16> %43 to <4 x i32>
  %46 = sext <4 x i16> %44 to <4 x i32>
  %47 = add nsw <4 x i32> %46, %45
  %48 = sub <8 x i16> %17, %20
  %49 = getelementptr inbounds nuw <8 x i16>, ptr %8, i64 %14
  store <8 x i16> %48, ptr %49, align 16, !tbaa !10
  %50 = sub <8 x i16> %24, %27
  %51 = getelementptr inbounds nuw <8 x i16>, ptr %8, i64 %21
  store <8 x i16> %50, ptr %51, align 16, !tbaa !10
  %52 = shufflevector <4 x i32> %37, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %53 = add nsw <4 x i32> %32, %52
  %54 = shufflevector <4 x i32> %47, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %55 = add nsw <4 x i32> %42, %54
  %56 = sub nsw <4 x i32> %32, %52
  %57 = getelementptr inbounds nuw <4 x i32>, ptr %9, i64 %14
  store <4 x i32> %56, ptr %57, align 16, !tbaa !10
  %58 = sub nsw <4 x i32> %42, %54
  %59 = getelementptr inbounds nuw <4 x i32>, ptr %9, i64 %21
  store <4 x i32> %58, ptr %59, align 16, !tbaa !10
  %60 = shufflevector <4 x i32> %53, <4 x i32> %55, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %61 = shufflevector <4 x i32> %53, <4 x i32> %55, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %62 = shufflevector <4 x i32> %61, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %63 = add nsw <4 x i32> %62, %60
  %64 = lshr exact i64 %14, 1
  %65 = getelementptr inbounds nuw <4 x i32>, ptr %10, i64 %64
  store <4 x i32> %63, ptr %65, align 16, !tbaa !10
  %66 = sub nsw <4 x i32> %60, %62
  %67 = getelementptr inbounds nuw <4 x i32>, ptr %11, i64 %64
  store <4 x i32> %66, ptr %67, align 16, !tbaa !10
  %68 = add nuw nsw i64 %14, 2
  %69 = icmp samesign ult i64 %14, 14
  br i1 %69, label %13, label %70, !llvm.loop !11

70:                                               ; preds = %13
  %71 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 32), align 2
  %72 = shufflevector <8 x i16> %71, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %73 = shufflevector <8 x i16> %71, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %74 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 96), align 2
  %75 = shufflevector <8 x i16> %74, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %76 = shufflevector <8 x i16> %74, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %77 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 160), align 2
  %78 = shufflevector <8 x i16> %77, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %79 = shufflevector <8 x i16> %77, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %80 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 224), align 2
  %81 = shufflevector <8 x i16> %80, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %82 = shufflevector <8 x i16> %80, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %83 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 288), align 2
  %84 = shufflevector <8 x i16> %83, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %85 = shufflevector <8 x i16> %83, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %86 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 352), align 2
  %87 = shufflevector <8 x i16> %86, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %88 = shufflevector <8 x i16> %86, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %89 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 416), align 2
  %90 = shufflevector <8 x i16> %89, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %91 = shufflevector <8 x i16> %89, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %92 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 480), align 2
  %93 = shufflevector <8 x i16> %92, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %94 = shufflevector <8 x i16> %92, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %95 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 64), align 2
  %96 = sext <4 x i16> %95 to <4 x i32>
  %97 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 192), align 2
  %98 = sext <4 x i16> %97 to <4 x i32>
  %99 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 320), align 2
  %100 = sext <4 x i16> %99 to <4 x i32>
  %101 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 448), align 2
  %102 = sext <4 x i16> %101 to <4 x i32>
  br label %103

103:                                              ; preds = %103, %70
  %104 = phi i64 [ 0, %70 ], [ %331, %103 ]
  %105 = phi ptr [ %12, %70 ], [ %330, %103 ]
  %106 = getelementptr inbounds nuw <8 x i16>, ptr %8, i64 %104
  %107 = load <8 x i16>, ptr %106, align 16, !tbaa !10
  %108 = shufflevector <8 x i16> %107, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %109 = getelementptr inbounds nuw i8, ptr %106, i64 16
  %110 = load <8 x i16>, ptr %109, align 16, !tbaa !10
  %111 = shufflevector <8 x i16> %110, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %112 = getelementptr inbounds nuw i8, ptr %106, i64 32
  %113 = load <8 x i16>, ptr %112, align 16, !tbaa !10
  %114 = shufflevector <8 x i16> %113, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %115 = getelementptr inbounds nuw i8, ptr %106, i64 48
  %116 = load <8 x i16>, ptr %115, align 16, !tbaa !10
  %117 = shufflevector <8 x i16> %116, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %118 = shufflevector <8 x i16> %107, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %119 = shufflevector <8 x i16> %110, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %120 = shufflevector <8 x i16> %113, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %121 = shufflevector <8 x i16> %116, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %122 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %108)
  %123 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %111)
  %124 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %114)
  %125 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %117)
  %126 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %118)
  %127 = add <4 x i32> %126, %122
  %128 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %119)
  %129 = add <4 x i32> %128, %123
  %130 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %120)
  %131 = add <4 x i32> %130, %124
  %132 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %121)
  %133 = add <4 x i32> %132, %125
  %134 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %127, <4 x i32> %129)
  %135 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %131, <4 x i32> %133)
  %136 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %134, <4 x i32> %135)
  %137 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %136, i32 3)
  %138 = getelementptr inbounds nuw i8, ptr %105, i64 32
  store <4 x i16> %137, ptr %138, align 2
  %139 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %108)
  %140 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %111)
  %141 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %114)
  %142 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %117)
  %143 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %118)
  %144 = add <4 x i32> %143, %139
  %145 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %119)
  %146 = add <4 x i32> %145, %140
  %147 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %120)
  %148 = add <4 x i32> %147, %141
  %149 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %121)
  %150 = add <4 x i32> %149, %142
  %151 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %144, <4 x i32> %146)
  %152 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %148, <4 x i32> %150)
  %153 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %151, <4 x i32> %152)
  %154 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %153, i32 3)
  %155 = getelementptr inbounds nuw i8, ptr %105, i64 96
  store <4 x i16> %154, ptr %155, align 2
  %156 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %108)
  %157 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %111)
  %158 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %114)
  %159 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %117)
  %160 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %118)
  %161 = add <4 x i32> %160, %156
  %162 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %119)
  %163 = add <4 x i32> %162, %157
  %164 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %120)
  %165 = add <4 x i32> %164, %158
  %166 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %121)
  %167 = add <4 x i32> %166, %159
  %168 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %161, <4 x i32> %163)
  %169 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %165, <4 x i32> %167)
  %170 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %168, <4 x i32> %169)
  %171 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %170, i32 3)
  %172 = getelementptr inbounds nuw i8, ptr %105, i64 160
  store <4 x i16> %171, ptr %172, align 2
  %173 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %108)
  %174 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %111)
  %175 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %114)
  %176 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %117)
  %177 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %118)
  %178 = add <4 x i32> %177, %173
  %179 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %119)
  %180 = add <4 x i32> %179, %174
  %181 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %120)
  %182 = add <4 x i32> %181, %175
  %183 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %121)
  %184 = add <4 x i32> %183, %176
  %185 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %178, <4 x i32> %180)
  %186 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %182, <4 x i32> %184)
  %187 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %185, <4 x i32> %186)
  %188 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %187, i32 3)
  %189 = getelementptr inbounds nuw i8, ptr %105, i64 224
  store <4 x i16> %188, ptr %189, align 2
  %190 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %108)
  %191 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %111)
  %192 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %114)
  %193 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %117)
  %194 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %118)
  %195 = add <4 x i32> %194, %190
  %196 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %119)
  %197 = add <4 x i32> %196, %191
  %198 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %120)
  %199 = add <4 x i32> %198, %192
  %200 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %121)
  %201 = add <4 x i32> %200, %193
  %202 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %195, <4 x i32> %197)
  %203 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %199, <4 x i32> %201)
  %204 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %202, <4 x i32> %203)
  %205 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %204, i32 3)
  %206 = getelementptr inbounds nuw i8, ptr %105, i64 288
  store <4 x i16> %205, ptr %206, align 2
  %207 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %108)
  %208 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %111)
  %209 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %114)
  %210 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %117)
  %211 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %118)
  %212 = add <4 x i32> %211, %207
  %213 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %119)
  %214 = add <4 x i32> %213, %208
  %215 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %120)
  %216 = add <4 x i32> %215, %209
  %217 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %121)
  %218 = add <4 x i32> %217, %210
  %219 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %212, <4 x i32> %214)
  %220 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %216, <4 x i32> %218)
  %221 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %219, <4 x i32> %220)
  %222 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %221, i32 3)
  %223 = getelementptr inbounds nuw i8, ptr %105, i64 352
  store <4 x i16> %222, ptr %223, align 2
  %224 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %108)
  %225 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %111)
  %226 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %114)
  %227 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %117)
  %228 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %118)
  %229 = add <4 x i32> %228, %224
  %230 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %119)
  %231 = add <4 x i32> %230, %225
  %232 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %120)
  %233 = add <4 x i32> %232, %226
  %234 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %121)
  %235 = add <4 x i32> %234, %227
  %236 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %229, <4 x i32> %231)
  %237 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %233, <4 x i32> %235)
  %238 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %236, <4 x i32> %237)
  %239 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %238, i32 3)
  %240 = getelementptr inbounds nuw i8, ptr %105, i64 416
  store <4 x i16> %239, ptr %240, align 2
  %241 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %108)
  %242 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %111)
  %243 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %114)
  %244 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %117)
  %245 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %118)
  %246 = add <4 x i32> %245, %241
  %247 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %119)
  %248 = add <4 x i32> %247, %242
  %249 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %120)
  %250 = add <4 x i32> %249, %243
  %251 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %121)
  %252 = add <4 x i32> %251, %244
  %253 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %246, <4 x i32> %248)
  %254 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %250, <4 x i32> %252)
  %255 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %253, <4 x i32> %254)
  %256 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %255, i32 3)
  %257 = getelementptr inbounds nuw i8, ptr %105, i64 480
  store <4 x i16> %256, ptr %257, align 2
  %258 = getelementptr inbounds nuw <4 x i32>, ptr %9, i64 %104
  %259 = load <4 x i32>, ptr %258, align 16, !tbaa !10
  %260 = getelementptr inbounds nuw i8, ptr %258, i64 16
  %261 = load <4 x i32>, ptr %260, align 16, !tbaa !10
  %262 = getelementptr inbounds nuw i8, ptr %258, i64 32
  %263 = load <4 x i32>, ptr %262, align 16, !tbaa !10
  %264 = getelementptr inbounds nuw i8, ptr %258, i64 48
  %265 = load <4 x i32>, ptr %264, align 16, !tbaa !10
  %266 = mul <4 x i32> %259, %96
  %267 = mul <4 x i32> %261, %96
  %268 = mul <4 x i32> %263, %96
  %269 = mul <4 x i32> %265, %96
  %270 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %266, <4 x i32> %267)
  %271 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %268, <4 x i32> %269)
  %272 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %270, <4 x i32> %271)
  %273 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %272, i32 3)
  %274 = getelementptr inbounds nuw i8, ptr %105, i64 64
  store <4 x i16> %273, ptr %274, align 2
  %275 = mul <4 x i32> %259, %98
  %276 = mul <4 x i32> %261, %98
  %277 = mul <4 x i32> %263, %98
  %278 = mul <4 x i32> %265, %98
  %279 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %275, <4 x i32> %276)
  %280 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %277, <4 x i32> %278)
  %281 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %279, <4 x i32> %280)
  %282 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %281, i32 3)
  %283 = getelementptr inbounds nuw i8, ptr %105, i64 192
  store <4 x i16> %282, ptr %283, align 2
  %284 = mul <4 x i32> %259, %100
  %285 = mul <4 x i32> %261, %100
  %286 = mul <4 x i32> %263, %100
  %287 = mul <4 x i32> %265, %100
  %288 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %284, <4 x i32> %285)
  %289 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %286, <4 x i32> %287)
  %290 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %288, <4 x i32> %289)
  %291 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %290, i32 3)
  %292 = getelementptr inbounds nuw i8, ptr %105, i64 320
  store <4 x i16> %291, ptr %292, align 2
  %293 = mul <4 x i32> %259, %102
  %294 = mul <4 x i32> %261, %102
  %295 = mul <4 x i32> %263, %102
  %296 = mul <4 x i32> %265, %102
  %297 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %293, <4 x i32> %294)
  %298 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %295, <4 x i32> %296)
  %299 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %297, <4 x i32> %298)
  %300 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %299, i32 3)
  %301 = getelementptr inbounds nuw i8, ptr %105, i64 448
  store <4 x i16> %300, ptr %301, align 2
  %302 = lshr exact i64 %104, 1
  %303 = getelementptr inbounds nuw <4 x i32>, ptr %10, i64 %302
  %304 = load <4 x i32>, ptr %303, align 16, !tbaa !10
  %305 = or disjoint i64 %302, 1
  %306 = getelementptr inbounds nuw <4 x i32>, ptr %10, i64 %305
  %307 = load <4 x i32>, ptr %306, align 16, !tbaa !10
  %308 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %304, <4 x i32> %307)
  %309 = shl <4 x i32> %308, splat (i32 6)
  %310 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %309, i32 3)
  store <4 x i16> %310, ptr %105, align 2
  %311 = getelementptr inbounds nuw <4 x i32>, ptr %11, i64 %302
  %312 = load <4 x i32>, ptr %311, align 16, !tbaa !10
  %313 = mul <4 x i32> %312, <i32 83, i32 36, i32 83, i32 36>
  %314 = getelementptr inbounds nuw <4 x i32>, ptr %11, i64 %305
  %315 = load <4 x i32>, ptr %314, align 16, !tbaa !10
  %316 = mul <4 x i32> %315, <i32 83, i32 36, i32 83, i32 36>
  %317 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %313, <4 x i32> %316)
  %318 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %317, i32 3)
  %319 = getelementptr inbounds nuw i8, ptr %105, i64 128
  store <4 x i16> %318, ptr %319, align 2
  %320 = mul <4 x i32> %304, <i32 64, i32 -64, i32 64, i32 -64>
  %321 = mul <4 x i32> %307, <i32 64, i32 -64, i32 64, i32 -64>
  %322 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %320, <4 x i32> %321)
  %323 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %322, i32 3)
  %324 = getelementptr inbounds nuw i8, ptr %105, i64 256
  store <4 x i16> %323, ptr %324, align 2
  %325 = mul <4 x i32> %312, <i32 36, i32 -83, i32 36, i32 -83>
  %326 = mul <4 x i32> %315, <i32 36, i32 -83, i32 36, i32 -83>
  %327 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %325, <4 x i32> %326)
  %328 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %327, i32 3)
  %329 = getelementptr inbounds nuw i8, ptr %105, i64 384
  store <4 x i16> %328, ptr %329, align 2
  %330 = getelementptr inbounds nuw i8, ptr %105, i64 8
  %331 = add nuw nsw i64 %104, 4
  %332 = icmp samesign ult i64 %104, 12
  br i1 %332, label %103, label %333, !llvm.loop !13

333:                                              ; preds = %103
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #10
  br label %334

334:                                              ; preds = %334, %333
  %335 = phi i64 [ 0, %333 ], [ %389, %334 ]
  %336 = shl nuw nsw i64 %335, 5
  %337 = getelementptr inbounds nuw i8, ptr %12, i64 %336
  %338 = load <8 x i16>, ptr %337, align 32
  %339 = getelementptr inbounds nuw i8, ptr %337, i64 16
  %340 = load <8 x i16>, ptr %339, align 16
  %341 = shufflevector <8 x i16> %340, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %342 = or disjoint i64 %335, 1
  %343 = shl nuw nsw i64 %342, 5
  %344 = getelementptr inbounds nuw i8, ptr %12, i64 %343
  %345 = load <8 x i16>, ptr %344, align 32
  %346 = getelementptr inbounds nuw i8, ptr %344, i64 16
  %347 = load <8 x i16>, ptr %346, align 16
  %348 = shufflevector <8 x i16> %347, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %349 = shufflevector <8 x i16> %338, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %350 = shufflevector <8 x i16> %341, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %351 = sext <4 x i16> %349 to <4 x i32>
  %352 = sext <4 x i16> %350 to <4 x i32>
  %353 = add nsw <4 x i32> %352, %351
  %354 = shufflevector <8 x i16> %338, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %355 = shufflevector <8 x i16> %341, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %356 = sext <4 x i16> %354 to <4 x i32>
  %357 = sext <4 x i16> %355 to <4 x i32>
  %358 = add nsw <4 x i32> %357, %356
  %359 = shufflevector <8 x i16> %345, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %360 = shufflevector <8 x i16> %348, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %361 = sext <4 x i16> %359 to <4 x i32>
  %362 = sext <4 x i16> %360 to <4 x i32>
  %363 = add nsw <4 x i32> %362, %361
  %364 = shufflevector <8 x i16> %345, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %365 = shufflevector <8 x i16> %348, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %366 = sext <4 x i16> %364 to <4 x i32>
  %367 = sext <4 x i16> %365 to <4 x i32>
  %368 = add nsw <4 x i32> %367, %366
  %369 = sub <8 x i16> %338, %341
  %370 = getelementptr inbounds nuw <8 x i16>, ptr %4, i64 %335
  store <8 x i16> %369, ptr %370, align 16, !tbaa !10
  %371 = sub <8 x i16> %345, %348
  %372 = getelementptr inbounds nuw <8 x i16>, ptr %4, i64 %342
  store <8 x i16> %371, ptr %372, align 16, !tbaa !10
  %373 = shufflevector <4 x i32> %358, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %374 = add nsw <4 x i32> %353, %373
  %375 = shufflevector <4 x i32> %368, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %376 = add nsw <4 x i32> %363, %375
  %377 = sub nsw <4 x i32> %353, %373
  %378 = getelementptr inbounds nuw <4 x i32>, ptr %5, i64 %335
  store <4 x i32> %377, ptr %378, align 16, !tbaa !10
  %379 = sub nsw <4 x i32> %363, %375
  %380 = getelementptr inbounds nuw <4 x i32>, ptr %5, i64 %342
  store <4 x i32> %379, ptr %380, align 16, !tbaa !10
  %381 = shufflevector <4 x i32> %374, <4 x i32> %376, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %382 = shufflevector <4 x i32> %374, <4 x i32> %376, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %383 = shufflevector <4 x i32> %382, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %384 = add nsw <4 x i32> %383, %381
  %385 = lshr exact i64 %335, 1
  %386 = getelementptr inbounds nuw <4 x i32>, ptr %6, i64 %385
  store <4 x i32> %384, ptr %386, align 16, !tbaa !10
  %387 = sub nsw <4 x i32> %381, %383
  %388 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %385
  store <4 x i32> %387, ptr %388, align 16, !tbaa !10
  %389 = add nuw nsw i64 %335, 2
  %390 = icmp samesign ult i64 %335, 14
  br i1 %390, label %334, label %391, !llvm.loop !14

391:                                              ; preds = %334, %391
  %392 = phi i64 [ %619, %391 ], [ 0, %334 ]
  %393 = phi ptr [ %618, %391 ], [ %1, %334 ]
  %394 = getelementptr inbounds nuw <8 x i16>, ptr %4, i64 %392
  %395 = load <8 x i16>, ptr %394, align 16, !tbaa !10
  %396 = shufflevector <8 x i16> %395, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %397 = getelementptr inbounds nuw i8, ptr %394, i64 16
  %398 = load <8 x i16>, ptr %397, align 16, !tbaa !10
  %399 = shufflevector <8 x i16> %398, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %400 = getelementptr inbounds nuw i8, ptr %394, i64 32
  %401 = load <8 x i16>, ptr %400, align 16, !tbaa !10
  %402 = shufflevector <8 x i16> %401, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %403 = getelementptr inbounds nuw i8, ptr %394, i64 48
  %404 = load <8 x i16>, ptr %403, align 16, !tbaa !10
  %405 = shufflevector <8 x i16> %404, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %406 = shufflevector <8 x i16> %395, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %407 = shufflevector <8 x i16> %398, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %408 = shufflevector <8 x i16> %401, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %409 = shufflevector <8 x i16> %404, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %410 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %396)
  %411 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %399)
  %412 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %402)
  %413 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %72, <4 x i16> %405)
  %414 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %406)
  %415 = add <4 x i32> %414, %410
  %416 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %407)
  %417 = add <4 x i32> %416, %411
  %418 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %408)
  %419 = add <4 x i32> %418, %412
  %420 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %73, <4 x i16> %409)
  %421 = add <4 x i32> %420, %413
  %422 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %415, <4 x i32> %417)
  %423 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %419, <4 x i32> %421)
  %424 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %422, <4 x i32> %423)
  %425 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %424, i32 10)
  %426 = getelementptr inbounds nuw i8, ptr %393, i64 32
  store <4 x i16> %425, ptr %426, align 2
  %427 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %396)
  %428 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %399)
  %429 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %402)
  %430 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %75, <4 x i16> %405)
  %431 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %406)
  %432 = add <4 x i32> %431, %427
  %433 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %407)
  %434 = add <4 x i32> %433, %428
  %435 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %408)
  %436 = add <4 x i32> %435, %429
  %437 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %76, <4 x i16> %409)
  %438 = add <4 x i32> %437, %430
  %439 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %432, <4 x i32> %434)
  %440 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %436, <4 x i32> %438)
  %441 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %439, <4 x i32> %440)
  %442 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %441, i32 10)
  %443 = getelementptr inbounds nuw i8, ptr %393, i64 96
  store <4 x i16> %442, ptr %443, align 2
  %444 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %396)
  %445 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %399)
  %446 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %402)
  %447 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %405)
  %448 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %406)
  %449 = add <4 x i32> %448, %444
  %450 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %407)
  %451 = add <4 x i32> %450, %445
  %452 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %408)
  %453 = add <4 x i32> %452, %446
  %454 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %79, <4 x i16> %409)
  %455 = add <4 x i32> %454, %447
  %456 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %449, <4 x i32> %451)
  %457 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %453, <4 x i32> %455)
  %458 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %456, <4 x i32> %457)
  %459 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %458, i32 10)
  %460 = getelementptr inbounds nuw i8, ptr %393, i64 160
  store <4 x i16> %459, ptr %460, align 2
  %461 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %396)
  %462 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %399)
  %463 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %402)
  %464 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %81, <4 x i16> %405)
  %465 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %406)
  %466 = add <4 x i32> %465, %461
  %467 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %407)
  %468 = add <4 x i32> %467, %462
  %469 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %408)
  %470 = add <4 x i32> %469, %463
  %471 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %82, <4 x i16> %409)
  %472 = add <4 x i32> %471, %464
  %473 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %466, <4 x i32> %468)
  %474 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %470, <4 x i32> %472)
  %475 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %473, <4 x i32> %474)
  %476 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %475, i32 10)
  %477 = getelementptr inbounds nuw i8, ptr %393, i64 224
  store <4 x i16> %476, ptr %477, align 2
  %478 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %396)
  %479 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %399)
  %480 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %402)
  %481 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %84, <4 x i16> %405)
  %482 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %406)
  %483 = add <4 x i32> %482, %478
  %484 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %407)
  %485 = add <4 x i32> %484, %479
  %486 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %408)
  %487 = add <4 x i32> %486, %480
  %488 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %85, <4 x i16> %409)
  %489 = add <4 x i32> %488, %481
  %490 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %483, <4 x i32> %485)
  %491 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %487, <4 x i32> %489)
  %492 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %490, <4 x i32> %491)
  %493 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %492, i32 10)
  %494 = getelementptr inbounds nuw i8, ptr %393, i64 288
  store <4 x i16> %493, ptr %494, align 2
  %495 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %396)
  %496 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %399)
  %497 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %402)
  %498 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %87, <4 x i16> %405)
  %499 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %406)
  %500 = add <4 x i32> %499, %495
  %501 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %407)
  %502 = add <4 x i32> %501, %496
  %503 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %408)
  %504 = add <4 x i32> %503, %497
  %505 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %88, <4 x i16> %409)
  %506 = add <4 x i32> %505, %498
  %507 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %500, <4 x i32> %502)
  %508 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %504, <4 x i32> %506)
  %509 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %507, <4 x i32> %508)
  %510 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %509, i32 10)
  %511 = getelementptr inbounds nuw i8, ptr %393, i64 352
  store <4 x i16> %510, ptr %511, align 2
  %512 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %396)
  %513 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %399)
  %514 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %402)
  %515 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %90, <4 x i16> %405)
  %516 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %406)
  %517 = add <4 x i32> %516, %512
  %518 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %407)
  %519 = add <4 x i32> %518, %513
  %520 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %408)
  %521 = add <4 x i32> %520, %514
  %522 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %91, <4 x i16> %409)
  %523 = add <4 x i32> %522, %515
  %524 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %517, <4 x i32> %519)
  %525 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %521, <4 x i32> %523)
  %526 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %524, <4 x i32> %525)
  %527 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %526, i32 10)
  %528 = getelementptr inbounds nuw i8, ptr %393, i64 416
  store <4 x i16> %527, ptr %528, align 2
  %529 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %396)
  %530 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %399)
  %531 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %402)
  %532 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %93, <4 x i16> %405)
  %533 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %406)
  %534 = add <4 x i32> %533, %529
  %535 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %407)
  %536 = add <4 x i32> %535, %530
  %537 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %408)
  %538 = add <4 x i32> %537, %531
  %539 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %94, <4 x i16> %409)
  %540 = add <4 x i32> %539, %532
  %541 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %534, <4 x i32> %536)
  %542 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %538, <4 x i32> %540)
  %543 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %541, <4 x i32> %542)
  %544 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %543, i32 10)
  %545 = getelementptr inbounds nuw i8, ptr %393, i64 480
  store <4 x i16> %544, ptr %545, align 2
  %546 = getelementptr inbounds nuw <4 x i32>, ptr %5, i64 %392
  %547 = load <4 x i32>, ptr %546, align 16, !tbaa !10
  %548 = getelementptr inbounds nuw i8, ptr %546, i64 16
  %549 = load <4 x i32>, ptr %548, align 16, !tbaa !10
  %550 = getelementptr inbounds nuw i8, ptr %546, i64 32
  %551 = load <4 x i32>, ptr %550, align 16, !tbaa !10
  %552 = getelementptr inbounds nuw i8, ptr %546, i64 48
  %553 = load <4 x i32>, ptr %552, align 16, !tbaa !10
  %554 = mul <4 x i32> %547, %96
  %555 = mul <4 x i32> %549, %96
  %556 = mul <4 x i32> %551, %96
  %557 = mul <4 x i32> %553, %96
  %558 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %554, <4 x i32> %555)
  %559 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %556, <4 x i32> %557)
  %560 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %558, <4 x i32> %559)
  %561 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %560, i32 10)
  %562 = getelementptr inbounds nuw i8, ptr %393, i64 64
  store <4 x i16> %561, ptr %562, align 2
  %563 = mul <4 x i32> %547, %98
  %564 = mul <4 x i32> %549, %98
  %565 = mul <4 x i32> %551, %98
  %566 = mul <4 x i32> %553, %98
  %567 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %563, <4 x i32> %564)
  %568 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %565, <4 x i32> %566)
  %569 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %567, <4 x i32> %568)
  %570 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %569, i32 10)
  %571 = getelementptr inbounds nuw i8, ptr %393, i64 192
  store <4 x i16> %570, ptr %571, align 2
  %572 = mul <4 x i32> %547, %100
  %573 = mul <4 x i32> %549, %100
  %574 = mul <4 x i32> %551, %100
  %575 = mul <4 x i32> %553, %100
  %576 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %572, <4 x i32> %573)
  %577 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %574, <4 x i32> %575)
  %578 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %576, <4 x i32> %577)
  %579 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %578, i32 10)
  %580 = getelementptr inbounds nuw i8, ptr %393, i64 320
  store <4 x i16> %579, ptr %580, align 2
  %581 = mul <4 x i32> %547, %102
  %582 = mul <4 x i32> %549, %102
  %583 = mul <4 x i32> %551, %102
  %584 = mul <4 x i32> %553, %102
  %585 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %581, <4 x i32> %582)
  %586 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %583, <4 x i32> %584)
  %587 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %585, <4 x i32> %586)
  %588 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %587, i32 10)
  %589 = getelementptr inbounds nuw i8, ptr %393, i64 448
  store <4 x i16> %588, ptr %589, align 2
  %590 = lshr exact i64 %392, 1
  %591 = getelementptr inbounds nuw <4 x i32>, ptr %6, i64 %590
  %592 = load <4 x i32>, ptr %591, align 16, !tbaa !10
  %593 = or disjoint i64 %590, 1
  %594 = getelementptr inbounds nuw <4 x i32>, ptr %6, i64 %593
  %595 = load <4 x i32>, ptr %594, align 16, !tbaa !10
  %596 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %592, <4 x i32> %595)
  %597 = shl <4 x i32> %596, splat (i32 6)
  %598 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %597, i32 10)
  store <4 x i16> %598, ptr %393, align 2
  %599 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %590
  %600 = load <4 x i32>, ptr %599, align 16, !tbaa !10
  %601 = mul <4 x i32> %600, <i32 83, i32 36, i32 83, i32 36>
  %602 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %593
  %603 = load <4 x i32>, ptr %602, align 16, !tbaa !10
  %604 = mul <4 x i32> %603, <i32 83, i32 36, i32 83, i32 36>
  %605 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %601, <4 x i32> %604)
  %606 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %605, i32 10)
  %607 = getelementptr inbounds nuw i8, ptr %393, i64 128
  store <4 x i16> %606, ptr %607, align 2
  %608 = mul <4 x i32> %592, <i32 64, i32 -64, i32 64, i32 -64>
  %609 = mul <4 x i32> %595, <i32 64, i32 -64, i32 64, i32 -64>
  %610 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %608, <4 x i32> %609)
  %611 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %610, i32 10)
  %612 = getelementptr inbounds nuw i8, ptr %393, i64 256
  store <4 x i16> %611, ptr %612, align 2
  %613 = mul <4 x i32> %600, <i32 36, i32 -83, i32 36, i32 -83>
  %614 = mul <4 x i32> %603, <i32 36, i32 -83, i32 36, i32 -83>
  %615 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %613, <4 x i32> %614)
  %616 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %615, i32 10)
  %617 = getelementptr inbounds nuw i8, ptr %393, i64 384
  store <4 x i16> %616, ptr %617, align 2
  %618 = getelementptr inbounds nuw i8, ptr %393, i64 8
  %619 = add nuw nsw i64 %392, 4
  %620 = icmp samesign ult i64 %392, 12
  br i1 %620, label %391, label %621, !llvm.loop !15

621:                                              ; preds = %391
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %12) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26510dct32_neonEPKsPsl(ptr noundef %0, ptr noundef writeonly captures(none) %1, i64 noundef %2) #2 {
  %4 = alloca [32 x [2 x <8 x i16>]], align 16
  %5 = alloca [32 x [2 x <4 x i32>]], align 16
  %6 = alloca [32 x <4 x i32>], align 16
  %7 = alloca [16 x <4 x i32>], align 16
  %8 = alloca [16 x <4 x i32>], align 16
  %9 = alloca [32 x [2 x <8 x i16>]], align 16
  %10 = alloca [32 x [2 x <4 x i32>]], align 16
  %11 = alloca [32 x <4 x i32>], align 16
  %12 = alloca [16 x <4 x i32>], align 16
  %13 = alloca [16 x <4 x i32>], align 16
  %14 = alloca [1024 x i16], align 32
  call void @llvm.lifetime.start.p0(ptr nonnull %14) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %12) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %13) #10
  br label %15

15:                                               ; preds = %15, %3
  %16 = phi i64 [ 0, %3 ], [ %116, %15 ]
  %17 = mul nsw i64 %16, %2
  %18 = getelementptr inbounds i16, ptr %0, i64 %17
  %19 = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.aarch64.neon.ld1x4.v8i16.p0(ptr %18)
  %20 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %19, 0
  %21 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %19, 1
  %22 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %19, 2
  %23 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %19, 3
  %24 = shufflevector <8 x i16> %22, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %25 = shufflevector <8 x i16> %23, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %26 = or disjoint i64 %16, 1
  %27 = mul nsw i64 %26, %2
  %28 = getelementptr inbounds i16, ptr %0, i64 %27
  %29 = tail call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.aarch64.neon.ld1x4.v8i16.p0(ptr %28)
  %30 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %29, 0
  %31 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %29, 1
  %32 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %29, 2
  %33 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %29, 3
  %34 = shufflevector <8 x i16> %32, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %35 = shufflevector <8 x i16> %33, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %36 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <8 x i16> %25, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = sext <4 x i16> %36 to <4 x i32>
  %39 = sext <4 x i16> %37 to <4 x i32>
  %40 = add nsw <4 x i32> %39, %38
  %41 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %42 = shufflevector <8 x i16> %25, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %43 = sext <4 x i16> %41 to <4 x i32>
  %44 = sext <4 x i16> %42 to <4 x i32>
  %45 = add nsw <4 x i32> %44, %43
  %46 = shufflevector <8 x i16> %21, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %47 = shufflevector <8 x i16> %24, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %48 = sext <4 x i16> %46 to <4 x i32>
  %49 = sext <4 x i16> %47 to <4 x i32>
  %50 = add nsw <4 x i32> %49, %48
  %51 = shufflevector <8 x i16> %21, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %52 = shufflevector <8 x i16> %24, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %53 = sext <4 x i16> %51 to <4 x i32>
  %54 = sext <4 x i16> %52 to <4 x i32>
  %55 = add nsw <4 x i32> %54, %53
  %56 = shufflevector <8 x i16> %30, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %57 = shufflevector <8 x i16> %35, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %58 = sext <4 x i16> %56 to <4 x i32>
  %59 = sext <4 x i16> %57 to <4 x i32>
  %60 = add nsw <4 x i32> %59, %58
  %61 = shufflevector <8 x i16> %30, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %62 = shufflevector <8 x i16> %35, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %63 = sext <4 x i16> %61 to <4 x i32>
  %64 = sext <4 x i16> %62 to <4 x i32>
  %65 = add nsw <4 x i32> %64, %63
  %66 = shufflevector <8 x i16> %31, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %67 = shufflevector <8 x i16> %34, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %68 = sext <4 x i16> %66 to <4 x i32>
  %69 = sext <4 x i16> %67 to <4 x i32>
  %70 = add nsw <4 x i32> %69, %68
  %71 = shufflevector <8 x i16> %31, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %72 = shufflevector <8 x i16> %34, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %73 = sext <4 x i16> %71 to <4 x i32>
  %74 = sext <4 x i16> %72 to <4 x i32>
  %75 = add nsw <4 x i32> %74, %73
  %76 = sub <8 x i16> %20, %25
  %77 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %9, i64 %16
  store <8 x i16> %76, ptr %77, align 16, !tbaa !10
  %78 = sub <8 x i16> %21, %24
  %79 = getelementptr inbounds nuw i8, ptr %77, i64 16
  store <8 x i16> %78, ptr %79, align 16, !tbaa !10
  %80 = sub <8 x i16> %30, %35
  %81 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %9, i64 %26
  store <8 x i16> %80, ptr %81, align 16, !tbaa !10
  %82 = sub <8 x i16> %31, %34
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 16
  store <8 x i16> %82, ptr %83, align 16, !tbaa !10
  %84 = shufflevector <4 x i32> %55, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %85 = shufflevector <4 x i32> %50, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %86 = add nsw <4 x i32> %40, %84
  %87 = sub nsw <4 x i32> %40, %84
  %88 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %10, i64 %16
  store <4 x i32> %87, ptr %88, align 16, !tbaa !10
  %89 = sub nsw <4 x i32> %45, %85
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 16
  store <4 x i32> %89, ptr %90, align 16, !tbaa !10
  %91 = shufflevector <4 x i32> %75, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %92 = shufflevector <4 x i32> %70, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %93 = add nsw <4 x i32> %60, %91
  %94 = sub nsw <4 x i32> %60, %91
  %95 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %10, i64 %26
  store <4 x i32> %94, ptr %95, align 16, !tbaa !10
  %96 = sub nsw <4 x i32> %65, %92
  %97 = getelementptr inbounds nuw i8, ptr %95, i64 16
  store <4 x i32> %96, ptr %97, align 16, !tbaa !10
  %98 = shufflevector <4 x i32> %45, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %99 = add nsw <4 x i32> %98, %50
  %100 = add nsw <4 x i32> %86, %99
  %101 = sub nsw <4 x i32> %86, %99
  %102 = getelementptr inbounds nuw <4 x i32>, ptr %11, i64 %16
  store <4 x i32> %101, ptr %102, align 16, !tbaa !10
  %103 = shufflevector <4 x i32> %65, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %104 = add nsw <4 x i32> %103, %70
  %105 = add nsw <4 x i32> %93, %104
  %106 = sub nsw <4 x i32> %93, %104
  %107 = getelementptr inbounds nuw <4 x i32>, ptr %11, i64 %26
  store <4 x i32> %106, ptr %107, align 16, !tbaa !10
  %108 = shufflevector <4 x i32> %100, <4 x i32> %105, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %109 = shufflevector <4 x i32> %100, <4 x i32> %105, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %110 = shufflevector <4 x i32> %109, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %111 = add <4 x i32> %110, %108
  %112 = lshr exact i64 %16, 1
  %113 = getelementptr inbounds nuw <4 x i32>, ptr %12, i64 %112
  store <4 x i32> %111, ptr %113, align 16, !tbaa !10
  %114 = sub <4 x i32> %108, %110
  %115 = getelementptr inbounds nuw <4 x i32>, ptr %13, i64 %112
  store <4 x i32> %114, ptr %115, align 16, !tbaa !10
  %116 = add nuw nsw i64 %16, 2
  %117 = icmp samesign ult i64 %16, 30
  br i1 %117, label %15, label %118, !llvm.loop !16

118:                                              ; preds = %15, %130
  %119 = phi i64 [ %131, %130 ], [ 1, %15 ]
  %120 = shl nuw nsw i64 %119, 6
  %121 = getelementptr inbounds nuw i8, ptr %14, i64 %120
  %122 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %119
  %123 = load <8 x i16>, ptr %122, align 2
  %124 = getelementptr inbounds nuw i8, ptr %122, i64 16
  %125 = load <8 x i16>, ptr %124, align 2
  %126 = shufflevector <8 x i16> %123, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %127 = shufflevector <8 x i16> %123, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %128 = shufflevector <8 x i16> %125, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %129 = shufflevector <8 x i16> %125, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  br label %133

130:                                              ; preds = %133
  %131 = add nuw nsw i64 %119, 2
  %132 = icmp samesign ult i64 %119, 30
  br i1 %132, label %118, label %203, !llvm.loop !17

133:                                              ; preds = %133, %118
  %134 = phi i64 [ 0, %118 ], [ %201, %133 ]
  %135 = phi ptr [ %121, %118 ], [ %200, %133 ]
  %136 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %9, i64 %134
  %137 = load <8 x i16>, ptr %136, align 16, !tbaa !10
  %138 = shufflevector <8 x i16> %137, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %139 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %126, <4 x i16> %138)
  %140 = shufflevector <8 x i16> %137, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %141 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %127, <4 x i16> %140)
  %142 = add <4 x i32> %141, %139
  %143 = getelementptr inbounds nuw i8, ptr %136, i64 16
  %144 = load <8 x i16>, ptr %143, align 16, !tbaa !10
  %145 = shufflevector <8 x i16> %144, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %146 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %145)
  %147 = add <4 x i32> %142, %146
  %148 = shufflevector <8 x i16> %144, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %149 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %129, <4 x i16> %148)
  %150 = add <4 x i32> %147, %149
  %151 = getelementptr inbounds nuw i8, ptr %136, i64 32
  %152 = load <8 x i16>, ptr %151, align 16, !tbaa !10
  %153 = shufflevector <8 x i16> %152, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %154 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %126, <4 x i16> %153)
  %155 = shufflevector <8 x i16> %152, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %156 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %127, <4 x i16> %155)
  %157 = add <4 x i32> %156, %154
  %158 = getelementptr inbounds nuw i8, ptr %136, i64 48
  %159 = load <8 x i16>, ptr %158, align 16, !tbaa !10
  %160 = shufflevector <8 x i16> %159, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %161 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %160)
  %162 = add <4 x i32> %157, %161
  %163 = shufflevector <8 x i16> %159, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %164 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %129, <4 x i16> %163)
  %165 = add <4 x i32> %162, %164
  %166 = getelementptr inbounds nuw i8, ptr %136, i64 64
  %167 = load <8 x i16>, ptr %166, align 16, !tbaa !10
  %168 = shufflevector <8 x i16> %167, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %169 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %126, <4 x i16> %168)
  %170 = shufflevector <8 x i16> %167, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %171 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %127, <4 x i16> %170)
  %172 = add <4 x i32> %171, %169
  %173 = getelementptr inbounds nuw i8, ptr %136, i64 80
  %174 = load <8 x i16>, ptr %173, align 16, !tbaa !10
  %175 = shufflevector <8 x i16> %174, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %176 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %175)
  %177 = add <4 x i32> %172, %176
  %178 = shufflevector <8 x i16> %174, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %179 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %129, <4 x i16> %178)
  %180 = add <4 x i32> %177, %179
  %181 = getelementptr inbounds nuw i8, ptr %136, i64 96
  %182 = load <8 x i16>, ptr %181, align 16, !tbaa !10
  %183 = shufflevector <8 x i16> %182, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %184 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %126, <4 x i16> %183)
  %185 = shufflevector <8 x i16> %182, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %186 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %127, <4 x i16> %185)
  %187 = add <4 x i32> %186, %184
  %188 = getelementptr inbounds nuw i8, ptr %136, i64 112
  %189 = load <8 x i16>, ptr %188, align 16, !tbaa !10
  %190 = shufflevector <8 x i16> %189, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %191 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %190)
  %192 = add <4 x i32> %187, %191
  %193 = shufflevector <8 x i16> %189, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %194 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %129, <4 x i16> %193)
  %195 = add <4 x i32> %192, %194
  %196 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %150, <4 x i32> %165)
  %197 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %180, <4 x i32> %195)
  %198 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %196, <4 x i32> %197)
  %199 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %198, i32 4)
  store <4 x i16> %199, ptr %135, align 2
  %200 = getelementptr inbounds nuw i8, ptr %135, i64 8
  %201 = add nuw nsw i64 %134, 4
  %202 = icmp samesign ult i64 %134, 28
  br i1 %202, label %133, label %130, !llvm.loop !18

203:                                              ; preds = %130, %213
  %204 = phi i64 [ %214, %213 ], [ 2, %130 ]
  %205 = shl nuw nsw i64 %204, 6
  %206 = getelementptr inbounds nuw i8, ptr %14, i64 %205
  %207 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %204
  %208 = load <4 x i16>, ptr %207, align 2
  %209 = sext <4 x i16> %208 to <4 x i32>
  %210 = getelementptr inbounds nuw i8, ptr %207, i64 8
  %211 = load <4 x i16>, ptr %210, align 2
  %212 = sext <4 x i16> %211 to <4 x i32>
  br label %280

213:                                              ; preds = %280
  %214 = add nuw nsw i64 %204, 4
  %215 = icmp samesign ult i64 %204, 28
  br i1 %215, label %203, label %216, !llvm.loop !19

216:                                              ; preds = %213
  %217 = getelementptr inbounds nuw i8, ptr %11, i64 192
  %218 = load <4 x i32>, ptr %217, align 16, !tbaa !10
  %219 = getelementptr inbounds nuw i8, ptr %11, i64 208
  %220 = load <4 x i32>, ptr %219, align 16, !tbaa !10
  %221 = getelementptr inbounds nuw i8, ptr %11, i64 224
  %222 = load <4 x i32>, ptr %221, align 16, !tbaa !10
  %223 = getelementptr inbounds nuw i8, ptr %11, i64 240
  %224 = load <4 x i32>, ptr %223, align 16, !tbaa !10
  %225 = getelementptr inbounds nuw i8, ptr %11, i64 256
  %226 = load <4 x i32>, ptr %225, align 16, !tbaa !10
  %227 = getelementptr inbounds nuw i8, ptr %11, i64 272
  %228 = load <4 x i32>, ptr %227, align 16, !tbaa !10
  %229 = getelementptr inbounds nuw i8, ptr %11, i64 288
  %230 = load <4 x i32>, ptr %229, align 16, !tbaa !10
  %231 = getelementptr inbounds nuw i8, ptr %11, i64 304
  %232 = load <4 x i32>, ptr %231, align 16, !tbaa !10
  %233 = getelementptr inbounds nuw i8, ptr %11, i64 320
  %234 = load <4 x i32>, ptr %233, align 16, !tbaa !10
  %235 = getelementptr inbounds nuw i8, ptr %11, i64 336
  %236 = load <4 x i32>, ptr %235, align 16, !tbaa !10
  %237 = getelementptr inbounds nuw i8, ptr %11, i64 352
  %238 = load <4 x i32>, ptr %237, align 16, !tbaa !10
  %239 = getelementptr inbounds nuw i8, ptr %11, i64 368
  %240 = load <4 x i32>, ptr %239, align 16, !tbaa !10
  %241 = load <4 x i32>, ptr %11, align 16, !tbaa !10
  %242 = getelementptr inbounds nuw i8, ptr %11, i64 16
  %243 = load <4 x i32>, ptr %242, align 16, !tbaa !10
  %244 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %245 = load <4 x i32>, ptr %244, align 16, !tbaa !10
  %246 = getelementptr inbounds nuw i8, ptr %11, i64 48
  %247 = load <4 x i32>, ptr %246, align 16, !tbaa !10
  %248 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %249 = load <4 x i32>, ptr %248, align 16, !tbaa !10
  %250 = getelementptr inbounds nuw i8, ptr %11, i64 80
  %251 = load <4 x i32>, ptr %250, align 16, !tbaa !10
  %252 = getelementptr inbounds nuw i8, ptr %11, i64 96
  %253 = load <4 x i32>, ptr %252, align 16, !tbaa !10
  %254 = getelementptr inbounds nuw i8, ptr %11, i64 112
  %255 = load <4 x i32>, ptr %254, align 16, !tbaa !10
  %256 = getelementptr inbounds nuw i8, ptr %11, i64 128
  %257 = load <4 x i32>, ptr %256, align 16, !tbaa !10
  %258 = getelementptr inbounds nuw i8, ptr %11, i64 144
  %259 = load <4 x i32>, ptr %258, align 16, !tbaa !10
  %260 = getelementptr inbounds nuw i8, ptr %11, i64 160
  %261 = load <4 x i32>, ptr %260, align 16, !tbaa !10
  %262 = getelementptr inbounds nuw i8, ptr %11, i64 176
  %263 = load <4 x i32>, ptr %262, align 16, !tbaa !10
  %264 = getelementptr inbounds nuw i8, ptr %11, i64 384
  %265 = load <4 x i32>, ptr %264, align 16, !tbaa !10
  %266 = getelementptr inbounds nuw i8, ptr %11, i64 400
  %267 = load <4 x i32>, ptr %266, align 16, !tbaa !10
  %268 = getelementptr inbounds nuw i8, ptr %11, i64 416
  %269 = load <4 x i32>, ptr %268, align 16, !tbaa !10
  %270 = getelementptr inbounds nuw i8, ptr %11, i64 432
  %271 = load <4 x i32>, ptr %270, align 16, !tbaa !10
  %272 = getelementptr inbounds nuw i8, ptr %11, i64 448
  %273 = load <4 x i32>, ptr %272, align 16, !tbaa !10
  %274 = getelementptr inbounds nuw i8, ptr %11, i64 464
  %275 = load <4 x i32>, ptr %274, align 16, !tbaa !10
  %276 = getelementptr inbounds nuw i8, ptr %11, i64 480
  %277 = load <4 x i32>, ptr %276, align 16, !tbaa !10
  %278 = getelementptr inbounds nuw i8, ptr %11, i64 496
  %279 = load <4 x i32>, ptr %278, align 16, !tbaa !10
  br label %318

280:                                              ; preds = %280, %203
  %281 = phi i64 [ 0, %203 ], [ %316, %280 ]
  %282 = phi ptr [ %206, %203 ], [ %315, %280 ]
  %283 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %10, i64 %281
  %284 = load <4 x i32>, ptr %283, align 16, !tbaa !10
  %285 = mul <4 x i32> %284, %209
  %286 = getelementptr inbounds nuw i8, ptr %283, i64 32
  %287 = load <4 x i32>, ptr %286, align 16, !tbaa !10
  %288 = mul <4 x i32> %287, %209
  %289 = getelementptr inbounds nuw i8, ptr %283, i64 64
  %290 = load <4 x i32>, ptr %289, align 16, !tbaa !10
  %291 = mul <4 x i32> %290, %209
  %292 = getelementptr inbounds nuw i8, ptr %283, i64 96
  %293 = load <4 x i32>, ptr %292, align 16, !tbaa !10
  %294 = mul <4 x i32> %293, %209
  %295 = getelementptr inbounds nuw i8, ptr %283, i64 16
  %296 = load <4 x i32>, ptr %295, align 16, !tbaa !10
  %297 = mul <4 x i32> %296, %212
  %298 = add <4 x i32> %297, %285
  %299 = getelementptr inbounds nuw i8, ptr %283, i64 48
  %300 = load <4 x i32>, ptr %299, align 16, !tbaa !10
  %301 = mul <4 x i32> %300, %212
  %302 = add <4 x i32> %301, %288
  %303 = getelementptr inbounds nuw i8, ptr %283, i64 80
  %304 = load <4 x i32>, ptr %303, align 16, !tbaa !10
  %305 = mul <4 x i32> %304, %212
  %306 = add <4 x i32> %305, %291
  %307 = getelementptr inbounds nuw i8, ptr %283, i64 112
  %308 = load <4 x i32>, ptr %307, align 16, !tbaa !10
  %309 = mul <4 x i32> %308, %212
  %310 = add <4 x i32> %309, %294
  %311 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %298, <4 x i32> %302)
  %312 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %306, <4 x i32> %310)
  %313 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %311, <4 x i32> %312)
  %314 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %313, i32 4)
  store <4 x i16> %314, ptr %282, align 2
  %315 = getelementptr inbounds nuw i8, ptr %282, i64 8
  %316 = add nuw nsw i64 %281, 4
  %317 = icmp samesign ult i64 %281, 28
  br i1 %317, label %280, label %213, !llvm.loop !20

318:                                              ; preds = %318, %216
  %319 = phi i64 [ 4, %216 ], [ %396, %318 ]
  %320 = shl nuw nsw i64 %319, 6
  %321 = getelementptr inbounds nuw i8, ptr %14, i64 %320
  %322 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %319
  %323 = load <4 x i16>, ptr %322, align 2
  %324 = sext <4 x i16> %323 to <4 x i32>
  %325 = mul <4 x i32> %241, %324
  %326 = mul <4 x i32> %243, %324
  %327 = mul <4 x i32> %245, %324
  %328 = mul <4 x i32> %247, %324
  %329 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %325, <4 x i32> %326)
  %330 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %327, <4 x i32> %328)
  %331 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %329, <4 x i32> %330)
  %332 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %331, i32 4)
  store <4 x i16> %332, ptr %321, align 32
  %333 = getelementptr inbounds nuw i8, ptr %321, i64 8
  %334 = mul <4 x i32> %249, %324
  %335 = mul <4 x i32> %251, %324
  %336 = mul <4 x i32> %253, %324
  %337 = mul <4 x i32> %255, %324
  %338 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %334, <4 x i32> %335)
  %339 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %336, <4 x i32> %337)
  %340 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %338, <4 x i32> %339)
  %341 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %340, i32 4)
  store <4 x i16> %341, ptr %333, align 8
  %342 = getelementptr inbounds nuw i8, ptr %321, i64 16
  %343 = mul <4 x i32> %257, %324
  %344 = mul <4 x i32> %259, %324
  %345 = mul <4 x i32> %261, %324
  %346 = mul <4 x i32> %263, %324
  %347 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %343, <4 x i32> %344)
  %348 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %345, <4 x i32> %346)
  %349 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %347, <4 x i32> %348)
  %350 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %349, i32 4)
  store <4 x i16> %350, ptr %342, align 16
  %351 = getelementptr inbounds nuw i8, ptr %321, i64 24
  %352 = mul <4 x i32> %218, %324
  %353 = mul <4 x i32> %220, %324
  %354 = mul <4 x i32> %222, %324
  %355 = mul <4 x i32> %224, %324
  %356 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %352, <4 x i32> %353)
  %357 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %354, <4 x i32> %355)
  %358 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %356, <4 x i32> %357)
  %359 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %358, i32 4)
  store <4 x i16> %359, ptr %351, align 8
  %360 = getelementptr inbounds nuw i8, ptr %321, i64 32
  %361 = mul <4 x i32> %226, %324
  %362 = mul <4 x i32> %228, %324
  %363 = mul <4 x i32> %230, %324
  %364 = mul <4 x i32> %232, %324
  %365 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %361, <4 x i32> %362)
  %366 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %363, <4 x i32> %364)
  %367 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %365, <4 x i32> %366)
  %368 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %367, i32 4)
  store <4 x i16> %368, ptr %360, align 32
  %369 = getelementptr inbounds nuw i8, ptr %321, i64 40
  %370 = mul <4 x i32> %234, %324
  %371 = mul <4 x i32> %236, %324
  %372 = mul <4 x i32> %238, %324
  %373 = mul <4 x i32> %240, %324
  %374 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %370, <4 x i32> %371)
  %375 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %372, <4 x i32> %373)
  %376 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %374, <4 x i32> %375)
  %377 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %376, i32 4)
  store <4 x i16> %377, ptr %369, align 8
  %378 = getelementptr inbounds nuw i8, ptr %321, i64 48
  %379 = mul <4 x i32> %265, %324
  %380 = mul <4 x i32> %267, %324
  %381 = mul <4 x i32> %269, %324
  %382 = mul <4 x i32> %271, %324
  %383 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %379, <4 x i32> %380)
  %384 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %381, <4 x i32> %382)
  %385 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %383, <4 x i32> %384)
  %386 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %385, i32 4)
  store <4 x i16> %386, ptr %378, align 16
  %387 = getelementptr inbounds nuw i8, ptr %321, i64 56
  %388 = mul <4 x i32> %273, %324
  %389 = mul <4 x i32> %275, %324
  %390 = mul <4 x i32> %277, %324
  %391 = mul <4 x i32> %279, %324
  %392 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %388, <4 x i32> %389)
  %393 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %390, <4 x i32> %391)
  %394 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %392, <4 x i32> %393)
  %395 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %394, i32 4)
  store <4 x i16> %395, ptr %387, align 8
  %396 = add nuw nsw i64 %319, 8
  %397 = icmp samesign ult i64 %319, 24
  br i1 %397, label %318, label %398, !llvm.loop !21

398:                                              ; preds = %318, %398
  %399 = phi i64 [ %430, %398 ], [ 0, %318 ]
  %400 = phi ptr [ %429, %398 ], [ %14, %318 ]
  %401 = lshr exact i64 %399, 1
  %402 = getelementptr inbounds nuw <4 x i32>, ptr %12, i64 %401
  %403 = load <4 x i32>, ptr %402, align 16, !tbaa !10
  %404 = or disjoint i64 %401, 1
  %405 = getelementptr inbounds nuw <4 x i32>, ptr %12, i64 %404
  %406 = load <4 x i32>, ptr %405, align 16, !tbaa !10
  %407 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %403, <4 x i32> %406)
  %408 = shl <4 x i32> %407, splat (i32 6)
  %409 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %408, i32 4)
  store <4 x i16> %409, ptr %400, align 2
  %410 = getelementptr inbounds nuw <4 x i32>, ptr %13, i64 %401
  %411 = load <4 x i32>, ptr %410, align 16, !tbaa !10
  %412 = mul <4 x i32> %411, <i32 83, i32 36, i32 83, i32 36>
  %413 = getelementptr inbounds nuw <4 x i32>, ptr %13, i64 %404
  %414 = load <4 x i32>, ptr %413, align 16, !tbaa !10
  %415 = mul <4 x i32> %414, <i32 83, i32 36, i32 83, i32 36>
  %416 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %412, <4 x i32> %415)
  %417 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %416, i32 4)
  %418 = getelementptr inbounds nuw i8, ptr %400, i64 512
  store <4 x i16> %417, ptr %418, align 2
  %419 = mul <4 x i32> %403, <i32 64, i32 -64, i32 64, i32 -64>
  %420 = mul <4 x i32> %406, <i32 64, i32 -64, i32 64, i32 -64>
  %421 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %419, <4 x i32> %420)
  %422 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %421, i32 4)
  %423 = getelementptr inbounds nuw i8, ptr %400, i64 1024
  store <4 x i16> %422, ptr %423, align 2
  %424 = mul <4 x i32> %411, <i32 36, i32 -83, i32 36, i32 -83>
  %425 = mul <4 x i32> %414, <i32 36, i32 -83, i32 36, i32 -83>
  %426 = tail call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %424, <4 x i32> %425)
  %427 = tail call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %426, i32 4)
  %428 = getelementptr inbounds nuw i8, ptr %400, i64 1536
  store <4 x i16> %427, ptr %428, align 2
  %429 = getelementptr inbounds nuw i8, ptr %400, i64 8
  %430 = add nuw nsw i64 %399, 4
  %431 = icmp samesign ult i64 %399, 28
  br i1 %431, label %398, label %432, !llvm.loop !22

432:                                              ; preds = %398
  call void @llvm.lifetime.end.p0(ptr nonnull %13) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %12) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #10
  br label %433

433:                                              ; preds = %433, %432
  %434 = phi i64 [ 0, %432 ], [ %534, %433 ]
  %435 = shl nuw nsw i64 %434, 6
  %436 = getelementptr inbounds nuw i8, ptr %14, i64 %435
  %437 = call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.aarch64.neon.ld1x4.v8i16.p0(ptr nonnull %436)
  %438 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %437, 0
  %439 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %437, 1
  %440 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %437, 2
  %441 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %437, 3
  %442 = shufflevector <8 x i16> %440, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %443 = shufflevector <8 x i16> %441, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %444 = or disjoint i64 %434, 1
  %445 = shl nuw nsw i64 %444, 6
  %446 = getelementptr inbounds nuw i8, ptr %14, i64 %445
  %447 = call { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.aarch64.neon.ld1x4.v8i16.p0(ptr nonnull %446)
  %448 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %447, 0
  %449 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %447, 1
  %450 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %447, 2
  %451 = extractvalue { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } %447, 3
  %452 = shufflevector <8 x i16> %450, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %453 = shufflevector <8 x i16> %451, <8 x i16> poison, <8 x i32> <i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0>
  %454 = shufflevector <8 x i16> %438, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %455 = shufflevector <8 x i16> %443, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %456 = sext <4 x i16> %454 to <4 x i32>
  %457 = sext <4 x i16> %455 to <4 x i32>
  %458 = add nsw <4 x i32> %457, %456
  %459 = shufflevector <8 x i16> %438, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %460 = shufflevector <8 x i16> %443, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %461 = sext <4 x i16> %459 to <4 x i32>
  %462 = sext <4 x i16> %460 to <4 x i32>
  %463 = add nsw <4 x i32> %462, %461
  %464 = shufflevector <8 x i16> %439, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %465 = shufflevector <8 x i16> %442, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %466 = sext <4 x i16> %464 to <4 x i32>
  %467 = sext <4 x i16> %465 to <4 x i32>
  %468 = add nsw <4 x i32> %467, %466
  %469 = shufflevector <8 x i16> %439, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %470 = shufflevector <8 x i16> %442, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %471 = sext <4 x i16> %469 to <4 x i32>
  %472 = sext <4 x i16> %470 to <4 x i32>
  %473 = add nsw <4 x i32> %472, %471
  %474 = shufflevector <8 x i16> %448, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %475 = shufflevector <8 x i16> %453, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %476 = sext <4 x i16> %474 to <4 x i32>
  %477 = sext <4 x i16> %475 to <4 x i32>
  %478 = add nsw <4 x i32> %477, %476
  %479 = shufflevector <8 x i16> %448, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %480 = shufflevector <8 x i16> %453, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %481 = sext <4 x i16> %479 to <4 x i32>
  %482 = sext <4 x i16> %480 to <4 x i32>
  %483 = add nsw <4 x i32> %482, %481
  %484 = shufflevector <8 x i16> %449, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %485 = shufflevector <8 x i16> %452, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %486 = sext <4 x i16> %484 to <4 x i32>
  %487 = sext <4 x i16> %485 to <4 x i32>
  %488 = add nsw <4 x i32> %487, %486
  %489 = shufflevector <8 x i16> %449, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %490 = shufflevector <8 x i16> %452, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %491 = sext <4 x i16> %489 to <4 x i32>
  %492 = sext <4 x i16> %490 to <4 x i32>
  %493 = add nsw <4 x i32> %492, %491
  %494 = sub <8 x i16> %438, %443
  %495 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %4, i64 %434
  store <8 x i16> %494, ptr %495, align 16, !tbaa !10
  %496 = sub <8 x i16> %439, %442
  %497 = getelementptr inbounds nuw i8, ptr %495, i64 16
  store <8 x i16> %496, ptr %497, align 16, !tbaa !10
  %498 = sub <8 x i16> %448, %453
  %499 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %4, i64 %444
  store <8 x i16> %498, ptr %499, align 16, !tbaa !10
  %500 = sub <8 x i16> %449, %452
  %501 = getelementptr inbounds nuw i8, ptr %499, i64 16
  store <8 x i16> %500, ptr %501, align 16, !tbaa !10
  %502 = shufflevector <4 x i32> %473, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %503 = shufflevector <4 x i32> %468, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %504 = add nsw <4 x i32> %458, %502
  %505 = sub nsw <4 x i32> %458, %502
  %506 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %5, i64 %434
  store <4 x i32> %505, ptr %506, align 16, !tbaa !10
  %507 = sub nsw <4 x i32> %463, %503
  %508 = getelementptr inbounds nuw i8, ptr %506, i64 16
  store <4 x i32> %507, ptr %508, align 16, !tbaa !10
  %509 = shufflevector <4 x i32> %493, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %510 = shufflevector <4 x i32> %488, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %511 = add nsw <4 x i32> %478, %509
  %512 = sub nsw <4 x i32> %478, %509
  %513 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %5, i64 %444
  store <4 x i32> %512, ptr %513, align 16, !tbaa !10
  %514 = sub nsw <4 x i32> %483, %510
  %515 = getelementptr inbounds nuw i8, ptr %513, i64 16
  store <4 x i32> %514, ptr %515, align 16, !tbaa !10
  %516 = shufflevector <4 x i32> %463, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %517 = add nsw <4 x i32> %516, %468
  %518 = add nsw <4 x i32> %504, %517
  %519 = sub nsw <4 x i32> %504, %517
  %520 = getelementptr inbounds nuw <4 x i32>, ptr %6, i64 %434
  store <4 x i32> %519, ptr %520, align 16, !tbaa !10
  %521 = shufflevector <4 x i32> %483, <4 x i32> poison, <4 x i32> <i32 3, i32 2, i32 1, i32 0>
  %522 = add nsw <4 x i32> %521, %488
  %523 = add nsw <4 x i32> %511, %522
  %524 = sub nsw <4 x i32> %511, %522
  %525 = getelementptr inbounds nuw <4 x i32>, ptr %6, i64 %444
  store <4 x i32> %524, ptr %525, align 16, !tbaa !10
  %526 = shufflevector <4 x i32> %518, <4 x i32> %523, <4 x i32> <i32 0, i32 1, i32 4, i32 5>
  %527 = shufflevector <4 x i32> %518, <4 x i32> %523, <4 x i32> <i32 2, i32 3, i32 6, i32 7>
  %528 = shufflevector <4 x i32> %527, <4 x i32> poison, <4 x i32> <i32 1, i32 0, i32 3, i32 2>
  %529 = add <4 x i32> %528, %526
  %530 = lshr exact i64 %434, 1
  %531 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %530
  store <4 x i32> %529, ptr %531, align 16, !tbaa !10
  %532 = sub <4 x i32> %526, %528
  %533 = getelementptr inbounds nuw <4 x i32>, ptr %8, i64 %530
  store <4 x i32> %532, ptr %533, align 16, !tbaa !10
  %534 = add nuw nsw i64 %434, 2
  %535 = icmp samesign ult i64 %434, 30
  br i1 %535, label %433, label %536, !llvm.loop !23

536:                                              ; preds = %433, %548
  %537 = phi i64 [ %549, %548 ], [ 1, %433 ]
  %538 = shl nuw nsw i64 %537, 6
  %539 = getelementptr inbounds nuw i8, ptr %1, i64 %538
  %540 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %537
  %541 = load <8 x i16>, ptr %540, align 2
  %542 = getelementptr inbounds nuw i8, ptr %540, i64 16
  %543 = load <8 x i16>, ptr %542, align 2
  %544 = shufflevector <8 x i16> %541, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %545 = shufflevector <8 x i16> %541, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %546 = shufflevector <8 x i16> %543, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %547 = shufflevector <8 x i16> %543, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  br label %551

548:                                              ; preds = %551
  %549 = add nuw nsw i64 %537, 2
  %550 = icmp samesign ult i64 %537, 30
  br i1 %550, label %536, label %621, !llvm.loop !24

551:                                              ; preds = %551, %536
  %552 = phi i64 [ 0, %536 ], [ %619, %551 ]
  %553 = phi ptr [ %539, %536 ], [ %618, %551 ]
  %554 = getelementptr inbounds nuw [2 x <8 x i16>], ptr %4, i64 %552
  %555 = load <8 x i16>, ptr %554, align 16, !tbaa !10
  %556 = shufflevector <8 x i16> %555, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %557 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %544, <4 x i16> %556)
  %558 = shufflevector <8 x i16> %555, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %559 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %545, <4 x i16> %558)
  %560 = add <4 x i32> %559, %557
  %561 = getelementptr inbounds nuw i8, ptr %554, i64 16
  %562 = load <8 x i16>, ptr %561, align 16, !tbaa !10
  %563 = shufflevector <8 x i16> %562, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %564 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %546, <4 x i16> %563)
  %565 = add <4 x i32> %560, %564
  %566 = shufflevector <8 x i16> %562, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %567 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %547, <4 x i16> %566)
  %568 = add <4 x i32> %565, %567
  %569 = getelementptr inbounds nuw i8, ptr %554, i64 32
  %570 = load <8 x i16>, ptr %569, align 16, !tbaa !10
  %571 = shufflevector <8 x i16> %570, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %572 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %544, <4 x i16> %571)
  %573 = shufflevector <8 x i16> %570, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %574 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %545, <4 x i16> %573)
  %575 = add <4 x i32> %574, %572
  %576 = getelementptr inbounds nuw i8, ptr %554, i64 48
  %577 = load <8 x i16>, ptr %576, align 16, !tbaa !10
  %578 = shufflevector <8 x i16> %577, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %579 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %546, <4 x i16> %578)
  %580 = add <4 x i32> %575, %579
  %581 = shufflevector <8 x i16> %577, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %582 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %547, <4 x i16> %581)
  %583 = add <4 x i32> %580, %582
  %584 = getelementptr inbounds nuw i8, ptr %554, i64 64
  %585 = load <8 x i16>, ptr %584, align 16, !tbaa !10
  %586 = shufflevector <8 x i16> %585, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %587 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %544, <4 x i16> %586)
  %588 = shufflevector <8 x i16> %585, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %589 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %545, <4 x i16> %588)
  %590 = add <4 x i32> %589, %587
  %591 = getelementptr inbounds nuw i8, ptr %554, i64 80
  %592 = load <8 x i16>, ptr %591, align 16, !tbaa !10
  %593 = shufflevector <8 x i16> %592, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %594 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %546, <4 x i16> %593)
  %595 = add <4 x i32> %590, %594
  %596 = shufflevector <8 x i16> %592, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %597 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %547, <4 x i16> %596)
  %598 = add <4 x i32> %595, %597
  %599 = getelementptr inbounds nuw i8, ptr %554, i64 96
  %600 = load <8 x i16>, ptr %599, align 16, !tbaa !10
  %601 = shufflevector <8 x i16> %600, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %602 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %544, <4 x i16> %601)
  %603 = shufflevector <8 x i16> %600, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %604 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %545, <4 x i16> %603)
  %605 = add <4 x i32> %604, %602
  %606 = getelementptr inbounds nuw i8, ptr %554, i64 112
  %607 = load <8 x i16>, ptr %606, align 16, !tbaa !10
  %608 = shufflevector <8 x i16> %607, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %609 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %546, <4 x i16> %608)
  %610 = add <4 x i32> %605, %609
  %611 = shufflevector <8 x i16> %607, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %612 = call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %547, <4 x i16> %611)
  %613 = add <4 x i32> %610, %612
  %614 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %568, <4 x i32> %583)
  %615 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %598, <4 x i32> %613)
  %616 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %614, <4 x i32> %615)
  %617 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %616, i32 11)
  store <4 x i16> %617, ptr %553, align 2
  %618 = getelementptr inbounds nuw i8, ptr %553, i64 8
  %619 = add nuw nsw i64 %552, 4
  %620 = icmp samesign ult i64 %552, 28
  br i1 %620, label %551, label %548, !llvm.loop !25

621:                                              ; preds = %548, %631
  %622 = phi i64 [ %632, %631 ], [ 2, %548 ]
  %623 = shl nuw nsw i64 %622, 6
  %624 = getelementptr inbounds nuw i8, ptr %1, i64 %623
  %625 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %622
  %626 = load <4 x i16>, ptr %625, align 2
  %627 = sext <4 x i16> %626 to <4 x i32>
  %628 = getelementptr inbounds nuw i8, ptr %625, i64 8
  %629 = load <4 x i16>, ptr %628, align 2
  %630 = sext <4 x i16> %629 to <4 x i32>
  br label %698

631:                                              ; preds = %698
  %632 = add nuw nsw i64 %622, 4
  %633 = icmp samesign ult i64 %622, 28
  br i1 %633, label %621, label %634, !llvm.loop !26

634:                                              ; preds = %631
  %635 = getelementptr inbounds nuw i8, ptr %6, i64 192
  %636 = load <4 x i32>, ptr %635, align 16, !tbaa !10
  %637 = getelementptr inbounds nuw i8, ptr %6, i64 208
  %638 = load <4 x i32>, ptr %637, align 16, !tbaa !10
  %639 = getelementptr inbounds nuw i8, ptr %6, i64 224
  %640 = load <4 x i32>, ptr %639, align 16, !tbaa !10
  %641 = getelementptr inbounds nuw i8, ptr %6, i64 240
  %642 = load <4 x i32>, ptr %641, align 16, !tbaa !10
  %643 = getelementptr inbounds nuw i8, ptr %6, i64 256
  %644 = load <4 x i32>, ptr %643, align 16, !tbaa !10
  %645 = getelementptr inbounds nuw i8, ptr %6, i64 272
  %646 = load <4 x i32>, ptr %645, align 16, !tbaa !10
  %647 = getelementptr inbounds nuw i8, ptr %6, i64 288
  %648 = load <4 x i32>, ptr %647, align 16, !tbaa !10
  %649 = getelementptr inbounds nuw i8, ptr %6, i64 304
  %650 = load <4 x i32>, ptr %649, align 16, !tbaa !10
  %651 = getelementptr inbounds nuw i8, ptr %6, i64 320
  %652 = load <4 x i32>, ptr %651, align 16, !tbaa !10
  %653 = getelementptr inbounds nuw i8, ptr %6, i64 336
  %654 = load <4 x i32>, ptr %653, align 16, !tbaa !10
  %655 = getelementptr inbounds nuw i8, ptr %6, i64 352
  %656 = load <4 x i32>, ptr %655, align 16, !tbaa !10
  %657 = getelementptr inbounds nuw i8, ptr %6, i64 368
  %658 = load <4 x i32>, ptr %657, align 16, !tbaa !10
  %659 = load <4 x i32>, ptr %6, align 16, !tbaa !10
  %660 = getelementptr inbounds nuw i8, ptr %6, i64 16
  %661 = load <4 x i32>, ptr %660, align 16, !tbaa !10
  %662 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %663 = load <4 x i32>, ptr %662, align 16, !tbaa !10
  %664 = getelementptr inbounds nuw i8, ptr %6, i64 48
  %665 = load <4 x i32>, ptr %664, align 16, !tbaa !10
  %666 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %667 = load <4 x i32>, ptr %666, align 16, !tbaa !10
  %668 = getelementptr inbounds nuw i8, ptr %6, i64 80
  %669 = load <4 x i32>, ptr %668, align 16, !tbaa !10
  %670 = getelementptr inbounds nuw i8, ptr %6, i64 96
  %671 = load <4 x i32>, ptr %670, align 16, !tbaa !10
  %672 = getelementptr inbounds nuw i8, ptr %6, i64 112
  %673 = load <4 x i32>, ptr %672, align 16, !tbaa !10
  %674 = getelementptr inbounds nuw i8, ptr %6, i64 128
  %675 = load <4 x i32>, ptr %674, align 16, !tbaa !10
  %676 = getelementptr inbounds nuw i8, ptr %6, i64 144
  %677 = load <4 x i32>, ptr %676, align 16, !tbaa !10
  %678 = getelementptr inbounds nuw i8, ptr %6, i64 160
  %679 = load <4 x i32>, ptr %678, align 16, !tbaa !10
  %680 = getelementptr inbounds nuw i8, ptr %6, i64 176
  %681 = load <4 x i32>, ptr %680, align 16, !tbaa !10
  %682 = getelementptr inbounds nuw i8, ptr %6, i64 384
  %683 = load <4 x i32>, ptr %682, align 16, !tbaa !10
  %684 = getelementptr inbounds nuw i8, ptr %6, i64 400
  %685 = load <4 x i32>, ptr %684, align 16, !tbaa !10
  %686 = getelementptr inbounds nuw i8, ptr %6, i64 416
  %687 = load <4 x i32>, ptr %686, align 16, !tbaa !10
  %688 = getelementptr inbounds nuw i8, ptr %6, i64 432
  %689 = load <4 x i32>, ptr %688, align 16, !tbaa !10
  %690 = getelementptr inbounds nuw i8, ptr %6, i64 448
  %691 = load <4 x i32>, ptr %690, align 16, !tbaa !10
  %692 = getelementptr inbounds nuw i8, ptr %6, i64 464
  %693 = load <4 x i32>, ptr %692, align 16, !tbaa !10
  %694 = getelementptr inbounds nuw i8, ptr %6, i64 480
  %695 = load <4 x i32>, ptr %694, align 16, !tbaa !10
  %696 = getelementptr inbounds nuw i8, ptr %6, i64 496
  %697 = load <4 x i32>, ptr %696, align 16, !tbaa !10
  br label %736

698:                                              ; preds = %698, %621
  %699 = phi i64 [ 0, %621 ], [ %734, %698 ]
  %700 = phi ptr [ %624, %621 ], [ %733, %698 ]
  %701 = getelementptr inbounds nuw [2 x <4 x i32>], ptr %5, i64 %699
  %702 = load <4 x i32>, ptr %701, align 16, !tbaa !10
  %703 = mul <4 x i32> %702, %627
  %704 = getelementptr inbounds nuw i8, ptr %701, i64 16
  %705 = load <4 x i32>, ptr %704, align 16, !tbaa !10
  %706 = mul <4 x i32> %705, %630
  %707 = add <4 x i32> %706, %703
  %708 = getelementptr inbounds nuw i8, ptr %701, i64 32
  %709 = load <4 x i32>, ptr %708, align 16, !tbaa !10
  %710 = mul <4 x i32> %709, %627
  %711 = getelementptr inbounds nuw i8, ptr %701, i64 48
  %712 = load <4 x i32>, ptr %711, align 16, !tbaa !10
  %713 = mul <4 x i32> %712, %630
  %714 = add <4 x i32> %713, %710
  %715 = getelementptr inbounds nuw i8, ptr %701, i64 64
  %716 = load <4 x i32>, ptr %715, align 16, !tbaa !10
  %717 = mul <4 x i32> %716, %627
  %718 = getelementptr inbounds nuw i8, ptr %701, i64 80
  %719 = load <4 x i32>, ptr %718, align 16, !tbaa !10
  %720 = mul <4 x i32> %719, %630
  %721 = add <4 x i32> %720, %717
  %722 = getelementptr inbounds nuw i8, ptr %701, i64 96
  %723 = load <4 x i32>, ptr %722, align 16, !tbaa !10
  %724 = mul <4 x i32> %723, %627
  %725 = getelementptr inbounds nuw i8, ptr %701, i64 112
  %726 = load <4 x i32>, ptr %725, align 16, !tbaa !10
  %727 = mul <4 x i32> %726, %630
  %728 = add <4 x i32> %727, %724
  %729 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %707, <4 x i32> %714)
  %730 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %721, <4 x i32> %728)
  %731 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %729, <4 x i32> %730)
  %732 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %731, i32 11)
  store <4 x i16> %732, ptr %700, align 2
  %733 = getelementptr inbounds nuw i8, ptr %700, i64 8
  %734 = add nuw nsw i64 %699, 4
  %735 = icmp samesign ult i64 %699, 28
  br i1 %735, label %698, label %631, !llvm.loop !27

736:                                              ; preds = %736, %634
  %737 = phi i64 [ 4, %634 ], [ %814, %736 ]
  %738 = shl nuw nsw i64 %737, 6
  %739 = getelementptr inbounds nuw i8, ptr %1, i64 %738
  %740 = getelementptr inbounds nuw [32 x i16], ptr @_ZN4x2655g_t32E, i64 %737
  %741 = load <4 x i16>, ptr %740, align 2
  %742 = sext <4 x i16> %741 to <4 x i32>
  %743 = mul <4 x i32> %659, %742
  %744 = mul <4 x i32> %661, %742
  %745 = mul <4 x i32> %663, %742
  %746 = mul <4 x i32> %665, %742
  %747 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %743, <4 x i32> %744)
  %748 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %745, <4 x i32> %746)
  %749 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %747, <4 x i32> %748)
  %750 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %749, i32 11)
  store <4 x i16> %750, ptr %739, align 2
  %751 = getelementptr inbounds nuw i8, ptr %739, i64 8
  %752 = mul <4 x i32> %667, %742
  %753 = mul <4 x i32> %669, %742
  %754 = mul <4 x i32> %671, %742
  %755 = mul <4 x i32> %673, %742
  %756 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %752, <4 x i32> %753)
  %757 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %754, <4 x i32> %755)
  %758 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %756, <4 x i32> %757)
  %759 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %758, i32 11)
  store <4 x i16> %759, ptr %751, align 2
  %760 = getelementptr inbounds nuw i8, ptr %739, i64 16
  %761 = mul <4 x i32> %675, %742
  %762 = mul <4 x i32> %677, %742
  %763 = mul <4 x i32> %679, %742
  %764 = mul <4 x i32> %681, %742
  %765 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %761, <4 x i32> %762)
  %766 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %763, <4 x i32> %764)
  %767 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %765, <4 x i32> %766)
  %768 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %767, i32 11)
  store <4 x i16> %768, ptr %760, align 2
  %769 = getelementptr inbounds nuw i8, ptr %739, i64 24
  %770 = mul <4 x i32> %636, %742
  %771 = mul <4 x i32> %638, %742
  %772 = mul <4 x i32> %640, %742
  %773 = mul <4 x i32> %642, %742
  %774 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %770, <4 x i32> %771)
  %775 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %772, <4 x i32> %773)
  %776 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %774, <4 x i32> %775)
  %777 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %776, i32 11)
  store <4 x i16> %777, ptr %769, align 2
  %778 = getelementptr inbounds nuw i8, ptr %739, i64 32
  %779 = mul <4 x i32> %644, %742
  %780 = mul <4 x i32> %646, %742
  %781 = mul <4 x i32> %648, %742
  %782 = mul <4 x i32> %650, %742
  %783 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %779, <4 x i32> %780)
  %784 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %781, <4 x i32> %782)
  %785 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %783, <4 x i32> %784)
  %786 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %785, i32 11)
  store <4 x i16> %786, ptr %778, align 2
  %787 = getelementptr inbounds nuw i8, ptr %739, i64 40
  %788 = mul <4 x i32> %652, %742
  %789 = mul <4 x i32> %654, %742
  %790 = mul <4 x i32> %656, %742
  %791 = mul <4 x i32> %658, %742
  %792 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %788, <4 x i32> %789)
  %793 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %790, <4 x i32> %791)
  %794 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %792, <4 x i32> %793)
  %795 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %794, i32 11)
  store <4 x i16> %795, ptr %787, align 2
  %796 = getelementptr inbounds nuw i8, ptr %739, i64 48
  %797 = mul <4 x i32> %683, %742
  %798 = mul <4 x i32> %685, %742
  %799 = mul <4 x i32> %687, %742
  %800 = mul <4 x i32> %689, %742
  %801 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %797, <4 x i32> %798)
  %802 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %799, <4 x i32> %800)
  %803 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %801, <4 x i32> %802)
  %804 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %803, i32 11)
  store <4 x i16> %804, ptr %796, align 2
  %805 = getelementptr inbounds nuw i8, ptr %739, i64 56
  %806 = mul <4 x i32> %691, %742
  %807 = mul <4 x i32> %693, %742
  %808 = mul <4 x i32> %695, %742
  %809 = mul <4 x i32> %697, %742
  %810 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %806, <4 x i32> %807)
  %811 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %808, <4 x i32> %809)
  %812 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %810, <4 x i32> %811)
  %813 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %812, i32 11)
  store <4 x i16> %813, ptr %805, align 2
  %814 = add nuw nsw i64 %737, 8
  %815 = icmp samesign ult i64 %737, 24
  br i1 %815, label %736, label %816, !llvm.loop !28

816:                                              ; preds = %736, %816
  %817 = phi i64 [ %848, %816 ], [ 0, %736 ]
  %818 = phi ptr [ %847, %816 ], [ %1, %736 ]
  %819 = lshr exact i64 %817, 1
  %820 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %819
  %821 = load <4 x i32>, ptr %820, align 16, !tbaa !10
  %822 = or disjoint i64 %819, 1
  %823 = getelementptr inbounds nuw <4 x i32>, ptr %7, i64 %822
  %824 = load <4 x i32>, ptr %823, align 16, !tbaa !10
  %825 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %821, <4 x i32> %824)
  %826 = shl <4 x i32> %825, splat (i32 6)
  %827 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %826, i32 11)
  store <4 x i16> %827, ptr %818, align 2
  %828 = getelementptr inbounds nuw <4 x i32>, ptr %8, i64 %819
  %829 = load <4 x i32>, ptr %828, align 16, !tbaa !10
  %830 = mul <4 x i32> %829, <i32 83, i32 36, i32 83, i32 36>
  %831 = getelementptr inbounds nuw <4 x i32>, ptr %8, i64 %822
  %832 = load <4 x i32>, ptr %831, align 16, !tbaa !10
  %833 = mul <4 x i32> %832, <i32 83, i32 36, i32 83, i32 36>
  %834 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %830, <4 x i32> %833)
  %835 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %834, i32 11)
  %836 = getelementptr inbounds nuw i8, ptr %818, i64 512
  store <4 x i16> %835, ptr %836, align 2
  %837 = mul <4 x i32> %821, <i32 64, i32 -64, i32 64, i32 -64>
  %838 = mul <4 x i32> %824, <i32 64, i32 -64, i32 64, i32 -64>
  %839 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %837, <4 x i32> %838)
  %840 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %839, i32 11)
  %841 = getelementptr inbounds nuw i8, ptr %818, i64 1024
  store <4 x i16> %840, ptr %841, align 2
  %842 = mul <4 x i32> %829, <i32 36, i32 -83, i32 36, i32 -83>
  %843 = mul <4 x i32> %832, <i32 36, i32 -83, i32 36, i32 -83>
  %844 = call noundef <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32> %842, <4 x i32> %843)
  %845 = call <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32> %844, i32 11)
  %846 = getelementptr inbounds nuw i8, ptr %818, i64 1536
  store <4 x i16> %845, ptr %846, align 2
  %847 = getelementptr inbounds nuw i8, ptr %818, i64 8
  %848 = add nuw nsw i64 %817, 4
  %849 = icmp samesign ult i64 %817, 28
  br i1 %849, label %816, label %850, !llvm.loop !29

850:                                              ; preds = %816
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %14) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26510idst4_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 8)) %1, i64 noundef %2) #0 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %10 = load <4 x i16>, ptr %9, align 2
  %11 = sext <4 x i16> %4 to <4 x i32>
  %12 = sext <4 x i16> %8 to <4 x i32>
  %13 = add nsw <4 x i32> %12, %11
  %14 = sext <4 x i16> %10 to <4 x i32>
  %15 = add nsw <4 x i32> %14, %12
  %16 = sub nsw <4 x i32> %11, %14
  %17 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %6, <4 x i16> splat (i16 74))
  %18 = mul nsw <4 x i32> %13, splat (i32 29)
  %19 = add <4 x i32> %18, %17
  %20 = mul nsw <4 x i32> %15, splat (i32 55)
  %21 = add <4 x i32> %19, %20
  %22 = mul nsw <4 x i32> %16, splat (i32 55)
  %23 = add <4 x i32> %22, %17
  %24 = mul nsw <4 x i32> %15, splat (i32 -29)
  %25 = add <4 x i32> %23, %24
  %26 = sub nsw <4 x i32> %11, %12
  %27 = add nsw <4 x i32> %26, %14
  %28 = mul nsw <4 x i32> %27, splat (i32 74)
  %29 = mul nsw <4 x i32> %13, splat (i32 55)
  %30 = mul nsw <4 x i32> %16, splat (i32 29)
  %31 = sub <4 x i32> %29, %17
  %32 = add <4 x i32> %31, %30
  %33 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %21, i32 7)
  %34 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %25, i32 7)
  %35 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %28, i32 7)
  %36 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %32, i32 7)
  %37 = shufflevector <4 x i16> %33, <4 x i16> %35, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %38 = shufflevector <4 x i16> %34, <4 x i16> %36, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %39 = shufflevector <8 x i16> %37, <8 x i16> %38, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %40 = shufflevector <8 x i16> %37, <8 x i16> %38, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %41 = shufflevector <8 x i16> %39, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %42 = shufflevector <8 x i16> %39, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %43 = shufflevector <8 x i16> %40, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %44 = shufflevector <8 x i16> %40, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %45 = sext <4 x i16> %41 to <4 x i32>
  %46 = sext <4 x i16> %43 to <4 x i32>
  %47 = add nsw <4 x i32> %46, %45
  %48 = sext <4 x i16> %44 to <4 x i32>
  %49 = add nsw <4 x i32> %48, %46
  %50 = sub nsw <4 x i32> %45, %48
  %51 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %42, <4 x i16> splat (i16 74))
  %52 = mul nsw <4 x i32> %47, splat (i32 29)
  %53 = add <4 x i32> %52, %51
  %54 = mul nsw <4 x i32> %49, splat (i32 55)
  %55 = add <4 x i32> %53, %54
  %56 = mul nsw <4 x i32> %50, splat (i32 55)
  %57 = add <4 x i32> %56, %51
  %58 = mul nsw <4 x i32> %49, splat (i32 -29)
  %59 = add <4 x i32> %57, %58
  %60 = sub nsw <4 x i32> %45, %46
  %61 = add nsw <4 x i32> %60, %48
  %62 = mul nsw <4 x i32> %61, splat (i32 74)
  %63 = mul nsw <4 x i32> %47, splat (i32 55)
  %64 = mul nsw <4 x i32> %50, splat (i32 29)
  %65 = sub <4 x i32> %63, %51
  %66 = add <4 x i32> %65, %64
  %67 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %55, i32 12)
  %68 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %59, i32 12)
  %69 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %62, i32 12)
  %70 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %66, i32 12)
  %71 = shufflevector <4 x i16> %67, <4 x i16> %69, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %72 = shufflevector <4 x i16> %68, <4 x i16> %70, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %73 = shufflevector <8 x i16> %71, <8 x i16> %72, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %74 = shufflevector <8 x i16> %71, <8 x i16> %72, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %75 = shufflevector <8 x i16> %73, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %76 = shufflevector <8 x i16> %73, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %77 = shufflevector <8 x i16> %74, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %78 = shufflevector <8 x i16> %74, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  store <4 x i16> %75, ptr %1, align 2
  %79 = getelementptr inbounds i16, ptr %1, i64 %2
  store <4 x i16> %76, ptr %79, align 2
  %80 = shl nsw i64 %2, 2
  %81 = getelementptr inbounds i8, ptr %1, i64 %80
  store <4 x i16> %77, ptr %81, align 2
  %82 = mul nsw i64 %2, 6
  %83 = getelementptr inbounds i8, ptr %1, i64 %82
  store <4 x i16> %78, ptr %83, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26510idct4_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 8)) %1, i64 noundef %2) #0 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %10 = load <4 x i16>, ptr %9, align 2
  %11 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %6, <4 x i16> splat (i16 83))
  %12 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %10, <4 x i16> splat (i16 36))
  %13 = add <4 x i32> %12, %11
  %14 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %6, <4 x i16> splat (i16 36))
  %15 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %10, <4 x i16> splat (i16 -83))
  %16 = add <4 x i32> %15, %14
  %17 = sext <4 x i16> %4 to <4 x i32>
  %18 = sext <4 x i16> %8 to <4 x i32>
  %19 = add nsw <4 x i32> %18, %17
  %20 = shl nsw <4 x i32> %19, splat (i32 6)
  %21 = sub nsw <4 x i32> %17, %18
  %22 = shl nsw <4 x i32> %21, splat (i32 6)
  %23 = add <4 x i32> %13, %20
  %24 = add <4 x i32> %16, %22
  %25 = sub <4 x i32> %22, %16
  %26 = sub <4 x i32> %20, %13
  %27 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %23, i32 7)
  %28 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %24, i32 7)
  %29 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %25, i32 7)
  %30 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %26, i32 7)
  %31 = shufflevector <4 x i16> %27, <4 x i16> %29, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %32 = shufflevector <4 x i16> %28, <4 x i16> %30, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %33 = shufflevector <8 x i16> %31, <8 x i16> %32, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %34 = shufflevector <8 x i16> %31, <8 x i16> %32, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %35 = shufflevector <8 x i16> %33, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <8 x i16> %33, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %37 = shufflevector <8 x i16> %34, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <8 x i16> %34, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %39 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %36, <4 x i16> splat (i16 83))
  %40 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> splat (i16 36))
  %41 = add <4 x i32> %40, %39
  %42 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %36, <4 x i16> splat (i16 36))
  %43 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> splat (i16 -83))
  %44 = add <4 x i32> %43, %42
  %45 = sext <4 x i16> %35 to <4 x i32>
  %46 = sext <4 x i16> %37 to <4 x i32>
  %47 = add nsw <4 x i32> %46, %45
  %48 = shl nsw <4 x i32> %47, splat (i32 6)
  %49 = sub nsw <4 x i32> %45, %46
  %50 = shl nsw <4 x i32> %49, splat (i32 6)
  %51 = add <4 x i32> %48, %41
  %52 = add <4 x i32> %50, %44
  %53 = sub <4 x i32> %50, %44
  %54 = sub <4 x i32> %48, %41
  %55 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %51, i32 12)
  %56 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %52, i32 12)
  %57 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %53, i32 12)
  %58 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %54, i32 12)
  %59 = shufflevector <4 x i16> %55, <4 x i16> %57, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %60 = shufflevector <4 x i16> %56, <4 x i16> %58, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %61 = shufflevector <8 x i16> %59, <8 x i16> %60, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %62 = shufflevector <8 x i16> %59, <8 x i16> %60, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %63 = shufflevector <8 x i16> %61, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %64 = shufflevector <8 x i16> %61, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %65 = shufflevector <8 x i16> %62, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %66 = shufflevector <8 x i16> %62, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  store <4 x i16> %63, ptr %1, align 2
  %67 = getelementptr inbounds i16, ptr %1, i64 %2
  store <4 x i16> %64, ptr %67, align 2
  %68 = shl nsw i64 %2, 2
  %69 = getelementptr inbounds i8, ptr %1, i64 %68
  store <4 x i16> %65, ptr %69, align 2
  %70 = mul nsw i64 %2, 6
  %71 = getelementptr inbounds i8, ptr %1, i64 %70
  store <4 x i16> %66, ptr %71, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26510idct8_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) initializes((0, 16)) %1, i64 noundef %2) #0 {
  %4 = load <8 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %6 = load <8 x i16>, ptr %5, align 2
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %8 = load <8 x i16>, ptr %7, align 2
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 48
  %10 = load <8 x i16>, ptr %9, align 2
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 64
  %12 = load <8 x i16>, ptr %11, align 2
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 80
  %14 = load <8 x i16>, ptr %13, align 2
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 96
  %16 = load <8 x i16>, ptr %15, align 2
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 112
  %18 = load <8 x i16>, ptr %17, align 2
  %19 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 16), align 2
  %20 = shufflevector <8 x i16> %6, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %21 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> zeroinitializer
  %22 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %20, <4 x i16> %21)
  %23 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %24 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %20, <4 x i16> %23)
  %25 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %26 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %20, <4 x i16> %25)
  %27 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %28 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %20, <4 x i16> %27)
  %29 = shufflevector <8 x i16> %6, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %30 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %29, <4 x i16> %21)
  %31 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %29, <4 x i16> %23)
  %32 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %29, <4 x i16> %25)
  %33 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %29, <4 x i16> %27)
  %34 = bitcast <8 x i16> %10 to <4 x i32>
  %35 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %34)
  %36 = icmp eq i64 %35, 0
  br i1 %36, label %56, label %37

37:                                               ; preds = %3
  %38 = shufflevector <8 x i16> %10, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> %23)
  %40 = add <4 x i32> %39, %22
  %41 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> %27)
  %42 = sub <4 x i32> %24, %41
  %43 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> %21)
  %44 = sub <4 x i32> %26, %43
  %45 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %38, <4 x i16> %25)
  %46 = sub <4 x i32> %28, %45
  %47 = shufflevector <8 x i16> %10, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %48 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %47, <4 x i16> %23)
  %49 = add <4 x i32> %48, %30
  %50 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %47, <4 x i16> %27)
  %51 = sub <4 x i32> %31, %50
  %52 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %47, <4 x i16> %21)
  %53 = sub <4 x i32> %32, %52
  %54 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %47, <4 x i16> %25)
  %55 = sub <4 x i32> %33, %54
  br label %56

56:                                               ; preds = %37, %3
  %57 = phi <4 x i32> [ %30, %3 ], [ %49, %37 ]
  %58 = phi <4 x i32> [ %31, %3 ], [ %51, %37 ]
  %59 = phi <4 x i32> [ %32, %3 ], [ %53, %37 ]
  %60 = phi <4 x i32> [ %33, %3 ], [ %55, %37 ]
  %61 = phi <4 x i32> [ %22, %3 ], [ %40, %37 ]
  %62 = phi <4 x i32> [ %24, %3 ], [ %42, %37 ]
  %63 = phi <4 x i32> [ %26, %3 ], [ %44, %37 ]
  %64 = phi <4 x i32> [ %28, %3 ], [ %46, %37 ]
  %65 = bitcast <8 x i16> %14 to <4 x i32>
  %66 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %65)
  %67 = icmp eq i64 %66, 0
  br i1 %67, label %87, label %68

68:                                               ; preds = %56
  %69 = shufflevector <8 x i16> %14, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %69, <4 x i16> %25)
  %71 = add <4 x i32> %70, %61
  %72 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %69, <4 x i16> %21)
  %73 = sub <4 x i32> %62, %72
  %74 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %69, <4 x i16> %27)
  %75 = add <4 x i32> %74, %63
  %76 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %69, <4 x i16> %23)
  %77 = add <4 x i32> %76, %64
  %78 = shufflevector <8 x i16> %14, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %79 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %25)
  %80 = add <4 x i32> %79, %57
  %81 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %21)
  %82 = sub <4 x i32> %58, %81
  %83 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %27)
  %84 = add <4 x i32> %83, %59
  %85 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %78, <4 x i16> %23)
  %86 = add <4 x i32> %85, %60
  br label %87

87:                                               ; preds = %68, %56
  %88 = phi <4 x i32> [ %57, %56 ], [ %80, %68 ]
  %89 = phi <4 x i32> [ %58, %56 ], [ %82, %68 ]
  %90 = phi <4 x i32> [ %59, %56 ], [ %84, %68 ]
  %91 = phi <4 x i32> [ %60, %56 ], [ %86, %68 ]
  %92 = phi <4 x i32> [ %61, %56 ], [ %71, %68 ]
  %93 = phi <4 x i32> [ %62, %56 ], [ %73, %68 ]
  %94 = phi <4 x i32> [ %63, %56 ], [ %75, %68 ]
  %95 = phi <4 x i32> [ %64, %56 ], [ %77, %68 ]
  %96 = bitcast <8 x i16> %18 to <4 x i32>
  %97 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %96)
  %98 = icmp eq i64 %97, 0
  br i1 %98, label %118, label %99

99:                                               ; preds = %87
  %100 = shufflevector <8 x i16> %18, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %101 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %100, <4 x i16> %27)
  %102 = add <4 x i32> %101, %92
  %103 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %100, <4 x i16> %25)
  %104 = sub <4 x i32> %93, %103
  %105 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %100, <4 x i16> %23)
  %106 = add <4 x i32> %105, %94
  %107 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %100, <4 x i16> %21)
  %108 = sub <4 x i32> %95, %107
  %109 = shufflevector <8 x i16> %18, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %110 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %109, <4 x i16> %27)
  %111 = add <4 x i32> %110, %88
  %112 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %109, <4 x i16> %25)
  %113 = sub <4 x i32> %89, %112
  %114 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %109, <4 x i16> %23)
  %115 = add <4 x i32> %114, %90
  %116 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %109, <4 x i16> %21)
  %117 = sub <4 x i32> %91, %116
  br label %118

118:                                              ; preds = %87, %99
  %119 = phi <4 x i32> [ %88, %87 ], [ %111, %99 ]
  %120 = phi <4 x i32> [ %89, %87 ], [ %113, %99 ]
  %121 = phi <4 x i32> [ %90, %87 ], [ %115, %99 ]
  %122 = phi <4 x i32> [ %91, %87 ], [ %117, %99 ]
  %123 = phi <4 x i32> [ %92, %87 ], [ %102, %99 ]
  %124 = phi <4 x i32> [ %93, %87 ], [ %104, %99 ]
  %125 = phi <4 x i32> [ %94, %87 ], [ %106, %99 ]
  %126 = phi <4 x i32> [ %95, %87 ], [ %108, %99 ]
  %127 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2654g_t8E, i64 32), align 2
  %128 = shufflevector <8 x i16> %8, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %129 = shufflevector <4 x i16> %127, <4 x i16> poison, <4 x i32> zeroinitializer
  %130 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %129)
  %131 = shufflevector <4 x i16> %127, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %132 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %128, <4 x i16> %131)
  %133 = shufflevector <8 x i16> %8, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %134 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %133, <4 x i16> %129)
  %135 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %133, <4 x i16> %131)
  %136 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %137 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %136, <4 x i16> %131)
  %138 = add <4 x i32> %137, %130
  %139 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %136, <4 x i16> %129)
  %140 = sub <4 x i32> %132, %139
  %141 = shufflevector <8 x i16> %16, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %142 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %141, <4 x i16> %131)
  %143 = add <4 x i32> %142, %134
  %144 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %141, <4 x i16> %129)
  %145 = sub <4 x i32> %135, %144
  %146 = shufflevector <8 x i16> %4, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %147 = shufflevector <8 x i16> %12, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %148 = sext <4 x i16> %146 to <4 x i32>
  %149 = sext <4 x i16> %147 to <4 x i32>
  %150 = add nsw <4 x i32> %149, %148
  %151 = shl nsw <4 x i32> %150, splat (i32 6)
  %152 = shufflevector <8 x i16> %4, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %153 = shufflevector <8 x i16> %12, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %154 = sext <4 x i16> %152 to <4 x i32>
  %155 = sext <4 x i16> %153 to <4 x i32>
  %156 = add nsw <4 x i32> %155, %154
  %157 = shl nsw <4 x i32> %156, splat (i32 6)
  %158 = sub <8 x i16> %4, %12
  %159 = shufflevector <8 x i16> %158, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %160 = sext <4 x i16> %159 to <4 x i32>
  %161 = shl nsw <4 x i32> %160, splat (i32 6)
  %162 = shufflevector <8 x i16> %158, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %163 = sext <4 x i16> %162 to <4 x i32>
  %164 = shl nsw <4 x i32> %163, splat (i32 6)
  %165 = add <4 x i32> %138, %151
  %166 = add <4 x i32> %140, %161
  %167 = sub <4 x i32> %161, %140
  %168 = sub <4 x i32> %151, %138
  %169 = add <4 x i32> %143, %157
  %170 = add <4 x i32> %145, %164
  %171 = sub <4 x i32> %164, %145
  %172 = sub <4 x i32> %157, %143
  %173 = add <4 x i32> %165, %123
  %174 = add <4 x i32> %169, %119
  %175 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %173, i32 7)
  %176 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %174, i32 7)
  %177 = sub <4 x i32> %168, %126
  %178 = sub <4 x i32> %172, %122
  %179 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %177, i32 7)
  %180 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %178, i32 7)
  %181 = add <4 x i32> %166, %124
  %182 = add <4 x i32> %170, %120
  %183 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %181, i32 7)
  %184 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %182, i32 7)
  %185 = sub <4 x i32> %167, %125
  %186 = sub <4 x i32> %171, %121
  %187 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %185, i32 7)
  %188 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %186, i32 7)
  %189 = add <4 x i32> %167, %125
  %190 = add <4 x i32> %171, %121
  %191 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %189, i32 7)
  %192 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %190, i32 7)
  %193 = sub <4 x i32> %166, %124
  %194 = sub <4 x i32> %170, %120
  %195 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %193, i32 7)
  %196 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %194, i32 7)
  %197 = add <4 x i32> %168, %126
  %198 = add <4 x i32> %172, %122
  %199 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %197, i32 7)
  %200 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %198, i32 7)
  %201 = sub <4 x i32> %165, %123
  %202 = sub <4 x i32> %169, %119
  %203 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %201, i32 7)
  %204 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %202, i32 7)
  %205 = shufflevector <4 x i16> %175, <4 x i16> %179, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %206 = shufflevector <4 x i16> %183, <4 x i16> %187, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %207 = shufflevector <4 x i16> %191, <4 x i16> %195, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %208 = shufflevector <4 x i16> %199, <4 x i16> %203, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %209 = shufflevector <8 x i16> %205, <8 x i16> %207, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %210 = shufflevector <8 x i16> %205, <8 x i16> %207, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %211 = shufflevector <8 x i16> %206, <8 x i16> %208, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %212 = shufflevector <8 x i16> %206, <8 x i16> %208, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %213 = shufflevector <8 x i16> %209, <8 x i16> %211, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %214 = shufflevector <8 x i16> %210, <8 x i16> %212, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %215 = shufflevector <4 x i16> %176, <4 x i16> %180, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %216 = shufflevector <4 x i16> %184, <4 x i16> %188, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %217 = shufflevector <4 x i16> %192, <4 x i16> %196, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %218 = shufflevector <4 x i16> %200, <4 x i16> %204, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %219 = shufflevector <8 x i16> %215, <8 x i16> %217, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %220 = shufflevector <8 x i16> %215, <8 x i16> %217, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %221 = shufflevector <8 x i16> %216, <8 x i16> %218, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %222 = shufflevector <8 x i16> %216, <8 x i16> %218, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %223 = shufflevector <8 x i16> %219, <8 x i16> %221, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %224 = shufflevector <8 x i16> %220, <8 x i16> %222, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %225 = shufflevector <8 x i16> %213, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %226 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %225, <4 x i16> %21)
  %227 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %225, <4 x i16> %23)
  %228 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %225, <4 x i16> %25)
  %229 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %225, <4 x i16> %27)
  %230 = shufflevector <8 x i16> %213, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %231 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %230, <4 x i16> %21)
  %232 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %230, <4 x i16> %23)
  %233 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %230, <4 x i16> %25)
  %234 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %230, <4 x i16> %27)
  %235 = bitcast <8 x i16> %214 to <4 x i32>
  %236 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %235)
  %237 = icmp eq i64 %236, 0
  br i1 %237, label %257, label %238

238:                                              ; preds = %118
  %239 = shufflevector <8 x i16> %214, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %240 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %23)
  %241 = add <4 x i32> %240, %226
  %242 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %27)
  %243 = sub <4 x i32> %227, %242
  %244 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %21)
  %245 = sub <4 x i32> %228, %244
  %246 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %25)
  %247 = sub <4 x i32> %229, %246
  %248 = shufflevector <8 x i16> %214, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %249 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %248, <4 x i16> %23)
  %250 = add <4 x i32> %249, %231
  %251 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %248, <4 x i16> %27)
  %252 = sub <4 x i32> %232, %251
  %253 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %248, <4 x i16> %21)
  %254 = sub <4 x i32> %233, %253
  %255 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %248, <4 x i16> %25)
  %256 = sub <4 x i32> %234, %255
  br label %257

257:                                              ; preds = %238, %118
  %258 = phi <4 x i32> [ %231, %118 ], [ %250, %238 ]
  %259 = phi <4 x i32> [ %232, %118 ], [ %252, %238 ]
  %260 = phi <4 x i32> [ %233, %118 ], [ %254, %238 ]
  %261 = phi <4 x i32> [ %234, %118 ], [ %256, %238 ]
  %262 = phi <4 x i32> [ %226, %118 ], [ %241, %238 ]
  %263 = phi <4 x i32> [ %227, %118 ], [ %243, %238 ]
  %264 = phi <4 x i32> [ %228, %118 ], [ %245, %238 ]
  %265 = phi <4 x i32> [ %229, %118 ], [ %247, %238 ]
  %266 = bitcast <8 x i16> %223 to <4 x i32>
  %267 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %266)
  %268 = icmp eq i64 %267, 0
  br i1 %268, label %288, label %269

269:                                              ; preds = %257
  %270 = shufflevector <8 x i16> %223, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %271 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %270, <4 x i16> %25)
  %272 = add <4 x i32> %271, %262
  %273 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %270, <4 x i16> %21)
  %274 = sub <4 x i32> %263, %273
  %275 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %270, <4 x i16> %27)
  %276 = add <4 x i32> %275, %264
  %277 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %270, <4 x i16> %23)
  %278 = add <4 x i32> %277, %265
  %279 = shufflevector <8 x i16> %223, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %280 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %279, <4 x i16> %25)
  %281 = add <4 x i32> %280, %258
  %282 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %279, <4 x i16> %21)
  %283 = sub <4 x i32> %259, %282
  %284 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %279, <4 x i16> %27)
  %285 = add <4 x i32> %284, %260
  %286 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %279, <4 x i16> %23)
  %287 = add <4 x i32> %286, %261
  br label %288

288:                                              ; preds = %269, %257
  %289 = phi <4 x i32> [ %258, %257 ], [ %281, %269 ]
  %290 = phi <4 x i32> [ %259, %257 ], [ %283, %269 ]
  %291 = phi <4 x i32> [ %260, %257 ], [ %285, %269 ]
  %292 = phi <4 x i32> [ %261, %257 ], [ %287, %269 ]
  %293 = phi <4 x i32> [ %262, %257 ], [ %272, %269 ]
  %294 = phi <4 x i32> [ %263, %257 ], [ %274, %269 ]
  %295 = phi <4 x i32> [ %264, %257 ], [ %276, %269 ]
  %296 = phi <4 x i32> [ %265, %257 ], [ %278, %269 ]
  %297 = bitcast <8 x i16> %224 to <4 x i32>
  %298 = tail call noundef i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32> %297)
  %299 = icmp eq i64 %298, 0
  br i1 %299, label %319, label %300

300:                                              ; preds = %288
  %301 = shufflevector <8 x i16> %224, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %302 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %301, <4 x i16> %27)
  %303 = add <4 x i32> %302, %293
  %304 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %301, <4 x i16> %25)
  %305 = sub <4 x i32> %294, %304
  %306 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %301, <4 x i16> %23)
  %307 = add <4 x i32> %306, %295
  %308 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %301, <4 x i16> %21)
  %309 = sub <4 x i32> %296, %308
  %310 = shufflevector <8 x i16> %224, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %311 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %310, <4 x i16> %27)
  %312 = add <4 x i32> %311, %289
  %313 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %310, <4 x i16> %25)
  %314 = sub <4 x i32> %290, %313
  %315 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %310, <4 x i16> %23)
  %316 = add <4 x i32> %315, %291
  %317 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %310, <4 x i16> %21)
  %318 = sub <4 x i32> %292, %317
  br label %319

319:                                              ; preds = %288, %300
  %320 = phi <4 x i32> [ %289, %288 ], [ %312, %300 ]
  %321 = phi <4 x i32> [ %290, %288 ], [ %314, %300 ]
  %322 = phi <4 x i32> [ %291, %288 ], [ %316, %300 ]
  %323 = phi <4 x i32> [ %292, %288 ], [ %318, %300 ]
  %324 = phi <4 x i32> [ %293, %288 ], [ %303, %300 ]
  %325 = phi <4 x i32> [ %294, %288 ], [ %305, %300 ]
  %326 = phi <4 x i32> [ %295, %288 ], [ %307, %300 ]
  %327 = phi <4 x i32> [ %296, %288 ], [ %309, %300 ]
  %328 = shufflevector <8 x i16> %220, <8 x i16> %222, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %329 = shufflevector <8 x i16> %219, <8 x i16> %221, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %330 = shufflevector <8 x i16> %210, <8 x i16> %212, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %331 = shufflevector <8 x i16> %209, <8 x i16> %211, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %332 = shufflevector <8 x i16> %330, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %333 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %332, <4 x i16> %129)
  %334 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %332, <4 x i16> %131)
  %335 = shufflevector <8 x i16> %330, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %336 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %335, <4 x i16> %129)
  %337 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %335, <4 x i16> %131)
  %338 = shufflevector <8 x i16> %328, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %339 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %338, <4 x i16> %131)
  %340 = add <4 x i32> %339, %333
  %341 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %338, <4 x i16> %129)
  %342 = sub <4 x i32> %334, %341
  %343 = shufflevector <8 x i16> %328, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %344 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %343, <4 x i16> %131)
  %345 = add <4 x i32> %344, %336
  %346 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %343, <4 x i16> %129)
  %347 = sub <4 x i32> %337, %346
  %348 = shufflevector <8 x i16> %331, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %349 = shufflevector <8 x i16> %329, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %350 = sext <4 x i16> %348 to <4 x i32>
  %351 = sext <4 x i16> %349 to <4 x i32>
  %352 = add nsw <4 x i32> %351, %350
  %353 = shl nsw <4 x i32> %352, splat (i32 6)
  %354 = shufflevector <8 x i16> %331, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %355 = shufflevector <8 x i16> %329, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %356 = sext <4 x i16> %354 to <4 x i32>
  %357 = sext <4 x i16> %355 to <4 x i32>
  %358 = add nsw <4 x i32> %357, %356
  %359 = shl nsw <4 x i32> %358, splat (i32 6)
  %360 = sub <8 x i16> %331, %329
  %361 = shufflevector <8 x i16> %360, <8 x i16> poison, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %362 = sext <4 x i16> %361 to <4 x i32>
  %363 = shl nsw <4 x i32> %362, splat (i32 6)
  %364 = shufflevector <8 x i16> %360, <8 x i16> poison, <4 x i32> <i32 4, i32 5, i32 6, i32 7>
  %365 = sext <4 x i16> %364 to <4 x i32>
  %366 = shl nsw <4 x i32> %365, splat (i32 6)
  %367 = add <4 x i32> %340, %353
  %368 = add <4 x i32> %342, %363
  %369 = sub <4 x i32> %363, %342
  %370 = sub <4 x i32> %353, %340
  %371 = add <4 x i32> %345, %359
  %372 = add <4 x i32> %347, %366
  %373 = sub <4 x i32> %366, %347
  %374 = sub <4 x i32> %359, %345
  %375 = add <4 x i32> %367, %324
  %376 = add <4 x i32> %371, %320
  %377 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %375, i32 12)
  %378 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %376, i32 12)
  %379 = sub <4 x i32> %370, %327
  %380 = sub <4 x i32> %374, %323
  %381 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %379, i32 12)
  %382 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %380, i32 12)
  %383 = add <4 x i32> %368, %325
  %384 = add <4 x i32> %372, %321
  %385 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %383, i32 12)
  %386 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %384, i32 12)
  %387 = sub <4 x i32> %369, %326
  %388 = sub <4 x i32> %373, %322
  %389 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %387, i32 12)
  %390 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %388, i32 12)
  %391 = add <4 x i32> %369, %326
  %392 = add <4 x i32> %373, %322
  %393 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %391, i32 12)
  %394 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %392, i32 12)
  %395 = sub <4 x i32> %368, %325
  %396 = sub <4 x i32> %372, %321
  %397 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %395, i32 12)
  %398 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %396, i32 12)
  %399 = add <4 x i32> %370, %327
  %400 = add <4 x i32> %374, %323
  %401 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %399, i32 12)
  %402 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %400, i32 12)
  %403 = sub <4 x i32> %367, %324
  %404 = sub <4 x i32> %371, %320
  %405 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %403, i32 12)
  %406 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %404, i32 12)
  %407 = shufflevector <4 x i16> %377, <4 x i16> %381, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %408 = shufflevector <4 x i16> %385, <4 x i16> %389, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %409 = shufflevector <4 x i16> %393, <4 x i16> %397, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %410 = shufflevector <4 x i16> %401, <4 x i16> %405, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %411 = shufflevector <8 x i16> %407, <8 x i16> %409, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %412 = shufflevector <8 x i16> %407, <8 x i16> %409, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %413 = shufflevector <8 x i16> %408, <8 x i16> %410, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %414 = shufflevector <8 x i16> %408, <8 x i16> %410, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %415 = shufflevector <8 x i16> %411, <8 x i16> %413, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %416 = shufflevector <8 x i16> %411, <8 x i16> %413, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %417 = shufflevector <8 x i16> %412, <8 x i16> %414, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %418 = shufflevector <8 x i16> %412, <8 x i16> %414, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %419 = shufflevector <4 x i16> %378, <4 x i16> %382, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %420 = shufflevector <4 x i16> %386, <4 x i16> %390, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %421 = shufflevector <4 x i16> %394, <4 x i16> %398, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %422 = shufflevector <4 x i16> %402, <4 x i16> %406, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %423 = shufflevector <8 x i16> %419, <8 x i16> %421, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %424 = shufflevector <8 x i16> %419, <8 x i16> %421, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %425 = shufflevector <8 x i16> %420, <8 x i16> %422, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %426 = shufflevector <8 x i16> %420, <8 x i16> %422, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %427 = shufflevector <8 x i16> %423, <8 x i16> %425, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %428 = shufflevector <8 x i16> %423, <8 x i16> %425, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %429 = shufflevector <8 x i16> %424, <8 x i16> %426, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %430 = shufflevector <8 x i16> %424, <8 x i16> %426, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  store <8 x i16> %415, ptr %1, align 2
  %431 = getelementptr inbounds i16, ptr %1, i64 %2
  store <8 x i16> %416, ptr %431, align 2
  %432 = shl nsw i64 %2, 2
  %433 = getelementptr inbounds i8, ptr %1, i64 %432
  store <8 x i16> %417, ptr %433, align 2
  %434 = mul nsw i64 %2, 6
  %435 = getelementptr inbounds i8, ptr %1, i64 %434
  store <8 x i16> %418, ptr %435, align 2
  %436 = shl nsw i64 %2, 3
  %437 = getelementptr inbounds i8, ptr %1, i64 %436
  store <8 x i16> %427, ptr %437, align 2
  %438 = mul nsw i64 %2, 10
  %439 = getelementptr inbounds i8, ptr %1, i64 %438
  store <8 x i16> %428, ptr %439, align 2
  %440 = mul nsw i64 %2, 12
  %441 = getelementptr inbounds i8, ptr %1, i64 %440
  store <8 x i16> %429, ptr %441, align 2
  %442 = mul nsw i64 %2, 14
  %443 = getelementptr inbounds i8, ptr %1, i64 %442
  store <8 x i16> %430, ptr %443, align 2
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26511idct16_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, i64 noundef %2) #2 {
  %4 = alloca [256 x i16], align 32
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 256
  %6 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 128), align 2
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 128
  %8 = shufflevector <4 x i16> %6, <4 x i16> poison, <4 x i32> zeroinitializer
  %9 = shufflevector <4 x i16> %6, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 384
  %11 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 64), align 2
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 64
  %13 = shufflevector <4 x i16> %11, <4 x i16> poison, <4 x i32> zeroinitializer
  %14 = shufflevector <4 x i16> %11, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %15 = shufflevector <4 x i16> %11, <4 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %16 = shufflevector <4 x i16> %11, <4 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 192
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 320
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 448
  %20 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t16E, i64 32), align 2
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %22 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> zeroinitializer
  %23 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %24 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %25 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %26 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 4, i32 4, i32 4, i32 4>
  %27 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 5, i32 5, i32 5, i32 5>
  %28 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 6, i32 6, i32 6, i32 6>
  %29 = shufflevector <8 x i16> %20, <8 x i16> poison, <4 x i32> <i32 7, i32 7, i32 7, i32 7>
  %30 = getelementptr inbounds nuw i8, ptr %0, i64 96
  %31 = getelementptr inbounds nuw i8, ptr %0, i64 160
  %32 = getelementptr inbounds nuw i8, ptr %0, i64 224
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 288
  %34 = getelementptr inbounds nuw i8, ptr %0, i64 352
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 416
  %36 = getelementptr inbounds nuw i8, ptr %0, i64 480
  br label %37

37:                                               ; preds = %349, %3
  %38 = phi i64 [ 0, %3 ], [ %423, %349 ]
  %39 = shl nuw nsw i64 %38, 2
  %40 = getelementptr inbounds nuw i16, ptr %0, i64 %39
  %41 = load <4 x i16>, ptr %40, align 2
  %42 = getelementptr inbounds nuw i16, ptr %5, i64 %39
  %43 = load <4 x i16>, ptr %42, align 2
  %44 = sext <4 x i16> %41 to <4 x i32>
  %45 = sext <4 x i16> %43 to <4 x i32>
  %46 = add nsw <4 x i32> %45, %44
  %47 = shl nsw <4 x i32> %46, splat (i32 6)
  %48 = sub nsw <4 x i32> %44, %45
  %49 = shl nsw <4 x i32> %48, splat (i32 6)
  %50 = getelementptr inbounds nuw i16, ptr %7, i64 %39
  %51 = load <4 x i16>, ptr %50, align 2
  %52 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %51, <4 x i16> %8)
  %53 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %51, <4 x i16> %9)
  %54 = getelementptr inbounds nuw i16, ptr %10, i64 %39
  %55 = load <4 x i16>, ptr %54, align 2
  %56 = bitcast <4 x i16> %55 to i64
  %57 = icmp eq i64 %56, 0
  br i1 %57, label %63, label %58

58:                                               ; preds = %37
  %59 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %55, <4 x i16> %9)
  %60 = add <4 x i32> %59, %52
  %61 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %55, <4 x i16> %8)
  %62 = sub <4 x i32> %53, %61
  br label %63

63:                                               ; preds = %58, %37
  %64 = phi <4 x i32> [ %52, %37 ], [ %60, %58 ]
  %65 = phi <4 x i32> [ %53, %37 ], [ %62, %58 ]
  %66 = add <4 x i32> %64, %47
  %67 = sub <4 x i32> %49, %65
  %68 = add <4 x i32> %65, %49
  %69 = sub <4 x i32> %47, %64
  %70 = getelementptr inbounds nuw i16, ptr %12, i64 %39
  %71 = load <4 x i16>, ptr %70, align 2
  %72 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %71, <4 x i16> %13)
  %73 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %71, <4 x i16> %14)
  %74 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %71, <4 x i16> %15)
  %75 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %71, <4 x i16> %16)
  %76 = getelementptr inbounds nuw i16, ptr %17, i64 %39
  %77 = load <4 x i16>, ptr %76, align 2
  %78 = bitcast <4 x i16> %77 to i64
  %79 = icmp eq i64 %78, 0
  br i1 %79, label %89, label %80

80:                                               ; preds = %63
  %81 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %77, <4 x i16> %14)
  %82 = add <4 x i32> %81, %72
  %83 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %77, <4 x i16> %16)
  %84 = sub <4 x i32> %73, %83
  %85 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %77, <4 x i16> %13)
  %86 = sub <4 x i32> %74, %85
  %87 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %77, <4 x i16> %15)
  %88 = sub <4 x i32> %75, %87
  br label %89

89:                                               ; preds = %80, %63
  %90 = phi <4 x i32> [ %72, %63 ], [ %82, %80 ]
  %91 = phi <4 x i32> [ %73, %63 ], [ %84, %80 ]
  %92 = phi <4 x i32> [ %74, %63 ], [ %86, %80 ]
  %93 = phi <4 x i32> [ %75, %63 ], [ %88, %80 ]
  %94 = getelementptr inbounds nuw i16, ptr %18, i64 %39
  %95 = load <4 x i16>, ptr %94, align 2
  %96 = bitcast <4 x i16> %95 to i64
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %107, label %98

98:                                               ; preds = %89
  %99 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %95, <4 x i16> %15)
  %100 = add <4 x i32> %99, %90
  %101 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %95, <4 x i16> %13)
  %102 = sub <4 x i32> %91, %101
  %103 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %95, <4 x i16> %16)
  %104 = add <4 x i32> %103, %92
  %105 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %95, <4 x i16> %14)
  %106 = add <4 x i32> %105, %93
  br label %107

107:                                              ; preds = %98, %89
  %108 = phi <4 x i32> [ %90, %89 ], [ %100, %98 ]
  %109 = phi <4 x i32> [ %91, %89 ], [ %102, %98 ]
  %110 = phi <4 x i32> [ %92, %89 ], [ %104, %98 ]
  %111 = phi <4 x i32> [ %93, %89 ], [ %106, %98 ]
  %112 = getelementptr inbounds nuw i16, ptr %19, i64 %39
  %113 = load <4 x i16>, ptr %112, align 2
  %114 = bitcast <4 x i16> %113 to i64
  %115 = icmp eq i64 %114, 0
  br i1 %115, label %125, label %116

116:                                              ; preds = %107
  %117 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %113, <4 x i16> %16)
  %118 = add <4 x i32> %117, %108
  %119 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %113, <4 x i16> %15)
  %120 = sub <4 x i32> %109, %119
  %121 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %113, <4 x i16> %14)
  %122 = add <4 x i32> %121, %110
  %123 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %113, <4 x i16> %13)
  %124 = sub <4 x i32> %111, %123
  br label %125

125:                                              ; preds = %116, %107
  %126 = phi <4 x i32> [ %108, %107 ], [ %118, %116 ]
  %127 = phi <4 x i32> [ %109, %107 ], [ %120, %116 ]
  %128 = phi <4 x i32> [ %110, %107 ], [ %122, %116 ]
  %129 = phi <4 x i32> [ %111, %107 ], [ %124, %116 ]
  %130 = add <4 x i32> %126, %66
  %131 = sub <4 x i32> %69, %129
  %132 = add <4 x i32> %127, %68
  %133 = sub <4 x i32> %67, %128
  %134 = add <4 x i32> %128, %67
  %135 = sub <4 x i32> %68, %127
  %136 = add <4 x i32> %129, %69
  %137 = sub <4 x i32> %66, %126
  %138 = getelementptr inbounds nuw i16, ptr %21, i64 %39
  %139 = load <4 x i16>, ptr %138, align 2
  %140 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %22)
  %141 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %23)
  %142 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %24)
  %143 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %25)
  %144 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %26)
  %145 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %27)
  %146 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %28)
  %147 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %139, <4 x i16> %29)
  %148 = getelementptr inbounds nuw i16, ptr %30, i64 %39
  %149 = load <4 x i16>, ptr %148, align 2
  %150 = bitcast <4 x i16> %149 to i64
  %151 = icmp eq i64 %150, 0
  br i1 %151, label %169, label %152

152:                                              ; preds = %125
  %153 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %23)
  %154 = add <4 x i32> %153, %140
  %155 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %26)
  %156 = add <4 x i32> %155, %141
  %157 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %29)
  %158 = add <4 x i32> %157, %142
  %159 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %27)
  %160 = sub <4 x i32> %143, %159
  %161 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %24)
  %162 = sub <4 x i32> %144, %161
  %163 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %22)
  %164 = sub <4 x i32> %145, %163
  %165 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %25)
  %166 = sub <4 x i32> %146, %165
  %167 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %149, <4 x i16> %28)
  %168 = sub <4 x i32> %147, %167
  br label %169

169:                                              ; preds = %152, %125
  %170 = phi <4 x i32> [ %140, %125 ], [ %154, %152 ]
  %171 = phi <4 x i32> [ %141, %125 ], [ %156, %152 ]
  %172 = phi <4 x i32> [ %142, %125 ], [ %158, %152 ]
  %173 = phi <4 x i32> [ %143, %125 ], [ %160, %152 ]
  %174 = phi <4 x i32> [ %144, %125 ], [ %162, %152 ]
  %175 = phi <4 x i32> [ %145, %125 ], [ %164, %152 ]
  %176 = phi <4 x i32> [ %146, %125 ], [ %166, %152 ]
  %177 = phi <4 x i32> [ %147, %125 ], [ %168, %152 ]
  %178 = getelementptr inbounds nuw i16, ptr %31, i64 %39
  %179 = load <4 x i16>, ptr %178, align 2
  %180 = bitcast <4 x i16> %179 to i64
  %181 = icmp eq i64 %180, 0
  br i1 %181, label %199, label %182

182:                                              ; preds = %169
  %183 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %24)
  %184 = add <4 x i32> %183, %170
  %185 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %29)
  %186 = add <4 x i32> %185, %171
  %187 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %25)
  %188 = sub <4 x i32> %172, %187
  %189 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %23)
  %190 = sub <4 x i32> %173, %189
  %191 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %28)
  %192 = sub <4 x i32> %174, %191
  %193 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %26)
  %194 = add <4 x i32> %193, %175
  %195 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %22)
  %196 = add <4 x i32> %195, %176
  %197 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %27)
  %198 = add <4 x i32> %197, %177
  br label %199

199:                                              ; preds = %182, %169
  %200 = phi <4 x i32> [ %170, %169 ], [ %184, %182 ]
  %201 = phi <4 x i32> [ %171, %169 ], [ %186, %182 ]
  %202 = phi <4 x i32> [ %172, %169 ], [ %188, %182 ]
  %203 = phi <4 x i32> [ %173, %169 ], [ %190, %182 ]
  %204 = phi <4 x i32> [ %174, %169 ], [ %192, %182 ]
  %205 = phi <4 x i32> [ %175, %169 ], [ %194, %182 ]
  %206 = phi <4 x i32> [ %176, %169 ], [ %196, %182 ]
  %207 = phi <4 x i32> [ %177, %169 ], [ %198, %182 ]
  %208 = getelementptr inbounds nuw i16, ptr %32, i64 %39
  %209 = load <4 x i16>, ptr %208, align 2
  %210 = bitcast <4 x i16> %209 to i64
  %211 = icmp eq i64 %210, 0
  br i1 %211, label %229, label %212

212:                                              ; preds = %199
  %213 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %25)
  %214 = add <4 x i32> %213, %200
  %215 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %27)
  %216 = sub <4 x i32> %201, %215
  %217 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %23)
  %218 = sub <4 x i32> %202, %217
  %219 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %29)
  %220 = add <4 x i32> %219, %203
  %221 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %22)
  %222 = add <4 x i32> %221, %204
  %223 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %28)
  %224 = add <4 x i32> %223, %205
  %225 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %24)
  %226 = sub <4 x i32> %206, %225
  %227 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %209, <4 x i16> %26)
  %228 = sub <4 x i32> %207, %227
  br label %229

229:                                              ; preds = %212, %199
  %230 = phi <4 x i32> [ %200, %199 ], [ %214, %212 ]
  %231 = phi <4 x i32> [ %201, %199 ], [ %216, %212 ]
  %232 = phi <4 x i32> [ %202, %199 ], [ %218, %212 ]
  %233 = phi <4 x i32> [ %203, %199 ], [ %220, %212 ]
  %234 = phi <4 x i32> [ %204, %199 ], [ %222, %212 ]
  %235 = phi <4 x i32> [ %205, %199 ], [ %224, %212 ]
  %236 = phi <4 x i32> [ %206, %199 ], [ %226, %212 ]
  %237 = phi <4 x i32> [ %207, %199 ], [ %228, %212 ]
  %238 = getelementptr inbounds nuw i16, ptr %33, i64 %39
  %239 = load <4 x i16>, ptr %238, align 2
  %240 = bitcast <4 x i16> %239 to i64
  %241 = icmp eq i64 %240, 0
  br i1 %241, label %259, label %242

242:                                              ; preds = %229
  %243 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %26)
  %244 = add <4 x i32> %243, %230
  %245 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %24)
  %246 = sub <4 x i32> %231, %245
  %247 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %28)
  %248 = sub <4 x i32> %232, %247
  %249 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %22)
  %250 = add <4 x i32> %249, %233
  %251 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %29)
  %252 = sub <4 x i32> %234, %251
  %253 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %23)
  %254 = sub <4 x i32> %235, %253
  %255 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %27)
  %256 = add <4 x i32> %255, %236
  %257 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %239, <4 x i16> %25)
  %258 = add <4 x i32> %257, %237
  br label %259

259:                                              ; preds = %242, %229
  %260 = phi <4 x i32> [ %230, %229 ], [ %244, %242 ]
  %261 = phi <4 x i32> [ %231, %229 ], [ %246, %242 ]
  %262 = phi <4 x i32> [ %232, %229 ], [ %248, %242 ]
  %263 = phi <4 x i32> [ %233, %229 ], [ %250, %242 ]
  %264 = phi <4 x i32> [ %234, %229 ], [ %252, %242 ]
  %265 = phi <4 x i32> [ %235, %229 ], [ %254, %242 ]
  %266 = phi <4 x i32> [ %236, %229 ], [ %256, %242 ]
  %267 = phi <4 x i32> [ %237, %229 ], [ %258, %242 ]
  %268 = getelementptr inbounds nuw i16, ptr %34, i64 %39
  %269 = load <4 x i16>, ptr %268, align 2
  %270 = bitcast <4 x i16> %269 to i64
  %271 = icmp eq i64 %270, 0
  br i1 %271, label %289, label %272

272:                                              ; preds = %259
  %273 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %27)
  %274 = add <4 x i32> %273, %260
  %275 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %22)
  %276 = sub <4 x i32> %261, %275
  %277 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %26)
  %278 = add <4 x i32> %277, %262
  %279 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %28)
  %280 = add <4 x i32> %279, %263
  %281 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %23)
  %282 = sub <4 x i32> %264, %281
  %283 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %25)
  %284 = add <4 x i32> %283, %265
  %285 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %29)
  %286 = add <4 x i32> %285, %266
  %287 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %269, <4 x i16> %24)
  %288 = sub <4 x i32> %267, %287
  br label %289

289:                                              ; preds = %272, %259
  %290 = phi <4 x i32> [ %260, %259 ], [ %274, %272 ]
  %291 = phi <4 x i32> [ %261, %259 ], [ %276, %272 ]
  %292 = phi <4 x i32> [ %262, %259 ], [ %278, %272 ]
  %293 = phi <4 x i32> [ %263, %259 ], [ %280, %272 ]
  %294 = phi <4 x i32> [ %264, %259 ], [ %282, %272 ]
  %295 = phi <4 x i32> [ %265, %259 ], [ %284, %272 ]
  %296 = phi <4 x i32> [ %266, %259 ], [ %286, %272 ]
  %297 = phi <4 x i32> [ %267, %259 ], [ %288, %272 ]
  %298 = getelementptr inbounds nuw i16, ptr %35, i64 %39
  %299 = load <4 x i16>, ptr %298, align 2
  %300 = bitcast <4 x i16> %299 to i64
  %301 = icmp eq i64 %300, 0
  br i1 %301, label %319, label %302

302:                                              ; preds = %289
  %303 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %28)
  %304 = add <4 x i32> %303, %290
  %305 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %25)
  %306 = sub <4 x i32> %291, %305
  %307 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %22)
  %308 = add <4 x i32> %307, %292
  %309 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %24)
  %310 = sub <4 x i32> %293, %309
  %311 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %27)
  %312 = add <4 x i32> %311, %294
  %313 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %29)
  %314 = add <4 x i32> %313, %295
  %315 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %26)
  %316 = sub <4 x i32> %296, %315
  %317 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %299, <4 x i16> %23)
  %318 = add <4 x i32> %317, %297
  br label %319

319:                                              ; preds = %302, %289
  %320 = phi <4 x i32> [ %290, %289 ], [ %304, %302 ]
  %321 = phi <4 x i32> [ %291, %289 ], [ %306, %302 ]
  %322 = phi <4 x i32> [ %292, %289 ], [ %308, %302 ]
  %323 = phi <4 x i32> [ %293, %289 ], [ %310, %302 ]
  %324 = phi <4 x i32> [ %294, %289 ], [ %312, %302 ]
  %325 = phi <4 x i32> [ %295, %289 ], [ %314, %302 ]
  %326 = phi <4 x i32> [ %296, %289 ], [ %316, %302 ]
  %327 = phi <4 x i32> [ %297, %289 ], [ %318, %302 ]
  %328 = getelementptr inbounds nuw i16, ptr %36, i64 %39
  %329 = load <4 x i16>, ptr %328, align 2
  %330 = bitcast <4 x i16> %329 to i64
  %331 = icmp eq i64 %330, 0
  br i1 %331, label %349, label %332

332:                                              ; preds = %319
  %333 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %29)
  %334 = add <4 x i32> %333, %320
  %335 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %28)
  %336 = sub <4 x i32> %321, %335
  %337 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %27)
  %338 = add <4 x i32> %337, %322
  %339 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %26)
  %340 = sub <4 x i32> %323, %339
  %341 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %25)
  %342 = add <4 x i32> %341, %324
  %343 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %24)
  %344 = sub <4 x i32> %325, %343
  %345 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %23)
  %346 = add <4 x i32> %345, %326
  %347 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %329, <4 x i16> %22)
  %348 = sub <4 x i32> %327, %347
  br label %349

349:                                              ; preds = %332, %319
  %350 = phi <4 x i32> [ %320, %319 ], [ %334, %332 ]
  %351 = phi <4 x i32> [ %321, %319 ], [ %336, %332 ]
  %352 = phi <4 x i32> [ %322, %319 ], [ %338, %332 ]
  %353 = phi <4 x i32> [ %323, %319 ], [ %340, %332 ]
  %354 = phi <4 x i32> [ %324, %319 ], [ %342, %332 ]
  %355 = phi <4 x i32> [ %325, %319 ], [ %344, %332 ]
  %356 = phi <4 x i32> [ %326, %319 ], [ %346, %332 ]
  %357 = phi <4 x i32> [ %327, %319 ], [ %348, %332 ]
  %358 = add <4 x i32> %350, %130
  %359 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %358, i32 7)
  %360 = sub <4 x i32> %137, %357
  %361 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %360, i32 7)
  %362 = add <4 x i32> %351, %132
  %363 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %362, i32 7)
  %364 = sub <4 x i32> %135, %356
  %365 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %364, i32 7)
  %366 = add <4 x i32> %352, %134
  %367 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %366, i32 7)
  %368 = sub <4 x i32> %133, %355
  %369 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %368, i32 7)
  %370 = add <4 x i32> %353, %136
  %371 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %370, i32 7)
  %372 = sub <4 x i32> %131, %354
  %373 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %372, i32 7)
  %374 = add <4 x i32> %354, %131
  %375 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %374, i32 7)
  %376 = sub <4 x i32> %136, %353
  %377 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %376, i32 7)
  %378 = add <4 x i32> %355, %133
  %379 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %378, i32 7)
  %380 = sub <4 x i32> %134, %352
  %381 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %380, i32 7)
  %382 = add <4 x i32> %356, %135
  %383 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %382, i32 7)
  %384 = sub <4 x i32> %132, %351
  %385 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %384, i32 7)
  %386 = add <4 x i32> %357, %137
  %387 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %386, i32 7)
  %388 = sub <4 x i32> %130, %350
  %389 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %388, i32 7)
  %390 = shufflevector <4 x i16> %359, <4 x i16> %375, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %391 = shufflevector <4 x i16> %363, <4 x i16> %379, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %392 = shufflevector <4 x i16> %367, <4 x i16> %383, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %393 = shufflevector <4 x i16> %371, <4 x i16> %387, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %394 = shufflevector <8 x i16> %390, <8 x i16> %392, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %395 = shufflevector <8 x i16> %390, <8 x i16> %392, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %396 = shufflevector <8 x i16> %391, <8 x i16> %393, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %397 = shufflevector <8 x i16> %391, <8 x i16> %393, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %398 = shufflevector <8 x i16> %394, <8 x i16> %396, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %399 = shufflevector <8 x i16> %394, <8 x i16> %396, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %400 = shufflevector <8 x i16> %395, <8 x i16> %397, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %401 = shufflevector <8 x i16> %395, <8 x i16> %397, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %402 = shufflevector <4 x i16> %361, <4 x i16> %377, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %403 = shufflevector <4 x i16> %365, <4 x i16> %381, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %404 = shufflevector <4 x i16> %369, <4 x i16> %385, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %405 = shufflevector <4 x i16> %373, <4 x i16> %389, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %406 = shufflevector <8 x i16> %402, <8 x i16> %404, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %407 = shufflevector <8 x i16> %402, <8 x i16> %404, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %408 = shufflevector <8 x i16> %403, <8 x i16> %405, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %409 = shufflevector <8 x i16> %403, <8 x i16> %405, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %410 = shufflevector <8 x i16> %406, <8 x i16> %408, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %411 = shufflevector <8 x i16> %406, <8 x i16> %408, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %412 = shufflevector <8 x i16> %407, <8 x i16> %409, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %413 = shufflevector <8 x i16> %407, <8 x i16> %409, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %414 = shl nuw nsw i64 %38, 7
  %415 = getelementptr inbounds nuw i8, ptr %4, i64 %414
  store <8 x i16> %398, ptr %415, align 32
  %416 = getelementptr inbounds nuw i8, ptr %415, i64 16
  store <8 x i16> %410, ptr %416, align 16
  %417 = getelementptr inbounds nuw i8, ptr %415, i64 32
  store <8 x i16> %399, ptr %417, align 32
  %418 = getelementptr inbounds nuw i8, ptr %415, i64 48
  store <8 x i16> %411, ptr %418, align 16
  %419 = getelementptr inbounds nuw i8, ptr %415, i64 64
  store <8 x i16> %400, ptr %419, align 32
  %420 = getelementptr inbounds nuw i8, ptr %415, i64 80
  store <8 x i16> %412, ptr %420, align 16
  %421 = getelementptr inbounds nuw i8, ptr %415, i64 96
  store <8 x i16> %401, ptr %421, align 32
  %422 = getelementptr inbounds nuw i8, ptr %415, i64 112
  store <8 x i16> %413, ptr %422, align 16
  %423 = add nuw nsw i64 %38, 1
  %424 = icmp eq i64 %423, 4
  br i1 %424, label %425, label %37, !llvm.loop !30

425:                                              ; preds = %349
  %426 = getelementptr inbounds nuw i8, ptr %4, i64 256
  %427 = getelementptr inbounds nuw i8, ptr %4, i64 128
  %428 = getelementptr inbounds nuw i8, ptr %4, i64 384
  %429 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %430 = getelementptr inbounds nuw i8, ptr %4, i64 192
  %431 = getelementptr inbounds nuw i8, ptr %4, i64 320
  %432 = getelementptr inbounds nuw i8, ptr %4, i64 448
  %433 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %434 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %435 = getelementptr inbounds nuw i8, ptr %4, i64 160
  %436 = getelementptr inbounds nuw i8, ptr %4, i64 224
  %437 = getelementptr inbounds nuw i8, ptr %4, i64 288
  %438 = getelementptr inbounds nuw i8, ptr %4, i64 352
  %439 = getelementptr inbounds nuw i8, ptr %4, i64 416
  %440 = getelementptr inbounds nuw i8, ptr %4, i64 480
  br label %441

441:                                              ; preds = %753, %425
  %442 = phi i64 [ 0, %425 ], [ %833, %753 ]
  %443 = shl nuw nsw i64 %442, 2
  %444 = getelementptr inbounds nuw i16, ptr %4, i64 %443
  %445 = load <4 x i16>, ptr %444, align 8
  %446 = getelementptr inbounds nuw i16, ptr %426, i64 %443
  %447 = load <4 x i16>, ptr %446, align 8
  %448 = sext <4 x i16> %445 to <4 x i32>
  %449 = sext <4 x i16> %447 to <4 x i32>
  %450 = add nsw <4 x i32> %449, %448
  %451 = shl nsw <4 x i32> %450, splat (i32 6)
  %452 = sub nsw <4 x i32> %448, %449
  %453 = shl nsw <4 x i32> %452, splat (i32 6)
  %454 = getelementptr inbounds nuw i16, ptr %427, i64 %443
  %455 = load <4 x i16>, ptr %454, align 8
  %456 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %455, <4 x i16> %8)
  %457 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %455, <4 x i16> %9)
  %458 = getelementptr inbounds nuw i16, ptr %428, i64 %443
  %459 = load <4 x i16>, ptr %458, align 8
  %460 = bitcast <4 x i16> %459 to i64
  %461 = icmp eq i64 %460, 0
  br i1 %461, label %467, label %462

462:                                              ; preds = %441
  %463 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %459, <4 x i16> %9)
  %464 = add <4 x i32> %463, %456
  %465 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %459, <4 x i16> %8)
  %466 = sub <4 x i32> %457, %465
  br label %467

467:                                              ; preds = %462, %441
  %468 = phi <4 x i32> [ %456, %441 ], [ %464, %462 ]
  %469 = phi <4 x i32> [ %457, %441 ], [ %466, %462 ]
  %470 = add <4 x i32> %468, %451
  %471 = sub <4 x i32> %453, %469
  %472 = add <4 x i32> %469, %453
  %473 = sub <4 x i32> %451, %468
  %474 = getelementptr inbounds nuw i16, ptr %429, i64 %443
  %475 = load <4 x i16>, ptr %474, align 8
  %476 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %475, <4 x i16> %13)
  %477 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %475, <4 x i16> %14)
  %478 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %475, <4 x i16> %15)
  %479 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %475, <4 x i16> %16)
  %480 = getelementptr inbounds nuw i16, ptr %430, i64 %443
  %481 = load <4 x i16>, ptr %480, align 8
  %482 = bitcast <4 x i16> %481 to i64
  %483 = icmp eq i64 %482, 0
  br i1 %483, label %493, label %484

484:                                              ; preds = %467
  %485 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %481, <4 x i16> %14)
  %486 = add <4 x i32> %485, %476
  %487 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %481, <4 x i16> %16)
  %488 = sub <4 x i32> %477, %487
  %489 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %481, <4 x i16> %13)
  %490 = sub <4 x i32> %478, %489
  %491 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %481, <4 x i16> %15)
  %492 = sub <4 x i32> %479, %491
  br label %493

493:                                              ; preds = %484, %467
  %494 = phi <4 x i32> [ %476, %467 ], [ %486, %484 ]
  %495 = phi <4 x i32> [ %477, %467 ], [ %488, %484 ]
  %496 = phi <4 x i32> [ %478, %467 ], [ %490, %484 ]
  %497 = phi <4 x i32> [ %479, %467 ], [ %492, %484 ]
  %498 = getelementptr inbounds nuw i16, ptr %431, i64 %443
  %499 = load <4 x i16>, ptr %498, align 8
  %500 = bitcast <4 x i16> %499 to i64
  %501 = icmp eq i64 %500, 0
  br i1 %501, label %511, label %502

502:                                              ; preds = %493
  %503 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %499, <4 x i16> %15)
  %504 = add <4 x i32> %503, %494
  %505 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %499, <4 x i16> %13)
  %506 = sub <4 x i32> %495, %505
  %507 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %499, <4 x i16> %16)
  %508 = add <4 x i32> %507, %496
  %509 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %499, <4 x i16> %14)
  %510 = add <4 x i32> %509, %497
  br label %511

511:                                              ; preds = %502, %493
  %512 = phi <4 x i32> [ %494, %493 ], [ %504, %502 ]
  %513 = phi <4 x i32> [ %495, %493 ], [ %506, %502 ]
  %514 = phi <4 x i32> [ %496, %493 ], [ %508, %502 ]
  %515 = phi <4 x i32> [ %497, %493 ], [ %510, %502 ]
  %516 = getelementptr inbounds nuw i16, ptr %432, i64 %443
  %517 = load <4 x i16>, ptr %516, align 8
  %518 = bitcast <4 x i16> %517 to i64
  %519 = icmp eq i64 %518, 0
  br i1 %519, label %529, label %520

520:                                              ; preds = %511
  %521 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %517, <4 x i16> %16)
  %522 = add <4 x i32> %521, %512
  %523 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %517, <4 x i16> %15)
  %524 = sub <4 x i32> %513, %523
  %525 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %517, <4 x i16> %14)
  %526 = add <4 x i32> %525, %514
  %527 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %517, <4 x i16> %13)
  %528 = sub <4 x i32> %515, %527
  br label %529

529:                                              ; preds = %520, %511
  %530 = phi <4 x i32> [ %512, %511 ], [ %522, %520 ]
  %531 = phi <4 x i32> [ %513, %511 ], [ %524, %520 ]
  %532 = phi <4 x i32> [ %514, %511 ], [ %526, %520 ]
  %533 = phi <4 x i32> [ %515, %511 ], [ %528, %520 ]
  %534 = add <4 x i32> %530, %470
  %535 = sub <4 x i32> %473, %533
  %536 = add <4 x i32> %531, %472
  %537 = sub <4 x i32> %471, %532
  %538 = add <4 x i32> %532, %471
  %539 = sub <4 x i32> %472, %531
  %540 = add <4 x i32> %533, %473
  %541 = sub <4 x i32> %470, %530
  %542 = getelementptr inbounds nuw i16, ptr %433, i64 %443
  %543 = load <4 x i16>, ptr %542, align 8
  %544 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %22)
  %545 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %23)
  %546 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %24)
  %547 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %25)
  %548 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %26)
  %549 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %27)
  %550 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %28)
  %551 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %543, <4 x i16> %29)
  %552 = getelementptr inbounds nuw i16, ptr %434, i64 %443
  %553 = load <4 x i16>, ptr %552, align 8
  %554 = bitcast <4 x i16> %553 to i64
  %555 = icmp eq i64 %554, 0
  br i1 %555, label %573, label %556

556:                                              ; preds = %529
  %557 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %23)
  %558 = add <4 x i32> %557, %544
  %559 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %26)
  %560 = add <4 x i32> %559, %545
  %561 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %29)
  %562 = add <4 x i32> %561, %546
  %563 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %27)
  %564 = sub <4 x i32> %547, %563
  %565 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %24)
  %566 = sub <4 x i32> %548, %565
  %567 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %22)
  %568 = sub <4 x i32> %549, %567
  %569 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %25)
  %570 = sub <4 x i32> %550, %569
  %571 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %553, <4 x i16> %28)
  %572 = sub <4 x i32> %551, %571
  br label %573

573:                                              ; preds = %556, %529
  %574 = phi <4 x i32> [ %544, %529 ], [ %558, %556 ]
  %575 = phi <4 x i32> [ %545, %529 ], [ %560, %556 ]
  %576 = phi <4 x i32> [ %546, %529 ], [ %562, %556 ]
  %577 = phi <4 x i32> [ %547, %529 ], [ %564, %556 ]
  %578 = phi <4 x i32> [ %548, %529 ], [ %566, %556 ]
  %579 = phi <4 x i32> [ %549, %529 ], [ %568, %556 ]
  %580 = phi <4 x i32> [ %550, %529 ], [ %570, %556 ]
  %581 = phi <4 x i32> [ %551, %529 ], [ %572, %556 ]
  %582 = getelementptr inbounds nuw i16, ptr %435, i64 %443
  %583 = load <4 x i16>, ptr %582, align 8
  %584 = bitcast <4 x i16> %583 to i64
  %585 = icmp eq i64 %584, 0
  br i1 %585, label %603, label %586

586:                                              ; preds = %573
  %587 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %24)
  %588 = add <4 x i32> %587, %574
  %589 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %29)
  %590 = add <4 x i32> %589, %575
  %591 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %25)
  %592 = sub <4 x i32> %576, %591
  %593 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %23)
  %594 = sub <4 x i32> %577, %593
  %595 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %28)
  %596 = sub <4 x i32> %578, %595
  %597 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %26)
  %598 = add <4 x i32> %597, %579
  %599 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %22)
  %600 = add <4 x i32> %599, %580
  %601 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %583, <4 x i16> %27)
  %602 = add <4 x i32> %601, %581
  br label %603

603:                                              ; preds = %586, %573
  %604 = phi <4 x i32> [ %574, %573 ], [ %588, %586 ]
  %605 = phi <4 x i32> [ %575, %573 ], [ %590, %586 ]
  %606 = phi <4 x i32> [ %576, %573 ], [ %592, %586 ]
  %607 = phi <4 x i32> [ %577, %573 ], [ %594, %586 ]
  %608 = phi <4 x i32> [ %578, %573 ], [ %596, %586 ]
  %609 = phi <4 x i32> [ %579, %573 ], [ %598, %586 ]
  %610 = phi <4 x i32> [ %580, %573 ], [ %600, %586 ]
  %611 = phi <4 x i32> [ %581, %573 ], [ %602, %586 ]
  %612 = getelementptr inbounds nuw i16, ptr %436, i64 %443
  %613 = load <4 x i16>, ptr %612, align 8
  %614 = bitcast <4 x i16> %613 to i64
  %615 = icmp eq i64 %614, 0
  br i1 %615, label %633, label %616

616:                                              ; preds = %603
  %617 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %25)
  %618 = add <4 x i32> %617, %604
  %619 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %27)
  %620 = sub <4 x i32> %605, %619
  %621 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %23)
  %622 = sub <4 x i32> %606, %621
  %623 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %29)
  %624 = add <4 x i32> %623, %607
  %625 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %22)
  %626 = add <4 x i32> %625, %608
  %627 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %28)
  %628 = add <4 x i32> %627, %609
  %629 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %24)
  %630 = sub <4 x i32> %610, %629
  %631 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %613, <4 x i16> %26)
  %632 = sub <4 x i32> %611, %631
  br label %633

633:                                              ; preds = %616, %603
  %634 = phi <4 x i32> [ %604, %603 ], [ %618, %616 ]
  %635 = phi <4 x i32> [ %605, %603 ], [ %620, %616 ]
  %636 = phi <4 x i32> [ %606, %603 ], [ %622, %616 ]
  %637 = phi <4 x i32> [ %607, %603 ], [ %624, %616 ]
  %638 = phi <4 x i32> [ %608, %603 ], [ %626, %616 ]
  %639 = phi <4 x i32> [ %609, %603 ], [ %628, %616 ]
  %640 = phi <4 x i32> [ %610, %603 ], [ %630, %616 ]
  %641 = phi <4 x i32> [ %611, %603 ], [ %632, %616 ]
  %642 = getelementptr inbounds nuw i16, ptr %437, i64 %443
  %643 = load <4 x i16>, ptr %642, align 8
  %644 = bitcast <4 x i16> %643 to i64
  %645 = icmp eq i64 %644, 0
  br i1 %645, label %663, label %646

646:                                              ; preds = %633
  %647 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %26)
  %648 = add <4 x i32> %647, %634
  %649 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %24)
  %650 = sub <4 x i32> %635, %649
  %651 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %28)
  %652 = sub <4 x i32> %636, %651
  %653 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %22)
  %654 = add <4 x i32> %653, %637
  %655 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %29)
  %656 = sub <4 x i32> %638, %655
  %657 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %23)
  %658 = sub <4 x i32> %639, %657
  %659 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %27)
  %660 = add <4 x i32> %659, %640
  %661 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %643, <4 x i16> %25)
  %662 = add <4 x i32> %661, %641
  br label %663

663:                                              ; preds = %646, %633
  %664 = phi <4 x i32> [ %634, %633 ], [ %648, %646 ]
  %665 = phi <4 x i32> [ %635, %633 ], [ %650, %646 ]
  %666 = phi <4 x i32> [ %636, %633 ], [ %652, %646 ]
  %667 = phi <4 x i32> [ %637, %633 ], [ %654, %646 ]
  %668 = phi <4 x i32> [ %638, %633 ], [ %656, %646 ]
  %669 = phi <4 x i32> [ %639, %633 ], [ %658, %646 ]
  %670 = phi <4 x i32> [ %640, %633 ], [ %660, %646 ]
  %671 = phi <4 x i32> [ %641, %633 ], [ %662, %646 ]
  %672 = getelementptr inbounds nuw i16, ptr %438, i64 %443
  %673 = load <4 x i16>, ptr %672, align 8
  %674 = bitcast <4 x i16> %673 to i64
  %675 = icmp eq i64 %674, 0
  br i1 %675, label %693, label %676

676:                                              ; preds = %663
  %677 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %27)
  %678 = add <4 x i32> %677, %664
  %679 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %22)
  %680 = sub <4 x i32> %665, %679
  %681 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %26)
  %682 = add <4 x i32> %681, %666
  %683 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %28)
  %684 = add <4 x i32> %683, %667
  %685 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %23)
  %686 = sub <4 x i32> %668, %685
  %687 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %25)
  %688 = add <4 x i32> %687, %669
  %689 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %29)
  %690 = add <4 x i32> %689, %670
  %691 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %673, <4 x i16> %24)
  %692 = sub <4 x i32> %671, %691
  br label %693

693:                                              ; preds = %676, %663
  %694 = phi <4 x i32> [ %664, %663 ], [ %678, %676 ]
  %695 = phi <4 x i32> [ %665, %663 ], [ %680, %676 ]
  %696 = phi <4 x i32> [ %666, %663 ], [ %682, %676 ]
  %697 = phi <4 x i32> [ %667, %663 ], [ %684, %676 ]
  %698 = phi <4 x i32> [ %668, %663 ], [ %686, %676 ]
  %699 = phi <4 x i32> [ %669, %663 ], [ %688, %676 ]
  %700 = phi <4 x i32> [ %670, %663 ], [ %690, %676 ]
  %701 = phi <4 x i32> [ %671, %663 ], [ %692, %676 ]
  %702 = getelementptr inbounds nuw i16, ptr %439, i64 %443
  %703 = load <4 x i16>, ptr %702, align 8
  %704 = bitcast <4 x i16> %703 to i64
  %705 = icmp eq i64 %704, 0
  br i1 %705, label %723, label %706

706:                                              ; preds = %693
  %707 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %28)
  %708 = add <4 x i32> %707, %694
  %709 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %25)
  %710 = sub <4 x i32> %695, %709
  %711 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %22)
  %712 = add <4 x i32> %711, %696
  %713 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %24)
  %714 = sub <4 x i32> %697, %713
  %715 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %27)
  %716 = add <4 x i32> %715, %698
  %717 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %29)
  %718 = add <4 x i32> %717, %699
  %719 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %26)
  %720 = sub <4 x i32> %700, %719
  %721 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %703, <4 x i16> %23)
  %722 = add <4 x i32> %721, %701
  br label %723

723:                                              ; preds = %706, %693
  %724 = phi <4 x i32> [ %694, %693 ], [ %708, %706 ]
  %725 = phi <4 x i32> [ %695, %693 ], [ %710, %706 ]
  %726 = phi <4 x i32> [ %696, %693 ], [ %712, %706 ]
  %727 = phi <4 x i32> [ %697, %693 ], [ %714, %706 ]
  %728 = phi <4 x i32> [ %698, %693 ], [ %716, %706 ]
  %729 = phi <4 x i32> [ %699, %693 ], [ %718, %706 ]
  %730 = phi <4 x i32> [ %700, %693 ], [ %720, %706 ]
  %731 = phi <4 x i32> [ %701, %693 ], [ %722, %706 ]
  %732 = getelementptr inbounds nuw i16, ptr %440, i64 %443
  %733 = load <4 x i16>, ptr %732, align 8
  %734 = bitcast <4 x i16> %733 to i64
  %735 = icmp eq i64 %734, 0
  br i1 %735, label %753, label %736

736:                                              ; preds = %723
  %737 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %29)
  %738 = add <4 x i32> %737, %724
  %739 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %28)
  %740 = sub <4 x i32> %725, %739
  %741 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %27)
  %742 = add <4 x i32> %741, %726
  %743 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %26)
  %744 = sub <4 x i32> %727, %743
  %745 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %25)
  %746 = add <4 x i32> %745, %728
  %747 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %24)
  %748 = sub <4 x i32> %729, %747
  %749 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %23)
  %750 = add <4 x i32> %749, %730
  %751 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %733, <4 x i16> %22)
  %752 = sub <4 x i32> %731, %751
  br label %753

753:                                              ; preds = %736, %723
  %754 = phi <4 x i32> [ %724, %723 ], [ %738, %736 ]
  %755 = phi <4 x i32> [ %725, %723 ], [ %740, %736 ]
  %756 = phi <4 x i32> [ %726, %723 ], [ %742, %736 ]
  %757 = phi <4 x i32> [ %727, %723 ], [ %744, %736 ]
  %758 = phi <4 x i32> [ %728, %723 ], [ %746, %736 ]
  %759 = phi <4 x i32> [ %729, %723 ], [ %748, %736 ]
  %760 = phi <4 x i32> [ %730, %723 ], [ %750, %736 ]
  %761 = phi <4 x i32> [ %731, %723 ], [ %752, %736 ]
  %762 = add <4 x i32> %754, %534
  %763 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %762, i32 12)
  %764 = sub <4 x i32> %541, %761
  %765 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %764, i32 12)
  %766 = add <4 x i32> %755, %536
  %767 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %766, i32 12)
  %768 = sub <4 x i32> %539, %760
  %769 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %768, i32 12)
  %770 = add <4 x i32> %756, %538
  %771 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %770, i32 12)
  %772 = sub <4 x i32> %537, %759
  %773 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %772, i32 12)
  %774 = add <4 x i32> %757, %540
  %775 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %774, i32 12)
  %776 = sub <4 x i32> %535, %758
  %777 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %776, i32 12)
  %778 = add <4 x i32> %758, %535
  %779 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %778, i32 12)
  %780 = sub <4 x i32> %540, %757
  %781 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %780, i32 12)
  %782 = add <4 x i32> %759, %537
  %783 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %782, i32 12)
  %784 = sub <4 x i32> %538, %756
  %785 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %784, i32 12)
  %786 = add <4 x i32> %760, %539
  %787 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %786, i32 12)
  %788 = sub <4 x i32> %536, %755
  %789 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %788, i32 12)
  %790 = add <4 x i32> %761, %541
  %791 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %790, i32 12)
  %792 = sub <4 x i32> %534, %754
  %793 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %792, i32 12)
  %794 = shufflevector <4 x i16> %763, <4 x i16> %779, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %795 = shufflevector <4 x i16> %767, <4 x i16> %783, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %796 = shufflevector <4 x i16> %771, <4 x i16> %787, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %797 = shufflevector <4 x i16> %775, <4 x i16> %791, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %798 = shufflevector <8 x i16> %794, <8 x i16> %796, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %799 = shufflevector <8 x i16> %794, <8 x i16> %796, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %800 = shufflevector <8 x i16> %795, <8 x i16> %797, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %801 = shufflevector <8 x i16> %795, <8 x i16> %797, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %802 = shufflevector <8 x i16> %798, <8 x i16> %800, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %803 = shufflevector <8 x i16> %798, <8 x i16> %800, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %804 = shufflevector <8 x i16> %799, <8 x i16> %801, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %805 = shufflevector <8 x i16> %799, <8 x i16> %801, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %806 = shufflevector <4 x i16> %765, <4 x i16> %781, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %807 = shufflevector <4 x i16> %769, <4 x i16> %785, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %808 = shufflevector <4 x i16> %773, <4 x i16> %789, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %809 = shufflevector <4 x i16> %777, <4 x i16> %793, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %810 = shufflevector <8 x i16> %806, <8 x i16> %808, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %811 = shufflevector <8 x i16> %806, <8 x i16> %808, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %812 = shufflevector <8 x i16> %807, <8 x i16> %809, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %813 = shufflevector <8 x i16> %807, <8 x i16> %809, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %814 = shufflevector <8 x i16> %810, <8 x i16> %812, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %815 = shufflevector <8 x i16> %810, <8 x i16> %812, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %816 = shufflevector <8 x i16> %811, <8 x i16> %813, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %817 = shufflevector <8 x i16> %811, <8 x i16> %813, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %818 = mul nsw i64 %443, %2
  %819 = getelementptr inbounds i16, ptr %1, i64 %818
  store <8 x i16> %802, ptr %819, align 2
  %820 = getelementptr inbounds nuw i8, ptr %819, i64 16
  store <8 x i16> %814, ptr %820, align 2
  %821 = or disjoint i64 %443, 1
  %822 = mul nsw i64 %821, %2
  %823 = getelementptr inbounds i16, ptr %1, i64 %822
  store <8 x i16> %803, ptr %823, align 2
  %824 = getelementptr inbounds nuw i8, ptr %823, i64 16
  store <8 x i16> %815, ptr %824, align 2
  %825 = or disjoint i64 %443, 2
  %826 = mul nsw i64 %825, %2
  %827 = getelementptr inbounds i16, ptr %1, i64 %826
  store <8 x i16> %804, ptr %827, align 2
  %828 = getelementptr inbounds nuw i8, ptr %827, i64 16
  store <8 x i16> %816, ptr %828, align 2
  %829 = or disjoint i64 %443, 3
  %830 = mul nsw i64 %829, %2
  %831 = getelementptr inbounds i16, ptr %1, i64 %830
  store <8 x i16> %805, ptr %831, align 2
  %832 = getelementptr inbounds nuw i8, ptr %831, i64 16
  store <8 x i16> %817, ptr %832, align 2
  %833 = add nuw nsw i64 %442, 1
  %834 = icmp eq i64 %833, 4
  br i1 %834, label %835, label %441, !llvm.loop !31

835:                                              ; preds = %753
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_ZN4x26511idct32_neonEPKsPsl(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, i64 noundef %2) #2 {
  %4 = alloca [16 x <4 x i32>], align 16
  %5 = alloca [16 x <4 x i32>], align 16
  %6 = alloca [16 x <4 x i16>], align 8
  %7 = alloca [16 x <4 x i16>], align 8
  %8 = alloca [16 x <4 x i32>], align 16
  %9 = alloca [16 x <4 x i32>], align 16
  %10 = alloca [16 x <4 x i16>], align 8
  %11 = alloca [16 x <4 x i16>], align 8
  %12 = alloca [1024 x i16], align 32
  call void @llvm.lifetime.start.p0(ptr nonnull %12) #10
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 1024
  %14 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t32E, i64 512), align 2
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 512
  %16 = shufflevector <4 x i16> %14, <4 x i16> poison, <4 x i32> zeroinitializer
  %17 = shufflevector <4 x i16> %14, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 1536
  %19 = load <4 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t32E, i64 256), align 2
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 256
  %21 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> zeroinitializer
  %22 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %23 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %24 = shufflevector <4 x i16> %19, <4 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %25 = getelementptr inbounds nuw i8, ptr %0, i64 768
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 1280
  %27 = getelementptr inbounds nuw i8, ptr %0, i64 1792
  %28 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t32E, i64 128), align 2
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 128
  %30 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> zeroinitializer
  %31 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %32 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %33 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %34 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 4, i32 4, i32 4, i32 4>
  %35 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 5, i32 5, i32 5, i32 5>
  %36 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 6, i32 6, i32 6, i32 6>
  %37 = shufflevector <8 x i16> %28, <8 x i16> poison, <4 x i32> <i32 7, i32 7, i32 7, i32 7>
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 384
  %39 = getelementptr inbounds nuw i8, ptr %0, i64 640
  %40 = getelementptr inbounds nuw i8, ptr %0, i64 896
  %41 = getelementptr inbounds nuw i8, ptr %0, i64 1152
  %42 = getelementptr inbounds nuw i8, ptr %0, i64 1408
  %43 = getelementptr inbounds nuw i8, ptr %0, i64 1664
  %44 = getelementptr inbounds nuw i8, ptr %0, i64 1920
  %45 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t32E, i64 64), align 2
  %46 = load <8 x i16>, ptr getelementptr inbounds nuw (i8, ptr @_ZN4x2655g_t32E, i64 80), align 2
  %47 = getelementptr inbounds nuw i8, ptr %0, i64 64
  %48 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> zeroinitializer
  %49 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %50 = getelementptr inbounds nuw i8, ptr %9, i64 16
  %51 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %52 = getelementptr inbounds nuw i8, ptr %9, i64 32
  %53 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %54 = getelementptr inbounds nuw i8, ptr %9, i64 48
  %55 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 4, i32 4, i32 4, i32 4>
  %56 = getelementptr inbounds nuw i8, ptr %9, i64 64
  %57 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 5, i32 5, i32 5, i32 5>
  %58 = getelementptr inbounds nuw i8, ptr %9, i64 80
  %59 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 6, i32 6, i32 6, i32 6>
  %60 = getelementptr inbounds nuw i8, ptr %9, i64 96
  %61 = shufflevector <8 x i16> %45, <8 x i16> poison, <4 x i32> <i32 7, i32 7, i32 7, i32 7>
  %62 = getelementptr inbounds nuw i8, ptr %9, i64 112
  %63 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> zeroinitializer
  %64 = getelementptr inbounds nuw i8, ptr %9, i64 128
  %65 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 1, i32 1, i32 1, i32 1>
  %66 = getelementptr inbounds nuw i8, ptr %9, i64 144
  %67 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 2, i32 2, i32 2, i32 2>
  %68 = getelementptr inbounds nuw i8, ptr %9, i64 160
  %69 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 3, i32 3, i32 3, i32 3>
  %70 = getelementptr inbounds nuw i8, ptr %9, i64 176
  %71 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 4, i32 4, i32 4, i32 4>
  %72 = getelementptr inbounds nuw i8, ptr %9, i64 192
  %73 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 5, i32 5, i32 5, i32 5>
  %74 = getelementptr inbounds nuw i8, ptr %9, i64 208
  %75 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 6, i32 6, i32 6, i32 6>
  %76 = getelementptr inbounds nuw i8, ptr %9, i64 224
  %77 = shufflevector <8 x i16> %46, <8 x i16> poison, <4 x i32> <i32 7, i32 7, i32 7, i32 7>
  %78 = getelementptr inbounds nuw i8, ptr %9, i64 240
  %79 = getelementptr inbounds nuw i8, ptr %0, i64 192
  %80 = getelementptr inbounds nuw i8, ptr %0, i64 320
  %81 = getelementptr inbounds nuw i8, ptr %0, i64 448
  %82 = getelementptr inbounds nuw i8, ptr %0, i64 576
  %83 = getelementptr inbounds nuw i8, ptr %0, i64 704
  %84 = getelementptr inbounds nuw i8, ptr %0, i64 832
  %85 = getelementptr inbounds nuw i8, ptr %0, i64 960
  %86 = getelementptr inbounds nuw i8, ptr %0, i64 1088
  %87 = getelementptr inbounds nuw i8, ptr %0, i64 1216
  %88 = getelementptr inbounds nuw i8, ptr %0, i64 1344
  %89 = getelementptr inbounds nuw i8, ptr %0, i64 1472
  %90 = getelementptr inbounds nuw i8, ptr %0, i64 1600
  %91 = getelementptr inbounds nuw i8, ptr %0, i64 1728
  %92 = getelementptr inbounds nuw i8, ptr %0, i64 1856
  %93 = getelementptr inbounds nuw i8, ptr %0, i64 1984
  %94 = getelementptr inbounds nuw i8, ptr %10, i64 8
  %95 = getelementptr inbounds nuw i8, ptr %10, i64 16
  %96 = getelementptr inbounds nuw i8, ptr %10, i64 24
  %97 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %98 = getelementptr inbounds nuw i8, ptr %10, i64 40
  %99 = getelementptr inbounds nuw i8, ptr %10, i64 48
  %100 = getelementptr inbounds nuw i8, ptr %10, i64 56
  %101 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %102 = getelementptr inbounds nuw i8, ptr %10, i64 72
  %103 = getelementptr inbounds nuw i8, ptr %10, i64 80
  %104 = getelementptr inbounds nuw i8, ptr %10, i64 88
  %105 = getelementptr inbounds nuw i8, ptr %10, i64 96
  %106 = getelementptr inbounds nuw i8, ptr %10, i64 104
  %107 = getelementptr inbounds nuw i8, ptr %10, i64 112
  %108 = getelementptr inbounds nuw i8, ptr %10, i64 120
  %109 = getelementptr inbounds nuw i8, ptr %11, i64 8
  %110 = getelementptr inbounds nuw i8, ptr %11, i64 16
  %111 = getelementptr inbounds nuw i8, ptr %11, i64 24
  %112 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %113 = getelementptr inbounds nuw i8, ptr %11, i64 40
  %114 = getelementptr inbounds nuw i8, ptr %11, i64 48
  %115 = getelementptr inbounds nuw i8, ptr %11, i64 56
  %116 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %117 = getelementptr inbounds nuw i8, ptr %11, i64 72
  %118 = getelementptr inbounds nuw i8, ptr %11, i64 80
  %119 = getelementptr inbounds nuw i8, ptr %11, i64 88
  %120 = getelementptr inbounds nuw i8, ptr %11, i64 96
  %121 = getelementptr inbounds nuw i8, ptr %11, i64 104
  %122 = getelementptr inbounds nuw i8, ptr %11, i64 112
  %123 = getelementptr inbounds nuw i8, ptr %11, i64 120
  %124 = getelementptr inbounds nuw i8, ptr %8, i64 128
  %125 = getelementptr inbounds nuw i8, ptr %8, i64 16
  %126 = getelementptr inbounds nuw i8, ptr %8, i64 144
  %127 = getelementptr inbounds nuw i8, ptr %8, i64 32
  %128 = getelementptr inbounds nuw i8, ptr %8, i64 160
  %129 = getelementptr inbounds nuw i8, ptr %8, i64 48
  %130 = getelementptr inbounds nuw i8, ptr %8, i64 176
  %131 = getelementptr inbounds nuw i8, ptr %8, i64 64
  %132 = getelementptr inbounds nuw i8, ptr %8, i64 192
  %133 = getelementptr inbounds nuw i8, ptr %8, i64 80
  %134 = getelementptr inbounds nuw i8, ptr %8, i64 208
  %135 = getelementptr inbounds nuw i8, ptr %8, i64 96
  %136 = getelementptr inbounds nuw i8, ptr %8, i64 224
  %137 = getelementptr inbounds nuw i8, ptr %8, i64 112
  %138 = getelementptr inbounds nuw i8, ptr %8, i64 240
  br label %139

139:                                              ; preds = %1288, %3
  %140 = phi i64 [ 0, %3 ], [ %1386, %1288 ]
  %141 = shl nuw nsw i64 %140, 2
  %142 = getelementptr inbounds nuw i16, ptr %0, i64 %141
  %143 = load <4 x i16>, ptr %142, align 2
  %144 = getelementptr inbounds nuw i16, ptr %13, i64 %141
  %145 = load <4 x i16>, ptr %144, align 2
  %146 = sext <4 x i16> %143 to <4 x i32>
  %147 = sext <4 x i16> %145 to <4 x i32>
  %148 = add nsw <4 x i32> %147, %146
  %149 = shl nsw <4 x i32> %148, splat (i32 6)
  %150 = sub nsw <4 x i32> %146, %147
  %151 = shl nsw <4 x i32> %150, splat (i32 6)
  %152 = getelementptr inbounds nuw i16, ptr %15, i64 %141
  %153 = load <4 x i16>, ptr %152, align 2
  %154 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %153, <4 x i16> %16)
  %155 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %153, <4 x i16> %17)
  %156 = getelementptr inbounds nuw i16, ptr %18, i64 %141
  %157 = load <4 x i16>, ptr %156, align 2
  %158 = bitcast <4 x i16> %157 to i64
  %159 = icmp eq i64 %158, 0
  br i1 %159, label %165, label %160

160:                                              ; preds = %139
  %161 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %157, <4 x i16> %17)
  %162 = add <4 x i32> %161, %154
  %163 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %157, <4 x i16> %16)
  %164 = sub <4 x i32> %155, %163
  br label %165

165:                                              ; preds = %160, %139
  %166 = phi <4 x i32> [ %154, %139 ], [ %162, %160 ]
  %167 = phi <4 x i32> [ %155, %139 ], [ %164, %160 ]
  %168 = add <4 x i32> %166, %149
  %169 = sub <4 x i32> %151, %167
  %170 = add <4 x i32> %167, %151
  %171 = sub <4 x i32> %149, %166
  %172 = getelementptr inbounds nuw i16, ptr %20, i64 %141
  %173 = load <4 x i16>, ptr %172, align 2
  %174 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %173, <4 x i16> %21)
  %175 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %173, <4 x i16> %22)
  %176 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %173, <4 x i16> %23)
  %177 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %173, <4 x i16> %24)
  %178 = getelementptr inbounds nuw i16, ptr %25, i64 %141
  %179 = load <4 x i16>, ptr %178, align 2
  %180 = bitcast <4 x i16> %179 to i64
  %181 = icmp eq i64 %180, 0
  br i1 %181, label %191, label %182

182:                                              ; preds = %165
  %183 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %22)
  %184 = add <4 x i32> %183, %174
  %185 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %24)
  %186 = sub <4 x i32> %175, %185
  %187 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %21)
  %188 = sub <4 x i32> %176, %187
  %189 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %179, <4 x i16> %23)
  %190 = sub <4 x i32> %177, %189
  br label %191

191:                                              ; preds = %182, %165
  %192 = phi <4 x i32> [ %174, %165 ], [ %184, %182 ]
  %193 = phi <4 x i32> [ %175, %165 ], [ %186, %182 ]
  %194 = phi <4 x i32> [ %176, %165 ], [ %188, %182 ]
  %195 = phi <4 x i32> [ %177, %165 ], [ %190, %182 ]
  %196 = getelementptr inbounds nuw i16, ptr %26, i64 %141
  %197 = load <4 x i16>, ptr %196, align 2
  %198 = bitcast <4 x i16> %197 to i64
  %199 = icmp eq i64 %198, 0
  br i1 %199, label %209, label %200

200:                                              ; preds = %191
  %201 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %197, <4 x i16> %23)
  %202 = add <4 x i32> %201, %192
  %203 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %197, <4 x i16> %21)
  %204 = sub <4 x i32> %193, %203
  %205 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %197, <4 x i16> %24)
  %206 = add <4 x i32> %205, %194
  %207 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %197, <4 x i16> %22)
  %208 = add <4 x i32> %207, %195
  br label %209

209:                                              ; preds = %200, %191
  %210 = phi <4 x i32> [ %192, %191 ], [ %202, %200 ]
  %211 = phi <4 x i32> [ %193, %191 ], [ %204, %200 ]
  %212 = phi <4 x i32> [ %194, %191 ], [ %206, %200 ]
  %213 = phi <4 x i32> [ %195, %191 ], [ %208, %200 ]
  %214 = getelementptr inbounds nuw i16, ptr %27, i64 %141
  %215 = load <4 x i16>, ptr %214, align 2
  %216 = bitcast <4 x i16> %215 to i64
  %217 = icmp eq i64 %216, 0
  br i1 %217, label %227, label %218

218:                                              ; preds = %209
  %219 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %215, <4 x i16> %24)
  %220 = add <4 x i32> %219, %210
  %221 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %215, <4 x i16> %23)
  %222 = sub <4 x i32> %211, %221
  %223 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %215, <4 x i16> %22)
  %224 = add <4 x i32> %223, %212
  %225 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %215, <4 x i16> %21)
  %226 = sub <4 x i32> %213, %225
  br label %227

227:                                              ; preds = %218, %209
  %228 = phi <4 x i32> [ %210, %209 ], [ %220, %218 ]
  %229 = phi <4 x i32> [ %211, %209 ], [ %222, %218 ]
  %230 = phi <4 x i32> [ %212, %209 ], [ %224, %218 ]
  %231 = phi <4 x i32> [ %213, %209 ], [ %226, %218 ]
  %232 = add <4 x i32> %228, %168
  %233 = sub <4 x i32> %171, %231
  %234 = add <4 x i32> %229, %170
  %235 = sub <4 x i32> %169, %230
  %236 = add <4 x i32> %230, %169
  %237 = sub <4 x i32> %170, %229
  %238 = add <4 x i32> %231, %171
  %239 = sub <4 x i32> %168, %228
  %240 = getelementptr inbounds nuw i16, ptr %29, i64 %141
  %241 = load <4 x i16>, ptr %240, align 2
  %242 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %30)
  %243 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %31)
  %244 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %32)
  %245 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %33)
  %246 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %34)
  %247 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %35)
  %248 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %36)
  %249 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %241, <4 x i16> %37)
  %250 = getelementptr inbounds nuw i16, ptr %38, i64 %141
  %251 = load <4 x i16>, ptr %250, align 2
  %252 = bitcast <4 x i16> %251 to i64
  %253 = icmp eq i64 %252, 0
  br i1 %253, label %271, label %254

254:                                              ; preds = %227
  %255 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %31)
  %256 = add <4 x i32> %255, %242
  %257 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %34)
  %258 = add <4 x i32> %257, %243
  %259 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %37)
  %260 = add <4 x i32> %259, %244
  %261 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %35)
  %262 = sub <4 x i32> %245, %261
  %263 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %32)
  %264 = sub <4 x i32> %246, %263
  %265 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %30)
  %266 = sub <4 x i32> %247, %265
  %267 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %33)
  %268 = sub <4 x i32> %248, %267
  %269 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %251, <4 x i16> %36)
  %270 = sub <4 x i32> %249, %269
  br label %271

271:                                              ; preds = %254, %227
  %272 = phi <4 x i32> [ %249, %227 ], [ %270, %254 ]
  %273 = phi <4 x i32> [ %248, %227 ], [ %268, %254 ]
  %274 = phi <4 x i32> [ %247, %227 ], [ %266, %254 ]
  %275 = phi <4 x i32> [ %246, %227 ], [ %264, %254 ]
  %276 = phi <4 x i32> [ %245, %227 ], [ %262, %254 ]
  %277 = phi <4 x i32> [ %244, %227 ], [ %260, %254 ]
  %278 = phi <4 x i32> [ %243, %227 ], [ %258, %254 ]
  %279 = phi <4 x i32> [ %242, %227 ], [ %256, %254 ]
  %280 = getelementptr inbounds nuw i16, ptr %39, i64 %141
  %281 = load <4 x i16>, ptr %280, align 2
  %282 = bitcast <4 x i16> %281 to i64
  %283 = icmp eq i64 %282, 0
  br i1 %283, label %301, label %284

284:                                              ; preds = %271
  %285 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %32)
  %286 = add <4 x i32> %285, %279
  %287 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %37)
  %288 = add <4 x i32> %287, %278
  %289 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %33)
  %290 = sub <4 x i32> %277, %289
  %291 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %31)
  %292 = sub <4 x i32> %276, %291
  %293 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %36)
  %294 = sub <4 x i32> %275, %293
  %295 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %34)
  %296 = add <4 x i32> %295, %274
  %297 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %30)
  %298 = add <4 x i32> %297, %273
  %299 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %281, <4 x i16> %35)
  %300 = add <4 x i32> %299, %272
  br label %301

301:                                              ; preds = %284, %271
  %302 = phi <4 x i32> [ %272, %271 ], [ %300, %284 ]
  %303 = phi <4 x i32> [ %273, %271 ], [ %298, %284 ]
  %304 = phi <4 x i32> [ %274, %271 ], [ %296, %284 ]
  %305 = phi <4 x i32> [ %275, %271 ], [ %294, %284 ]
  %306 = phi <4 x i32> [ %276, %271 ], [ %292, %284 ]
  %307 = phi <4 x i32> [ %277, %271 ], [ %290, %284 ]
  %308 = phi <4 x i32> [ %278, %271 ], [ %288, %284 ]
  %309 = phi <4 x i32> [ %279, %271 ], [ %286, %284 ]
  %310 = getelementptr inbounds nuw i16, ptr %40, i64 %141
  %311 = load <4 x i16>, ptr %310, align 2
  %312 = bitcast <4 x i16> %311 to i64
  %313 = icmp eq i64 %312, 0
  br i1 %313, label %331, label %314

314:                                              ; preds = %301
  %315 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %33)
  %316 = add <4 x i32> %315, %309
  %317 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %35)
  %318 = sub <4 x i32> %308, %317
  %319 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %31)
  %320 = sub <4 x i32> %307, %319
  %321 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %37)
  %322 = add <4 x i32> %321, %306
  %323 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %30)
  %324 = add <4 x i32> %323, %305
  %325 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %36)
  %326 = add <4 x i32> %325, %304
  %327 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %32)
  %328 = sub <4 x i32> %303, %327
  %329 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %311, <4 x i16> %34)
  %330 = sub <4 x i32> %302, %329
  br label %331

331:                                              ; preds = %314, %301
  %332 = phi <4 x i32> [ %302, %301 ], [ %330, %314 ]
  %333 = phi <4 x i32> [ %303, %301 ], [ %328, %314 ]
  %334 = phi <4 x i32> [ %304, %301 ], [ %326, %314 ]
  %335 = phi <4 x i32> [ %305, %301 ], [ %324, %314 ]
  %336 = phi <4 x i32> [ %306, %301 ], [ %322, %314 ]
  %337 = phi <4 x i32> [ %307, %301 ], [ %320, %314 ]
  %338 = phi <4 x i32> [ %308, %301 ], [ %318, %314 ]
  %339 = phi <4 x i32> [ %309, %301 ], [ %316, %314 ]
  %340 = getelementptr inbounds nuw i16, ptr %41, i64 %141
  %341 = load <4 x i16>, ptr %340, align 2
  %342 = bitcast <4 x i16> %341 to i64
  %343 = icmp eq i64 %342, 0
  br i1 %343, label %361, label %344

344:                                              ; preds = %331
  %345 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %34)
  %346 = add <4 x i32> %345, %339
  %347 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %32)
  %348 = sub <4 x i32> %338, %347
  %349 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %36)
  %350 = sub <4 x i32> %337, %349
  %351 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %30)
  %352 = add <4 x i32> %351, %336
  %353 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %37)
  %354 = sub <4 x i32> %335, %353
  %355 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %31)
  %356 = sub <4 x i32> %334, %355
  %357 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %35)
  %358 = add <4 x i32> %357, %333
  %359 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %341, <4 x i16> %33)
  %360 = add <4 x i32> %359, %332
  br label %361

361:                                              ; preds = %344, %331
  %362 = phi <4 x i32> [ %332, %331 ], [ %360, %344 ]
  %363 = phi <4 x i32> [ %333, %331 ], [ %358, %344 ]
  %364 = phi <4 x i32> [ %334, %331 ], [ %356, %344 ]
  %365 = phi <4 x i32> [ %335, %331 ], [ %354, %344 ]
  %366 = phi <4 x i32> [ %336, %331 ], [ %352, %344 ]
  %367 = phi <4 x i32> [ %337, %331 ], [ %350, %344 ]
  %368 = phi <4 x i32> [ %338, %331 ], [ %348, %344 ]
  %369 = phi <4 x i32> [ %339, %331 ], [ %346, %344 ]
  %370 = getelementptr inbounds nuw i16, ptr %42, i64 %141
  %371 = load <4 x i16>, ptr %370, align 2
  %372 = bitcast <4 x i16> %371 to i64
  %373 = icmp eq i64 %372, 0
  br i1 %373, label %391, label %374

374:                                              ; preds = %361
  %375 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %35)
  %376 = add <4 x i32> %375, %369
  %377 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %30)
  %378 = sub <4 x i32> %368, %377
  %379 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %34)
  %380 = add <4 x i32> %379, %367
  %381 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %36)
  %382 = add <4 x i32> %381, %366
  %383 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %31)
  %384 = sub <4 x i32> %365, %383
  %385 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %33)
  %386 = add <4 x i32> %385, %364
  %387 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %37)
  %388 = add <4 x i32> %387, %363
  %389 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %371, <4 x i16> %32)
  %390 = sub <4 x i32> %362, %389
  br label %391

391:                                              ; preds = %374, %361
  %392 = phi <4 x i32> [ %362, %361 ], [ %390, %374 ]
  %393 = phi <4 x i32> [ %363, %361 ], [ %388, %374 ]
  %394 = phi <4 x i32> [ %364, %361 ], [ %386, %374 ]
  %395 = phi <4 x i32> [ %365, %361 ], [ %384, %374 ]
  %396 = phi <4 x i32> [ %366, %361 ], [ %382, %374 ]
  %397 = phi <4 x i32> [ %367, %361 ], [ %380, %374 ]
  %398 = phi <4 x i32> [ %368, %361 ], [ %378, %374 ]
  %399 = phi <4 x i32> [ %369, %361 ], [ %376, %374 ]
  %400 = getelementptr inbounds nuw i16, ptr %43, i64 %141
  %401 = load <4 x i16>, ptr %400, align 2
  %402 = bitcast <4 x i16> %401 to i64
  %403 = icmp eq i64 %402, 0
  br i1 %403, label %421, label %404

404:                                              ; preds = %391
  %405 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %36)
  %406 = add <4 x i32> %405, %399
  %407 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %33)
  %408 = sub <4 x i32> %398, %407
  %409 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %30)
  %410 = add <4 x i32> %409, %397
  %411 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %32)
  %412 = sub <4 x i32> %396, %411
  %413 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %35)
  %414 = add <4 x i32> %413, %395
  %415 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %37)
  %416 = add <4 x i32> %415, %394
  %417 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %34)
  %418 = sub <4 x i32> %393, %417
  %419 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %401, <4 x i16> %31)
  %420 = add <4 x i32> %419, %392
  br label %421

421:                                              ; preds = %404, %391
  %422 = phi <4 x i32> [ %392, %391 ], [ %420, %404 ]
  %423 = phi <4 x i32> [ %393, %391 ], [ %418, %404 ]
  %424 = phi <4 x i32> [ %394, %391 ], [ %416, %404 ]
  %425 = phi <4 x i32> [ %395, %391 ], [ %414, %404 ]
  %426 = phi <4 x i32> [ %396, %391 ], [ %412, %404 ]
  %427 = phi <4 x i32> [ %397, %391 ], [ %410, %404 ]
  %428 = phi <4 x i32> [ %398, %391 ], [ %408, %404 ]
  %429 = phi <4 x i32> [ %399, %391 ], [ %406, %404 ]
  %430 = getelementptr inbounds nuw i16, ptr %44, i64 %141
  %431 = load <4 x i16>, ptr %430, align 2
  %432 = bitcast <4 x i16> %431 to i64
  %433 = icmp eq i64 %432, 0
  br i1 %433, label %451, label %434

434:                                              ; preds = %421
  %435 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %37)
  %436 = add <4 x i32> %435, %429
  %437 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %36)
  %438 = sub <4 x i32> %428, %437
  %439 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %35)
  %440 = add <4 x i32> %439, %427
  %441 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %34)
  %442 = sub <4 x i32> %426, %441
  %443 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %33)
  %444 = add <4 x i32> %443, %425
  %445 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %32)
  %446 = sub <4 x i32> %424, %445
  %447 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %31)
  %448 = add <4 x i32> %447, %423
  %449 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %431, <4 x i16> %30)
  %450 = sub <4 x i32> %422, %449
  br label %451

451:                                              ; preds = %434, %421
  %452 = phi <4 x i32> [ %422, %421 ], [ %450, %434 ]
  %453 = phi <4 x i32> [ %423, %421 ], [ %448, %434 ]
  %454 = phi <4 x i32> [ %424, %421 ], [ %446, %434 ]
  %455 = phi <4 x i32> [ %425, %421 ], [ %444, %434 ]
  %456 = phi <4 x i32> [ %426, %421 ], [ %442, %434 ]
  %457 = phi <4 x i32> [ %427, %421 ], [ %440, %434 ]
  %458 = phi <4 x i32> [ %428, %421 ], [ %438, %434 ]
  %459 = phi <4 x i32> [ %429, %421 ], [ %436, %434 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %8) #10
  %460 = add <4 x i32> %459, %232
  store <4 x i32> %460, ptr %8, align 16, !tbaa !10
  %461 = sub <4 x i32> %239, %452
  store <4 x i32> %461, ptr %124, align 16, !tbaa !10
  %462 = add <4 x i32> %458, %234
  store <4 x i32> %462, ptr %125, align 16, !tbaa !10
  %463 = sub <4 x i32> %237, %453
  store <4 x i32> %463, ptr %126, align 16, !tbaa !10
  %464 = add <4 x i32> %457, %236
  store <4 x i32> %464, ptr %127, align 16, !tbaa !10
  %465 = sub <4 x i32> %235, %454
  store <4 x i32> %465, ptr %128, align 16, !tbaa !10
  %466 = add <4 x i32> %456, %238
  store <4 x i32> %466, ptr %129, align 16, !tbaa !10
  %467 = sub <4 x i32> %233, %455
  store <4 x i32> %467, ptr %130, align 16, !tbaa !10
  %468 = add <4 x i32> %455, %233
  store <4 x i32> %468, ptr %131, align 16, !tbaa !10
  %469 = sub <4 x i32> %238, %456
  store <4 x i32> %469, ptr %132, align 16, !tbaa !10
  %470 = add <4 x i32> %454, %235
  store <4 x i32> %470, ptr %133, align 16, !tbaa !10
  %471 = sub <4 x i32> %236, %457
  store <4 x i32> %471, ptr %134, align 16, !tbaa !10
  %472 = add <4 x i32> %453, %237
  store <4 x i32> %472, ptr %135, align 16, !tbaa !10
  %473 = sub <4 x i32> %234, %458
  store <4 x i32> %473, ptr %136, align 16, !tbaa !10
  %474 = add <4 x i32> %452, %239
  store <4 x i32> %474, ptr %137, align 16, !tbaa !10
  %475 = sub <4 x i32> %232, %459
  store <4 x i32> %475, ptr %138, align 16, !tbaa !10
  call void @llvm.lifetime.start.p0(ptr nonnull %9) #10
  %476 = getelementptr inbounds nuw i16, ptr %47, i64 %141
  %477 = load <4 x i16>, ptr %476, align 2
  %478 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %48)
  store <4 x i32> %478, ptr %9, align 16, !tbaa !10
  %479 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %49)
  store <4 x i32> %479, ptr %50, align 16, !tbaa !10
  %480 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %51)
  store <4 x i32> %480, ptr %52, align 16, !tbaa !10
  %481 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %53)
  store <4 x i32> %481, ptr %54, align 16, !tbaa !10
  %482 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %55)
  store <4 x i32> %482, ptr %56, align 16, !tbaa !10
  %483 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %57)
  store <4 x i32> %483, ptr %58, align 16, !tbaa !10
  %484 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %59)
  store <4 x i32> %484, ptr %60, align 16, !tbaa !10
  %485 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %61)
  store <4 x i32> %485, ptr %62, align 16, !tbaa !10
  %486 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %63)
  store <4 x i32> %486, ptr %64, align 16, !tbaa !10
  %487 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %65)
  store <4 x i32> %487, ptr %66, align 16, !tbaa !10
  %488 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %67)
  store <4 x i32> %488, ptr %68, align 16, !tbaa !10
  %489 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %69)
  store <4 x i32> %489, ptr %70, align 16, !tbaa !10
  %490 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %71)
  store <4 x i32> %490, ptr %72, align 16, !tbaa !10
  %491 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %73)
  store <4 x i32> %491, ptr %74, align 16, !tbaa !10
  %492 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %75)
  store <4 x i32> %492, ptr %76, align 16, !tbaa !10
  %493 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %477, <4 x i16> %77)
  store <4 x i32> %493, ptr %78, align 16, !tbaa !10
  %494 = getelementptr inbounds nuw i16, ptr %79, i64 %141
  %495 = load <4 x i16>, ptr %494, align 2
  %496 = bitcast <4 x i16> %495 to i64
  %497 = icmp eq i64 %496, 0
  br i1 %497, label %531, label %498

498:                                              ; preds = %451
  %499 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %49)
  %500 = add <4 x i32> %499, %478
  store <4 x i32> %500, ptr %9, align 16, !tbaa !10
  %501 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %55)
  %502 = add <4 x i32> %501, %479
  store <4 x i32> %502, ptr %50, align 16, !tbaa !10
  %503 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %61)
  %504 = add <4 x i32> %503, %480
  store <4 x i32> %504, ptr %52, align 16, !tbaa !10
  %505 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %67)
  %506 = add <4 x i32> %505, %481
  store <4 x i32> %506, ptr %54, align 16, !tbaa !10
  %507 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %73)
  %508 = add <4 x i32> %507, %482
  store <4 x i32> %508, ptr %56, align 16, !tbaa !10
  %509 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %77)
  %510 = sub <4 x i32> %483, %509
  store <4 x i32> %510, ptr %58, align 16, !tbaa !10
  %511 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %71)
  %512 = sub <4 x i32> %484, %511
  store <4 x i32> %512, ptr %60, align 16, !tbaa !10
  %513 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %65)
  %514 = sub <4 x i32> %485, %513
  store <4 x i32> %514, ptr %62, align 16, !tbaa !10
  %515 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %59)
  %516 = sub <4 x i32> %486, %515
  store <4 x i32> %516, ptr %64, align 16, !tbaa !10
  %517 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %53)
  %518 = sub <4 x i32> %487, %517
  store <4 x i32> %518, ptr %66, align 16, !tbaa !10
  %519 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %48)
  %520 = sub <4 x i32> %488, %519
  store <4 x i32> %520, ptr %68, align 16, !tbaa !10
  %521 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %51)
  %522 = sub <4 x i32> %489, %521
  store <4 x i32> %522, ptr %70, align 16, !tbaa !10
  %523 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %57)
  %524 = sub <4 x i32> %490, %523
  store <4 x i32> %524, ptr %72, align 16, !tbaa !10
  %525 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %63)
  %526 = sub <4 x i32> %491, %525
  store <4 x i32> %526, ptr %74, align 16, !tbaa !10
  %527 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %69)
  %528 = sub <4 x i32> %492, %527
  store <4 x i32> %528, ptr %76, align 16, !tbaa !10
  %529 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %495, <4 x i16> %75)
  %530 = sub <4 x i32> %493, %529
  store <4 x i32> %530, ptr %78, align 16, !tbaa !10
  br label %531

531:                                              ; preds = %498, %451
  %532 = phi <4 x i32> [ %530, %498 ], [ %493, %451 ]
  %533 = phi <4 x i32> [ %528, %498 ], [ %492, %451 ]
  %534 = phi <4 x i32> [ %526, %498 ], [ %491, %451 ]
  %535 = phi <4 x i32> [ %524, %498 ], [ %490, %451 ]
  %536 = phi <4 x i32> [ %522, %498 ], [ %489, %451 ]
  %537 = phi <4 x i32> [ %520, %498 ], [ %488, %451 ]
  %538 = phi <4 x i32> [ %518, %498 ], [ %487, %451 ]
  %539 = phi <4 x i32> [ %516, %498 ], [ %486, %451 ]
  %540 = phi <4 x i32> [ %514, %498 ], [ %485, %451 ]
  %541 = phi <4 x i32> [ %512, %498 ], [ %484, %451 ]
  %542 = phi <4 x i32> [ %510, %498 ], [ %483, %451 ]
  %543 = phi <4 x i32> [ %508, %498 ], [ %482, %451 ]
  %544 = phi <4 x i32> [ %506, %498 ], [ %481, %451 ]
  %545 = phi <4 x i32> [ %504, %498 ], [ %480, %451 ]
  %546 = phi <4 x i32> [ %502, %498 ], [ %479, %451 ]
  %547 = phi <4 x i32> [ %500, %498 ], [ %478, %451 ]
  %548 = getelementptr inbounds nuw i16, ptr %80, i64 %141
  %549 = load <4 x i16>, ptr %548, align 2
  %550 = bitcast <4 x i16> %549 to i64
  %551 = icmp eq i64 %550, 0
  br i1 %551, label %585, label %552

552:                                              ; preds = %531
  %553 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %51)
  %554 = add <4 x i32> %553, %547
  store <4 x i32> %554, ptr %9, align 16, !tbaa !10
  %555 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %61)
  %556 = add <4 x i32> %555, %546
  store <4 x i32> %556, ptr %50, align 16, !tbaa !10
  %557 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %71)
  %558 = add <4 x i32> %557, %545
  store <4 x i32> %558, ptr %52, align 16, !tbaa !10
  %559 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %75)
  %560 = sub <4 x i32> %544, %559
  store <4 x i32> %560, ptr %54, align 16, !tbaa !10
  %561 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %65)
  %562 = sub <4 x i32> %543, %561
  store <4 x i32> %562, ptr %56, align 16, !tbaa !10
  %563 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %55)
  %564 = sub <4 x i32> %542, %563
  store <4 x i32> %564, ptr %58, align 16, !tbaa !10
  %565 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %48)
  %566 = sub <4 x i32> %541, %565
  store <4 x i32> %566, ptr %60, align 16, !tbaa !10
  %567 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %57)
  %568 = sub <4 x i32> %540, %567
  store <4 x i32> %568, ptr %62, align 16, !tbaa !10
  %569 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %67)
  %570 = sub <4 x i32> %539, %569
  store <4 x i32> %570, ptr %64, align 16, !tbaa !10
  %571 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %77)
  %572 = sub <4 x i32> %538, %571
  store <4 x i32> %572, ptr %66, align 16, !tbaa !10
  %573 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %69)
  %574 = add <4 x i32> %573, %537
  store <4 x i32> %574, ptr %68, align 16, !tbaa !10
  %575 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %59)
  %576 = add <4 x i32> %575, %536
  store <4 x i32> %576, ptr %70, align 16, !tbaa !10
  %577 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %49)
  %578 = add <4 x i32> %577, %535
  store <4 x i32> %578, ptr %72, align 16, !tbaa !10
  %579 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %53)
  %580 = add <4 x i32> %579, %534
  store <4 x i32> %580, ptr %74, align 16, !tbaa !10
  %581 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %63)
  %582 = add <4 x i32> %581, %533
  store <4 x i32> %582, ptr %76, align 16, !tbaa !10
  %583 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %549, <4 x i16> %73)
  %584 = add <4 x i32> %583, %532
  store <4 x i32> %584, ptr %78, align 16, !tbaa !10
  br label %585

585:                                              ; preds = %552, %531
  %586 = phi <4 x i32> [ %584, %552 ], [ %532, %531 ]
  %587 = phi <4 x i32> [ %582, %552 ], [ %533, %531 ]
  %588 = phi <4 x i32> [ %580, %552 ], [ %534, %531 ]
  %589 = phi <4 x i32> [ %578, %552 ], [ %535, %531 ]
  %590 = phi <4 x i32> [ %576, %552 ], [ %536, %531 ]
  %591 = phi <4 x i32> [ %574, %552 ], [ %537, %531 ]
  %592 = phi <4 x i32> [ %572, %552 ], [ %538, %531 ]
  %593 = phi <4 x i32> [ %570, %552 ], [ %539, %531 ]
  %594 = phi <4 x i32> [ %568, %552 ], [ %540, %531 ]
  %595 = phi <4 x i32> [ %566, %552 ], [ %541, %531 ]
  %596 = phi <4 x i32> [ %564, %552 ], [ %542, %531 ]
  %597 = phi <4 x i32> [ %562, %552 ], [ %543, %531 ]
  %598 = phi <4 x i32> [ %560, %552 ], [ %544, %531 ]
  %599 = phi <4 x i32> [ %558, %552 ], [ %545, %531 ]
  %600 = phi <4 x i32> [ %556, %552 ], [ %546, %531 ]
  %601 = phi <4 x i32> [ %554, %552 ], [ %547, %531 ]
  %602 = getelementptr inbounds nuw i16, ptr %81, i64 %141
  %603 = load <4 x i16>, ptr %602, align 2
  %604 = bitcast <4 x i16> %603 to i64
  %605 = icmp eq i64 %604, 0
  br i1 %605, label %639, label %606

606:                                              ; preds = %585
  %607 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %53)
  %608 = add <4 x i32> %607, %601
  store <4 x i32> %608, ptr %9, align 16, !tbaa !10
  %609 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %67)
  %610 = add <4 x i32> %609, %600
  store <4 x i32> %610, ptr %50, align 16, !tbaa !10
  %611 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %75)
  %612 = sub <4 x i32> %599, %611
  store <4 x i32> %612, ptr %52, align 16, !tbaa !10
  %613 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %61)
  %614 = sub <4 x i32> %598, %613
  store <4 x i32> %614, ptr %54, align 16, !tbaa !10
  %615 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %48)
  %616 = sub <4 x i32> %597, %615
  store <4 x i32> %616, ptr %56, align 16, !tbaa !10
  %617 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %59)
  %618 = sub <4 x i32> %596, %617
  store <4 x i32> %618, ptr %58, align 16, !tbaa !10
  %619 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %73)
  %620 = sub <4 x i32> %595, %619
  store <4 x i32> %620, ptr %60, align 16, !tbaa !10
  %621 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %69)
  %622 = add <4 x i32> %621, %594
  store <4 x i32> %622, ptr %62, align 16, !tbaa !10
  %623 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %55)
  %624 = add <4 x i32> %623, %593
  store <4 x i32> %624, ptr %64, align 16, !tbaa !10
  %625 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %51)
  %626 = add <4 x i32> %625, %592
  store <4 x i32> %626, ptr %66, align 16, !tbaa !10
  %627 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %65)
  %628 = add <4 x i32> %627, %591
  store <4 x i32> %628, ptr %68, align 16, !tbaa !10
  %629 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %77)
  %630 = sub <4 x i32> %590, %629
  store <4 x i32> %630, ptr %70, align 16, !tbaa !10
  %631 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %63)
  %632 = sub <4 x i32> %589, %631
  store <4 x i32> %632, ptr %72, align 16, !tbaa !10
  %633 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %49)
  %634 = sub <4 x i32> %588, %633
  store <4 x i32> %634, ptr %74, align 16, !tbaa !10
  %635 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %57)
  %636 = sub <4 x i32> %587, %635
  store <4 x i32> %636, ptr %76, align 16, !tbaa !10
  %637 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %603, <4 x i16> %71)
  %638 = sub <4 x i32> %586, %637
  store <4 x i32> %638, ptr %78, align 16, !tbaa !10
  br label %639

639:                                              ; preds = %606, %585
  %640 = phi <4 x i32> [ %638, %606 ], [ %586, %585 ]
  %641 = phi <4 x i32> [ %636, %606 ], [ %587, %585 ]
  %642 = phi <4 x i32> [ %634, %606 ], [ %588, %585 ]
  %643 = phi <4 x i32> [ %632, %606 ], [ %589, %585 ]
  %644 = phi <4 x i32> [ %630, %606 ], [ %590, %585 ]
  %645 = phi <4 x i32> [ %628, %606 ], [ %591, %585 ]
  %646 = phi <4 x i32> [ %626, %606 ], [ %592, %585 ]
  %647 = phi <4 x i32> [ %624, %606 ], [ %593, %585 ]
  %648 = phi <4 x i32> [ %622, %606 ], [ %594, %585 ]
  %649 = phi <4 x i32> [ %620, %606 ], [ %595, %585 ]
  %650 = phi <4 x i32> [ %618, %606 ], [ %596, %585 ]
  %651 = phi <4 x i32> [ %616, %606 ], [ %597, %585 ]
  %652 = phi <4 x i32> [ %614, %606 ], [ %598, %585 ]
  %653 = phi <4 x i32> [ %612, %606 ], [ %599, %585 ]
  %654 = phi <4 x i32> [ %610, %606 ], [ %600, %585 ]
  %655 = phi <4 x i32> [ %608, %606 ], [ %601, %585 ]
  %656 = getelementptr inbounds nuw i16, ptr %82, i64 %141
  %657 = load <4 x i16>, ptr %656, align 2
  %658 = bitcast <4 x i16> %657 to i64
  %659 = icmp eq i64 %658, 0
  br i1 %659, label %693, label %660

660:                                              ; preds = %639
  %661 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %55)
  %662 = add <4 x i32> %661, %655
  store <4 x i32> %662, ptr %9, align 16, !tbaa !10
  %663 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %73)
  %664 = add <4 x i32> %663, %654
  store <4 x i32> %664, ptr %50, align 16, !tbaa !10
  %665 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %65)
  %666 = sub <4 x i32> %653, %665
  store <4 x i32> %666, ptr %52, align 16, !tbaa !10
  %667 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %48)
  %668 = sub <4 x i32> %652, %667
  store <4 x i32> %668, ptr %54, align 16, !tbaa !10
  %669 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %63)
  %670 = sub <4 x i32> %651, %669
  store <4 x i32> %670, ptr %56, align 16, !tbaa !10
  %671 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %75)
  %672 = add <4 x i32> %671, %650
  store <4 x i32> %672, ptr %58, align 16, !tbaa !10
  %673 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %57)
  %674 = add <4 x i32> %673, %649
  store <4 x i32> %674, ptr %60, align 16, !tbaa !10
  %675 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %53)
  %676 = add <4 x i32> %675, %648
  store <4 x i32> %676, ptr %62, align 16, !tbaa !10
  %677 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %71)
  %678 = add <4 x i32> %677, %647
  store <4 x i32> %678, ptr %64, align 16, !tbaa !10
  %679 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %67)
  %680 = sub <4 x i32> %646, %679
  store <4 x i32> %680, ptr %66, align 16, !tbaa !10
  %681 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %49)
  %682 = sub <4 x i32> %645, %681
  store <4 x i32> %682, ptr %68, align 16, !tbaa !10
  %683 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %61)
  %684 = sub <4 x i32> %644, %683
  store <4 x i32> %684, ptr %70, align 16, !tbaa !10
  %685 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %77)
  %686 = add <4 x i32> %685, %643
  store <4 x i32> %686, ptr %72, align 16, !tbaa !10
  %687 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %59)
  %688 = add <4 x i32> %687, %642
  store <4 x i32> %688, ptr %74, align 16, !tbaa !10
  %689 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %51)
  %690 = add <4 x i32> %689, %641
  store <4 x i32> %690, ptr %76, align 16, !tbaa !10
  %691 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %657, <4 x i16> %69)
  %692 = add <4 x i32> %691, %640
  store <4 x i32> %692, ptr %78, align 16, !tbaa !10
  br label %693

693:                                              ; preds = %660, %639
  %694 = phi <4 x i32> [ %692, %660 ], [ %640, %639 ]
  %695 = phi <4 x i32> [ %690, %660 ], [ %641, %639 ]
  %696 = phi <4 x i32> [ %688, %660 ], [ %642, %639 ]
  %697 = phi <4 x i32> [ %686, %660 ], [ %643, %639 ]
  %698 = phi <4 x i32> [ %684, %660 ], [ %644, %639 ]
  %699 = phi <4 x i32> [ %682, %660 ], [ %645, %639 ]
  %700 = phi <4 x i32> [ %680, %660 ], [ %646, %639 ]
  %701 = phi <4 x i32> [ %678, %660 ], [ %647, %639 ]
  %702 = phi <4 x i32> [ %676, %660 ], [ %648, %639 ]
  %703 = phi <4 x i32> [ %674, %660 ], [ %649, %639 ]
  %704 = phi <4 x i32> [ %672, %660 ], [ %650, %639 ]
  %705 = phi <4 x i32> [ %670, %660 ], [ %651, %639 ]
  %706 = phi <4 x i32> [ %668, %660 ], [ %652, %639 ]
  %707 = phi <4 x i32> [ %666, %660 ], [ %653, %639 ]
  %708 = phi <4 x i32> [ %664, %660 ], [ %654, %639 ]
  %709 = phi <4 x i32> [ %662, %660 ], [ %655, %639 ]
  %710 = getelementptr inbounds nuw i16, ptr %83, i64 %141
  %711 = load <4 x i16>, ptr %710, align 2
  %712 = bitcast <4 x i16> %711 to i64
  %713 = icmp eq i64 %712, 0
  br i1 %713, label %747, label %714

714:                                              ; preds = %693
  %715 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %57)
  %716 = add <4 x i32> %715, %709
  store <4 x i32> %716, ptr %9, align 16, !tbaa !10
  %717 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %77)
  %718 = sub <4 x i32> %708, %717
  store <4 x i32> %718, ptr %50, align 16, !tbaa !10
  %719 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %55)
  %720 = sub <4 x i32> %707, %719
  store <4 x i32> %720, ptr %52, align 16, !tbaa !10
  %721 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %59)
  %722 = sub <4 x i32> %706, %721
  store <4 x i32> %722, ptr %54, align 16, !tbaa !10
  %723 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %75)
  %724 = add <4 x i32> %723, %705
  store <4 x i32> %724, ptr %56, align 16, !tbaa !10
  %725 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %53)
  %726 = add <4 x i32> %725, %704
  store <4 x i32> %726, ptr %58, align 16, !tbaa !10
  %727 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %61)
  %728 = add <4 x i32> %727, %703
  store <4 x i32> %728, ptr %60, align 16, !tbaa !10
  %729 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %73)
  %730 = sub <4 x i32> %702, %729
  store <4 x i32> %730, ptr %62, align 16, !tbaa !10
  %731 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %51)
  %732 = sub <4 x i32> %701, %731
  store <4 x i32> %732, ptr %64, align 16, !tbaa !10
  %733 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %63)
  %734 = sub <4 x i32> %700, %733
  store <4 x i32> %734, ptr %66, align 16, !tbaa !10
  %735 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %71)
  %736 = add <4 x i32> %735, %699
  store <4 x i32> %736, ptr %68, align 16, !tbaa !10
  %737 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %49)
  %738 = add <4 x i32> %737, %698
  store <4 x i32> %738, ptr %70, align 16, !tbaa !10
  %739 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %65)
  %740 = add <4 x i32> %739, %697
  store <4 x i32> %740, ptr %72, align 16, !tbaa !10
  %741 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %69)
  %742 = sub <4 x i32> %696, %741
  store <4 x i32> %742, ptr %74, align 16, !tbaa !10
  %743 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %48)
  %744 = sub <4 x i32> %695, %743
  store <4 x i32> %744, ptr %76, align 16, !tbaa !10
  %745 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %711, <4 x i16> %67)
  %746 = sub <4 x i32> %694, %745
  store <4 x i32> %746, ptr %78, align 16, !tbaa !10
  br label %747

747:                                              ; preds = %714, %693
  %748 = phi <4 x i32> [ %746, %714 ], [ %694, %693 ]
  %749 = phi <4 x i32> [ %744, %714 ], [ %695, %693 ]
  %750 = phi <4 x i32> [ %742, %714 ], [ %696, %693 ]
  %751 = phi <4 x i32> [ %740, %714 ], [ %697, %693 ]
  %752 = phi <4 x i32> [ %738, %714 ], [ %698, %693 ]
  %753 = phi <4 x i32> [ %736, %714 ], [ %699, %693 ]
  %754 = phi <4 x i32> [ %734, %714 ], [ %700, %693 ]
  %755 = phi <4 x i32> [ %732, %714 ], [ %701, %693 ]
  %756 = phi <4 x i32> [ %730, %714 ], [ %702, %693 ]
  %757 = phi <4 x i32> [ %728, %714 ], [ %703, %693 ]
  %758 = phi <4 x i32> [ %726, %714 ], [ %704, %693 ]
  %759 = phi <4 x i32> [ %724, %714 ], [ %705, %693 ]
  %760 = phi <4 x i32> [ %722, %714 ], [ %706, %693 ]
  %761 = phi <4 x i32> [ %720, %714 ], [ %707, %693 ]
  %762 = phi <4 x i32> [ %718, %714 ], [ %708, %693 ]
  %763 = phi <4 x i32> [ %716, %714 ], [ %709, %693 ]
  %764 = getelementptr inbounds nuw i16, ptr %84, i64 %141
  %765 = load <4 x i16>, ptr %764, align 2
  %766 = bitcast <4 x i16> %765 to i64
  %767 = icmp eq i64 %766, 0
  br i1 %767, label %801, label %768

768:                                              ; preds = %747
  %769 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %59)
  %770 = add <4 x i32> %769, %763
  store <4 x i32> %770, ptr %9, align 16, !tbaa !10
  %771 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %71)
  %772 = sub <4 x i32> %762, %771
  store <4 x i32> %772, ptr %50, align 16, !tbaa !10
  %773 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %48)
  %774 = sub <4 x i32> %761, %773
  store <4 x i32> %774, ptr %52, align 16, !tbaa !10
  %775 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %73)
  %776 = sub <4 x i32> %760, %775
  store <4 x i32> %776, ptr %54, align 16, !tbaa !10
  %777 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %57)
  %778 = add <4 x i32> %777, %759
  store <4 x i32> %778, ptr %56, align 16, !tbaa !10
  %779 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %61)
  %780 = add <4 x i32> %779, %758
  store <4 x i32> %780, ptr %58, align 16, !tbaa !10
  %781 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %69)
  %782 = sub <4 x i32> %757, %781
  store <4 x i32> %782, ptr %60, align 16, !tbaa !10
  %783 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %49)
  %784 = sub <4 x i32> %756, %783
  store <4 x i32> %784, ptr %62, align 16, !tbaa !10
  %785 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %75)
  %786 = sub <4 x i32> %755, %785
  store <4 x i32> %786, ptr %64, align 16, !tbaa !10
  %787 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %55)
  %788 = add <4 x i32> %787, %754
  store <4 x i32> %788, ptr %66, align 16, !tbaa !10
  %789 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %63)
  %790 = add <4 x i32> %789, %753
  store <4 x i32> %790, ptr %68, align 16, !tbaa !10
  %791 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %67)
  %792 = sub <4 x i32> %752, %791
  store <4 x i32> %792, ptr %70, align 16, !tbaa !10
  %793 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %51)
  %794 = sub <4 x i32> %751, %793
  store <4 x i32> %794, ptr %72, align 16, !tbaa !10
  %795 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %77)
  %796 = sub <4 x i32> %750, %795
  store <4 x i32> %796, ptr %74, align 16, !tbaa !10
  %797 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %53)
  %798 = add <4 x i32> %797, %749
  store <4 x i32> %798, ptr %76, align 16, !tbaa !10
  %799 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %765, <4 x i16> %65)
  %800 = add <4 x i32> %799, %748
  store <4 x i32> %800, ptr %78, align 16, !tbaa !10
  br label %801

801:                                              ; preds = %768, %747
  %802 = phi <4 x i32> [ %800, %768 ], [ %748, %747 ]
  %803 = phi <4 x i32> [ %798, %768 ], [ %749, %747 ]
  %804 = phi <4 x i32> [ %796, %768 ], [ %750, %747 ]
  %805 = phi <4 x i32> [ %794, %768 ], [ %751, %747 ]
  %806 = phi <4 x i32> [ %792, %768 ], [ %752, %747 ]
  %807 = phi <4 x i32> [ %790, %768 ], [ %753, %747 ]
  %808 = phi <4 x i32> [ %788, %768 ], [ %754, %747 ]
  %809 = phi <4 x i32> [ %786, %768 ], [ %755, %747 ]
  %810 = phi <4 x i32> [ %784, %768 ], [ %756, %747 ]
  %811 = phi <4 x i32> [ %782, %768 ], [ %757, %747 ]
  %812 = phi <4 x i32> [ %780, %768 ], [ %758, %747 ]
  %813 = phi <4 x i32> [ %778, %768 ], [ %759, %747 ]
  %814 = phi <4 x i32> [ %776, %768 ], [ %760, %747 ]
  %815 = phi <4 x i32> [ %774, %768 ], [ %761, %747 ]
  %816 = phi <4 x i32> [ %772, %768 ], [ %762, %747 ]
  %817 = phi <4 x i32> [ %770, %768 ], [ %763, %747 ]
  %818 = getelementptr inbounds nuw i16, ptr %85, i64 %141
  %819 = load <4 x i16>, ptr %818, align 2
  %820 = bitcast <4 x i16> %819 to i64
  %821 = icmp eq i64 %820, 0
  br i1 %821, label %855, label %822

822:                                              ; preds = %801
  %823 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %61)
  %824 = add <4 x i32> %823, %817
  store <4 x i32> %824, ptr %9, align 16, !tbaa !10
  %825 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %65)
  %826 = sub <4 x i32> %816, %825
  store <4 x i32> %826, ptr %50, align 16, !tbaa !10
  %827 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %57)
  %828 = sub <4 x i32> %815, %827
  store <4 x i32> %828, ptr %52, align 16, !tbaa !10
  %829 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %69)
  %830 = add <4 x i32> %829, %814
  store <4 x i32> %830, ptr %54, align 16, !tbaa !10
  %831 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %53)
  %832 = add <4 x i32> %831, %813
  store <4 x i32> %832, ptr %56, align 16, !tbaa !10
  %833 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %73)
  %834 = sub <4 x i32> %812, %833
  store <4 x i32> %834, ptr %58, align 16, !tbaa !10
  %835 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %49)
  %836 = sub <4 x i32> %811, %835
  store <4 x i32> %836, ptr %60, align 16, !tbaa !10
  %837 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %77)
  %838 = add <4 x i32> %837, %810
  store <4 x i32> %838, ptr %62, align 16, !tbaa !10
  %839 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %48)
  %840 = add <4 x i32> %839, %809
  store <4 x i32> %840, ptr %64, align 16, !tbaa !10
  %841 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %75)
  %842 = add <4 x i32> %841, %808
  store <4 x i32> %842, ptr %66, align 16, !tbaa !10
  %843 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %51)
  %844 = sub <4 x i32> %807, %843
  store <4 x i32> %844, ptr %68, align 16, !tbaa !10
  %845 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %71)
  %846 = sub <4 x i32> %806, %845
  store <4 x i32> %846, ptr %70, align 16, !tbaa !10
  %847 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %55)
  %848 = add <4 x i32> %847, %805
  store <4 x i32> %848, ptr %72, align 16, !tbaa !10
  %849 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %67)
  %850 = add <4 x i32> %849, %804
  store <4 x i32> %850, ptr %74, align 16, !tbaa !10
  %851 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %59)
  %852 = sub <4 x i32> %803, %851
  store <4 x i32> %852, ptr %76, align 16, !tbaa !10
  %853 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %819, <4 x i16> %63)
  %854 = sub <4 x i32> %802, %853
  store <4 x i32> %854, ptr %78, align 16, !tbaa !10
  br label %855

855:                                              ; preds = %822, %801
  %856 = phi <4 x i32> [ %854, %822 ], [ %802, %801 ]
  %857 = phi <4 x i32> [ %852, %822 ], [ %803, %801 ]
  %858 = phi <4 x i32> [ %850, %822 ], [ %804, %801 ]
  %859 = phi <4 x i32> [ %848, %822 ], [ %805, %801 ]
  %860 = phi <4 x i32> [ %846, %822 ], [ %806, %801 ]
  %861 = phi <4 x i32> [ %844, %822 ], [ %807, %801 ]
  %862 = phi <4 x i32> [ %842, %822 ], [ %808, %801 ]
  %863 = phi <4 x i32> [ %840, %822 ], [ %809, %801 ]
  %864 = phi <4 x i32> [ %838, %822 ], [ %810, %801 ]
  %865 = phi <4 x i32> [ %836, %822 ], [ %811, %801 ]
  %866 = phi <4 x i32> [ %834, %822 ], [ %812, %801 ]
  %867 = phi <4 x i32> [ %832, %822 ], [ %813, %801 ]
  %868 = phi <4 x i32> [ %830, %822 ], [ %814, %801 ]
  %869 = phi <4 x i32> [ %828, %822 ], [ %815, %801 ]
  %870 = phi <4 x i32> [ %826, %822 ], [ %816, %801 ]
  %871 = phi <4 x i32> [ %824, %822 ], [ %817, %801 ]
  %872 = getelementptr inbounds nuw i16, ptr %86, i64 %141
  %873 = load <4 x i16>, ptr %872, align 2
  %874 = bitcast <4 x i16> %873 to i64
  %875 = icmp eq i64 %874, 0
  br i1 %875, label %909, label %876

876:                                              ; preds = %855
  %877 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %63)
  %878 = add <4 x i32> %877, %871
  store <4 x i32> %878, ptr %9, align 16, !tbaa !10
  %879 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %59)
  %880 = sub <4 x i32> %870, %879
  store <4 x i32> %880, ptr %50, align 16, !tbaa !10
  %881 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %67)
  %882 = sub <4 x i32> %869, %881
  store <4 x i32> %882, ptr %52, align 16, !tbaa !10
  %883 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %55)
  %884 = add <4 x i32> %883, %868
  store <4 x i32> %884, ptr %54, align 16, !tbaa !10
  %885 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %71)
  %886 = add <4 x i32> %885, %867
  store <4 x i32> %886, ptr %56, align 16, !tbaa !10
  %887 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %51)
  %888 = sub <4 x i32> %866, %887
  store <4 x i32> %888, ptr %58, align 16, !tbaa !10
  %889 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %75)
  %890 = sub <4 x i32> %865, %889
  store <4 x i32> %890, ptr %60, align 16, !tbaa !10
  %891 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %48)
  %892 = add <4 x i32> %891, %864
  store <4 x i32> %892, ptr %62, align 16, !tbaa !10
  %893 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %77)
  %894 = sub <4 x i32> %863, %893
  store <4 x i32> %894, ptr %64, align 16, !tbaa !10
  %895 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %49)
  %896 = sub <4 x i32> %862, %895
  store <4 x i32> %896, ptr %66, align 16, !tbaa !10
  %897 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %73)
  %898 = add <4 x i32> %897, %861
  store <4 x i32> %898, ptr %68, align 16, !tbaa !10
  %899 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %53)
  %900 = add <4 x i32> %899, %860
  store <4 x i32> %900, ptr %70, align 16, !tbaa !10
  %901 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %69)
  %902 = sub <4 x i32> %859, %901
  store <4 x i32> %902, ptr %72, align 16, !tbaa !10
  %903 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %57)
  %904 = sub <4 x i32> %858, %903
  store <4 x i32> %904, ptr %74, align 16, !tbaa !10
  %905 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %65)
  %906 = add <4 x i32> %905, %857
  store <4 x i32> %906, ptr %76, align 16, !tbaa !10
  %907 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %873, <4 x i16> %61)
  %908 = add <4 x i32> %907, %856
  store <4 x i32> %908, ptr %78, align 16, !tbaa !10
  br label %909

909:                                              ; preds = %876, %855
  %910 = phi <4 x i32> [ %908, %876 ], [ %856, %855 ]
  %911 = phi <4 x i32> [ %906, %876 ], [ %857, %855 ]
  %912 = phi <4 x i32> [ %904, %876 ], [ %858, %855 ]
  %913 = phi <4 x i32> [ %902, %876 ], [ %859, %855 ]
  %914 = phi <4 x i32> [ %900, %876 ], [ %860, %855 ]
  %915 = phi <4 x i32> [ %898, %876 ], [ %861, %855 ]
  %916 = phi <4 x i32> [ %896, %876 ], [ %862, %855 ]
  %917 = phi <4 x i32> [ %894, %876 ], [ %863, %855 ]
  %918 = phi <4 x i32> [ %892, %876 ], [ %864, %855 ]
  %919 = phi <4 x i32> [ %890, %876 ], [ %865, %855 ]
  %920 = phi <4 x i32> [ %888, %876 ], [ %866, %855 ]
  %921 = phi <4 x i32> [ %886, %876 ], [ %867, %855 ]
  %922 = phi <4 x i32> [ %884, %876 ], [ %868, %855 ]
  %923 = phi <4 x i32> [ %882, %876 ], [ %869, %855 ]
  %924 = phi <4 x i32> [ %880, %876 ], [ %870, %855 ]
  %925 = phi <4 x i32> [ %878, %876 ], [ %871, %855 ]
  %926 = getelementptr inbounds nuw i16, ptr %87, i64 %141
  %927 = load <4 x i16>, ptr %926, align 2
  %928 = bitcast <4 x i16> %927 to i64
  %929 = icmp eq i64 %928, 0
  br i1 %929, label %963, label %930

930:                                              ; preds = %909
  %931 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %65)
  %932 = add <4 x i32> %931, %925
  store <4 x i32> %932, ptr %9, align 16, !tbaa !10
  %933 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %53)
  %934 = sub <4 x i32> %924, %933
  store <4 x i32> %934, ptr %50, align 16, !tbaa !10
  %935 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %77)
  %936 = sub <4 x i32> %923, %935
  store <4 x i32> %936, ptr %52, align 16, !tbaa !10
  %937 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %51)
  %938 = add <4 x i32> %937, %922
  store <4 x i32> %938, ptr %54, align 16, !tbaa !10
  %939 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %67)
  %940 = sub <4 x i32> %921, %939
  store <4 x i32> %940, ptr %56, align 16, !tbaa !10
  %941 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %63)
  %942 = sub <4 x i32> %920, %941
  store <4 x i32> %942, ptr %58, align 16, !tbaa !10
  %943 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %55)
  %944 = add <4 x i32> %943, %919
  store <4 x i32> %944, ptr %60, align 16, !tbaa !10
  %945 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %75)
  %946 = add <4 x i32> %945, %918
  store <4 x i32> %946, ptr %62, align 16, !tbaa !10
  %947 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %49)
  %948 = sub <4 x i32> %917, %947
  store <4 x i32> %948, ptr %64, align 16, !tbaa !10
  %949 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %69)
  %950 = add <4 x i32> %949, %916
  store <4 x i32> %950, ptr %66, align 16, !tbaa !10
  %951 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %61)
  %952 = add <4 x i32> %951, %915
  store <4 x i32> %952, ptr %68, align 16, !tbaa !10
  %953 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %57)
  %954 = sub <4 x i32> %914, %953
  store <4 x i32> %954, ptr %70, align 16, !tbaa !10
  %955 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %73)
  %956 = sub <4 x i32> %913, %955
  store <4 x i32> %956, ptr %72, align 16, !tbaa !10
  %957 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %48)
  %958 = add <4 x i32> %957, %912
  store <4 x i32> %958, ptr %74, align 16, !tbaa !10
  %959 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %71)
  %960 = sub <4 x i32> %911, %959
  store <4 x i32> %960, ptr %76, align 16, !tbaa !10
  %961 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %927, <4 x i16> %59)
  %962 = sub <4 x i32> %910, %961
  store <4 x i32> %962, ptr %78, align 16, !tbaa !10
  br label %963

963:                                              ; preds = %930, %909
  %964 = phi <4 x i32> [ %962, %930 ], [ %910, %909 ]
  %965 = phi <4 x i32> [ %960, %930 ], [ %911, %909 ]
  %966 = phi <4 x i32> [ %958, %930 ], [ %912, %909 ]
  %967 = phi <4 x i32> [ %956, %930 ], [ %913, %909 ]
  %968 = phi <4 x i32> [ %954, %930 ], [ %914, %909 ]
  %969 = phi <4 x i32> [ %952, %930 ], [ %915, %909 ]
  %970 = phi <4 x i32> [ %950, %930 ], [ %916, %909 ]
  %971 = phi <4 x i32> [ %948, %930 ], [ %917, %909 ]
  %972 = phi <4 x i32> [ %946, %930 ], [ %918, %909 ]
  %973 = phi <4 x i32> [ %944, %930 ], [ %919, %909 ]
  %974 = phi <4 x i32> [ %942, %930 ], [ %920, %909 ]
  %975 = phi <4 x i32> [ %940, %930 ], [ %921, %909 ]
  %976 = phi <4 x i32> [ %938, %930 ], [ %922, %909 ]
  %977 = phi <4 x i32> [ %936, %930 ], [ %923, %909 ]
  %978 = phi <4 x i32> [ %934, %930 ], [ %924, %909 ]
  %979 = phi <4 x i32> [ %932, %930 ], [ %925, %909 ]
  %980 = getelementptr inbounds nuw i16, ptr %88, i64 %141
  %981 = load <4 x i16>, ptr %980, align 2
  %982 = bitcast <4 x i16> %981 to i64
  %983 = icmp eq i64 %982, 0
  br i1 %983, label %1017, label %984

984:                                              ; preds = %963
  %985 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %67)
  %986 = add <4 x i32> %985, %979
  store <4 x i32> %986, ptr %9, align 16, !tbaa !10
  %987 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %48)
  %988 = sub <4 x i32> %978, %987
  store <4 x i32> %988, ptr %50, align 16, !tbaa !10
  %989 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %69)
  %990 = add <4 x i32> %989, %977
  store <4 x i32> %990, ptr %52, align 16, !tbaa !10
  %991 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %65)
  %992 = add <4 x i32> %991, %976
  store <4 x i32> %992, ptr %54, align 16, !tbaa !10
  %993 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %49)
  %994 = sub <4 x i32> %975, %993
  store <4 x i32> %994, ptr %56, align 16, !tbaa !10
  %995 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %71)
  %996 = add <4 x i32> %995, %974
  store <4 x i32> %996, ptr %58, align 16, !tbaa !10
  %997 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %63)
  %998 = add <4 x i32> %997, %973
  store <4 x i32> %998, ptr %60, align 16, !tbaa !10
  %999 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %51)
  %1000 = sub <4 x i32> %972, %999
  store <4 x i32> %1000, ptr %62, align 16, !tbaa !10
  %1001 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %73)
  %1002 = add <4 x i32> %1001, %971
  store <4 x i32> %1002, ptr %64, align 16, !tbaa !10
  %1003 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %61)
  %1004 = add <4 x i32> %1003, %970
  store <4 x i32> %1004, ptr %66, align 16, !tbaa !10
  %1005 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %53)
  %1006 = sub <4 x i32> %969, %1005
  store <4 x i32> %1006, ptr %68, align 16, !tbaa !10
  %1007 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %75)
  %1008 = add <4 x i32> %1007, %968
  store <4 x i32> %1008, ptr %70, align 16, !tbaa !10
  %1009 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %59)
  %1010 = add <4 x i32> %1009, %967
  store <4 x i32> %1010, ptr %72, align 16, !tbaa !10
  %1011 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %55)
  %1012 = sub <4 x i32> %966, %1011
  store <4 x i32> %1012, ptr %74, align 16, !tbaa !10
  %1013 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %77)
  %1014 = add <4 x i32> %1013, %965
  store <4 x i32> %1014, ptr %76, align 16, !tbaa !10
  %1015 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %981, <4 x i16> %57)
  %1016 = add <4 x i32> %1015, %964
  store <4 x i32> %1016, ptr %78, align 16, !tbaa !10
  br label %1017

1017:                                             ; preds = %984, %963
  %1018 = phi <4 x i32> [ %1016, %984 ], [ %964, %963 ]
  %1019 = phi <4 x i32> [ %1014, %984 ], [ %965, %963 ]
  %1020 = phi <4 x i32> [ %1012, %984 ], [ %966, %963 ]
  %1021 = phi <4 x i32> [ %1010, %984 ], [ %967, %963 ]
  %1022 = phi <4 x i32> [ %1008, %984 ], [ %968, %963 ]
  %1023 = phi <4 x i32> [ %1006, %984 ], [ %969, %963 ]
  %1024 = phi <4 x i32> [ %1004, %984 ], [ %970, %963 ]
  %1025 = phi <4 x i32> [ %1002, %984 ], [ %971, %963 ]
  %1026 = phi <4 x i32> [ %1000, %984 ], [ %972, %963 ]
  %1027 = phi <4 x i32> [ %998, %984 ], [ %973, %963 ]
  %1028 = phi <4 x i32> [ %996, %984 ], [ %974, %963 ]
  %1029 = phi <4 x i32> [ %994, %984 ], [ %975, %963 ]
  %1030 = phi <4 x i32> [ %992, %984 ], [ %976, %963 ]
  %1031 = phi <4 x i32> [ %990, %984 ], [ %977, %963 ]
  %1032 = phi <4 x i32> [ %988, %984 ], [ %978, %963 ]
  %1033 = phi <4 x i32> [ %986, %984 ], [ %979, %963 ]
  %1034 = getelementptr inbounds nuw i16, ptr %89, i64 %141
  %1035 = load <4 x i16>, ptr %1034, align 2
  %1036 = bitcast <4 x i16> %1035 to i64
  %1037 = icmp eq i64 %1036, 0
  br i1 %1037, label %1071, label %1038

1038:                                             ; preds = %1017
  %1039 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %69)
  %1040 = add <4 x i32> %1039, %1033
  store <4 x i32> %1040, ptr %9, align 16, !tbaa !10
  %1041 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %51)
  %1042 = sub <4 x i32> %1032, %1041
  store <4 x i32> %1042, ptr %50, align 16, !tbaa !10
  %1043 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %59)
  %1044 = add <4 x i32> %1043, %1031
  store <4 x i32> %1044, ptr %52, align 16, !tbaa !10
  %1045 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %77)
  %1046 = sub <4 x i32> %1030, %1045
  store <4 x i32> %1046, ptr %54, align 16, !tbaa !10
  %1047 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %61)
  %1048 = sub <4 x i32> %1029, %1047
  store <4 x i32> %1048, ptr %56, align 16, !tbaa !10
  %1049 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %49)
  %1050 = add <4 x i32> %1049, %1028
  store <4 x i32> %1050, ptr %58, align 16, !tbaa !10
  %1051 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %67)
  %1052 = sub <4 x i32> %1027, %1051
  store <4 x i32> %1052, ptr %60, align 16, !tbaa !10
  %1053 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %71)
  %1054 = sub <4 x i32> %1026, %1053
  store <4 x i32> %1054, ptr %62, align 16, !tbaa !10
  %1055 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %53)
  %1056 = add <4 x i32> %1055, %1025
  store <4 x i32> %1056, ptr %64, align 16, !tbaa !10
  %1057 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %57)
  %1058 = sub <4 x i32> %1024, %1057
  store <4 x i32> %1058, ptr %66, align 16, !tbaa !10
  %1059 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %75)
  %1060 = add <4 x i32> %1059, %1023
  store <4 x i32> %1060, ptr %68, align 16, !tbaa !10
  %1061 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %63)
  %1062 = add <4 x i32> %1061, %1022
  store <4 x i32> %1062, ptr %70, align 16, !tbaa !10
  %1063 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %48)
  %1064 = sub <4 x i32> %1021, %1063
  store <4 x i32> %1064, ptr %72, align 16, !tbaa !10
  %1065 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %65)
  %1066 = add <4 x i32> %1065, %1020
  store <4 x i32> %1066, ptr %74, align 16, !tbaa !10
  %1067 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %73)
  %1068 = add <4 x i32> %1067, %1019
  store <4 x i32> %1068, ptr %76, align 16, !tbaa !10
  %1069 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1035, <4 x i16> %55)
  %1070 = sub <4 x i32> %1018, %1069
  store <4 x i32> %1070, ptr %78, align 16, !tbaa !10
  br label %1071

1071:                                             ; preds = %1038, %1017
  %1072 = phi <4 x i32> [ %1070, %1038 ], [ %1018, %1017 ]
  %1073 = phi <4 x i32> [ %1068, %1038 ], [ %1019, %1017 ]
  %1074 = phi <4 x i32> [ %1066, %1038 ], [ %1020, %1017 ]
  %1075 = phi <4 x i32> [ %1064, %1038 ], [ %1021, %1017 ]
  %1076 = phi <4 x i32> [ %1062, %1038 ], [ %1022, %1017 ]
  %1077 = phi <4 x i32> [ %1060, %1038 ], [ %1023, %1017 ]
  %1078 = phi <4 x i32> [ %1058, %1038 ], [ %1024, %1017 ]
  %1079 = phi <4 x i32> [ %1056, %1038 ], [ %1025, %1017 ]
  %1080 = phi <4 x i32> [ %1054, %1038 ], [ %1026, %1017 ]
  %1081 = phi <4 x i32> [ %1052, %1038 ], [ %1027, %1017 ]
  %1082 = phi <4 x i32> [ %1050, %1038 ], [ %1028, %1017 ]
  %1083 = phi <4 x i32> [ %1048, %1038 ], [ %1029, %1017 ]
  %1084 = phi <4 x i32> [ %1046, %1038 ], [ %1030, %1017 ]
  %1085 = phi <4 x i32> [ %1044, %1038 ], [ %1031, %1017 ]
  %1086 = phi <4 x i32> [ %1042, %1038 ], [ %1032, %1017 ]
  %1087 = phi <4 x i32> [ %1040, %1038 ], [ %1033, %1017 ]
  %1088 = getelementptr inbounds nuw i16, ptr %90, i64 %141
  %1089 = load <4 x i16>, ptr %1088, align 2
  %1090 = bitcast <4 x i16> %1089 to i64
  %1091 = icmp eq i64 %1090, 0
  br i1 %1091, label %1125, label %1092

1092:                                             ; preds = %1071
  %1093 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %71)
  %1094 = add <4 x i32> %1093, %1087
  store <4 x i32> %1094, ptr %9, align 16, !tbaa !10
  %1095 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %57)
  %1096 = sub <4 x i32> %1086, %1095
  store <4 x i32> %1096, ptr %50, align 16, !tbaa !10
  %1097 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %49)
  %1098 = add <4 x i32> %1097, %1085
  store <4 x i32> %1098, ptr %52, align 16, !tbaa !10
  %1099 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %63)
  %1100 = sub <4 x i32> %1084, %1099
  store <4 x i32> %1100, ptr %54, align 16, !tbaa !10
  %1101 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %77)
  %1102 = add <4 x i32> %1101, %1083
  store <4 x i32> %1102, ptr %56, align 16, !tbaa !10
  %1103 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %65)
  %1104 = add <4 x i32> %1103, %1082
  store <4 x i32> %1104, ptr %58, align 16, !tbaa !10
  %1105 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %51)
  %1106 = sub <4 x i32> %1081, %1105
  store <4 x i32> %1106, ptr %60, align 16, !tbaa !10
  %1107 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %55)
  %1108 = add <4 x i32> %1107, %1080
  store <4 x i32> %1108, ptr %62, align 16, !tbaa !10
  %1109 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %69)
  %1110 = sub <4 x i32> %1079, %1109
  store <4 x i32> %1110, ptr %64, align 16, !tbaa !10
  %1111 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %73)
  %1112 = sub <4 x i32> %1078, %1111
  store <4 x i32> %1112, ptr %66, align 16, !tbaa !10
  %1113 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %59)
  %1114 = add <4 x i32> %1113, %1077
  store <4 x i32> %1114, ptr %68, align 16, !tbaa !10
  %1115 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %48)
  %1116 = sub <4 x i32> %1076, %1115
  store <4 x i32> %1116, ptr %70, align 16, !tbaa !10
  %1117 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %61)
  %1118 = add <4 x i32> %1117, %1075
  store <4 x i32> %1118, ptr %72, align 16, !tbaa !10
  %1119 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %75)
  %1120 = sub <4 x i32> %1074, %1119
  store <4 x i32> %1120, ptr %74, align 16, !tbaa !10
  %1121 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %67)
  %1122 = sub <4 x i32> %1073, %1121
  store <4 x i32> %1122, ptr %76, align 16, !tbaa !10
  %1123 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1089, <4 x i16> %53)
  %1124 = add <4 x i32> %1123, %1072
  store <4 x i32> %1124, ptr %78, align 16, !tbaa !10
  br label %1125

1125:                                             ; preds = %1092, %1071
  %1126 = phi <4 x i32> [ %1124, %1092 ], [ %1072, %1071 ]
  %1127 = phi <4 x i32> [ %1122, %1092 ], [ %1073, %1071 ]
  %1128 = phi <4 x i32> [ %1120, %1092 ], [ %1074, %1071 ]
  %1129 = phi <4 x i32> [ %1118, %1092 ], [ %1075, %1071 ]
  %1130 = phi <4 x i32> [ %1116, %1092 ], [ %1076, %1071 ]
  %1131 = phi <4 x i32> [ %1114, %1092 ], [ %1077, %1071 ]
  %1132 = phi <4 x i32> [ %1112, %1092 ], [ %1078, %1071 ]
  %1133 = phi <4 x i32> [ %1110, %1092 ], [ %1079, %1071 ]
  %1134 = phi <4 x i32> [ %1108, %1092 ], [ %1080, %1071 ]
  %1135 = phi <4 x i32> [ %1106, %1092 ], [ %1081, %1071 ]
  %1136 = phi <4 x i32> [ %1104, %1092 ], [ %1082, %1071 ]
  %1137 = phi <4 x i32> [ %1102, %1092 ], [ %1083, %1071 ]
  %1138 = phi <4 x i32> [ %1100, %1092 ], [ %1084, %1071 ]
  %1139 = phi <4 x i32> [ %1098, %1092 ], [ %1085, %1071 ]
  %1140 = phi <4 x i32> [ %1096, %1092 ], [ %1086, %1071 ]
  %1141 = phi <4 x i32> [ %1094, %1092 ], [ %1087, %1071 ]
  %1142 = getelementptr inbounds nuw i16, ptr %91, i64 %141
  %1143 = load <4 x i16>, ptr %1142, align 2
  %1144 = bitcast <4 x i16> %1143 to i64
  %1145 = icmp eq i64 %1144, 0
  br i1 %1145, label %1179, label %1146

1146:                                             ; preds = %1125
  %1147 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %73)
  %1148 = add <4 x i32> %1147, %1141
  store <4 x i32> %1148, ptr %9, align 16, !tbaa !10
  %1149 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %63)
  %1150 = sub <4 x i32> %1140, %1149
  store <4 x i32> %1150, ptr %50, align 16, !tbaa !10
  %1151 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %53)
  %1152 = add <4 x i32> %1151, %1139
  store <4 x i32> %1152, ptr %52, align 16, !tbaa !10
  %1153 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %49)
  %1154 = sub <4 x i32> %1138, %1153
  store <4 x i32> %1154, ptr %54, align 16, !tbaa !10
  %1155 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %59)
  %1156 = add <4 x i32> %1155, %1137
  store <4 x i32> %1156, ptr %56, align 16, !tbaa !10
  %1157 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %69)
  %1158 = sub <4 x i32> %1136, %1157
  store <4 x i32> %1158, ptr %58, align 16, !tbaa !10
  %1159 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %77)
  %1160 = sub <4 x i32> %1135, %1159
  store <4 x i32> %1160, ptr %60, align 16, !tbaa !10
  %1161 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %67)
  %1162 = add <4 x i32> %1161, %1134
  store <4 x i32> %1162, ptr %62, align 16, !tbaa !10
  %1163 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %57)
  %1164 = sub <4 x i32> %1133, %1163
  store <4 x i32> %1164, ptr %64, align 16, !tbaa !10
  %1165 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %48)
  %1166 = add <4 x i32> %1165, %1132
  store <4 x i32> %1166, ptr %66, align 16, !tbaa !10
  %1167 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %55)
  %1168 = sub <4 x i32> %1131, %1167
  store <4 x i32> %1168, ptr %68, align 16, !tbaa !10
  %1169 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %65)
  %1170 = add <4 x i32> %1169, %1130
  store <4 x i32> %1170, ptr %70, align 16, !tbaa !10
  %1171 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %75)
  %1172 = sub <4 x i32> %1129, %1171
  store <4 x i32> %1172, ptr %72, align 16, !tbaa !10
  %1173 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %71)
  %1174 = sub <4 x i32> %1128, %1173
  store <4 x i32> %1174, ptr %74, align 16, !tbaa !10
  %1175 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %61)
  %1176 = add <4 x i32> %1175, %1127
  store <4 x i32> %1176, ptr %76, align 16, !tbaa !10
  %1177 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1143, <4 x i16> %51)
  %1178 = sub <4 x i32> %1126, %1177
  store <4 x i32> %1178, ptr %78, align 16, !tbaa !10
  br label %1179

1179:                                             ; preds = %1146, %1125
  %1180 = phi <4 x i32> [ %1178, %1146 ], [ %1126, %1125 ]
  %1181 = phi <4 x i32> [ %1176, %1146 ], [ %1127, %1125 ]
  %1182 = phi <4 x i32> [ %1174, %1146 ], [ %1128, %1125 ]
  %1183 = phi <4 x i32> [ %1172, %1146 ], [ %1129, %1125 ]
  %1184 = phi <4 x i32> [ %1170, %1146 ], [ %1130, %1125 ]
  %1185 = phi <4 x i32> [ %1168, %1146 ], [ %1131, %1125 ]
  %1186 = phi <4 x i32> [ %1166, %1146 ], [ %1132, %1125 ]
  %1187 = phi <4 x i32> [ %1164, %1146 ], [ %1133, %1125 ]
  %1188 = phi <4 x i32> [ %1162, %1146 ], [ %1134, %1125 ]
  %1189 = phi <4 x i32> [ %1160, %1146 ], [ %1135, %1125 ]
  %1190 = phi <4 x i32> [ %1158, %1146 ], [ %1136, %1125 ]
  %1191 = phi <4 x i32> [ %1156, %1146 ], [ %1137, %1125 ]
  %1192 = phi <4 x i32> [ %1154, %1146 ], [ %1138, %1125 ]
  %1193 = phi <4 x i32> [ %1152, %1146 ], [ %1139, %1125 ]
  %1194 = phi <4 x i32> [ %1150, %1146 ], [ %1140, %1125 ]
  %1195 = phi <4 x i32> [ %1148, %1146 ], [ %1141, %1125 ]
  %1196 = getelementptr inbounds nuw i16, ptr %92, i64 %141
  %1197 = load <4 x i16>, ptr %1196, align 2
  %1198 = bitcast <4 x i16> %1197 to i64
  %1199 = icmp eq i64 %1198, 0
  br i1 %1199, label %1233, label %1200

1200:                                             ; preds = %1179
  %1201 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %75)
  %1202 = add <4 x i32> %1201, %1195
  store <4 x i32> %1202, ptr %9, align 16, !tbaa !10
  %1203 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %69)
  %1204 = sub <4 x i32> %1194, %1203
  store <4 x i32> %1204, ptr %50, align 16, !tbaa !10
  %1205 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %63)
  %1206 = add <4 x i32> %1205, %1193
  store <4 x i32> %1206, ptr %52, align 16, !tbaa !10
  %1207 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %57)
  %1208 = sub <4 x i32> %1192, %1207
  store <4 x i32> %1208, ptr %54, align 16, !tbaa !10
  %1209 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %51)
  %1210 = add <4 x i32> %1209, %1191
  store <4 x i32> %1210, ptr %56, align 16, !tbaa !10
  %1211 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %48)
  %1212 = sub <4 x i32> %1190, %1211
  store <4 x i32> %1212, ptr %58, align 16, !tbaa !10
  %1213 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %53)
  %1214 = add <4 x i32> %1213, %1189
  store <4 x i32> %1214, ptr %60, align 16, !tbaa !10
  %1215 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %59)
  %1216 = sub <4 x i32> %1188, %1215
  store <4 x i32> %1216, ptr %62, align 16, !tbaa !10
  %1217 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %65)
  %1218 = add <4 x i32> %1217, %1187
  store <4 x i32> %1218, ptr %64, align 16, !tbaa !10
  %1219 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %71)
  %1220 = sub <4 x i32> %1186, %1219
  store <4 x i32> %1220, ptr %66, align 16, !tbaa !10
  %1221 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %77)
  %1222 = add <4 x i32> %1221, %1185
  store <4 x i32> %1222, ptr %68, align 16, !tbaa !10
  %1223 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %73)
  %1224 = add <4 x i32> %1223, %1184
  store <4 x i32> %1224, ptr %70, align 16, !tbaa !10
  %1225 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %67)
  %1226 = sub <4 x i32> %1183, %1225
  store <4 x i32> %1226, ptr %72, align 16, !tbaa !10
  %1227 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %61)
  %1228 = add <4 x i32> %1227, %1182
  store <4 x i32> %1228, ptr %74, align 16, !tbaa !10
  %1229 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %55)
  %1230 = sub <4 x i32> %1181, %1229
  store <4 x i32> %1230, ptr %76, align 16, !tbaa !10
  %1231 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1197, <4 x i16> %49)
  %1232 = add <4 x i32> %1231, %1180
  store <4 x i32> %1232, ptr %78, align 16, !tbaa !10
  br label %1233

1233:                                             ; preds = %1200, %1179
  %1234 = phi <4 x i32> [ %1232, %1200 ], [ %1180, %1179 ]
  %1235 = phi <4 x i32> [ %1230, %1200 ], [ %1181, %1179 ]
  %1236 = phi <4 x i32> [ %1228, %1200 ], [ %1182, %1179 ]
  %1237 = phi <4 x i32> [ %1226, %1200 ], [ %1183, %1179 ]
  %1238 = phi <4 x i32> [ %1224, %1200 ], [ %1184, %1179 ]
  %1239 = phi <4 x i32> [ %1222, %1200 ], [ %1185, %1179 ]
  %1240 = phi <4 x i32> [ %1220, %1200 ], [ %1186, %1179 ]
  %1241 = phi <4 x i32> [ %1218, %1200 ], [ %1187, %1179 ]
  %1242 = phi <4 x i32> [ %1216, %1200 ], [ %1188, %1179 ]
  %1243 = phi <4 x i32> [ %1214, %1200 ], [ %1189, %1179 ]
  %1244 = phi <4 x i32> [ %1212, %1200 ], [ %1190, %1179 ]
  %1245 = phi <4 x i32> [ %1210, %1200 ], [ %1191, %1179 ]
  %1246 = phi <4 x i32> [ %1208, %1200 ], [ %1192, %1179 ]
  %1247 = phi <4 x i32> [ %1206, %1200 ], [ %1193, %1179 ]
  %1248 = phi <4 x i32> [ %1204, %1200 ], [ %1194, %1179 ]
  %1249 = phi <4 x i32> [ %1202, %1200 ], [ %1195, %1179 ]
  %1250 = getelementptr inbounds nuw i16, ptr %93, i64 %141
  %1251 = load <4 x i16>, ptr %1250, align 2
  %1252 = bitcast <4 x i16> %1251 to i64
  %1253 = icmp eq i64 %1252, 0
  br i1 %1253, label %1287, label %1254

1254:                                             ; preds = %1233
  %1255 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %77)
  %1256 = add <4 x i32> %1255, %1249
  store <4 x i32> %1256, ptr %9, align 16, !tbaa !10
  %1257 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %75)
  %1258 = sub <4 x i32> %1248, %1257
  store <4 x i32> %1258, ptr %50, align 16, !tbaa !10
  %1259 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %73)
  %1260 = add <4 x i32> %1259, %1247
  store <4 x i32> %1260, ptr %52, align 16, !tbaa !10
  %1261 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %71)
  %1262 = sub <4 x i32> %1246, %1261
  store <4 x i32> %1262, ptr %54, align 16, !tbaa !10
  %1263 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %69)
  %1264 = add <4 x i32> %1263, %1245
  store <4 x i32> %1264, ptr %56, align 16, !tbaa !10
  %1265 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %67)
  %1266 = sub <4 x i32> %1244, %1265
  store <4 x i32> %1266, ptr %58, align 16, !tbaa !10
  %1267 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %65)
  %1268 = add <4 x i32> %1267, %1243
  store <4 x i32> %1268, ptr %60, align 16, !tbaa !10
  %1269 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %63)
  %1270 = sub <4 x i32> %1242, %1269
  store <4 x i32> %1270, ptr %62, align 16, !tbaa !10
  %1271 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %61)
  %1272 = add <4 x i32> %1271, %1241
  store <4 x i32> %1272, ptr %64, align 16, !tbaa !10
  %1273 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %59)
  %1274 = sub <4 x i32> %1240, %1273
  store <4 x i32> %1274, ptr %66, align 16, !tbaa !10
  %1275 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %57)
  %1276 = add <4 x i32> %1275, %1239
  store <4 x i32> %1276, ptr %68, align 16, !tbaa !10
  %1277 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %55)
  %1278 = sub <4 x i32> %1238, %1277
  store <4 x i32> %1278, ptr %70, align 16, !tbaa !10
  %1279 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %53)
  %1280 = add <4 x i32> %1279, %1237
  store <4 x i32> %1280, ptr %72, align 16, !tbaa !10
  %1281 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %51)
  %1282 = sub <4 x i32> %1236, %1281
  store <4 x i32> %1282, ptr %74, align 16, !tbaa !10
  %1283 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %49)
  %1284 = add <4 x i32> %1283, %1235
  store <4 x i32> %1284, ptr %76, align 16, !tbaa !10
  %1285 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1251, <4 x i16> %48)
  %1286 = sub <4 x i32> %1234, %1285
  store <4 x i32> %1286, ptr %78, align 16, !tbaa !10
  br label %1287

1287:                                             ; preds = %1254, %1233
  call void @llvm.lifetime.start.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %11) #10
  br label %1388

1288:                                             ; preds = %1388
  %1289 = load <4 x i16>, ptr %10, align 8, !tbaa !10
  %1290 = load <4 x i16>, ptr %94, align 8, !tbaa !10
  %1291 = load <4 x i16>, ptr %95, align 8, !tbaa !10
  %1292 = load <4 x i16>, ptr %96, align 8, !tbaa !10
  %1293 = load <4 x i16>, ptr %97, align 8, !tbaa !10
  %1294 = load <4 x i16>, ptr %98, align 8, !tbaa !10
  %1295 = load <4 x i16>, ptr %99, align 8, !tbaa !10
  %1296 = load <4 x i16>, ptr %100, align 8, !tbaa !10
  %1297 = shufflevector <4 x i16> %1289, <4 x i16> %1293, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1298 = shufflevector <4 x i16> %1290, <4 x i16> %1294, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1299 = shufflevector <4 x i16> %1291, <4 x i16> %1295, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1300 = shufflevector <4 x i16> %1292, <4 x i16> %1296, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1301 = shufflevector <8 x i16> %1297, <8 x i16> %1299, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1302 = shufflevector <8 x i16> %1297, <8 x i16> %1299, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1303 = shufflevector <8 x i16> %1298, <8 x i16> %1300, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1304 = shufflevector <8 x i16> %1298, <8 x i16> %1300, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1305 = shufflevector <8 x i16> %1301, <8 x i16> %1303, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1306 = shufflevector <8 x i16> %1301, <8 x i16> %1303, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1307 = shufflevector <8 x i16> %1302, <8 x i16> %1304, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1308 = shufflevector <8 x i16> %1302, <8 x i16> %1304, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1309 = load <4 x i16>, ptr %101, align 8, !tbaa !10
  %1310 = load <4 x i16>, ptr %102, align 8, !tbaa !10
  %1311 = load <4 x i16>, ptr %103, align 8, !tbaa !10
  %1312 = load <4 x i16>, ptr %104, align 8, !tbaa !10
  %1313 = load <4 x i16>, ptr %105, align 8, !tbaa !10
  %1314 = load <4 x i16>, ptr %106, align 8, !tbaa !10
  %1315 = load <4 x i16>, ptr %107, align 8, !tbaa !10
  %1316 = load <4 x i16>, ptr %108, align 8, !tbaa !10
  %1317 = shufflevector <4 x i16> %1309, <4 x i16> %1313, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1318 = shufflevector <4 x i16> %1310, <4 x i16> %1314, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1319 = shufflevector <4 x i16> %1311, <4 x i16> %1315, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1320 = shufflevector <4 x i16> %1312, <4 x i16> %1316, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1321 = shufflevector <8 x i16> %1317, <8 x i16> %1319, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1322 = shufflevector <8 x i16> %1317, <8 x i16> %1319, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1323 = shufflevector <8 x i16> %1318, <8 x i16> %1320, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1324 = shufflevector <8 x i16> %1318, <8 x i16> %1320, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1325 = shufflevector <8 x i16> %1321, <8 x i16> %1323, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1326 = shufflevector <8 x i16> %1321, <8 x i16> %1323, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1327 = shufflevector <8 x i16> %1322, <8 x i16> %1324, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1328 = shufflevector <8 x i16> %1322, <8 x i16> %1324, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1329 = load <4 x i16>, ptr %11, align 8, !tbaa !10
  %1330 = load <4 x i16>, ptr %109, align 8, !tbaa !10
  %1331 = load <4 x i16>, ptr %110, align 8, !tbaa !10
  %1332 = load <4 x i16>, ptr %111, align 8, !tbaa !10
  %1333 = load <4 x i16>, ptr %112, align 8, !tbaa !10
  %1334 = load <4 x i16>, ptr %113, align 8, !tbaa !10
  %1335 = load <4 x i16>, ptr %114, align 8, !tbaa !10
  %1336 = load <4 x i16>, ptr %115, align 8, !tbaa !10
  %1337 = shufflevector <4 x i16> %1329, <4 x i16> %1333, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1338 = shufflevector <4 x i16> %1330, <4 x i16> %1334, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1339 = shufflevector <4 x i16> %1331, <4 x i16> %1335, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1340 = shufflevector <4 x i16> %1332, <4 x i16> %1336, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1341 = shufflevector <8 x i16> %1337, <8 x i16> %1339, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1342 = shufflevector <8 x i16> %1337, <8 x i16> %1339, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1343 = shufflevector <8 x i16> %1338, <8 x i16> %1340, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1344 = shufflevector <8 x i16> %1338, <8 x i16> %1340, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1345 = shufflevector <8 x i16> %1341, <8 x i16> %1343, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1346 = shufflevector <8 x i16> %1341, <8 x i16> %1343, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1347 = shufflevector <8 x i16> %1342, <8 x i16> %1344, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1348 = shufflevector <8 x i16> %1342, <8 x i16> %1344, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1349 = load <4 x i16>, ptr %116, align 8, !tbaa !10
  %1350 = load <4 x i16>, ptr %117, align 8, !tbaa !10
  %1351 = load <4 x i16>, ptr %118, align 8, !tbaa !10
  %1352 = load <4 x i16>, ptr %119, align 8, !tbaa !10
  %1353 = load <4 x i16>, ptr %120, align 8, !tbaa !10
  %1354 = load <4 x i16>, ptr %121, align 8, !tbaa !10
  %1355 = load <4 x i16>, ptr %122, align 8, !tbaa !10
  %1356 = load <4 x i16>, ptr %123, align 8, !tbaa !10
  %1357 = shufflevector <4 x i16> %1349, <4 x i16> %1353, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1358 = shufflevector <4 x i16> %1350, <4 x i16> %1354, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1359 = shufflevector <4 x i16> %1351, <4 x i16> %1355, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1360 = shufflevector <4 x i16> %1352, <4 x i16> %1356, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %1361 = shufflevector <8 x i16> %1357, <8 x i16> %1359, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1362 = shufflevector <8 x i16> %1357, <8 x i16> %1359, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1363 = shufflevector <8 x i16> %1358, <8 x i16> %1360, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1364 = shufflevector <8 x i16> %1358, <8 x i16> %1360, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1365 = shufflevector <8 x i16> %1361, <8 x i16> %1363, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1366 = shufflevector <8 x i16> %1361, <8 x i16> %1363, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1367 = shufflevector <8 x i16> %1362, <8 x i16> %1364, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %1368 = shufflevector <8 x i16> %1362, <8 x i16> %1364, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %1369 = shl nuw nsw i64 %140, 8
  %1370 = getelementptr inbounds nuw i8, ptr %12, i64 %1369
  store <8 x i16> %1305, ptr %1370, align 32
  %1371 = getelementptr inbounds nuw i8, ptr %1370, i64 16
  store <8 x i16> %1325, ptr %1371, align 16
  %1372 = getelementptr inbounds nuw i8, ptr %1370, i64 32
  store <8 x i16> %1345, ptr %1372, align 32
  %1373 = getelementptr inbounds nuw i8, ptr %1370, i64 48
  store <8 x i16> %1365, ptr %1373, align 16
  %1374 = getelementptr inbounds nuw i8, ptr %1370, i64 64
  store <8 x i16> %1306, ptr %1374, align 32
  %1375 = getelementptr inbounds nuw i8, ptr %1370, i64 80
  store <8 x i16> %1326, ptr %1375, align 16
  %1376 = getelementptr inbounds nuw i8, ptr %1370, i64 96
  store <8 x i16> %1346, ptr %1376, align 32
  %1377 = getelementptr inbounds nuw i8, ptr %1370, i64 112
  store <8 x i16> %1366, ptr %1377, align 16
  %1378 = getelementptr inbounds nuw i8, ptr %1370, i64 128
  store <8 x i16> %1307, ptr %1378, align 32
  %1379 = getelementptr inbounds nuw i8, ptr %1370, i64 144
  store <8 x i16> %1327, ptr %1379, align 16
  %1380 = getelementptr inbounds nuw i8, ptr %1370, i64 160
  store <8 x i16> %1347, ptr %1380, align 32
  %1381 = getelementptr inbounds nuw i8, ptr %1370, i64 176
  store <8 x i16> %1367, ptr %1381, align 16
  %1382 = getelementptr inbounds nuw i8, ptr %1370, i64 192
  store <8 x i16> %1308, ptr %1382, align 32
  %1383 = getelementptr inbounds nuw i8, ptr %1370, i64 208
  store <8 x i16> %1328, ptr %1383, align 16
  %1384 = getelementptr inbounds nuw i8, ptr %1370, i64 224
  store <8 x i16> %1348, ptr %1384, align 32
  %1385 = getelementptr inbounds nuw i8, ptr %1370, i64 240
  store <8 x i16> %1368, ptr %1385, align 16
  call void @llvm.lifetime.end.p0(ptr nonnull %11) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %10) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %9) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %8) #10
  %1386 = add nuw nsw i64 %140, 1
  %1387 = icmp eq i64 %1386, 8
  br i1 %1387, label %1407, label %139, !llvm.loop !32

1388:                                             ; preds = %1388, %1287
  %1389 = phi i64 [ 0, %1287 ], [ %1405, %1388 ]
  %1390 = getelementptr inbounds nuw <4 x i32>, ptr %8, i64 %1389
  %1391 = load <4 x i32>, ptr %1390, align 16, !tbaa !10
  %1392 = getelementptr inbounds nuw <4 x i32>, ptr %9, i64 %1389
  %1393 = load <4 x i32>, ptr %1392, align 16, !tbaa !10
  %1394 = add <4 x i32> %1393, %1391
  %1395 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %1394, i32 7)
  %1396 = getelementptr inbounds nuw <4 x i16>, ptr %10, i64 %1389
  store <4 x i16> %1395, ptr %1396, align 8, !tbaa !10
  %1397 = sub nuw nsw i64 15, %1389
  %1398 = getelementptr inbounds nuw <4 x i32>, ptr %8, i64 %1397
  %1399 = load <4 x i32>, ptr %1398, align 16, !tbaa !10
  %1400 = getelementptr inbounds nuw <4 x i32>, ptr %9, i64 %1397
  %1401 = load <4 x i32>, ptr %1400, align 16, !tbaa !10
  %1402 = sub <4 x i32> %1399, %1401
  %1403 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %1402, i32 7)
  %1404 = getelementptr inbounds nuw <4 x i16>, ptr %11, i64 %1389
  store <4 x i16> %1403, ptr %1404, align 8, !tbaa !10
  %1405 = add nuw nsw i64 %1389, 1
  %1406 = icmp eq i64 %1405, 16
  br i1 %1406, label %1288, label %1388, !llvm.loop !33

1407:                                             ; preds = %1288
  %1408 = getelementptr inbounds nuw i8, ptr %12, i64 1024
  %1409 = getelementptr inbounds nuw i8, ptr %12, i64 512
  %1410 = getelementptr inbounds nuw i8, ptr %12, i64 1536
  %1411 = getelementptr inbounds nuw i8, ptr %12, i64 256
  %1412 = getelementptr inbounds nuw i8, ptr %12, i64 768
  %1413 = getelementptr inbounds nuw i8, ptr %12, i64 1280
  %1414 = getelementptr inbounds nuw i8, ptr %12, i64 1792
  %1415 = getelementptr inbounds nuw i8, ptr %12, i64 128
  %1416 = getelementptr inbounds nuw i8, ptr %12, i64 384
  %1417 = getelementptr inbounds nuw i8, ptr %12, i64 640
  %1418 = getelementptr inbounds nuw i8, ptr %12, i64 896
  %1419 = getelementptr inbounds nuw i8, ptr %12, i64 1152
  %1420 = getelementptr inbounds nuw i8, ptr %12, i64 1408
  %1421 = getelementptr inbounds nuw i8, ptr %12, i64 1664
  %1422 = getelementptr inbounds nuw i8, ptr %12, i64 1920
  %1423 = getelementptr inbounds nuw i8, ptr %12, i64 64
  %1424 = getelementptr inbounds nuw i8, ptr %5, i64 16
  %1425 = getelementptr inbounds nuw i8, ptr %5, i64 32
  %1426 = getelementptr inbounds nuw i8, ptr %5, i64 48
  %1427 = getelementptr inbounds nuw i8, ptr %5, i64 64
  %1428 = getelementptr inbounds nuw i8, ptr %5, i64 80
  %1429 = getelementptr inbounds nuw i8, ptr %5, i64 96
  %1430 = getelementptr inbounds nuw i8, ptr %5, i64 112
  %1431 = getelementptr inbounds nuw i8, ptr %5, i64 128
  %1432 = getelementptr inbounds nuw i8, ptr %5, i64 144
  %1433 = getelementptr inbounds nuw i8, ptr %5, i64 160
  %1434 = getelementptr inbounds nuw i8, ptr %5, i64 176
  %1435 = getelementptr inbounds nuw i8, ptr %5, i64 192
  %1436 = getelementptr inbounds nuw i8, ptr %5, i64 208
  %1437 = getelementptr inbounds nuw i8, ptr %5, i64 224
  %1438 = getelementptr inbounds nuw i8, ptr %5, i64 240
  %1439 = getelementptr inbounds nuw i8, ptr %12, i64 192
  %1440 = getelementptr inbounds nuw i8, ptr %12, i64 320
  %1441 = getelementptr inbounds nuw i8, ptr %12, i64 448
  %1442 = getelementptr inbounds nuw i8, ptr %12, i64 576
  %1443 = getelementptr inbounds nuw i8, ptr %12, i64 704
  %1444 = getelementptr inbounds nuw i8, ptr %12, i64 832
  %1445 = getelementptr inbounds nuw i8, ptr %12, i64 960
  %1446 = getelementptr inbounds nuw i8, ptr %12, i64 1088
  %1447 = getelementptr inbounds nuw i8, ptr %12, i64 1216
  %1448 = getelementptr inbounds nuw i8, ptr %12, i64 1344
  %1449 = getelementptr inbounds nuw i8, ptr %12, i64 1472
  %1450 = getelementptr inbounds nuw i8, ptr %12, i64 1600
  %1451 = getelementptr inbounds nuw i8, ptr %12, i64 1728
  %1452 = getelementptr inbounds nuw i8, ptr %12, i64 1856
  %1453 = getelementptr inbounds nuw i8, ptr %12, i64 1984
  %1454 = getelementptr inbounds nuw i8, ptr %6, i64 8
  %1455 = getelementptr inbounds nuw i8, ptr %6, i64 16
  %1456 = getelementptr inbounds nuw i8, ptr %6, i64 24
  %1457 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %1458 = getelementptr inbounds nuw i8, ptr %6, i64 40
  %1459 = getelementptr inbounds nuw i8, ptr %6, i64 48
  %1460 = getelementptr inbounds nuw i8, ptr %6, i64 56
  %1461 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %1462 = getelementptr inbounds nuw i8, ptr %6, i64 72
  %1463 = getelementptr inbounds nuw i8, ptr %6, i64 80
  %1464 = getelementptr inbounds nuw i8, ptr %6, i64 88
  %1465 = getelementptr inbounds nuw i8, ptr %6, i64 96
  %1466 = getelementptr inbounds nuw i8, ptr %6, i64 104
  %1467 = getelementptr inbounds nuw i8, ptr %6, i64 112
  %1468 = getelementptr inbounds nuw i8, ptr %6, i64 120
  %1469 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %1470 = getelementptr inbounds nuw i8, ptr %7, i64 16
  %1471 = getelementptr inbounds nuw i8, ptr %7, i64 24
  %1472 = getelementptr inbounds nuw i8, ptr %7, i64 32
  %1473 = getelementptr inbounds nuw i8, ptr %7, i64 40
  %1474 = getelementptr inbounds nuw i8, ptr %7, i64 48
  %1475 = getelementptr inbounds nuw i8, ptr %7, i64 56
  %1476 = getelementptr inbounds nuw i8, ptr %7, i64 64
  %1477 = getelementptr inbounds nuw i8, ptr %7, i64 72
  %1478 = getelementptr inbounds nuw i8, ptr %7, i64 80
  %1479 = getelementptr inbounds nuw i8, ptr %7, i64 88
  %1480 = getelementptr inbounds nuw i8, ptr %7, i64 96
  %1481 = getelementptr inbounds nuw i8, ptr %7, i64 104
  %1482 = getelementptr inbounds nuw i8, ptr %7, i64 112
  %1483 = getelementptr inbounds nuw i8, ptr %7, i64 120
  %1484 = getelementptr inbounds nuw i8, ptr %4, i64 128
  %1485 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %1486 = getelementptr inbounds nuw i8, ptr %4, i64 144
  %1487 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %1488 = getelementptr inbounds nuw i8, ptr %4, i64 160
  %1489 = getelementptr inbounds nuw i8, ptr %4, i64 48
  %1490 = getelementptr inbounds nuw i8, ptr %4, i64 176
  %1491 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %1492 = getelementptr inbounds nuw i8, ptr %4, i64 192
  %1493 = getelementptr inbounds nuw i8, ptr %4, i64 80
  %1494 = getelementptr inbounds nuw i8, ptr %4, i64 208
  %1495 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %1496 = getelementptr inbounds nuw i8, ptr %4, i64 224
  %1497 = getelementptr inbounds nuw i8, ptr %4, i64 112
  %1498 = getelementptr inbounds nuw i8, ptr %4, i64 240
  br label %1499

1499:                                             ; preds = %2648, %1407
  %1500 = phi i64 [ 0, %1407 ], [ %2752, %2648 ]
  %1501 = shl nuw nsw i64 %1500, 2
  %1502 = getelementptr inbounds nuw i16, ptr %12, i64 %1501
  %1503 = load <4 x i16>, ptr %1502, align 8
  %1504 = getelementptr inbounds nuw i16, ptr %1408, i64 %1501
  %1505 = load <4 x i16>, ptr %1504, align 8
  %1506 = sext <4 x i16> %1503 to <4 x i32>
  %1507 = sext <4 x i16> %1505 to <4 x i32>
  %1508 = add nsw <4 x i32> %1507, %1506
  %1509 = shl nsw <4 x i32> %1508, splat (i32 6)
  %1510 = sub nsw <4 x i32> %1506, %1507
  %1511 = shl nsw <4 x i32> %1510, splat (i32 6)
  %1512 = getelementptr inbounds nuw i16, ptr %1409, i64 %1501
  %1513 = load <4 x i16>, ptr %1512, align 8
  %1514 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1513, <4 x i16> %16)
  %1515 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1513, <4 x i16> %17)
  %1516 = getelementptr inbounds nuw i16, ptr %1410, i64 %1501
  %1517 = load <4 x i16>, ptr %1516, align 8
  %1518 = bitcast <4 x i16> %1517 to i64
  %1519 = icmp eq i64 %1518, 0
  br i1 %1519, label %1525, label %1520

1520:                                             ; preds = %1499
  %1521 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1517, <4 x i16> %17)
  %1522 = add <4 x i32> %1521, %1514
  %1523 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1517, <4 x i16> %16)
  %1524 = sub <4 x i32> %1515, %1523
  br label %1525

1525:                                             ; preds = %1520, %1499
  %1526 = phi <4 x i32> [ %1514, %1499 ], [ %1522, %1520 ]
  %1527 = phi <4 x i32> [ %1515, %1499 ], [ %1524, %1520 ]
  %1528 = add <4 x i32> %1526, %1509
  %1529 = sub <4 x i32> %1511, %1527
  %1530 = add <4 x i32> %1527, %1511
  %1531 = sub <4 x i32> %1509, %1526
  %1532 = getelementptr inbounds nuw i16, ptr %1411, i64 %1501
  %1533 = load <4 x i16>, ptr %1532, align 8
  %1534 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1533, <4 x i16> %21)
  %1535 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1533, <4 x i16> %22)
  %1536 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1533, <4 x i16> %23)
  %1537 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1533, <4 x i16> %24)
  %1538 = getelementptr inbounds nuw i16, ptr %1412, i64 %1501
  %1539 = load <4 x i16>, ptr %1538, align 8
  %1540 = bitcast <4 x i16> %1539 to i64
  %1541 = icmp eq i64 %1540, 0
  br i1 %1541, label %1551, label %1542

1542:                                             ; preds = %1525
  %1543 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1539, <4 x i16> %22)
  %1544 = add <4 x i32> %1543, %1534
  %1545 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1539, <4 x i16> %24)
  %1546 = sub <4 x i32> %1535, %1545
  %1547 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1539, <4 x i16> %21)
  %1548 = sub <4 x i32> %1536, %1547
  %1549 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1539, <4 x i16> %23)
  %1550 = sub <4 x i32> %1537, %1549
  br label %1551

1551:                                             ; preds = %1542, %1525
  %1552 = phi <4 x i32> [ %1534, %1525 ], [ %1544, %1542 ]
  %1553 = phi <4 x i32> [ %1535, %1525 ], [ %1546, %1542 ]
  %1554 = phi <4 x i32> [ %1536, %1525 ], [ %1548, %1542 ]
  %1555 = phi <4 x i32> [ %1537, %1525 ], [ %1550, %1542 ]
  %1556 = getelementptr inbounds nuw i16, ptr %1413, i64 %1501
  %1557 = load <4 x i16>, ptr %1556, align 8
  %1558 = bitcast <4 x i16> %1557 to i64
  %1559 = icmp eq i64 %1558, 0
  br i1 %1559, label %1569, label %1560

1560:                                             ; preds = %1551
  %1561 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1557, <4 x i16> %23)
  %1562 = add <4 x i32> %1561, %1552
  %1563 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1557, <4 x i16> %21)
  %1564 = sub <4 x i32> %1553, %1563
  %1565 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1557, <4 x i16> %24)
  %1566 = add <4 x i32> %1565, %1554
  %1567 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1557, <4 x i16> %22)
  %1568 = add <4 x i32> %1567, %1555
  br label %1569

1569:                                             ; preds = %1560, %1551
  %1570 = phi <4 x i32> [ %1552, %1551 ], [ %1562, %1560 ]
  %1571 = phi <4 x i32> [ %1553, %1551 ], [ %1564, %1560 ]
  %1572 = phi <4 x i32> [ %1554, %1551 ], [ %1566, %1560 ]
  %1573 = phi <4 x i32> [ %1555, %1551 ], [ %1568, %1560 ]
  %1574 = getelementptr inbounds nuw i16, ptr %1414, i64 %1501
  %1575 = load <4 x i16>, ptr %1574, align 8
  %1576 = bitcast <4 x i16> %1575 to i64
  %1577 = icmp eq i64 %1576, 0
  br i1 %1577, label %1587, label %1578

1578:                                             ; preds = %1569
  %1579 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1575, <4 x i16> %24)
  %1580 = add <4 x i32> %1579, %1570
  %1581 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1575, <4 x i16> %23)
  %1582 = sub <4 x i32> %1571, %1581
  %1583 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1575, <4 x i16> %22)
  %1584 = add <4 x i32> %1583, %1572
  %1585 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1575, <4 x i16> %21)
  %1586 = sub <4 x i32> %1573, %1585
  br label %1587

1587:                                             ; preds = %1578, %1569
  %1588 = phi <4 x i32> [ %1570, %1569 ], [ %1580, %1578 ]
  %1589 = phi <4 x i32> [ %1571, %1569 ], [ %1582, %1578 ]
  %1590 = phi <4 x i32> [ %1572, %1569 ], [ %1584, %1578 ]
  %1591 = phi <4 x i32> [ %1573, %1569 ], [ %1586, %1578 ]
  %1592 = add <4 x i32> %1588, %1528
  %1593 = sub <4 x i32> %1531, %1591
  %1594 = add <4 x i32> %1589, %1530
  %1595 = sub <4 x i32> %1529, %1590
  %1596 = add <4 x i32> %1590, %1529
  %1597 = sub <4 x i32> %1530, %1589
  %1598 = add <4 x i32> %1591, %1531
  %1599 = sub <4 x i32> %1528, %1588
  %1600 = getelementptr inbounds nuw i16, ptr %1415, i64 %1501
  %1601 = load <4 x i16>, ptr %1600, align 8
  %1602 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %30)
  %1603 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %31)
  %1604 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %32)
  %1605 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %33)
  %1606 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %34)
  %1607 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %35)
  %1608 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %36)
  %1609 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1601, <4 x i16> %37)
  %1610 = getelementptr inbounds nuw i16, ptr %1416, i64 %1501
  %1611 = load <4 x i16>, ptr %1610, align 8
  %1612 = bitcast <4 x i16> %1611 to i64
  %1613 = icmp eq i64 %1612, 0
  br i1 %1613, label %1631, label %1614

1614:                                             ; preds = %1587
  %1615 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %31)
  %1616 = add <4 x i32> %1615, %1602
  %1617 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %34)
  %1618 = add <4 x i32> %1617, %1603
  %1619 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %37)
  %1620 = add <4 x i32> %1619, %1604
  %1621 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %35)
  %1622 = sub <4 x i32> %1605, %1621
  %1623 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %32)
  %1624 = sub <4 x i32> %1606, %1623
  %1625 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %30)
  %1626 = sub <4 x i32> %1607, %1625
  %1627 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %33)
  %1628 = sub <4 x i32> %1608, %1627
  %1629 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1611, <4 x i16> %36)
  %1630 = sub <4 x i32> %1609, %1629
  br label %1631

1631:                                             ; preds = %1614, %1587
  %1632 = phi <4 x i32> [ %1609, %1587 ], [ %1630, %1614 ]
  %1633 = phi <4 x i32> [ %1608, %1587 ], [ %1628, %1614 ]
  %1634 = phi <4 x i32> [ %1607, %1587 ], [ %1626, %1614 ]
  %1635 = phi <4 x i32> [ %1606, %1587 ], [ %1624, %1614 ]
  %1636 = phi <4 x i32> [ %1605, %1587 ], [ %1622, %1614 ]
  %1637 = phi <4 x i32> [ %1604, %1587 ], [ %1620, %1614 ]
  %1638 = phi <4 x i32> [ %1603, %1587 ], [ %1618, %1614 ]
  %1639 = phi <4 x i32> [ %1602, %1587 ], [ %1616, %1614 ]
  %1640 = getelementptr inbounds nuw i16, ptr %1417, i64 %1501
  %1641 = load <4 x i16>, ptr %1640, align 8
  %1642 = bitcast <4 x i16> %1641 to i64
  %1643 = icmp eq i64 %1642, 0
  br i1 %1643, label %1661, label %1644

1644:                                             ; preds = %1631
  %1645 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %32)
  %1646 = add <4 x i32> %1645, %1639
  %1647 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %37)
  %1648 = add <4 x i32> %1647, %1638
  %1649 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %33)
  %1650 = sub <4 x i32> %1637, %1649
  %1651 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %31)
  %1652 = sub <4 x i32> %1636, %1651
  %1653 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %36)
  %1654 = sub <4 x i32> %1635, %1653
  %1655 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %34)
  %1656 = add <4 x i32> %1655, %1634
  %1657 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %30)
  %1658 = add <4 x i32> %1657, %1633
  %1659 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1641, <4 x i16> %35)
  %1660 = add <4 x i32> %1659, %1632
  br label %1661

1661:                                             ; preds = %1644, %1631
  %1662 = phi <4 x i32> [ %1632, %1631 ], [ %1660, %1644 ]
  %1663 = phi <4 x i32> [ %1633, %1631 ], [ %1658, %1644 ]
  %1664 = phi <4 x i32> [ %1634, %1631 ], [ %1656, %1644 ]
  %1665 = phi <4 x i32> [ %1635, %1631 ], [ %1654, %1644 ]
  %1666 = phi <4 x i32> [ %1636, %1631 ], [ %1652, %1644 ]
  %1667 = phi <4 x i32> [ %1637, %1631 ], [ %1650, %1644 ]
  %1668 = phi <4 x i32> [ %1638, %1631 ], [ %1648, %1644 ]
  %1669 = phi <4 x i32> [ %1639, %1631 ], [ %1646, %1644 ]
  %1670 = getelementptr inbounds nuw i16, ptr %1418, i64 %1501
  %1671 = load <4 x i16>, ptr %1670, align 8
  %1672 = bitcast <4 x i16> %1671 to i64
  %1673 = icmp eq i64 %1672, 0
  br i1 %1673, label %1691, label %1674

1674:                                             ; preds = %1661
  %1675 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %33)
  %1676 = add <4 x i32> %1675, %1669
  %1677 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %35)
  %1678 = sub <4 x i32> %1668, %1677
  %1679 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %31)
  %1680 = sub <4 x i32> %1667, %1679
  %1681 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %37)
  %1682 = add <4 x i32> %1681, %1666
  %1683 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %30)
  %1684 = add <4 x i32> %1683, %1665
  %1685 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %36)
  %1686 = add <4 x i32> %1685, %1664
  %1687 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %32)
  %1688 = sub <4 x i32> %1663, %1687
  %1689 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1671, <4 x i16> %34)
  %1690 = sub <4 x i32> %1662, %1689
  br label %1691

1691:                                             ; preds = %1674, %1661
  %1692 = phi <4 x i32> [ %1662, %1661 ], [ %1690, %1674 ]
  %1693 = phi <4 x i32> [ %1663, %1661 ], [ %1688, %1674 ]
  %1694 = phi <4 x i32> [ %1664, %1661 ], [ %1686, %1674 ]
  %1695 = phi <4 x i32> [ %1665, %1661 ], [ %1684, %1674 ]
  %1696 = phi <4 x i32> [ %1666, %1661 ], [ %1682, %1674 ]
  %1697 = phi <4 x i32> [ %1667, %1661 ], [ %1680, %1674 ]
  %1698 = phi <4 x i32> [ %1668, %1661 ], [ %1678, %1674 ]
  %1699 = phi <4 x i32> [ %1669, %1661 ], [ %1676, %1674 ]
  %1700 = getelementptr inbounds nuw i16, ptr %1419, i64 %1501
  %1701 = load <4 x i16>, ptr %1700, align 8
  %1702 = bitcast <4 x i16> %1701 to i64
  %1703 = icmp eq i64 %1702, 0
  br i1 %1703, label %1721, label %1704

1704:                                             ; preds = %1691
  %1705 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %34)
  %1706 = add <4 x i32> %1705, %1699
  %1707 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %32)
  %1708 = sub <4 x i32> %1698, %1707
  %1709 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %36)
  %1710 = sub <4 x i32> %1697, %1709
  %1711 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %30)
  %1712 = add <4 x i32> %1711, %1696
  %1713 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %37)
  %1714 = sub <4 x i32> %1695, %1713
  %1715 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %31)
  %1716 = sub <4 x i32> %1694, %1715
  %1717 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %35)
  %1718 = add <4 x i32> %1717, %1693
  %1719 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1701, <4 x i16> %33)
  %1720 = add <4 x i32> %1719, %1692
  br label %1721

1721:                                             ; preds = %1704, %1691
  %1722 = phi <4 x i32> [ %1692, %1691 ], [ %1720, %1704 ]
  %1723 = phi <4 x i32> [ %1693, %1691 ], [ %1718, %1704 ]
  %1724 = phi <4 x i32> [ %1694, %1691 ], [ %1716, %1704 ]
  %1725 = phi <4 x i32> [ %1695, %1691 ], [ %1714, %1704 ]
  %1726 = phi <4 x i32> [ %1696, %1691 ], [ %1712, %1704 ]
  %1727 = phi <4 x i32> [ %1697, %1691 ], [ %1710, %1704 ]
  %1728 = phi <4 x i32> [ %1698, %1691 ], [ %1708, %1704 ]
  %1729 = phi <4 x i32> [ %1699, %1691 ], [ %1706, %1704 ]
  %1730 = getelementptr inbounds nuw i16, ptr %1420, i64 %1501
  %1731 = load <4 x i16>, ptr %1730, align 8
  %1732 = bitcast <4 x i16> %1731 to i64
  %1733 = icmp eq i64 %1732, 0
  br i1 %1733, label %1751, label %1734

1734:                                             ; preds = %1721
  %1735 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %35)
  %1736 = add <4 x i32> %1735, %1729
  %1737 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %30)
  %1738 = sub <4 x i32> %1728, %1737
  %1739 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %34)
  %1740 = add <4 x i32> %1739, %1727
  %1741 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %36)
  %1742 = add <4 x i32> %1741, %1726
  %1743 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %31)
  %1744 = sub <4 x i32> %1725, %1743
  %1745 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %33)
  %1746 = add <4 x i32> %1745, %1724
  %1747 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %37)
  %1748 = add <4 x i32> %1747, %1723
  %1749 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1731, <4 x i16> %32)
  %1750 = sub <4 x i32> %1722, %1749
  br label %1751

1751:                                             ; preds = %1734, %1721
  %1752 = phi <4 x i32> [ %1722, %1721 ], [ %1750, %1734 ]
  %1753 = phi <4 x i32> [ %1723, %1721 ], [ %1748, %1734 ]
  %1754 = phi <4 x i32> [ %1724, %1721 ], [ %1746, %1734 ]
  %1755 = phi <4 x i32> [ %1725, %1721 ], [ %1744, %1734 ]
  %1756 = phi <4 x i32> [ %1726, %1721 ], [ %1742, %1734 ]
  %1757 = phi <4 x i32> [ %1727, %1721 ], [ %1740, %1734 ]
  %1758 = phi <4 x i32> [ %1728, %1721 ], [ %1738, %1734 ]
  %1759 = phi <4 x i32> [ %1729, %1721 ], [ %1736, %1734 ]
  %1760 = getelementptr inbounds nuw i16, ptr %1421, i64 %1501
  %1761 = load <4 x i16>, ptr %1760, align 8
  %1762 = bitcast <4 x i16> %1761 to i64
  %1763 = icmp eq i64 %1762, 0
  br i1 %1763, label %1781, label %1764

1764:                                             ; preds = %1751
  %1765 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %36)
  %1766 = add <4 x i32> %1765, %1759
  %1767 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %33)
  %1768 = sub <4 x i32> %1758, %1767
  %1769 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %30)
  %1770 = add <4 x i32> %1769, %1757
  %1771 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %32)
  %1772 = sub <4 x i32> %1756, %1771
  %1773 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %35)
  %1774 = add <4 x i32> %1773, %1755
  %1775 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %37)
  %1776 = add <4 x i32> %1775, %1754
  %1777 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %34)
  %1778 = sub <4 x i32> %1753, %1777
  %1779 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1761, <4 x i16> %31)
  %1780 = add <4 x i32> %1779, %1752
  br label %1781

1781:                                             ; preds = %1764, %1751
  %1782 = phi <4 x i32> [ %1752, %1751 ], [ %1780, %1764 ]
  %1783 = phi <4 x i32> [ %1753, %1751 ], [ %1778, %1764 ]
  %1784 = phi <4 x i32> [ %1754, %1751 ], [ %1776, %1764 ]
  %1785 = phi <4 x i32> [ %1755, %1751 ], [ %1774, %1764 ]
  %1786 = phi <4 x i32> [ %1756, %1751 ], [ %1772, %1764 ]
  %1787 = phi <4 x i32> [ %1757, %1751 ], [ %1770, %1764 ]
  %1788 = phi <4 x i32> [ %1758, %1751 ], [ %1768, %1764 ]
  %1789 = phi <4 x i32> [ %1759, %1751 ], [ %1766, %1764 ]
  %1790 = getelementptr inbounds nuw i16, ptr %1422, i64 %1501
  %1791 = load <4 x i16>, ptr %1790, align 8
  %1792 = bitcast <4 x i16> %1791 to i64
  %1793 = icmp eq i64 %1792, 0
  br i1 %1793, label %1811, label %1794

1794:                                             ; preds = %1781
  %1795 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %37)
  %1796 = add <4 x i32> %1795, %1789
  %1797 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %36)
  %1798 = sub <4 x i32> %1788, %1797
  %1799 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %35)
  %1800 = add <4 x i32> %1799, %1787
  %1801 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %34)
  %1802 = sub <4 x i32> %1786, %1801
  %1803 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %33)
  %1804 = add <4 x i32> %1803, %1785
  %1805 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %32)
  %1806 = sub <4 x i32> %1784, %1805
  %1807 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %31)
  %1808 = add <4 x i32> %1807, %1783
  %1809 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1791, <4 x i16> %30)
  %1810 = sub <4 x i32> %1782, %1809
  br label %1811

1811:                                             ; preds = %1794, %1781
  %1812 = phi <4 x i32> [ %1782, %1781 ], [ %1810, %1794 ]
  %1813 = phi <4 x i32> [ %1783, %1781 ], [ %1808, %1794 ]
  %1814 = phi <4 x i32> [ %1784, %1781 ], [ %1806, %1794 ]
  %1815 = phi <4 x i32> [ %1785, %1781 ], [ %1804, %1794 ]
  %1816 = phi <4 x i32> [ %1786, %1781 ], [ %1802, %1794 ]
  %1817 = phi <4 x i32> [ %1787, %1781 ], [ %1800, %1794 ]
  %1818 = phi <4 x i32> [ %1788, %1781 ], [ %1798, %1794 ]
  %1819 = phi <4 x i32> [ %1789, %1781 ], [ %1796, %1794 ]
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #10
  %1820 = add <4 x i32> %1819, %1592
  store <4 x i32> %1820, ptr %4, align 16, !tbaa !10
  %1821 = sub <4 x i32> %1599, %1812
  store <4 x i32> %1821, ptr %1484, align 16, !tbaa !10
  %1822 = add <4 x i32> %1818, %1594
  store <4 x i32> %1822, ptr %1485, align 16, !tbaa !10
  %1823 = sub <4 x i32> %1597, %1813
  store <4 x i32> %1823, ptr %1486, align 16, !tbaa !10
  %1824 = add <4 x i32> %1817, %1596
  store <4 x i32> %1824, ptr %1487, align 16, !tbaa !10
  %1825 = sub <4 x i32> %1595, %1814
  store <4 x i32> %1825, ptr %1488, align 16, !tbaa !10
  %1826 = add <4 x i32> %1816, %1598
  store <4 x i32> %1826, ptr %1489, align 16, !tbaa !10
  %1827 = sub <4 x i32> %1593, %1815
  store <4 x i32> %1827, ptr %1490, align 16, !tbaa !10
  %1828 = add <4 x i32> %1815, %1593
  store <4 x i32> %1828, ptr %1491, align 16, !tbaa !10
  %1829 = sub <4 x i32> %1598, %1816
  store <4 x i32> %1829, ptr %1492, align 16, !tbaa !10
  %1830 = add <4 x i32> %1814, %1595
  store <4 x i32> %1830, ptr %1493, align 16, !tbaa !10
  %1831 = sub <4 x i32> %1596, %1817
  store <4 x i32> %1831, ptr %1494, align 16, !tbaa !10
  %1832 = add <4 x i32> %1813, %1597
  store <4 x i32> %1832, ptr %1495, align 16, !tbaa !10
  %1833 = sub <4 x i32> %1594, %1818
  store <4 x i32> %1833, ptr %1496, align 16, !tbaa !10
  %1834 = add <4 x i32> %1812, %1599
  store <4 x i32> %1834, ptr %1497, align 16, !tbaa !10
  %1835 = sub <4 x i32> %1592, %1819
  store <4 x i32> %1835, ptr %1498, align 16, !tbaa !10
  call void @llvm.lifetime.start.p0(ptr nonnull %5) #10
  %1836 = getelementptr inbounds nuw i16, ptr %1423, i64 %1501
  %1837 = load <4 x i16>, ptr %1836, align 8
  %1838 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %48)
  store <4 x i32> %1838, ptr %5, align 16, !tbaa !10
  %1839 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %49)
  store <4 x i32> %1839, ptr %1424, align 16, !tbaa !10
  %1840 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %51)
  store <4 x i32> %1840, ptr %1425, align 16, !tbaa !10
  %1841 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %53)
  store <4 x i32> %1841, ptr %1426, align 16, !tbaa !10
  %1842 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %55)
  store <4 x i32> %1842, ptr %1427, align 16, !tbaa !10
  %1843 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %57)
  store <4 x i32> %1843, ptr %1428, align 16, !tbaa !10
  %1844 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %59)
  store <4 x i32> %1844, ptr %1429, align 16, !tbaa !10
  %1845 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %61)
  store <4 x i32> %1845, ptr %1430, align 16, !tbaa !10
  %1846 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %63)
  store <4 x i32> %1846, ptr %1431, align 16, !tbaa !10
  %1847 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %65)
  store <4 x i32> %1847, ptr %1432, align 16, !tbaa !10
  %1848 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %67)
  store <4 x i32> %1848, ptr %1433, align 16, !tbaa !10
  %1849 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %69)
  store <4 x i32> %1849, ptr %1434, align 16, !tbaa !10
  %1850 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %71)
  store <4 x i32> %1850, ptr %1435, align 16, !tbaa !10
  %1851 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %73)
  store <4 x i32> %1851, ptr %1436, align 16, !tbaa !10
  %1852 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %75)
  store <4 x i32> %1852, ptr %1437, align 16, !tbaa !10
  %1853 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1837, <4 x i16> %77)
  store <4 x i32> %1853, ptr %1438, align 16, !tbaa !10
  %1854 = getelementptr inbounds nuw i16, ptr %1439, i64 %1501
  %1855 = load <4 x i16>, ptr %1854, align 8
  %1856 = bitcast <4 x i16> %1855 to i64
  %1857 = icmp eq i64 %1856, 0
  br i1 %1857, label %1891, label %1858

1858:                                             ; preds = %1811
  %1859 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %49)
  %1860 = add <4 x i32> %1859, %1838
  store <4 x i32> %1860, ptr %5, align 16, !tbaa !10
  %1861 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %55)
  %1862 = add <4 x i32> %1861, %1839
  store <4 x i32> %1862, ptr %1424, align 16, !tbaa !10
  %1863 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %61)
  %1864 = add <4 x i32> %1863, %1840
  store <4 x i32> %1864, ptr %1425, align 16, !tbaa !10
  %1865 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %67)
  %1866 = add <4 x i32> %1865, %1841
  store <4 x i32> %1866, ptr %1426, align 16, !tbaa !10
  %1867 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %73)
  %1868 = add <4 x i32> %1867, %1842
  store <4 x i32> %1868, ptr %1427, align 16, !tbaa !10
  %1869 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %77)
  %1870 = sub <4 x i32> %1843, %1869
  store <4 x i32> %1870, ptr %1428, align 16, !tbaa !10
  %1871 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %71)
  %1872 = sub <4 x i32> %1844, %1871
  store <4 x i32> %1872, ptr %1429, align 16, !tbaa !10
  %1873 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %65)
  %1874 = sub <4 x i32> %1845, %1873
  store <4 x i32> %1874, ptr %1430, align 16, !tbaa !10
  %1875 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %59)
  %1876 = sub <4 x i32> %1846, %1875
  store <4 x i32> %1876, ptr %1431, align 16, !tbaa !10
  %1877 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %53)
  %1878 = sub <4 x i32> %1847, %1877
  store <4 x i32> %1878, ptr %1432, align 16, !tbaa !10
  %1879 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %48)
  %1880 = sub <4 x i32> %1848, %1879
  store <4 x i32> %1880, ptr %1433, align 16, !tbaa !10
  %1881 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %51)
  %1882 = sub <4 x i32> %1849, %1881
  store <4 x i32> %1882, ptr %1434, align 16, !tbaa !10
  %1883 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %57)
  %1884 = sub <4 x i32> %1850, %1883
  store <4 x i32> %1884, ptr %1435, align 16, !tbaa !10
  %1885 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %63)
  %1886 = sub <4 x i32> %1851, %1885
  store <4 x i32> %1886, ptr %1436, align 16, !tbaa !10
  %1887 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %69)
  %1888 = sub <4 x i32> %1852, %1887
  store <4 x i32> %1888, ptr %1437, align 16, !tbaa !10
  %1889 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1855, <4 x i16> %75)
  %1890 = sub <4 x i32> %1853, %1889
  store <4 x i32> %1890, ptr %1438, align 16, !tbaa !10
  br label %1891

1891:                                             ; preds = %1858, %1811
  %1892 = phi <4 x i32> [ %1890, %1858 ], [ %1853, %1811 ]
  %1893 = phi <4 x i32> [ %1888, %1858 ], [ %1852, %1811 ]
  %1894 = phi <4 x i32> [ %1886, %1858 ], [ %1851, %1811 ]
  %1895 = phi <4 x i32> [ %1884, %1858 ], [ %1850, %1811 ]
  %1896 = phi <4 x i32> [ %1882, %1858 ], [ %1849, %1811 ]
  %1897 = phi <4 x i32> [ %1880, %1858 ], [ %1848, %1811 ]
  %1898 = phi <4 x i32> [ %1878, %1858 ], [ %1847, %1811 ]
  %1899 = phi <4 x i32> [ %1876, %1858 ], [ %1846, %1811 ]
  %1900 = phi <4 x i32> [ %1874, %1858 ], [ %1845, %1811 ]
  %1901 = phi <4 x i32> [ %1872, %1858 ], [ %1844, %1811 ]
  %1902 = phi <4 x i32> [ %1870, %1858 ], [ %1843, %1811 ]
  %1903 = phi <4 x i32> [ %1868, %1858 ], [ %1842, %1811 ]
  %1904 = phi <4 x i32> [ %1866, %1858 ], [ %1841, %1811 ]
  %1905 = phi <4 x i32> [ %1864, %1858 ], [ %1840, %1811 ]
  %1906 = phi <4 x i32> [ %1862, %1858 ], [ %1839, %1811 ]
  %1907 = phi <4 x i32> [ %1860, %1858 ], [ %1838, %1811 ]
  %1908 = getelementptr inbounds nuw i16, ptr %1440, i64 %1501
  %1909 = load <4 x i16>, ptr %1908, align 8
  %1910 = bitcast <4 x i16> %1909 to i64
  %1911 = icmp eq i64 %1910, 0
  br i1 %1911, label %1945, label %1912

1912:                                             ; preds = %1891
  %1913 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %51)
  %1914 = add <4 x i32> %1913, %1907
  store <4 x i32> %1914, ptr %5, align 16, !tbaa !10
  %1915 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %61)
  %1916 = add <4 x i32> %1915, %1906
  store <4 x i32> %1916, ptr %1424, align 16, !tbaa !10
  %1917 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %71)
  %1918 = add <4 x i32> %1917, %1905
  store <4 x i32> %1918, ptr %1425, align 16, !tbaa !10
  %1919 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %75)
  %1920 = sub <4 x i32> %1904, %1919
  store <4 x i32> %1920, ptr %1426, align 16, !tbaa !10
  %1921 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %65)
  %1922 = sub <4 x i32> %1903, %1921
  store <4 x i32> %1922, ptr %1427, align 16, !tbaa !10
  %1923 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %55)
  %1924 = sub <4 x i32> %1902, %1923
  store <4 x i32> %1924, ptr %1428, align 16, !tbaa !10
  %1925 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %48)
  %1926 = sub <4 x i32> %1901, %1925
  store <4 x i32> %1926, ptr %1429, align 16, !tbaa !10
  %1927 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %57)
  %1928 = sub <4 x i32> %1900, %1927
  store <4 x i32> %1928, ptr %1430, align 16, !tbaa !10
  %1929 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %67)
  %1930 = sub <4 x i32> %1899, %1929
  store <4 x i32> %1930, ptr %1431, align 16, !tbaa !10
  %1931 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %77)
  %1932 = sub <4 x i32> %1898, %1931
  store <4 x i32> %1932, ptr %1432, align 16, !tbaa !10
  %1933 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %69)
  %1934 = add <4 x i32> %1933, %1897
  store <4 x i32> %1934, ptr %1433, align 16, !tbaa !10
  %1935 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %59)
  %1936 = add <4 x i32> %1935, %1896
  store <4 x i32> %1936, ptr %1434, align 16, !tbaa !10
  %1937 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %49)
  %1938 = add <4 x i32> %1937, %1895
  store <4 x i32> %1938, ptr %1435, align 16, !tbaa !10
  %1939 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %53)
  %1940 = add <4 x i32> %1939, %1894
  store <4 x i32> %1940, ptr %1436, align 16, !tbaa !10
  %1941 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %63)
  %1942 = add <4 x i32> %1941, %1893
  store <4 x i32> %1942, ptr %1437, align 16, !tbaa !10
  %1943 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1909, <4 x i16> %73)
  %1944 = add <4 x i32> %1943, %1892
  store <4 x i32> %1944, ptr %1438, align 16, !tbaa !10
  br label %1945

1945:                                             ; preds = %1912, %1891
  %1946 = phi <4 x i32> [ %1944, %1912 ], [ %1892, %1891 ]
  %1947 = phi <4 x i32> [ %1942, %1912 ], [ %1893, %1891 ]
  %1948 = phi <4 x i32> [ %1940, %1912 ], [ %1894, %1891 ]
  %1949 = phi <4 x i32> [ %1938, %1912 ], [ %1895, %1891 ]
  %1950 = phi <4 x i32> [ %1936, %1912 ], [ %1896, %1891 ]
  %1951 = phi <4 x i32> [ %1934, %1912 ], [ %1897, %1891 ]
  %1952 = phi <4 x i32> [ %1932, %1912 ], [ %1898, %1891 ]
  %1953 = phi <4 x i32> [ %1930, %1912 ], [ %1899, %1891 ]
  %1954 = phi <4 x i32> [ %1928, %1912 ], [ %1900, %1891 ]
  %1955 = phi <4 x i32> [ %1926, %1912 ], [ %1901, %1891 ]
  %1956 = phi <4 x i32> [ %1924, %1912 ], [ %1902, %1891 ]
  %1957 = phi <4 x i32> [ %1922, %1912 ], [ %1903, %1891 ]
  %1958 = phi <4 x i32> [ %1920, %1912 ], [ %1904, %1891 ]
  %1959 = phi <4 x i32> [ %1918, %1912 ], [ %1905, %1891 ]
  %1960 = phi <4 x i32> [ %1916, %1912 ], [ %1906, %1891 ]
  %1961 = phi <4 x i32> [ %1914, %1912 ], [ %1907, %1891 ]
  %1962 = getelementptr inbounds nuw i16, ptr %1441, i64 %1501
  %1963 = load <4 x i16>, ptr %1962, align 8
  %1964 = bitcast <4 x i16> %1963 to i64
  %1965 = icmp eq i64 %1964, 0
  br i1 %1965, label %1999, label %1966

1966:                                             ; preds = %1945
  %1967 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %53)
  %1968 = add <4 x i32> %1967, %1961
  store <4 x i32> %1968, ptr %5, align 16, !tbaa !10
  %1969 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %67)
  %1970 = add <4 x i32> %1969, %1960
  store <4 x i32> %1970, ptr %1424, align 16, !tbaa !10
  %1971 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %75)
  %1972 = sub <4 x i32> %1959, %1971
  store <4 x i32> %1972, ptr %1425, align 16, !tbaa !10
  %1973 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %61)
  %1974 = sub <4 x i32> %1958, %1973
  store <4 x i32> %1974, ptr %1426, align 16, !tbaa !10
  %1975 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %48)
  %1976 = sub <4 x i32> %1957, %1975
  store <4 x i32> %1976, ptr %1427, align 16, !tbaa !10
  %1977 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %59)
  %1978 = sub <4 x i32> %1956, %1977
  store <4 x i32> %1978, ptr %1428, align 16, !tbaa !10
  %1979 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %73)
  %1980 = sub <4 x i32> %1955, %1979
  store <4 x i32> %1980, ptr %1429, align 16, !tbaa !10
  %1981 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %69)
  %1982 = add <4 x i32> %1981, %1954
  store <4 x i32> %1982, ptr %1430, align 16, !tbaa !10
  %1983 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %55)
  %1984 = add <4 x i32> %1983, %1953
  store <4 x i32> %1984, ptr %1431, align 16, !tbaa !10
  %1985 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %51)
  %1986 = add <4 x i32> %1985, %1952
  store <4 x i32> %1986, ptr %1432, align 16, !tbaa !10
  %1987 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %65)
  %1988 = add <4 x i32> %1987, %1951
  store <4 x i32> %1988, ptr %1433, align 16, !tbaa !10
  %1989 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %77)
  %1990 = sub <4 x i32> %1950, %1989
  store <4 x i32> %1990, ptr %1434, align 16, !tbaa !10
  %1991 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %63)
  %1992 = sub <4 x i32> %1949, %1991
  store <4 x i32> %1992, ptr %1435, align 16, !tbaa !10
  %1993 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %49)
  %1994 = sub <4 x i32> %1948, %1993
  store <4 x i32> %1994, ptr %1436, align 16, !tbaa !10
  %1995 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %57)
  %1996 = sub <4 x i32> %1947, %1995
  store <4 x i32> %1996, ptr %1437, align 16, !tbaa !10
  %1997 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %1963, <4 x i16> %71)
  %1998 = sub <4 x i32> %1946, %1997
  store <4 x i32> %1998, ptr %1438, align 16, !tbaa !10
  br label %1999

1999:                                             ; preds = %1966, %1945
  %2000 = phi <4 x i32> [ %1998, %1966 ], [ %1946, %1945 ]
  %2001 = phi <4 x i32> [ %1996, %1966 ], [ %1947, %1945 ]
  %2002 = phi <4 x i32> [ %1994, %1966 ], [ %1948, %1945 ]
  %2003 = phi <4 x i32> [ %1992, %1966 ], [ %1949, %1945 ]
  %2004 = phi <4 x i32> [ %1990, %1966 ], [ %1950, %1945 ]
  %2005 = phi <4 x i32> [ %1988, %1966 ], [ %1951, %1945 ]
  %2006 = phi <4 x i32> [ %1986, %1966 ], [ %1952, %1945 ]
  %2007 = phi <4 x i32> [ %1984, %1966 ], [ %1953, %1945 ]
  %2008 = phi <4 x i32> [ %1982, %1966 ], [ %1954, %1945 ]
  %2009 = phi <4 x i32> [ %1980, %1966 ], [ %1955, %1945 ]
  %2010 = phi <4 x i32> [ %1978, %1966 ], [ %1956, %1945 ]
  %2011 = phi <4 x i32> [ %1976, %1966 ], [ %1957, %1945 ]
  %2012 = phi <4 x i32> [ %1974, %1966 ], [ %1958, %1945 ]
  %2013 = phi <4 x i32> [ %1972, %1966 ], [ %1959, %1945 ]
  %2014 = phi <4 x i32> [ %1970, %1966 ], [ %1960, %1945 ]
  %2015 = phi <4 x i32> [ %1968, %1966 ], [ %1961, %1945 ]
  %2016 = getelementptr inbounds nuw i16, ptr %1442, i64 %1501
  %2017 = load <4 x i16>, ptr %2016, align 8
  %2018 = bitcast <4 x i16> %2017 to i64
  %2019 = icmp eq i64 %2018, 0
  br i1 %2019, label %2053, label %2020

2020:                                             ; preds = %1999
  %2021 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %55)
  %2022 = add <4 x i32> %2021, %2015
  store <4 x i32> %2022, ptr %5, align 16, !tbaa !10
  %2023 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %73)
  %2024 = add <4 x i32> %2023, %2014
  store <4 x i32> %2024, ptr %1424, align 16, !tbaa !10
  %2025 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %65)
  %2026 = sub <4 x i32> %2013, %2025
  store <4 x i32> %2026, ptr %1425, align 16, !tbaa !10
  %2027 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %48)
  %2028 = sub <4 x i32> %2012, %2027
  store <4 x i32> %2028, ptr %1426, align 16, !tbaa !10
  %2029 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %63)
  %2030 = sub <4 x i32> %2011, %2029
  store <4 x i32> %2030, ptr %1427, align 16, !tbaa !10
  %2031 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %75)
  %2032 = add <4 x i32> %2031, %2010
  store <4 x i32> %2032, ptr %1428, align 16, !tbaa !10
  %2033 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %57)
  %2034 = add <4 x i32> %2033, %2009
  store <4 x i32> %2034, ptr %1429, align 16, !tbaa !10
  %2035 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %53)
  %2036 = add <4 x i32> %2035, %2008
  store <4 x i32> %2036, ptr %1430, align 16, !tbaa !10
  %2037 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %71)
  %2038 = add <4 x i32> %2037, %2007
  store <4 x i32> %2038, ptr %1431, align 16, !tbaa !10
  %2039 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %67)
  %2040 = sub <4 x i32> %2006, %2039
  store <4 x i32> %2040, ptr %1432, align 16, !tbaa !10
  %2041 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %49)
  %2042 = sub <4 x i32> %2005, %2041
  store <4 x i32> %2042, ptr %1433, align 16, !tbaa !10
  %2043 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %61)
  %2044 = sub <4 x i32> %2004, %2043
  store <4 x i32> %2044, ptr %1434, align 16, !tbaa !10
  %2045 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %77)
  %2046 = add <4 x i32> %2045, %2003
  store <4 x i32> %2046, ptr %1435, align 16, !tbaa !10
  %2047 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %59)
  %2048 = add <4 x i32> %2047, %2002
  store <4 x i32> %2048, ptr %1436, align 16, !tbaa !10
  %2049 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %51)
  %2050 = add <4 x i32> %2049, %2001
  store <4 x i32> %2050, ptr %1437, align 16, !tbaa !10
  %2051 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2017, <4 x i16> %69)
  %2052 = add <4 x i32> %2051, %2000
  store <4 x i32> %2052, ptr %1438, align 16, !tbaa !10
  br label %2053

2053:                                             ; preds = %2020, %1999
  %2054 = phi <4 x i32> [ %2052, %2020 ], [ %2000, %1999 ]
  %2055 = phi <4 x i32> [ %2050, %2020 ], [ %2001, %1999 ]
  %2056 = phi <4 x i32> [ %2048, %2020 ], [ %2002, %1999 ]
  %2057 = phi <4 x i32> [ %2046, %2020 ], [ %2003, %1999 ]
  %2058 = phi <4 x i32> [ %2044, %2020 ], [ %2004, %1999 ]
  %2059 = phi <4 x i32> [ %2042, %2020 ], [ %2005, %1999 ]
  %2060 = phi <4 x i32> [ %2040, %2020 ], [ %2006, %1999 ]
  %2061 = phi <4 x i32> [ %2038, %2020 ], [ %2007, %1999 ]
  %2062 = phi <4 x i32> [ %2036, %2020 ], [ %2008, %1999 ]
  %2063 = phi <4 x i32> [ %2034, %2020 ], [ %2009, %1999 ]
  %2064 = phi <4 x i32> [ %2032, %2020 ], [ %2010, %1999 ]
  %2065 = phi <4 x i32> [ %2030, %2020 ], [ %2011, %1999 ]
  %2066 = phi <4 x i32> [ %2028, %2020 ], [ %2012, %1999 ]
  %2067 = phi <4 x i32> [ %2026, %2020 ], [ %2013, %1999 ]
  %2068 = phi <4 x i32> [ %2024, %2020 ], [ %2014, %1999 ]
  %2069 = phi <4 x i32> [ %2022, %2020 ], [ %2015, %1999 ]
  %2070 = getelementptr inbounds nuw i16, ptr %1443, i64 %1501
  %2071 = load <4 x i16>, ptr %2070, align 8
  %2072 = bitcast <4 x i16> %2071 to i64
  %2073 = icmp eq i64 %2072, 0
  br i1 %2073, label %2107, label %2074

2074:                                             ; preds = %2053
  %2075 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %57)
  %2076 = add <4 x i32> %2075, %2069
  store <4 x i32> %2076, ptr %5, align 16, !tbaa !10
  %2077 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %77)
  %2078 = sub <4 x i32> %2068, %2077
  store <4 x i32> %2078, ptr %1424, align 16, !tbaa !10
  %2079 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %55)
  %2080 = sub <4 x i32> %2067, %2079
  store <4 x i32> %2080, ptr %1425, align 16, !tbaa !10
  %2081 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %59)
  %2082 = sub <4 x i32> %2066, %2081
  store <4 x i32> %2082, ptr %1426, align 16, !tbaa !10
  %2083 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %75)
  %2084 = add <4 x i32> %2083, %2065
  store <4 x i32> %2084, ptr %1427, align 16, !tbaa !10
  %2085 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %53)
  %2086 = add <4 x i32> %2085, %2064
  store <4 x i32> %2086, ptr %1428, align 16, !tbaa !10
  %2087 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %61)
  %2088 = add <4 x i32> %2087, %2063
  store <4 x i32> %2088, ptr %1429, align 16, !tbaa !10
  %2089 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %73)
  %2090 = sub <4 x i32> %2062, %2089
  store <4 x i32> %2090, ptr %1430, align 16, !tbaa !10
  %2091 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %51)
  %2092 = sub <4 x i32> %2061, %2091
  store <4 x i32> %2092, ptr %1431, align 16, !tbaa !10
  %2093 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %63)
  %2094 = sub <4 x i32> %2060, %2093
  store <4 x i32> %2094, ptr %1432, align 16, !tbaa !10
  %2095 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %71)
  %2096 = add <4 x i32> %2095, %2059
  store <4 x i32> %2096, ptr %1433, align 16, !tbaa !10
  %2097 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %49)
  %2098 = add <4 x i32> %2097, %2058
  store <4 x i32> %2098, ptr %1434, align 16, !tbaa !10
  %2099 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %65)
  %2100 = add <4 x i32> %2099, %2057
  store <4 x i32> %2100, ptr %1435, align 16, !tbaa !10
  %2101 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %69)
  %2102 = sub <4 x i32> %2056, %2101
  store <4 x i32> %2102, ptr %1436, align 16, !tbaa !10
  %2103 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %48)
  %2104 = sub <4 x i32> %2055, %2103
  store <4 x i32> %2104, ptr %1437, align 16, !tbaa !10
  %2105 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2071, <4 x i16> %67)
  %2106 = sub <4 x i32> %2054, %2105
  store <4 x i32> %2106, ptr %1438, align 16, !tbaa !10
  br label %2107

2107:                                             ; preds = %2074, %2053
  %2108 = phi <4 x i32> [ %2106, %2074 ], [ %2054, %2053 ]
  %2109 = phi <4 x i32> [ %2104, %2074 ], [ %2055, %2053 ]
  %2110 = phi <4 x i32> [ %2102, %2074 ], [ %2056, %2053 ]
  %2111 = phi <4 x i32> [ %2100, %2074 ], [ %2057, %2053 ]
  %2112 = phi <4 x i32> [ %2098, %2074 ], [ %2058, %2053 ]
  %2113 = phi <4 x i32> [ %2096, %2074 ], [ %2059, %2053 ]
  %2114 = phi <4 x i32> [ %2094, %2074 ], [ %2060, %2053 ]
  %2115 = phi <4 x i32> [ %2092, %2074 ], [ %2061, %2053 ]
  %2116 = phi <4 x i32> [ %2090, %2074 ], [ %2062, %2053 ]
  %2117 = phi <4 x i32> [ %2088, %2074 ], [ %2063, %2053 ]
  %2118 = phi <4 x i32> [ %2086, %2074 ], [ %2064, %2053 ]
  %2119 = phi <4 x i32> [ %2084, %2074 ], [ %2065, %2053 ]
  %2120 = phi <4 x i32> [ %2082, %2074 ], [ %2066, %2053 ]
  %2121 = phi <4 x i32> [ %2080, %2074 ], [ %2067, %2053 ]
  %2122 = phi <4 x i32> [ %2078, %2074 ], [ %2068, %2053 ]
  %2123 = phi <4 x i32> [ %2076, %2074 ], [ %2069, %2053 ]
  %2124 = getelementptr inbounds nuw i16, ptr %1444, i64 %1501
  %2125 = load <4 x i16>, ptr %2124, align 8
  %2126 = bitcast <4 x i16> %2125 to i64
  %2127 = icmp eq i64 %2126, 0
  br i1 %2127, label %2161, label %2128

2128:                                             ; preds = %2107
  %2129 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %59)
  %2130 = add <4 x i32> %2129, %2123
  store <4 x i32> %2130, ptr %5, align 16, !tbaa !10
  %2131 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %71)
  %2132 = sub <4 x i32> %2122, %2131
  store <4 x i32> %2132, ptr %1424, align 16, !tbaa !10
  %2133 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %48)
  %2134 = sub <4 x i32> %2121, %2133
  store <4 x i32> %2134, ptr %1425, align 16, !tbaa !10
  %2135 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %73)
  %2136 = sub <4 x i32> %2120, %2135
  store <4 x i32> %2136, ptr %1426, align 16, !tbaa !10
  %2137 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %57)
  %2138 = add <4 x i32> %2137, %2119
  store <4 x i32> %2138, ptr %1427, align 16, !tbaa !10
  %2139 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %61)
  %2140 = add <4 x i32> %2139, %2118
  store <4 x i32> %2140, ptr %1428, align 16, !tbaa !10
  %2141 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %69)
  %2142 = sub <4 x i32> %2117, %2141
  store <4 x i32> %2142, ptr %1429, align 16, !tbaa !10
  %2143 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %49)
  %2144 = sub <4 x i32> %2116, %2143
  store <4 x i32> %2144, ptr %1430, align 16, !tbaa !10
  %2145 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %75)
  %2146 = sub <4 x i32> %2115, %2145
  store <4 x i32> %2146, ptr %1431, align 16, !tbaa !10
  %2147 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %55)
  %2148 = add <4 x i32> %2147, %2114
  store <4 x i32> %2148, ptr %1432, align 16, !tbaa !10
  %2149 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %63)
  %2150 = add <4 x i32> %2149, %2113
  store <4 x i32> %2150, ptr %1433, align 16, !tbaa !10
  %2151 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %67)
  %2152 = sub <4 x i32> %2112, %2151
  store <4 x i32> %2152, ptr %1434, align 16, !tbaa !10
  %2153 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %51)
  %2154 = sub <4 x i32> %2111, %2153
  store <4 x i32> %2154, ptr %1435, align 16, !tbaa !10
  %2155 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %77)
  %2156 = sub <4 x i32> %2110, %2155
  store <4 x i32> %2156, ptr %1436, align 16, !tbaa !10
  %2157 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %53)
  %2158 = add <4 x i32> %2157, %2109
  store <4 x i32> %2158, ptr %1437, align 16, !tbaa !10
  %2159 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2125, <4 x i16> %65)
  %2160 = add <4 x i32> %2159, %2108
  store <4 x i32> %2160, ptr %1438, align 16, !tbaa !10
  br label %2161

2161:                                             ; preds = %2128, %2107
  %2162 = phi <4 x i32> [ %2160, %2128 ], [ %2108, %2107 ]
  %2163 = phi <4 x i32> [ %2158, %2128 ], [ %2109, %2107 ]
  %2164 = phi <4 x i32> [ %2156, %2128 ], [ %2110, %2107 ]
  %2165 = phi <4 x i32> [ %2154, %2128 ], [ %2111, %2107 ]
  %2166 = phi <4 x i32> [ %2152, %2128 ], [ %2112, %2107 ]
  %2167 = phi <4 x i32> [ %2150, %2128 ], [ %2113, %2107 ]
  %2168 = phi <4 x i32> [ %2148, %2128 ], [ %2114, %2107 ]
  %2169 = phi <4 x i32> [ %2146, %2128 ], [ %2115, %2107 ]
  %2170 = phi <4 x i32> [ %2144, %2128 ], [ %2116, %2107 ]
  %2171 = phi <4 x i32> [ %2142, %2128 ], [ %2117, %2107 ]
  %2172 = phi <4 x i32> [ %2140, %2128 ], [ %2118, %2107 ]
  %2173 = phi <4 x i32> [ %2138, %2128 ], [ %2119, %2107 ]
  %2174 = phi <4 x i32> [ %2136, %2128 ], [ %2120, %2107 ]
  %2175 = phi <4 x i32> [ %2134, %2128 ], [ %2121, %2107 ]
  %2176 = phi <4 x i32> [ %2132, %2128 ], [ %2122, %2107 ]
  %2177 = phi <4 x i32> [ %2130, %2128 ], [ %2123, %2107 ]
  %2178 = getelementptr inbounds nuw i16, ptr %1445, i64 %1501
  %2179 = load <4 x i16>, ptr %2178, align 8
  %2180 = bitcast <4 x i16> %2179 to i64
  %2181 = icmp eq i64 %2180, 0
  br i1 %2181, label %2215, label %2182

2182:                                             ; preds = %2161
  %2183 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %61)
  %2184 = add <4 x i32> %2183, %2177
  store <4 x i32> %2184, ptr %5, align 16, !tbaa !10
  %2185 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %65)
  %2186 = sub <4 x i32> %2176, %2185
  store <4 x i32> %2186, ptr %1424, align 16, !tbaa !10
  %2187 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %57)
  %2188 = sub <4 x i32> %2175, %2187
  store <4 x i32> %2188, ptr %1425, align 16, !tbaa !10
  %2189 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %69)
  %2190 = add <4 x i32> %2189, %2174
  store <4 x i32> %2190, ptr %1426, align 16, !tbaa !10
  %2191 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %53)
  %2192 = add <4 x i32> %2191, %2173
  store <4 x i32> %2192, ptr %1427, align 16, !tbaa !10
  %2193 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %73)
  %2194 = sub <4 x i32> %2172, %2193
  store <4 x i32> %2194, ptr %1428, align 16, !tbaa !10
  %2195 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %49)
  %2196 = sub <4 x i32> %2171, %2195
  store <4 x i32> %2196, ptr %1429, align 16, !tbaa !10
  %2197 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %77)
  %2198 = add <4 x i32> %2197, %2170
  store <4 x i32> %2198, ptr %1430, align 16, !tbaa !10
  %2199 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %48)
  %2200 = add <4 x i32> %2199, %2169
  store <4 x i32> %2200, ptr %1431, align 16, !tbaa !10
  %2201 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %75)
  %2202 = add <4 x i32> %2201, %2168
  store <4 x i32> %2202, ptr %1432, align 16, !tbaa !10
  %2203 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %51)
  %2204 = sub <4 x i32> %2167, %2203
  store <4 x i32> %2204, ptr %1433, align 16, !tbaa !10
  %2205 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %71)
  %2206 = sub <4 x i32> %2166, %2205
  store <4 x i32> %2206, ptr %1434, align 16, !tbaa !10
  %2207 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %55)
  %2208 = add <4 x i32> %2207, %2165
  store <4 x i32> %2208, ptr %1435, align 16, !tbaa !10
  %2209 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %67)
  %2210 = add <4 x i32> %2209, %2164
  store <4 x i32> %2210, ptr %1436, align 16, !tbaa !10
  %2211 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %59)
  %2212 = sub <4 x i32> %2163, %2211
  store <4 x i32> %2212, ptr %1437, align 16, !tbaa !10
  %2213 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2179, <4 x i16> %63)
  %2214 = sub <4 x i32> %2162, %2213
  store <4 x i32> %2214, ptr %1438, align 16, !tbaa !10
  br label %2215

2215:                                             ; preds = %2182, %2161
  %2216 = phi <4 x i32> [ %2214, %2182 ], [ %2162, %2161 ]
  %2217 = phi <4 x i32> [ %2212, %2182 ], [ %2163, %2161 ]
  %2218 = phi <4 x i32> [ %2210, %2182 ], [ %2164, %2161 ]
  %2219 = phi <4 x i32> [ %2208, %2182 ], [ %2165, %2161 ]
  %2220 = phi <4 x i32> [ %2206, %2182 ], [ %2166, %2161 ]
  %2221 = phi <4 x i32> [ %2204, %2182 ], [ %2167, %2161 ]
  %2222 = phi <4 x i32> [ %2202, %2182 ], [ %2168, %2161 ]
  %2223 = phi <4 x i32> [ %2200, %2182 ], [ %2169, %2161 ]
  %2224 = phi <4 x i32> [ %2198, %2182 ], [ %2170, %2161 ]
  %2225 = phi <4 x i32> [ %2196, %2182 ], [ %2171, %2161 ]
  %2226 = phi <4 x i32> [ %2194, %2182 ], [ %2172, %2161 ]
  %2227 = phi <4 x i32> [ %2192, %2182 ], [ %2173, %2161 ]
  %2228 = phi <4 x i32> [ %2190, %2182 ], [ %2174, %2161 ]
  %2229 = phi <4 x i32> [ %2188, %2182 ], [ %2175, %2161 ]
  %2230 = phi <4 x i32> [ %2186, %2182 ], [ %2176, %2161 ]
  %2231 = phi <4 x i32> [ %2184, %2182 ], [ %2177, %2161 ]
  %2232 = getelementptr inbounds nuw i16, ptr %1446, i64 %1501
  %2233 = load <4 x i16>, ptr %2232, align 8
  %2234 = bitcast <4 x i16> %2233 to i64
  %2235 = icmp eq i64 %2234, 0
  br i1 %2235, label %2269, label %2236

2236:                                             ; preds = %2215
  %2237 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %63)
  %2238 = add <4 x i32> %2237, %2231
  store <4 x i32> %2238, ptr %5, align 16, !tbaa !10
  %2239 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %59)
  %2240 = sub <4 x i32> %2230, %2239
  store <4 x i32> %2240, ptr %1424, align 16, !tbaa !10
  %2241 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %67)
  %2242 = sub <4 x i32> %2229, %2241
  store <4 x i32> %2242, ptr %1425, align 16, !tbaa !10
  %2243 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %55)
  %2244 = add <4 x i32> %2243, %2228
  store <4 x i32> %2244, ptr %1426, align 16, !tbaa !10
  %2245 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %71)
  %2246 = add <4 x i32> %2245, %2227
  store <4 x i32> %2246, ptr %1427, align 16, !tbaa !10
  %2247 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %51)
  %2248 = sub <4 x i32> %2226, %2247
  store <4 x i32> %2248, ptr %1428, align 16, !tbaa !10
  %2249 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %75)
  %2250 = sub <4 x i32> %2225, %2249
  store <4 x i32> %2250, ptr %1429, align 16, !tbaa !10
  %2251 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %48)
  %2252 = add <4 x i32> %2251, %2224
  store <4 x i32> %2252, ptr %1430, align 16, !tbaa !10
  %2253 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %77)
  %2254 = sub <4 x i32> %2223, %2253
  store <4 x i32> %2254, ptr %1431, align 16, !tbaa !10
  %2255 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %49)
  %2256 = sub <4 x i32> %2222, %2255
  store <4 x i32> %2256, ptr %1432, align 16, !tbaa !10
  %2257 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %73)
  %2258 = add <4 x i32> %2257, %2221
  store <4 x i32> %2258, ptr %1433, align 16, !tbaa !10
  %2259 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %53)
  %2260 = add <4 x i32> %2259, %2220
  store <4 x i32> %2260, ptr %1434, align 16, !tbaa !10
  %2261 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %69)
  %2262 = sub <4 x i32> %2219, %2261
  store <4 x i32> %2262, ptr %1435, align 16, !tbaa !10
  %2263 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %57)
  %2264 = sub <4 x i32> %2218, %2263
  store <4 x i32> %2264, ptr %1436, align 16, !tbaa !10
  %2265 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %65)
  %2266 = add <4 x i32> %2265, %2217
  store <4 x i32> %2266, ptr %1437, align 16, !tbaa !10
  %2267 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2233, <4 x i16> %61)
  %2268 = add <4 x i32> %2267, %2216
  store <4 x i32> %2268, ptr %1438, align 16, !tbaa !10
  br label %2269

2269:                                             ; preds = %2236, %2215
  %2270 = phi <4 x i32> [ %2268, %2236 ], [ %2216, %2215 ]
  %2271 = phi <4 x i32> [ %2266, %2236 ], [ %2217, %2215 ]
  %2272 = phi <4 x i32> [ %2264, %2236 ], [ %2218, %2215 ]
  %2273 = phi <4 x i32> [ %2262, %2236 ], [ %2219, %2215 ]
  %2274 = phi <4 x i32> [ %2260, %2236 ], [ %2220, %2215 ]
  %2275 = phi <4 x i32> [ %2258, %2236 ], [ %2221, %2215 ]
  %2276 = phi <4 x i32> [ %2256, %2236 ], [ %2222, %2215 ]
  %2277 = phi <4 x i32> [ %2254, %2236 ], [ %2223, %2215 ]
  %2278 = phi <4 x i32> [ %2252, %2236 ], [ %2224, %2215 ]
  %2279 = phi <4 x i32> [ %2250, %2236 ], [ %2225, %2215 ]
  %2280 = phi <4 x i32> [ %2248, %2236 ], [ %2226, %2215 ]
  %2281 = phi <4 x i32> [ %2246, %2236 ], [ %2227, %2215 ]
  %2282 = phi <4 x i32> [ %2244, %2236 ], [ %2228, %2215 ]
  %2283 = phi <4 x i32> [ %2242, %2236 ], [ %2229, %2215 ]
  %2284 = phi <4 x i32> [ %2240, %2236 ], [ %2230, %2215 ]
  %2285 = phi <4 x i32> [ %2238, %2236 ], [ %2231, %2215 ]
  %2286 = getelementptr inbounds nuw i16, ptr %1447, i64 %1501
  %2287 = load <4 x i16>, ptr %2286, align 8
  %2288 = bitcast <4 x i16> %2287 to i64
  %2289 = icmp eq i64 %2288, 0
  br i1 %2289, label %2323, label %2290

2290:                                             ; preds = %2269
  %2291 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %65)
  %2292 = add <4 x i32> %2291, %2285
  store <4 x i32> %2292, ptr %5, align 16, !tbaa !10
  %2293 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %53)
  %2294 = sub <4 x i32> %2284, %2293
  store <4 x i32> %2294, ptr %1424, align 16, !tbaa !10
  %2295 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %77)
  %2296 = sub <4 x i32> %2283, %2295
  store <4 x i32> %2296, ptr %1425, align 16, !tbaa !10
  %2297 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %51)
  %2298 = add <4 x i32> %2297, %2282
  store <4 x i32> %2298, ptr %1426, align 16, !tbaa !10
  %2299 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %67)
  %2300 = sub <4 x i32> %2281, %2299
  store <4 x i32> %2300, ptr %1427, align 16, !tbaa !10
  %2301 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %63)
  %2302 = sub <4 x i32> %2280, %2301
  store <4 x i32> %2302, ptr %1428, align 16, !tbaa !10
  %2303 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %55)
  %2304 = add <4 x i32> %2303, %2279
  store <4 x i32> %2304, ptr %1429, align 16, !tbaa !10
  %2305 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %75)
  %2306 = add <4 x i32> %2305, %2278
  store <4 x i32> %2306, ptr %1430, align 16, !tbaa !10
  %2307 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %49)
  %2308 = sub <4 x i32> %2277, %2307
  store <4 x i32> %2308, ptr %1431, align 16, !tbaa !10
  %2309 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %69)
  %2310 = add <4 x i32> %2309, %2276
  store <4 x i32> %2310, ptr %1432, align 16, !tbaa !10
  %2311 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %61)
  %2312 = add <4 x i32> %2311, %2275
  store <4 x i32> %2312, ptr %1433, align 16, !tbaa !10
  %2313 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %57)
  %2314 = sub <4 x i32> %2274, %2313
  store <4 x i32> %2314, ptr %1434, align 16, !tbaa !10
  %2315 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %73)
  %2316 = sub <4 x i32> %2273, %2315
  store <4 x i32> %2316, ptr %1435, align 16, !tbaa !10
  %2317 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %48)
  %2318 = add <4 x i32> %2317, %2272
  store <4 x i32> %2318, ptr %1436, align 16, !tbaa !10
  %2319 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %71)
  %2320 = sub <4 x i32> %2271, %2319
  store <4 x i32> %2320, ptr %1437, align 16, !tbaa !10
  %2321 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2287, <4 x i16> %59)
  %2322 = sub <4 x i32> %2270, %2321
  store <4 x i32> %2322, ptr %1438, align 16, !tbaa !10
  br label %2323

2323:                                             ; preds = %2290, %2269
  %2324 = phi <4 x i32> [ %2322, %2290 ], [ %2270, %2269 ]
  %2325 = phi <4 x i32> [ %2320, %2290 ], [ %2271, %2269 ]
  %2326 = phi <4 x i32> [ %2318, %2290 ], [ %2272, %2269 ]
  %2327 = phi <4 x i32> [ %2316, %2290 ], [ %2273, %2269 ]
  %2328 = phi <4 x i32> [ %2314, %2290 ], [ %2274, %2269 ]
  %2329 = phi <4 x i32> [ %2312, %2290 ], [ %2275, %2269 ]
  %2330 = phi <4 x i32> [ %2310, %2290 ], [ %2276, %2269 ]
  %2331 = phi <4 x i32> [ %2308, %2290 ], [ %2277, %2269 ]
  %2332 = phi <4 x i32> [ %2306, %2290 ], [ %2278, %2269 ]
  %2333 = phi <4 x i32> [ %2304, %2290 ], [ %2279, %2269 ]
  %2334 = phi <4 x i32> [ %2302, %2290 ], [ %2280, %2269 ]
  %2335 = phi <4 x i32> [ %2300, %2290 ], [ %2281, %2269 ]
  %2336 = phi <4 x i32> [ %2298, %2290 ], [ %2282, %2269 ]
  %2337 = phi <4 x i32> [ %2296, %2290 ], [ %2283, %2269 ]
  %2338 = phi <4 x i32> [ %2294, %2290 ], [ %2284, %2269 ]
  %2339 = phi <4 x i32> [ %2292, %2290 ], [ %2285, %2269 ]
  %2340 = getelementptr inbounds nuw i16, ptr %1448, i64 %1501
  %2341 = load <4 x i16>, ptr %2340, align 8
  %2342 = bitcast <4 x i16> %2341 to i64
  %2343 = icmp eq i64 %2342, 0
  br i1 %2343, label %2377, label %2344

2344:                                             ; preds = %2323
  %2345 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %67)
  %2346 = add <4 x i32> %2345, %2339
  store <4 x i32> %2346, ptr %5, align 16, !tbaa !10
  %2347 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %48)
  %2348 = sub <4 x i32> %2338, %2347
  store <4 x i32> %2348, ptr %1424, align 16, !tbaa !10
  %2349 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %69)
  %2350 = add <4 x i32> %2349, %2337
  store <4 x i32> %2350, ptr %1425, align 16, !tbaa !10
  %2351 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %65)
  %2352 = add <4 x i32> %2351, %2336
  store <4 x i32> %2352, ptr %1426, align 16, !tbaa !10
  %2353 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %49)
  %2354 = sub <4 x i32> %2335, %2353
  store <4 x i32> %2354, ptr %1427, align 16, !tbaa !10
  %2355 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %71)
  %2356 = add <4 x i32> %2355, %2334
  store <4 x i32> %2356, ptr %1428, align 16, !tbaa !10
  %2357 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %63)
  %2358 = add <4 x i32> %2357, %2333
  store <4 x i32> %2358, ptr %1429, align 16, !tbaa !10
  %2359 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %51)
  %2360 = sub <4 x i32> %2332, %2359
  store <4 x i32> %2360, ptr %1430, align 16, !tbaa !10
  %2361 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %73)
  %2362 = add <4 x i32> %2361, %2331
  store <4 x i32> %2362, ptr %1431, align 16, !tbaa !10
  %2363 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %61)
  %2364 = add <4 x i32> %2363, %2330
  store <4 x i32> %2364, ptr %1432, align 16, !tbaa !10
  %2365 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %53)
  %2366 = sub <4 x i32> %2329, %2365
  store <4 x i32> %2366, ptr %1433, align 16, !tbaa !10
  %2367 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %75)
  %2368 = add <4 x i32> %2367, %2328
  store <4 x i32> %2368, ptr %1434, align 16, !tbaa !10
  %2369 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %59)
  %2370 = add <4 x i32> %2369, %2327
  store <4 x i32> %2370, ptr %1435, align 16, !tbaa !10
  %2371 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %55)
  %2372 = sub <4 x i32> %2326, %2371
  store <4 x i32> %2372, ptr %1436, align 16, !tbaa !10
  %2373 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %77)
  %2374 = add <4 x i32> %2373, %2325
  store <4 x i32> %2374, ptr %1437, align 16, !tbaa !10
  %2375 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2341, <4 x i16> %57)
  %2376 = add <4 x i32> %2375, %2324
  store <4 x i32> %2376, ptr %1438, align 16, !tbaa !10
  br label %2377

2377:                                             ; preds = %2344, %2323
  %2378 = phi <4 x i32> [ %2376, %2344 ], [ %2324, %2323 ]
  %2379 = phi <4 x i32> [ %2374, %2344 ], [ %2325, %2323 ]
  %2380 = phi <4 x i32> [ %2372, %2344 ], [ %2326, %2323 ]
  %2381 = phi <4 x i32> [ %2370, %2344 ], [ %2327, %2323 ]
  %2382 = phi <4 x i32> [ %2368, %2344 ], [ %2328, %2323 ]
  %2383 = phi <4 x i32> [ %2366, %2344 ], [ %2329, %2323 ]
  %2384 = phi <4 x i32> [ %2364, %2344 ], [ %2330, %2323 ]
  %2385 = phi <4 x i32> [ %2362, %2344 ], [ %2331, %2323 ]
  %2386 = phi <4 x i32> [ %2360, %2344 ], [ %2332, %2323 ]
  %2387 = phi <4 x i32> [ %2358, %2344 ], [ %2333, %2323 ]
  %2388 = phi <4 x i32> [ %2356, %2344 ], [ %2334, %2323 ]
  %2389 = phi <4 x i32> [ %2354, %2344 ], [ %2335, %2323 ]
  %2390 = phi <4 x i32> [ %2352, %2344 ], [ %2336, %2323 ]
  %2391 = phi <4 x i32> [ %2350, %2344 ], [ %2337, %2323 ]
  %2392 = phi <4 x i32> [ %2348, %2344 ], [ %2338, %2323 ]
  %2393 = phi <4 x i32> [ %2346, %2344 ], [ %2339, %2323 ]
  %2394 = getelementptr inbounds nuw i16, ptr %1449, i64 %1501
  %2395 = load <4 x i16>, ptr %2394, align 8
  %2396 = bitcast <4 x i16> %2395 to i64
  %2397 = icmp eq i64 %2396, 0
  br i1 %2397, label %2431, label %2398

2398:                                             ; preds = %2377
  %2399 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %69)
  %2400 = add <4 x i32> %2399, %2393
  store <4 x i32> %2400, ptr %5, align 16, !tbaa !10
  %2401 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %51)
  %2402 = sub <4 x i32> %2392, %2401
  store <4 x i32> %2402, ptr %1424, align 16, !tbaa !10
  %2403 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %59)
  %2404 = add <4 x i32> %2403, %2391
  store <4 x i32> %2404, ptr %1425, align 16, !tbaa !10
  %2405 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %77)
  %2406 = sub <4 x i32> %2390, %2405
  store <4 x i32> %2406, ptr %1426, align 16, !tbaa !10
  %2407 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %61)
  %2408 = sub <4 x i32> %2389, %2407
  store <4 x i32> %2408, ptr %1427, align 16, !tbaa !10
  %2409 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %49)
  %2410 = add <4 x i32> %2409, %2388
  store <4 x i32> %2410, ptr %1428, align 16, !tbaa !10
  %2411 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %67)
  %2412 = sub <4 x i32> %2387, %2411
  store <4 x i32> %2412, ptr %1429, align 16, !tbaa !10
  %2413 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %71)
  %2414 = sub <4 x i32> %2386, %2413
  store <4 x i32> %2414, ptr %1430, align 16, !tbaa !10
  %2415 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %53)
  %2416 = add <4 x i32> %2415, %2385
  store <4 x i32> %2416, ptr %1431, align 16, !tbaa !10
  %2417 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %57)
  %2418 = sub <4 x i32> %2384, %2417
  store <4 x i32> %2418, ptr %1432, align 16, !tbaa !10
  %2419 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %75)
  %2420 = add <4 x i32> %2419, %2383
  store <4 x i32> %2420, ptr %1433, align 16, !tbaa !10
  %2421 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %63)
  %2422 = add <4 x i32> %2421, %2382
  store <4 x i32> %2422, ptr %1434, align 16, !tbaa !10
  %2423 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %48)
  %2424 = sub <4 x i32> %2381, %2423
  store <4 x i32> %2424, ptr %1435, align 16, !tbaa !10
  %2425 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %65)
  %2426 = add <4 x i32> %2425, %2380
  store <4 x i32> %2426, ptr %1436, align 16, !tbaa !10
  %2427 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %73)
  %2428 = add <4 x i32> %2427, %2379
  store <4 x i32> %2428, ptr %1437, align 16, !tbaa !10
  %2429 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2395, <4 x i16> %55)
  %2430 = sub <4 x i32> %2378, %2429
  store <4 x i32> %2430, ptr %1438, align 16, !tbaa !10
  br label %2431

2431:                                             ; preds = %2398, %2377
  %2432 = phi <4 x i32> [ %2430, %2398 ], [ %2378, %2377 ]
  %2433 = phi <4 x i32> [ %2428, %2398 ], [ %2379, %2377 ]
  %2434 = phi <4 x i32> [ %2426, %2398 ], [ %2380, %2377 ]
  %2435 = phi <4 x i32> [ %2424, %2398 ], [ %2381, %2377 ]
  %2436 = phi <4 x i32> [ %2422, %2398 ], [ %2382, %2377 ]
  %2437 = phi <4 x i32> [ %2420, %2398 ], [ %2383, %2377 ]
  %2438 = phi <4 x i32> [ %2418, %2398 ], [ %2384, %2377 ]
  %2439 = phi <4 x i32> [ %2416, %2398 ], [ %2385, %2377 ]
  %2440 = phi <4 x i32> [ %2414, %2398 ], [ %2386, %2377 ]
  %2441 = phi <4 x i32> [ %2412, %2398 ], [ %2387, %2377 ]
  %2442 = phi <4 x i32> [ %2410, %2398 ], [ %2388, %2377 ]
  %2443 = phi <4 x i32> [ %2408, %2398 ], [ %2389, %2377 ]
  %2444 = phi <4 x i32> [ %2406, %2398 ], [ %2390, %2377 ]
  %2445 = phi <4 x i32> [ %2404, %2398 ], [ %2391, %2377 ]
  %2446 = phi <4 x i32> [ %2402, %2398 ], [ %2392, %2377 ]
  %2447 = phi <4 x i32> [ %2400, %2398 ], [ %2393, %2377 ]
  %2448 = getelementptr inbounds nuw i16, ptr %1450, i64 %1501
  %2449 = load <4 x i16>, ptr %2448, align 8
  %2450 = bitcast <4 x i16> %2449 to i64
  %2451 = icmp eq i64 %2450, 0
  br i1 %2451, label %2485, label %2452

2452:                                             ; preds = %2431
  %2453 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %71)
  %2454 = add <4 x i32> %2453, %2447
  store <4 x i32> %2454, ptr %5, align 16, !tbaa !10
  %2455 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %57)
  %2456 = sub <4 x i32> %2446, %2455
  store <4 x i32> %2456, ptr %1424, align 16, !tbaa !10
  %2457 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %49)
  %2458 = add <4 x i32> %2457, %2445
  store <4 x i32> %2458, ptr %1425, align 16, !tbaa !10
  %2459 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %63)
  %2460 = sub <4 x i32> %2444, %2459
  store <4 x i32> %2460, ptr %1426, align 16, !tbaa !10
  %2461 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %77)
  %2462 = add <4 x i32> %2461, %2443
  store <4 x i32> %2462, ptr %1427, align 16, !tbaa !10
  %2463 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %65)
  %2464 = add <4 x i32> %2463, %2442
  store <4 x i32> %2464, ptr %1428, align 16, !tbaa !10
  %2465 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %51)
  %2466 = sub <4 x i32> %2441, %2465
  store <4 x i32> %2466, ptr %1429, align 16, !tbaa !10
  %2467 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %55)
  %2468 = add <4 x i32> %2467, %2440
  store <4 x i32> %2468, ptr %1430, align 16, !tbaa !10
  %2469 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %69)
  %2470 = sub <4 x i32> %2439, %2469
  store <4 x i32> %2470, ptr %1431, align 16, !tbaa !10
  %2471 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %73)
  %2472 = sub <4 x i32> %2438, %2471
  store <4 x i32> %2472, ptr %1432, align 16, !tbaa !10
  %2473 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %59)
  %2474 = add <4 x i32> %2473, %2437
  store <4 x i32> %2474, ptr %1433, align 16, !tbaa !10
  %2475 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %48)
  %2476 = sub <4 x i32> %2436, %2475
  store <4 x i32> %2476, ptr %1434, align 16, !tbaa !10
  %2477 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %61)
  %2478 = add <4 x i32> %2477, %2435
  store <4 x i32> %2478, ptr %1435, align 16, !tbaa !10
  %2479 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %75)
  %2480 = sub <4 x i32> %2434, %2479
  store <4 x i32> %2480, ptr %1436, align 16, !tbaa !10
  %2481 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %67)
  %2482 = sub <4 x i32> %2433, %2481
  store <4 x i32> %2482, ptr %1437, align 16, !tbaa !10
  %2483 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2449, <4 x i16> %53)
  %2484 = add <4 x i32> %2483, %2432
  store <4 x i32> %2484, ptr %1438, align 16, !tbaa !10
  br label %2485

2485:                                             ; preds = %2452, %2431
  %2486 = phi <4 x i32> [ %2484, %2452 ], [ %2432, %2431 ]
  %2487 = phi <4 x i32> [ %2482, %2452 ], [ %2433, %2431 ]
  %2488 = phi <4 x i32> [ %2480, %2452 ], [ %2434, %2431 ]
  %2489 = phi <4 x i32> [ %2478, %2452 ], [ %2435, %2431 ]
  %2490 = phi <4 x i32> [ %2476, %2452 ], [ %2436, %2431 ]
  %2491 = phi <4 x i32> [ %2474, %2452 ], [ %2437, %2431 ]
  %2492 = phi <4 x i32> [ %2472, %2452 ], [ %2438, %2431 ]
  %2493 = phi <4 x i32> [ %2470, %2452 ], [ %2439, %2431 ]
  %2494 = phi <4 x i32> [ %2468, %2452 ], [ %2440, %2431 ]
  %2495 = phi <4 x i32> [ %2466, %2452 ], [ %2441, %2431 ]
  %2496 = phi <4 x i32> [ %2464, %2452 ], [ %2442, %2431 ]
  %2497 = phi <4 x i32> [ %2462, %2452 ], [ %2443, %2431 ]
  %2498 = phi <4 x i32> [ %2460, %2452 ], [ %2444, %2431 ]
  %2499 = phi <4 x i32> [ %2458, %2452 ], [ %2445, %2431 ]
  %2500 = phi <4 x i32> [ %2456, %2452 ], [ %2446, %2431 ]
  %2501 = phi <4 x i32> [ %2454, %2452 ], [ %2447, %2431 ]
  %2502 = getelementptr inbounds nuw i16, ptr %1451, i64 %1501
  %2503 = load <4 x i16>, ptr %2502, align 8
  %2504 = bitcast <4 x i16> %2503 to i64
  %2505 = icmp eq i64 %2504, 0
  br i1 %2505, label %2539, label %2506

2506:                                             ; preds = %2485
  %2507 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %73)
  %2508 = add <4 x i32> %2507, %2501
  store <4 x i32> %2508, ptr %5, align 16, !tbaa !10
  %2509 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %63)
  %2510 = sub <4 x i32> %2500, %2509
  store <4 x i32> %2510, ptr %1424, align 16, !tbaa !10
  %2511 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %53)
  %2512 = add <4 x i32> %2511, %2499
  store <4 x i32> %2512, ptr %1425, align 16, !tbaa !10
  %2513 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %49)
  %2514 = sub <4 x i32> %2498, %2513
  store <4 x i32> %2514, ptr %1426, align 16, !tbaa !10
  %2515 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %59)
  %2516 = add <4 x i32> %2515, %2497
  store <4 x i32> %2516, ptr %1427, align 16, !tbaa !10
  %2517 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %69)
  %2518 = sub <4 x i32> %2496, %2517
  store <4 x i32> %2518, ptr %1428, align 16, !tbaa !10
  %2519 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %77)
  %2520 = sub <4 x i32> %2495, %2519
  store <4 x i32> %2520, ptr %1429, align 16, !tbaa !10
  %2521 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %67)
  %2522 = add <4 x i32> %2521, %2494
  store <4 x i32> %2522, ptr %1430, align 16, !tbaa !10
  %2523 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %57)
  %2524 = sub <4 x i32> %2493, %2523
  store <4 x i32> %2524, ptr %1431, align 16, !tbaa !10
  %2525 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %48)
  %2526 = add <4 x i32> %2525, %2492
  store <4 x i32> %2526, ptr %1432, align 16, !tbaa !10
  %2527 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %55)
  %2528 = sub <4 x i32> %2491, %2527
  store <4 x i32> %2528, ptr %1433, align 16, !tbaa !10
  %2529 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %65)
  %2530 = add <4 x i32> %2529, %2490
  store <4 x i32> %2530, ptr %1434, align 16, !tbaa !10
  %2531 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %75)
  %2532 = sub <4 x i32> %2489, %2531
  store <4 x i32> %2532, ptr %1435, align 16, !tbaa !10
  %2533 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %71)
  %2534 = sub <4 x i32> %2488, %2533
  store <4 x i32> %2534, ptr %1436, align 16, !tbaa !10
  %2535 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %61)
  %2536 = add <4 x i32> %2535, %2487
  store <4 x i32> %2536, ptr %1437, align 16, !tbaa !10
  %2537 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2503, <4 x i16> %51)
  %2538 = sub <4 x i32> %2486, %2537
  store <4 x i32> %2538, ptr %1438, align 16, !tbaa !10
  br label %2539

2539:                                             ; preds = %2506, %2485
  %2540 = phi <4 x i32> [ %2538, %2506 ], [ %2486, %2485 ]
  %2541 = phi <4 x i32> [ %2536, %2506 ], [ %2487, %2485 ]
  %2542 = phi <4 x i32> [ %2534, %2506 ], [ %2488, %2485 ]
  %2543 = phi <4 x i32> [ %2532, %2506 ], [ %2489, %2485 ]
  %2544 = phi <4 x i32> [ %2530, %2506 ], [ %2490, %2485 ]
  %2545 = phi <4 x i32> [ %2528, %2506 ], [ %2491, %2485 ]
  %2546 = phi <4 x i32> [ %2526, %2506 ], [ %2492, %2485 ]
  %2547 = phi <4 x i32> [ %2524, %2506 ], [ %2493, %2485 ]
  %2548 = phi <4 x i32> [ %2522, %2506 ], [ %2494, %2485 ]
  %2549 = phi <4 x i32> [ %2520, %2506 ], [ %2495, %2485 ]
  %2550 = phi <4 x i32> [ %2518, %2506 ], [ %2496, %2485 ]
  %2551 = phi <4 x i32> [ %2516, %2506 ], [ %2497, %2485 ]
  %2552 = phi <4 x i32> [ %2514, %2506 ], [ %2498, %2485 ]
  %2553 = phi <4 x i32> [ %2512, %2506 ], [ %2499, %2485 ]
  %2554 = phi <4 x i32> [ %2510, %2506 ], [ %2500, %2485 ]
  %2555 = phi <4 x i32> [ %2508, %2506 ], [ %2501, %2485 ]
  %2556 = getelementptr inbounds nuw i16, ptr %1452, i64 %1501
  %2557 = load <4 x i16>, ptr %2556, align 8
  %2558 = bitcast <4 x i16> %2557 to i64
  %2559 = icmp eq i64 %2558, 0
  br i1 %2559, label %2593, label %2560

2560:                                             ; preds = %2539
  %2561 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %75)
  %2562 = add <4 x i32> %2561, %2555
  store <4 x i32> %2562, ptr %5, align 16, !tbaa !10
  %2563 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %69)
  %2564 = sub <4 x i32> %2554, %2563
  store <4 x i32> %2564, ptr %1424, align 16, !tbaa !10
  %2565 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %63)
  %2566 = add <4 x i32> %2565, %2553
  store <4 x i32> %2566, ptr %1425, align 16, !tbaa !10
  %2567 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %57)
  %2568 = sub <4 x i32> %2552, %2567
  store <4 x i32> %2568, ptr %1426, align 16, !tbaa !10
  %2569 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %51)
  %2570 = add <4 x i32> %2569, %2551
  store <4 x i32> %2570, ptr %1427, align 16, !tbaa !10
  %2571 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %48)
  %2572 = sub <4 x i32> %2550, %2571
  store <4 x i32> %2572, ptr %1428, align 16, !tbaa !10
  %2573 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %53)
  %2574 = add <4 x i32> %2573, %2549
  store <4 x i32> %2574, ptr %1429, align 16, !tbaa !10
  %2575 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %59)
  %2576 = sub <4 x i32> %2548, %2575
  store <4 x i32> %2576, ptr %1430, align 16, !tbaa !10
  %2577 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %65)
  %2578 = add <4 x i32> %2577, %2547
  store <4 x i32> %2578, ptr %1431, align 16, !tbaa !10
  %2579 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %71)
  %2580 = sub <4 x i32> %2546, %2579
  store <4 x i32> %2580, ptr %1432, align 16, !tbaa !10
  %2581 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %77)
  %2582 = add <4 x i32> %2581, %2545
  store <4 x i32> %2582, ptr %1433, align 16, !tbaa !10
  %2583 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %73)
  %2584 = add <4 x i32> %2583, %2544
  store <4 x i32> %2584, ptr %1434, align 16, !tbaa !10
  %2585 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %67)
  %2586 = sub <4 x i32> %2543, %2585
  store <4 x i32> %2586, ptr %1435, align 16, !tbaa !10
  %2587 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %61)
  %2588 = add <4 x i32> %2587, %2542
  store <4 x i32> %2588, ptr %1436, align 16, !tbaa !10
  %2589 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %55)
  %2590 = sub <4 x i32> %2541, %2589
  store <4 x i32> %2590, ptr %1437, align 16, !tbaa !10
  %2591 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2557, <4 x i16> %49)
  %2592 = add <4 x i32> %2591, %2540
  store <4 x i32> %2592, ptr %1438, align 16, !tbaa !10
  br label %2593

2593:                                             ; preds = %2560, %2539
  %2594 = phi <4 x i32> [ %2592, %2560 ], [ %2540, %2539 ]
  %2595 = phi <4 x i32> [ %2590, %2560 ], [ %2541, %2539 ]
  %2596 = phi <4 x i32> [ %2588, %2560 ], [ %2542, %2539 ]
  %2597 = phi <4 x i32> [ %2586, %2560 ], [ %2543, %2539 ]
  %2598 = phi <4 x i32> [ %2584, %2560 ], [ %2544, %2539 ]
  %2599 = phi <4 x i32> [ %2582, %2560 ], [ %2545, %2539 ]
  %2600 = phi <4 x i32> [ %2580, %2560 ], [ %2546, %2539 ]
  %2601 = phi <4 x i32> [ %2578, %2560 ], [ %2547, %2539 ]
  %2602 = phi <4 x i32> [ %2576, %2560 ], [ %2548, %2539 ]
  %2603 = phi <4 x i32> [ %2574, %2560 ], [ %2549, %2539 ]
  %2604 = phi <4 x i32> [ %2572, %2560 ], [ %2550, %2539 ]
  %2605 = phi <4 x i32> [ %2570, %2560 ], [ %2551, %2539 ]
  %2606 = phi <4 x i32> [ %2568, %2560 ], [ %2552, %2539 ]
  %2607 = phi <4 x i32> [ %2566, %2560 ], [ %2553, %2539 ]
  %2608 = phi <4 x i32> [ %2564, %2560 ], [ %2554, %2539 ]
  %2609 = phi <4 x i32> [ %2562, %2560 ], [ %2555, %2539 ]
  %2610 = getelementptr inbounds nuw i16, ptr %1453, i64 %1501
  %2611 = load <4 x i16>, ptr %2610, align 8
  %2612 = bitcast <4 x i16> %2611 to i64
  %2613 = icmp eq i64 %2612, 0
  br i1 %2613, label %2647, label %2614

2614:                                             ; preds = %2593
  %2615 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %77)
  %2616 = add <4 x i32> %2615, %2609
  store <4 x i32> %2616, ptr %5, align 16, !tbaa !10
  %2617 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %75)
  %2618 = sub <4 x i32> %2608, %2617
  store <4 x i32> %2618, ptr %1424, align 16, !tbaa !10
  %2619 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %73)
  %2620 = add <4 x i32> %2619, %2607
  store <4 x i32> %2620, ptr %1425, align 16, !tbaa !10
  %2621 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %71)
  %2622 = sub <4 x i32> %2606, %2621
  store <4 x i32> %2622, ptr %1426, align 16, !tbaa !10
  %2623 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %69)
  %2624 = add <4 x i32> %2623, %2605
  store <4 x i32> %2624, ptr %1427, align 16, !tbaa !10
  %2625 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %67)
  %2626 = sub <4 x i32> %2604, %2625
  store <4 x i32> %2626, ptr %1428, align 16, !tbaa !10
  %2627 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %65)
  %2628 = add <4 x i32> %2627, %2603
  store <4 x i32> %2628, ptr %1429, align 16, !tbaa !10
  %2629 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %63)
  %2630 = sub <4 x i32> %2602, %2629
  store <4 x i32> %2630, ptr %1430, align 16, !tbaa !10
  %2631 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %61)
  %2632 = add <4 x i32> %2631, %2601
  store <4 x i32> %2632, ptr %1431, align 16, !tbaa !10
  %2633 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %59)
  %2634 = sub <4 x i32> %2600, %2633
  store <4 x i32> %2634, ptr %1432, align 16, !tbaa !10
  %2635 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %57)
  %2636 = add <4 x i32> %2635, %2599
  store <4 x i32> %2636, ptr %1433, align 16, !tbaa !10
  %2637 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %55)
  %2638 = sub <4 x i32> %2598, %2637
  store <4 x i32> %2638, ptr %1434, align 16, !tbaa !10
  %2639 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %53)
  %2640 = add <4 x i32> %2639, %2597
  store <4 x i32> %2640, ptr %1435, align 16, !tbaa !10
  %2641 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %51)
  %2642 = sub <4 x i32> %2596, %2641
  store <4 x i32> %2642, ptr %1436, align 16, !tbaa !10
  %2643 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %49)
  %2644 = add <4 x i32> %2643, %2595
  store <4 x i32> %2644, ptr %1437, align 16, !tbaa !10
  %2645 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %2611, <4 x i16> %48)
  %2646 = sub <4 x i32> %2594, %2645
  store <4 x i32> %2646, ptr %1438, align 16, !tbaa !10
  br label %2647

2647:                                             ; preds = %2614, %2593
  call void @llvm.lifetime.start.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.start.p0(ptr nonnull %7) #10
  br label %2754

2648:                                             ; preds = %2754
  %2649 = load <4 x i16>, ptr %6, align 8, !tbaa !10
  %2650 = load <4 x i16>, ptr %1454, align 8, !tbaa !10
  %2651 = load <4 x i16>, ptr %1455, align 8, !tbaa !10
  %2652 = load <4 x i16>, ptr %1456, align 8, !tbaa !10
  %2653 = load <4 x i16>, ptr %1457, align 8, !tbaa !10
  %2654 = load <4 x i16>, ptr %1458, align 8, !tbaa !10
  %2655 = load <4 x i16>, ptr %1459, align 8, !tbaa !10
  %2656 = load <4 x i16>, ptr %1460, align 8, !tbaa !10
  %2657 = shufflevector <4 x i16> %2649, <4 x i16> %2653, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2658 = shufflevector <4 x i16> %2650, <4 x i16> %2654, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2659 = shufflevector <4 x i16> %2651, <4 x i16> %2655, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2660 = shufflevector <4 x i16> %2652, <4 x i16> %2656, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2661 = shufflevector <8 x i16> %2657, <8 x i16> %2659, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2662 = shufflevector <8 x i16> %2657, <8 x i16> %2659, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2663 = shufflevector <8 x i16> %2658, <8 x i16> %2660, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2664 = shufflevector <8 x i16> %2658, <8 x i16> %2660, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2665 = shufflevector <8 x i16> %2661, <8 x i16> %2663, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2666 = shufflevector <8 x i16> %2661, <8 x i16> %2663, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2667 = shufflevector <8 x i16> %2662, <8 x i16> %2664, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2668 = shufflevector <8 x i16> %2662, <8 x i16> %2664, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2669 = load <4 x i16>, ptr %1461, align 8, !tbaa !10
  %2670 = load <4 x i16>, ptr %1462, align 8, !tbaa !10
  %2671 = load <4 x i16>, ptr %1463, align 8, !tbaa !10
  %2672 = load <4 x i16>, ptr %1464, align 8, !tbaa !10
  %2673 = load <4 x i16>, ptr %1465, align 8, !tbaa !10
  %2674 = load <4 x i16>, ptr %1466, align 8, !tbaa !10
  %2675 = load <4 x i16>, ptr %1467, align 8, !tbaa !10
  %2676 = load <4 x i16>, ptr %1468, align 8, !tbaa !10
  %2677 = shufflevector <4 x i16> %2669, <4 x i16> %2673, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2678 = shufflevector <4 x i16> %2670, <4 x i16> %2674, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2679 = shufflevector <4 x i16> %2671, <4 x i16> %2675, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2680 = shufflevector <4 x i16> %2672, <4 x i16> %2676, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2681 = shufflevector <8 x i16> %2677, <8 x i16> %2679, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2682 = shufflevector <8 x i16> %2677, <8 x i16> %2679, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2683 = shufflevector <8 x i16> %2678, <8 x i16> %2680, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2684 = shufflevector <8 x i16> %2678, <8 x i16> %2680, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2685 = shufflevector <8 x i16> %2681, <8 x i16> %2683, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2686 = shufflevector <8 x i16> %2681, <8 x i16> %2683, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2687 = shufflevector <8 x i16> %2682, <8 x i16> %2684, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2688 = shufflevector <8 x i16> %2682, <8 x i16> %2684, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2689 = load <4 x i16>, ptr %7, align 8, !tbaa !10
  %2690 = load <4 x i16>, ptr %1469, align 8, !tbaa !10
  %2691 = load <4 x i16>, ptr %1470, align 8, !tbaa !10
  %2692 = load <4 x i16>, ptr %1471, align 8, !tbaa !10
  %2693 = load <4 x i16>, ptr %1472, align 8, !tbaa !10
  %2694 = load <4 x i16>, ptr %1473, align 8, !tbaa !10
  %2695 = load <4 x i16>, ptr %1474, align 8, !tbaa !10
  %2696 = load <4 x i16>, ptr %1475, align 8, !tbaa !10
  %2697 = shufflevector <4 x i16> %2689, <4 x i16> %2693, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2698 = shufflevector <4 x i16> %2690, <4 x i16> %2694, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2699 = shufflevector <4 x i16> %2691, <4 x i16> %2695, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2700 = shufflevector <4 x i16> %2692, <4 x i16> %2696, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2701 = shufflevector <8 x i16> %2697, <8 x i16> %2699, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2702 = shufflevector <8 x i16> %2697, <8 x i16> %2699, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2703 = shufflevector <8 x i16> %2698, <8 x i16> %2700, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2704 = shufflevector <8 x i16> %2698, <8 x i16> %2700, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2705 = shufflevector <8 x i16> %2701, <8 x i16> %2703, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2706 = shufflevector <8 x i16> %2701, <8 x i16> %2703, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2707 = shufflevector <8 x i16> %2702, <8 x i16> %2704, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2708 = shufflevector <8 x i16> %2702, <8 x i16> %2704, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2709 = load <4 x i16>, ptr %1476, align 8, !tbaa !10
  %2710 = load <4 x i16>, ptr %1477, align 8, !tbaa !10
  %2711 = load <4 x i16>, ptr %1478, align 8, !tbaa !10
  %2712 = load <4 x i16>, ptr %1479, align 8, !tbaa !10
  %2713 = load <4 x i16>, ptr %1480, align 8, !tbaa !10
  %2714 = load <4 x i16>, ptr %1481, align 8, !tbaa !10
  %2715 = load <4 x i16>, ptr %1482, align 8, !tbaa !10
  %2716 = load <4 x i16>, ptr %1483, align 8, !tbaa !10
  %2717 = shufflevector <4 x i16> %2709, <4 x i16> %2713, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2718 = shufflevector <4 x i16> %2710, <4 x i16> %2714, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2719 = shufflevector <4 x i16> %2711, <4 x i16> %2715, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2720 = shufflevector <4 x i16> %2712, <4 x i16> %2716, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  %2721 = shufflevector <8 x i16> %2717, <8 x i16> %2719, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2722 = shufflevector <8 x i16> %2717, <8 x i16> %2719, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2723 = shufflevector <8 x i16> %2718, <8 x i16> %2720, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2724 = shufflevector <8 x i16> %2718, <8 x i16> %2720, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2725 = shufflevector <8 x i16> %2721, <8 x i16> %2723, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2726 = shufflevector <8 x i16> %2721, <8 x i16> %2723, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2727 = shufflevector <8 x i16> %2722, <8 x i16> %2724, <8 x i32> <i32 0, i32 8, i32 1, i32 9, i32 2, i32 10, i32 3, i32 11>
  %2728 = shufflevector <8 x i16> %2722, <8 x i16> %2724, <8 x i32> <i32 4, i32 12, i32 5, i32 13, i32 6, i32 14, i32 7, i32 15>
  %2729 = mul nsw i64 %1501, %2
  %2730 = getelementptr inbounds i16, ptr %1, i64 %2729
  store <8 x i16> %2665, ptr %2730, align 2
  %2731 = getelementptr inbounds nuw i8, ptr %2730, i64 16
  store <8 x i16> %2685, ptr %2731, align 2
  %2732 = getelementptr inbounds nuw i8, ptr %2730, i64 32
  store <8 x i16> %2705, ptr %2732, align 2
  %2733 = getelementptr inbounds nuw i8, ptr %2730, i64 48
  store <8 x i16> %2725, ptr %2733, align 2
  %2734 = or disjoint i64 %1501, 1
  %2735 = mul nsw i64 %2734, %2
  %2736 = getelementptr inbounds i16, ptr %1, i64 %2735
  store <8 x i16> %2666, ptr %2736, align 2
  %2737 = getelementptr inbounds nuw i8, ptr %2736, i64 16
  store <8 x i16> %2686, ptr %2737, align 2
  %2738 = getelementptr inbounds nuw i8, ptr %2736, i64 32
  store <8 x i16> %2706, ptr %2738, align 2
  %2739 = getelementptr inbounds nuw i8, ptr %2736, i64 48
  store <8 x i16> %2726, ptr %2739, align 2
  %2740 = or disjoint i64 %1501, 2
  %2741 = mul nsw i64 %2740, %2
  %2742 = getelementptr inbounds i16, ptr %1, i64 %2741
  store <8 x i16> %2667, ptr %2742, align 2
  %2743 = getelementptr inbounds nuw i8, ptr %2742, i64 16
  store <8 x i16> %2687, ptr %2743, align 2
  %2744 = getelementptr inbounds nuw i8, ptr %2742, i64 32
  store <8 x i16> %2707, ptr %2744, align 2
  %2745 = getelementptr inbounds nuw i8, ptr %2742, i64 48
  store <8 x i16> %2727, ptr %2745, align 2
  %2746 = or disjoint i64 %1501, 3
  %2747 = mul nsw i64 %2746, %2
  %2748 = getelementptr inbounds i16, ptr %1, i64 %2747
  store <8 x i16> %2668, ptr %2748, align 2
  %2749 = getelementptr inbounds nuw i8, ptr %2748, i64 16
  store <8 x i16> %2688, ptr %2749, align 2
  %2750 = getelementptr inbounds nuw i8, ptr %2748, i64 32
  store <8 x i16> %2708, ptr %2750, align 2
  %2751 = getelementptr inbounds nuw i8, ptr %2748, i64 48
  store <8 x i16> %2728, ptr %2751, align 2
  call void @llvm.lifetime.end.p0(ptr nonnull %7) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %6) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %5) #10
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #10
  %2752 = add nuw nsw i64 %1500, 1
  %2753 = icmp eq i64 %2752, 8
  br i1 %2753, label %2773, label %1499, !llvm.loop !34

2754:                                             ; preds = %2754, %2647
  %2755 = phi i64 [ 0, %2647 ], [ %2771, %2754 ]
  %2756 = getelementptr inbounds nuw <4 x i32>, ptr %4, i64 %2755
  %2757 = load <4 x i32>, ptr %2756, align 16, !tbaa !10
  %2758 = getelementptr inbounds nuw <4 x i32>, ptr %5, i64 %2755
  %2759 = load <4 x i32>, ptr %2758, align 16, !tbaa !10
  %2760 = add <4 x i32> %2759, %2757
  %2761 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %2760, i32 12)
  %2762 = getelementptr inbounds nuw <4 x i16>, ptr %6, i64 %2755
  store <4 x i16> %2761, ptr %2762, align 8, !tbaa !10
  %2763 = sub nuw nsw i64 15, %2755
  %2764 = getelementptr inbounds nuw <4 x i32>, ptr %4, i64 %2763
  %2765 = load <4 x i32>, ptr %2764, align 16, !tbaa !10
  %2766 = getelementptr inbounds nuw <4 x i32>, ptr %5, i64 %2763
  %2767 = load <4 x i32>, ptr %2766, align 16, !tbaa !10
  %2768 = sub <4 x i32> %2765, %2767
  %2769 = tail call <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32> %2768, i32 12)
  %2770 = getelementptr inbounds nuw <4 x i16>, ptr %7, i64 %2755
  store <4 x i16> %2769, ptr %2770, align 8, !tbaa !10
  %2771 = add nuw nsw i64 %2755, 1
  %2772 = icmp eq i64 %2771, 16
  br i1 %2772, label %2648, label %2754, !llvm.loop !35

2773:                                             ; preds = %2648
  call void @llvm.lifetime.end.p0(ptr nonnull %12) #10
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable
define dso_local noundef range(i32 -240, -2147479552) i32 @_ZN4x26521findPosFirstLast_neonEPKslPKt(ptr noundef readonly captures(none) %0, i64 noundef %1, ptr noundef readonly captures(none) %2) #3 {
  %4 = load <4 x i16>, ptr %0, align 2
  %5 = getelementptr inbounds i16, ptr %0, i64 %1
  %6 = load <4 x i16>, ptr %5, align 2
  %7 = shl nsw i64 %1, 2
  %8 = getelementptr inbounds i8, ptr %0, i64 %7
  %9 = load <4 x i16>, ptr %8, align 2
  %10 = mul nsw i64 %1, 6
  %11 = getelementptr inbounds i8, ptr %0, i64 %10
  %12 = load <4 x i16>, ptr %11, align 2
  %13 = shufflevector <4 x i16> %4, <4 x i16> %6, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %14 = shufflevector <4 x i16> %9, <4 x i16> %12, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %15 = shufflevector <8 x i16> %13, <8 x i16> %14, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %16 = icmp ne <16 x i16> %15, zeroinitializer
  %17 = sext <16 x i1> %16 to <16 x i8>
  %18 = getelementptr inbounds nuw i8, ptr %2, i64 4
  %19 = load i16, ptr %18, align 2, !tbaa !36
  %20 = icmp eq i16 %19, 2
  br i1 %20, label %28, label %21

21:                                               ; preds = %3
  %22 = load <8 x i16>, ptr %2, align 2
  %23 = getelementptr inbounds nuw i8, ptr %2, i64 16
  %24 = load <8 x i16>, ptr %23, align 2
  %25 = shufflevector <8 x i16> %22, <8 x i16> %24, <16 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %26 = trunc <16 x i16> %25 to <16 x i8>
  %27 = tail call noundef <16 x i8> @llvm.aarch64.neon.tbl1.v16i8(<16 x i8> %17, <16 x i8> %26)
  br label %28

28:                                               ; preds = %21, %3
  %29 = phi <16 x i8> [ %27, %21 ], [ %17, %3 ]
  %30 = bitcast <16 x i8> %29 to <8 x i16>
  %31 = lshr <8 x i16> %30, splat (i16 4)
  %32 = trunc <8 x i16> %31 to <8 x i8>
  %33 = bitcast <8 x i8> %32 to i64
  %34 = icmp eq i64 %33, 0
  br i1 %34, label %50, label %35

35:                                               ; preds = %28
  %36 = tail call range(i64 0, 65) i64 @llvm.cttz.i64(i64 %33, i1 true)
  %37 = trunc nuw nsw i64 %36 to i32
  %38 = lshr i32 %37, 2
  %39 = tail call range(i64 0, 65) i64 @llvm.ctlz.i64(i64 %33, i1 true)
  %40 = trunc nuw nsw i64 %39 to i32
  %41 = add <8 x i16> %14, %13
  %42 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %41)
  %43 = zext i16 %42 to i32
  %44 = shl i32 %43, 31
  %45 = shl nuw nsw i32 %40, 6
  %46 = and i32 %45, 3840
  %47 = or disjoint i32 %46, %44
  %48 = or disjoint i32 %47, %38
  %49 = xor i32 %48, 3840
  br label %50

50:                                               ; preds = %28, %35
  %51 = phi i32 [ %49, %35 ], [ -240, %28 ]
  ret i32 %51
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.cttz.i64(i64, i1 immarg) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.ctlz.i64(i64, i1 immarg) #4

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: write) uwtable
define dso_local void @_ZN4x26523setupDCTPrimitives_neonERNS_17EncoderPrimitivesE(ptr noundef nonnull writeonly align 8 captures(none) dereferenceable(18248) initializes((3800, 3816), (3888, 3904), (4336, 4368), (4384, 4400), (4472, 4488), (4920, 4952), (4968, 4984), (5056, 5072), (5504, 5536), (5552, 5568), (5640, 5656), (6088, 6120), (6720, 6736), (7040, 7056)) %0) local_unnamed_addr #5 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 3800
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 4336
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi2EEEvPsPlS2_S2_j, ptr %3, align 8, !tbaa !38
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 4384
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 4920
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi3EEEvPsPlS2_S2_j, ptr %5, align 8, !tbaa !38
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 4968
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 5504
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi4EEEvPsPlS2_S2_j, ptr %7, align 8, !tbaa !38
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 5552
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 6088
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi5EEEvPsPlS2_S2_j, ptr %9, align 8, !tbaa !38
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 4344
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi2EEEvPsS1_PlS2_S2_S2_j, ptr %10, align 8, !tbaa !41
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 4928
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi3EEEvPsS1_PlS2_S2_S2_j, ptr %11, align 8, !tbaa !41
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 5512
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi4EEEvPsS1_PlS2_S2_S2_j, ptr %12, align 8, !tbaa !41
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 6096
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi5EEEvPsS1_PlS2_S2_S2_j, ptr %13, align 8, !tbaa !41
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 6720
  store ptr @_ZN4x2659dst4_neonEPKsPsl, ptr %14, align 8, !tbaa !42
  store ptr @_ZN4x2659dct4_neonEPKsPsl, ptr %2, align 8, !tbaa !44
  store ptr @_ZN4x2659dct8_neonEPKsPsl, ptr %4, align 8, !tbaa !44
  store ptr @x265_dct16_neon, ptr %6, align 8, !tbaa !44
  store ptr @_ZN4x26510dct32_neonEPKsPsl, ptr %8, align 8, !tbaa !44
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 6728
  store ptr @_ZN4x26510idst4_neonEPKsPsl, ptr %15, align 8, !tbaa !45
  %16 = getelementptr inbounds nuw i8, ptr %0, i64 3808
  store ptr @_ZN4x26510idct4_neonEPKsPsl, ptr %16, align 8, !tbaa !46
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 4392
  store ptr @_ZN4x26510idct8_neonEPKsPsl, ptr %17, align 8, !tbaa !46
  %18 = getelementptr inbounds nuw i8, ptr %0, i64 4976
  store ptr @_ZN4x26511idct16_neonEPKsPsl, ptr %18, align 8, !tbaa !46
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 5560
  store ptr @_ZN4x26511idct32_neonEPKsPsl, ptr %19, align 8, !tbaa !46
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 3896
  store ptr @_ZN12_GLOBAL__N_118count_nonzero_neonILi4EEEiPKs, ptr %20, align 8, !tbaa !47
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 4480
  store ptr @_ZN12_GLOBAL__N_118count_nonzero_neonILi8EEEiPKs, ptr %21, align 8, !tbaa !47
  %22 = getelementptr inbounds nuw i8, ptr %0, i64 5064
  store ptr @_ZN12_GLOBAL__N_118count_nonzero_neonILi16EEEiPKs, ptr %22, align 8, !tbaa !47
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 5648
  store ptr @_ZN12_GLOBAL__N_118count_nonzero_neonILi32EEEiPKs, ptr %23, align 8, !tbaa !47
  %24 = getelementptr inbounds nuw i8, ptr %0, i64 3888
  store ptr @_ZN12_GLOBAL__N_115copy_count_neonILi4EEEjPsPKsl, ptr %24, align 8, !tbaa !48
  %25 = getelementptr inbounds nuw i8, ptr %0, i64 4472
  store ptr @_ZN12_GLOBAL__N_115copy_count_neonILi8EEEjPsPKsl, ptr %25, align 8, !tbaa !48
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 5056
  store ptr @_ZN12_GLOBAL__N_115copy_count_neonILi16EEEjPsPKsl, ptr %26, align 8, !tbaa !48
  %27 = getelementptr inbounds nuw i8, ptr %0, i64 5640
  store ptr @_ZN12_GLOBAL__N_115copy_count_neonILi32EEEjPsPKsl, ptr %27, align 8, !tbaa !48
  %28 = getelementptr inbounds nuw i8, ptr %0, i64 4352
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi2EEEvPsPlS2_S2_j, ptr %28, align 8, !tbaa !49
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 4360
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi2EEEvPsS1_PlS2_S2_S2_j, ptr %29, align 8, !tbaa !50
  %30 = getelementptr inbounds nuw i8, ptr %0, i64 4936
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi3EEEvPsPlS2_S2_j, ptr %30, align 8, !tbaa !49
  %31 = getelementptr inbounds nuw i8, ptr %0, i64 4944
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi3EEEvPsS1_PlS2_S2_S2_j, ptr %31, align 8, !tbaa !50
  %32 = getelementptr inbounds nuw i8, ptr %0, i64 5520
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi4EEEvPsPlS2_S2_j, ptr %32, align 8, !tbaa !49
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 5528
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi4EEEvPsS1_PlS2_S2_S2_j, ptr %33, align 8, !tbaa !50
  %34 = getelementptr inbounds nuw i8, ptr %0, i64 6104
  store ptr @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi5EEEvPsPlS2_S2_j, ptr %34, align 8, !tbaa !49
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 6112
  store ptr @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi5EEEvPsS1_PlS2_S2_S2_j, ptr %35, align 8, !tbaa !50
  %36 = getelementptr inbounds nuw i8, ptr %0, i64 7040
  store ptr @_ZN12_GLOBAL__N_115scanPosLast_optEPKtPKsPtS4_PhiS1_i, ptr %36, align 8, !tbaa !51
  %37 = getelementptr inbounds nuw i8, ptr %0, i64 7048
  store ptr @_ZN4x26521findPosFirstLast_neonEPKslPKt, ptr %37, align 8, !tbaa !52
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi2EEEvPsPlS2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, i32 noundef %4) #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds nuw i16, ptr %0, i64 %6
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %8, <4 x i16> %8)
  %10 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %11 = sext <2 x i32> %10 to <2 x i64>
  %12 = shl nsw <2 x i64> %11, splat (i64 5)
  %13 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %14 = sext <2 x i32> %13 to <2 x i64>
  %15 = shl nsw <2 x i64> %14, splat (i64 5)
  %16 = getelementptr inbounds nuw i64, ptr %1, i64 %6
  store <2 x i64> %12, ptr %16, align 8
  %17 = add i32 %4, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds nuw i64, ptr %1, i64 %18
  store <2 x i64> %15, ptr %19, align 8
  %20 = add i32 %4, 4
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw i16, ptr %0, i64 %21
  %23 = load <4 x i16>, ptr %22, align 2
  %24 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %23, <4 x i16> %23)
  %25 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %26 = sext <2 x i32> %25 to <2 x i64>
  %27 = shl nsw <2 x i64> %26, splat (i64 5)
  %28 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = sext <2 x i32> %28 to <2 x i64>
  %30 = shl nsw <2 x i64> %29, splat (i64 5)
  %31 = getelementptr inbounds nuw i64, ptr %1, i64 %21
  store <2 x i64> %27, ptr %31, align 8
  %32 = add i32 %4, 6
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds nuw i64, ptr %1, i64 %33
  store <2 x i64> %30, ptr %34, align 8
  %35 = add nsw <2 x i64> %27, %12
  %36 = add nsw <2 x i64> %30, %15
  %37 = add i32 %4, 8
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds nuw i16, ptr %0, i64 %38
  %40 = load <4 x i16>, ptr %39, align 2
  %41 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %40, <4 x i16> %40)
  %42 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %43 = sext <2 x i32> %42 to <2 x i64>
  %44 = shl nsw <2 x i64> %43, splat (i64 5)
  %45 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %46 = sext <2 x i32> %45 to <2 x i64>
  %47 = shl nsw <2 x i64> %46, splat (i64 5)
  %48 = getelementptr inbounds nuw i64, ptr %1, i64 %38
  store <2 x i64> %44, ptr %48, align 8
  %49 = add i32 %4, 10
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds nuw i64, ptr %1, i64 %50
  store <2 x i64> %47, ptr %51, align 8
  %52 = add nsw <2 x i64> %44, %35
  %53 = add nsw <2 x i64> %47, %36
  %54 = add i32 %4, 12
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds nuw i16, ptr %0, i64 %55
  %57 = load <4 x i16>, ptr %56, align 2
  %58 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %57, <4 x i16> %57)
  %59 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %60 = sext <2 x i32> %59 to <2 x i64>
  %61 = shl nsw <2 x i64> %60, splat (i64 5)
  %62 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %63 = sext <2 x i32> %62 to <2 x i64>
  %64 = shl nsw <2 x i64> %63, splat (i64 5)
  %65 = getelementptr inbounds nuw i64, ptr %1, i64 %55
  store <2 x i64> %61, ptr %65, align 8
  %66 = add i32 %4, 14
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds nuw i64, ptr %1, i64 %67
  store <2 x i64> %64, ptr %68, align 8
  %69 = add nsw <2 x i64> %61, %52
  %70 = add nsw <2 x i64> %64, %53
  %71 = add nsw <2 x i64> %69, %70
  %72 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %71)
  %73 = load i64, ptr %2, align 8, !tbaa !53
  %74 = add nsw i64 %73, %72
  store i64 %74, ptr %2, align 8, !tbaa !53
  %75 = load i64, ptr %3, align 8, !tbaa !53
  %76 = add nsw i64 %75, %72
  store i64 %76, ptr %3, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi3EEEvPsPlS2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, i32 noundef %4) #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds nuw i16, ptr %0, i64 %6
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %8, <4 x i16> %8)
  %10 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %11 = sext <2 x i32> %10 to <2 x i64>
  %12 = shl nsw <2 x i64> %11, splat (i64 7)
  %13 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %14 = sext <2 x i32> %13 to <2 x i64>
  %15 = shl nsw <2 x i64> %14, splat (i64 7)
  %16 = getelementptr inbounds nuw i64, ptr %1, i64 %6
  store <2 x i64> %12, ptr %16, align 8
  %17 = add i32 %4, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds nuw i64, ptr %1, i64 %18
  store <2 x i64> %15, ptr %19, align 8
  %20 = add i32 %4, 8
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw i16, ptr %0, i64 %21
  %23 = load <4 x i16>, ptr %22, align 2
  %24 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %23, <4 x i16> %23)
  %25 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %26 = sext <2 x i32> %25 to <2 x i64>
  %27 = shl nsw <2 x i64> %26, splat (i64 7)
  %28 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = sext <2 x i32> %28 to <2 x i64>
  %30 = shl nsw <2 x i64> %29, splat (i64 7)
  %31 = getelementptr inbounds nuw i64, ptr %1, i64 %21
  store <2 x i64> %27, ptr %31, align 8
  %32 = add i32 %4, 10
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds nuw i64, ptr %1, i64 %33
  store <2 x i64> %30, ptr %34, align 8
  %35 = add nsw <2 x i64> %27, %12
  %36 = add nsw <2 x i64> %30, %15
  %37 = add i32 %4, 16
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds nuw i16, ptr %0, i64 %38
  %40 = load <4 x i16>, ptr %39, align 2
  %41 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %40, <4 x i16> %40)
  %42 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %43 = sext <2 x i32> %42 to <2 x i64>
  %44 = shl nsw <2 x i64> %43, splat (i64 7)
  %45 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %46 = sext <2 x i32> %45 to <2 x i64>
  %47 = shl nsw <2 x i64> %46, splat (i64 7)
  %48 = getelementptr inbounds nuw i64, ptr %1, i64 %38
  store <2 x i64> %44, ptr %48, align 8
  %49 = add i32 %4, 18
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds nuw i64, ptr %1, i64 %50
  store <2 x i64> %47, ptr %51, align 8
  %52 = add nsw <2 x i64> %44, %35
  %53 = add nsw <2 x i64> %47, %36
  %54 = add i32 %4, 24
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds nuw i16, ptr %0, i64 %55
  %57 = load <4 x i16>, ptr %56, align 2
  %58 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %57, <4 x i16> %57)
  %59 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %60 = sext <2 x i32> %59 to <2 x i64>
  %61 = shl nsw <2 x i64> %60, splat (i64 7)
  %62 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %63 = sext <2 x i32> %62 to <2 x i64>
  %64 = shl nsw <2 x i64> %63, splat (i64 7)
  %65 = getelementptr inbounds nuw i64, ptr %1, i64 %55
  store <2 x i64> %61, ptr %65, align 8
  %66 = add i32 %4, 26
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds nuw i64, ptr %1, i64 %67
  store <2 x i64> %64, ptr %68, align 8
  %69 = add nsw <2 x i64> %61, %52
  %70 = add nsw <2 x i64> %64, %53
  %71 = add nsw <2 x i64> %69, %70
  %72 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %71)
  %73 = load i64, ptr %2, align 8, !tbaa !53
  %74 = add nsw i64 %73, %72
  store i64 %74, ptr %2, align 8, !tbaa !53
  %75 = load i64, ptr %3, align 8, !tbaa !53
  %76 = add nsw i64 %75, %72
  store i64 %76, ptr %3, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi4EEEvPsPlS2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, i32 noundef %4) #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds nuw i16, ptr %0, i64 %6
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %8, <4 x i16> %8)
  %10 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %11 = sext <2 x i32> %10 to <2 x i64>
  %12 = shl nsw <2 x i64> %11, splat (i64 9)
  %13 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %14 = sext <2 x i32> %13 to <2 x i64>
  %15 = shl nsw <2 x i64> %14, splat (i64 9)
  %16 = getelementptr inbounds nuw i64, ptr %1, i64 %6
  store <2 x i64> %12, ptr %16, align 8
  %17 = add i32 %4, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds nuw i64, ptr %1, i64 %18
  store <2 x i64> %15, ptr %19, align 8
  %20 = add i32 %4, 16
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw i16, ptr %0, i64 %21
  %23 = load <4 x i16>, ptr %22, align 2
  %24 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %23, <4 x i16> %23)
  %25 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %26 = sext <2 x i32> %25 to <2 x i64>
  %27 = shl nsw <2 x i64> %26, splat (i64 9)
  %28 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = sext <2 x i32> %28 to <2 x i64>
  %30 = shl nsw <2 x i64> %29, splat (i64 9)
  %31 = getelementptr inbounds nuw i64, ptr %1, i64 %21
  store <2 x i64> %27, ptr %31, align 8
  %32 = add i32 %4, 18
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds nuw i64, ptr %1, i64 %33
  store <2 x i64> %30, ptr %34, align 8
  %35 = add nsw <2 x i64> %27, %12
  %36 = add nsw <2 x i64> %30, %15
  %37 = add i32 %4, 32
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds nuw i16, ptr %0, i64 %38
  %40 = load <4 x i16>, ptr %39, align 2
  %41 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %40, <4 x i16> %40)
  %42 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %43 = sext <2 x i32> %42 to <2 x i64>
  %44 = shl nsw <2 x i64> %43, splat (i64 9)
  %45 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %46 = sext <2 x i32> %45 to <2 x i64>
  %47 = shl nsw <2 x i64> %46, splat (i64 9)
  %48 = getelementptr inbounds nuw i64, ptr %1, i64 %38
  store <2 x i64> %44, ptr %48, align 8
  %49 = add i32 %4, 34
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds nuw i64, ptr %1, i64 %50
  store <2 x i64> %47, ptr %51, align 8
  %52 = add nsw <2 x i64> %44, %35
  %53 = add nsw <2 x i64> %47, %36
  %54 = add i32 %4, 48
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds nuw i16, ptr %0, i64 %55
  %57 = load <4 x i16>, ptr %56, align 2
  %58 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %57, <4 x i16> %57)
  %59 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %60 = sext <2 x i32> %59 to <2 x i64>
  %61 = shl nsw <2 x i64> %60, splat (i64 9)
  %62 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %63 = sext <2 x i32> %62 to <2 x i64>
  %64 = shl nsw <2 x i64> %63, splat (i64 9)
  %65 = getelementptr inbounds nuw i64, ptr %1, i64 %55
  store <2 x i64> %61, ptr %65, align 8
  %66 = add i32 %4, 50
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds nuw i64, ptr %1, i64 %67
  store <2 x i64> %64, ptr %68, align 8
  %69 = add nsw <2 x i64> %61, %52
  %70 = add nsw <2 x i64> %64, %53
  %71 = add nsw <2 x i64> %69, %70
  %72 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %71)
  %73 = load i64, ptr %2, align 8, !tbaa !53
  %74 = add nsw i64 %73, %72
  store i64 %74, ptr %2, align 8, !tbaa !53
  %75 = load i64, ptr %3, align 8, !tbaa !53
  %76 = add nsw i64 %75, %72
  store i64 %76, ptr %3, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_119nonPsyRdoQuant_neonILi5EEEvPsPlS2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef writeonly captures(none) %1, ptr noundef captures(none) %2, ptr noundef captures(none) %3, i32 noundef %4) #0 {
  %6 = zext i32 %4 to i64
  %7 = getelementptr inbounds nuw i16, ptr %0, i64 %6
  %8 = load <4 x i16>, ptr %7, align 2
  %9 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %8, <4 x i16> %8)
  %10 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %11 = sext <2 x i32> %10 to <2 x i64>
  %12 = shl nsw <2 x i64> %11, splat (i64 11)
  %13 = shufflevector <4 x i32> %9, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %14 = sext <2 x i32> %13 to <2 x i64>
  %15 = shl nsw <2 x i64> %14, splat (i64 11)
  %16 = getelementptr inbounds nuw i64, ptr %1, i64 %6
  store <2 x i64> %12, ptr %16, align 8
  %17 = add i32 %4, 2
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds nuw i64, ptr %1, i64 %18
  store <2 x i64> %15, ptr %19, align 8
  %20 = add i32 %4, 32
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds nuw i16, ptr %0, i64 %21
  %23 = load <4 x i16>, ptr %22, align 2
  %24 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %23, <4 x i16> %23)
  %25 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %26 = sext <2 x i32> %25 to <2 x i64>
  %27 = shl nsw <2 x i64> %26, splat (i64 11)
  %28 = shufflevector <4 x i32> %24, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = sext <2 x i32> %28 to <2 x i64>
  %30 = shl nsw <2 x i64> %29, splat (i64 11)
  %31 = getelementptr inbounds nuw i64, ptr %1, i64 %21
  store <2 x i64> %27, ptr %31, align 8
  %32 = add i32 %4, 34
  %33 = zext i32 %32 to i64
  %34 = getelementptr inbounds nuw i64, ptr %1, i64 %33
  store <2 x i64> %30, ptr %34, align 8
  %35 = add nsw <2 x i64> %27, %12
  %36 = add nsw <2 x i64> %30, %15
  %37 = add i32 %4, 64
  %38 = zext i32 %37 to i64
  %39 = getelementptr inbounds nuw i16, ptr %0, i64 %38
  %40 = load <4 x i16>, ptr %39, align 2
  %41 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %40, <4 x i16> %40)
  %42 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %43 = sext <2 x i32> %42 to <2 x i64>
  %44 = shl nsw <2 x i64> %43, splat (i64 11)
  %45 = shufflevector <4 x i32> %41, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %46 = sext <2 x i32> %45 to <2 x i64>
  %47 = shl nsw <2 x i64> %46, splat (i64 11)
  %48 = getelementptr inbounds nuw i64, ptr %1, i64 %38
  store <2 x i64> %44, ptr %48, align 8
  %49 = add i32 %4, 66
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds nuw i64, ptr %1, i64 %50
  store <2 x i64> %47, ptr %51, align 8
  %52 = add nsw <2 x i64> %44, %35
  %53 = add nsw <2 x i64> %47, %36
  %54 = add i32 %4, 96
  %55 = zext i32 %54 to i64
  %56 = getelementptr inbounds nuw i16, ptr %0, i64 %55
  %57 = load <4 x i16>, ptr %56, align 2
  %58 = tail call noundef <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16> %57, <4 x i16> %57)
  %59 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %60 = sext <2 x i32> %59 to <2 x i64>
  %61 = shl nsw <2 x i64> %60, splat (i64 11)
  %62 = shufflevector <4 x i32> %58, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %63 = sext <2 x i32> %62 to <2 x i64>
  %64 = shl nsw <2 x i64> %63, splat (i64 11)
  %65 = getelementptr inbounds nuw i64, ptr %1, i64 %55
  store <2 x i64> %61, ptr %65, align 8
  %66 = add i32 %4, 98
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds nuw i64, ptr %1, i64 %67
  store <2 x i64> %64, ptr %68, align 8
  %69 = add nsw <2 x i64> %61, %52
  %70 = add nsw <2 x i64> %64, %53
  %71 = add nsw <2 x i64> %69, %70
  %72 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %71)
  %73 = load i64, ptr %2, align 8, !tbaa !53
  %74 = add nsw i64 %73, %72
  store i64 %74, ptr %2, align 8, !tbaa !53
  %75 = load i64, ptr %3, align 8, !tbaa !53
  %76 = add nsw i64 %75, %72
  store i64 %76, ptr %3, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi2EEEvPsS1_PlS2_S2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef readonly captures(none) %5, i32 noundef %6) #0 {
  %8 = load i64, ptr %5, align 8, !tbaa !53
  %9 = trunc i64 %8 to i32
  %10 = insertelement <4 x i32> poison, i32 %9, i64 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> poison, <2 x i32> zeroinitializer
  %12 = zext i32 %6 to i64
  %13 = getelementptr inbounds nuw i16, ptr %0, i64 %12
  %14 = load <4 x i16>, ptr %13, align 2
  %15 = sext <4 x i16> %14 to <4 x i32>
  %16 = getelementptr inbounds nuw i16, ptr %1, i64 %12
  %17 = load <4 x i16>, ptr %16, align 2
  %18 = sext <4 x i16> %17 to <4 x i32>
  %19 = sub nsw <4 x i32> %18, %15
  %20 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %21 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %20, <2 x i32> %20)
  %22 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %23 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %22, <2 x i32> %22)
  %24 = shl <2 x i64> %21, splat (i64 5)
  %25 = shl <2 x i64> %23, splat (i64 5)
  %26 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %27 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %26, <2 x i32> %11)
  %28 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %28, <2 x i32> %11)
  %30 = ashr <2 x i64> %27, splat (i64 11)
  %31 = ashr <2 x i64> %29, splat (i64 11)
  %32 = sub <2 x i64> %24, %30
  %33 = sub <2 x i64> %25, %31
  %34 = getelementptr inbounds nuw i64, ptr %2, i64 %12
  store <2 x i64> %32, ptr %34, align 8
  %35 = add i32 %6, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds nuw i64, ptr %2, i64 %36
  store <2 x i64> %33, ptr %37, align 8
  %38 = add i32 %6, 4
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds nuw i16, ptr %0, i64 %39
  %41 = load <4 x i16>, ptr %40, align 2
  %42 = sext <4 x i16> %41 to <4 x i32>
  %43 = getelementptr inbounds nuw i16, ptr %1, i64 %39
  %44 = load <4 x i16>, ptr %43, align 2
  %45 = sext <4 x i16> %44 to <4 x i32>
  %46 = sub nsw <4 x i32> %45, %42
  %47 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %48 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %47, <2 x i32> %47)
  %49 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %50 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %49, <2 x i32> %49)
  %51 = shl <2 x i64> %48, splat (i64 5)
  %52 = shl <2 x i64> %50, splat (i64 5)
  %53 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %54 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %53, <2 x i32> %11)
  %55 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %56 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %55, <2 x i32> %11)
  %57 = ashr <2 x i64> %54, splat (i64 11)
  %58 = ashr <2 x i64> %56, splat (i64 11)
  %59 = sub <2 x i64> %51, %57
  %60 = sub <2 x i64> %52, %58
  %61 = getelementptr inbounds nuw i64, ptr %2, i64 %39
  store <2 x i64> %59, ptr %61, align 8
  %62 = add i32 %6, 6
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds nuw i64, ptr %2, i64 %63
  store <2 x i64> %60, ptr %64, align 8
  %65 = add <2 x i64> %59, %32
  %66 = add <2 x i64> %60, %33
  %67 = add i32 %6, 8
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds nuw i16, ptr %0, i64 %68
  %70 = load <4 x i16>, ptr %69, align 2
  %71 = sext <4 x i16> %70 to <4 x i32>
  %72 = getelementptr inbounds nuw i16, ptr %1, i64 %68
  %73 = load <4 x i16>, ptr %72, align 2
  %74 = sext <4 x i16> %73 to <4 x i32>
  %75 = sub nsw <4 x i32> %74, %71
  %76 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %77 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %76, <2 x i32> %76)
  %78 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %79 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %78, <2 x i32> %78)
  %80 = shl <2 x i64> %77, splat (i64 5)
  %81 = shl <2 x i64> %79, splat (i64 5)
  %82 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %83 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %82, <2 x i32> %11)
  %84 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %85 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %84, <2 x i32> %11)
  %86 = ashr <2 x i64> %83, splat (i64 11)
  %87 = ashr <2 x i64> %85, splat (i64 11)
  %88 = sub <2 x i64> %80, %86
  %89 = sub <2 x i64> %81, %87
  %90 = getelementptr inbounds nuw i64, ptr %2, i64 %68
  store <2 x i64> %88, ptr %90, align 8
  %91 = add i32 %6, 10
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds nuw i64, ptr %2, i64 %92
  store <2 x i64> %89, ptr %93, align 8
  %94 = add <2 x i64> %88, %65
  %95 = add <2 x i64> %89, %66
  %96 = add i32 %6, 12
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds nuw i16, ptr %0, i64 %97
  %99 = load <4 x i16>, ptr %98, align 2
  %100 = sext <4 x i16> %99 to <4 x i32>
  %101 = getelementptr inbounds nuw i16, ptr %1, i64 %97
  %102 = load <4 x i16>, ptr %101, align 2
  %103 = sext <4 x i16> %102 to <4 x i32>
  %104 = sub nsw <4 x i32> %103, %100
  %105 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %106 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %105, <2 x i32> %105)
  %107 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %108 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %107, <2 x i32> %107)
  %109 = shl <2 x i64> %106, splat (i64 5)
  %110 = shl <2 x i64> %108, splat (i64 5)
  %111 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %112 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %111, <2 x i32> %11)
  %113 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %114 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %113, <2 x i32> %11)
  %115 = ashr <2 x i64> %112, splat (i64 11)
  %116 = ashr <2 x i64> %114, splat (i64 11)
  %117 = sub <2 x i64> %109, %115
  %118 = sub <2 x i64> %110, %116
  %119 = getelementptr inbounds nuw i64, ptr %2, i64 %97
  store <2 x i64> %117, ptr %119, align 8
  %120 = add i32 %6, 14
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds nuw i64, ptr %2, i64 %121
  store <2 x i64> %118, ptr %122, align 8
  %123 = add <2 x i64> %117, %94
  %124 = add <2 x i64> %118, %95
  %125 = add <2 x i64> %123, %124
  %126 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %125)
  %127 = load i64, ptr %3, align 8, !tbaa !53
  %128 = add nsw i64 %127, %126
  store i64 %128, ptr %3, align 8, !tbaa !53
  %129 = load i64, ptr %4, align 8, !tbaa !53
  %130 = add nsw i64 %129, %126
  store i64 %130, ptr %4, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi3EEEvPsS1_PlS2_S2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef readonly captures(none) %5, i32 noundef %6) #0 {
  %8 = load i64, ptr %5, align 8, !tbaa !53
  %9 = trunc i64 %8 to i32
  %10 = insertelement <4 x i32> poison, i32 %9, i64 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> poison, <2 x i32> zeroinitializer
  %12 = zext i32 %6 to i64
  %13 = getelementptr inbounds nuw i16, ptr %0, i64 %12
  %14 = load <4 x i16>, ptr %13, align 2
  %15 = sext <4 x i16> %14 to <4 x i32>
  %16 = getelementptr inbounds nuw i16, ptr %1, i64 %12
  %17 = load <4 x i16>, ptr %16, align 2
  %18 = sext <4 x i16> %17 to <4 x i32>
  %19 = sub nsw <4 x i32> %18, %15
  %20 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %21 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %20, <2 x i32> %20)
  %22 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %23 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %22, <2 x i32> %22)
  %24 = shl <2 x i64> %21, splat (i64 7)
  %25 = shl <2 x i64> %23, splat (i64 7)
  %26 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %27 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %26, <2 x i32> %11)
  %28 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %28, <2 x i32> %11)
  %30 = ashr <2 x i64> %27, splat (i64 9)
  %31 = ashr <2 x i64> %29, splat (i64 9)
  %32 = sub <2 x i64> %24, %30
  %33 = sub <2 x i64> %25, %31
  %34 = getelementptr inbounds nuw i64, ptr %2, i64 %12
  store <2 x i64> %32, ptr %34, align 8
  %35 = add i32 %6, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds nuw i64, ptr %2, i64 %36
  store <2 x i64> %33, ptr %37, align 8
  %38 = add i32 %6, 8
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds nuw i16, ptr %0, i64 %39
  %41 = load <4 x i16>, ptr %40, align 2
  %42 = sext <4 x i16> %41 to <4 x i32>
  %43 = getelementptr inbounds nuw i16, ptr %1, i64 %39
  %44 = load <4 x i16>, ptr %43, align 2
  %45 = sext <4 x i16> %44 to <4 x i32>
  %46 = sub nsw <4 x i32> %45, %42
  %47 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %48 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %47, <2 x i32> %47)
  %49 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %50 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %49, <2 x i32> %49)
  %51 = shl <2 x i64> %48, splat (i64 7)
  %52 = shl <2 x i64> %50, splat (i64 7)
  %53 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %54 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %53, <2 x i32> %11)
  %55 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %56 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %55, <2 x i32> %11)
  %57 = ashr <2 x i64> %54, splat (i64 9)
  %58 = ashr <2 x i64> %56, splat (i64 9)
  %59 = sub <2 x i64> %51, %57
  %60 = sub <2 x i64> %52, %58
  %61 = getelementptr inbounds nuw i64, ptr %2, i64 %39
  store <2 x i64> %59, ptr %61, align 8
  %62 = add i32 %6, 10
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds nuw i64, ptr %2, i64 %63
  store <2 x i64> %60, ptr %64, align 8
  %65 = add <2 x i64> %59, %32
  %66 = add <2 x i64> %60, %33
  %67 = add i32 %6, 16
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds nuw i16, ptr %0, i64 %68
  %70 = load <4 x i16>, ptr %69, align 2
  %71 = sext <4 x i16> %70 to <4 x i32>
  %72 = getelementptr inbounds nuw i16, ptr %1, i64 %68
  %73 = load <4 x i16>, ptr %72, align 2
  %74 = sext <4 x i16> %73 to <4 x i32>
  %75 = sub nsw <4 x i32> %74, %71
  %76 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %77 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %76, <2 x i32> %76)
  %78 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %79 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %78, <2 x i32> %78)
  %80 = shl <2 x i64> %77, splat (i64 7)
  %81 = shl <2 x i64> %79, splat (i64 7)
  %82 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %83 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %82, <2 x i32> %11)
  %84 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %85 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %84, <2 x i32> %11)
  %86 = ashr <2 x i64> %83, splat (i64 9)
  %87 = ashr <2 x i64> %85, splat (i64 9)
  %88 = sub <2 x i64> %80, %86
  %89 = sub <2 x i64> %81, %87
  %90 = getelementptr inbounds nuw i64, ptr %2, i64 %68
  store <2 x i64> %88, ptr %90, align 8
  %91 = add i32 %6, 18
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds nuw i64, ptr %2, i64 %92
  store <2 x i64> %89, ptr %93, align 8
  %94 = add <2 x i64> %88, %65
  %95 = add <2 x i64> %89, %66
  %96 = add i32 %6, 24
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds nuw i16, ptr %0, i64 %97
  %99 = load <4 x i16>, ptr %98, align 2
  %100 = sext <4 x i16> %99 to <4 x i32>
  %101 = getelementptr inbounds nuw i16, ptr %1, i64 %97
  %102 = load <4 x i16>, ptr %101, align 2
  %103 = sext <4 x i16> %102 to <4 x i32>
  %104 = sub nsw <4 x i32> %103, %100
  %105 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %106 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %105, <2 x i32> %105)
  %107 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %108 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %107, <2 x i32> %107)
  %109 = shl <2 x i64> %106, splat (i64 7)
  %110 = shl <2 x i64> %108, splat (i64 7)
  %111 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %112 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %111, <2 x i32> %11)
  %113 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %114 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %113, <2 x i32> %11)
  %115 = ashr <2 x i64> %112, splat (i64 9)
  %116 = ashr <2 x i64> %114, splat (i64 9)
  %117 = sub <2 x i64> %109, %115
  %118 = sub <2 x i64> %110, %116
  %119 = getelementptr inbounds nuw i64, ptr %2, i64 %97
  store <2 x i64> %117, ptr %119, align 8
  %120 = add i32 %6, 26
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds nuw i64, ptr %2, i64 %121
  store <2 x i64> %118, ptr %122, align 8
  %123 = add <2 x i64> %117, %94
  %124 = add <2 x i64> %118, %95
  %125 = add <2 x i64> %123, %124
  %126 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %125)
  %127 = load i64, ptr %3, align 8, !tbaa !53
  %128 = add nsw i64 %127, %126
  store i64 %128, ptr %3, align 8, !tbaa !53
  %129 = load i64, ptr %4, align 8, !tbaa !53
  %130 = add nsw i64 %129, %126
  store i64 %130, ptr %4, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi4EEEvPsS1_PlS2_S2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef readonly captures(none) %5, i32 noundef %6) #0 {
  %8 = load i64, ptr %5, align 8, !tbaa !53
  %9 = trunc i64 %8 to i32
  %10 = insertelement <4 x i32> poison, i32 %9, i64 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> poison, <2 x i32> zeroinitializer
  %12 = zext i32 %6 to i64
  %13 = getelementptr inbounds nuw i16, ptr %0, i64 %12
  %14 = load <4 x i16>, ptr %13, align 2
  %15 = sext <4 x i16> %14 to <4 x i32>
  %16 = getelementptr inbounds nuw i16, ptr %1, i64 %12
  %17 = load <4 x i16>, ptr %16, align 2
  %18 = sext <4 x i16> %17 to <4 x i32>
  %19 = sub nsw <4 x i32> %18, %15
  %20 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %21 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %20, <2 x i32> %20)
  %22 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %23 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %22, <2 x i32> %22)
  %24 = shl <2 x i64> %21, splat (i64 9)
  %25 = shl <2 x i64> %23, splat (i64 9)
  %26 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %27 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %26, <2 x i32> %11)
  %28 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %28, <2 x i32> %11)
  %30 = ashr <2 x i64> %27, splat (i64 7)
  %31 = ashr <2 x i64> %29, splat (i64 7)
  %32 = sub <2 x i64> %24, %30
  %33 = sub <2 x i64> %25, %31
  %34 = getelementptr inbounds nuw i64, ptr %2, i64 %12
  store <2 x i64> %32, ptr %34, align 8
  %35 = add i32 %6, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds nuw i64, ptr %2, i64 %36
  store <2 x i64> %33, ptr %37, align 8
  %38 = add i32 %6, 16
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds nuw i16, ptr %0, i64 %39
  %41 = load <4 x i16>, ptr %40, align 2
  %42 = sext <4 x i16> %41 to <4 x i32>
  %43 = getelementptr inbounds nuw i16, ptr %1, i64 %39
  %44 = load <4 x i16>, ptr %43, align 2
  %45 = sext <4 x i16> %44 to <4 x i32>
  %46 = sub nsw <4 x i32> %45, %42
  %47 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %48 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %47, <2 x i32> %47)
  %49 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %50 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %49, <2 x i32> %49)
  %51 = shl <2 x i64> %48, splat (i64 9)
  %52 = shl <2 x i64> %50, splat (i64 9)
  %53 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %54 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %53, <2 x i32> %11)
  %55 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %56 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %55, <2 x i32> %11)
  %57 = ashr <2 x i64> %54, splat (i64 7)
  %58 = ashr <2 x i64> %56, splat (i64 7)
  %59 = sub <2 x i64> %51, %57
  %60 = sub <2 x i64> %52, %58
  %61 = getelementptr inbounds nuw i64, ptr %2, i64 %39
  store <2 x i64> %59, ptr %61, align 8
  %62 = add i32 %6, 18
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds nuw i64, ptr %2, i64 %63
  store <2 x i64> %60, ptr %64, align 8
  %65 = add <2 x i64> %59, %32
  %66 = add <2 x i64> %60, %33
  %67 = add i32 %6, 32
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds nuw i16, ptr %0, i64 %68
  %70 = load <4 x i16>, ptr %69, align 2
  %71 = sext <4 x i16> %70 to <4 x i32>
  %72 = getelementptr inbounds nuw i16, ptr %1, i64 %68
  %73 = load <4 x i16>, ptr %72, align 2
  %74 = sext <4 x i16> %73 to <4 x i32>
  %75 = sub nsw <4 x i32> %74, %71
  %76 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %77 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %76, <2 x i32> %76)
  %78 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %79 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %78, <2 x i32> %78)
  %80 = shl <2 x i64> %77, splat (i64 9)
  %81 = shl <2 x i64> %79, splat (i64 9)
  %82 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %83 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %82, <2 x i32> %11)
  %84 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %85 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %84, <2 x i32> %11)
  %86 = ashr <2 x i64> %83, splat (i64 7)
  %87 = ashr <2 x i64> %85, splat (i64 7)
  %88 = sub <2 x i64> %80, %86
  %89 = sub <2 x i64> %81, %87
  %90 = getelementptr inbounds nuw i64, ptr %2, i64 %68
  store <2 x i64> %88, ptr %90, align 8
  %91 = add i32 %6, 34
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds nuw i64, ptr %2, i64 %92
  store <2 x i64> %89, ptr %93, align 8
  %94 = add <2 x i64> %88, %65
  %95 = add <2 x i64> %89, %66
  %96 = add i32 %6, 48
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds nuw i16, ptr %0, i64 %97
  %99 = load <4 x i16>, ptr %98, align 2
  %100 = sext <4 x i16> %99 to <4 x i32>
  %101 = getelementptr inbounds nuw i16, ptr %1, i64 %97
  %102 = load <4 x i16>, ptr %101, align 2
  %103 = sext <4 x i16> %102 to <4 x i32>
  %104 = sub nsw <4 x i32> %103, %100
  %105 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %106 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %105, <2 x i32> %105)
  %107 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %108 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %107, <2 x i32> %107)
  %109 = shl <2 x i64> %106, splat (i64 9)
  %110 = shl <2 x i64> %108, splat (i64 9)
  %111 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %112 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %111, <2 x i32> %11)
  %113 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %114 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %113, <2 x i32> %11)
  %115 = ashr <2 x i64> %112, splat (i64 7)
  %116 = ashr <2 x i64> %114, splat (i64 7)
  %117 = sub <2 x i64> %109, %115
  %118 = sub <2 x i64> %110, %116
  %119 = getelementptr inbounds nuw i64, ptr %2, i64 %97
  store <2 x i64> %117, ptr %119, align 8
  %120 = add i32 %6, 50
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds nuw i64, ptr %2, i64 %121
  store <2 x i64> %118, ptr %122, align 8
  %123 = add <2 x i64> %117, %94
  %124 = add <2 x i64> %118, %95
  %125 = add <2 x i64> %123, %124
  %126 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %125)
  %127 = load i64, ptr %3, align 8, !tbaa !53
  %128 = add nsw i64 %127, %126
  store i64 %128, ptr %3, align 8, !tbaa !53
  %129 = load i64, ptr %4, align 8, !tbaa !53
  %130 = add nsw i64 %129, %126
  store i64 %130, ptr %4, align 8, !tbaa !53
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal void @_ZN12_GLOBAL__N_116psyRdoQuant_neonILi5EEEvPsS1_PlS2_S2_S2_j(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef captures(none) %3, ptr noundef captures(none) %4, ptr noundef readonly captures(none) %5, i32 noundef %6) #0 {
  %8 = load i64, ptr %5, align 8, !tbaa !53
  %9 = trunc i64 %8 to i32
  %10 = insertelement <4 x i32> poison, i32 %9, i64 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> poison, <2 x i32> zeroinitializer
  %12 = zext i32 %6 to i64
  %13 = getelementptr inbounds nuw i16, ptr %0, i64 %12
  %14 = load <4 x i16>, ptr %13, align 2
  %15 = sext <4 x i16> %14 to <4 x i32>
  %16 = getelementptr inbounds nuw i16, ptr %1, i64 %12
  %17 = load <4 x i16>, ptr %16, align 2
  %18 = sext <4 x i16> %17 to <4 x i32>
  %19 = sub nsw <4 x i32> %18, %15
  %20 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %21 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %20, <2 x i32> %20)
  %22 = shufflevector <4 x i32> %15, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %23 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %22, <2 x i32> %22)
  %24 = shl <2 x i64> %21, splat (i64 11)
  %25 = shl <2 x i64> %23, splat (i64 11)
  %26 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %27 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %26, <2 x i32> %11)
  %28 = shufflevector <4 x i32> %19, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %29 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %28, <2 x i32> %11)
  %30 = ashr <2 x i64> %27, splat (i64 5)
  %31 = ashr <2 x i64> %29, splat (i64 5)
  %32 = sub <2 x i64> %24, %30
  %33 = sub <2 x i64> %25, %31
  %34 = getelementptr inbounds nuw i64, ptr %2, i64 %12
  store <2 x i64> %32, ptr %34, align 8
  %35 = add i32 %6, 2
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds nuw i64, ptr %2, i64 %36
  store <2 x i64> %33, ptr %37, align 8
  %38 = add i32 %6, 32
  %39 = zext i32 %38 to i64
  %40 = getelementptr inbounds nuw i16, ptr %0, i64 %39
  %41 = load <4 x i16>, ptr %40, align 2
  %42 = sext <4 x i16> %41 to <4 x i32>
  %43 = getelementptr inbounds nuw i16, ptr %1, i64 %39
  %44 = load <4 x i16>, ptr %43, align 2
  %45 = sext <4 x i16> %44 to <4 x i32>
  %46 = sub nsw <4 x i32> %45, %42
  %47 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %48 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %47, <2 x i32> %47)
  %49 = shufflevector <4 x i32> %42, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %50 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %49, <2 x i32> %49)
  %51 = shl <2 x i64> %48, splat (i64 11)
  %52 = shl <2 x i64> %50, splat (i64 11)
  %53 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %54 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %53, <2 x i32> %11)
  %55 = shufflevector <4 x i32> %46, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %56 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %55, <2 x i32> %11)
  %57 = ashr <2 x i64> %54, splat (i64 5)
  %58 = ashr <2 x i64> %56, splat (i64 5)
  %59 = sub <2 x i64> %51, %57
  %60 = sub <2 x i64> %52, %58
  %61 = getelementptr inbounds nuw i64, ptr %2, i64 %39
  store <2 x i64> %59, ptr %61, align 8
  %62 = add i32 %6, 34
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds nuw i64, ptr %2, i64 %63
  store <2 x i64> %60, ptr %64, align 8
  %65 = add <2 x i64> %59, %32
  %66 = add <2 x i64> %60, %33
  %67 = add i32 %6, 64
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds nuw i16, ptr %0, i64 %68
  %70 = load <4 x i16>, ptr %69, align 2
  %71 = sext <4 x i16> %70 to <4 x i32>
  %72 = getelementptr inbounds nuw i16, ptr %1, i64 %68
  %73 = load <4 x i16>, ptr %72, align 2
  %74 = sext <4 x i16> %73 to <4 x i32>
  %75 = sub nsw <4 x i32> %74, %71
  %76 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %77 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %76, <2 x i32> %76)
  %78 = shufflevector <4 x i32> %71, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %79 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %78, <2 x i32> %78)
  %80 = shl <2 x i64> %77, splat (i64 11)
  %81 = shl <2 x i64> %79, splat (i64 11)
  %82 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %83 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %82, <2 x i32> %11)
  %84 = shufflevector <4 x i32> %75, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %85 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %84, <2 x i32> %11)
  %86 = ashr <2 x i64> %83, splat (i64 5)
  %87 = ashr <2 x i64> %85, splat (i64 5)
  %88 = sub <2 x i64> %80, %86
  %89 = sub <2 x i64> %81, %87
  %90 = getelementptr inbounds nuw i64, ptr %2, i64 %68
  store <2 x i64> %88, ptr %90, align 8
  %91 = add i32 %6, 66
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds nuw i64, ptr %2, i64 %92
  store <2 x i64> %89, ptr %93, align 8
  %94 = add <2 x i64> %88, %65
  %95 = add <2 x i64> %89, %66
  %96 = add i32 %6, 96
  %97 = zext i32 %96 to i64
  %98 = getelementptr inbounds nuw i16, ptr %0, i64 %97
  %99 = load <4 x i16>, ptr %98, align 2
  %100 = sext <4 x i16> %99 to <4 x i32>
  %101 = getelementptr inbounds nuw i16, ptr %1, i64 %97
  %102 = load <4 x i16>, ptr %101, align 2
  %103 = sext <4 x i16> %102 to <4 x i32>
  %104 = sub nsw <4 x i32> %103, %100
  %105 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %106 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %105, <2 x i32> %105)
  %107 = shufflevector <4 x i32> %100, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %108 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %107, <2 x i32> %107)
  %109 = shl <2 x i64> %106, splat (i64 11)
  %110 = shl <2 x i64> %108, splat (i64 11)
  %111 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 0, i32 1>
  %112 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %111, <2 x i32> %11)
  %113 = shufflevector <4 x i32> %104, <4 x i32> poison, <2 x i32> <i32 2, i32 3>
  %114 = tail call noundef <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32> %113, <2 x i32> %11)
  %115 = ashr <2 x i64> %112, splat (i64 5)
  %116 = ashr <2 x i64> %114, splat (i64 5)
  %117 = sub <2 x i64> %109, %115
  %118 = sub <2 x i64> %110, %116
  %119 = getelementptr inbounds nuw i64, ptr %2, i64 %97
  store <2 x i64> %117, ptr %119, align 8
  %120 = add i32 %6, 98
  %121 = zext i32 %120 to i64
  %122 = getelementptr inbounds nuw i64, ptr %2, i64 %121
  store <2 x i64> %118, ptr %122, align 8
  %123 = add <2 x i64> %117, %94
  %124 = add <2 x i64> %118, %95
  %125 = add <2 x i64> %123, %124
  %126 = tail call noundef i64 @llvm.vector.reduce.add.v2i64(<2 x i64> %125)
  %127 = load i64, ptr %3, align 8, !tbaa !53
  %128 = add nsw i64 %127, %126
  store i64 %128, ptr %3, align 8, !tbaa !53
  %129 = load i64, ptr %4, align 8, !tbaa !53
  %130 = add nsw i64 %129, %126
  store i64 %130, ptr %4, align 8, !tbaa !53
  ret void
}

declare void @x265_dct16_neon(ptr noundef, ptr noundef, i64 noundef) #6

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_118count_nonzero_neonILi4EEEiPKs(ptr noundef readonly captures(none) %0) #3 {
  %2 = load <8 x i16>, ptr %0, align 2
  %3 = icmp ne <8 x i16> %2, zeroinitializer
  %4 = sext <8 x i1> %3 to <8 x i16>
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %6 = load <8 x i16>, ptr %5, align 2
  %7 = icmp ne <8 x i16> %6, zeroinitializer
  %8 = sext <8 x i1> %7 to <8 x i16>
  %9 = add nsw <8 x i16> %4, %8
  %10 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %9)
  %11 = sext i16 %10 to i32
  %12 = sub nsw i32 0, %11
  ret i32 %12
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_118count_nonzero_neonILi8EEEiPKs(ptr noundef readonly captures(none) %0) #3 {
  %2 = load <8 x i16>, ptr %0, align 2
  %3 = icmp ne <8 x i16> %2, zeroinitializer
  %4 = sext <8 x i1> %3 to <8 x i16>
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %6 = load <8 x i16>, ptr %5, align 2
  %7 = icmp ne <8 x i16> %6, zeroinitializer
  %8 = sext <8 x i1> %7 to <8 x i16>
  %9 = add nsw <8 x i16> %4, %8
  %10 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %11 = load <8 x i16>, ptr %10, align 2
  %12 = icmp ne <8 x i16> %11, zeroinitializer
  %13 = sext <8 x i1> %12 to <8 x i16>
  %14 = add nsw <8 x i16> %9, %13
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 48
  %16 = load <8 x i16>, ptr %15, align 2
  %17 = icmp ne <8 x i16> %16, zeroinitializer
  %18 = sext <8 x i1> %17 to <8 x i16>
  %19 = add nsw <8 x i16> %14, %18
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 64
  %21 = load <8 x i16>, ptr %20, align 2
  %22 = icmp ne <8 x i16> %21, zeroinitializer
  %23 = sext <8 x i1> %22 to <8 x i16>
  %24 = add nsw <8 x i16> %19, %23
  %25 = getelementptr inbounds nuw i8, ptr %0, i64 80
  %26 = load <8 x i16>, ptr %25, align 2
  %27 = icmp ne <8 x i16> %26, zeroinitializer
  %28 = sext <8 x i1> %27 to <8 x i16>
  %29 = add nsw <8 x i16> %24, %28
  %30 = getelementptr inbounds nuw i8, ptr %0, i64 96
  %31 = load <8 x i16>, ptr %30, align 2
  %32 = icmp ne <8 x i16> %31, zeroinitializer
  %33 = sext <8 x i1> %32 to <8 x i16>
  %34 = add nsw <8 x i16> %29, %33
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 112
  %36 = load <8 x i16>, ptr %35, align 2
  %37 = icmp ne <8 x i16> %36, zeroinitializer
  %38 = sext <8 x i1> %37 to <8 x i16>
  %39 = add nsw <8 x i16> %34, %38
  %40 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %39)
  %41 = sext i16 %40 to i32
  %42 = sub nsw i32 0, %41
  ret i32 %42
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_118count_nonzero_neonILi16EEEiPKs(ptr noundef readonly captures(none) %0) #3 {
  br label %2

2:                                                ; preds = %1, %2
  %3 = phi i64 [ 0, %1 ], [ %5, %2 ]
  %4 = phi <8 x i16> [ zeroinitializer, %1 ], [ %10, %2 ]
  %5 = add nuw nsw i64 %3, 8
  %6 = getelementptr inbounds nuw i16, ptr %0, i64 %3
  %7 = load <8 x i16>, ptr %6, align 2
  %8 = icmp ne <8 x i16> %7, zeroinitializer
  %9 = sext <8 x i1> %8 to <8 x i16>
  %10 = add <8 x i16> %4, %9
  %11 = icmp samesign ult i64 %3, 241
  br i1 %11, label %2, label %12, !llvm.loop !55

12:                                               ; preds = %2
  %13 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %10)
  %14 = sext i16 %13 to i32
  %15 = sub nsw i32 0, %14
  ret i32 %15
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_118count_nonzero_neonILi32EEEiPKs(ptr noundef readonly captures(none) %0) #3 {
  br label %2

2:                                                ; preds = %1, %2
  %3 = phi i64 [ 0, %1 ], [ %5, %2 ]
  %4 = phi <8 x i16> [ zeroinitializer, %1 ], [ %10, %2 ]
  %5 = add nuw nsw i64 %3, 8
  %6 = getelementptr inbounds nuw i16, ptr %0, i64 %3
  %7 = load <8 x i16>, ptr %6, align 2
  %8 = icmp ne <8 x i16> %7, zeroinitializer
  %9 = sext <8 x i1> %8 to <8 x i16>
  %10 = add <8 x i16> %4, %9
  %11 = icmp samesign ult i64 %3, 1009
  br i1 %11, label %2, label %12, !llvm.loop !56

12:                                               ; preds = %2
  %13 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %10)
  %14 = sext i16 %13 to i32
  %15 = sub nsw i32 0, %14
  ret i32 %15
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal noundef range(i32 0, 17) i32 @_ZN12_GLOBAL__N_115copy_count_neonILi4EEEjPsPKsl(ptr noundef writeonly captures(none) initializes((0, 32)) %0, ptr noundef readonly captures(none) %1, i64 noundef %2) #0 {
  %4 = getelementptr inbounds nuw i8, ptr %1, i64 2
  %5 = getelementptr inbounds nuw i8, ptr %0, i64 2
  %6 = getelementptr inbounds nuw i8, ptr %1, i64 4
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %8 = getelementptr inbounds nuw i8, ptr %1, i64 6
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 6
  %10 = getelementptr inbounds i16, ptr %1, i64 %2
  %11 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 2
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 10
  %14 = getelementptr inbounds nuw i8, ptr %10, i64 4
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 12
  %16 = getelementptr inbounds nuw i8, ptr %10, i64 6
  %17 = getelementptr inbounds nuw i8, ptr %0, i64 14
  %18 = getelementptr inbounds i16, ptr %10, i64 %2
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 2
  %21 = getelementptr inbounds nuw i8, ptr %0, i64 18
  %22 = getelementptr inbounds nuw i8, ptr %18, i64 4
  %23 = getelementptr inbounds nuw i8, ptr %0, i64 20
  %24 = getelementptr inbounds nuw i8, ptr %18, i64 6
  %25 = getelementptr inbounds nuw i8, ptr %0, i64 22
  %26 = getelementptr inbounds i16, ptr %18, i64 %2
  %27 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 2
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 26
  %30 = getelementptr inbounds nuw i8, ptr %26, i64 4
  %31 = getelementptr inbounds nuw i8, ptr %0, i64 28
  %32 = getelementptr inbounds nuw i8, ptr %26, i64 6
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 30
  %34 = load i16, ptr %1, align 2, !tbaa !36
  store i16 %34, ptr %0, align 2, !tbaa !36
  %35 = load i16, ptr %4, align 2, !tbaa !36
  store i16 %35, ptr %5, align 2, !tbaa !36
  %36 = load i16, ptr %6, align 2, !tbaa !36
  store i16 %36, ptr %7, align 2, !tbaa !36
  %37 = load i16, ptr %8, align 2, !tbaa !36
  store i16 %37, ptr %9, align 2, !tbaa !36
  %38 = load i16, ptr %10, align 2, !tbaa !36
  store i16 %38, ptr %11, align 2, !tbaa !36
  %39 = load i16, ptr %12, align 2, !tbaa !36
  store i16 %39, ptr %13, align 2, !tbaa !36
  %40 = load i16, ptr %14, align 2, !tbaa !36
  store i16 %40, ptr %15, align 2, !tbaa !36
  %41 = load i16, ptr %16, align 2, !tbaa !36
  store i16 %41, ptr %17, align 2, !tbaa !36
  %42 = load i16, ptr %18, align 2, !tbaa !36
  store i16 %42, ptr %19, align 2, !tbaa !36
  %43 = load i16, ptr %20, align 2, !tbaa !36
  store i16 %43, ptr %21, align 2, !tbaa !36
  %44 = load i16, ptr %22, align 2, !tbaa !36
  store i16 %44, ptr %23, align 2, !tbaa !36
  %45 = load i16, ptr %24, align 2, !tbaa !36
  store i16 %45, ptr %25, align 2, !tbaa !36
  %46 = load i16, ptr %26, align 2, !tbaa !36
  store i16 %46, ptr %27, align 2, !tbaa !36
  %47 = load i16, ptr %28, align 2, !tbaa !36
  store i16 %47, ptr %29, align 2, !tbaa !36
  %48 = load i16, ptr %30, align 2, !tbaa !36
  store i16 %48, ptr %31, align 2, !tbaa !36
  %49 = load i16, ptr %32, align 2, !tbaa !36
  %50 = insertelement <16 x i16> poison, i16 %34, i64 0
  %51 = insertelement <16 x i16> %50, i16 %35, i64 1
  %52 = insertelement <16 x i16> %51, i16 %36, i64 2
  %53 = insertelement <16 x i16> %52, i16 %37, i64 3
  %54 = insertelement <16 x i16> %53, i16 %38, i64 4
  %55 = insertelement <16 x i16> %54, i16 %39, i64 5
  %56 = insertelement <16 x i16> %55, i16 %40, i64 6
  %57 = insertelement <16 x i16> %56, i16 %41, i64 7
  %58 = insertelement <16 x i16> %57, i16 %42, i64 8
  %59 = insertelement <16 x i16> %58, i16 %43, i64 9
  %60 = insertelement <16 x i16> %59, i16 %44, i64 10
  %61 = insertelement <16 x i16> %60, i16 %45, i64 11
  %62 = insertelement <16 x i16> %61, i16 %46, i64 12
  %63 = insertelement <16 x i16> %62, i16 %47, i64 13
  %64 = insertelement <16 x i16> %63, i16 %48, i64 14
  %65 = insertelement <16 x i16> %64, i16 %49, i64 15
  %66 = icmp ne <16 x i16> %65, zeroinitializer
  store i16 %49, ptr %33, align 2, !tbaa !36
  %67 = bitcast <16 x i1> %66 to i16
  %68 = tail call range(i16 0, 17) i16 @llvm.ctpop.i16(i16 %67)
  %69 = zext nneg i16 %68 to i32
  ret i32 %69
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_115copy_count_neonILi8EEEjPsPKsl(ptr noundef writeonly captures(none) initializes((0, 128)) %0, ptr noundef readonly captures(none) %1, i64 noundef %2) #0 {
  %4 = load <8 x i16>, ptr %1, align 2
  store <8 x i16> %4, ptr %0, align 2
  %5 = icmp ne <8 x i16> %4, zeroinitializer
  %6 = sext <8 x i1> %5 to <8 x i16>
  %7 = getelementptr inbounds i16, ptr %1, i64 %2
  %8 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %9 = load <8 x i16>, ptr %7, align 2
  store <8 x i16> %9, ptr %8, align 2
  %10 = icmp ne <8 x i16> %9, zeroinitializer
  %11 = sext <8 x i1> %10 to <8 x i16>
  %12 = add nsw <8 x i16> %6, %11
  %13 = getelementptr inbounds i16, ptr %7, i64 %2
  %14 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %15 = load <8 x i16>, ptr %13, align 2
  store <8 x i16> %15, ptr %14, align 2
  %16 = icmp ne <8 x i16> %15, zeroinitializer
  %17 = sext <8 x i1> %16 to <8 x i16>
  %18 = add nsw <8 x i16> %12, %17
  %19 = getelementptr inbounds i16, ptr %13, i64 %2
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 48
  %21 = load <8 x i16>, ptr %19, align 2
  store <8 x i16> %21, ptr %20, align 2
  %22 = icmp ne <8 x i16> %21, zeroinitializer
  %23 = sext <8 x i1> %22 to <8 x i16>
  %24 = add nsw <8 x i16> %18, %23
  %25 = getelementptr inbounds i16, ptr %19, i64 %2
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 64
  %27 = load <8 x i16>, ptr %25, align 2
  store <8 x i16> %27, ptr %26, align 2
  %28 = icmp ne <8 x i16> %27, zeroinitializer
  %29 = sext <8 x i1> %28 to <8 x i16>
  %30 = add nsw <8 x i16> %24, %29
  %31 = getelementptr inbounds i16, ptr %25, i64 %2
  %32 = getelementptr inbounds nuw i8, ptr %0, i64 80
  %33 = load <8 x i16>, ptr %31, align 2
  store <8 x i16> %33, ptr %32, align 2
  %34 = icmp ne <8 x i16> %33, zeroinitializer
  %35 = sext <8 x i1> %34 to <8 x i16>
  %36 = add nsw <8 x i16> %30, %35
  %37 = getelementptr inbounds i16, ptr %31, i64 %2
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 96
  %39 = load <8 x i16>, ptr %37, align 2
  store <8 x i16> %39, ptr %38, align 2
  %40 = icmp ne <8 x i16> %39, zeroinitializer
  %41 = sext <8 x i1> %40 to <8 x i16>
  %42 = add nsw <8 x i16> %36, %41
  %43 = getelementptr inbounds i16, ptr %37, i64 %2
  %44 = getelementptr inbounds nuw i8, ptr %0, i64 112
  %45 = load <8 x i16>, ptr %43, align 2
  store <8 x i16> %45, ptr %44, align 2
  %46 = icmp ne <8 x i16> %45, zeroinitializer
  %47 = sext <8 x i1> %46 to <8 x i16>
  %48 = add nsw <8 x i16> %42, %47
  %49 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %48)
  %50 = sext i16 %49 to i32
  %51 = sub nsw i32 0, %50
  ret i32 %51
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_115copy_count_neonILi16EEEjPsPKsl(ptr noundef writeonly captures(none) %0, ptr noundef readonly captures(none) %1, i64 noundef %2) #2 {
  br label %8

4:                                                ; preds = %8
  %5 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %22)
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7

8:                                                ; preds = %8, %3
  %9 = phi ptr [ %0, %3 ], [ %24, %8 ]
  %10 = phi ptr [ %1, %3 ], [ %23, %8 ]
  %11 = phi <8 x i16> [ zeroinitializer, %3 ], [ %22, %8 ]
  %12 = phi i32 [ 0, %3 ], [ %25, %8 ]
  %13 = load <8 x i16>, ptr %10, align 2
  store <8 x i16> %13, ptr %9, align 2
  %14 = icmp ne <8 x i16> %13, zeroinitializer
  %15 = sext <8 x i1> %14 to <8 x i16>
  %16 = add <8 x i16> %11, %15
  %17 = getelementptr inbounds nuw i8, ptr %10, i64 16
  %18 = load <8 x i16>, ptr %17, align 2
  %19 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store <8 x i16> %18, ptr %19, align 2
  %20 = icmp ne <8 x i16> %18, zeroinitializer
  %21 = sext <8 x i1> %20 to <8 x i16>
  %22 = add <8 x i16> %16, %21
  %23 = getelementptr inbounds i16, ptr %10, i64 %2
  %24 = getelementptr inbounds nuw i8, ptr %9, i64 32
  %25 = add nuw nsw i32 %12, 1
  %26 = icmp eq i32 %25, 16
  br i1 %26, label %4, label %8, !llvm.loop !57
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define internal noundef range(i32 -32767, 32769) i32 @_ZN12_GLOBAL__N_115copy_count_neonILi32EEEjPsPKsl(ptr noundef writeonly captures(none) %0, ptr noundef readonly captures(none) %1, i64 noundef %2) #2 {
  br label %8

4:                                                ; preds = %8
  %5 = tail call noundef i16 @llvm.vector.reduce.add.v8i16(<8 x i16> %34)
  %6 = sext i16 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7

8:                                                ; preds = %8, %3
  %9 = phi ptr [ %0, %3 ], [ %36, %8 ]
  %10 = phi ptr [ %1, %3 ], [ %35, %8 ]
  %11 = phi <8 x i16> [ zeroinitializer, %3 ], [ %34, %8 ]
  %12 = phi i32 [ 0, %3 ], [ %37, %8 ]
  %13 = load <8 x i16>, ptr %10, align 2
  store <8 x i16> %13, ptr %9, align 2
  %14 = icmp ne <8 x i16> %13, zeroinitializer
  %15 = sext <8 x i1> %14 to <8 x i16>
  %16 = add <8 x i16> %11, %15
  %17 = getelementptr inbounds nuw i8, ptr %10, i64 16
  %18 = load <8 x i16>, ptr %17, align 2
  %19 = getelementptr inbounds nuw i8, ptr %9, i64 16
  store <8 x i16> %18, ptr %19, align 2
  %20 = icmp ne <8 x i16> %18, zeroinitializer
  %21 = sext <8 x i1> %20 to <8 x i16>
  %22 = add <8 x i16> %16, %21
  %23 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %24 = load <8 x i16>, ptr %23, align 2
  %25 = getelementptr inbounds nuw i8, ptr %9, i64 32
  store <8 x i16> %24, ptr %25, align 2
  %26 = icmp ne <8 x i16> %24, zeroinitializer
  %27 = sext <8 x i1> %26 to <8 x i16>
  %28 = add <8 x i16> %22, %27
  %29 = getelementptr inbounds nuw i8, ptr %10, i64 48
  %30 = load <8 x i16>, ptr %29, align 2
  %31 = getelementptr inbounds nuw i8, ptr %9, i64 48
  store <8 x i16> %30, ptr %31, align 2
  %32 = icmp ne <8 x i16> %30, zeroinitializer
  %33 = sext <8 x i1> %32 to <8 x i16>
  %34 = add <8 x i16> %28, %33
  %35 = getelementptr inbounds i16, ptr %10, i64 %2
  %36 = getelementptr inbounds nuw i8, ptr %9, i64 64
  %37 = add nuw nsw i32 %12, 1
  %38 = icmp eq i32 %37, 32
  br i1 %38, label %4, label %8, !llvm.loop !58
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define internal noundef i32 @_ZN12_GLOBAL__N_115scanPosLast_optEPKtPKsPtS4_PhiS1_i(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2, ptr noundef writeonly captures(none) %3, ptr noundef writeonly captures(none) %4, i32 noundef %5, ptr readnone captures(none) %6, i32 %7) #2 {
  br label %9

9:                                                ; preds = %33, %8
  %10 = phi i64 [ %48, %33 ], [ 0, %8 ]
  %11 = phi i8 [ %47, %33 ], [ 0, %8 ]
  %12 = phi i32 [ %17, %33 ], [ 0, %8 ]
  %13 = phi i16 [ %45, %33 ], [ 0, %8 ]
  %14 = phi i16 [ %42, %33 ], [ 0, %8 ]
  %15 = phi i32 [ %25, %33 ], [ %5, %8 ]
  %16 = trunc nuw nsw i64 %10 to i32
  %17 = lshr i32 %16, 4
  %18 = getelementptr inbounds nuw i16, ptr %0, i64 %10
  %19 = load i16, ptr %18, align 2, !tbaa !36
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds nuw i16, ptr %1, i64 %20
  %22 = load i16, ptr %21, align 2, !tbaa !36
  %23 = icmp ne i16 %22, 0
  %24 = sext i1 %23 to i32
  %25 = add i32 %15, %24
  %26 = and i32 %16, 15
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %28, label %33

28:                                               ; preds = %9
  %29 = zext nneg i32 %12 to i64
  %30 = getelementptr inbounds nuw i16, ptr %2, i64 %29
  store i16 %14, ptr %30, align 2, !tbaa !36
  %31 = getelementptr inbounds nuw i16, ptr %3, i64 %29
  store i16 %13, ptr %31, align 2, !tbaa !36
  %32 = getelementptr inbounds nuw i8, ptr %4, i64 %29
  store i8 %11, ptr %32, align 1, !tbaa !10
  br label %33

33:                                               ; preds = %28, %9
  %34 = phi i8 [ 0, %28 ], [ %11, %9 ]
  %35 = phi i16 [ 0, %28 ], [ %13, %9 ]
  %36 = phi i16 [ 0, %28 ], [ %14, %9 ]
  %37 = lshr i16 %22, 15
  %38 = zext nneg i16 %37 to i32
  %39 = zext nneg i8 %34 to i32
  %40 = shl nuw i32 %38, %39
  %41 = trunc i32 %40 to i16
  %42 = add i16 %36, %41
  %43 = shl i16 %35, 1
  %44 = zext i1 %23 to i16
  %45 = or disjoint i16 %43, %44
  %46 = zext i1 %23 to i8
  %47 = add i8 %34, %46
  %48 = add nuw nsw i64 %10, 1
  %49 = icmp sgt i32 %25, 0
  br i1 %49, label %9, label %50, !llvm.loop !59

50:                                               ; preds = %33
  %51 = zext nneg i32 %17 to i64
  %52 = getelementptr inbounds nuw i16, ptr %2, i64 %51
  store i16 %42, ptr %52, align 2, !tbaa !36
  %53 = getelementptr inbounds nuw i16, ptr %3, i64 %51
  store i16 %45, ptr %53, align 2, !tbaa !36
  %54 = getelementptr inbounds nuw i8, ptr %4, i64 %51
  store i8 %47, ptr %54, align 1, !tbaa !10
  ret i32 %16
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <16 x i8> @llvm.aarch64.neon.tbl1.v16i8(<16 x i8>, <16 x i8>) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.vector.reduce.add.v8i16(<8 x i16>) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i16> @llvm.aarch64.neon.rshrn.v4i16(<4 x i32>, i32 immarg) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.aarch64.neon.smull.v4i32(<4 x i16>, <4 x i16>) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i32> @llvm.aarch64.neon.addp.v4i32(<4 x i32>, <4 x i32>) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read)
declare { <8 x i16>, <8 x i16>, <8 x i16>, <8 x i16> } @llvm.aarch64.neon.ld1x4.v8i16.p0(ptr) #8

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <4 x i16> @llvm.aarch64.neon.sqrshrn.v4i16(<4 x i32>, i32 immarg) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.aarch64.neon.uaddlv.i64.v4i32(<4 x i32>) #7

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.vector.reduce.add.v2i64(<2 x i64>) #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(none)
declare <2 x i64> @llvm.aarch64.neon.smull.v2i64(<2 x i32>, <2 x i32>) #7

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.ctpop.i16(i16) #9

attributes #0 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: read) uwtable "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #4 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #5 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: write) uwtable "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #6 = { "frame-pointer"="non-leaf-no-reserve" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #7 = { mustprogress nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: read) }
attributes #9 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #10 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}
!llvm.errno.tbaa = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 4}
!5 = !{!"clang version 22.1.8"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!8, !8, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
!22 = distinct !{!22, !12}
!23 = distinct !{!23, !12}
!24 = distinct !{!24, !12}
!25 = distinct !{!25, !12}
!26 = distinct !{!26, !12}
!27 = distinct !{!27, !12}
!28 = distinct !{!28, !12}
!29 = distinct !{!29, !12}
!30 = distinct !{!30, !12}
!31 = distinct !{!31, !12}
!32 = distinct !{!32, !12}
!33 = distinct !{!33, !12}
!34 = distinct !{!34, !12}
!35 = distinct !{!35, !12}
!36 = !{!37, !37, i64 0}
!37 = !{!"short", !8, i64 0}
!38 = !{!39, !40, i64 536}
!39 = !{!"_ZTSN4x26517EncoderPrimitives2CUE", !40, i64 0, !40, i64 8, !40, i64 16, !40, i64 24, !8, i64 32, !40, i64 48, !8, i64 56, !8, i64 72, !40, i64 88, !40, i64 96, !40, i64 104, !40, i64 112, !8, i64 120, !40, i64 136, !40, i64 144, !40, i64 152, !40, i64 160, !40, i64 168, !40, i64 176, !40, i64 184, !40, i64 192, !40, i64 200, !8, i64 208, !40, i64 224, !40, i64 232, !40, i64 240, !40, i64 248, !8, i64 256, !40, i64 536, !40, i64 544, !40, i64 552, !40, i64 560, !40, i64 568, !40, i64 576}
!40 = !{!"any pointer", !8, i64 0}
!41 = !{!39, !40, i64 544}
!42 = !{!43, !40, i64 6720}
!43 = !{!"_ZTSN4x26517EncoderPrimitivesE", !8, i64 0, !8, i64 3800, !40, i64 6720, !40, i64 6728, !40, i64 6736, !40, i64 6744, !40, i64 6752, !40, i64 6760, !40, i64 6768, !8, i64 6776, !40, i64 6792, !40, i64 6800, !40, i64 6808, !40, i64 6816, !40, i64 6824, !40, i64 6832, !40, i64 6840, !8, i64 6848, !8, i64 6864, !40, i64 6880, !40, i64 6888, !40, i64 6896, !40, i64 6904, !40, i64 6912, !40, i64 6920, !40, i64 6928, !40, i64 6936, !40, i64 6944, !40, i64 6952, !40, i64 6960, !40, i64 6968, !40, i64 6976, !40, i64 6984, !40, i64 6992, !40, i64 7000, !40, i64 7008, !40, i64 7016, !40, i64 7024, !40, i64 7032, !40, i64 7040, !40, i64 7048, !40, i64 7056, !40, i64 7064, !40, i64 7072, !8, i64 7080, !8, i64 7096, !8, i64 7112, !8, i64 7160, !8, i64 7208}
!44 = !{!39, !40, i64 0}
!45 = !{!43, !40, i64 6728}
!46 = !{!39, !40, i64 8}
!47 = !{!39, !40, i64 96}
!48 = !{!39, !40, i64 88}
!49 = !{!39, !40, i64 552}
!50 = !{!39, !40, i64 560}
!51 = !{!43, !40, i64 7040}
!52 = !{!43, !40, i64 7048}
!53 = !{!54, !54, i64 0}
!54 = !{!"long", !8, i64 0}
!55 = distinct !{!55, !12}
!56 = distinct !{!56, !12}
!57 = distinct !{!57, !12}
!58 = distinct !{!58, !12}
!59 = distinct !{!59, !12}
