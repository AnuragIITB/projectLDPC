; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str1 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str2 = private constant [10 x i8] c"matrix_in\00"
@mem = common global [20000 x i16] zeroinitializer, align 16
@.str3 = private constant [14 x i8] c"code_block_in\00"
@code_block = common global [13000 x float] zeroinitializer, align 16
@aPriori = common global [13000 x float] zeroinitializer, align 16
@message = common global [20000 x float] zeroinitializer, align 16
@aPosteriori = common global [13000 x float] zeroinitializer, align 16
@ext_info = common global [20000 x float] zeroinitializer, align 16
@.str4 = private constant [10 x i8] c"ncols_out\00"
@.str5 = private constant [15 x i8] c"code_block_out\00"

define void @initInputs() nounwind {
  %nitr = alloca i16, align 2
  %SNR = alloca float, align 4
  %1 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0))
  store i16 %1, i16* %nitr, align 2
  %2 = load i16* %nitr, align 2
  store i16 %2, i16* @maxNitr, align 2
  %3 = call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0))
  store float %3, float* %SNR, align 4
  %4 = load float* %SNR, align 4
  store float %4, float* @ebbyNo, align 4
  call void @initMem()
  ret void
}

declare zeroext i16 @read_uint16(i8*)

declare float @read_float32(i8*)

define void @initMem() nounwind {
  %I = alloca i16, align 2
  %val = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %1
  %6 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %6, i16* %val, align 2
  %7 = load i16* %val, align 2
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %9
  store i16 %7, i16* %10
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i16* %I, align 2
  %13 = add i16 %12, 1
  store i16 %13, i16* %I, align 2
  br label %1

; <label>:14                                      ; preds = %1
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 %16, %18
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %21

; <label>:21                                      ; preds = %35, %14
  %22 = load i16* %I, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16* %range, align 2
  %25 = zext i16 %24 to i32
  %26 = icmp slt i32 %23, %25
  br i1 %26, label %27, label %38

; <label>:27                                      ; preds = %21
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %28 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %28, i16* %val, align 2
  %29 = load i16* %val, align 2
  %30 = load i16* %I, align 2
  %31 = zext i16 %30 to i32
  %32 = add nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %33
  store i16 %29, i16* %34
  br label %35

; <label>:35                                      ; preds = %27
  %36 = load i16* %I, align 2
  %37 = add i16 %36, 1
  store i16 %37, i16* %I, align 2
  br label %21

; <label>:38                                      ; preds = %21
  ret void
}

declare void @__loop_pipelining_on__(i32, i32, i32)

define void @readCodeBlock() nounwind {
  %I = alloca i16, align 2
  %code_bit = alloca float, align 4
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0))
  store float %8, float* %code_bit, align 4
  %9 = load float* %code_bit, align 4
  %10 = load i16* %I, align 2
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %11
  store float %9, float* %12
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i16* %I, align 2
  %15 = add i16 %14, 1
  store i16 %15, i16* %I, align 2
  br label %1

; <label>:16                                      ; preds = %1
  ret void
}

define void @initialize_aPriori() nounwind {
  %I = alloca i16, align 2
  %sigma2 = alloca float, align 4
  %rate = alloca float, align 4
  %1 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %2 = zext i16 %1 to i32
  %3 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %4 = zext i16 %3 to i32
  %5 = sub nsw i32 %2, %4
  %6 = sitofp i32 %5 to float
  %7 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %8 = zext i16 %7 to i32
  %9 = sitofp i32 %8 to float
  %10 = fdiv float %6, %9
  store float %10, float* %rate, align 4
  store i16 0, i16* %I, align 2
  br label %11

; <label>:11                                      ; preds = %30, %0
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %15 = zext i16 %14 to i32
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %11
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %18 = load i16* %I, align 2
  %19 = zext i16 %18 to i64
  %20 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %19
  %21 = load float* %20
  %22 = fmul float -4.000000e+00, %21
  %23 = load float* %rate, align 4
  %24 = load float* @ebbyNo, align 4
  %25 = fmul float %23, %24
  %26 = fmul float %22, %25
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %28
  store float %26, float* %29
  br label %30

; <label>:30                                      ; preds = %17
  %31 = load i16* %I, align 2
  %32 = add i16 %31, 1
  store i16 %32, i16* %I, align 2
  br label %11

; <label>:33                                      ; preds = %11
  ret void
}

define void @initializeMessage() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 3, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %11
  %13 = load i16* %12
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %16
  %18 = load float* %17
  %19 = load i16* %I, align 2
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %20
  store float %18, float* %21
  br label %22

; <label>:22                                      ; preds = %7
  %23 = load i16* %I, align 2
  %24 = add i16 %23, 1
  store i16 %24, i16* %I, align 2
  br label %1

; <label>:25                                      ; preds = %1
  ret void
}

define void @initialize_aPosteriori() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %15, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %13
  store float %11, float* %14
  br label %15

; <label>:15                                      ; preds = %7
  %16 = load i16* %I, align 2
  %17 = add i16 %16, 1
  store i16 %17, i16* %I, align 2
  br label %1

; <label>:18                                      ; preds = %1
  ret void
}

define void @initializeExtrinsicInfo() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %9
  store float 0.000000e+00, float* %10
  br label %11

; <label>:11                                      ; preds = %7
  %12 = load i16* %I, align 2
  %13 = add i16 %12, 1
  store i16 %13, i16* %I, align 2
  br label %1

; <label>:14                                      ; preds = %1
  ret void
}

define void @checkNodeComputeEngine() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %I = alloca i16, align 2
  %val = alloca float, align 4
  %flag = alloca i8, align 1
  %exor = alloca i8, align 1
  %sign = alloca float, align 4
  %index = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %203, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %206

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  store i16 0, i16* %col, align 2
  br label %55

; <label>:55                                      ; preds = %199, %54
  %56 = load i16* %col, align 2
  %57 = zext i16 %56 to i32
  %58 = load i16* %range, align 2
  %59 = zext i16 %58 to i32
  %60 = icmp slt i32 %57, %59
  br i1 %60, label %61, label %202

; <label>:61                                      ; preds = %55
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %62

; <label>:62                                      ; preds = %129, %61
  %63 = load i16* %I, align 2
  %64 = zext i16 %63 to i32
  %65 = load i16* %range, align 2
  %66 = zext i16 %65 to i32
  %67 = icmp slt i32 %64, %66
  br i1 %67, label %68, label %132

; <label>:68                                      ; preds = %62
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %69 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %70 = zext i16 %69 to i32
  %71 = add nsw i32 3, %70
  %72 = load i16* %row, align 2
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 %71, %73
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %75
  %77 = load i16* %76
  %78 = zext i16 %77 to i32
  %79 = sub nsw i32 %78, 1
  %80 = load i16* %I, align 2
  %81 = zext i16 %80 to i32
  %82 = add nsw i32 %79, %81
  %83 = trunc i32 %82 to i16
  store i16 %83, i16* %index, align 2
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i32
  %86 = load i16* %col, align 2
  %87 = zext i16 %86 to i32
  %88 = icmp eq i32 %85, %87
  br i1 %88, label %89, label %90

; <label>:89                                      ; preds = %68
  br label %129

; <label>:90                                      ; preds = %68
  %91 = load i16* %index, align 2
  %92 = zext i16 %91 to i64
  %93 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %92
  %94 = load float* %93
  %95 = fpext float %94 to double
  %96 = fcmp oge double %95, 0.000000e+00
  br i1 %96, label %97, label %102

; <label>:97                                      ; preds = %90
  %98 = load i8* %exor, align 1
  %99 = zext i8 %98 to i32
  %100 = xor i32 %99, 0
  %101 = trunc i32 %100 to i8
  store i8 %101, i8* %exor, align 1
  br label %107

; <label>:102                                     ; preds = %90
  %103 = load i8* %exor, align 1
  %104 = zext i8 %103 to i32
  %105 = xor i32 %104, 1
  %106 = trunc i32 %105 to i8
  store i8 %106, i8* %exor, align 1
  br label %107

; <label>:107                                     ; preds = %102, %97
  %108 = load i8* %flag, align 1
  %109 = zext i8 %108 to i32
  %110 = icmp eq i32 %109, 0
  br i1 %110, label %111, label %117

; <label>:111                                     ; preds = %107
  %112 = load i16* %index, align 2
  %113 = zext i16 %112 to i64
  %114 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %113
  %115 = load float* %114
  %116 = call float @absf(float %115)
  store float %116, float* %val, align 4
  br label %127

; <label>:117                                     ; preds = %107
  %118 = load i16* %index, align 2
  %119 = zext i16 %118 to i64
  %120 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %119
  %121 = load float* %120
  %122 = call float @absf(float %121)
  %123 = load float* %val, align 4
  %124 = fcmp olt float %122, %123
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %117
  br label %126

; <label>:126                                     ; preds = %125, %117
  br label %127

; <label>:127                                     ; preds = %126, %111
  br label %128

; <label>:128                                     ; preds = %127
  store i8 1, i8* %flag, align 1
  br label %129

; <label>:129                                     ; preds = %128, %89
  %130 = load i16* %I, align 2
  %131 = add i16 %130, 1
  store i16 %131, i16* %I, align 2
  br label %62

; <label>:132                                     ; preds = %62
  %133 = load i8* %exor, align 1
  %134 = zext i8 %133 to i32
  %135 = icmp eq i32 %134, 0
  br i1 %135, label %136, label %137

; <label>:136                                     ; preds = %132
  store float 1.000000e+00, float* %sign, align 4
  br label %138

; <label>:137                                     ; preds = %132
  store float -1.000000e+00, float* %sign, align 4
  br label %138

; <label>:138                                     ; preds = %137, %136
  %139 = load float* %val, align 4
  %140 = load float* %sign, align 4
  %141 = fmul float %139, %140
  %142 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 3, %143
  %145 = load i16* %row, align 2
  %146 = zext i16 %145 to i32
  %147 = add nsw i32 %144, %146
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %148
  %150 = load i16* %149
  %151 = zext i16 %150 to i32
  %152 = sub nsw i32 %151, 1
  %153 = load i16* %col, align 2
  %154 = zext i16 %153 to i32
  %155 = add nsw i32 %152, %154
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %156
  store float %141, float* %157
  %158 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %159 = zext i16 %158 to i32
  %160 = add nsw i32 3, %159
  %161 = load i16* %row, align 2
  %162 = zext i16 %161 to i32
  %163 = add nsw i32 %160, %162
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %164
  %166 = load i16* %165
  %167 = zext i16 %166 to i32
  %168 = sub nsw i32 %167, 1
  %169 = load i16* %col, align 2
  %170 = zext i16 %169 to i32
  %171 = add nsw i32 %168, %170
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %172
  %174 = load float* %173
  %175 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %176 = zext i16 %175 to i32
  %177 = add nsw i32 3, %176
  %178 = load i16* %row, align 2
  %179 = zext i16 %178 to i32
  %180 = add nsw i32 %177, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %181
  %183 = load i16* %182
  %184 = zext i16 %183 to i32
  %185 = add nsw i32 3, %184
  %186 = sub nsw i32 %185, 1
  %187 = load i16* %col, align 2
  %188 = zext i16 %187 to i32
  %189 = add nsw i32 %186, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %190
  %192 = load i16* %191
  %193 = zext i16 %192 to i32
  %194 = sub nsw i32 %193, 1
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %195
  %197 = load float* %196
  %198 = fadd float %197, %174
  store float %198, float* %196
  br label %199

; <label>:199                                     ; preds = %138
  %200 = load i16* %col, align 2
  %201 = add i16 %200, 1
  store i16 %201, i16* %col, align 2
  br label %55

; <label>:202                                     ; preds = %55
  br label %203

; <label>:203                                     ; preds = %202
  %204 = load i16* %row, align 2
  %205 = add i16 %204, 1
  store i16 %205, i16* %row, align 2
  br label %1

; <label>:206                                     ; preds = %1
  ret void
}

define float @absf(float %f) nounwind {
  %1 = alloca float, align 4
  %ret = alloca float, align 4
  store float %f, float* %1, align 4
  %2 = load float* %1, align 4
  %3 = fpext float %2 to double
  %4 = fcmp olt double %3, 0.000000e+00
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load float* %1, align 4
  %7 = fsub float -0.000000e+00, %6
  store float %7, float* %ret, align 4
  br label %10

; <label>:8                                       ; preds = %0
  %9 = load float* %1, align 4
  store float %9, float* %ret, align 4
  br label %10

; <label>:10                                      ; preds = %8, %5
  %11 = load float* %ret, align 4
  ret float %11
}

define zeroext i8 @checkIsdecoded() nounwind {
  %is_decoded = alloca i8, align 1
  %I = alloca i16, align 2
  store i8 1, i8* %is_decoded, align 1
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %47, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %50

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %9
  %11 = load float* %10
  %12 = fpext float %11 to double
  %13 = fcmp ogt double %12, 0.000000e+00
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %7
  %15 = load i16* %I, align 2
  %16 = zext i16 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %16
  %18 = load float* %17
  %19 = fpext float %18 to double
  %20 = fcmp ogt double %19, 0.000000e+00
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %14
  store i8 0, i8* %is_decoded, align 1
  br label %22

; <label>:22                                      ; preds = %21, %14
  %23 = load i16* %I, align 2
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %24
  store float -1.000000e+00, float* %25
  br label %46

; <label>:26                                      ; preds = %7
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %28
  %30 = load float* %29
  %31 = fpext float %30 to double
  %32 = fcmp olt double %31, 0.000000e+00
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %26
  %34 = load i16* %I, align 2
  %35 = zext i16 %34 to i64
  %36 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %35
  %37 = load float* %36
  %38 = fpext float %37 to double
  %39 = fcmp olt double %38, 0.000000e+00
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %33
  store i8 0, i8* %is_decoded, align 1
  br label %41

; <label>:41                                      ; preds = %40, %33
  %42 = load i16* %I, align 2
  %43 = zext i16 %42 to i64
  %44 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %43
  store float 1.000000e+00, float* %44
  br label %45

; <label>:45                                      ; preds = %41, %26
  br label %46

; <label>:46                                      ; preds = %45, %22
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i16* %I, align 2
  %49 = add i16 %48, 1
  store i16 %49, i16* %I, align 2
  br label %1

; <label>:50                                      ; preds = %1
  %51 = load i8* %is_decoded, align 1
  ret i8 %51
}

define void @updateMessage() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %123, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %126

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  store i16 0, i16* %col, align 2
  br label %55

; <label>:55                                      ; preds = %119, %54
  %56 = load i16* %col, align 2
  %57 = zext i16 %56 to i32
  %58 = load i16* %range, align 2
  %59 = zext i16 %58 to i32
  %60 = icmp slt i32 %57, %59
  br i1 %60, label %61, label %122

; <label>:61                                      ; preds = %55
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %62 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 3, %63
  %65 = load i16* %row, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %68
  %70 = load i16* %69
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 3, %71
  %73 = sub nsw i32 %72, 1
  %74 = load i16* %col, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %82
  %84 = load float* %83
  %85 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %86 = zext i16 %85 to i32
  %87 = add nsw i32 3, %86
  %88 = load i16* %row, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = load i16* %col, align 2
  %97 = zext i16 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %99
  %101 = load float* %100
  %102 = fsub float %84, %101
  %103 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 3, %104
  %106 = load i16* %row, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %109
  %111 = load i16* %110
  %112 = zext i16 %111 to i32
  %113 = sub nsw i32 %112, 1
  %114 = load i16* %col, align 2
  %115 = zext i16 %114 to i32
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %117
  store float %102, float* %118
  br label %119

; <label>:119                                     ; preds = %61
  %120 = load i16* %col, align 2
  %121 = add i16 %120, 1
  store i16 %121, i16* %col, align 2
  br label %55

; <label>:122                                     ; preds = %55
  br label %123

; <label>:123                                     ; preds = %122
  %124 = load i16* %row, align 2
  %125 = add i16 %124, 1
  store i16 %125, i16* %row, align 2
  br label %1

; <label>:126                                     ; preds = %1
  ret void
}

define void @top_daemon() nounwind {
  %nitr = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %K = alloca i16, align 2
  call void @initInputs()
  call void @readCodeBlock()
  store i8 1, i8* %nitr, align 1
  call void @initialize_aPriori()
  call void @initializeMessage()
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i8* %nitr, align 1
  %3 = zext i8 %2 to i32
  %4 = load i16* @maxNitr, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %.loopexit

; <label>:7                                       ; preds = %1
  call void @initialize_aPosteriori()
  call void @initializeExtrinsicInfo()
  call void @checkNodeComputeEngine()
  %8 = call zeroext i8 @checkIsdecoded()
  store i8 %8, i8* %is_decoded, align 1
  %9 = load i8* %is_decoded, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7
  br label %16

; <label>:12                                      ; preds = %7
  call void @updateMessage()
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i8* %nitr, align 1
  %15 = add i8 %14, 1
  store i8 %15, i8* %nitr, align 1
  br label %1

.loopexit:                                        ; preds = %1
  br label %16

; <label>:16                                      ; preds = %.loopexit, %11
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  call void @write_uint16(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i16 zeroext %17)
  store i16 0, i16* %K, align 2
  br label %18

; <label>:18                                      ; preds = %29, %16
  %19 = load i16* %K, align 2
  %20 = zext i16 %19 to i32
  %21 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %22 = zext i16 %21 to i32
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %32

; <label>:24                                      ; preds = %18
  %25 = load i16* %K, align 2
  %26 = zext i16 %25 to i64
  %27 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %26
  %28 = load float* %27
  call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str5, i32 0, i32 0), float %28)
  br label %29

; <label>:29                                      ; preds = %24
  %30 = load i16* %K, align 2
  %31 = add i16 %30, 1
  store i16 %31, i16* %K, align 2
  br label %18

; <label>:32                                      ; preds = %18
  ret void
}

declare void @write_uint16(i8*, i16 zeroext)

declare void @write_float32(i8*, float)
