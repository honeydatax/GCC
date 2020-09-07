; ModuleID = 'adigit.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [5 x i8] c"%s \0A\00", align 1

; Function Attrs: nounwind
define void @adigit(i8* %s1, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %c1 = alloca i8, align 1
  store i8* %s1, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  store i32 0, i32* %i, align 4
  store i8 0, i8* %c1, align 1
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %23, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %26

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = add nsw i32 48, %8
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %c1, align 1
  %11 = load i32* %i, align 4
  %12 = icmp sgt i32 %11, 9
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %7
  %14 = load i32* %i, align 4
  %15 = add nsw i32 65, %14
  %16 = sub nsw i32 %15, 10
  %17 = trunc i32 %16 to i8
  store i8 %17, i8* %c1, align 1
  br label %18

; <label>:18                                      ; preds = %13, %7
  %19 = load i8* %c1, align 1
  %20 = load i32* %i, align 4
  %21 = load i8** %1, align 4
  %22 = getelementptr inbounds i8* %21, i32 %20
  store i8 %19, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %18
  %24 = load i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %3

; <label>:26                                      ; preds = %3
  %27 = load i32* %2, align 4
  %28 = load i8** %1, align 4
  %29 = getelementptr inbounds i8* %28, i32 %27
  store i8 0, i8* %29, align 1
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca [80 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [80 x i8]* %s, i32 0, i32 0
  call void @adigit(i8* %2, i32 16)
  %3 = getelementptr inbounds [80 x i8]* %s, i32 0, i32 0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
