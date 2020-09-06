; ModuleID = 'incmp.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [13 x i8] c"hello world\00\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%d  \0A\00", align 1

; Function Attrs: nounwind
define i32 @incmp(i8* %s, i8* %s2) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %pos = alloca i32, align 4
  %exit = alloca i32, align 4
  %cmp = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i8* %s2, i8** %2, align 4
  store i32 0, i32* %pos, align 4
  store i32 0, i32* %exit, align 4
  store i32 0, i32* %cmp, align 4
  br label %3

; <label>:3                                       ; preds = %53, %0
  %4 = load i32* %exit, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %56

; <label>:6                                       ; preds = %3
  %7 = load i32* %pos, align 4
  %8 = load i8** %1, align 4
  %9 = getelementptr inbounds i8* %8, i32 %7
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = load i32* %pos, align 4
  %13 = load i8** %2, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  %15 = load i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp ne i32 %11, %16
  br i1 %17, label %18, label %53

; <label>:18                                      ; preds = %6
  %19 = load i32* %pos, align 4
  %20 = load i8** %1, align 4
  %21 = getelementptr inbounds i8* %20, i32 %19
  %22 = load i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = load i32* %pos, align 4
  %25 = load i8** %2, align 4
  %26 = getelementptr inbounds i8* %25, i32 %24
  %27 = load i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = icmp sgt i32 %23, %28
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %18
  store i32 1, i32* %cmp, align 4
  br label %31

; <label>:31                                      ; preds = %30, %18
  %32 = load i32* %pos, align 4
  %33 = load i8** %1, align 4
  %34 = getelementptr inbounds i8* %33, i32 %32
  %35 = load i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = load i32* %pos, align 4
  %38 = load i8** %2, align 4
  %39 = getelementptr inbounds i8* %38, i32 %37
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp slt i32 %36, %41
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %31
  store i32 -1, i32* %cmp, align 4
  br label %44

; <label>:44                                      ; preds = %43, %31
  %45 = load i32* %pos, align 4
  %46 = load i8** %2, align 4
  %47 = getelementptr inbounds i8* %46, i32 %45
  %48 = load i8* %47, align 1
  %49 = sext i8 %48 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %52

; <label>:51                                      ; preds = %44
  store i32 0, i32* %cmp, align 4
  br label %52

; <label>:52                                      ; preds = %51, %44
  store i32 1, i32* %exit, align 4
  br label %53

; <label>:53                                      ; preds = %52, %6
  %54 = load i32* %pos, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %pos, align 4
  br label %3

; <label>:56                                      ; preds = %3
  %57 = load i32* %cmp, align 4
  ret i32 %57
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca i8*, align 4
  %s2 = alloca i8*, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  store i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i8** %s1, align 4
  store i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i8** %s2, align 4
  %2 = load i8** %s1, align 4
  %3 = load i8** %s2, align 4
  %4 = call i32 @incmp(i8* %2, i8* %3)
  store i32 %4, i32* %i, align 4
  %5 = load i32* %i, align 4
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i32 %5)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
