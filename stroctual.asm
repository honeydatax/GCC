; ModuleID = 'stroctal.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [33 x i8] c"0123456789ABCDEF0123456789ABCDEF\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

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
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca [150 x i8], align 1
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  %2 = getelementptr inbounds [150 x i8]* %s1, i32 0, i32 0
  call void @strsoct(i8* %2, i32 305419896)
  %3 = getelementptr inbounds [150 x i8]* %s1, i32 0, i32 0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
