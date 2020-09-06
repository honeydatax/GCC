; ModuleID = 'strcopys.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @strcopy(i8* %s1, i8* %s2) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %pos = alloca i32, align 4
  store i8* %s1, i8** %1, align 4
  store i8* %s2, i8** %2, align 4
  store i32 0, i32* %pos, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %pos, align 4
  %5 = load i8** %2, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  %7 = load i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %20

; <label>:10                                      ; preds = %3
  %11 = load i32* %pos, align 4
  %12 = load i8** %2, align 4
  %13 = getelementptr inbounds i8* %12, i32 %11
  %14 = load i8* %13, align 1
  %15 = load i32* %pos, align 4
  %16 = load i8** %1, align 4
  %17 = getelementptr inbounds i8* %16, i32 %15
  store i8 %14, i8* %17, align 1
  %18 = load i32* %pos, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %pos, align 4
  br label %3

; <label>:20                                      ; preds = %3
  %21 = load i32* %pos, align 4
  %22 = load i8** %2, align 4
  %23 = getelementptr inbounds i8* %22, i32 %21
  %24 = load i8* %23, align 1
  %25 = load i32* %pos, align 4
  %26 = load i8** %1, align 4
  %27 = getelementptr inbounds i8* %26, i32 %25
  store i8 %24, i8* %27, align 1
  %28 = load i32* %pos, align 4
  ret i32 %28
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  %hello = alloca i8*, align 4
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i8** %hello, align 4
  %2 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %3 = load i8** %hello, align 4
  %4 = call i32 @strcopy(i8* %2, i8* %3)
  %5 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
