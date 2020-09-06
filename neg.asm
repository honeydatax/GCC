; ModuleID = 'neg.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [8 x i8] c"%d<<%d\0A\00", align 1

; Function Attrs: nounwind
define i32 @neg(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sub nsw i32 0, %2
  ret i32 %3
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %10, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 15
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = load i32* %i, align 4
  %8 = call i32 @neg(i32 %7)
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %6, i32 %8)
  br label %10

; <label>:10                                      ; preds = %5
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %2

; <label>:13                                      ; preds = %2
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
