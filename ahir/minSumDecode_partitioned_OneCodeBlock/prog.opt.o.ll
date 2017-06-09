; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private constant [10 x i8] c"matrix_in\00"
@mem11 = common global [20000 x i16] zeroinitializer, align 16
@mem12 = common global [20000 x i16] zeroinitializer, align 16
@mem21 = common global [20000 x i16] zeroinitializer, align 16
@mem22 = common global [20000 x i16] zeroinitializer, align 16
@.str1 = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str2 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str3 = private constant [8 x i8] c"rate_in\00"
@rate = common global float 0.000000e+00, align 4
@.str4 = private constant [14 x i8] c"code_block_in\00"
@code_block1 = common global [13000 x float] zeroinitializer, align 16
@code_block2 = common global [13000 x float] zeroinitializer, align 16
@aPriori1 = common global [13000 x float] zeroinitializer, align 16
@aPriori2 = common global [13000 x float] zeroinitializer, align 16
@message11 = common global [20000 x float] zeroinitializer, align 16
@message12 = common global [20000 x float] zeroinitializer, align 16
@message21 = common global [20000 x float] zeroinitializer, align 16
@message22 = common global [20000 x float] zeroinitializer, align 16
@aPosteriori1 = common global [13000 x float] zeroinitializer, align 16
@aPosteriori2 = common global [13000 x float] zeroinitializer, align 16
@ext_info11 = common global [20000 x float] zeroinitializer, align 16
@ext_info12 = common global [20000 x float] zeroinitializer, align 16
@ext_info21 = common global [20000 x float] zeroinitializer, align 16
@ext_info22 = common global [20000 x float] zeroinitializer, align 16
@trans_info11_12 = common global [20000 x float] zeroinitializer, align 16
@trans_info12_11 = common global [20000 x float] zeroinitializer, align 16
@trans_info21_22 = common global [20000 x float] zeroinitializer, align 16
@trans_info22_21 = common global [20000 x float] zeroinitializer, align 16
@.str5 = private constant [24 x i8] c"reading_code_block_done\00"
@.str6 = private constant [22 x i8] c"message11_initialized\00"
@.str7 = private constant [32 x i8] c"trans_info11_12_calulation_done\00"
@.str8 = private constant [32 x i8] c"trans_info12_11_calulation_done\00"
@.str9 = private constant [26 x i8] c"aPosteriori1_phase_1_done\00"
@.str10 = private constant [26 x i8] c"aPosteriori1_phase_2_done\00"
@.str11 = private constant [13 x i8] c"is_decoded_2\00"
@.str12 = private constant [14 x i8] c"is_decoded_d2\00"
@.str13 = private constant [14 x i8] c"is_decoded_d3\00"
@.str14 = private constant [14 x i8] c"is_decoded_d4\00"
@.str15 = private constant [19 x i8] c"message11_modified\00"
@.str16 = private constant [19 x i8] c"message21_modified\00"
@.str17 = private constant [16 x i8] c"code_block1_out\00"
@.str18 = private constant [16 x i8] c"code_block2_out\00"
@.str19 = private constant [22 x i8] c"message12_initialized\00"
@.str20 = private constant [26 x i8] c"aPosteriori2_phase_1_done\00"
@.str21 = private constant [26 x i8] c"aPosteriori2_phase_2_done\00"
@.str22 = private constant [19 x i8] c"message12_modified\00"
@.str23 = private constant [19 x i8] c"message22_modified\00"
@.str24 = private constant [32 x i8] c"trans_info21_22_calulation_done\00"
@.str25 = private constant [32 x i8] c"trans_info22_21_calulation_done\00"

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
  %10 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %9
  store i16 %7, i16* %10
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i16* %I, align 2
  %13 = add i16 %12, 1
  store i16 %13, i16* %I, align 2
  br label %1

; <label>:14                                      ; preds = %1
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
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
  %28 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %28, i16* %val, align 2
  %29 = load i16* %val, align 2
  %30 = load i16* %I, align 2
  %31 = zext i16 %30 to i32
  %32 = add nsw i32 %31, 3
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %33
  store i16 %29, i16* %34
  br label %35

; <label>:35                                      ; preds = %27
  %36 = load i16* %I, align 2
  %37 = add i16 %36, 1
  store i16 %37, i16* %I, align 2
  br label %21

; <label>:38                                      ; preds = %21
  store i16 0, i16* %I, align 2
  br label %39

; <label>:39                                      ; preds = %49, %38
  %40 = load i16* %I, align 2
  %41 = zext i16 %40 to i32
  %42 = icmp slt i32 %41, 3
  br i1 %42, label %43, label %52

; <label>:43                                      ; preds = %39
  %44 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %44, i16* %val, align 2
  %45 = load i16* %val, align 2
  %46 = load i16* %I, align 2
  %47 = zext i16 %46 to i64
  %48 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %47
  store i16 %45, i16* %48
  br label %49

; <label>:49                                      ; preds = %43
  %50 = load i16* %I, align 2
  %51 = add i16 %50, 1
  store i16 %51, i16* %I, align 2
  br label %39

; <label>:52                                      ; preds = %39
  %53 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %54 = zext i16 %53 to i32
  %55 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 0)
  %56 = zext i16 %55 to i32
  %57 = add nsw i32 %54, %56
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %59

; <label>:59                                      ; preds = %73, %52
  %60 = load i16* %I, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %76

; <label>:65                                      ; preds = %59
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %66 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %66, i16* %val, align 2
  %67 = load i16* %val, align 2
  %68 = load i16* %I, align 2
  %69 = zext i16 %68 to i32
  %70 = add nsw i32 %69, 3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %71
  store i16 %67, i16* %72
  br label %73

; <label>:73                                      ; preds = %65
  %74 = load i16* %I, align 2
  %75 = add i16 %74, 1
  store i16 %75, i16* %I, align 2
  br label %59

; <label>:76                                      ; preds = %59
  store i16 0, i16* %I, align 2
  br label %77

; <label>:77                                      ; preds = %87, %76
  %78 = load i16* %I, align 2
  %79 = zext i16 %78 to i32
  %80 = icmp slt i32 %79, 3
  br i1 %80, label %81, label %90

; <label>:81                                      ; preds = %77
  %82 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %82, i16* %val, align 2
  %83 = load i16* %val, align 2
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i64
  %86 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %85
  store i16 %83, i16* %86
  br label %87

; <label>:87                                      ; preds = %81
  %88 = load i16* %I, align 2
  %89 = add i16 %88, 1
  store i16 %89, i16* %I, align 2
  br label %77

; <label>:90                                      ; preds = %77
  %91 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %92 = zext i16 %91 to i32
  %93 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 0)
  %94 = zext i16 %93 to i32
  %95 = add nsw i32 %92, %94
  %96 = trunc i32 %95 to i16
  store i16 %96, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %97

; <label>:97                                      ; preds = %111, %90
  %98 = load i16* %I, align 2
  %99 = zext i16 %98 to i32
  %100 = load i16* %range, align 2
  %101 = zext i16 %100 to i32
  %102 = icmp slt i32 %99, %101
  br i1 %102, label %103, label %114

; <label>:103                                     ; preds = %97
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %104 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %104, i16* %val, align 2
  %105 = load i16* %val, align 2
  %106 = load i16* %I, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %107, 3
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %109
  store i16 %105, i16* %110
  br label %111

; <label>:111                                     ; preds = %103
  %112 = load i16* %I, align 2
  %113 = add i16 %112, 1
  store i16 %113, i16* %I, align 2
  br label %97

; <label>:114                                     ; preds = %97
  store i16 0, i16* %I, align 2
  br label %115

; <label>:115                                     ; preds = %125, %114
  %116 = load i16* %I, align 2
  %117 = zext i16 %116 to i32
  %118 = icmp slt i32 %117, 3
  br i1 %118, label %119, label %128

; <label>:119                                     ; preds = %115
  %120 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %120, i16* %val, align 2
  %121 = load i16* %val, align 2
  %122 = load i16* %I, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %123
  store i16 %121, i16* %124
  br label %125

; <label>:125                                     ; preds = %119
  %126 = load i16* %I, align 2
  %127 = add i16 %126, 1
  store i16 %127, i16* %I, align 2
  br label %115

; <label>:128                                     ; preds = %115
  %129 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %130 = zext i16 %129 to i32
  %131 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 0)
  %132 = zext i16 %131 to i32
  %133 = add nsw i32 %130, %132
  %134 = trunc i32 %133 to i16
  store i16 %134, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %135

; <label>:135                                     ; preds = %149, %128
  %136 = load i16* %I, align 2
  %137 = zext i16 %136 to i32
  %138 = load i16* %range, align 2
  %139 = zext i16 %138 to i32
  %140 = icmp slt i32 %137, %139
  br i1 %140, label %141, label %152

; <label>:141                                     ; preds = %135
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %142 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0))
  store i16 %142, i16* %val, align 2
  %143 = load i16* %val, align 2
  %144 = load i16* %I, align 2
  %145 = zext i16 %144 to i32
  %146 = add nsw i32 %145, 3
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %147
  store i16 %143, i16* %148
  br label %149

; <label>:149                                     ; preds = %141
  %150 = load i16* %I, align 2
  %151 = add i16 %150, 1
  store i16 %151, i16* %I, align 2
  br label %135

; <label>:152                                     ; preds = %135
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
  ret void
}

declare float @read_float32(i8*)

define void @readCodeBlock() nounwind {
  %I = alloca i16, align 2
  %code_bit = alloca float, align 4
  %code_bit1 = alloca float, align 4
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %13, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0))
  store float %8, float* %code_bit, align 4
  %9 = load float* %code_bit, align 4
  %10 = load i16* %I, align 2
  %11 = zext i16 %10 to i64
  %12 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %11
  store float %9, float* %12
  br label %13

; <label>:13                                      ; preds = %7
  %14 = load i16* %I, align 2
  %15 = add i16 %14, 1
  store i16 %15, i16* %I, align 2
  br label %1

; <label>:16                                      ; preds = %1
  store i16 0, i16* %I, align 2
  br label %17

; <label>:17                                      ; preds = %29, %16
  %18 = load i16* %I, align 2
  %19 = zext i16 %18 to i32
  %20 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %21 = zext i16 %20 to i32
  %22 = icmp slt i32 %19, %21
  br i1 %22, label %23, label %32

; <label>:23                                      ; preds = %17
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %24 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0))
  store float %24, float* %code_bit1, align 4
  %25 = load float* %code_bit1, align 4
  %26 = load i16* %I, align 2
  %27 = zext i16 %26 to i64
  %28 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %27
  store float %25, float* %28
  br label %29

; <label>:29                                      ; preds = %23
  %30 = load i16* %I, align 2
  %31 = add i16 %30, 1
  store i16 %31, i16* %I, align 2
  br label %17

; <label>:32                                      ; preds = %17
  ret void
}

define void @initialize_aPriori1() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %23

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %9
  %11 = load float* %10
  %12 = fmul float -4.000000e+00, %11
  %13 = load float* @rate, align 4
  %14 = load float* @ebbyNo, align 4
  %15 = fmul float %13, %14
  %16 = fmul float %12, %15
  %17 = load i16* %I, align 2
  %18 = zext i16 %17 to i64
  %19 = getelementptr inbounds [13000 x float]* @aPriori1, i32 0, i64 %18
  store float %16, float* %19
  br label %20

; <label>:20                                      ; preds = %7
  %21 = load i16* %I, align 2
  %22 = add i16 %21, 1
  store i16 %22, i16* %I, align 2
  br label %1

; <label>:23                                      ; preds = %1
  ret void
}

define void @initialize_aPriori2() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %20, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %23

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %9
  %11 = load float* %10
  %12 = fmul float -4.000000e+00, %11
  %13 = load float* @rate, align 4
  %14 = load float* @ebbyNo, align 4
  %15 = fmul float %13, %14
  %16 = fmul float %12, %15
  %17 = load i16* %I, align 2
  %18 = zext i16 %17 to i64
  %19 = getelementptr inbounds [13000 x float]* @aPriori2, i32 0, i64 %18
  store float %16, float* %19
  br label %20

; <label>:20                                      ; preds = %7
  %21 = load i16* %I, align 2
  %22 = add i16 %21, 1
  store i16 %22, i16* %I, align 2
  br label %1

; <label>:23                                      ; preds = %1
  ret void
}

define void @initializeMessage11() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 3, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %11
  %13 = load i16* %12
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @aPriori1, i32 0, i64 %16
  %18 = load float* %17
  %19 = load i16* %I, align 2
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %20
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

define void @initializeMessage12() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 3, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %11
  %13 = load i16* %12
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @aPriori2, i32 0, i64 %16
  %18 = load float* %17
  %19 = load i16* %I, align 2
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %20
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

define void @initializeMessage21() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 3, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %11
  %13 = load i16* %12
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @aPriori1, i32 0, i64 %16
  %18 = load float* %17
  %19 = load i16* %I, align 2
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %20
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

define void @initializeMessage22() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %22, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %25

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 3, %9
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %11
  %13 = load i16* %12
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, 1
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @aPriori2, i32 0, i64 %16
  %18 = load float* %17
  %19 = load i16* %I, align 2
  %20 = zext i16 %19 to i64
  %21 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %20
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

define void @initialize_aPosteriori1() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %15, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPriori1, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %13
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

define void @initialize_aPosteriori2() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %15, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPriori2, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i64
  %14 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %13
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

define void @initializeExtrinsicInfo11() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %9
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

define void @initializeExtrinsicInfo12() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %9
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

define void @initializeExtrinsicInfo21() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %9
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

define void @initializeExtrinsicInfo22() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %9
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

define void @initializeTransInfo11_12() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %9
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

define void @initializeTransInfo12_11() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %9
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

define void @initializeTransInfo21_22() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %9
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

define void @initializeTransInfo22_21() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %11, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %14

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %9
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

define float @modifyInfo(float %ext_info, float %self_information) nounwind {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  %sign = alloca float, align 4
  %magnitude = alloca float, align 4
  store float %ext_info, float* %1, align 4
  store float %self_information, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = fcmp oge float %3, 0.000000e+00
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %0
  %6 = load float* %2, align 4
  %7 = fcmp oge float %6, 0.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store float 1.000000e+00, float* %sign, align 4
  br label %10

; <label>:9                                       ; preds = %5
  store float -1.000000e+00, float* %sign, align 4
  br label %10

; <label>:10                                      ; preds = %9, %8
  br label %17

; <label>:11                                      ; preds = %0
  %12 = load float* %2, align 4
  %13 = fcmp olt float %12, 0.000000e+00
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  store float 1.000000e+00, float* %sign, align 4
  br label %16

; <label>:15                                      ; preds = %11
  store float -1.000000e+00, float* %sign, align 4
  br label %16

; <label>:16                                      ; preds = %15, %14
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load float* %2, align 4
  %19 = call float @absf(float %18)
  %20 = load float* %1, align 4
  %21 = call float @absf(float %20)
  %22 = fcmp ogt float %19, %21
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %17
  %24 = load float* %1, align 4
  %25 = call float @absf(float %24)
  store float %25, float* %magnitude, align 4
  br label %29

; <label>:26                                      ; preds = %17
  %27 = load float* %2, align 4
  %28 = call float @absf(float %27)
  store float %28, float* %magnitude, align 4
  br label %29

; <label>:29                                      ; preds = %26, %23
  %30 = load float* %sign, align 4
  %31 = load float* %magnitude, align 4
  %32 = fmul float %30, %31
  ret float %32
}

define void @checkNodeComputeEngine11() nounwind {
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

; <label>:1                                       ; preds = %238, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %241

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %214

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %210, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %213

; <label>:65                                      ; preds = %59
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %66

; <label>:66                                      ; preds = %138, %65
  %67 = load i16* %I, align 2
  %68 = zext i16 %67 to i32
  %69 = load i16* %range, align 2
  %70 = zext i16 %69 to i32
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %141

; <label>:72                                      ; preds = %66
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %73 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %74 = zext i16 %73 to i32
  %75 = add nsw i32 3, %74
  %76 = load i16* %row, align 2
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %75, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %79
  %81 = load i16* %80
  %82 = zext i16 %81 to i32
  %83 = sub nsw i32 %82, 1
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i32
  %86 = add nsw i32 %83, %85
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %index, align 2
  %88 = load i16* %I, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16* %col, align 2
  %91 = zext i16 %90 to i32
  %92 = icmp eq i32 %89, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %72
  br label %138

; <label>:94                                      ; preds = %72
  %95 = load i16* %index, align 2
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %96
  %98 = load float* %97
  %99 = fpext float %98 to double
  %100 = fcmp oge double %99, 0.000000e+00
  br i1 %100, label %101, label %106

; <label>:101                                     ; preds = %94
  %102 = load i8* %exor, align 1
  %103 = zext i8 %102 to i32
  %104 = xor i32 %103, 0
  %105 = trunc i32 %104 to i8
  store i8 %105, i8* %exor, align 1
  br label %111

; <label>:106                                     ; preds = %94
  %107 = load i8* %exor, align 1
  %108 = zext i8 %107 to i32
  %109 = xor i32 %108, 1
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %exor, align 1
  br label %111

; <label>:111                                     ; preds = %106, %101
  %112 = load i8* %flag, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %121

; <label>:115                                     ; preds = %111
  %116 = load i16* %index, align 2
  %117 = zext i16 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %117
  %119 = load float* %118
  %120 = call float @absf(float %119)
  store float %120, float* %val, align 4
  br label %136

; <label>:121                                     ; preds = %111
  %122 = load i16* %index, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %123
  %125 = load float* %124
  %126 = call float @absf(float %125)
  %127 = load float* %val, align 4
  %128 = fcmp olt float %126, %127
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %121
  %130 = load i16* %index, align 2
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %131
  %133 = load float* %132
  %134 = call float @absf(float %133)
  store float %134, float* %val, align 4
  br label %135

; <label>:135                                     ; preds = %129, %121
  br label %136

; <label>:136                                     ; preds = %135, %115
  br label %137

; <label>:137                                     ; preds = %136
  store i8 1, i8* %flag, align 1
  br label %138

; <label>:138                                     ; preds = %137, %93
  %139 = load i16* %I, align 2
  %140 = add i16 %139, 1
  store i16 %140, i16* %I, align 2
  br label %66

; <label>:141                                     ; preds = %66
  %142 = load i8* %exor, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %141
  store float 1.000000e+00, float* %sign, align 4
  br label %147

; <label>:146                                     ; preds = %141
  store float -1.000000e+00, float* %sign, align 4
  br label %147

; <label>:147                                     ; preds = %146, %145
  %148 = load float* %val, align 4
  %149 = load float* %sign, align 4
  %150 = fmul float %148, %149
  %151 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %152 = zext i16 %151 to i32
  %153 = add nsw i32 3, %152
  %154 = load i16* %row, align 2
  %155 = zext i16 %154 to i32
  %156 = add nsw i32 %153, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %157
  %159 = load i16* %158
  %160 = zext i16 %159 to i32
  %161 = sub nsw i32 %160, 1
  %162 = load i16* %col, align 2
  %163 = zext i16 %162 to i32
  %164 = add nsw i32 %161, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %165
  store float %150, float* %166
  %167 = load i16* %col, align 2
  %168 = zext i16 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %209

; <label>:170                                     ; preds = %147
  %171 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 3, %172
  %174 = load i16* %row, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %177
  %179 = load i16* %178
  %180 = zext i16 %179 to i32
  %181 = sub nsw i32 %180, 1
  %182 = load i16* %col, align 2
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %185
  %187 = load float* %186
  %188 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %189 = zext i16 %188 to i32
  %190 = add nsw i32 3, %189
  %191 = load i16* %row, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %194
  %196 = load i16* %195
  %197 = zext i16 %196 to i32
  %198 = sub nsw i32 %197, 1
  %199 = load i16* %col, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %202
  %204 = load float* %203
  %205 = call float @modifyInfo(float %187, float %204)
  %206 = load i16* %row, align 2
  %207 = zext i16 %206 to i64
  %208 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %207
  store float %205, float* %208
  br label %209

; <label>:209                                     ; preds = %170, %147
  br label %210

; <label>:210                                     ; preds = %209
  %211 = load i16* %col, align 2
  %212 = add i16 %211, 1
  store i16 %212, i16* %col, align 2
  br label %59

; <label>:213                                     ; preds = %59
  br label %237

; <label>:214                                     ; preds = %54
  %215 = load i16* %range, align 2
  %216 = zext i16 %215 to i32
  %217 = icmp eq i32 %216, 1
  br i1 %217, label %218, label %236

; <label>:218                                     ; preds = %214
  %219 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %220 = zext i16 %219 to i32
  %221 = add nsw i32 3, %220
  %222 = load i16* %row, align 2
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 %221, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %225
  %227 = load i16* %226
  %228 = zext i16 %227 to i32
  %229 = sub nsw i32 %228, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %230
  %232 = load float* %231
  %233 = load i16* %row, align 2
  %234 = zext i16 %233 to i64
  %235 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %234
  store float %232, float* %235
  br label %236

; <label>:236                                     ; preds = %218, %214
  br label %237

; <label>:237                                     ; preds = %236, %213
  br label %238

; <label>:238                                     ; preds = %237
  %239 = load i16* %row, align 2
  %240 = add i16 %239, 1
  store i16 %240, i16* %row, align 2
  br label %1

; <label>:241                                     ; preds = %1
  ret void
}

define void @checkNodeComputeEngine12() nounwind {
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

; <label>:1                                       ; preds = %238, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %241

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %214

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %210, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %213

; <label>:65                                      ; preds = %59
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %66

; <label>:66                                      ; preds = %138, %65
  %67 = load i16* %I, align 2
  %68 = zext i16 %67 to i32
  %69 = load i16* %range, align 2
  %70 = zext i16 %69 to i32
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %141

; <label>:72                                      ; preds = %66
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %73 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %74 = zext i16 %73 to i32
  %75 = add nsw i32 3, %74
  %76 = load i16* %row, align 2
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %75, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %79
  %81 = load i16* %80
  %82 = zext i16 %81 to i32
  %83 = sub nsw i32 %82, 1
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i32
  %86 = add nsw i32 %83, %85
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %index, align 2
  %88 = load i16* %I, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16* %col, align 2
  %91 = zext i16 %90 to i32
  %92 = icmp eq i32 %89, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %72
  br label %138

; <label>:94                                      ; preds = %72
  %95 = load i16* %index, align 2
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %96
  %98 = load float* %97
  %99 = fpext float %98 to double
  %100 = fcmp oge double %99, 0.000000e+00
  br i1 %100, label %101, label %106

; <label>:101                                     ; preds = %94
  %102 = load i8* %exor, align 1
  %103 = zext i8 %102 to i32
  %104 = xor i32 %103, 0
  %105 = trunc i32 %104 to i8
  store i8 %105, i8* %exor, align 1
  br label %111

; <label>:106                                     ; preds = %94
  %107 = load i8* %exor, align 1
  %108 = zext i8 %107 to i32
  %109 = xor i32 %108, 1
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %exor, align 1
  br label %111

; <label>:111                                     ; preds = %106, %101
  %112 = load i8* %flag, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %121

; <label>:115                                     ; preds = %111
  %116 = load i16* %index, align 2
  %117 = zext i16 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %117
  %119 = load float* %118
  %120 = call float @absf(float %119)
  store float %120, float* %val, align 4
  br label %136

; <label>:121                                     ; preds = %111
  %122 = load i16* %index, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %123
  %125 = load float* %124
  %126 = call float @absf(float %125)
  %127 = load float* %val, align 4
  %128 = fcmp olt float %126, %127
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %121
  %130 = load i16* %index, align 2
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %131
  %133 = load float* %132
  %134 = call float @absf(float %133)
  store float %134, float* %val, align 4
  br label %135

; <label>:135                                     ; preds = %129, %121
  br label %136

; <label>:136                                     ; preds = %135, %115
  br label %137

; <label>:137                                     ; preds = %136
  store i8 1, i8* %flag, align 1
  br label %138

; <label>:138                                     ; preds = %137, %93
  %139 = load i16* %I, align 2
  %140 = add i16 %139, 1
  store i16 %140, i16* %I, align 2
  br label %66

; <label>:141                                     ; preds = %66
  %142 = load i8* %exor, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %141
  store float 1.000000e+00, float* %sign, align 4
  br label %147

; <label>:146                                     ; preds = %141
  store float -1.000000e+00, float* %sign, align 4
  br label %147

; <label>:147                                     ; preds = %146, %145
  %148 = load float* %val, align 4
  %149 = load float* %sign, align 4
  %150 = fmul float %148, %149
  %151 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %152 = zext i16 %151 to i32
  %153 = add nsw i32 3, %152
  %154 = load i16* %row, align 2
  %155 = zext i16 %154 to i32
  %156 = add nsw i32 %153, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %157
  %159 = load i16* %158
  %160 = zext i16 %159 to i32
  %161 = sub nsw i32 %160, 1
  %162 = load i16* %col, align 2
  %163 = zext i16 %162 to i32
  %164 = add nsw i32 %161, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %165
  store float %150, float* %166
  %167 = load i16* %col, align 2
  %168 = zext i16 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %209

; <label>:170                                     ; preds = %147
  %171 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 3, %172
  %174 = load i16* %row, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %177
  %179 = load i16* %178
  %180 = zext i16 %179 to i32
  %181 = sub nsw i32 %180, 1
  %182 = load i16* %col, align 2
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %185
  %187 = load float* %186
  %188 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %189 = zext i16 %188 to i32
  %190 = add nsw i32 3, %189
  %191 = load i16* %row, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %194
  %196 = load i16* %195
  %197 = zext i16 %196 to i32
  %198 = sub nsw i32 %197, 1
  %199 = load i16* %col, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %202
  %204 = load float* %203
  %205 = call float @modifyInfo(float %187, float %204)
  %206 = load i16* %row, align 2
  %207 = zext i16 %206 to i64
  %208 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %207
  store float %205, float* %208
  br label %209

; <label>:209                                     ; preds = %170, %147
  br label %210

; <label>:210                                     ; preds = %209
  %211 = load i16* %col, align 2
  %212 = add i16 %211, 1
  store i16 %212, i16* %col, align 2
  br label %59

; <label>:213                                     ; preds = %59
  br label %237

; <label>:214                                     ; preds = %54
  %215 = load i16* %range, align 2
  %216 = zext i16 %215 to i32
  %217 = icmp eq i32 %216, 1
  br i1 %217, label %218, label %236

; <label>:218                                     ; preds = %214
  %219 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %220 = zext i16 %219 to i32
  %221 = add nsw i32 3, %220
  %222 = load i16* %row, align 2
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 %221, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %225
  %227 = load i16* %226
  %228 = zext i16 %227 to i32
  %229 = sub nsw i32 %228, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %230
  %232 = load float* %231
  %233 = load i16* %row, align 2
  %234 = zext i16 %233 to i64
  %235 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %234
  store float %232, float* %235
  br label %236

; <label>:236                                     ; preds = %218, %214
  br label %237

; <label>:237                                     ; preds = %236, %213
  br label %238

; <label>:238                                     ; preds = %237
  %239 = load i16* %row, align 2
  %240 = add i16 %239, 1
  store i16 %240, i16* %row, align 2
  br label %1

; <label>:241                                     ; preds = %1
  ret void
}

define void @checkNodeComputeEngine21() nounwind {
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

; <label>:1                                       ; preds = %238, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %241

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %214

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %210, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %213

; <label>:65                                      ; preds = %59
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %66

; <label>:66                                      ; preds = %138, %65
  %67 = load i16* %I, align 2
  %68 = zext i16 %67 to i32
  %69 = load i16* %range, align 2
  %70 = zext i16 %69 to i32
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %141

; <label>:72                                      ; preds = %66
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %73 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %74 = zext i16 %73 to i32
  %75 = add nsw i32 3, %74
  %76 = load i16* %row, align 2
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %75, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %79
  %81 = load i16* %80
  %82 = zext i16 %81 to i32
  %83 = sub nsw i32 %82, 1
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i32
  %86 = add nsw i32 %83, %85
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %index, align 2
  %88 = load i16* %I, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16* %col, align 2
  %91 = zext i16 %90 to i32
  %92 = icmp eq i32 %89, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %72
  br label %138

; <label>:94                                      ; preds = %72
  %95 = load i16* %index, align 2
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %96
  %98 = load float* %97
  %99 = fpext float %98 to double
  %100 = fcmp oge double %99, 0.000000e+00
  br i1 %100, label %101, label %106

; <label>:101                                     ; preds = %94
  %102 = load i8* %exor, align 1
  %103 = zext i8 %102 to i32
  %104 = xor i32 %103, 0
  %105 = trunc i32 %104 to i8
  store i8 %105, i8* %exor, align 1
  br label %111

; <label>:106                                     ; preds = %94
  %107 = load i8* %exor, align 1
  %108 = zext i8 %107 to i32
  %109 = xor i32 %108, 1
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %exor, align 1
  br label %111

; <label>:111                                     ; preds = %106, %101
  %112 = load i8* %flag, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %121

; <label>:115                                     ; preds = %111
  %116 = load i16* %index, align 2
  %117 = zext i16 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %117
  %119 = load float* %118
  %120 = call float @absf(float %119)
  store float %120, float* %val, align 4
  br label %136

; <label>:121                                     ; preds = %111
  %122 = load i16* %index, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %123
  %125 = load float* %124
  %126 = call float @absf(float %125)
  %127 = load float* %val, align 4
  %128 = fcmp olt float %126, %127
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %121
  %130 = load i16* %index, align 2
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %131
  %133 = load float* %132
  %134 = call float @absf(float %133)
  store float %134, float* %val, align 4
  br label %135

; <label>:135                                     ; preds = %129, %121
  br label %136

; <label>:136                                     ; preds = %135, %115
  br label %137

; <label>:137                                     ; preds = %136
  store i8 1, i8* %flag, align 1
  br label %138

; <label>:138                                     ; preds = %137, %93
  %139 = load i16* %I, align 2
  %140 = add i16 %139, 1
  store i16 %140, i16* %I, align 2
  br label %66

; <label>:141                                     ; preds = %66
  %142 = load i8* %exor, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %141
  store float 1.000000e+00, float* %sign, align 4
  br label %147

; <label>:146                                     ; preds = %141
  store float -1.000000e+00, float* %sign, align 4
  br label %147

; <label>:147                                     ; preds = %146, %145
  %148 = load float* %val, align 4
  %149 = load float* %sign, align 4
  %150 = fmul float %148, %149
  %151 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %152 = zext i16 %151 to i32
  %153 = add nsw i32 3, %152
  %154 = load i16* %row, align 2
  %155 = zext i16 %154 to i32
  %156 = add nsw i32 %153, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %157
  %159 = load i16* %158
  %160 = zext i16 %159 to i32
  %161 = sub nsw i32 %160, 1
  %162 = load i16* %col, align 2
  %163 = zext i16 %162 to i32
  %164 = add nsw i32 %161, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %165
  store float %150, float* %166
  %167 = load i16* %col, align 2
  %168 = zext i16 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %209

; <label>:170                                     ; preds = %147
  %171 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 3, %172
  %174 = load i16* %row, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %177
  %179 = load i16* %178
  %180 = zext i16 %179 to i32
  %181 = sub nsw i32 %180, 1
  %182 = load i16* %col, align 2
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %185
  %187 = load float* %186
  %188 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %189 = zext i16 %188 to i32
  %190 = add nsw i32 3, %189
  %191 = load i16* %row, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %194
  %196 = load i16* %195
  %197 = zext i16 %196 to i32
  %198 = sub nsw i32 %197, 1
  %199 = load i16* %col, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %202
  %204 = load float* %203
  %205 = call float @modifyInfo(float %187, float %204)
  %206 = load i16* %row, align 2
  %207 = zext i16 %206 to i64
  %208 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %207
  store float %205, float* %208
  br label %209

; <label>:209                                     ; preds = %170, %147
  br label %210

; <label>:210                                     ; preds = %209
  %211 = load i16* %col, align 2
  %212 = add i16 %211, 1
  store i16 %212, i16* %col, align 2
  br label %59

; <label>:213                                     ; preds = %59
  br label %237

; <label>:214                                     ; preds = %54
  %215 = load i16* %range, align 2
  %216 = zext i16 %215 to i32
  %217 = icmp eq i32 %216, 1
  br i1 %217, label %218, label %236

; <label>:218                                     ; preds = %214
  %219 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %220 = zext i16 %219 to i32
  %221 = add nsw i32 3, %220
  %222 = load i16* %row, align 2
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 %221, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %225
  %227 = load i16* %226
  %228 = zext i16 %227 to i32
  %229 = sub nsw i32 %228, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %230
  %232 = load float* %231
  %233 = load i16* %row, align 2
  %234 = zext i16 %233 to i64
  %235 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %234
  store float %232, float* %235
  br label %236

; <label>:236                                     ; preds = %218, %214
  br label %237

; <label>:237                                     ; preds = %236, %213
  br label %238

; <label>:238                                     ; preds = %237
  %239 = load i16* %row, align 2
  %240 = add i16 %239, 1
  store i16 %240, i16* %row, align 2
  br label %1

; <label>:241                                     ; preds = %1
  ret void
}

define void @checkNodeComputeEngine22() nounwind {
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

; <label>:1                                       ; preds = %238, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %241

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %214

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %210, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %213

; <label>:65                                      ; preds = %59
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  store i16 0, i16* %I, align 2
  store float 0.000000e+00, float* %val, align 4
  store i8 0, i8* %flag, align 1
  store i8 0, i8* %exor, align 1
  store float 0.000000e+00, float* %sign, align 4
  store i16 0, i16* %I, align 2
  br label %66

; <label>:66                                      ; preds = %138, %65
  %67 = load i16* %I, align 2
  %68 = zext i16 %67 to i32
  %69 = load i16* %range, align 2
  %70 = zext i16 %69 to i32
  %71 = icmp slt i32 %68, %70
  br i1 %71, label %72, label %141

; <label>:72                                      ; preds = %66
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %73 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %74 = zext i16 %73 to i32
  %75 = add nsw i32 3, %74
  %76 = load i16* %row, align 2
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %75, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %79
  %81 = load i16* %80
  %82 = zext i16 %81 to i32
  %83 = sub nsw i32 %82, 1
  %84 = load i16* %I, align 2
  %85 = zext i16 %84 to i32
  %86 = add nsw i32 %83, %85
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %index, align 2
  %88 = load i16* %I, align 2
  %89 = zext i16 %88 to i32
  %90 = load i16* %col, align 2
  %91 = zext i16 %90 to i32
  %92 = icmp eq i32 %89, %91
  br i1 %92, label %93, label %94

; <label>:93                                      ; preds = %72
  br label %138

; <label>:94                                      ; preds = %72
  %95 = load i16* %index, align 2
  %96 = zext i16 %95 to i64
  %97 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %96
  %98 = load float* %97
  %99 = fpext float %98 to double
  %100 = fcmp oge double %99, 0.000000e+00
  br i1 %100, label %101, label %106

; <label>:101                                     ; preds = %94
  %102 = load i8* %exor, align 1
  %103 = zext i8 %102 to i32
  %104 = xor i32 %103, 0
  %105 = trunc i32 %104 to i8
  store i8 %105, i8* %exor, align 1
  br label %111

; <label>:106                                     ; preds = %94
  %107 = load i8* %exor, align 1
  %108 = zext i8 %107 to i32
  %109 = xor i32 %108, 1
  %110 = trunc i32 %109 to i8
  store i8 %110, i8* %exor, align 1
  br label %111

; <label>:111                                     ; preds = %106, %101
  %112 = load i8* %flag, align 1
  %113 = zext i8 %112 to i32
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %121

; <label>:115                                     ; preds = %111
  %116 = load i16* %index, align 2
  %117 = zext i16 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %117
  %119 = load float* %118
  %120 = call float @absf(float %119)
  store float %120, float* %val, align 4
  br label %136

; <label>:121                                     ; preds = %111
  %122 = load i16* %index, align 2
  %123 = zext i16 %122 to i64
  %124 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %123
  %125 = load float* %124
  %126 = call float @absf(float %125)
  %127 = load float* %val, align 4
  %128 = fcmp olt float %126, %127
  br i1 %128, label %129, label %135

; <label>:129                                     ; preds = %121
  %130 = load i16* %index, align 2
  %131 = zext i16 %130 to i64
  %132 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %131
  %133 = load float* %132
  %134 = call float @absf(float %133)
  store float %134, float* %val, align 4
  br label %135

; <label>:135                                     ; preds = %129, %121
  br label %136

; <label>:136                                     ; preds = %135, %115
  br label %137

; <label>:137                                     ; preds = %136
  store i8 1, i8* %flag, align 1
  br label %138

; <label>:138                                     ; preds = %137, %93
  %139 = load i16* %I, align 2
  %140 = add i16 %139, 1
  store i16 %140, i16* %I, align 2
  br label %66

; <label>:141                                     ; preds = %66
  %142 = load i8* %exor, align 1
  %143 = zext i8 %142 to i32
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %145, label %146

; <label>:145                                     ; preds = %141
  store float 1.000000e+00, float* %sign, align 4
  br label %147

; <label>:146                                     ; preds = %141
  store float -1.000000e+00, float* %sign, align 4
  br label %147

; <label>:147                                     ; preds = %146, %145
  %148 = load float* %val, align 4
  %149 = load float* %sign, align 4
  %150 = fmul float %148, %149
  %151 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %152 = zext i16 %151 to i32
  %153 = add nsw i32 3, %152
  %154 = load i16* %row, align 2
  %155 = zext i16 %154 to i32
  %156 = add nsw i32 %153, %155
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %157
  %159 = load i16* %158
  %160 = zext i16 %159 to i32
  %161 = sub nsw i32 %160, 1
  %162 = load i16* %col, align 2
  %163 = zext i16 %162 to i32
  %164 = add nsw i32 %161, %163
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %165
  store float %150, float* %166
  %167 = load i16* %col, align 2
  %168 = zext i16 %167 to i32
  %169 = icmp eq i32 %168, 0
  br i1 %169, label %170, label %209

; <label>:170                                     ; preds = %147
  %171 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 3, %172
  %174 = load i16* %row, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %177
  %179 = load i16* %178
  %180 = zext i16 %179 to i32
  %181 = sub nsw i32 %180, 1
  %182 = load i16* %col, align 2
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 %181, %183
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %185
  %187 = load float* %186
  %188 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %189 = zext i16 %188 to i32
  %190 = add nsw i32 3, %189
  %191 = load i16* %row, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %194
  %196 = load i16* %195
  %197 = zext i16 %196 to i32
  %198 = sub nsw i32 %197, 1
  %199 = load i16* %col, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %202
  %204 = load float* %203
  %205 = call float @modifyInfo(float %187, float %204)
  %206 = load i16* %row, align 2
  %207 = zext i16 %206 to i64
  %208 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %207
  store float %205, float* %208
  br label %209

; <label>:209                                     ; preds = %170, %147
  br label %210

; <label>:210                                     ; preds = %209
  %211 = load i16* %col, align 2
  %212 = add i16 %211, 1
  store i16 %212, i16* %col, align 2
  br label %59

; <label>:213                                     ; preds = %59
  br label %237

; <label>:214                                     ; preds = %54
  %215 = load i16* %range, align 2
  %216 = zext i16 %215 to i32
  %217 = icmp eq i32 %216, 1
  br i1 %217, label %218, label %236

; <label>:218                                     ; preds = %214
  %219 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %220 = zext i16 %219 to i32
  %221 = add nsw i32 3, %220
  %222 = load i16* %row, align 2
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 %221, %223
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %225
  %227 = load i16* %226
  %228 = zext i16 %227 to i32
  %229 = sub nsw i32 %228, 1
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %230
  %232 = load float* %231
  %233 = load i16* %row, align 2
  %234 = zext i16 %233 to i64
  %235 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %234
  store float %232, float* %235
  br label %236

; <label>:236                                     ; preds = %218, %214
  br label %237

; <label>:237                                     ; preds = %236, %213
  br label %238

; <label>:238                                     ; preds = %237
  %239 = load i16* %row, align 2
  %240 = add i16 %239, 1
  store i16 %240, i16* %row, align 2
  br label %1

; <label>:241                                     ; preds = %1
  ret void
}

define void @transverseCorrection11() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %184, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %187

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %160

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %114

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %110, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %113

; <label>:71                                      ; preds = %65
  %72 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 3, %73
  %75 = load i16* %row, align 2
  %76 = zext i16 %75 to i32
  %77 = add nsw i32 %74, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %78
  %80 = load i16* %79
  %81 = zext i16 %80 to i32
  %82 = sub nsw i32 %81, 1
  %83 = load i16* %col, align 2
  %84 = zext i16 %83 to i32
  %85 = add nsw i32 %82, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %86
  %88 = load float* %87
  %89 = load i16* %row, align 2
  %90 = zext i16 %89 to i64
  %91 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %90
  %92 = load float* %91
  %93 = call float @modifyInfo(float %88, float %92)
  %94 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 3, %95
  %97 = load i16* %row, align 2
  %98 = zext i16 %97 to i32
  %99 = add nsw i32 %96, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %100
  %102 = load i16* %101
  %103 = zext i16 %102 to i32
  %104 = sub nsw i32 %103, 1
  %105 = load i16* %col, align 2
  %106 = zext i16 %105 to i32
  %107 = add nsw i32 %104, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %108
  store float %93, float* %109
  br label %110

; <label>:110                                     ; preds = %71
  %111 = load i16* %col, align 2
  %112 = add i16 %111, 1
  store i16 %112, i16* %col, align 2
  br label %65

; <label>:113                                     ; preds = %65
  br label %159

; <label>:114                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %115

; <label>:115                                     ; preds = %155, %114
  %116 = load i16* %col, align 2
  %117 = zext i16 %116 to i32
  %118 = load i16* %range, align 2
  %119 = zext i16 %118 to i32
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %158

; <label>:121                                     ; preds = %115
  %122 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %123 = zext i16 %122 to i32
  %124 = add nsw i32 3, %123
  %125 = load i16* %row, align 2
  %126 = zext i16 %125 to i32
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %128
  %130 = load i16* %129
  %131 = zext i16 %130 to i32
  %132 = sub nsw i32 %131, 1
  %133 = load i16* %col, align 2
  %134 = zext i16 %133 to i32
  %135 = add nsw i32 %132, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %136
  %138 = load float* %137
  %139 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 3, %140
  %142 = load i16* %row, align 2
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 %141, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %145
  %147 = load i16* %146
  %148 = zext i16 %147 to i32
  %149 = sub nsw i32 %148, 1
  %150 = load i16* %col, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %153
  store float %138, float* %154
  br label %155

; <label>:155                                     ; preds = %121
  %156 = load i16* %col, align 2
  %157 = add i16 %156, 1
  store i16 %157, i16* %col, align 2
  br label %115

; <label>:158                                     ; preds = %115
  br label %159

; <label>:159                                     ; preds = %158, %113
  br label %183

; <label>:160                                     ; preds = %54
  %161 = load i16* %range, align 2
  %162 = zext i16 %161 to i32
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %160
  %165 = load i16* %row, align 2
  %166 = zext i16 %165 to i64
  %167 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %166
  %168 = load float* %167
  %169 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %170 = zext i16 %169 to i32
  %171 = add nsw i32 3, %170
  %172 = load i16* %row, align 2
  %173 = zext i16 %172 to i32
  %174 = add nsw i32 %171, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %175
  %177 = load i16* %176
  %178 = zext i16 %177 to i32
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %180
  store float %168, float* %181
  br label %182

; <label>:182                                     ; preds = %164, %160
  br label %183

; <label>:183                                     ; preds = %182, %159
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i16* %row, align 2
  %186 = add i16 %185, 1
  store i16 %186, i16* %row, align 2
  br label %1

; <label>:187                                     ; preds = %1
  ret void
}

define void @transverseCorrection12() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %184, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %187

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %160

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %114

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %110, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %113

; <label>:71                                      ; preds = %65
  %72 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 3, %73
  %75 = load i16* %row, align 2
  %76 = zext i16 %75 to i32
  %77 = add nsw i32 %74, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %78
  %80 = load i16* %79
  %81 = zext i16 %80 to i32
  %82 = sub nsw i32 %81, 1
  %83 = load i16* %col, align 2
  %84 = zext i16 %83 to i32
  %85 = add nsw i32 %82, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %86
  %88 = load float* %87
  %89 = load i16* %row, align 2
  %90 = zext i16 %89 to i64
  %91 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %90
  %92 = load float* %91
  %93 = call float @modifyInfo(float %88, float %92)
  %94 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 3, %95
  %97 = load i16* %row, align 2
  %98 = zext i16 %97 to i32
  %99 = add nsw i32 %96, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %100
  %102 = load i16* %101
  %103 = zext i16 %102 to i32
  %104 = sub nsw i32 %103, 1
  %105 = load i16* %col, align 2
  %106 = zext i16 %105 to i32
  %107 = add nsw i32 %104, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %108
  store float %93, float* %109
  br label %110

; <label>:110                                     ; preds = %71
  %111 = load i16* %col, align 2
  %112 = add i16 %111, 1
  store i16 %112, i16* %col, align 2
  br label %65

; <label>:113                                     ; preds = %65
  br label %159

; <label>:114                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %115

; <label>:115                                     ; preds = %155, %114
  %116 = load i16* %col, align 2
  %117 = zext i16 %116 to i32
  %118 = load i16* %range, align 2
  %119 = zext i16 %118 to i32
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %158

; <label>:121                                     ; preds = %115
  %122 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %123 = zext i16 %122 to i32
  %124 = add nsw i32 3, %123
  %125 = load i16* %row, align 2
  %126 = zext i16 %125 to i32
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %128
  %130 = load i16* %129
  %131 = zext i16 %130 to i32
  %132 = sub nsw i32 %131, 1
  %133 = load i16* %col, align 2
  %134 = zext i16 %133 to i32
  %135 = add nsw i32 %132, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %136
  %138 = load float* %137
  %139 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 3, %140
  %142 = load i16* %row, align 2
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 %141, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %145
  %147 = load i16* %146
  %148 = zext i16 %147 to i32
  %149 = sub nsw i32 %148, 1
  %150 = load i16* %col, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %153
  store float %138, float* %154
  br label %155

; <label>:155                                     ; preds = %121
  %156 = load i16* %col, align 2
  %157 = add i16 %156, 1
  store i16 %157, i16* %col, align 2
  br label %115

; <label>:158                                     ; preds = %115
  br label %159

; <label>:159                                     ; preds = %158, %113
  br label %183

; <label>:160                                     ; preds = %54
  %161 = load i16* %range, align 2
  %162 = zext i16 %161 to i32
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %160
  %165 = load i16* %row, align 2
  %166 = zext i16 %165 to i64
  %167 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %166
  %168 = load float* %167
  %169 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %170 = zext i16 %169 to i32
  %171 = add nsw i32 3, %170
  %172 = load i16* %row, align 2
  %173 = zext i16 %172 to i32
  %174 = add nsw i32 %171, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %175
  %177 = load i16* %176
  %178 = zext i16 %177 to i32
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %180
  store float %168, float* %181
  br label %182

; <label>:182                                     ; preds = %164, %160
  br label %183

; <label>:183                                     ; preds = %182, %159
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i16* %row, align 2
  %186 = add i16 %185, 1
  store i16 %186, i16* %row, align 2
  br label %1

; <label>:187                                     ; preds = %1
  ret void
}

define void @transverseCorrection22() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %184, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %187

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %160

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %114

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %110, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %113

; <label>:71                                      ; preds = %65
  %72 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 3, %73
  %75 = load i16* %row, align 2
  %76 = zext i16 %75 to i32
  %77 = add nsw i32 %74, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %78
  %80 = load i16* %79
  %81 = zext i16 %80 to i32
  %82 = sub nsw i32 %81, 1
  %83 = load i16* %col, align 2
  %84 = zext i16 %83 to i32
  %85 = add nsw i32 %82, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %86
  %88 = load float* %87
  %89 = load i16* %row, align 2
  %90 = zext i16 %89 to i64
  %91 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %90
  %92 = load float* %91
  %93 = call float @modifyInfo(float %88, float %92)
  %94 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 3, %95
  %97 = load i16* %row, align 2
  %98 = zext i16 %97 to i32
  %99 = add nsw i32 %96, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %100
  %102 = load i16* %101
  %103 = zext i16 %102 to i32
  %104 = sub nsw i32 %103, 1
  %105 = load i16* %col, align 2
  %106 = zext i16 %105 to i32
  %107 = add nsw i32 %104, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %108
  store float %93, float* %109
  br label %110

; <label>:110                                     ; preds = %71
  %111 = load i16* %col, align 2
  %112 = add i16 %111, 1
  store i16 %112, i16* %col, align 2
  br label %65

; <label>:113                                     ; preds = %65
  br label %159

; <label>:114                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %115

; <label>:115                                     ; preds = %155, %114
  %116 = load i16* %col, align 2
  %117 = zext i16 %116 to i32
  %118 = load i16* %range, align 2
  %119 = zext i16 %118 to i32
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %158

; <label>:121                                     ; preds = %115
  %122 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %123 = zext i16 %122 to i32
  %124 = add nsw i32 3, %123
  %125 = load i16* %row, align 2
  %126 = zext i16 %125 to i32
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %128
  %130 = load i16* %129
  %131 = zext i16 %130 to i32
  %132 = sub nsw i32 %131, 1
  %133 = load i16* %col, align 2
  %134 = zext i16 %133 to i32
  %135 = add nsw i32 %132, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %136
  %138 = load float* %137
  %139 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 3, %140
  %142 = load i16* %row, align 2
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 %141, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %145
  %147 = load i16* %146
  %148 = zext i16 %147 to i32
  %149 = sub nsw i32 %148, 1
  %150 = load i16* %col, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %153
  store float %138, float* %154
  br label %155

; <label>:155                                     ; preds = %121
  %156 = load i16* %col, align 2
  %157 = add i16 %156, 1
  store i16 %157, i16* %col, align 2
  br label %115

; <label>:158                                     ; preds = %115
  br label %159

; <label>:159                                     ; preds = %158, %113
  br label %183

; <label>:160                                     ; preds = %54
  %161 = load i16* %range, align 2
  %162 = zext i16 %161 to i32
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %160
  %165 = load i16* %row, align 2
  %166 = zext i16 %165 to i64
  %167 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %166
  %168 = load float* %167
  %169 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %170 = zext i16 %169 to i32
  %171 = add nsw i32 3, %170
  %172 = load i16* %row, align 2
  %173 = zext i16 %172 to i32
  %174 = add nsw i32 %171, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %175
  %177 = load i16* %176
  %178 = zext i16 %177 to i32
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %180
  store float %168, float* %181
  br label %182

; <label>:182                                     ; preds = %164, %160
  br label %183

; <label>:183                                     ; preds = %182, %159
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i16* %row, align 2
  %186 = add i16 %185, 1
  store i16 %186, i16* %row, align 2
  br label %1

; <label>:187                                     ; preds = %1
  ret void
}

define void @transverseCorrection21() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %184, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %187

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %48
  %50 = load i16* %49
  %51 = zext i16 %50 to i32
  %52 = sub nsw i32 %41, %51
  %53 = trunc i32 %52 to i16
  store i16 %53, i16* %range, align 2
  br label %54

; <label>:54                                      ; preds = %30, %14
  %55 = load i16* %range, align 2
  %56 = zext i16 %55 to i32
  %57 = icmp sgt i32 %56, 1
  br i1 %57, label %58, label %160

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %114

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %110, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %113

; <label>:71                                      ; preds = %65
  %72 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %73 = zext i16 %72 to i32
  %74 = add nsw i32 3, %73
  %75 = load i16* %row, align 2
  %76 = zext i16 %75 to i32
  %77 = add nsw i32 %74, %76
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %78
  %80 = load i16* %79
  %81 = zext i16 %80 to i32
  %82 = sub nsw i32 %81, 1
  %83 = load i16* %col, align 2
  %84 = zext i16 %83 to i32
  %85 = add nsw i32 %82, %84
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %86
  %88 = load float* %87
  %89 = load i16* %row, align 2
  %90 = zext i16 %89 to i64
  %91 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %90
  %92 = load float* %91
  %93 = call float @modifyInfo(float %88, float %92)
  %94 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %95 = zext i16 %94 to i32
  %96 = add nsw i32 3, %95
  %97 = load i16* %row, align 2
  %98 = zext i16 %97 to i32
  %99 = add nsw i32 %96, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %100
  %102 = load i16* %101
  %103 = zext i16 %102 to i32
  %104 = sub nsw i32 %103, 1
  %105 = load i16* %col, align 2
  %106 = zext i16 %105 to i32
  %107 = add nsw i32 %104, %106
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %108
  store float %93, float* %109
  br label %110

; <label>:110                                     ; preds = %71
  %111 = load i16* %col, align 2
  %112 = add i16 %111, 1
  store i16 %112, i16* %col, align 2
  br label %65

; <label>:113                                     ; preds = %65
  br label %159

; <label>:114                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %115

; <label>:115                                     ; preds = %155, %114
  %116 = load i16* %col, align 2
  %117 = zext i16 %116 to i32
  %118 = load i16* %range, align 2
  %119 = zext i16 %118 to i32
  %120 = icmp slt i32 %117, %119
  br i1 %120, label %121, label %158

; <label>:121                                     ; preds = %115
  %122 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %123 = zext i16 %122 to i32
  %124 = add nsw i32 3, %123
  %125 = load i16* %row, align 2
  %126 = zext i16 %125 to i32
  %127 = add nsw i32 %124, %126
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %128
  %130 = load i16* %129
  %131 = zext i16 %130 to i32
  %132 = sub nsw i32 %131, 1
  %133 = load i16* %col, align 2
  %134 = zext i16 %133 to i32
  %135 = add nsw i32 %132, %134
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %136
  %138 = load float* %137
  %139 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 3, %140
  %142 = load i16* %row, align 2
  %143 = zext i16 %142 to i32
  %144 = add nsw i32 %141, %143
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %145
  %147 = load i16* %146
  %148 = zext i16 %147 to i32
  %149 = sub nsw i32 %148, 1
  %150 = load i16* %col, align 2
  %151 = zext i16 %150 to i32
  %152 = add nsw i32 %149, %151
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %153
  store float %138, float* %154
  br label %155

; <label>:155                                     ; preds = %121
  %156 = load i16* %col, align 2
  %157 = add i16 %156, 1
  store i16 %157, i16* %col, align 2
  br label %115

; <label>:158                                     ; preds = %115
  br label %159

; <label>:159                                     ; preds = %158, %113
  br label %183

; <label>:160                                     ; preds = %54
  %161 = load i16* %range, align 2
  %162 = zext i16 %161 to i32
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %182

; <label>:164                                     ; preds = %160
  %165 = load i16* %row, align 2
  %166 = zext i16 %165 to i64
  %167 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %166
  %168 = load float* %167
  %169 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %170 = zext i16 %169 to i32
  %171 = add nsw i32 3, %170
  %172 = load i16* %row, align 2
  %173 = zext i16 %172 to i32
  %174 = add nsw i32 %171, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %175
  %177 = load i16* %176
  %178 = zext i16 %177 to i32
  %179 = sub nsw i32 %178, 1
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %180
  store float %168, float* %181
  br label %182

; <label>:182                                     ; preds = %164, %160
  br label %183

; <label>:183                                     ; preds = %182, %159
  br label %184

; <label>:184                                     ; preds = %183
  %185 = load i16* %row, align 2
  %186 = add i16 %185, 1
  store i16 %186, i16* %row, align 2
  br label %1

; <label>:187                                     ; preds = %1
  ret void
}

define void @update_aPosteriori11() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = add nsw i32 3, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %15
  %17 = load i16* %16
  %18 = zext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %20
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

define void @update_aPosteriori12() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = add nsw i32 3, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %15
  %17 = load i16* %16
  %18 = zext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %20
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

define void @update_aPosteriori21() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = add nsw i32 3, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %15
  %17 = load i16* %16
  %18 = zext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %20
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

define void @update_aPosteriori22() nounwind {
  %I = alloca i16, align 2
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %24, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %27

; <label>:7                                       ; preds = %1
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %9
  %11 = load float* %10
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = add nsw i32 3, %13
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %15
  %17 = load i16* %16
  %18 = zext i16 %17 to i32
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %20
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

define zeroext i8 @checkIsdecoded1() nounwind {
  %is_decoded = alloca i8, align 1
  %I = alloca i16, align 2
  store i8 1, i8* %is_decoded, align 1
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %47, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %50

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %9
  %11 = load float* %10
  %12 = fpext float %11 to double
  %13 = fcmp ogt double %12, 0.000000e+00
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %7
  %15 = load i16* %I, align 2
  %16 = zext i16 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %16
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
  %25 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %24
  store float -1.000000e+00, float* %25
  br label %46

; <label>:26                                      ; preds = %7
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %28
  %30 = load float* %29
  %31 = fpext float %30 to double
  %32 = fcmp olt double %31, 0.000000e+00
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %26
  %34 = load i16* %I, align 2
  %35 = zext i16 %34 to i64
  %36 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %35
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
  %44 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %43
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

define zeroext i8 @checkIsdecoded2() nounwind {
  %is_decoded = alloca i8, align 1
  %I = alloca i16, align 2
  store i8 1, i8* %is_decoded, align 1
  store i16 0, i16* %I, align 2
  br label %1

; <label>:1                                       ; preds = %47, %0
  %2 = load i16* %I, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %50

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %I, align 2
  %9 = zext i16 %8 to i64
  %10 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %9
  %11 = load float* %10
  %12 = fpext float %11 to double
  %13 = fcmp ogt double %12, 0.000000e+00
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %7
  %15 = load i16* %I, align 2
  %16 = zext i16 %15 to i64
  %17 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %16
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
  %25 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %24
  store float -1.000000e+00, float* %25
  br label %46

; <label>:26                                      ; preds = %7
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %28
  %30 = load float* %29
  %31 = fpext float %30 to double
  %32 = fcmp olt double %31, 0.000000e+00
  br i1 %32, label %33, label %45

; <label>:33                                      ; preds = %26
  %34 = load i16* %I, align 2
  %35 = zext i16 %34 to i64
  %36 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %35
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
  %44 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %43
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

define void @updateMessage11() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %123, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %126

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %48
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
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %62 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 3, %63
  %65 = load i16* %row, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %68
  %70 = load i16* %69
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 3, %71
  %73 = sub nsw i32 %72, 1
  %74 = load i16* %col, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %82
  %84 = load float* %83
  %85 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %86 = zext i16 %85 to i32
  %87 = add nsw i32 3, %86
  %88 = load i16* %row, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = load i16* %col, align 2
  %97 = zext i16 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %99
  %101 = load float* %100
  %102 = fsub float %84, %101
  %103 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 3, %104
  %106 = load i16* %row, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %109
  %111 = load i16* %110
  %112 = zext i16 %111 to i32
  %113 = sub nsw i32 %112, 1
  %114 = load i16* %col, align 2
  %115 = zext i16 %114 to i32
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %117
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

define void @updateMessage12() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %123, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %126

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %48
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
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %62 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 3, %63
  %65 = load i16* %row, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %68
  %70 = load i16* %69
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 3, %71
  %73 = sub nsw i32 %72, 1
  %74 = load i16* %col, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %82
  %84 = load float* %83
  %85 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %86 = zext i16 %85 to i32
  %87 = add nsw i32 3, %86
  %88 = load i16* %row, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = load i16* %col, align 2
  %97 = zext i16 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %99
  %101 = load float* %100
  %102 = fsub float %84, %101
  %103 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 3, %104
  %106 = load i16* %row, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %109
  %111 = load i16* %110
  %112 = zext i16 %111 to i32
  %113 = sub nsw i32 %112, 1
  %114 = load i16* %col, align 2
  %115 = zext i16 %114 to i32
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %117
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

define void @updateMessage21() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %123, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %126

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %48
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
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %62 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 3, %63
  %65 = load i16* %row, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %68
  %70 = load i16* %69
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 3, %71
  %73 = sub nsw i32 %72, 1
  %74 = load i16* %col, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %82
  %84 = load float* %83
  %85 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %86 = zext i16 %85 to i32
  %87 = add nsw i32 3, %86
  %88 = load i16* %row, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = load i16* %col, align 2
  %97 = zext i16 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %99
  %101 = load float* %100
  %102 = fsub float %84, %101
  %103 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 3, %104
  %106 = load i16* %row, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %109
  %111 = load i16* %110
  %112 = zext i16 %111 to i32
  %113 = sub nsw i32 %112, 1
  %114 = load i16* %col, align 2
  %115 = zext i16 %114 to i32
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %117
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

define void @updateMessage22() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %123, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %126

; <label>:7                                       ; preds = %1
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %8 = load i16* %row, align 2
  %9 = zext i16 %8 to i32
  %10 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %11 = zext i16 %10 to i32
  %12 = sub nsw i32 %11, 1
  %13 = icmp eq i32 %9, %12
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %7
  %15 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %16 = zext i16 %15 to i32
  %17 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %18 = zext i16 %17 to i32
  %19 = add nsw i32 3, %18
  %20 = load i16* %row, align 2
  %21 = zext i16 %20 to i32
  %22 = add nsw i32 %19, %21
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %23
  %25 = load i16* %24
  %26 = zext i16 %25 to i32
  %27 = sub nsw i32 %26, 1
  %28 = sub nsw i32 %16, %27
  %29 = trunc i32 %28 to i16
  store i16 %29, i16* %range, align 2
  br label %54

; <label>:30                                      ; preds = %7
  %31 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %32 = zext i16 %31 to i32
  %33 = add nsw i32 3, %32
  %34 = load i16* %row, align 2
  %35 = zext i16 %34 to i32
  %36 = add nsw i32 %33, %35
  %37 = add nsw i32 %36, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %38
  %40 = load i16* %39
  %41 = zext i16 %40 to i32
  %42 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 3, %43
  %45 = load i16* %row, align 2
  %46 = zext i16 %45 to i32
  %47 = add nsw i32 %44, %46
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %48
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
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %62 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %63 = zext i16 %62 to i32
  %64 = add nsw i32 3, %63
  %65 = load i16* %row, align 2
  %66 = zext i16 %65 to i32
  %67 = add nsw i32 %64, %66
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %68
  %70 = load i16* %69
  %71 = zext i16 %70 to i32
  %72 = add nsw i32 3, %71
  %73 = sub nsw i32 %72, 1
  %74 = load i16* %col, align 2
  %75 = zext i16 %74 to i32
  %76 = add nsw i32 %73, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %77
  %79 = load i16* %78
  %80 = zext i16 %79 to i32
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori2, i32 0, i64 %82
  %84 = load float* %83
  %85 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %86 = zext i16 %85 to i32
  %87 = add nsw i32 3, %86
  %88 = load i16* %row, align 2
  %89 = zext i16 %88 to i32
  %90 = add nsw i32 %87, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %91
  %93 = load i16* %92
  %94 = zext i16 %93 to i32
  %95 = sub nsw i32 %94, 1
  %96 = load i16* %col, align 2
  %97 = zext i16 %96 to i32
  %98 = add nsw i32 %95, %97
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %99
  %101 = load float* %100
  %102 = fsub float %84, %101
  %103 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %104 = zext i16 %103 to i32
  %105 = add nsw i32 3, %104
  %106 = load i16* %row, align 2
  %107 = zext i16 %106 to i32
  %108 = add nsw i32 %105, %107
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %109
  %111 = load i16* %110
  %112 = zext i16 %111 to i32
  %113 = sub nsw i32 %112, 1
  %114 = load i16* %col, align 2
  %115 = zext i16 %114 to i32
  %116 = add nsw i32 %113, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %117
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

define void @bpsk_demodulate() nounwind {
  %I = alloca i32, align 4
  store i32 0, i32* %I, align 4
  br label %1

; <label>:1                                       ; preds = %29, %0
  %2 = load i32* %I, align 4
  %3 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %4 = zext i16 %3 to i32
  %5 = icmp slt i32 %2, %4
  br i1 %5, label %6, label %32

; <label>:6                                       ; preds = %1
  %7 = load i32* %I, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %8
  %10 = load float* %9
  %11 = fpext float %10 to double
  %12 = fcmp olt double %11, 0.000000e+00
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %6
  %14 = load i32* %I, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %15
  store float 0.000000e+00, float* %16
  br label %17

; <label>:17                                      ; preds = %13, %6
  %18 = load i32* %I, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %19
  %21 = load float* %20
  %22 = fpext float %21 to double
  %23 = fcmp olt double %22, 0.000000e+00
  br i1 %23, label %24, label %28

; <label>:24                                      ; preds = %17
  %25 = load i32* %I, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %26
  store float 0.000000e+00, float* %27
  br label %28

; <label>:28                                      ; preds = %24, %17
  br label %29

; <label>:29                                      ; preds = %28
  %30 = load i32* %I, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %I, align 4
  br label %1

; <label>:32                                      ; preds = %1
  ret void
}

define void @top_daemon_1() nounwind {
  %nitr_1 = alloca i8, align 1
  %init_trans_info = alloca i8, align 1
  %aPosteriori_update_phase2_done = alloca i8, align 1
  %is_decoded_1 = alloca i8, align 1
  %is_decoded_from_2 = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %read_message_21_modified = alloca i8, align 1
  %K1 = alloca i16, align 2
  %K2 = alloca i16, align 2
  call void @initInputs()
  call void @readCodeBlock()
  call void @write_uint8(i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0), i8 zeroext 1)
  call void @initialize_aPriori1()
  call void @initializeMessage11()
  call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i8 zeroext 1)
  store i8 1, i8* %nitr_1, align 1
  br label %1

; <label>:1                                       ; preds = %31, %0
  %2 = load i8* %nitr_1, align 1
  %3 = zext i8 %2 to i32
  %4 = load i16* @maxNitr, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %.loopexit

; <label>:7                                       ; preds = %1
  call void @initialize_aPosteriori1()
  call void @initializeExtrinsicInfo11()
  call void @initializeTransInfo11_12()
  call void @checkNodeComputeEngine11()
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0), i8 zeroext 1)
  %8 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0))
  store i8 %8, i8* %init_trans_info, align 1
  call void @transverseCorrection11()
  call void @update_aPosteriori11()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0))
  store i8 %9, i8* %aPosteriori_update_phase2_done, align 1
  %10 = call zeroext i8 @checkIsdecoded1()
  store i8 %10, i8* %is_decoded_1, align 1
  %11 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([13 x i8]* @.str11, i32 0, i32 0))
  store i8 %11, i8* %is_decoded_from_2, align 1
  %12 = load i8* %is_decoded_1, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %19

; <label>:15                                      ; preds = %7
  %16 = load i8* %is_decoded_from_2, align 1
  %17 = zext i8 %16 to i32
  %18 = icmp ne i32 %17, 0
  br label %19

; <label>:19                                      ; preds = %15, %7
  %20 = phi i1 [ false, %7 ], [ %18, %15 ]
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %is_decoded, align 1
  %23 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str12, i32 0, i32 0), i8 zeroext %23)
  %24 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str13, i32 0, i32 0), i8 zeroext %24)
  %25 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0), i8 zeroext %25)
  %26 = load i8* %is_decoded, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %19
  br label %35

; <label>:30                                      ; preds = %19
  call void @updateMessage11()
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i8* %nitr_1, align 1
  %33 = add i8 %32, 1
  store i8 %33, i8* %nitr_1, align 1
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str15, i32 0, i32 0), i8 zeroext 1)
  %34 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str16, i32 0, i32 0))
  store i8 %34, i8* %read_message_21_modified, align 1
  br label %1

.loopexit:                                        ; preds = %1
  br label %35

; <label>:35                                      ; preds = %.loopexit, %29
  call void @bpsk_demodulate()
  store i16 0, i16* %K1, align 2
  br label %36

; <label>:36                                      ; preds = %47, %35
  %37 = load i16* %K1, align 2
  %38 = zext i16 %37 to i32
  %39 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %40 = zext i16 %39 to i32
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %36
  %43 = load i16* %K1, align 2
  %44 = zext i16 %43 to i64
  %45 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %44
  %46 = load float* %45
  call void @write_float32(i8* getelementptr inbounds ([16 x i8]* @.str17, i32 0, i32 0), float %46)
  br label %47

; <label>:47                                      ; preds = %42
  %48 = load i16* %K1, align 2
  %49 = add i16 %48, 1
  store i16 %49, i16* %K1, align 2
  br label %36

; <label>:50                                      ; preds = %36
  store i16 0, i16* %K2, align 2
  br label %51

; <label>:51                                      ; preds = %62, %50
  %52 = load i16* %K2, align 2
  %53 = zext i16 %52 to i32
  %54 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %55 = zext i16 %54 to i32
  %56 = icmp slt i32 %53, %55
  br i1 %56, label %57, label %65

; <label>:57                                      ; preds = %51
  %58 = load i16* %K2, align 2
  %59 = zext i16 %58 to i64
  %60 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %59
  %61 = load float* %60
  call void @write_float32(i8* getelementptr inbounds ([16 x i8]* @.str18, i32 0, i32 0), float %61)
  br label %62

; <label>:62                                      ; preds = %57
  %63 = load i16* %K2, align 2
  %64 = add i16 %63, 1
  store i16 %64, i16* %K2, align 2
  br label %51

; <label>:65                                      ; preds = %51
  ret void
}

declare void @write_uint8(i8*, i8 zeroext)

declare zeroext i8 @read_uint8(i8*)

declare void @write_float32(i8*, float)

define void @top_daemon_2() nounwind {
  %init_mat = alloca i8, align 1
  %nitr_2 = alloca i8, align 1
  %init_trans_info = alloca i8, align 1
  %aPosteriori_update_phase2_done = alloca i8, align 1
  %find_is_decoded_2 = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %read_message_22_modified = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([24 x i8]* @.str5, i32 0, i32 0))
  store i8 %1, i8* %init_mat, align 1
  call void @initialize_aPriori2()
  call void @initializeMessage12()
  call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str19, i32 0, i32 0), i8 zeroext 1)
  store i8 1, i8* %nitr_2, align 1
  br label %2

; <label>:2                                       ; preds = %19, %0
  %3 = load i8* %nitr_2, align 1
  %4 = zext i8 %3 to i32
  %5 = load i16* @maxNitr, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %.loopexit

; <label>:8                                       ; preds = %2
  call void @initialize_aPosteriori2()
  call void @initializeExtrinsicInfo12()
  call void @initializeTransInfo12_11()
  call void @checkNodeComputeEngine12()
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str8, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  store i8 %9, i8* %init_trans_info, align 1
  call void @transverseCorrection12()
  call void @update_aPosteriori12()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0), i8 zeroext 1)
  %10 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str21, i32 0, i32 0))
  store i8 %10, i8* %aPosteriori_update_phase2_done, align 1
  %11 = call zeroext i8 @checkIsdecoded2()
  store i8 %11, i8* %find_is_decoded_2, align 1
  %12 = load i8* %find_is_decoded_2, align 1
  call void @write_uint8(i8* getelementptr inbounds ([13 x i8]* @.str11, i32 0, i32 0), i8 zeroext %12)
  %13 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str12, i32 0, i32 0))
  store i8 %13, i8* %is_decoded, align 1
  %14 = load i8* %is_decoded, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp eq i32 %15, 1
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %8
  br label %23

; <label>:18                                      ; preds = %8
  call void @updateMessage12()
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i8* %nitr_2, align 1
  %21 = add i8 %20, 1
  store i8 %21, i8* %nitr_2, align 1
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str22, i32 0, i32 0), i8 zeroext 1)
  %22 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str23, i32 0, i32 0))
  store i8 %22, i8* %read_message_22_modified, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %23

; <label>:23                                      ; preds = %.loopexit, %17
  ret void
}

define void @daemon_3() nounwind {
  %init_aPriori1 = alloca i8, align 1
  %nitr_3 = alloca i8, align 1
  %trans_info_computed = alloca i8, align 1
  %aPosteriori_update_phase1_done = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %read_message11_modified = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0))
  store i8 %1, i8* %init_aPriori1, align 1
  call void @initializeMessage21()
  store i8 1, i8* %nitr_3, align 1
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i8* %nitr_3, align 1
  %4 = zext i8 %3 to i32
  %5 = load i16* @maxNitr, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %.loopexit

; <label>:8                                       ; preds = %2
  call void @initializeExtrinsicInfo21()
  call void @initializeTransInfo21_22()
  call void @checkNodeComputeEngine21()
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str24, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str25, i32 0, i32 0))
  store i8 %9, i8* %trans_info_computed, align 1
  call void @transverseCorrection21()
  %10 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0))
  store i8 %10, i8* %aPosteriori_update_phase1_done, align 1
  call void @update_aPosteriori21()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str10, i32 0, i32 0), i8 zeroext 1)
  %11 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str13, i32 0, i32 0))
  store i8 %11, i8* %is_decoded, align 1
  %12 = load i8* %is_decoded, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %21

; <label>:16                                      ; preds = %8
  call void @updateMessage21()
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i8* %nitr_3, align 1
  %19 = add i8 %18, 1
  store i8 %19, i8* %nitr_3, align 1
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str16, i32 0, i32 0), i8 zeroext 1)
  %20 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str15, i32 0, i32 0))
  store i8 %20, i8* %read_message11_modified, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %21

; <label>:21                                      ; preds = %.loopexit, %15
  ret void
}

define void @daemon_4() nounwind {
  %init_aPriori2 = alloca i8, align 1
  %nitr_4 = alloca i8, align 1
  %trans_info_computed = alloca i8, align 1
  %aPosteriori_update_phase1_done = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %read_message12_modified = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str19, i32 0, i32 0))
  store i8 %1, i8* %init_aPriori2, align 1
  call void @initializeMessage22()
  store i8 1, i8* %nitr_4, align 1
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i8* %nitr_4, align 1
  %4 = zext i8 %3 to i32
  %5 = load i16* @maxNitr, align 2
  %6 = zext i16 %5 to i32
  %7 = icmp slt i32 %4, %6
  br i1 %7, label %8, label %.loopexit

; <label>:8                                       ; preds = %2
  call void @initializeExtrinsicInfo22()
  call void @initializeTransInfo22_21()
  call void @checkNodeComputeEngine22()
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str25, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str24, i32 0, i32 0))
  store i8 %9, i8* %trans_info_computed, align 1
  call void @transverseCorrection22()
  %10 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0))
  store i8 %10, i8* %aPosteriori_update_phase1_done, align 1
  call void @update_aPosteriori22()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str21, i32 0, i32 0), i8 zeroext 1)
  %11 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str14, i32 0, i32 0))
  store i8 %11, i8* %is_decoded, align 1
  %12 = load i8* %is_decoded, align 1
  %13 = zext i8 %12 to i32
  %14 = icmp eq i32 %13, 1
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %21

; <label>:16                                      ; preds = %8
  call void @updateMessage22()
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i8* %nitr_4, align 1
  %19 = add i8 %18, 1
  store i8 %19, i8* %nitr_4, align 1
  call void @write_uint8(i8* getelementptr inbounds ([19 x i8]* @.str23, i32 0, i32 0), i8 zeroext 1)
  %20 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([19 x i8]* @.str22, i32 0, i32 0))
  store i8 %20, i8* %read_message12_modified, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %21

; <label>:21                                      ; preds = %.loopexit, %15
  ret void
}
