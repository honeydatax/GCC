; ModuleID = 'copy.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

; Function Attrs: nounwind
define i8* @copys(i8* %s) #0 {
  %1 = alloca i8*, align 4
  store i8* %s, i8** %1, align 4
  %2 = load i8** %1, align 4
  ret i8* %2
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
