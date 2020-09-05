; ModuleID = 'todegrees.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call double @toDegrees(double 0x3FF8CCCCC0000000)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define internal double @toDegrees(double %rads) #0 {
  %1 = alloca double, align 8
  store double %rads, double* %1, align 8
  %2 = load double* %1, align 8
  %3 = fmul double %2, 1.800000e+02
  %4 = fdiv double %3, 0x400921FB60000000
  ret double %4
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
