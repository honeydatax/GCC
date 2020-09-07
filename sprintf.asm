; ModuleID = 'sprinftf.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [33 x i8] c"0123456789ABCDEF0123456789ABCDEF\00", align 1
@.str1 = private unnamed_addr constant [13 x i8] c"hello world\0A\00", align 1
@.str2 = private unnamed_addr constant [19 x i8] c"%s\0A%i\0A%l\0A%f\0A%F\0A%x\0A\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"%s \0A\00", align 1

; Function Attrs: nounwind
define i32 @strslen(i8* %s) #0 {
  %1 = alloca i8*, align 4
  %pos = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i32 0, i32* %pos, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load i32* %pos, align 4
  %4 = load i8** %1, align 4
  %5 = getelementptr inbounds i8* %4, i32 %3
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %2
  %10 = load i32* %pos, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %pos, align 4
  br label %2

; <label>:12                                      ; preds = %2
  %13 = load i32* %pos, align 4
  ret i32 %13
}

; Function Attrs: nounwind
define i32 @strcats(i8* %s1, i8* %s2) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %pos = alloca i32, align 4
  %s3 = alloca i8*, align 4
  store i8* %s1, i8** %1, align 4
  store i8* %s2, i8** %2, align 4
  store i32 0, i32* %pos, align 4
  %3 = load i8** %1, align 4
  %4 = load i8** %1, align 4
  %5 = call i32 @strslen(i8* %4)
  %6 = getelementptr inbounds i8* %3, i32 %5
  store i8* %6, i8** %s3, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = load i32* %pos, align 4
  %9 = load i8** %2, align 4
  %10 = getelementptr inbounds i8* %9, i32 %8
  %11 = load i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14                                      ; preds = %7
  %15 = load i32* %pos, align 4
  %16 = load i8** %2, align 4
  %17 = getelementptr inbounds i8* %16, i32 %15
  %18 = load i8* %17, align 1
  %19 = load i32* %pos, align 4
  %20 = load i8** %s3, align 4
  %21 = getelementptr inbounds i8* %20, i32 %19
  store i8 %18, i8* %21, align 1
  %22 = load i32* %pos, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %pos, align 4
  br label %7

; <label>:24                                      ; preds = %7
  %25 = load i32* %pos, align 4
  %26 = load i8** %2, align 4
  %27 = getelementptr inbounds i8* %26, i32 %25
  %28 = load i8* %27, align 1
  %29 = load i32* %pos, align 4
  %30 = load i8** %s3, align 4
  %31 = getelementptr inbounds i8* %30, i32 %29
  store i8 %28, i8* %31, align 1
  %32 = load i32* %pos, align 4
  ret i32 %32
}

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
define void @strslong(i8* %s, i32 %n) #0 {
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
  store i32 2147483647, i32* %signals, align 4
  store i32 1000000000, i32* %divsb, align 4
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
  %24 = icmp slt i32 %23, 10
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
define void @strsdouble(i8* %s, double %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca double, align 8
  %nn = alloca double, align 8
  %nnn = alloca double, align 8
  %pp = alloca i8, align 1
  %pos = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %signals = alloca double, align 8
  %divsb = alloca double, align 8
  %divsa = alloca double, align 8
  store i8* %s, i8** %1, align 4
  store double %n, double* %2, align 8
  %3 = load double* %2, align 8
  store double %3, double* %nn, align 8
  %4 = load double* %2, align 8
  store double %4, double* %nnn, align 8
  store i8 0, i8* %pp, align 1
  store i32 0, i32* %pos, align 4
  store i32 1, i32* %pos2, align 4
  %5 = load double* %2, align 8
  store double %5, double* %signals, align 8
  store double 1.000000e+02, double* %divsb, align 8
  store double 0.000000e+00, double* %divsa, align 8
  %6 = load i32* %pos, align 4
  %7 = load i8** %1, align 4
  %8 = getelementptr inbounds i8* %7, i32 %6
  store i8 43, i8* %8, align 1
  %9 = load double* %signals, align 8
  %10 = fcmp olt double %9, 0.000000e+00
  br i1 %10, label %11, label %17

; <label>:11                                      ; preds = %0
  %12 = load i32* %pos, align 4
  %13 = load i8** %1, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  store i8 45, i8* %14, align 1
  %15 = load double* %nn, align 8
  %16 = fsub double 0.000000e+00, %15
  store double %16, double* %nn, align 8
  br label %17

; <label>:17                                      ; preds = %11, %0
  store i32 0, i32* %pos, align 4
  br label %18

; <label>:18                                      ; preds = %57, %17
  %19 = load i32* %pos, align 4
  %20 = icmp slt i32 %19, 8
  br i1 %20, label %21, label %60

; <label>:21                                      ; preds = %18
  %22 = load double* %nn, align 8
  store double %22, double* %nnn, align 8
  %23 = load double* %nn, align 8
  %24 = load double* %divsb, align 8
  %25 = fdiv double %23, %24
  store double %25, double* %divsa, align 8
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
  %36 = load double* %divsa, align 8
  %37 = fptosi double %36 to i8
  store i8 %37, i8* %pp, align 1
  %38 = load double* %nnn, align 8
  %39 = load double* %divsb, align 8
  %40 = load i8* %pp, align 1
  %41 = sext i8 %40 to i32
  %42 = sitofp i32 %41 to double
  %43 = fmul double %39, %42
  %44 = fsub double %38, %43
  store double %44, double* %nn, align 8
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
  %55 = load double* %divsb, align 8
  %56 = fdiv double %55, 1.000000e+01
  store double %56, double* %divsb, align 8
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
define void @strshex(i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %nn = alloca i32, align 4
  %pos = alloca i32, align 4
  %divsa = alloca i32, align 4
  %signals = alloca i32, align 4
  %signals2 = alloca i32, align 4
  %digits = alloca i8*, align 4
  store i8* %s, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  store i32 %3, i32* %nn, align 4
  store i32 8, i32* %pos, align 4
  store i32 0, i32* %divsa, align 4
  store i32 16, i32* %signals, align 4
  store i32 15, i32* %signals2, align 4
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %digits, align 4
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  store i8 0, i8* %6, align 1
  store i32 7, i32* %pos, align 4
  br label %7

; <label>:7                                       ; preds = %24, %0
  %8 = load i32* %pos, align 4
  %9 = icmp sgt i32 %8, -1
  br i1 %9, label %10, label %27

; <label>:10                                      ; preds = %7
  %11 = load i32* %nn, align 4
  %12 = load i32* %signals2, align 4
  %13 = and i32 %11, %12
  store i32 %13, i32* %divsa, align 4
  %14 = load i32* %divsa, align 4
  %15 = load i8** %digits, align 4
  %16 = getelementptr inbounds i8* %15, i32 %14
  %17 = load i8* %16, align 1
  %18 = load i32* %pos, align 4
  %19 = load i8** %1, align 4
  %20 = getelementptr inbounds i8* %19, i32 %18
  store i8 %17, i8* %20, align 1
  %21 = load i32* %nn, align 4
  %22 = load i32* %signals, align 4
  %23 = sdiv i32 %21, %22
  store i32 %23, i32* %nn, align 4
  br label %24

; <label>:24                                      ; preds = %10
  %25 = load i32* %pos, align 4
  %26 = add nsw i32 %25, -1
  store i32 %26, i32* %pos, align 4
  br label %7

; <label>:27                                      ; preds = %7
  ret void
}

; Function Attrs: nounwind
define void @strs4(i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %nn = alloca i32, align 4
  %pos = alloca i32, align 4
  %divsa = alloca i32, align 4
  %signals = alloca i32, align 4
  %signals2 = alloca i32, align 4
  %digits = alloca i8*, align 4
  store i8* %s, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  store i32 %3, i32* %nn, align 4
  store i32 32, i32* %pos, align 4
  store i32 0, i32* %divsa, align 4
  store i32 4, i32* %signals, align 4
  store i32 3, i32* %signals2, align 4
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %digits, align 4
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  store i8 0, i8* %6, align 1
  %7 = load i32* %pos, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %pos, align 4
  br label %9

; <label>:9                                       ; preds = %32, %0
  %10 = load i32* %pos, align 4
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %35

; <label>:12                                      ; preds = %9
  %13 = load i32* %nn, align 4
  %14 = load i32* %signals2, align 4
  %15 = and i32 %13, %14
  store i32 %15, i32* %divsa, align 4
  %16 = load i32* %divsa, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12
  %19 = load i32* %divsa, align 4
  %20 = sub nsw i32 0, %19
  store i32 %20, i32* %divsa, align 4
  br label %21

; <label>:21                                      ; preds = %18, %12
  %22 = load i32* %divsa, align 4
  %23 = load i8** %digits, align 4
  %24 = getelementptr inbounds i8* %23, i32 %22
  %25 = load i8* %24, align 1
  %26 = load i32* %pos, align 4
  %27 = load i8** %1, align 4
  %28 = getelementptr inbounds i8* %27, i32 %26
  store i8 %25, i8* %28, align 1
  %29 = load i32* %nn, align 4
  %30 = load i32* %signals, align 4
  %31 = sdiv i32 %29, %30
  store i32 %31, i32* %nn, align 4
  br label %32

; <label>:32                                      ; preds = %21
  %33 = load i32* %pos, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %pos, align 4
  br label %9

; <label>:35                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind
define void @strsoct(i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %nn = alloca i32, align 4
  %pos = alloca i32, align 4
  %divsa = alloca i32, align 4
  %signals = alloca i32, align 4
  %signals2 = alloca i32, align 4
  %digits = alloca i8*, align 4
  store i8* %s, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  store i32 %3, i32* %nn, align 4
  store i32 11, i32* %pos, align 4
  store i32 0, i32* %divsa, align 4
  store i32 8, i32* %signals, align 4
  store i32 7, i32* %signals2, align 4
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %digits, align 4
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  store i8 0, i8* %6, align 1
  %7 = load i32* %pos, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %pos, align 4
  br label %9

; <label>:9                                       ; preds = %32, %0
  %10 = load i32* %pos, align 4
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %35

; <label>:12                                      ; preds = %9
  %13 = load i32* %nn, align 4
  %14 = load i32* %signals2, align 4
  %15 = and i32 %13, %14
  store i32 %15, i32* %divsa, align 4
  %16 = load i32* %divsa, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12
  %19 = load i32* %divsa, align 4
  %20 = sub nsw i32 0, %19
  store i32 %20, i32* %divsa, align 4
  br label %21

; <label>:21                                      ; preds = %18, %12
  %22 = load i32* %divsa, align 4
  %23 = load i8** %digits, align 4
  %24 = getelementptr inbounds i8* %23, i32 %22
  %25 = load i8* %24, align 1
  %26 = load i32* %pos, align 4
  %27 = load i8** %1, align 4
  %28 = getelementptr inbounds i8* %27, i32 %26
  store i8 %25, i8* %28, align 1
  %29 = load i32* %nn, align 4
  %30 = load i32* %signals, align 4
  %31 = sdiv i32 %29, %30
  store i32 %31, i32* %nn, align 4
  br label %32

; <label>:32                                      ; preds = %21
  %33 = load i32* %pos, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %pos, align 4
  br label %9

; <label>:35                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind
define void @strsbin(i8* %s, i32 %n) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i32, align 4
  %nn = alloca i32, align 4
  %pos = alloca i32, align 4
  %divsa = alloca i32, align 4
  %signals = alloca i32, align 4
  %signals2 = alloca i32, align 4
  %digits = alloca i8*, align 4
  store i8* %s, i8** %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32* %2, align 4
  store i32 %3, i32* %nn, align 4
  store i32 32, i32* %pos, align 4
  store i32 0, i32* %divsa, align 4
  store i32 2, i32* %signals, align 4
  store i32 1, i32* %signals2, align 4
  store i8* getelementptr inbounds ([33 x i8]* @.str, i32 0, i32 0), i8** %digits, align 4
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  store i8 0, i8* %6, align 1
  %7 = load i32* %pos, align 4
  %8 = sub nsw i32 %7, 1
  store i32 %8, i32* %pos, align 4
  br label %9

; <label>:9                                       ; preds = %32, %0
  %10 = load i32* %pos, align 4
  %11 = icmp sgt i32 %10, -1
  br i1 %11, label %12, label %35

; <label>:12                                      ; preds = %9
  %13 = load i32* %nn, align 4
  %14 = load i32* %signals2, align 4
  %15 = and i32 %13, %14
  store i32 %15, i32* %divsa, align 4
  %16 = load i32* %divsa, align 4
  %17 = icmp slt i32 %16, 0
  br i1 %17, label %18, label %21

; <label>:18                                      ; preds = %12
  %19 = load i32* %divsa, align 4
  %20 = sub nsw i32 0, %19
  store i32 %20, i32* %divsa, align 4
  br label %21

; <label>:21                                      ; preds = %18, %12
  %22 = load i32* %divsa, align 4
  %23 = load i8** %digits, align 4
  %24 = getelementptr inbounds i8* %23, i32 %22
  %25 = load i8* %24, align 1
  %26 = load i32* %pos, align 4
  %27 = load i8** %1, align 4
  %28 = getelementptr inbounds i8* %27, i32 %26
  store i8 %25, i8* %28, align 1
  %29 = load i32* %nn, align 4
  %30 = load i32* %signals, align 4
  %31 = sdiv i32 %29, %30
  store i32 %31, i32* %nn, align 4
  br label %32

; <label>:32                                      ; preds = %21
  %33 = load i32* %pos, align 4
  %34 = add nsw i32 %33, -1
  store i32 %34, i32* %pos, align 4
  br label %9

; <label>:35                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind
define i32 @ssprintf(i8* %stringss, i8* %format, i32 %num, ...) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8*, align 4
  %3 = alloca i32, align 4
  %arguments = alloca [4 x i32], align 4
  %sssss = alloca [32 x i8], align 1
  %ar0 = alloca i32, align 4
  %ar1 = alloca i32, align 4
  %ar2 = alloca float, align 4
  %ar3 = alloca double, align 8
  %sss = alloca i8*, align 4
  %ssss = alloca i8*, align 4
  %nums = alloca i32, align 4
  %count = alloca i32, align 4
  %pos = alloca i32, align 4
  %pos2 = alloca i32, align 4
  %shift = alloca i32, align 4
  %shift2 = alloca i32, align 4
  store i8* %stringss, i8** %1, align 4
  store i8* %format, i8** %2, align 4
  store i32 %num, i32* %3, align 4
  store i32 0, i32* %nums, align 4
  store i32 0, i32* %count, align 4
  store i32 0, i32* %pos, align 4
  store i32 0, i32* %pos2, align 4
  store i32 0, i32* %shift, align 4
  store i32 0, i32* %shift2, align 4
  %4 = load i8** %1, align 4
  %5 = getelementptr inbounds i8* %4, i32 0
  store i8 0, i8* %5, align 1
  store i32 0, i32* %ar0, align 4
  store i32 0, i32* %ar1, align 4
  store float 0.000000e+00, float* %ar2, align 4
  store double 0.000000e+00, double* %ar3, align 8
  %6 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %7 = bitcast i32* %6 to i8*
  call void @llvm.va_start(i8* %7)
  br label %8

; <label>:8                                       ; preds = %215, %0
  %9 = load i32* %pos, align 4
  %10 = load i8** %2, align 4
  %11 = getelementptr inbounds i8* %10, i32 %9
  %12 = load i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %218

; <label>:15                                      ; preds = %8
  %16 = load i32* %shift, align 4
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %40

; <label>:18                                      ; preds = %15
  %19 = load i32* %pos, align 4
  %20 = load i8** %2, align 4
  %21 = getelementptr inbounds i8* %20, i32 %19
  %22 = load i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 37
  br i1 %24, label %25, label %38

; <label>:25                                      ; preds = %18
  %26 = load i32* %pos, align 4
  %27 = load i8** %2, align 4
  %28 = getelementptr inbounds i8* %27, i32 %26
  %29 = load i8* %28, align 1
  %30 = load i32* %pos2, align 4
  %31 = load i8** %1, align 4
  %32 = getelementptr inbounds i8* %31, i32 %30
  store i8 %29, i8* %32, align 1
  %33 = load i32* %pos2, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %pos2, align 4
  %35 = load i32* %pos2, align 4
  %36 = load i8** %1, align 4
  %37 = getelementptr inbounds i8* %36, i32 %35
  store i8 0, i8* %37, align 1
  store i32 0, i32* %shift, align 4
  br label %39

; <label>:38                                      ; preds = %18
  store i32 1, i32* %shift, align 4
  br label %39

; <label>:39                                      ; preds = %38, %25
  br label %215

; <label>:40                                      ; preds = %15
  %41 = load i32* %pos, align 4
  %42 = load i8** %2, align 4
  %43 = getelementptr inbounds i8* %42, i32 %41
  %44 = load i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp eq i32 %45, 115
  br i1 %46, label %47, label %55

; <label>:47                                      ; preds = %40
  %48 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %49 = va_arg i32* %48, i8*
  store i8* %49, i8** %sss, align 4
  %50 = load i8** %1, align 4
  %51 = load i8** %sss, align 4
  %52 = call i32 @strcats(i8* %50, i8* %51)
  %53 = load i8** %1, align 4
  %54 = call i32 @strslen(i8* %53)
  store i32 %54, i32* %pos2, align 4
  br label %55

; <label>:55                                      ; preds = %47, %40
  %56 = load i32* %pos, align 4
  %57 = load i8** %2, align 4
  %58 = getelementptr inbounds i8* %57, i32 %56
  %59 = load i8* %58, align 1
  %60 = sext i8 %59 to i32
  %61 = icmp eq i32 %60, 100
  br i1 %61, label %62, label %72

; <label>:62                                      ; preds = %55
  %63 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %64 = va_arg i32* %63, i32
  store i32 %64, i32* %ar0, align 4
  %65 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %66 = load i32* %ar0, align 4
  call void @strsint(i8* %65, i32 %66)
  %67 = load i8** %1, align 4
  %68 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %69 = call i32 @strcats(i8* %67, i8* %68)
  %70 = load i8** %1, align 4
  %71 = call i32 @strslen(i8* %70)
  store i32 %71, i32* %pos2, align 4
  br label %72

; <label>:72                                      ; preds = %62, %55
  %73 = load i32* %pos, align 4
  %74 = load i8** %2, align 4
  %75 = getelementptr inbounds i8* %74, i32 %73
  %76 = load i8* %75, align 1
  %77 = sext i8 %76 to i32
  %78 = icmp eq i32 %77, 108
  br i1 %78, label %79, label %89

; <label>:79                                      ; preds = %72
  %80 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %81 = va_arg i32* %80, i32
  store i32 %81, i32* %ar1, align 4
  %82 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %83 = load i32* %ar1, align 4
  call void @strslong(i8* %82, i32 %83)
  %84 = load i8** %1, align 4
  %85 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %86 = call i32 @strcats(i8* %84, i8* %85)
  %87 = load i8** %1, align 4
  %88 = call i32 @strslen(i8* %87)
  store i32 %88, i32* %pos2, align 4
  br label %89

; <label>:89                                      ; preds = %79, %72
  %90 = load i32* %pos, align 4
  %91 = load i8** %2, align 4
  %92 = getelementptr inbounds i8* %91, i32 %90
  %93 = load i8* %92, align 1
  %94 = sext i8 %93 to i32
  %95 = icmp eq i32 %94, 102
  br i1 %95, label %96, label %107

; <label>:96                                      ; preds = %89
  %97 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %98 = va_arg i32* %97, double
  %99 = fptrunc double %98 to float
  store float %99, float* %ar2, align 4
  %100 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %101 = load float* %ar2, align 4
  call void @strsfloat(i8* %100, float %101)
  %102 = load i8** %1, align 4
  %103 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %104 = call i32 @strcats(i8* %102, i8* %103)
  %105 = load i8** %1, align 4
  %106 = call i32 @strslen(i8* %105)
  store i32 %106, i32* %pos2, align 4
  br label %107

; <label>:107                                     ; preds = %96, %89
  %108 = load i32* %pos, align 4
  %109 = load i8** %2, align 4
  %110 = getelementptr inbounds i8* %109, i32 %108
  %111 = load i8* %110, align 1
  %112 = sext i8 %111 to i32
  %113 = icmp eq i32 %112, 70
  br i1 %113, label %114, label %124

; <label>:114                                     ; preds = %107
  %115 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %116 = va_arg i32* %115, double
  store double %116, double* %ar3, align 8
  %117 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %118 = load double* %ar3, align 8
  call void @strsdouble(i8* %117, double %118)
  %119 = load i8** %1, align 4
  %120 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %121 = call i32 @strcats(i8* %119, i8* %120)
  %122 = load i8** %1, align 4
  %123 = call i32 @strslen(i8* %122)
  store i32 %123, i32* %pos2, align 4
  br label %124

; <label>:124                                     ; preds = %114, %107
  %125 = load i32* %pos, align 4
  %126 = load i8** %2, align 4
  %127 = getelementptr inbounds i8* %126, i32 %125
  %128 = load i8* %127, align 1
  %129 = sext i8 %128 to i32
  %130 = icmp eq i32 %129, 120
  br i1 %130, label %138, label %131

; <label>:131                                     ; preds = %124
  %132 = load i32* %pos, align 4
  %133 = load i8** %2, align 4
  %134 = getelementptr inbounds i8* %133, i32 %132
  %135 = load i8* %134, align 1
  %136 = sext i8 %135 to i32
  %137 = icmp eq i32 %136, 88
  br i1 %137, label %138, label %150

; <label>:138                                     ; preds = %131, %124
  %139 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %140 = va_arg i32* %139, i32
  %141 = sitofp i32 %140 to double
  store double %141, double* %ar3, align 8
  %142 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %143 = load double* %ar3, align 8
  %144 = fptosi double %143 to i32
  call void @strshex(i8* %142, i32 %144)
  %145 = load i8** %1, align 4
  %146 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %147 = call i32 @strcats(i8* %145, i8* %146)
  %148 = load i8** %1, align 4
  %149 = call i32 @strslen(i8* %148)
  store i32 %149, i32* %pos2, align 4
  br label %150

; <label>:150                                     ; preds = %138, %131
  %151 = load i32* %pos, align 4
  %152 = load i8** %2, align 4
  %153 = getelementptr inbounds i8* %152, i32 %151
  %154 = load i8* %153, align 1
  %155 = sext i8 %154 to i32
  %156 = icmp eq i32 %155, 111
  br i1 %156, label %164, label %157

; <label>:157                                     ; preds = %150
  %158 = load i32* %pos, align 4
  %159 = load i8** %2, align 4
  %160 = getelementptr inbounds i8* %159, i32 %158
  %161 = load i8* %160, align 1
  %162 = sext i8 %161 to i32
  %163 = icmp eq i32 %162, 79
  br i1 %163, label %164, label %176

; <label>:164                                     ; preds = %157, %150
  %165 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %166 = va_arg i32* %165, i32
  %167 = sitofp i32 %166 to double
  store double %167, double* %ar3, align 8
  %168 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %169 = load double* %ar3, align 8
  %170 = fptosi double %169 to i32
  call void @strsoct(i8* %168, i32 %170)
  %171 = load i8** %1, align 4
  %172 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %173 = call i32 @strcats(i8* %171, i8* %172)
  %174 = load i8** %1, align 4
  %175 = call i32 @strslen(i8* %174)
  store i32 %175, i32* %pos2, align 4
  br label %176

; <label>:176                                     ; preds = %164, %157
  %177 = load i32* %pos, align 4
  %178 = load i8** %2, align 4
  %179 = getelementptr inbounds i8* %178, i32 %177
  %180 = load i8* %179, align 1
  %181 = sext i8 %180 to i32
  %182 = icmp eq i32 %181, 52
  br i1 %182, label %183, label %195

; <label>:183                                     ; preds = %176
  %184 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %185 = va_arg i32* %184, i32
  %186 = sitofp i32 %185 to double
  store double %186, double* %ar3, align 8
  %187 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %188 = load double* %ar3, align 8
  %189 = fptosi double %188 to i32
  call void @strs4(i8* %187, i32 %189)
  %190 = load i8** %1, align 4
  %191 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %192 = call i32 @strcats(i8* %190, i8* %191)
  %193 = load i8** %1, align 4
  %194 = call i32 @strslen(i8* %193)
  store i32 %194, i32* %pos2, align 4
  br label %195

; <label>:195                                     ; preds = %183, %176
  %196 = load i32* %pos, align 4
  %197 = load i8** %2, align 4
  %198 = getelementptr inbounds i8* %197, i32 %196
  %199 = load i8* %198, align 1
  %200 = sext i8 %199 to i32
  %201 = icmp eq i32 %200, 98
  br i1 %201, label %202, label %214

; <label>:202                                     ; preds = %195
  %203 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %204 = va_arg i32* %203, i32
  %205 = sitofp i32 %204 to double
  store double %205, double* %ar3, align 8
  %206 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %207 = load double* %ar3, align 8
  %208 = fptosi double %207 to i32
  call void @strsbin(i8* %206, i32 %208)
  %209 = load i8** %1, align 4
  %210 = getelementptr inbounds [32 x i8]* %sssss, i32 0, i32 0
  %211 = call i32 @strcats(i8* %209, i8* %210)
  %212 = load i8** %1, align 4
  %213 = call i32 @strslen(i8* %212)
  store i32 %213, i32* %pos2, align 4
  br label %214

; <label>:214                                     ; preds = %202, %195
  store i32 0, i32* %shift, align 4
  br label %215

; <label>:215                                     ; preds = %214, %39
  %216 = load i32* %pos, align 4
  %217 = add nsw i32 %216, 1
  store i32 %217, i32* %pos, align 4
  br label %8

; <label>:218                                     ; preds = %8
  %219 = getelementptr inbounds [4 x i32]* %arguments, i32 0, i32 0
  %220 = bitcast i32* %219 to i8*
  call void @llvm.va_end(i8* %220)
  %221 = load i32* %pos, align 4
  ret i32 %221
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca i8*, align 4
  %i = alloca i32, align 4
  %l = alloca i32, align 4
  %f = alloca float, align 4
  %F = alloca double, align 8
  %s1 = alloca [10000 x i8], align 1
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([13 x i8]* @.str1, i32 0, i32 0), i8** %s, align 4
  store i32 12345, i32* %i, align 4
  store i32 123456789, i32* %l, align 4
  store float 0x4028AE1480000000, float* %f, align 4
  store double 0x4028B0F280000000, double* %F, align 8
  %2 = getelementptr inbounds [10000 x i8]* %s1, i32 0, i32 0
  %3 = load i32* %i, align 4
  %4 = load i32* %l, align 4
  %5 = load float* %f, align 4
  %6 = fpext float %5 to double
  %7 = load double* %F, align 8
  %8 = call i32 (i8*, i8*, i32, ...)* @ssprintf(i8* %2, i8* getelementptr inbounds ([19 x i8]* @.str2, i32 0, i32 0), i32 5, i32 %3, i32 %4, double %6, double %7, i32 305419896)
  %9 = getelementptr inbounds [10000 x i8]* %s1, i32 0, i32 0
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str3, i32 0, i32 0), i8* %9)
  ret i32 0
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
