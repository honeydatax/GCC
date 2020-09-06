; ModuleID = 'strfill.c'
target datalayout = "e-p:32:32-i64:64"
target triple = "le32-unknown-nacl"

@main.s1 = private unnamed_addr constant [50 x i8] c"hello world\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 1
@.str = private unnamed_addr constant [6 x i8] c"%s  \0A\00", align 1

; Function Attrs: nounwind
define i32 @strsfills(i8* %s, i8 signext %c) #0 {
  %1 = alloca i8*, align 4
  %2 = alloca i8, align 1
  %pos = alloca i32, align 4
  store i8* %s, i8** %1, align 4
  store i8 %c, i8* %2, align 1
  store i32 0, i32* %pos, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load i32* %pos, align 4
  %5 = load i8** %1, align 4
  %6 = getelementptr inbounds i8* %5, i32 %4
  %7 = load i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %17

; <label>:10                                      ; preds = %3
  %11 = load i8* %2, align 1
  %12 = load i32* %pos, align 4
  %13 = load i8** %1, align 4
  %14 = getelementptr inbounds i8* %13, i32 %12
  store i8 %11, i8* %14, align 1
  %15 = load i32* %pos, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %pos, align 4
  br label %3

; <label>:17                                      ; preds = %3
  %18 = load i32* %pos, align 4
  ret i32 %18
}

; Function Attrs: nounwind
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s1 = alloca [50 x i8], align 1
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  %2 = bitcast [50 x i8]* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i32(i8* %2, i8* getelementptr inbounds ([50 x i8]* @main.s1, i32 0, i32 0), i32 50, i32 1, i1 false)
  %3 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %4 = call i32 @strsfills(i8* %3, i8 signext 42)
  %5 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 40
  store i8 0, i8* %5, align 1
  %6 = getelementptr inbounds [50 x i8]* %s1, i32 0, i32 0
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8* %6)
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
