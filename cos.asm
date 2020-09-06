; ModuleID = 'cos.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@ccoss.C1 = internal global double 0x3FA555555555554C, align 8
@ccoss.C2 = internal global double 0xBF56C16C16C15177, align 8
@ccoss.C3 = internal global double 0x3EFA01A019CB1590, align 8
@ccoss.C4 = internal global double 0xBE927E4F809C52AD, align 8
@ccoss.C5 = internal global double 0x3E21EE9EBDB4B1C4, align 8
@ccoss.TWO_27 = internal global double 0x41A0000000000000, align 8
@ccoss.C6 = internal global double 0xBDA8FAE9BE8838D4, align 8

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call double @ccoss(double 5.600000e-01, double 0.000000e+00)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define internal double @ccoss(double %x, double %y) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %xx1 = alloca i32, align 4
  %yy1 = alloca i32, align 4
  %z = alloca double, align 8
  %r = alloca double, align 8
  %qx = alloca double, align 8
  store double %x, double* %2, align 8
  store double %y, double* %3, align 8
  %4 = load double* %2, align 8
  %5 = fptosi double %4 to i32
  store i32 %5, i32* %xx1, align 4
  %6 = load double* %3, align 8
  %7 = fptosi double %6 to i32
  store i32 %7, i32* %yy1, align 4
  %8 = load i32* %xx1, align 4
  %9 = icmp slt i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %0
  %11 = load i32* %xx1, align 4
  %12 = sub nsw i32 0, %11
  store i32 %12, i32* %xx1, align 4
  br label %13

; <label>:13                                      ; preds = %10, %0
  %14 = load i32* %yy1, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %13
  %17 = load i32* %yy1, align 4
  %18 = sub nsw i32 0, %17
  store i32 %18, i32* %yy1, align 4
  br label %19

; <label>:19                                      ; preds = %16, %13
  %20 = load double* %2, align 8
  %21 = load double* %2, align 8
  %22 = fmul double %20, %21
  store double %22, double* %z, align 8
  %23 = load double* %z, align 8
  %24 = load double* @ccoss.C1, align 8
  %25 = load double* %z, align 8
  %26 = load double* @ccoss.C2, align 8
  %27 = load double* %z, align 8
  %28 = load double* @ccoss.C3, align 8
  %29 = load double* %z, align 8
  %30 = load double* @ccoss.C4, align 8
  %31 = load double* %z, align 8
  %32 = load double* @ccoss.C5, align 8
  %33 = load double* %z, align 8
  %34 = load double* @ccoss.C6, align 8
  %35 = fmul double %33, %34
  %36 = fadd double %32, %35
  %37 = fmul double %31, %36
  %38 = fadd double %30, %37
  %39 = fmul double %29, %38
  %40 = fadd double %28, %39
  %41 = fmul double %27, %40
  %42 = fadd double %26, %41
  %43 = fmul double %25, %42
  %44 = fadd double %24, %43
  %45 = fmul double %23, %44
  store double %45, double* %r, align 8
  %46 = load double* %2, align 8
  %47 = fcmp olt double %46, 3.000000e-01
  br i1 %47, label %48, label %60

; <label>:48                                      ; preds = %19
  %49 = load double* %z, align 8
  %50 = fmul double 5.000000e-01, %49
  %51 = load double* %z, align 8
  %52 = load double* %r, align 8
  %53 = fmul double %51, %52
  %54 = load double* %2, align 8
  %55 = load double* %3, align 8
  %56 = fmul double %54, %55
  %57 = fsub double %53, %56
  %58 = fsub double %50, %57
  %59 = fsub double 1.000000e+00, %58
  store double %59, double* %1
  br label %84

; <label>:60                                      ; preds = %19
  %61 = load double* %2, align 8
  %62 = fcmp ogt double %61, 7.812500e-01
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %60
  br label %67

; <label>:64                                      ; preds = %60
  %65 = load double* %2, align 8
  %66 = fmul double %65, 2.500000e-01
  br label %67

; <label>:67                                      ; preds = %64, %63
  %68 = phi double [ 2.812500e-01, %63 ], [ %66, %64 ]
  store double %68, double* %qx, align 8
  %69 = load double* %qx, align 8
  %70 = fsub double 1.000000e+00, %69
  %71 = load double* %z, align 8
  %72 = fmul double 5.000000e-01, %71
  %73 = load double* %qx, align 8
  %74 = fsub double %72, %73
  %75 = load double* %z, align 8
  %76 = load double* %r, align 8
  %77 = fmul double %75, %76
  %78 = load double* %2, align 8
  %79 = load double* %3, align 8
  %80 = fmul double %78, %79
  %81 = fsub double %77, %80
  %82 = fsub double %74, %81
  %83 = fsub double %70, %82
  store double %83, double* %1
  br label %84

; <label>:84                                      ; preds = %67, %48
  %85 = load double* %1
  ret double %85
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
