; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private constant [10 x i8] c"matrix_in\00"
@mem = common global [20000 x i16] zeroinitializer, align 16
@.str1 = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str2 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str3 = private constant [8 x i8] c"rate_in\00"
@rate = common global float 0.000000e+00, align 4
@.str4 = private constant [15 x i8] c"inputs_written\00"
@.str5 = private constant [14 x i8] c"code_block_in\00"
@code_block = common global [13000 x float] zeroinitializer, align 16
@.str6 = private constant [19 x i8] c"code_block_written\00"
@aPriori = common global [13000 x float] zeroinitializer, align 16
@stderr = external global %struct._IO_FILE*
@.str7 = private constant [19 x i8] c"aPriori[%d] = %f \0A\00"
@.str8 = private constant [20 x i8] c"initialize_aPriori1\00"
@.str9 = private constant [20 x i8] c"initialize_aPriori2\00"
@message = common global [20000 x float] zeroinitializer, align 16
@aPosteriori = common global [13000 x float] zeroinitializer, align 16
@ext_info = common global [20000 x float] zeroinitializer, align 16
@.str10 = private constant [16 x i8] c"aPosteriori_out\00"
@.str11 = private constant [15 x i8] c"is_decoded_out\00"
@.str12 = private constant [15 x i8] c"code_block_out\00"

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
  %6 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
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
  %28 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
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

declare zeroext i16 @read_uint16(i8*)

declare void @__loop_pipelining_on__(i32, i32, i32)

define void @initInputs() nounwind {
  %nitr = alloca i16, align 2
  %SNR = alloca float, align 4
  %Rate = alloca float, align 4
  %1 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0))
  store i16 %1, i16* %nitr, align 2
  %2 = load i16* %nitr, align 2
  store i16 %2, i16* @maxNitr, align 2
  %3 = call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store float %3, float* %SNR, align 4
  %4 = load float* %SNR, align 4
  store float %4, float* @ebbyNo, align 4
  call void @initMem()
  %5 = call float @read_float32(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  store float %5, float* %Rate, align 4
  %6 = load float* %Rate, align 4
  store float %6, float* @rate, align 4
  call void @write_uint8(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0), i8 zeroext 1)
  ret void
}

declare float @read_float32(i8*)

declare void @write_uint8(i8*, i8 zeroext)

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
  %8 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0))
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
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str6, i32 0, i32 0), i8 zeroext 1)
  ret void
}

define void @initialize_aPriori() nounwind {
  %I = alloca i16, align 2
  %val1 = alloca float, align 4
  %val2 = alloca float, align 4
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %29, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %32

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %9
  %11 = load float* %10
  %12 = fmul float -4.000000e+00, %11
  %13 = load float* @rate, align 4
  %14 = load float* @ebbyNo, align 4
  %15 = fmul float %13, %14
  %16 = fmul float %12, %15
  %17 = load i16* %I, align 2
  %18 = zext i16 %17 to i64
  %19 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %18
  store float %16, float* %19
  %20 = load %struct._IO_FILE** @stderr, align 8
  %21 = load i16* %I, align 2
  %22 = zext i16 %21 to i32
  %23 = load i16* %I, align 2
  %24 = zext i16 %23 to i64
  %25 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %24
  %26 = load float* %25
  %27 = fpext float %26 to double
  %28 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([19 x i8]* @.str7, i32 0, i32 0), i32 %22, double %27)
  br label %29

; <label>:29                                      ; preds = %7
  %30 = load i16* %I, align 2
  %31 = add i16 %30, 1
  store i16 %31, i16* %I, align 2
  br label %1

; <label>:32                                      ; preds = %1
  %33 = load float* getelementptr inbounds ([13000 x float]* @aPriori, i32 0, i64 0)
  store float %33, float* %val1, align 4
  %34 = load float* %val1, align 4
  call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), float %34)
  %35 = load float* getelementptr inbounds ([13000 x float]* @aPriori, i32 0, i64 1)
  store float %35, float* %val2, align 4
  %36 = load float* %val2, align 4
  call void @write_float32(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), float %36)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

declare void @write_float32(i8*, float)

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

; <label>:1                                       ; preds = %167, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %170

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

; <label>:55                                      ; preds = %163, %54
  %56 = load i16* %col, align 2
  %57 = zext i16 %56 to i32
  %58 = load i16* %range, align 2
  %59 = zext i16 %58 to i32
  %60 = icmp slt i32 %57, %59
  br i1 %60, label %61, label %166

; <label>:61                                      ; preds = %55
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %62

; <label>:62                                      ; preds = %134, %61
  %63 = load i16* %I, align 2
  %64 = zext i16 %63 to i32
  %65 = load i16* %range, align 2
  %66 = zext i16 %65 to i32
  %67 = icmp slt i32 %64, %66
  br i1 %67, label %68, label %137

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
  br label %134

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
  br label %132

; <label>:117                                     ; preds = %107
  %118 = load i16* %index, align 2
  %119 = zext i16 %118 to i64
  %120 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %119
  %121 = load float* %120
  %122 = call float @absf(float %121)
  %123 = load float* %val, align 4
  %124 = fcmp olt float %122, %123
  br i1 %124, label %125, label %131

; <label>:125                                     ; preds = %117
  %126 = load i16* %index, align 2
  %127 = zext i16 %126 to i64
  %128 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %127
  %129 = load float* %128
  %130 = call float @absf(float %129)
  store float %130, float* %val, align 4
  br label %131

; <label>:131                                     ; preds = %125, %117
  br label %132

; <label>:132                                     ; preds = %131, %111
  br label %133

; <label>:133                                     ; preds = %132
  store i8 1, i8* %flag, align 1
  br label %134

; <label>:134                                     ; preds = %133, %89
  %135 = load i16* %I, align 2
  %136 = add i16 %135, 1
  store i16 %136, i16* %I, align 2
  br label %62

; <label>:137                                     ; preds = %62
  %138 = load i8* %exor, align 1
  %139 = zext i8 %138 to i32
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %141, label %142

; <label>:141                                     ; preds = %137
  store float 1.000000e+00, float* %sign, align 4
  br label %143

; <label>:142                                     ; preds = %137
  store float -1.000000e+00, float* %sign, align 4
  br label %143

; <label>:143                                     ; preds = %142, %141
  %144 = load float* %val, align 4
  %145 = load float* %sign, align 4
  %146 = fmul float %144, %145
  %147 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %148 = zext i16 %147 to i32
  %149 = add nsw i32 3, %148
  %150 = load i16* %row, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %153
  %155 = load i16* %154
  %156 = zext i16 %155 to i32
  %157 = sub nsw i32 %156, 1
  %158 = load i16* %col, align 2
  %159 = zext i16 %158 to i32
  %160 = add nsw i32 %157, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %161
  store float %146, float* %162
  br label %163

; <label>:163                                     ; preds = %143
  %164 = load i16* %col, align 2
  %165 = add i16 %164, 1
  store i16 %165, i16* %col, align 2
  br label %55

; <label>:166                                     ; preds = %55
  br label %167

; <label>:167                                     ; preds = %166
  %168 = load i16* %row, align 2
  %169 = add i16 %168, 1
  store i16 %169, i16* %row, align 2
  br label %1

; <label>:170                                     ; preds = %1
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

define void @update_aPosteriori() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = add nsw i32 3, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %15
  %17 = load i16* %16
  %18 = zext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %20
  %22 = load float* %21
  %23 = fadd float %22, %11
  store float %23, float* %21
  br label %24

; <label>:24                                      ; preds = %7
  %25 = load i16* %I, align 2
  %26 = add i16 %25, 1
  store i16 %26, i16* %I, align 2
  br label %1

; <label>:27                                      ; preds = %1
  ret void
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
  %P = alloca i32, align 4
  %is_decoded = alloca i8, align 1
  %K = alloca i16, align 2
  call void @initInputs()
  call void @readCodeBlock()
  store i8 1, i8* %nitr, align 1
  call void @initialize_aPriori()
  call void @initializeMessage()
  br label %1

; <label>:1                                       ; preds = %28, %0
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
  call void @update_aPosteriori()
  store i32 0, i32* %P, align 4
  store i32 0, i32* %P, align 4
  br label %8

; <label>:8                                       ; preds = %18, %7
  %9 = load i32* %P, align 4
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %11 = zext i16 %10 to i32
  %12 = icmp slt i32 %9, %11
  br i1 %12, label %13, label %21

; <label>:13                                      ; preds = %8
  %14 = load i32* %P, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %15
  %17 = load float* %16
  call void @write_float32(i8* getelementptr inbounds ([16 x i8]* @.str10, i32 0, i32 0), float %17)
  br label %18

; <label>:18                                      ; preds = %13
  %19 = load i32* %P, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %P, align 4
  br label %8

; <label>:21                                      ; preds = %8
  %22 = call zeroext i8 @checkIsdecoded()
  store i8 %22, i8* %is_decoded, align 1
  %23 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([15 x i8]* @.str11, i32 0, i32 0), i8 zeroext %23)
  %24 = load i8* %is_decoded, align 1
  %25 = icmp ne i8 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  br label %31

; <label>:27                                      ; preds = %21
  call void @updateMessage()
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i8* %nitr, align 1
  %30 = add i8 %29, 1
  store i8 %30, i8* %nitr, align 1
  br label %1

.loopexit:                                        ; preds = %1
  br label %31

; <label>:31                                      ; preds = %.loopexit, %26
  store i16 0, i16* %K, align 2
  br label %32

; <label>:32                                      ; preds = %43, %31
  %33 = load i16* %K, align 2
  %34 = zext i16 %33 to i32
  %35 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %36 = zext i16 %35 to i32
  %37 = icmp slt i32 %34, %36
  br i1 %37, label %38, label %46

; <label>:38                                      ; preds = %32
  %39 = load i16* %K, align 2
  %40 = zext i16 %39 to i64
  %41 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %40
  %42 = load float* %41
  call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str12, i32 0, i32 0), float %42)
  br label %43

; <label>:43                                      ; preds = %38
  %44 = load i16* %K, align 2
  %45 = add i16 %44, 1
  store i16 %45, i16* %K, align 2
  br label %32

; <label>:46                                      ; preds = %32
  ret void
}
