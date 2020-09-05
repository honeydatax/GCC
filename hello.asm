; ModuleID = 'hello.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %c = alloca i8*, align 4
  store i32 0, i32* %1
  %2 = call i8* @c_hello()
  store i8* %2, i8** %c, align 4
  %3 = load i8** %c, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define i8* @c_hello() #0 {
  ret i8* getelementptr inbounds ([13 x i8]* @.str1, i32 0, i32 0)
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
