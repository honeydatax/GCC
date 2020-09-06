; ModuleID = 'strhex.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@.str = private unnamed_addr constant [33 x i8] c"0123456789ABCDEF0123456789ABCDEF\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

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
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  %2 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  call void @strshex(i8* %2, i32 305419896)
  %3 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i8* %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
