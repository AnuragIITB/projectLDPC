; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str1 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str2 = private constant [10 x i8] c"matrix_in\00"
@mem = common global [512 x i16] zeroinitializer, align 16
@nrows = common global i16 0, align 2
@ncols = common global i16 0, align 2
@ncol_ind = common global i16 0, align 2
@.str3 = private constant [8 x i8] c"rate_in\00"
@rate = common global float 0.000000e+00, align 4
@.str4 = private constant [14 x i8] c"code_block_in\00"
@code_block = common global [512 x float] zeroinitializer, align 16
@aPriori = common global [512 x float] zeroinitializer, align 16
@.str5 = private constant [8 x i8] c"mem_out\00"
@.str6 = private constant [15 x i8] c"code_block_out\00"
@.str7 = private constant [12 x i8] c"aPriori_out\00"
@message = common global [512 x float] zeroinitializer, align 16

define void @initInputs() nounwind {
  %nitr = alloca i16, align 2
  %SNR = alloca float, align 4
  %I = alloca i16, align 2
  %val = alloca i16, align 2
  %range = alloca i16, align 2
  %Rate = alloca float, align 4
  %1 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0))
  store i16 %1, i16* %nitr, align 2
  %2 = load i16* %nitr, align 2
  store i16 %2, i16* @maxNitr, align 2
  %3 = call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0))
  store float %3, float* %SNR, align 4
  %4 = load float* %SNR, align 4
  store float %4, float* @ebbyNo, align 4
  store i16 0, i16* %I, align 2
  br label %5

; <label>:5                                       ; preds = %15, %0
  %6 = load i16* %I, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %5
  %10 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %10, i16* %val, align 2
  %11 = load i16* %val, align 2
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds [512 x i16]* @mem, i32 0, i64 %13
  store i16 %11, i16* %14
  br label %15

; <label>:15                                      ; preds = %9
  %16 = load i16* %I, align 2
  %17 = add i16 %16, 1
  store i16 %17, i16* %I, align 2
  br label %5

; <label>:18                                      ; preds = %5
  %19 = load i16* getelementptr inbounds ([512 x i16]* @mem, i32 0, i64 0)
  store i16 %19, i16* @nrows, align 2
  %20 = load i16* getelementptr inbounds ([512 x i16]* @mem, i32 0, i64 1)
  store i16 %20, i16* @ncols, align 2
  %21 = load i16* getelementptr inbounds ([512 x i16]* @mem, i32 0, i64 2)
  store i16 %21, i16* @ncol_ind, align 2
  %22 = load i16* getelementptr inbounds ([512 x i16]* @mem, i32 0, i64 2)
  %23 = zext i16 %22 to i32
  %24 = load i16* getelementptr inbounds ([512 x i16]* @mem, i32 0, i64 0)
  %25 = zext i16 %24 to i32
  %26 = add nsw i32 %23, %25
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %28

; <label>:28                                      ; preds = %42, %18
  %29 = load i16* %I, align 2
  %30 = zext i16 %29 to i32
  %31 = load i16* %range, align 2
  %32 = zext i16 %31 to i32
  %33 = icmp slt i32 %30, %32
  br i1 %33, label %34, label %45

; <label>:34                                      ; preds = %28
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %35 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %35, i16* %val, align 2
  %36 = load i16* %val, align 2
  %37 = load i16* %I, align 2
  %38 = zext i16 %37 to i32
  %39 = add nsw i32 %38, 3
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [512 x i16]* @mem, i32 0, i64 %40
  store i16 %36, i16* %41
  br label %42

; <label>:42                                      ; preds = %34
  %43 = load i16* %I, align 2
  %44 = add i16 %43, 1
  store i16 %44, i16* %I, align 2
  br label %28

; <label>:45                                      ; preds = %28
  %46 = call float @read_float32(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0))
  store float %46, float* %Rate, align 4
  %47 = load float* %Rate, align 4
  store float %47, float* @rate, align 4
  ret void
}

declare zeroext i16 @read_uint16(i8*)

declare float @read_float32(i8*)

declare void @__loop_pipelining_on__(i32, i32, i32)

define void @readCodeBlock() nounwind {
  %I = alloca i8, align 1
  %code_bit = alloca float, align 4
  store i8 0, i8* %I, align 1
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i8* %I, align 1
  %3 = zext i8 %2 to i32
  %4 = load i16* @ncols, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %8 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0))
  store float %8, float* %code_bit, align 4
  %9 = load float* %code_bit, align 4
  %10 = load i8* %I, align 1
  %11 = zext i8 %10 to i64
  %12 = getelementptr inbounds [512 x float]* @code_block, i32 0, i64 %11
  store float %9, float* %12
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i8* %I, align 1
  %15 = add i8 %14, 1
  store i8 %15, i8* %I, align 1
  br label %1

; <label>:16                                      ; preds = %1
  ret void
}

define void @initialize_aPriori() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* @ncols, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = uitofp i16 %8 to float
  %10 = load i16* %I, align 2
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds [512 x float]* @aPriori, i32 0, i64 %11
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

define i32 @send_output() nounwind {
  %1 = alloca i32, align 4
  %J = alloca i32, align 4
  %val = alloca i16, align 2
  %val1 = alloca float, align 4
  %val2 = alloca float, align 4
  store i32 0, i32* %J, align 4
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i32* %J, align 4
  %4 = load i16* @nrows, align 2
  %5 = zext i16 %4 to i32
  %6 = load i16* @ncol_ind, align 2
  %7 = zext i16 %6 to i32
  %8 = add nsw i32 %5, %7
  %9 = add nsw i32 %8, 3
  %10 = icmp slt i32 %3, %9
  br i1 %10, label %11, label %20

; <label>:11                                      ; preds = %2
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %12 = load i32* %J, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [512 x i16]* @mem, i32 0, i64 %13
  %15 = load i16* %14
  store i16 %15, i16* %val, align 2
  %16 = load i16* %val, align 2
  call void @write_uint16(i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0), i16 zeroext %16)
  br label %17

; <label>:17                                      ; preds = %11
  %18 = load i32* %J, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %J, align 4
  br label %2

; <label>:20                                      ; preds = %2
  store i32 0, i32* %J, align 4
  br label %21

; <label>:21                                      ; preds = %32, %20
  %22 = load i32* %J, align 4
  %23 = load i16* @ncols, align 2
  %24 = zext i16 %23 to i32
  %25 = icmp slt i32 %22, %24
  br i1 %25, label %26, label %35

; <label>:26                                      ; preds = %21
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %27 = load i32* %J, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [512 x float]* @code_block, i32 0, i64 %28
  %30 = load float* %29
  store float %30, float* %val1, align 4
  %31 = load float* %val1, align 4
  call void @write_float32(i8* getelementptr inbounds ([15 x i8]* @.str6, i32 0, i32 0), float %31)
  br label %32

; <label>:32                                      ; preds = %26
  %33 = load i32* %J, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %J, align 4
  br label %21

; <label>:35                                      ; preds = %21
  store i32 0, i32* %J, align 4
  br label %36

; <label>:36                                      ; preds = %47, %35
  %37 = load i32* %J, align 4
  %38 = load i16* @ncols, align 2
  %39 = zext i16 %38 to i32
  %40 = icmp slt i32 %37, %39
  br i1 %40, label %41, label %50

; <label>:41                                      ; preds = %36
  call void @__loop_pipelining_on__(i32 16, i32 2, i32 1)
  %42 = load i32* %J, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [512 x float]* @aPriori, i32 0, i64 %43
  %45 = load float* %44
  store float %45, float* %val2, align 4
  %46 = load float* %val2, align 4
  call void @write_float32(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), float %46)
  br label %47

; <label>:47                                      ; preds = %41
  %48 = load i32* %J, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %J, align 4
  br label %36

; <label>:50                                      ; preds = %36
  %51 = load i32* %1
  ret i32 %51
}

declare void @write_uint16(i8*, i16 zeroext)

declare void @write_float32(i8*, float)

define void @top_daemon() nounwind {
  %nitr = alloca i8, align 1
  br label %1

; <label>:1                                       ; preds = %1, %0
  call void @initInputs()
  call void @readCodeBlock()
  store i8 1, i8* %nitr, align 1
  call void @initialize_aPriori()
  %2 = call i32 @send_output()
  br label %1
                                                  ; No predecessors!
  ret void
}
