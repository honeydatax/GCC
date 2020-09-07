; ModuleID = 'srolllr.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@main.s = private unnamed_addr constant [80 x i8] c"hello world\0A\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str = private unnamed_addr constant [5 x i8] c"%s \0A\00", align 1

; Function Attrs: nounwind
define i32 @scrollr(i8* %s1, i8 signext %c) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8, align 1
  %i = alloca i32, align 4
  %size = alloca i32, align 4
  %s2 = alloca i8*, align 4
  %s3 = alloca i8*, align 4
  store i8* %s1, i8** %1, align 4
  store i8 %c, i8* %2, align 1
  store i32 0, i32* %i, align 4
  %3 = load i8** %1, align 4
  %4 = call i32 @strlen(i8* %3)
  store i32 %4, i32* %size, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 1
  store i8* %6, i8** %s2, align 4
  %7 = load i8** %1, align 4
  store i8* %7, i8** %s3, align 4
  %8 = load i32* %size, align 4
  %9 = add nsw i32 %8, 1
  %10 = load i8** %s3, align 4
  %11 = getelementptr inbounds i8* %10, i32 %9
  store i8 0, i8* %11, align 1
  %12 = load i32* %size, align 4
  store i32 %12, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %24, %0
  %14 = load i32* %i, align 4
  %15 = icmp sgt i32 %14, -1
  br i1 %15, label %16, label %27

; <label>:16                                      ; preds = %13
  %17 = load i32* %i, align 4
  %18 = load i8** %s3, align 4
  %19 = getelementptr inbounds i8* %18, i32 %17
  %20 = load i8* %19, align 1
  %21 = load i32* %i, align 4
  %22 = load i8** %s2, align 4
  %23 = getelementptr inbounds i8* %22, i32 %21
  store i8 %20, i8* %23, align 1
  br label %24

; <label>:24                                      ; preds = %16
  %25 = load i32* %i, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* %i, align 4
  br label %13

; <label>:27                                      ; preds = %13
  %28 = load i8* %2, align 1
  %29 = load i8** %s3, align 4
  %30 = getelementptr inbounds i8* %29, i32 0
  store i8 %28, i8* %30, align 1
  %31 = load i32* %size, align 4
  ret i32 %31
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
  %4 = call i32 @scrollr(i8* %3, i8 signext 46)
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
