; ModuleID = 'ssin.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [4 x i8] c"%f\0A\00", align 1
@ssin.S1 = internal global double 0xBFC5555555555549, align 8
@ssin.S2 = internal global double 0x3F8111111110F8A6, align 8
@ssin.S3 = internal global double 0xBF2A01A019C161D5, align 8
@ssin.S4 = internal global double 0x3EC71DE357B1FE7D, align 8
@ssin.S5 = internal global double 0xBE5AE5E68A2B9CEB, align 8
@ssin.TWO_27 = internal global double 0x41A0000000000000, align 8
@ssin.S6 = internal global double 0x3DE5D93A5ACFD57C, align 8

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call double @ssin(double 5.600000e-01, double 0.000000e+00)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), double %2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
define internal double @ssin(double %x, double %y) #0 {
  %1 = alloca double, align 8
  %2 = alloca double, align 8
  %3 = alloca double, align 8
  %xx1 = alloca i32, align 4
  %yy1 = alloca i32, align 4
  %z = alloca double, align 8
  %v = alloca double, align 8
  %r = alloca double, align 8
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
  %20 = load i32* %xx1, align 4
  %21 = load i32* %yy1, align 4
  %22 = add nsw i32 %20, %21
  %23 = sitofp i32 %22 to float
  %24 = fcmp ogt float %23, 0x3FE921FF20000000
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %19
  store double 0.000000e+00, double* %1
  br label %87

; <label>:26                                      ; preds = %19
  %27 = load i32* %xx1, align 4
  %28 = sitofp i32 %27 to double
  %29 = load double* @ssin.TWO_27, align 8
  %30 = fdiv double 1.000000e+00, %29
  %31 = fcmp olt double %28, %30
  br i1 %31, label %32, label %34

; <label>:32                                      ; preds = %26
  %33 = load double* %2, align 8
  store double %33, double* %1
  br label %87

; <label>:34                                      ; preds = %26
  %35 = load double* %2, align 8
  %36 = load double* %2, align 8
  %37 = fmul double %35, %36
  store double %37, double* %z, align 8
  %38 = load double* %z, align 8
  %39 = load double* %2, align 8
  %40 = fmul double %38, %39
  store double %40, double* %v, align 8
  %41 = load double* @ssin.S2, align 8
  %42 = load double* %z, align 8
  %43 = load double* @ssin.S3, align 8
  %44 = load double* %z, align 8
  %45 = load double* @ssin.S4, align 8
  %46 = load double* %z, align 8
  %47 = load double* @ssin.S5, align 8
  %48 = load double* %z, align 8
  %49 = load double* @ssin.S6, align 8
  %50 = fmul double %48, %49
  %51 = fadd double %47, %50
  %52 = fmul double %46, %51
  %53 = fadd double %45, %52
  %54 = fmul double %44, %53
  %55 = fadd double %43, %54
  %56 = fmul double %42, %55
  %57 = fadd double %41, %56
  store double %57, double* %r, align 8
  %58 = load double* %3, align 8
  %59 = fcmp oeq double %58, 0.000000e+00
  br i1 %59, label %60, label %70

; <label>:60                                      ; preds = %34
  %61 = load double* %2, align 8
  %62 = load double* %v, align 8
  %63 = load double* @ssin.S1, align 8
  %64 = load double* %z, align 8
  %65 = load double* %r, align 8
  %66 = fmul double %64, %65
  %67 = fadd double %63, %66
  %68 = fmul double %62, %67
  %69 = fadd double %61, %68
  store double %69, double* %1
  br label %87

; <label>:70                                      ; preds = %34
  %71 = load double* %2, align 8
  %72 = load double* %z, align 8
  %73 = load double* %3, align 8
  %74 = fmul double 5.000000e-01, %73
  %75 = load double* %v, align 8
  %76 = load double* %r, align 8
  %77 = fmul double %75, %76
  %78 = fsub double %74, %77
  %79 = fmul double %72, %78
  %80 = load double* %3, align 8
  %81 = fsub double %79, %80
  %82 = load double* %v, align 8
  %83 = load double* @ssin.S1, align 8
  %84 = fmul double %82, %83
  %85 = fsub double %81, %84
  %86 = fsub double %71, %85
  store double %86, double* %1
  br label %87

; <label>:87                                      ; preds = %70, %60, %32, %25
  %88 = load double* %1
  ret double %88
}

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
