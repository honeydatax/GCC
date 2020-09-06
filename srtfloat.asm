; ModuleID = 'srtfloat.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define void @strsfloat(i8* %s, float %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca float, align 4
  %nn = alloca float, align 4
  %nnn = alloca float, align 4
  %pp = alloca i8, align 1
  %pos = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %signals = alloca float, align 4
  %divsb = alloca float, align 4
  %divsa = alloca float, align 4
  store i8* %s, i8** %1, align 4
  store float %n, float* %2, align 4
  %3 = load float* %2, align 4
  store float %3, float* %nn, align 4
  %4 = load float* %2, align 4
  store float %4, float* %nnn, align 4
  store i8 0, i8* %pp, align 1
  store i32 0, i32* %pos, align 4
  store i32 1, i32* %pos2, align 4
  %5 = load float* %2, align 4
  store float %5, float* %signals, align 4
  store float 1.000000e+02, float* %divsb, align 4
  store float 0.000000e+00, float* %divsa, align 4
  %6 = load i32* %pos, align 4
  %7 = load i8** %1, align 4
  %8 = getelementptr inbounds i8* %7, i32 %6
  store i8 43, i8* %8, align 1
  %9 = load float* %signals, align 4
  %10 = fcmp olt float %9, 0.000000e+00
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %0
  %12 = load i32* %pos, align 4
  %13 = load i8** %1, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  store i8 45, i8* %14, align 1
  %15 = load float* %nn, align 4
  %16 = fsub float 0.000000e+00, %15
  store float %16, float* %nn, align 4
  br label %17

; <label>:17                                      ; preds = %11, %0
  store i32 0, i32* %pos, align 4
  br label %18

; <label>:18                                      ; preds = %57, %17
  %19 = load i32* %pos, align 4
  %20 = icmp slt i32 %19, 5
  br i1 %20, label %21, label %60

; <label>:21                                      ; preds = %18
  %22 = load float* %nn, align 4
  store float %22, float* %nnn, align 4
  %23 = load float* %nn, align 4
  %24 = load float* %divsb, align 4
  %25 = fdiv float %23, %24
  store float %25, float* %divsa, align 4
  %26 = load i32* %pos, align 4
  %27 = icmp eq i32 %26, 3
  br i1 %27, label %28, label %35

; <label>:28                                      ; preds = %21
  %29 = load i32* %pos2, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %pos2, align 4
  %31 = load i32* %pos, align 4
  %32 = add nsw i32 %31, 1
  %33 = load i8** %1, align 4
  %34 = getelementptr inbounds i8* %33, i32 %32
  store i8 46, i8* %34, align 1
  br label %35

; <label>:35                                      ; preds = %28, %21
  %36 = load float* %divsa, align 4
  %37 = fptosi float %36 to i8
  store i8 %37, i8* %pp, align 1
  %38 = load float* %nnn, align 4
  %39 = load float* %divsb, align 4
  %40 = load i8* %pp, align 1
  %41 = sext i8 %40 to i32
  %42 = sitofp i32 %41 to float
  %43 = fmul float %39, %42
  %44 = fsub float %38, %43
  store float %44, float* %nn, align 4
  %45 = load i8* %pp, align 1
  %46 = sext i8 %45 to i32
  %47 = add nsw i32 %46, 48
  %48 = trunc i32 %47 to i8
  store i8 %48, i8* %pp, align 1
  %49 = load i8* %pp, align 1
  %50 = load i32* %pos, align 4
  %51 = load i32* %pos2, align 4
  %52 = add nsw i32 %50, %51
  %53 = load i8** %1, align 4
  %54 = getelementptr inbounds i8* %53, i32 %52
  store i8 %49, i8* %54, align 1
  %55 = load float* %divsb, align 4
  %56 = fdiv float %55, 1.000000e+01
  store float %56, float* %divsb, align 4
  br label %57

; <label>:57                                      ; preds = %35
  %58 = load i32* %pos, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %pos, align 4
  br label %18

; <label>:60                                      ; preds = %18
  %61 = load i32* %pos, align 4
  %62 = load i32* %pos2, align 4
  %63 = add nsw i32 %61, %62
  %64 = load i8** %1, align 4
  %65 = getelementptr inbounds i8* %64, i32 %63
  store i8 0, i8* %65, align 1
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
  call void @strsfloat(i8* %2, float 0x4028AE1480000000)
  %3 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
