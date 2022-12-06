; ModuleID = 'simple1.instrumented.ll'
source_filename = "simple1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"%d%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  tail call void @__coverage__(i32 27, i32 7)
  call void @llvm.dbg.declare(metadata i32* %x, metadata !10, metadata !DIExpression()), !dbg !12
  tail call void @__coverage__(i32 27, i32 7)
  store i32 0, i32* %x, align 4, !dbg !12
  tail call void @__coverage__(i32 27, i32 14)
  call void @llvm.dbg.declare(metadata i32* %y, metadata !13, metadata !DIExpression()), !dbg !14
  tail call void @__coverage__(i32 27, i32 17)
  call void @llvm.dbg.declare(metadata i32* %z, metadata !15, metadata !DIExpression()), !dbg !16
  tail call void @__coverage__(i32 28, i32 3)
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i32* %y, i32* %x), !dbg !17
  tail call void @__coverage__(i32 29, i32 7)
  %0 = load i32, i32* %y, align 4, !dbg !18
  tail call void @__coverage__(i32 29, i32 9)
  %cmp = icmp sgt i32 %0, 10, !dbg !20
  tail call void @__coverage__(i32 29, i32 7)
  br i1 %cmp, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %entry
  tail call void @__coverage__(i32 30, i32 7)
  store i32 0, i32* %y, align 4, !dbg !22
  tail call void @__coverage__(i32 30, i32 5)
  br label %if.end, !dbg !23

if.else:                                          ; preds = %entry
  tail call void @__coverage__(i32 32, i32 7)
  store i32 1, i32* %y, align 4, !dbg !24
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  tail call void @__coverage__(i32 33, i32 7)
  %1 = load i32, i32* %x, align 4, !dbg !25
  tail call void @__coverage__(i32 33, i32 9)
  %cmp1 = icmp slt i32 %1, 1, !dbg !27
  tail call void @__coverage__(i32 33, i32 7)
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !28

if.then2:                                         ; preds = %if.end
  tail call void @__coverage__(i32 34, i32 9)
  %2 = load i32, i32* %y, align 4, !dbg !29
  tail call void @__coverage__(i32 34, i32 13)
  %3 = load i32, i32* %x, align 4, !dbg !31
  tail call void @__dbz_sanitizer__(i32 %3, i32 34, i32 11)
  tail call void @__coverage__(i32 34, i32 11)
  %div = sdiv i32 %2, %3, !dbg !32
  tail call void @__coverage__(i32 34, i32 7)
  store i32 %div, i32* %z, align 4, !dbg !33
  tail call void @__coverage__(i32 35, i32 3)
  br label %if.end3, !dbg !34

if.end3:                                          ; preds = %if.then2, %if.end
  tail call void @__coverage__(i32 36, i32 1)
  ret void, !dbg !35
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !36 {
entry:
  tail call void @__coverage__(i32 39, i32 3)
  call void @f(), !dbg !39
  tail call void @__coverage__(i32 40, i32 1)
  ret i32 0, !dbg !40
}

declare void @__coverage__(i32, i32)

declare void @__dbz_sanitizer__(i32, i32, i32)

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1-9 (tags/RELEASE_801/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "simple1.c", directory: "/home/cs6340/Documents/Lab-5-Cooperative-Bug-Isolation/cbi/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1-9 (tags/RELEASE_801/final)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 26, type: !8, scopeLine: 26, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 27, type: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 27, column: 7, scope: !7)
!13 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 27, type: !11)
!14 = !DILocation(line: 27, column: 14, scope: !7)
!15 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 27, type: !11)
!16 = !DILocation(line: 27, column: 17, scope: !7)
!17 = !DILocation(line: 28, column: 3, scope: !7)
!18 = !DILocation(line: 29, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 29, column: 7)
!20 = !DILocation(line: 29, column: 9, scope: !19)
!21 = !DILocation(line: 29, column: 7, scope: !7)
!22 = !DILocation(line: 30, column: 7, scope: !19)
!23 = !DILocation(line: 30, column: 5, scope: !19)
!24 = !DILocation(line: 32, column: 7, scope: !19)
!25 = !DILocation(line: 33, column: 7, scope: !26)
!26 = distinct !DILexicalBlock(scope: !7, file: !1, line: 33, column: 7)
!27 = !DILocation(line: 33, column: 9, scope: !26)
!28 = !DILocation(line: 33, column: 7, scope: !7)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !1, line: 33, column: 14)
!31 = !DILocation(line: 34, column: 13, scope: !30)
!32 = !DILocation(line: 34, column: 11, scope: !30)
!33 = !DILocation(line: 34, column: 7, scope: !30)
!34 = !DILocation(line: 35, column: 3, scope: !30)
!35 = !DILocation(line: 36, column: 1, scope: !7)
!36 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 38, type: !37, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DISubroutineType(types: !38)
!38 = !{!11}
!39 = !DILocation(line: 39, column: 3, scope: !36)
!40 = !DILocation(line: 40, column: 1, scope: !36)
