; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str1 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str2 = private constant [10 x i8] c"matrix_in\00"
@mem = common global [20000 x i16] zeroinitializer, align 16
@.str3 = private constant [15 x i8] c"matrix_written\00"
@.str4 = private constant [14 x i8] c"code_block_in\00"
@code_block = common global [13000 x float] zeroinitializer, align 16
@.str5 = private constant [19 x i8] c"code_block_written\00"
@aPriori = common global [13000 x float] zeroinitializer, align 16
@.str6 = private constant [16 x i8] c"aPriori_written\00"
@message = common global [20000 x float] zeroinitializer, align 16
@.str7 = private constant [16 x i8] c"message_written\00"
@aPosteriori = common global [13000 x float] zeroinitializer, align 16
@.str8 = private constant [20 x i8] c"aPosteriori_written\00"
@ext_info = common global [20000 x float] zeroinitializer, align 16
@.str9 = private constant [17 x i8] c"ext_info_written\00"
@.str10 = private constant [17 x i8] c"computation_done\00"
@.str11 = private constant [16 x i8] c"is_decoded_done\00"
@.str12 = private constant [19 x i8] c"code_block_decoded\00"
@.str13 = private constant [14 x i8] c"nitr_required\00"
@.str14 = private constant [16 x i8] c"stop_the_daemon\00"

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
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
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
  %start_reading_code_block = alloca i8, align 1
  %I = alloca i16, align 2
  %code_bit = alloca float, align 4
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0))
  store i8 %1, i8* %start_reading_code_block, align 1
  store i16 0, i16* %I, align 2
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i16* %I, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %2
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %9 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0))
  store float %9, float* %code_bit, align 4
  %10 = load float* %code_bit, align 4
  %11 = load i16* %I, align 2
  %12 = zext i16 %11 to i64
  %13 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %12
  store float %10, float* %13
  br label %14

; <label>:14                                      ; preds = %8
  %15 = load i16* %I, align 2
  %16 = add i16 %15, 1
  store i16 %16, i16* %I, align 2
  br label %2

; <label>:17                                      ; preds = %2
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str5, i32 0, i32 0), i8 zeroext 1)
  ret void
}

declare zeroext i8 @read_uint8(i8*)

declare void @write_uint8(i8*, i8 zeroext)

define void @initialize_aPriori() nounwind {
  %start_initializating_aPriori = alloca i8, align 1
  %I = alloca i16, align 2
  %sigma2 = alloca float, align 4
  %rate = alloca float, align 4
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str5, i32 0, i32 0))
  store i8 %1, i8* %start_initializating_aPriori, align 1
  %2 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = sub nsw i32 %3, %5
  %7 = sitofp i32 %6 to float
  %8 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %9 = zext i16 %8 to i32
  %10 = sitofp i32 %9 to float
  %11 = fdiv float %7, %10
  store float %11, float* %rate, align 4
  %12 = load float* %rate, align 4
  %13 = fmul float 2.000000e+00, %12
  %14 = load float* @ebbyNo, align 4
  %15 = fmul float %13, %14
  %16 = fdiv float 1.000000e+00, %15
  store float %16, float* %sigma2, align 4
  store i16 0, i16* %I, align 2
  br label %17

; <label>:17                                      ; preds = %35, %0
  %18 = load i16* %I, align 2
  %19 = zext i16 %18 to i32
  %20 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %21 = zext i16 %20 to i32
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %23, label %38

; <label>:23                                      ; preds = %17
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %24 = load i16* %I, align 2
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %25
  %27 = load float* %26
  %28 = fmul float -4.000000e+00, %27
  %29 = load float* %sigma2, align 4
  %30 = fmul float 2.000000e+00, %29
  %31 = fdiv float %28, %30
  %32 = load i16* %I, align 2
  %33 = zext i16 %32 to i64
  %34 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %33
  store float %31, float* %34
  br label %35

; <label>:35                                      ; preds = %23
  %36 = load i16* %I, align 2
  %37 = add i16 %36, 1
  store i16 %37, i16* %I, align 2
  br label %17

; <label>:38                                      ; preds = %17
  call void @write_uint8(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0), i8 zeroext 1)
  ret void
}

define void @initializeMessage() nounwind {
  %start_initializing_message = alloca i8, align 1
  %I = alloca i16, align 2
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([16 x i8]* @.str6, i32 0, i32 0))
  store i8 %1, i8* %start_initializing_message, align 1
  store i16 0, i16* %I, align 2
  br label %2

; <label>:2                                       ; preds = %23, %0
  %3 = load i16* %I, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %26

; <label>:8                                       ; preds = %2
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %9 = load i16* %I, align 2
  %10 = zext i16 %9 to i32
  %11 = add nsw i32 3, %10
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %12
  %14 = load i16* %13
  %15 = zext i16 %14 to i32
  %16 = sub nsw i32 %15, 1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %17
  %19 = load float* %18
  %20 = load i16* %I, align 2
  %21 = zext i16 %20 to i64
  %22 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %21
  store float %19, float* %22
  br label %23

; <label>:23                                      ; preds = %8
  %24 = load i16* %I, align 2
  %25 = add i16 %24, 1
  store i16 %25, i16* %I, align 2
  br label %2

; <label>:26                                      ; preds = %2
  call void @write_uint8(i8* getelementptr inbounds ([16 x i8]* @.str7, i32 0, i32 0), i8 zeroext 1)
  ret void
}

define void @initialize_aPosteriori() nounwind {
  %start_initializing_aPosteriori = alloca i8, align 1
  %I = alloca i16, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([16 x i8]* @.str7, i32 0, i32 0))
  store i8 %2, i8* %start_initializing_aPosteriori, align 1
  %3 = load i8* %start_initializing_aPosteriori, align 1
  %4 = icmp ne i8 %3, 0
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %1
  store i16 0, i16* %I, align 2
  br label %6

; <label>:6                                       ; preds = %20, %5
  %7 = load i16* %I, align 2
  %8 = zext i16 %7 to i32
  %9 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %10 = zext i16 %9 to i32
  %11 = icmp slt i32 %8, %10
  br i1 %11, label %12, label %23

; <label>:12                                      ; preds = %6
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %13 = load i16* %I, align 2
  %14 = zext i16 %13 to i64
  %15 = getelementptr inbounds [13000 x float]* @aPriori, i32 0, i64 %14
  %16 = load float* %15
  %17 = load i16* %I, align 2
  %18 = zext i16 %17 to i64
  %19 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %18
  store float %16, float* %19
  br label %20

; <label>:20                                      ; preds = %12
  %21 = load i16* %I, align 2
  %22 = add i16 %21, 1
  store i16 %22, i16* %I, align 2
  br label %6

; <label>:23                                      ; preds = %6
  call void @write_uint8(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i8 zeroext 1)
  br label %24

; <label>:24                                      ; preds = %23, %1
  br label %1
                                                  ; No predecessors!
  ret void
}

define void @initializeExtrinsicInfo() nounwind {
  %start_initializing_ext_info = alloca i8, align 1
  %I = alloca i16, align 2
  br label %1

; <label>:1                                       ; preds = %16, %0
  %2 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0))
  store i8 %2, i8* %start_initializing_ext_info, align 1
  store i16 0, i16* %I, align 2
  br label %3

; <label>:3                                       ; preds = %13, %1
  %4 = load i16* %I, align 2
  %5 = zext i16 %4 to i32
  %6 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %7 = zext i16 %6 to i32
  %8 = icmp slt i32 %5, %7
  br i1 %8, label %9, label %16

; <label>:9                                       ; preds = %3
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %10 = load i16* %I, align 2
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %11
  store float 0.000000e+00, float* %12
  br label %13

; <label>:13                                      ; preds = %9
  %14 = load i16* %I, align 2
  %15 = add i16 %14, 1
  store i16 %15, i16* %I, align 2
  br label %3

; <label>:16                                      ; preds = %3
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str9, i32 0, i32 0), i8 zeroext 1)
  br label %1
                                                  ; No predecessors!
  ret void
}

define void @checkNodeComputeEngine() nounwind {
  %start_compute_engine = alloca i8, align 1
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %I = alloca i16, align 2
  %val = alloca float, align 4
  %flag = alloca i8, align 1
  %exor = alloca i8, align 1
  %sign = alloca float, align 4
  %index = alloca i16, align 2
  br label %1

; <label>:1                                       ; preds = %215, %0
  %2 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([17 x i8]* @.str9, i32 0, i32 0))
  store i8 %2, i8* %start_compute_engine, align 1
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %3

; <label>:3                                       ; preds = %212, %1
  %4 = load i16* %row, align 2
  %5 = zext i16 %4 to i32
  %6 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %7 = zext i16 %6 to i32
  %8 = icmp slt i32 %5, %7
  br i1 %8, label %9, label %215

; <label>:9                                       ; preds = %3
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %10 = load i16* %row, align 2
  %11 = zext i16 %10 to i32
  %12 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %13 = zext i16 %12 to i32
  %14 = sub nsw i32 %13, 1
  %15 = icmp eq i32 %11, %14
  br i1 %15, label %16, label %32

; <label>:16                                      ; preds = %9
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %20 = zext i16 %19 to i32
  %21 = add nsw i32 3, %20
  %22 = load i16* %row, align 2
  %23 = zext i16 %22 to i32
  %24 = add nsw i32 %21, %23
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %25
  %27 = load i16* %26
  %28 = zext i16 %27 to i32
  %29 = sub nsw i32 %28, 1
  %30 = sub nsw i32 %18, %29
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %range, align 2
  br label %56

; <label>:32                                      ; preds = %9
  %33 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %34 = zext i16 %33 to i32
  %35 = add nsw i32 3, %34
  %36 = load i16* %row, align 2
  %37 = zext i16 %36 to i32
  %38 = add nsw i32 %35, %37
  %39 = add nsw i32 %38, 1
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %40
  %42 = load i16* %41
  %43 = zext i16 %42 to i32
  %44 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %45 = zext i16 %44 to i32
  %46 = add nsw i32 3, %45
  %47 = load i16* %row, align 2
  %48 = zext i16 %47 to i32
  %49 = add nsw i32 %46, %48
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %50
  %52 = load i16* %51
  %53 = zext i16 %52 to i32
  %54 = sub nsw i32 %43, %53
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %range, align 2
  br label %56

; <label>:56                                      ; preds = %32, %16
  store i16 0, i16* %col, align 2
  br label %57

; <label>:57                                      ; preds = %208, %56
  %58 = load i16* %col, align 2
  %59 = zext i16 %58 to i32
  %60 = load i16* %range, align 2
  %61 = zext i16 %60 to i32
  %62 = icmp slt i32 %59, %61
  br i1 %62, label %63, label %211

; <label>:63                                      ; preds = %57
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %64

; <label>:64                                      ; preds = %136, %63
  %65 = load i16* %I, align 2
  %66 = zext i16 %65 to i32
  %67 = load i16* %range, align 2
  %68 = zext i16 %67 to i32
  %69 = icmp slt i32 %66, %68
  br i1 %69, label %70, label %139

; <label>:70                                      ; preds = %64
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %71 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %72 = zext i16 %71 to i32
  %73 = add nsw i32 3, %72
  %74 = load i16* %row, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = load i16* %I, align 2
  %83 = zext i16 %82 to i32
  %84 = add nsw i32 %81, %83
  %85 = trunc i32 %84 to i16
  store i16 %85, i16* %index, align 2
  %86 = load i16* %I, align 2
  %87 = zext i16 %86 to i32
  %88 = load i16* %col, align 2
  %89 = zext i16 %88 to i32
  %90 = icmp eq i32 %87, %89
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %70
  br label %136

; <label>:92                                      ; preds = %70
  %93 = load i16* %index, align 2
  %94 = zext i16 %93 to i64
  %95 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %94
  %96 = load float* %95
  %97 = fpext float %96 to double
  %98 = fcmp oge double %97, 0.000000e+00
  br i1 %98, label %99, label %104

; <label>:99                                      ; preds = %92
  %100 = load i8* %exor, align 1
  %101 = zext i8 %100 to i32
  %102 = xor i32 %101, 0
  %103 = trunc i32 %102 to i8
  store i8 %103, i8* %exor, align 1
  br label %109

; <label>:104                                     ; preds = %92
  %105 = load i8* %exor, align 1
  %106 = zext i8 %105 to i32
  %107 = xor i32 %106, 1
  %108 = trunc i32 %107 to i8
  store i8 %108, i8* %exor, align 1
  br label %109

; <label>:109                                     ; preds = %104, %99
  %110 = load i8* %flag, align 1
  %111 = zext i8 %110 to i32
  %112 = icmp eq i32 %111, 0
  br i1 %112, label %113, label %119

; <label>:113                                     ; preds = %109
  %114 = load i16* %index, align 2
  %115 = zext i16 %114 to i64
  %116 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %115
  %117 = load float* %116
  %118 = call float @absf(float %117)
  store float %118, float* %val, align 4
  br label %134

; <label>:119                                     ; preds = %109
  %120 = load i16* %index, align 2
  %121 = zext i16 %120 to i64
  %122 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %121
  %123 = load float* %122
  %124 = call float @absf(float %123)
  %125 = load float* %val, align 4
  %126 = fcmp olt float %124, %125
  br i1 %126, label %127, label %133

; <label>:127                                     ; preds = %119
  %128 = load i16* %index, align 2
  %129 = zext i16 %128 to i64
  %130 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %129
  %131 = load float* %130
  %132 = call float @absf(float %131)
  store float %132, float* %val, align 4
  br label %133

; <label>:133                                     ; preds = %127, %119
  br label %134

; <label>:134                                     ; preds = %133, %113
  br label %135

; <label>:135                                     ; preds = %134
  store i8 1, i8* %flag, align 1
  br label %136

; <label>:136                                     ; preds = %135, %91
  %137 = load i16* %I, align 2
  %138 = add i16 %137, 1
  store i16 %138, i16* %I, align 2
  br label %64

; <label>:139                                     ; preds = %64
  %140 = load i8* %exor, align 1
  %141 = zext i8 %140 to i32
  %142 = icmp eq i32 %141, 0
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %139
  br label %145

; <label>:144                                     ; preds = %139
  br label %145

; <label>:145                                     ; preds = %144, %143
  %146 = phi double [ 1.000000e+00, %143 ], [ -1.000000e+00, %144 ]
  %147 = fptrunc double %146 to float
  store float %147, float* %sign, align 4
  %148 = load float* %val, align 4
  %149 = load float* %sign, align 4
  %150 = fmul float %148, %149
  %151 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %152 = zext i16 %151 to i32
  %153 = add nsw i32 3, %152
  %154 = load i16* %row, align 2
  %155 = zext i16 %154 to i32
  %156 = add nsw i32 %153, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %157
  %159 = load i16* %158
  %160 = zext i16 %159 to i32
  %161 = sub nsw i32 %160, 1
  %162 = load i16* %col, align 2
  %163 = zext i16 %162 to i32
  %164 = add nsw i32 %161, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %165
  store float %150, float* %166
  %167 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %168 = zext i16 %167 to i32
  %169 = add nsw i32 3, %168
  %170 = load i16* %row, align 2
  %171 = zext i16 %170 to i32
  %172 = add nsw i32 %169, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %173
  %175 = load i16* %174
  %176 = zext i16 %175 to i32
  %177 = sub nsw i32 %176, 1
  %178 = load i16* %col, align 2
  %179 = zext i16 %178 to i32
  %180 = add nsw i32 %177, %179
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %181
  %183 = load float* %182
  %184 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %185 = zext i16 %184 to i32
  %186 = add nsw i32 3, %185
  %187 = load i16* %row, align 2
  %188 = zext i16 %187 to i32
  %189 = add nsw i32 %186, %188
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %190
  %192 = load i16* %191
  %193 = zext i16 %192 to i32
  %194 = add nsw i32 3, %193
  %195 = sub nsw i32 %194, 1
  %196 = load i16* %col, align 2
  %197 = zext i16 %196 to i32
  %198 = add nsw i32 %195, %197
  %199 = sext i32 %198 to i64
  %200 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %199
  %201 = load i16* %200
  %202 = zext i16 %201 to i32
  %203 = sub nsw i32 %202, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %204
  %206 = load float* %205
  %207 = fadd float %206, %183
  store float %207, float* %205
  br label %208

; <label>:208                                     ; preds = %145
  %209 = load i16* %col, align 2
  %210 = add i16 %209, 1
  store i16 %210, i16* %col, align 2
  br label %57

; <label>:211                                     ; preds = %57
  br label %212

; <label>:212                                     ; preds = %211
  %213 = load i16* %row, align 2
  %214 = add i16 %213, 1
  store i16 %214, i16* %row, align 2
  br label %3

; <label>:215                                     ; preds = %3
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0), i8 zeroext 1)
  br label %1
                                                  ; No predecessors!
  ret void
}

define float @absf(float %f) nounwind {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %f, float* %2, align 4
  %3 = load float* %2, align 4
  %4 = fpext float %3 to double
  %5 = fcmp olt double %4, 0.000000e+00
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load float* %2, align 4
  %8 = fsub float -0.000000e+00, %7
  store float %8, float* %1
  br label %11

; <label>:9                                       ; preds = %0
  %10 = load float* %2, align 4
  store float %10, float* %1
  br label %11

; <label>:11                                      ; preds = %9, %6
  %12 = load float* %1
  ret float %12
}

define void @checkIsdecoded() nounwind {
  %start_check_is_decoded = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %I = alloca i16, align 2
  br label %1

; <label>:1                                       ; preds = %52, %0
  %2 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([17 x i8]* @.str10, i32 0, i32 0))
  store i8 %2, i8* %start_check_is_decoded, align 1
  store i8 1, i8* %is_decoded, align 1
  store i16 0, i16* %I, align 2
  br label %3

; <label>:3                                       ; preds = %49, %1
  %4 = load i16* %I, align 2
  %5 = zext i16 %4 to i32
  %6 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 1)
  %7 = zext i16 %6 to i32
  %8 = icmp slt i32 %5, %7
  br i1 %8, label %9, label %52

; <label>:9                                       ; preds = %3
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %10 = load i16* %I, align 2
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %11
  %13 = load float* %12
  %14 = fpext float %13 to double
  %15 = fcmp ogt double %14, 0.000000e+00
  br i1 %15, label %16, label %28

; <label>:16                                      ; preds = %9
  %17 = load i16* %I, align 2
  %18 = zext i16 %17 to i64
  %19 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %18
  %20 = load float* %19
  %21 = fpext float %20 to double
  %22 = fcmp ogt double %21, 0.000000e+00
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %16
  store i8 0, i8* %is_decoded, align 1
  br label %24

; <label>:24                                      ; preds = %23, %16
  %25 = load i16* %I, align 2
  %26 = zext i16 %25 to i64
  %27 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %26
  store float -1.000000e+00, float* %27
  br label %48

; <label>:28                                      ; preds = %9
  %29 = load i16* %I, align 2
  %30 = zext i16 %29 to i64
  %31 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %30
  %32 = load float* %31
  %33 = fpext float %32 to double
  %34 = fcmp olt double %33, 0.000000e+00
  br i1 %34, label %35, label %47

; <label>:35                                      ; preds = %28
  %36 = load i16* %I, align 2
  %37 = zext i16 %36 to i64
  %38 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %37
  %39 = load float* %38
  %40 = fpext float %39 to double
  %41 = fcmp olt double %40, 0.000000e+00
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %35
  store i8 0, i8* %is_decoded, align 1
  br label %43

; <label>:43                                      ; preds = %42, %35
  %44 = load i16* %I, align 2
  %45 = zext i16 %44 to i64
  %46 = getelementptr inbounds [13000 x float]* @code_block, i32 0, i64 %45
  store float 1.000000e+00, float* %46
  br label %47

; <label>:47                                      ; preds = %43, %28
  br label %48

; <label>:48                                      ; preds = %47, %24
  br label %49

; <label>:49                                      ; preds = %48
  %50 = load i16* %I, align 2
  %51 = add i16 %50, 1
  store i16 %51, i16* %I, align 2
  br label %3

; <label>:52                                      ; preds = %3
  %53 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([16 x i8]* @.str11, i32 0, i32 0), i8 zeroext %53)
  br label %1
                                                  ; No predecessors!
  ret void
}

define void @updateMessage() nounwind {
  %nitr = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  br label %1

; <label>:1                                       ; preds = %141, %0
  %2 = load i8* %nitr, align 1
  %3 = zext i8 %2 to i32
  %4 = load i16* @maxNitr, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %.loopexit

; <label>:7                                       ; preds = %1
  %8 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([16 x i8]* @.str11, i32 0, i32 0))
  store i8 %8, i8* %is_decoded, align 1
  %9 = load i8* %is_decoded, align 1
  %10 = zext i8 %9 to i32
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %7
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0), i8 zeroext 1)
  %13 = load i8* %nitr, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str13, i32 0, i32 0), i8 zeroext %13)
  br label %144

; <label>:14                                      ; preds = %7
  store i16 0, i16* %row, align 2
  br label %15

; <label>:15                                      ; preds = %137, %14
  %16 = load i16* %row, align 2
  %17 = zext i16 %16 to i32
  %18 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %19 = zext i16 %18 to i32
  %20 = icmp slt i32 %17, %19
  br i1 %20, label %21, label %140

; <label>:21                                      ; preds = %15
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %22 = load i16* %row, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 0)
  %25 = zext i16 %24 to i32
  %26 = sub nsw i32 %25, 1
  %27 = icmp eq i32 %23, %26
  br i1 %27, label %28, label %44

; <label>:28                                      ; preds = %21
  %29 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %30 = zext i16 %29 to i32
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %37
  %39 = load i16* %38
  %40 = zext i16 %39 to i32
  %41 = sub nsw i32 %40, 1
  %42 = sub nsw i32 %30, %41
  %43 = trunc i32 %42 to i16
  store i16 %43, i16* %range, align 2
  br label %68

; <label>:44                                      ; preds = %21
  %45 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 3, %46
  %48 = load i16* %row, align 2
  %49 = zext i16 %48 to i32
  %50 = add nsw i32 %47, %49
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %52
  %54 = load i16* %53
  %55 = zext i16 %54 to i32
  %56 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %57 = zext i16 %56 to i32
  %58 = add nsw i32 3, %57
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i32
  %61 = add nsw i32 %58, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %62
  %64 = load i16* %63
  %65 = zext i16 %64 to i32
  %66 = sub nsw i32 %55, %65
  %67 = trunc i32 %66 to i16
  store i16 %67, i16* %range, align 2
  br label %68

; <label>:68                                      ; preds = %44, %28
  store i16 0, i16* %col, align 2
  br label %69

; <label>:69                                      ; preds = %133, %68
  %70 = load i16* %col, align 2
  %71 = zext i16 %70 to i32
  %72 = load i16* %range, align 2
  %73 = zext i16 %72 to i32
  %74 = icmp slt i32 %71, %73
  br i1 %74, label %75, label %136

; <label>:75                                      ; preds = %69
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %76 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 3, %77
  %79 = load i16* %row, align 2
  %80 = zext i16 %79 to i32
  %81 = add nsw i32 %78, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %82
  %84 = load i16* %83
  %85 = zext i16 %84 to i32
  %86 = add nsw i32 3, %85
  %87 = sub nsw i32 %86, 1
  %88 = load i16* %col, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [13000 x float]* @aPosteriori, i32 0, i64 %96
  %98 = load float* %97
  %99 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %100 = zext i16 %99 to i32
  %101 = add nsw i32 3, %100
  %102 = load i16* %row, align 2
  %103 = zext i16 %102 to i32
  %104 = add nsw i32 %101, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %105
  %107 = load i16* %106
  %108 = zext i16 %107 to i32
  %109 = sub nsw i32 %108, 1
  %110 = load i16* %col, align 2
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 %109, %111
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [20000 x float]* @ext_info, i32 0, i64 %113
  %115 = load float* %114
  %116 = fsub float %98, %115
  %117 = load i16* getelementptr inbounds ([20000 x i16]* @mem, i32 0, i64 2)
  %118 = zext i16 %117 to i32
  %119 = add nsw i32 3, %118
  %120 = load i16* %row, align 2
  %121 = zext i16 %120 to i32
  %122 = add nsw i32 %119, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [20000 x i16]* @mem, i32 0, i64 %123
  %125 = load i16* %124
  %126 = zext i16 %125 to i32
  %127 = sub nsw i32 %126, 1
  %128 = load i16* %col, align 2
  %129 = zext i16 %128 to i32
  %130 = add nsw i32 %127, %129
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [20000 x float]* @message, i32 0, i64 %131
  store float %116, float* %132
  br label %133

; <label>:133                                     ; preds = %75
  %134 = load i16* %col, align 2
  %135 = add i16 %134, 1
  store i16 %135, i16* %col, align 2
  br label %69

; <label>:136                                     ; preds = %69
  br label %137

; <label>:137                                     ; preds = %136
  %138 = load i16* %row, align 2
  %139 = add i16 %138, 1
  store i16 %139, i16* %row, align 2
  br label %15

; <label>:140                                     ; preds = %15
  call void @write_uint8(i8* getelementptr inbounds ([16 x i8]* @.str7, i32 0, i32 0), i8 zeroext 1)
  br label %141

; <label>:141                                     ; preds = %140
  %142 = load i8* %nitr, align 1
  %143 = add i8 %142, 1
  store i8 %143, i8* %nitr, align 1
  br label %1

.loopexit:                                        ; preds = %1
  br label %144

; <label>:144                                     ; preds = %.loopexit, %12
  ret void
}

define void @daemon() nounwind {
  %decoding_done = alloca i8, align 1
  %nitr = alloca i8, align 1
  call void @initInputs()
  call void @write_uint8(i8* getelementptr inbounds ([15 x i8]* @.str3, i32 0, i32 0), i8 zeroext 1)
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str12, i32 0, i32 0))
  store i8 %1, i8* %decoding_done, align 1
  %2 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str13, i32 0, i32 0))
  store i8 %2, i8* %nitr, align 1
  call void @write_uint8(i8* getelementptr inbounds ([16 x i8]* @.str14, i32 0, i32 0), i8 zeroext 1)
  ret void
}
