; ModuleID = 'trans.c'
source_filename = "trans.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"Transpose submission\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Basic transpose\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"Transpose using the temporary array\00", align 1
@str = private unnamed_addr constant [13 x i8] c"\0Anot my code\00"

; Function Attrs: nounwind uwtable
define dso_local void @registerFunctions() local_unnamed_addr #0 !dbg !7 {
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @transpose_submit, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i64 0, i64 0)) #3, !dbg !10
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @trans_basic, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)) #3, !dbg !11
  tail call void @registerTransFunction(void (i64, i64, double*, double*, double*)* nonnull @trans_tmp, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i64 0, i64 0)) #3, !dbg !12
  ret void, !dbg !13
}

declare dso_local void @registerTransFunction(void (i64, i64, double*, double*, double*)*, i8*) local_unnamed_addr #1

; Function Attrs: nounwind uwtable
define internal void @transpose_submit(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture readnone) #0 !dbg !14 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !27, metadata !DIExpression()), !dbg !48
  call void @llvm.dbg.value(metadata i64 %1, metadata !28, metadata !DIExpression()), !dbg !49
  call void @llvm.dbg.value(metadata double* %2, metadata !29, metadata !DIExpression()), !dbg !50
  call void @llvm.dbg.value(metadata double* %3, metadata !30, metadata !DIExpression()), !dbg !51
  call void @llvm.dbg.value(metadata double* %4, metadata !31, metadata !DIExpression()), !dbg !52
  switch i64 %0, label %6 [
    i64 1024, label %29
    i64 32, label %29
  ], !dbg !53

; <label>:6:                                      ; preds = %5
  %7 = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @str, i64 0, i64 0)), !dbg !54
  call void @llvm.dbg.value(metadata i64 %0, metadata !56, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.value(metadata i64 %1, metadata !59, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.value(metadata double* %2, metadata !60, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.value(metadata double* %3, metadata !61, metadata !DIExpression()), !dbg !73
  call void @llvm.dbg.value(metadata double* %4, metadata !62, metadata !DIExpression()), !dbg !74
  call void @llvm.dbg.value(metadata i64 0, metadata !63, metadata !DIExpression()), !dbg !75
  %8 = icmp eq i64 %1, 0, !dbg !76
  %9 = icmp eq i64 %0, 0
  %10 = or i1 %9, %8, !dbg !77
  br i1 %10, label %93, label %11, !dbg !77

; <label>:11:                                     ; preds = %6, %26
  %12 = phi i64 [ %27, %26 ], [ 0, %6 ]
  call void @llvm.dbg.value(metadata i64 %12, metadata !63, metadata !DIExpression()), !dbg !75
  call void @llvm.dbg.value(metadata i64 0, metadata !65, metadata !DIExpression()), !dbg !78
  %13 = mul nsw i64 %12, %0
  %14 = getelementptr inbounds double, double* %2, i64 %13
  %15 = getelementptr inbounds double, double* %3, i64 %12
  br label %16, !dbg !79

; <label>:16:                                     ; preds = %16, %11
  %17 = phi i64 [ 0, %11 ], [ %24, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !65, metadata !DIExpression()), !dbg !78
  %18 = getelementptr inbounds double, double* %14, i64 %17, !dbg !80
  %19 = bitcast double* %18 to i64*, !dbg !80
  %20 = load i64, i64* %19, align 8, !dbg !80, !tbaa !83
  %21 = mul nsw i64 %17, %1, !dbg !87
  %22 = getelementptr inbounds double, double* %15, i64 %21, !dbg !87
  %23 = bitcast double* %22 to i64*, !dbg !88
  store i64 %20, i64* %23, align 8, !dbg !88, !tbaa !83
  %24 = add nuw i64 %17, 1, !dbg !89
  call void @llvm.dbg.value(metadata i64 %24, metadata !65, metadata !DIExpression()), !dbg !78
  %25 = icmp eq i64 %24, %0, !dbg !90
  br i1 %25, label %26, label %16, !dbg !79, !llvm.loop !91

; <label>:26:                                     ; preds = %16
  %27 = add nuw i64 %12, 1, !dbg !94
  call void @llvm.dbg.value(metadata i64 %27, metadata !63, metadata !DIExpression()), !dbg !75
  %28 = icmp eq i64 %27, %1, !dbg !76
  br i1 %28, label %93, label %11, !dbg !77, !llvm.loop !95

; <label>:29:                                     ; preds = %5, %5
  call void @llvm.dbg.value(metadata i64 0, metadata !32, metadata !DIExpression()), !dbg !98
  %30 = icmp eq i64 %1, 0
  br label %31, !dbg !99

; <label>:31:                                     ; preds = %29, %91
  %32 = phi i64 [ 0, %29 ], [ %33, %91 ]
  call void @llvm.dbg.value(metadata i64 %32, metadata !32, metadata !DIExpression()), !dbg !98
  call void @llvm.dbg.value(metadata i64 0, metadata !36, metadata !DIExpression()), !dbg !100
  %33 = add i64 %32, 8
  br i1 %30, label %91, label %34, !dbg !101

; <label>:34:                                     ; preds = %31
  %35 = icmp eq i64 %32, -8
  br i1 %35, label %87, label %36, !dbg !101

; <label>:36:                                     ; preds = %34, %41
  %37 = phi i64 [ %38, %41 ], [ 0, %34 ]
  call void @llvm.dbg.value(metadata i64 %37, metadata !36, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata i64 %32, metadata !40, metadata !DIExpression()), !dbg !102
  %38 = add i64 %37, 8
  %39 = icmp eq i64 %37, -8
  %40 = icmp eq i64 %32, %37
  br i1 %39, label %73, label %43, !dbg !103

; <label>:41:                                     ; preds = %56, %74, %73
  call void @llvm.dbg.value(metadata i64 %38, metadata !36, metadata !DIExpression()), !dbg !100
  %42 = icmp ult i64 %38, %1, !dbg !104
  br i1 %42, label %36, label %91, !dbg !101, !llvm.loop !105

; <label>:43:                                     ; preds = %36, %56
  %44 = phi i64 [ %57, %56 ], [ %32, %36 ]
  call void @llvm.dbg.value(metadata i64 %44, metadata !40, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 %37, metadata !44, metadata !DIExpression()), !dbg !107
  %45 = mul nsw i64 %44, %0
  %46 = getelementptr inbounds double, double* %2, i64 %45
  %47 = getelementptr inbounds double, double* %3, i64 %44
  br label %60, !dbg !108

; <label>:48:                                     ; preds = %59
  %49 = getelementptr inbounds double, double* %46, i64 %44, !dbg !109
  %50 = bitcast double* %49 to i64*, !dbg !109
  %51 = load i64, i64* %50, align 8, !dbg !109, !tbaa !83
  %52 = mul nsw i64 %44, %1, !dbg !111
  %53 = getelementptr inbounds double, double* %3, i64 %52, !dbg !111
  %54 = getelementptr inbounds double, double* %53, i64 %44, !dbg !111
  %55 = bitcast double* %54 to i64*, !dbg !112
  store i64 %51, i64* %55, align 8, !dbg !112, !tbaa !83
  br label %56, !dbg !111

; <label>:56:                                     ; preds = %48, %59
  %57 = add nuw i64 %44, 1, !dbg !113
  call void @llvm.dbg.value(metadata i64 %57, metadata !40, metadata !DIExpression()), !dbg !102
  %58 = icmp ult i64 %57, %33, !dbg !114
  br i1 %58, label %43, label %41, !dbg !103, !llvm.loop !115

; <label>:59:                                     ; preds = %70
  br i1 %40, label %48, label %56, !dbg !117

; <label>:60:                                     ; preds = %70, %43
  %61 = phi i64 [ %37, %43 ], [ %71, %70 ]
  call void @llvm.dbg.value(metadata i64 %61, metadata !44, metadata !DIExpression()), !dbg !107
  %62 = icmp eq i64 %44, %61, !dbg !118
  br i1 %62, label %70, label %63, !dbg !122

; <label>:63:                                     ; preds = %60
  %64 = getelementptr inbounds double, double* %46, i64 %61, !dbg !123
  %65 = bitcast double* %64 to i64*, !dbg !123
  %66 = load i64, i64* %65, align 8, !dbg !123, !tbaa !83
  %67 = mul nsw i64 %61, %1, !dbg !124
  %68 = getelementptr inbounds double, double* %47, i64 %67, !dbg !124
  %69 = bitcast double* %68 to i64*, !dbg !125
  store i64 %66, i64* %69, align 8, !dbg !125, !tbaa !83
  br label %70, !dbg !124

; <label>:70:                                     ; preds = %63, %60
  %71 = add nuw i64 %61, 1, !dbg !126
  call void @llvm.dbg.value(metadata i64 %71, metadata !44, metadata !DIExpression()), !dbg !107
  %72 = icmp ult i64 %71, %38, !dbg !127
  br i1 %72, label %60, label %59, !dbg !108, !llvm.loop !128

; <label>:73:                                     ; preds = %36
  br i1 %40, label %74, label %41, !dbg !103

; <label>:74:                                     ; preds = %73, %74
  %75 = phi i64 [ %85, %74 ], [ %32, %73 ]
  call void @llvm.dbg.value(metadata i64 %75, metadata !40, metadata !DIExpression()), !dbg !102
  call void @llvm.dbg.value(metadata i64 %37, metadata !44, metadata !DIExpression()), !dbg !107
  %76 = mul nsw i64 %75, %0, !dbg !109
  %77 = getelementptr inbounds double, double* %2, i64 %76, !dbg !109
  %78 = getelementptr inbounds double, double* %77, i64 %75, !dbg !109
  %79 = bitcast double* %78 to i64*, !dbg !109
  %80 = load i64, i64* %79, align 8, !dbg !109, !tbaa !83
  %81 = mul nsw i64 %75, %1, !dbg !111
  %82 = getelementptr inbounds double, double* %3, i64 %81, !dbg !111
  %83 = getelementptr inbounds double, double* %82, i64 %75, !dbg !111
  %84 = bitcast double* %83 to i64*, !dbg !112
  store i64 %80, i64* %84, align 8, !dbg !112, !tbaa !83
  %85 = add nuw i64 %75, 1, !dbg !113
  call void @llvm.dbg.value(metadata i64 %85, metadata !40, metadata !DIExpression()), !dbg !102
  %86 = icmp ult i64 %85, %33, !dbg !114
  br i1 %86, label %74, label %41, !dbg !103, !llvm.loop !115

; <label>:87:                                     ; preds = %34, %87
  %88 = phi i64 [ %89, %87 ], [ 0, %34 ]
  call void @llvm.dbg.value(metadata i64 %88, metadata !36, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.value(metadata i64 %32, metadata !40, metadata !DIExpression()), !dbg !102
  %89 = add i64 %88, 8, !dbg !130
  call void @llvm.dbg.value(metadata i64 %89, metadata !36, metadata !DIExpression()), !dbg !100
  %90 = icmp ult i64 %89, %1, !dbg !104
  br i1 %90, label %87, label %91, !dbg !101, !llvm.loop !105

; <label>:91:                                     ; preds = %41, %87, %31
  call void @llvm.dbg.value(metadata i64 %33, metadata !32, metadata !DIExpression()), !dbg !98
  %92 = icmp ult i64 %33, %0, !dbg !131
  br i1 %92, label %31, label %93, !dbg !99, !llvm.loop !132

; <label>:93:                                     ; preds = %91, %26, %6
  ret void, !dbg !134
}

; Function Attrs: nounwind uwtable
define internal void @trans_basic(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture readnone) #0 !dbg !57 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !56, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.value(metadata i64 %1, metadata !59, metadata !DIExpression()), !dbg !136
  call void @llvm.dbg.value(metadata double* %2, metadata !60, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.value(metadata double* %3, metadata !61, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.value(metadata double* %4, metadata !62, metadata !DIExpression()), !dbg !139
  call void @llvm.dbg.value(metadata i64 0, metadata !63, metadata !DIExpression()), !dbg !140
  %6 = icmp eq i64 %1, 0, !dbg !141
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !96
  br i1 %8, label %27, label %9, !dbg !96

; <label>:9:                                      ; preds = %5, %24
  %10 = phi i64 [ %25, %24 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !63, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.value(metadata i64 0, metadata !65, metadata !DIExpression()), !dbg !142
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = getelementptr inbounds double, double* %3, i64 %10
  br label %14, !dbg !92

; <label>:14:                                     ; preds = %14, %9
  %15 = phi i64 [ 0, %9 ], [ %22, %14 ]
  call void @llvm.dbg.value(metadata i64 %15, metadata !65, metadata !DIExpression()), !dbg !142
  %16 = getelementptr inbounds double, double* %12, i64 %15, !dbg !143
  %17 = bitcast double* %16 to i64*, !dbg !143
  %18 = load i64, i64* %17, align 8, !dbg !143, !tbaa !83
  %19 = mul nsw i64 %15, %1, !dbg !144
  %20 = getelementptr inbounds double, double* %13, i64 %19, !dbg !144
  %21 = bitcast double* %20 to i64*, !dbg !145
  store i64 %18, i64* %21, align 8, !dbg !145, !tbaa !83
  %22 = add nuw i64 %15, 1, !dbg !146
  call void @llvm.dbg.value(metadata i64 %22, metadata !65, metadata !DIExpression()), !dbg !142
  %23 = icmp eq i64 %22, %0, !dbg !147
  br i1 %23, label %24, label %14, !dbg !92, !llvm.loop !91

; <label>:24:                                     ; preds = %14
  %25 = add nuw i64 %10, 1, !dbg !148
  call void @llvm.dbg.value(metadata i64 %25, metadata !63, metadata !DIExpression()), !dbg !140
  %26 = icmp eq i64 %25, %1, !dbg !141
  br i1 %26, label %27, label %9, !dbg !96, !llvm.loop !95

; <label>:27:                                     ; preds = %24, %5
  ret void, !dbg !149
}

; Function Attrs: nounwind uwtable
define internal void @trans_tmp(i64, i64, double* nocapture readonly, double* nocapture, double* nocapture) #0 !dbg !150 {
  call void @llvm.dbg.value(metadata i64 %0, metadata !152, metadata !DIExpression()), !dbg !167
  call void @llvm.dbg.value(metadata i64 %1, metadata !153, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.value(metadata double* %2, metadata !154, metadata !DIExpression()), !dbg !169
  call void @llvm.dbg.value(metadata double* %3, metadata !155, metadata !DIExpression()), !dbg !170
  call void @llvm.dbg.value(metadata double* %4, metadata !156, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.value(metadata i64 0, metadata !157, metadata !DIExpression()), !dbg !172
  %6 = icmp eq i64 %1, 0, !dbg !173
  %7 = icmp eq i64 %0, 0
  %8 = or i1 %6, %7, !dbg !174
  br i1 %8, label %33, label %9, !dbg !174

; <label>:9:                                      ; preds = %5, %30
  %10 = phi i64 [ %31, %30 ], [ 0, %5 ]
  call void @llvm.dbg.value(metadata i64 %10, metadata !157, metadata !DIExpression()), !dbg !172
  call void @llvm.dbg.value(metadata i64 0, metadata !159, metadata !DIExpression()), !dbg !175
  %11 = mul nsw i64 %10, %0
  %12 = getelementptr inbounds double, double* %2, i64 %11
  %13 = shl i64 %10, 1
  %14 = and i64 %13, 2
  %15 = getelementptr inbounds double, double* %3, i64 %10
  br label %16, !dbg !176

; <label>:16:                                     ; preds = %16, %9
  %17 = phi i64 [ 0, %9 ], [ %28, %16 ]
  call void @llvm.dbg.value(metadata i64 %17, metadata !159, metadata !DIExpression()), !dbg !175
  call void @llvm.dbg.value(metadata i64 %10, metadata !163, metadata !DIExpression(DW_OP_constu, 1, DW_OP_and, DW_OP_stack_value)), !dbg !177
  %18 = and i64 %17, 1, !dbg !178
  call void @llvm.dbg.value(metadata i64 %18, metadata !166, metadata !DIExpression()), !dbg !179
  %19 = getelementptr inbounds double, double* %12, i64 %17, !dbg !180
  %20 = bitcast double* %19 to i64*, !dbg !180
  %21 = load i64, i64* %20, align 8, !dbg !180, !tbaa !83
  %22 = or i64 %18, %14, !dbg !181
  %23 = getelementptr inbounds double, double* %4, i64 %22, !dbg !182
  %24 = bitcast double* %23 to i64*, !dbg !183
  store i64 %21, i64* %24, align 8, !dbg !183, !tbaa !83
  %25 = mul nsw i64 %17, %1, !dbg !184
  %26 = getelementptr inbounds double, double* %15, i64 %25, !dbg !184
  %27 = bitcast double* %26 to i64*, !dbg !185
  store i64 %21, i64* %27, align 8, !dbg !185, !tbaa !83
  %28 = add nuw i64 %17, 1, !dbg !186
  call void @llvm.dbg.value(metadata i64 %28, metadata !159, metadata !DIExpression()), !dbg !175
  %29 = icmp eq i64 %28, %0, !dbg !187
  br i1 %29, label %30, label %16, !dbg !176, !llvm.loop !188

; <label>:30:                                     ; preds = %16
  %31 = add nuw i64 %10, 1, !dbg !190
  call void @llvm.dbg.value(metadata i64 %31, metadata !157, metadata !DIExpression()), !dbg !172
  %32 = icmp eq i64 %31, %1, !dbg !173
  br i1 %32, label %33, label %9, !dbg !174, !llvm.loop !191

; <label>:33:                                     ; preds = %30, %5
  ret void, !dbg !193
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #2

; Function Attrs: nounwind
declare i32 @puts(i8* nocapture readonly) local_unnamed_addr #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone speculatable }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 7.0.0 (tags/RELEASE_700/final)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "trans.c", directory: "/afs/andrew.cmu.edu/usr22/yujunl2/private/18213/cache-lab-yujunlee0525")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 7.0.0 (tags/RELEASE_700/final)"}
!7 = distinct !DISubprogram(name: "registerFunctions", scope: !1, file: !1, line: 160, type: !8, isLocal: false, isDefinition: true, scopeLine: 160, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 162, column: 5, scope: !7)
!11 = !DILocation(line: 165, column: 5, scope: !7)
!12 = !DILocation(line: 166, column: 5, scope: !7)
!13 = !DILocation(line: 167, column: 1, scope: !7)
!14 = distinct !DISubprogram(name: "transpose_submit", scope: !1, file: !1, line: 125, type: !15, isLocal: true, isDefinition: true, scopeLine: 126, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !26)
!15 = !DISubroutineType(types: !16)
!16 = !{null, !17, !17, !20, !20, !25}
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 62, baseType: !19)
!18 = !DIFile(filename: "/usr/local/depot/llvm-7.0/lib/clang/7.0.0/include/stddef.h", directory: "/afs/andrew.cmu.edu/usr22/yujunl2/private/18213/cache-lab-yujunlee0525")
!19 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DICompositeType(tag: DW_TAG_array_type, baseType: !22, elements: !23)
!22 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!23 = !{!24}
!24 = !DISubrange(count: -1)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !22, size: 64)
!26 = !{!27, !28, !29, !30, !31, !32, !36, !40, !44}
!27 = !DILocalVariable(name: "M", arg: 1, scope: !14, file: !1, line: 125, type: !17)
!28 = !DILocalVariable(name: "N", arg: 2, scope: !14, file: !1, line: 125, type: !17)
!29 = !DILocalVariable(name: "A", arg: 3, scope: !14, file: !1, line: 125, type: !20)
!30 = !DILocalVariable(name: "B", arg: 4, scope: !14, file: !1, line: 125, type: !20)
!31 = !DILocalVariable(name: "tmp", arg: 5, scope: !14, file: !1, line: 126, type: !25)
!32 = !DILocalVariable(name: "i", scope: !33, file: !1, line: 134, type: !17)
!33 = distinct !DILexicalBlock(scope: !34, file: !1, line: 134, column: 9)
!34 = distinct !DILexicalBlock(scope: !35, file: !1, line: 133, column: 5)
!35 = distinct !DILexicalBlock(scope: !14, file: !1, line: 127, column: 9)
!36 = !DILocalVariable(name: "j", scope: !37, file: !1, line: 136, type: !17)
!37 = distinct !DILexicalBlock(scope: !38, file: !1, line: 136, column: 13)
!38 = distinct !DILexicalBlock(scope: !39, file: !1, line: 135, column: 9)
!39 = distinct !DILexicalBlock(scope: !33, file: !1, line: 134, column: 9)
!40 = !DILocalVariable(name: "i2", scope: !41, file: !1, line: 138, type: !17)
!41 = distinct !DILexicalBlock(scope: !42, file: !1, line: 138, column: 17)
!42 = distinct !DILexicalBlock(scope: !43, file: !1, line: 137, column: 13)
!43 = distinct !DILexicalBlock(scope: !37, file: !1, line: 136, column: 13)
!44 = !DILocalVariable(name: "j2", scope: !45, file: !1, line: 141, type: !17)
!45 = distinct !DILexicalBlock(scope: !46, file: !1, line: 141, column: 21)
!46 = distinct !DILexicalBlock(scope: !47, file: !1, line: 139, column: 17)
!47 = distinct !DILexicalBlock(scope: !41, file: !1, line: 138, column: 17)
!48 = !DILocation(line: 125, column: 37, scope: !14)
!49 = !DILocation(line: 125, column: 47, scope: !14)
!50 = !DILocation(line: 125, column: 57, scope: !14)
!51 = !DILocation(line: 125, column: 73, scope: !14)
!52 = !DILocation(line: 126, column: 37, scope: !14)
!53 = !DILocation(line: 127, column: 17, scope: !35)
!54 = !DILocation(line: 129, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !35, file: !1, line: 128, column: 5)
!56 = !DILocalVariable(name: "M", arg: 1, scope: !57, file: !1, line: 81, type: !17)
!57 = distinct !DISubprogram(name: "trans_basic", scope: !1, file: !1, line: 81, type: !15, isLocal: true, isDefinition: true, scopeLine: 82, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !58)
!58 = !{!56, !59, !60, !61, !62, !63, !65}
!59 = !DILocalVariable(name: "N", arg: 2, scope: !57, file: !1, line: 81, type: !17)
!60 = !DILocalVariable(name: "A", arg: 3, scope: !57, file: !1, line: 81, type: !20)
!61 = !DILocalVariable(name: "B", arg: 4, scope: !57, file: !1, line: 81, type: !20)
!62 = !DILocalVariable(name: "tmp", arg: 5, scope: !57, file: !1, line: 82, type: !25)
!63 = !DILocalVariable(name: "i", scope: !64, file: !1, line: 86, type: !17)
!64 = distinct !DILexicalBlock(scope: !57, file: !1, line: 86, column: 5)
!65 = !DILocalVariable(name: "j", scope: !66, file: !1, line: 87, type: !17)
!66 = distinct !DILexicalBlock(scope: !67, file: !1, line: 87, column: 9)
!67 = distinct !DILexicalBlock(scope: !68, file: !1, line: 86, column: 36)
!68 = distinct !DILexicalBlock(scope: !64, file: !1, line: 86, column: 5)
!69 = !DILocation(line: 81, column: 32, scope: !57, inlinedAt: !70)
!70 = distinct !DILocation(line: 130, column: 9, scope: !55)
!71 = !DILocation(line: 81, column: 42, scope: !57, inlinedAt: !70)
!72 = !DILocation(line: 81, column: 52, scope: !57, inlinedAt: !70)
!73 = !DILocation(line: 81, column: 68, scope: !57, inlinedAt: !70)
!74 = !DILocation(line: 82, column: 32, scope: !57, inlinedAt: !70)
!75 = !DILocation(line: 86, column: 17, scope: !64, inlinedAt: !70)
!76 = !DILocation(line: 86, column: 26, scope: !68, inlinedAt: !70)
!77 = !DILocation(line: 86, column: 5, scope: !64, inlinedAt: !70)
!78 = !DILocation(line: 87, column: 21, scope: !66, inlinedAt: !70)
!79 = !DILocation(line: 87, column: 9, scope: !66, inlinedAt: !70)
!80 = !DILocation(line: 88, column: 23, scope: !81, inlinedAt: !70)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 87, column: 40)
!82 = distinct !DILexicalBlock(scope: !66, file: !1, line: 87, column: 9)
!83 = !{!84, !84, i64 0}
!84 = !{!"double", !85, i64 0}
!85 = !{!"omnipotent char", !86, i64 0}
!86 = !{!"Simple C/C++ TBAA"}
!87 = !DILocation(line: 88, column: 13, scope: !81, inlinedAt: !70)
!88 = !DILocation(line: 88, column: 21, scope: !81, inlinedAt: !70)
!89 = !DILocation(line: 87, column: 36, scope: !82, inlinedAt: !70)
!90 = !DILocation(line: 87, column: 30, scope: !82, inlinedAt: !70)
!91 = distinct !{!91, !92, !93}
!92 = !DILocation(line: 87, column: 9, scope: !66)
!93 = !DILocation(line: 89, column: 9, scope: !66)
!94 = !DILocation(line: 86, column: 32, scope: !68, inlinedAt: !70)
!95 = distinct !{!95, !96, !97}
!96 = !DILocation(line: 86, column: 5, scope: !64)
!97 = !DILocation(line: 90, column: 5, scope: !64)
!98 = !DILocation(line: 134, column: 21, scope: !33)
!99 = !DILocation(line: 134, column: 9, scope: !33)
!100 = !DILocation(line: 136, column: 24, scope: !37)
!101 = !DILocation(line: 136, column: 13, scope: !37)
!102 = !DILocation(line: 138, column: 28, scope: !41)
!103 = !DILocation(line: 138, column: 17, scope: !41)
!104 = !DILocation(line: 136, column: 31, scope: !43)
!105 = distinct !{!105, !101, !106}
!106 = !DILocation(line: 148, column: 13, scope: !37)
!107 = !DILocation(line: 141, column: 32, scope: !45)
!108 = !DILocation(line: 141, column: 21, scope: !45)
!109 = !DILocation(line: 146, column: 41, scope: !110)
!110 = distinct !DILexicalBlock(scope: !46, file: !1, line: 146, column: 25)
!111 = !DILocation(line: 146, column: 31, scope: !110)
!112 = !DILocation(line: 146, column: 40, scope: !110)
!113 = !DILocation(line: 138, column: 46, scope: !47)
!114 = !DILocation(line: 138, column: 38, scope: !47)
!115 = distinct !{!115, !103, !116}
!116 = !DILocation(line: 147, column: 17, scope: !41)
!117 = !DILocation(line: 146, column: 25, scope: !46)
!118 = !DILocation(line: 143, column: 31, scope: !119)
!119 = distinct !DILexicalBlock(scope: !120, file: !1, line: 143, column: 29)
!120 = distinct !DILexicalBlock(scope: !121, file: !1, line: 142, column: 21)
!121 = distinct !DILexicalBlock(scope: !45, file: !1, line: 141, column: 21)
!122 = !DILocation(line: 143, column: 29, scope: !120)
!123 = !DILocation(line: 143, column: 47, scope: !119)
!124 = !DILocation(line: 143, column: 37, scope: !119)
!125 = !DILocation(line: 143, column: 46, scope: !119)
!126 = !DILocation(line: 141, column: 50, scope: !121)
!127 = !DILocation(line: 141, column: 42, scope: !121)
!128 = distinct !{!128, !108, !129}
!129 = !DILocation(line: 145, column: 21, scope: !45)
!130 = !DILocation(line: 136, column: 37, scope: !43)
!131 = !DILocation(line: 134, column: 30, scope: !39)
!132 = distinct !{!132, !99, !133}
!133 = !DILocation(line: 149, column: 9, scope: !33)
!134 = !DILocation(line: 151, column: 1, scope: !14)
!135 = !DILocation(line: 81, column: 32, scope: !57)
!136 = !DILocation(line: 81, column: 42, scope: !57)
!137 = !DILocation(line: 81, column: 52, scope: !57)
!138 = !DILocation(line: 81, column: 68, scope: !57)
!139 = !DILocation(line: 82, column: 32, scope: !57)
!140 = !DILocation(line: 86, column: 17, scope: !64)
!141 = !DILocation(line: 86, column: 26, scope: !68)
!142 = !DILocation(line: 87, column: 21, scope: !66)
!143 = !DILocation(line: 88, column: 23, scope: !81)
!144 = !DILocation(line: 88, column: 13, scope: !81)
!145 = !DILocation(line: 88, column: 21, scope: !81)
!146 = !DILocation(line: 87, column: 36, scope: !82)
!147 = !DILocation(line: 87, column: 30, scope: !82)
!148 = !DILocation(line: 86, column: 32, scope: !68)
!149 = !DILocation(line: 93, column: 1, scope: !57)
!150 = distinct !DISubprogram(name: "trans_tmp", scope: !1, file: !1, line: 101, type: !15, isLocal: true, isDefinition: true, scopeLine: 102, flags: DIFlagPrototyped, isOptimized: true, unit: !0, retainedNodes: !151)
!151 = !{!152, !153, !154, !155, !156, !157, !159, !163, !166}
!152 = !DILocalVariable(name: "M", arg: 1, scope: !150, file: !1, line: 101, type: !17)
!153 = !DILocalVariable(name: "N", arg: 2, scope: !150, file: !1, line: 101, type: !17)
!154 = !DILocalVariable(name: "A", arg: 3, scope: !150, file: !1, line: 101, type: !20)
!155 = !DILocalVariable(name: "B", arg: 4, scope: !150, file: !1, line: 101, type: !20)
!156 = !DILocalVariable(name: "tmp", arg: 5, scope: !150, file: !1, line: 102, type: !25)
!157 = !DILocalVariable(name: "i", scope: !158, file: !1, line: 106, type: !17)
!158 = distinct !DILexicalBlock(scope: !150, file: !1, line: 106, column: 5)
!159 = !DILocalVariable(name: "j", scope: !160, file: !1, line: 107, type: !17)
!160 = distinct !DILexicalBlock(scope: !161, file: !1, line: 107, column: 9)
!161 = distinct !DILexicalBlock(scope: !162, file: !1, line: 106, column: 36)
!162 = distinct !DILexicalBlock(scope: !158, file: !1, line: 106, column: 5)
!163 = !DILocalVariable(name: "di", scope: !164, file: !1, line: 108, type: !17)
!164 = distinct !DILexicalBlock(scope: !165, file: !1, line: 107, column: 40)
!165 = distinct !DILexicalBlock(scope: !160, file: !1, line: 107, column: 9)
!166 = !DILocalVariable(name: "dj", scope: !164, file: !1, line: 109, type: !17)
!167 = !DILocation(line: 101, column: 30, scope: !150)
!168 = !DILocation(line: 101, column: 40, scope: !150)
!169 = !DILocation(line: 101, column: 50, scope: !150)
!170 = !DILocation(line: 101, column: 66, scope: !150)
!171 = !DILocation(line: 102, column: 30, scope: !150)
!172 = !DILocation(line: 106, column: 17, scope: !158)
!173 = !DILocation(line: 106, column: 26, scope: !162)
!174 = !DILocation(line: 106, column: 5, scope: !158)
!175 = !DILocation(line: 107, column: 21, scope: !160)
!176 = !DILocation(line: 107, column: 9, scope: !160)
!177 = !DILocation(line: 108, column: 20, scope: !164)
!178 = !DILocation(line: 109, column: 27, scope: !164)
!179 = !DILocation(line: 109, column: 20, scope: !164)
!180 = !DILocation(line: 110, column: 32, scope: !164)
!181 = !DILocation(line: 110, column: 24, scope: !164)
!182 = !DILocation(line: 110, column: 13, scope: !164)
!183 = !DILocation(line: 110, column: 30, scope: !164)
!184 = !DILocation(line: 111, column: 13, scope: !164)
!185 = !DILocation(line: 111, column: 21, scope: !164)
!186 = !DILocation(line: 107, column: 36, scope: !165)
!187 = !DILocation(line: 107, column: 30, scope: !165)
!188 = distinct !{!188, !176, !189}
!189 = !DILocation(line: 112, column: 9, scope: !160)
!190 = !DILocation(line: 106, column: 32, scope: !162)
!191 = distinct !{!191, !174, !192}
!192 = !DILocation(line: 113, column: 5, scope: !158)
!193 = !DILocation(line: 116, column: 1, scope: !150)
