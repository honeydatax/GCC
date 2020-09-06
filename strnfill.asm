; ModuleID = 'strnfill.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @strnfill(i8* %s1, i8 signext %c, i32 %size) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8, align 1
  %3 = alloca i32, align 4
  %pos = alloca i32, align 4
  store i8* %s1, i8** %1, align 4
  store i8 %c, i8* %2, align 1
  store i32 %size, i32* %3, align 4
  store i32 0, i32* %pos, align 4
  br label %4

; <label>:4                                       ; preds = %8, %0
  %5 = load i32* %pos, align 4
  %6 = load i32* %3, align 4
  %7 = icmp sle i32 %5, %6
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %4
  %9 = load i8* %2, align 1
  %10 = load i32* %pos, align 4
  %11 = load i8** %1, align 4
  %12 = getelementptr inbounds i8* %11, i32 %10
  store i8 %9, i8* %12, align 1
  %13 = load i32* %pos, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %pos, align 4
  br label %4

; <label>:15                                      ; preds = %4
  %16 = load i32* %pos, align 4
  ret i32 %16
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  store i32 0, i32* %1
  store i32 16, i32* %i, align 4
  %2 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %3 = load i32* %i, align 4
  %4 = call i32 @strnfill(i8* %2, i8 signext 42, i32 %3)
  %5 = load i32* %i, align 4
  %6 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 %5
  store i8 0, i8* %6, align 1
  %7 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* %7)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
