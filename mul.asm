; ModuleID = 'mul.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

; Function Attrs: nounwind
define i32 @muls(i32 %i, i32 %ii) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %ii, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = mul nsw i32 %3, %4
  ret i32 %5
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
