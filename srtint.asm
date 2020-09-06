; ModuleID = 'srtint.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define void @strsint(i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %nn = alloca i32, align 4
  %pos = alloca i32, align 4
  %signals = alloca i32, align 4
  %divsb = alloca i32, align 4
  %divsa = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  store i32 %3, i32* %nn, align 4
  store i32 0, i32* %pos, align 4
  store i32 32767, i32* %signals, align 4
  store i32 10000, i32* %divsb, align 4
  store i32 0, i32* %divsa, align 4
  %4 = load i32* %signals, align 4
  %5 = load i32* %nn, align 4
  %6 = and i32 %4, %5
  store i32 %6, i32* %nn, align 4
  %7 = load i32* %signals, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %signals, align 4
  %9 = load i32* %signals, align 4
  %10 = load i32* %2, align 4
  %11 = and i32 %9, %10
  store i32 %11, i32* %signals, align 4
  %12 = load i32* %pos, align 4
  %13 = load i8** %1, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  store i8 43, i8* %14, align 1
  %15 = load i32* %signals, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %21

; <label>:17                                      ; preds = %0
  %18 = load i32* %pos, align 4
  %19 = load i8** %1, align 4
  %20 = getelementptr inbounds i8* %19, i32 %18
  store i8 45, i8* %20, align 1
  br label %21

; <label>:21                                      ; preds = %17, %0
  store i32 0, i32* %pos, align 4
  br label %22

; <label>:22                                      ; preds = %42, %21
  %23 = load i32* %pos, align 4
  %24 = icmp slt i32 %23, 5
  br i1 %24, label %25, label %45

; <label>:25                                      ; preds = %22
  %26 = load i32* %nn, align 4
  %27 = load i32* %divsb, align 4
  %28 = sdiv i32 %26, %27
  store i32 %28, i32* %divsa, align 4
  %29 = load i32* %divsa, align 4
  %30 = add nsw i32 %29, 48
  store i32 %30, i32* %divsa, align 4
  %31 = load i32* %divsa, align 4
  %32 = trunc i32 %31 to i8
  %33 = load i32* %pos, align 4
  %34 = add nsw i32 %33, 1
  %35 = load i8** %1, align 4
  %36 = getelementptr inbounds i8* %35, i32 %34
  store i8 %32, i8* %36, align 1
  %37 = load i32* %nn, align 4
  %38 = load i32* %divsb, align 4
  %39 = srem i32 %37, %38
  store i32 %39, i32* %nn, align 4
  %40 = load i32* %divsb, align 4
  %41 = sdiv i32 %40, 10
  store i32 %41, i32* %divsb, align 4
  br label %42

; <label>:42                                      ; preds = %25
  %43 = load i32* %pos, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %pos, align 4
  br label %22

; <label>:45                                      ; preds = %22
  %46 = load i32* %pos, align 4
  %47 = add nsw i32 %46, 1
  %48 = load i8** %1, align 4
  %49 = getelementptr inbounds i8* %48, i32 %47
  store i8 0, i8* %49, align 1
  ret void
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  %2 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  call void @strsint(i8* %2, i32 12345)
  %3 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
