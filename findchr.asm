; ModuleID = 'findchr.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [14 x i8] c"HeLlO wOrLd \0A\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%d  \0A\00", align 1

; Function Attrs: nounwind
define i32 @findchar(i8* %s, i8 signext %c) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8, align 1
  %pos = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i8 %c, i8* %2, align 1
  store i32 0, i32* %pos, align 4
  br label %3

; <label>:3                                       ; preds = %21, %0
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  %7 = load i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %3
  %11 = load i32* %pos, align 4
  %12 = load i8** %1, align 4
  %13 = getelementptr inbounds i8* %12, i32 %11
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = load i8* %2, align 1
  %17 = sext i8 %16 to i32
  %18 = icmp ne i32 %15, %17
  br label %19

; <label>:19                                      ; preds = %10, %3
  %20 = phi i1 [ false, %3 ], [ %18, %10 ]
  br i1 %20, label %21, label %24

; <label>:21                                      ; preds = %19
  %22 = load i32* %pos, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %pos, align 4
  br label %3

; <label>:24                                      ; preds = %19
  %25 = load i32* %pos, align 4
  %26 = load i8** %1, align 4
  %27 = getelementptr inbounds i8* %26, i32 %25
  %28 = load i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = load i8* %2, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %29, %31
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %24
  store i32 -1, i32* %pos, align 4
  br label %34

; <label>:34                                      ; preds = %33, %24
  %35 = load i32* %pos, align 4
  ret i32 %35
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca i8*, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  store i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i8** %s1, align 4
  %2 = load i8** %s1, align 4
  %3 = call i32 @findchar(i8* %2, i8 signext 119)
  store i32 %3, i32* %i, align 4
  %4 = load i32* %i, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 %4)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
