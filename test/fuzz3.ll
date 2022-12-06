; ModuleID = 'fuzz3.c'
source_filename = "fuzz3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque

@stdin = external dso_local global %struct._IO_FILE*, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @xval(i8* %i) #0 !dbg !7 {
entry:
  %retval = alloca i32, align 4
  %i.addr = alloca i8*, align 8
  store i8* %i, i8** %i.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %i.addr, metadata !13, metadata !DIExpression()), !dbg !14
  %0 = load i8*, i8** %i.addr, align 8, !dbg !15
  %call = call i64 @strlen(i8* %0) #4, !dbg !17
  %rem = urem i64 %call, 2, !dbg !18
  %cmp = icmp eq i64 %rem, 0, !dbg !19
  br i1 %cmp, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !21
  br label %return, !dbg !21

if.else:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !23
  br label %return, !dbg !23

return:                                           ; preds = %if.else, %if.then
  %1 = load i32, i32* %retval, align 4, !dbg !25
  ret i32 %1, !dbg !25
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readonly
declare dso_local i64 @strlen(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !26 {
entry:
  %retval = alloca i32, align 4
  %input = alloca [65536 x i8], align 16
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [65536 x i8]* %input, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !34
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stdin, align 8, !dbg !35
  %call = call i8* @fgets(i8* %arraydecay, i32 65536, %struct._IO_FILE* %0), !dbg !36
  call void @llvm.dbg.declare(metadata i32* %x, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %x, align 4, !dbg !38
  call void @llvm.dbg.declare(metadata i32* %y, metadata !39, metadata !DIExpression()), !dbg !40
  store i32 2, i32* %y, align 4, !dbg !40
  call void @llvm.dbg.declare(metadata i32* %z, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay1 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !43
  %call2 = call i64 @strlen(i8* %arraydecay1) #4, !dbg !45
  %rem = urem i64 %call2, 7, !dbg !46
  %cmp = icmp eq i64 %rem, 0, !dbg !47
  br i1 %cmp, label %if.then, label %if.end, !dbg !48

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %y, align 4, !dbg !49
  %2 = load i32, i32* %x, align 4, !dbg !51
  %div = sdiv i32 %1, %2, !dbg !52
  store i32 %div, i32* %z, align 4, !dbg !53
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %entry
  %arraydecay3 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !55
  %call4 = call i64 @strlen(i8* %arraydecay3) #4, !dbg !57
  %rem5 = urem i64 %call4, 13, !dbg !58
  %cmp6 = icmp eq i64 %rem5, 0, !dbg !59
  br i1 %cmp6, label %if.then7, label %if.end9, !dbg !60

if.then7:                                         ; preds = %if.end
  %3 = load i32, i32* %y, align 4, !dbg !61
  %4 = load i32, i32* %x, align 4, !dbg !63
  %inc = add nsw i32 %4, 1, !dbg !63
  store i32 %inc, i32* %x, align 4, !dbg !63
  %div8 = sdiv i32 %3, %inc, !dbg !64
  store i32 %div8, i32* %z, align 4, !dbg !65
  br label %if.end9, !dbg !66

if.end9:                                          ; preds = %if.then7, %if.end
  %arraydecay10 = getelementptr inbounds [65536 x i8], [65536 x i8]* %input, i32 0, i32 0, !dbg !67
  %call11 = call i32 @xval(i8* %arraydecay10), !dbg !69
  %tobool = icmp ne i32 %call11, 0, !dbg !69
  br i1 %tobool, label %if.then12, label %if.end14, !dbg !70

if.then12:                                        ; preds = %if.end9
  %5 = load i32, i32* %y, align 4, !dbg !71
  %6 = load i32, i32* %x, align 4, !dbg !73
  %div13 = sdiv i32 %5, %6, !dbg !74
  store i32 %div13, i32* %z, align 4, !dbg !75
  br label %if.end14, !dbg !76

if.end14:                                         ; preds = %if.then12, %if.end9
  ret i32 0, !dbg !77
}

declare dso_local i8* @fgets(i8*, i32, %struct._IO_FILE*) #3

attributes #0 = { noinline nounwind optnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1-9 (tags/RELEASE_801/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "fuzz3.c", directory: "/home/cs6340/Documents/Lab-5-Cooperative-Bug-Isolation/cbi/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1-9 (tags/RELEASE_801/final)"}
!7 = distinct !DISubprogram(name: "xval", scope: !1, file: !1, line: 27, type: !8, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!13 = !DILocalVariable(name: "i", arg: 1, scope: !7, file: !1, line: 27, type: !11)
!14 = !DILocation(line: 27, column: 16, scope: !7)
!15 = !DILocation(line: 28, column: 15, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 28, column: 7)
!17 = !DILocation(line: 28, column: 8, scope: !16)
!18 = !DILocation(line: 28, column: 18, scope: !16)
!19 = !DILocation(line: 28, column: 23, scope: !16)
!20 = !DILocation(line: 28, column: 7, scope: !7)
!21 = !DILocation(line: 29, column: 5, scope: !22)
!22 = distinct !DILexicalBlock(scope: !16, file: !1, line: 28, column: 29)
!23 = !DILocation(line: 31, column: 5, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !1, line: 30, column: 10)
!25 = !DILocation(line: 33, column: 1, scope: !7)
!26 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 35, type: !27, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!27 = !DISubroutineType(types: !28)
!28 = !{!10}
!29 = !DILocalVariable(name: "input", scope: !26, file: !1, line: 36, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !12, size: 524288, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 65536)
!33 = !DILocation(line: 36, column: 8, scope: !26)
!34 = !DILocation(line: 37, column: 9, scope: !26)
!35 = !DILocation(line: 37, column: 31, scope: !26)
!36 = !DILocation(line: 37, column: 3, scope: !26)
!37 = !DILocalVariable(name: "x", scope: !26, file: !1, line: 38, type: !10)
!38 = !DILocation(line: 38, column: 7, scope: !26)
!39 = !DILocalVariable(name: "y", scope: !26, file: !1, line: 39, type: !10)
!40 = !DILocation(line: 39, column: 7, scope: !26)
!41 = !DILocalVariable(name: "z", scope: !26, file: !1, line: 40, type: !10)
!42 = !DILocation(line: 40, column: 7, scope: !26)
!43 = !DILocation(line: 42, column: 14, scope: !44)
!44 = distinct !DILexicalBlock(scope: !26, file: !1, line: 42, column: 7)
!45 = !DILocation(line: 42, column: 7, scope: !44)
!46 = !DILocation(line: 42, column: 21, scope: !44)
!47 = !DILocation(line: 42, column: 25, scope: !44)
!48 = !DILocation(line: 42, column: 7, scope: !26)
!49 = !DILocation(line: 43, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !44, file: !1, line: 42, column: 31)
!51 = !DILocation(line: 43, column: 13, scope: !50)
!52 = !DILocation(line: 43, column: 11, scope: !50)
!53 = !DILocation(line: 43, column: 7, scope: !50)
!54 = !DILocation(line: 44, column: 3, scope: !50)
!55 = !DILocation(line: 46, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !26, file: !1, line: 46, column: 7)
!57 = !DILocation(line: 46, column: 7, scope: !56)
!58 = !DILocation(line: 46, column: 21, scope: !56)
!59 = !DILocation(line: 46, column: 26, scope: !56)
!60 = !DILocation(line: 46, column: 7, scope: !26)
!61 = !DILocation(line: 47, column: 9, scope: !62)
!62 = distinct !DILexicalBlock(scope: !56, file: !1, line: 46, column: 32)
!63 = !DILocation(line: 47, column: 13, scope: !62)
!64 = !DILocation(line: 47, column: 11, scope: !62)
!65 = !DILocation(line: 47, column: 7, scope: !62)
!66 = !DILocation(line: 48, column: 3, scope: !62)
!67 = !DILocation(line: 50, column: 12, scope: !68)
!68 = distinct !DILexicalBlock(scope: !26, file: !1, line: 50, column: 7)
!69 = !DILocation(line: 50, column: 7, scope: !68)
!70 = !DILocation(line: 50, column: 7, scope: !26)
!71 = !DILocation(line: 51, column: 9, scope: !72)
!72 = distinct !DILexicalBlock(scope: !68, file: !1, line: 50, column: 20)
!73 = !DILocation(line: 51, column: 13, scope: !72)
!74 = !DILocation(line: 51, column: 11, scope: !72)
!75 = !DILocation(line: 51, column: 7, scope: !72)
!76 = !DILocation(line: 52, column: 3, scope: !72)
!77 = !DILocation(line: 54, column: 3, scope: !26)
