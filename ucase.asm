; ModuleID = 'ucase.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@main.s1 = private unnamed_addr constant [14 x i8] c"HeLlO wOrLd \0A\00", align 1
@.str = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @ucase(i8* %s) #0 {
  %1 = alloca i8*, align 4
  %pos = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i32 0, i32* %pos, align 4
  br label %2

; <label>:2                                       ; preds = %35, %0
  %3 = load i32* %pos, align 4
  %4 = load i8** %1, align 4
  %5 = getelementptr inbounds i8* %4, i32 %3
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %38

; <label>:9                                       ; preds = %2
  %10 = load i32* %pos, align 4
  %11 = load i8** %1, align 4
  %12 = getelementptr inbounds i8* %11, i32 %10
  %13 = load i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp sge i32 %14, 97
  br i1 %15, label %16, label %35

; <label>:16                                      ; preds = %9
  %17 = load i32* %pos, align 4
  %18 = load i8** %1, align 4
  %19 = getelementptr inbounds i8* %18, i32 %17
  %20 = load i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp sle i32 %21, 122
  br i1 %22, label %23, label %35

; <label>:23                                      ; preds = %16
  %24 = load i32* %pos, align 4
  %25 = load i8** %1, align 4
  %26 = getelementptr inbounds i8* %25, i32 %24
  %27 = load i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = sub nsw i32 %28, 97
  %30 = add nsw i32 %29, 65
  %31 = trunc i32 %30 to i8
  %32 = load i32* %pos, align 4
  %33 = load i8** %1, align 4
  %34 = getelementptr inbounds i8* %33, i32 %32
  store i8 %31, i8* %34, align 1
  br label %35

; <label>:35                                      ; preds = %23, %16, %9
  %36 = load i32* %pos, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %pos, align 4
  br label %2

; <label>:38                                      ; preds = %2
  %39 = load i32* %pos, align 4
  ret i32 %39
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca [14 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [14 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* getelementptr inbounds ([14 x i8]* @main.s1, i32 0, i32 0), i32 14, i32 1, i1 false)
  %3 = getelementptr inbounds [14 x i8]* %s1, i32 0, i32 0
  %4 = call i32 @ucase(i8* %3)
  %5 = getelementptr inbounds [14 x i8]* %s1, i32 0, i32 0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* %5)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i32(i8* nocapture, i8* nocapture readonly, i32, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Raspbian clang version 3.5.0-10+rpi1 (tags/RELEASE_350/final) (based on LLVM 3.5.0)"}
