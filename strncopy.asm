; ModuleID = 'strncopys.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @strncopy(i8* %s1, i8* %s2, i32 %size) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %pos = alloca i32, align 4
  store i8* %s1, i8** %1, align 4
  store i8* %s2, i8** %2, align 4
  store i32 %size, i32* %3, align 4
  store i32 0, i32* %pos, align 4
  br label %4

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %pos, align 4
  %6 = load i32* %3, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %18

; <label>:8                                       ; preds = %4
  %9 = load i32* %pos, align 4
  %10 = load i8** %2, align 4
  %11 = getelementptr inbounds i8* %10, i32 %9
  %12 = load i8* %11, align 1
  %13 = load i32* %pos, align 4
  %14 = load i8** %1, align 4
  %15 = getelementptr inbounds i8* %14, i32 %13
  store i8 %12, i8* %15, align 1
  %16 = load i32* %pos, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %pos, align 4
  br label %4

; <label>:18                                      ; preds = %4
  %19 = load i32* %pos, align 4
  ret i32 %19
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
  %4 = call i32 @strncopy(i8* %2, i8* %3, i32 20)
  %5 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
