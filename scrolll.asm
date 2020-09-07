; ModuleID = 'srolll.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@main.s = private unnamed_addr constant [80 x i8] c"hello world\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str = private unnamed_addr constant [5 x i8] c"%s \0A\00", align 1

; Function Attrs: nounwind
define i32 @scrolll(i8* %s1) #0 {
  %1 = alloca i8*, align 4
  %i = alloca i32, align 4
  %size = alloca i32, align 4
  %s2 = alloca i8*, align 4
  %s3 = alloca i8*, align 4
  store i8* %s1, i8** %1, align 4
  store i32 0, i32* %i, align 4
  %2 = load i8** %1, align 4
  %3 = call i32 @strlen(i8* %2)
  store i32 %3, i32* %size, align 4
  %4 = load i8** %1, align 4
  %5 = getelementptr inbounds i8* %4, i32 1
  store i8* %5, i8** %s2, align 4
  %6 = load i8** %1, align 4
  store i8* %6, i8** %s3, align 4
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %19, %0
  %8 = load i32* %i, align 4
  %9 = load i32* %size, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

; <label>:11                                      ; preds = %7
  %12 = load i32* %i, align 4
  %13 = load i8** %s2, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  %15 = load i8* %14, align 1
  %16 = load i32* %i, align 4
  %17 = load i8** %s3, align 4
  %18 = getelementptr inbounds i8* %17, i32 %16
  store i8 %15, i8* %18, align 1
  br label %19

; <label>:19                                      ; preds = %11
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %7

; <label>:22                                      ; preds = %7
  %23 = load i32* %i, align 4
  %24 = load i8** %s2, align 4
  %25 = getelementptr inbounds i8* %24, i32 %23
  store i8 0, i8* %25, align 1
  %26 = load i32* %i, align 4
  ret i32 %26
}

declare i32 @strlen(i8*) #1

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca [80 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [80 x i8]* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* getelementptr inbounds ([80 x i8]* @main.s, i32 0, i32 0), i32 80, i32 1, i1 false)
  %3 = getelementptr inbounds [80 x i8]* %s, i32 0, i32 0
  %4 = call i32 @scrolll(i8* %3)
  %5 = getelementptr inbounds [80 x i8]* %s, i32 0, i32 0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* %5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #2

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
