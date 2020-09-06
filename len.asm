; ModuleID = 'len.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%s  %d\0A\00", align 1

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
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %hello = alloca i8*, align 4
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i8** %hello, align 4
  %2 = load i8** %hello, align 4
  %3 = load i8** %hello, align 4
  %4 = call i32 @strslen(i8* %3)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i8* %2, i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
