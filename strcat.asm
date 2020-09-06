; ModuleID = 'strcat.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [7 x i8] c"hello \00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"world \0A \00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @strslen(i8* %s) #0 {
  %1 = alloca i8*, align 4
  %pos = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i32 0, i32* %pos, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %pos, align 4
  %4 = load i8** %1, align 4
  %5 = getelementptr inbounds i8* %4, i32 %3
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %2
  %10 = load i32* %pos, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %pos, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32* %pos, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @strcats(i8* %s1, i8* %s2) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %pos = alloca i32, align 4
  %s3 = alloca i8*, align 4
  store i8* %s1, i8** %1, align 4
  store i8* %s2, i8** %2, align 4
  store i32 0, i32* %pos, align 4
  %3 = load i8** %1, align 4
  %4 = load i8** %1, align 4
  %5 = call i32 @strslen(i8* %4)
  %6 = getelementptr inbounds i8* %3, i32 %5
  store i8* %6, i8** %s3, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = load i32* %pos, align 4
  %9 = load i8** %2, align 4
  %10 = getelementptr inbounds i8* %9, i32 %8
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14                                      ; preds = %7
  %15 = load i32* %pos, align 4
  %16 = load i8** %2, align 4
  %17 = getelementptr inbounds i8* %16, i32 %15
  %18 = load i8* %17, align 1
  %19 = load i32* %pos, align 4
  %20 = load i8** %s3, align 4
  %21 = getelementptr inbounds i8* %20, i32 %19
  store i8 %18, i8* %21, align 1
  %22 = load i32* %pos, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %pos, align 4
  br label %7

; <label>:24                                      ; preds = %7
  %25 = load i32* %pos, align 4
  %26 = load i8** %2, align 4
  %27 = getelementptr inbounds i8* %26, i32 %25
  %28 = load i8* %27, align 1
  %29 = load i32* %pos, align 4
  %30 = load i8** %s3, align 4
  %31 = getelementptr inbounds i8* %30, i32 %29
  store i8 %28, i8* %31, align 1
  %32 = load i32* %pos, align 4
  ret i32 %32
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  store i8 0, i8* %2, align 1
  %3 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %4 = call i32 @strcats(i8* %3, i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0))
  %5 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %6 = call i32 @strcats(i8* %5, i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  %7 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i8* %7)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
