; ModuleID = 'fuzz1.ll'
source_filename = "fuzz1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %input = alloca [65536 x i8], align 16
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  tail call void @__coverage__(i32 28, i32 8)
  call void @llvm.dbg.declare(metadata [65536 x i8]* %input, metadata !11, metadata !DIExpression()), !dbg !16
  tail call void @__coverage__(i32 29, i32 9)
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !17
  tail call void @__coverage__(i32 29, i32 31)
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !18
  tail call void @__coverage__(i32 29, i32 3)
  %call = call i8* @fgets(i8* %arraydecay, i32 65536, %struct._IO_FILE* %0), !dbg !19
  tail call void @__coverage__(i32 30, i32 7)
  call void @llvm.dbg.declare(metadata i32* %x, metadata !20, metadata !DIExpression()), !dbg !21
  tail call void @__coverage__(i32 30, i32 7)
  store i32 0, i32* %x, align 4, !dbg !21
  tail call void @__coverage__(i32 31, i32 7)
  call void @llvm.dbg.declare(metadata i32* %y, metadata !22, metadata !DIExpression()), !dbg !23
  tail call void @__coverage__(i32 31, i32 7)
  store i32 2, i32* %y, align 4, !dbg !23
  tail call void @__coverage__(i32 32, i32 7)
  call void @llvm.dbg.declare(metadata i32* %z, metadata !24, metadata !DIExpression()), !dbg !25
  tail call void @__coverage__(i32 33, i32 14)
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !26
  tail call void @__coverage__(i32 33, i32 7)
  %call2 = call i64 @strlen(i8* %arraydecay1) #4, !dbg !28
  tail call void @__coverage__(i32 33, i32 21)
  %rem = urem i64 %call2, 7, !dbg !29
  tail call void @__coverage__(i32 33, i32 25)
  %cmp = icmp eq i64 %rem, 0, !dbg !30
  tail call void @__coverage__(i32 33, i32 7)
  br i1 %cmp, label %if.then, label %if.end, !dbg !31

if.then:                                          ; preds = %entry
  tail call void @__coverage__(i32 34, i32 9)
  %1 = load i32, i32* %y, align 4, !dbg !32
  tail call void @__coverage__(i32 34, i32 13)
  %2 = load i32, i32* %x, align 4, !dbg !34
  tail call void @__dbz_sanitizer__(i32 %2, i32 34, i32 11)
  tail call void @__coverage__(i32 34, i32 11)
  %div = sdiv i32 %1, %2, !dbg !35
  tail call void @__coverage__(i32 34, i32 7)
  store i32 %div, i32* %z, align 4, !dbg !36
  tail call void @__coverage__(i32 35, i32 3)
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  tail call void @__coverage__(i32 37, i32 14)
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !38
  tail call void @__coverage__(i32 37, i32 7)
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !40
  tail call void @__coverage__(i32 37, i32 21)
  %rem5 = urem i64 %call4, 13, !dbg !41
  tail call void @__coverage__(i32 37, i32 26)
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !42
  tail call void @__coverage__(i32 37, i32 7)
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !43

if.then7:                                         ; preds = %if.end
  tail call void @__coverage__(i32 38, i32 9)
  %3 = load i32, i32* %y, align 4, !dbg !44
  tail call void @__coverage__(i32 38, i32 13)
  %4 = load i32, i32* %x, align 4, !dbg !46
  tail call void @__coverage__(i32 38, i32 13)
  %inc = add nsw i32 %4, 1, !dbg !46
  tail call void @__coverage__(i32 38, i32 13)
  store i32 %inc, i32* %x, align 4, !dbg !46
  tail call void @__dbz_sanitizer__(i32 %inc, i32 38, i32 11)
  tail call void @__coverage__(i32 38, i32 11)
  %div8 = sdiv i32 %3, %inc, !dbg !47
  tail call void @__coverage__(i32 38, i32 7)
  store i32 %div8, i32* %z, align 4, !dbg !48
  tail call void @__coverage__(i32 39, i32 3)
  br label %if.end9, !dbg !49

if.end9:                                          ; preds = %if.then7, %if.end
  tail call void @__coverage__(i32 41, i32 3)
  ret i32 0, !dbg !50
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #2

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #3

declare void @__coverage__(i32, i32)

declare void @__dbz_sanitizer__(i32, i32, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1-9 (tags/RELEASE_801/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "fuzz1.c", directory: "/home/cs6340/Documents/Lab-5-Cooperative-Bug-Isolation/cbi/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1-9 (tags/RELEASE_801/final)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 27, type: !8, scopeLine: 27, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "input", scope: !7, file: !1, line: 28, type: !12)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 524288, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 65536)
!16 = !DILocation(line: 28, column: 8, scope: !7)
!17 = !DILocation(line: 29, column: 9, scope: !7)
!18 = !DILocation(line: 29, column: 31, scope: !7)
!19 = !DILocation(line: 29, column: 3, scope: !7)
!20 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 30, type: !10)
!21 = !DILocation(line: 30, column: 7, scope: !7)
!22 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 31, type: !10)
!23 = !DILocation(line: 31, column: 7, scope: !7)
!24 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 32, type: !10)
!25 = !DILocation(line: 32, column: 7, scope: !7)
!26 = !DILocation(line: 33, column: 14, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 7)
!28 = !DILocation(line: 33, column: 7, scope: !27)
!29 = !DILocation(line: 33, column: 21, scope: !27)
!30 = !DILocation(line: 33, column: 25, scope: !27)
!31 = !DILocation(line: 33, column: 7, scope: !7)
!32 = !DILocation(line: 34, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !1, line: 33, column: 31)
!34 = !DILocation(line: 34, column: 13, scope: !33)
!35 = !DILocation(line: 34, column: 11, scope: !33)
!36 = !DILocation(line: 34, column: 7, scope: !33)
!37 = !DILocation(line: 35, column: 3, scope: !33)
!38 = !DILocation(line: 37, column: 14, scope: !39)
!39 = distinct !DILexicalBlock(scope: !7, file: !1, line: 37, column: 7)
!40 = !DILocation(line: 37, column: 7, scope: !39)
!41 = !DILocation(line: 37, column: 21, scope: !39)
!42 = !DILocation(line: 37, column: 26, scope: !39)
!43 = !DILocation(line: 37, column: 7, scope: !7)
!44 = !DILocation(line: 38, column: 9, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !1, line: 37, column: 32)
!46 = !DILocation(line: 38, column: 13, scope: !45)
!47 = !DILocation(line: 38, column: 11, scope: !45)
!48 = !DILocation(line: 38, column: 7, scope: !45)
!49 = !DILocation(line: 39, column: 3, scope: !45)
!50 = !DILocation(line: 41, column: 3, scope: !7)
