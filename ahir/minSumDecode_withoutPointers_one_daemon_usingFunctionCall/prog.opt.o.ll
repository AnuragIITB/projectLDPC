; ModuleID = 'prog.opt.o'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private constant [11 x i8] c"maxNitr_in\00"
@maxNitr = common global i16 0, align 2
@.str1 = private constant [10 x i8] c"ebbyNo_in\00"
@ebbyNo = common global float 0.000000e+00, align 4
@.str2 = private constant [10 x i8] c"matrix_in\00"
@mem11 = common global [20000 x i16] zeroinitializer, align 16
@stderr = external global %struct._IO_FILE*
@.str3 = private constant [14 x i8] c"mem11[%d]=%d\0A\00"
@mem12 = common global [20000 x i16] zeroinitializer, align 16
@.str4 = private constant [14 x i8] c"mem12[%d]=%d\0A\00"
@mem21 = common global [20000 x i16] zeroinitializer, align 16
@.str5 = private constant [14 x i8] c"mem21[%d]=%d\0A\00"
@mem22 = common global [20000 x i16] zeroinitializer, align 16
@.str6 = private constant [14 x i8] c"mem22[%d]=%d\0A\00"
@.str7 = private constant [14 x i8] c"code_block_in\00"
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
@.str8 = private constant [22 x i8] c"ext_info11[%d] = %f \0A\00"
@.str9 = private constant [34 x i8] c"trasnverse_info11_12( %d ) = %f \0A\00"
@.str10 = private constant [22 x i8] c"ext_info12[%d] = %f \0A\00"
@.str11 = private constant [34 x i8] c"trasnverse_info12_11( %d ) = %f \0A\00"
@.str12 = private constant [22 x i8] c"ext_info21[%d] = %f \0A\00"
@.str13 = private constant [34 x i8] c"trasnverse_info21_22( %d ) = %f \0A\00"
@.str14 = private constant [22 x i8] c"ext_info22[%d] = %f \0A\00"
@.str15 = private constant [34 x i8] c"trasnverse_info22_21( %d ) = %f \0A\00"
@.str16 = private constant [24 x i8] c"reading_code_block_done\00"
@.str17 = private constant [22 x i8] c"message11_initialized\00"
@.str18 = private constant [32 x i8] c"trans_info11_12_calulation_done\00"
@.str19 = private constant [32 x i8] c"trans_info12_11_calulation_done\00"
@.str20 = private constant [26 x i8] c"aPosteriori1_phase_1_done\00"
@.str21 = private constant [49 x i8] c"Now! write aPosteriori1_phase_1_done - daemon1 \0A\00"
@.str22 = private constant [26 x i8] c"aPosteriori1_phase_2_done\00"
@.str23 = private constant [13 x i8] c"is_decoded_2\00"
@.str24 = private constant [14 x i8] c"is_decoded_d2\00"
@.str25 = private constant [14 x i8] c"is_decoded_d3\00"
@.str26 = private constant [14 x i8] c"is_decoded_d4\00"
@.str27 = private constant [17 x i8] c"stop_the daemon1\00"
@.str28 = private constant [22 x i8] c"message12_initialized\00"
@.str29 = private constant [50 x i8] c"Now! write aPosteriori2_phase_1_done -daemon 2 \0A \00"
@.str30 = private constant [26 x i8] c"aPosteriori2_phase_1_done\00"
@.str31 = private constant [26 x i8] c"aPosteriori2_phase_2_done\00"
@.str32 = private constant [17 x i8] c"stop_the daemon2\00"
@.str33 = private constant [32 x i8] c"trans_info21_22_calulation_done\00"
@.str34 = private constant [32 x i8] c"trans_info22_21_calulation_done\00"
@.str35 = private constant [52 x i8] c"Buddy! I am wait for - aPosteriori1_phase_1_done \0A \00"
@.str36 = private constant [33 x i8] c"aPosteriori1_phase_1_done = %d \0A\00"
@.str37 = private constant [17 x i8] c"stop_the daemon3\00"
@.str38 = private constant [51 x i8] c"Buddy! I am wait for - aPosteriori2_phase_1_done \0A\00"
@.str39 = private constant [17 x i8] c"stop_the daemon4\00"

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
  %28 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
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

; <label>:39                                      ; preds = %56, %38
  %40 = load i16* %I, align 2
  %41 = zext i16 %40 to i32
  %42 = load i16* %range, align 2
  %43 = zext i16 %42 to i32
  %44 = add nsw i32 %43, 3
  %45 = icmp slt i32 %41, %44
  br i1 %45, label %46, label %59

; <label>:46                                      ; preds = %39
  %47 = load %struct._IO_FILE** @stderr, align 8
  %48 = load i16* %I, align 2
  %49 = zext i16 %48 to i32
  %50 = load i16* %I, align 2
  %51 = zext i16 %50 to i64
  %52 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %51
  %53 = load i16* %52
  %54 = zext i16 %53 to i32
  %55 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %47, i8* getelementptr inbounds ([14 x i8]* @.str3, i32 0, i32 0), i32 %49, i32 %54)
  br label %56

; <label>:56                                      ; preds = %46
  %57 = load i16* %I, align 2
  %58 = add i16 %57, 1
  store i16 %58, i16* %I, align 2
  br label %39

; <label>:59                                      ; preds = %39
  store i16 0, i16* %I, align 2
  br label %60

; <label>:60                                      ; preds = %70, %59
  %61 = load i16* %I, align 2
  %62 = zext i16 %61 to i32
  %63 = icmp slt i32 %62, 3
  br i1 %63, label %64, label %73

; <label>:64                                      ; preds = %60
  %65 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %65, i16* %val, align 2
  %66 = load i16* %val, align 2
  %67 = load i16* %I, align 2
  %68 = zext i16 %67 to i64
  %69 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %68
  store i16 %66, i16* %69
  br label %70

; <label>:70                                      ; preds = %64
  %71 = load i16* %I, align 2
  %72 = add i16 %71, 1
  store i16 %72, i16* %I, align 2
  br label %60

; <label>:73                                      ; preds = %60
  %74 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %75 = zext i16 %74 to i32
  %76 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 0)
  %77 = zext i16 %76 to i32
  %78 = add nsw i32 %75, %77
  %79 = trunc i32 %78 to i16
  store i16 %79, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %80

; <label>:80                                      ; preds = %94, %73
  %81 = load i16* %I, align 2
  %82 = zext i16 %81 to i32
  %83 = load i16* %range, align 2
  %84 = zext i16 %83 to i32
  %85 = icmp slt i32 %82, %84
  br i1 %85, label %86, label %97

; <label>:86                                      ; preds = %80
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %87 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %87, i16* %val, align 2
  %88 = load i16* %val, align 2
  %89 = load i16* %I, align 2
  %90 = zext i16 %89 to i32
  %91 = add nsw i32 %90, 3
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %92
  store i16 %88, i16* %93
  br label %94

; <label>:94                                      ; preds = %86
  %95 = load i16* %I, align 2
  %96 = add i16 %95, 1
  store i16 %96, i16* %I, align 2
  br label %80

; <label>:97                                      ; preds = %80
  store i16 0, i16* %I, align 2
  br label %98

; <label>:98                                      ; preds = %115, %97
  %99 = load i16* %I, align 2
  %100 = zext i16 %99 to i32
  %101 = load i16* %range, align 2
  %102 = zext i16 %101 to i32
  %103 = add nsw i32 %102, 3
  %104 = icmp slt i32 %100, %103
  br i1 %104, label %105, label %118

; <label>:105                                     ; preds = %98
  %106 = load %struct._IO_FILE** @stderr, align 8
  %107 = load i16* %I, align 2
  %108 = zext i16 %107 to i32
  %109 = load i16* %I, align 2
  %110 = zext i16 %109 to i64
  %111 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %110
  %112 = load i16* %111
  %113 = zext i16 %112 to i32
  %114 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %106, i8* getelementptr inbounds ([14 x i8]* @.str4, i32 0, i32 0), i32 %108, i32 %113)
  br label %115

; <label>:115                                     ; preds = %105
  %116 = load i16* %I, align 2
  %117 = add i16 %116, 1
  store i16 %117, i16* %I, align 2
  br label %98

; <label>:118                                     ; preds = %98
  store i16 0, i16* %I, align 2
  br label %119

; <label>:119                                     ; preds = %129, %118
  %120 = load i16* %I, align 2
  %121 = zext i16 %120 to i32
  %122 = icmp slt i32 %121, 3
  br i1 %122, label %123, label %132

; <label>:123                                     ; preds = %119
  %124 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %124, i16* %val, align 2
  %125 = load i16* %val, align 2
  %126 = load i16* %I, align 2
  %127 = zext i16 %126 to i64
  %128 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %127
  store i16 %125, i16* %128
  br label %129

; <label>:129                                     ; preds = %123
  %130 = load i16* %I, align 2
  %131 = add i16 %130, 1
  store i16 %131, i16* %I, align 2
  br label %119

; <label>:132                                     ; preds = %119
  %133 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %134 = zext i16 %133 to i32
  %135 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 0)
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 %134, %136
  %138 = trunc i32 %137 to i16
  store i16 %138, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %139

; <label>:139                                     ; preds = %153, %132
  %140 = load i16* %I, align 2
  %141 = zext i16 %140 to i32
  %142 = load i16* %range, align 2
  %143 = zext i16 %142 to i32
  %144 = icmp slt i32 %141, %143
  br i1 %144, label %145, label %156

; <label>:145                                     ; preds = %139
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %146 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %146, i16* %val, align 2
  %147 = load i16* %val, align 2
  %148 = load i16* %I, align 2
  %149 = zext i16 %148 to i32
  %150 = add nsw i32 %149, 3
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %151
  store i16 %147, i16* %152
  br label %153

; <label>:153                                     ; preds = %145
  %154 = load i16* %I, align 2
  %155 = add i16 %154, 1
  store i16 %155, i16* %I, align 2
  br label %139

; <label>:156                                     ; preds = %139
  store i16 0, i16* %I, align 2
  br label %157

; <label>:157                                     ; preds = %174, %156
  %158 = load i16* %I, align 2
  %159 = zext i16 %158 to i32
  %160 = load i16* %range, align 2
  %161 = zext i16 %160 to i32
  %162 = add nsw i32 %161, 3
  %163 = icmp slt i32 %159, %162
  br i1 %163, label %164, label %177

; <label>:164                                     ; preds = %157
  %165 = load %struct._IO_FILE** @stderr, align 8
  %166 = load i16* %I, align 2
  %167 = zext i16 %166 to i32
  %168 = load i16* %I, align 2
  %169 = zext i16 %168 to i64
  %170 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %169
  %171 = load i16* %170
  %172 = zext i16 %171 to i32
  %173 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %165, i8* getelementptr inbounds ([14 x i8]* @.str5, i32 0, i32 0), i32 %167, i32 %172)
  br label %174

; <label>:174                                     ; preds = %164
  %175 = load i16* %I, align 2
  %176 = add i16 %175, 1
  store i16 %176, i16* %I, align 2
  br label %157

; <label>:177                                     ; preds = %157
  store i16 0, i16* %I, align 2
  br label %178

; <label>:178                                     ; preds = %188, %177
  %179 = load i16* %I, align 2
  %180 = zext i16 %179 to i32
  %181 = icmp slt i32 %180, 3
  br i1 %181, label %182, label %191

; <label>:182                                     ; preds = %178
  %183 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %183, i16* %val, align 2
  %184 = load i16* %val, align 2
  %185 = load i16* %I, align 2
  %186 = zext i16 %185 to i64
  %187 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %186
  store i16 %184, i16* %187
  br label %188

; <label>:188                                     ; preds = %182
  %189 = load i16* %I, align 2
  %190 = add i16 %189, 1
  store i16 %190, i16* %I, align 2
  br label %178

; <label>:191                                     ; preds = %178
  %192 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %193 = zext i16 %192 to i32
  %194 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 0)
  %195 = zext i16 %194 to i32
  %196 = add nsw i32 %193, %195
  %197 = trunc i32 %196 to i16
  store i16 %197, i16* %range, align 2
  store i16 0, i16* %I, align 2
  br label %198

; <label>:198                                     ; preds = %212, %191
  %199 = load i16* %I, align 2
  %200 = zext i16 %199 to i32
  %201 = load i16* %range, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp slt i32 %200, %202
  br i1 %203, label %204, label %215

; <label>:204                                     ; preds = %198
  call void @__loop_pipelining_on__(i32 63, i32 2, i32 0)
  %205 = call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  store i16 %205, i16* %val, align 2
  %206 = load i16* %val, align 2
  %207 = load i16* %I, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %208, 3
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %210
  store i16 %206, i16* %211
  br label %212

; <label>:212                                     ; preds = %204
  %213 = load i16* %I, align 2
  %214 = add i16 %213, 1
  store i16 %214, i16* %I, align 2
  br label %198

; <label>:215                                     ; preds = %198
  store i16 0, i16* %I, align 2
  br label %216

; <label>:216                                     ; preds = %233, %215
  %217 = load i16* %I, align 2
  %218 = zext i16 %217 to i32
  %219 = load i16* %range, align 2
  %220 = zext i16 %219 to i32
  %221 = add nsw i32 %220, 3
  %222 = icmp slt i32 %218, %221
  br i1 %222, label %223, label %236

; <label>:223                                     ; preds = %216
  %224 = load %struct._IO_FILE** @stderr, align 8
  %225 = load i16* %I, align 2
  %226 = zext i16 %225 to i32
  %227 = load i16* %I, align 2
  %228 = zext i16 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %224, i8* getelementptr inbounds ([14 x i8]* @.str6, i32 0, i32 0), i32 %226, i32 %231)
  br label %233

; <label>:233                                     ; preds = %223
  %234 = load i16* %I, align 2
  %235 = add i16 %234, 1
  store i16 %235, i16* %I, align 2
  br label %216

; <label>:236                                     ; preds = %216
  ret void
}

declare void @__loop_pipelining_on__(i32, i32, i32)

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...)

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
  %8 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0))
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
  %24 = call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str7, i32 0, i32 0))
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
  %rate = alloca float, align 4
  %1 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %2 = zext i16 %1 to i32
  %3 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %4 = zext i16 %3 to i32
  %5 = sub nsw i32 %2, %4
  %6 = sitofp i32 %5 to float
  %7 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %8 = zext i16 %7 to i32
  %9 = sitofp i32 %8 to float
  %10 = fdiv float %6, %9
  store float %10, float* %rate, align 4
  store i16 0, i16* %I, align 2
  br label %11

; <label>:11                                      ; preds = %30, %0
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %15 = zext i16 %14 to i32
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %11
  %18 = load i16* %I, align 2
  %19 = zext i16 %18 to i64
  %20 = getelementptr inbounds [13000 x float]* @code_block1, i32 0, i64 %19
  %21 = load float* %20
  %22 = fmul float -4.000000e+00, %21
  %23 = load float* %rate, align 4
  %24 = load float* @ebbyNo, align 4
  %25 = fmul float %23, %24
  %26 = fmul float %22, %25
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPriori1, i32 0, i64 %28
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

define void @initialize_aPriori2() nounwind {
  %I = alloca i16, align 2
  %rate = alloca float, align 4
  %1 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %2 = zext i16 %1 to i32
  %3 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %4 = zext i16 %3 to i32
  %5 = sub nsw i32 %2, %4
  %6 = sitofp i32 %5 to float
  %7 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %8 = zext i16 %7 to i32
  %9 = sitofp i32 %8 to float
  %10 = fdiv float %6, %9
  store float %10, float* %rate, align 4
  store i16 0, i16* %I, align 2
  br label %11

; <label>:11                                      ; preds = %30, %0
  %12 = load i16* %I, align 2
  %13 = zext i16 %12 to i32
  %14 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 1)
  %15 = zext i16 %14 to i32
  %16 = icmp slt i32 %13, %15
  br i1 %16, label %17, label %33

; <label>:17                                      ; preds = %11
  %18 = load i16* %I, align 2
  %19 = zext i16 %18 to i64
  %20 = getelementptr inbounds [13000 x float]* @code_block2, i32 0, i64 %19
  %21 = load float* %20
  %22 = fmul float -4.000000e+00, %21
  %23 = load float* %rate, align 4
  %24 = load float* @ebbyNo, align 4
  %25 = fmul float %23, %24
  %26 = fmul float %22, %25
  %27 = load i16* %I, align 2
  %28 = zext i16 %27 to i64
  %29 = getelementptr inbounds [13000 x float]* @aPriori2, i32 0, i64 %28
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
  %19 = fpext float %18 to double
  %20 = call double @fabs(double %19) nounwind readnone
  %21 = load float* %1, align 4
  %22 = fpext float %21 to double
  %23 = call double @fabs(double %22) nounwind readnone
  %24 = fcmp ogt double %20, %23
  br i1 %24, label %25, label %30

; <label>:25                                      ; preds = %17
  %26 = load float* %1, align 4
  %27 = fpext float %26 to double
  %28 = call double @fabs(double %27) nounwind readnone
  %29 = fptrunc double %28 to float
  store float %29, float* %magnitude, align 4
  br label %35

; <label>:30                                      ; preds = %17
  %31 = load float* %2, align 4
  %32 = fpext float %31 to double
  %33 = call double @fabs(double %32) nounwind readnone
  %34 = fptrunc double %33 to float
  store float %34, float* %magnitude, align 4
  br label %35

; <label>:35                                      ; preds = %30, %25
  %36 = load float* %sign, align 4
  %37 = load float* %magnitude, align 4
  %38 = fmul float %36, %37
  ret float %38
}

declare double @fabs(double) nounwind readnone

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

; <label>:1                                       ; preds = %290, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %293

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
  br i1 %57, label %58, label %257

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %253, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %256

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
  %167 = load %struct._IO_FILE** @stderr, align 8
  %168 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %169 = zext i16 %168 to i32
  %170 = add nsw i32 3, %169
  %171 = load i16* %row, align 2
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 %170, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %174
  %176 = load i16* %175
  %177 = zext i16 %176 to i32
  %178 = sub nsw i32 %177, 1
  %179 = load i16* %col, align 2
  %180 = zext i16 %179 to i32
  %181 = add nsw i32 %178, %180
  %182 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 3, %183
  %185 = load i16* %row, align 2
  %186 = zext i16 %185 to i32
  %187 = add nsw i32 %184, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %188
  %190 = load i16* %189
  %191 = zext i16 %190 to i32
  %192 = sub nsw i32 %191, 1
  %193 = load i16* %col, align 2
  %194 = zext i16 %193 to i32
  %195 = add nsw i32 %192, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %196
  %198 = load float* %197
  %199 = fpext float %198 to double
  %200 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %181, double %199)
  %201 = load i16* %col, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %252

; <label>:204                                     ; preds = %147
  %205 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %206 = zext i16 %205 to i32
  %207 = add nsw i32 3, %206
  %208 = load i16* %row, align 2
  %209 = zext i16 %208 to i32
  %210 = add nsw i32 %207, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %211
  %213 = load i16* %212
  %214 = zext i16 %213 to i32
  %215 = sub nsw i32 %214, 1
  %216 = load i16* %col, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %219
  %221 = load float* %220
  %222 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 3, %223
  %225 = load i16* %row, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = load i16* %col, align 2
  %234 = zext i16 %233 to i32
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %236
  %238 = load float* %237
  %239 = call float @modifyInfo(float %221, float %238)
  %240 = load i16* %row, align 2
  %241 = zext i16 %240 to i64
  %242 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %241
  store float %239, float* %242
  %243 = load %struct._IO_FILE** @stderr, align 8
  %244 = load i16* %row, align 2
  %245 = zext i16 %244 to i32
  %246 = load i16* %row, align 2
  %247 = zext i16 %246 to i64
  %248 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %247
  %249 = load float* %248
  %250 = fpext float %249 to double
  %251 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %243, i8* getelementptr inbounds ([34 x i8]* @.str9, i32 0, i32 0), i32 %245, double %250)
  br label %252

; <label>:252                                     ; preds = %204, %147
  br label %253

; <label>:253                                     ; preds = %252
  %254 = load i16* %col, align 2
  %255 = add i16 %254, 1
  store i16 %255, i16* %col, align 2
  br label %59

; <label>:256                                     ; preds = %59
  br label %289

; <label>:257                                     ; preds = %54
  %258 = load i16* %range, align 2
  %259 = zext i16 %258 to i32
  %260 = icmp eq i32 %259, 1
  br i1 %260, label %261, label %288

; <label>:261                                     ; preds = %257
  %262 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 3, %263
  %265 = load i16* %row, align 2
  %266 = zext i16 %265 to i32
  %267 = add nsw i32 %264, %266
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %268
  %270 = load i16* %269
  %271 = zext i16 %270 to i32
  %272 = sub nsw i32 %271, 1
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x float]* @message11, i32 0, i64 %273
  %275 = load float* %274
  %276 = load i16* %row, align 2
  %277 = zext i16 %276 to i64
  %278 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %277
  store float %275, float* %278
  %279 = load %struct._IO_FILE** @stderr, align 8
  %280 = load i16* %row, align 2
  %281 = zext i16 %280 to i32
  %282 = load i16* %row, align 2
  %283 = zext i16 %282 to i64
  %284 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %283
  %285 = load float* %284
  %286 = fpext float %285 to double
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([34 x i8]* @.str9, i32 0, i32 0), i32 %281, double %286)
  br label %288

; <label>:288                                     ; preds = %261, %257
  br label %289

; <label>:289                                     ; preds = %288, %256
  br label %290

; <label>:290                                     ; preds = %289
  %291 = load i16* %row, align 2
  %292 = add i16 %291, 1
  store i16 %292, i16* %row, align 2
  br label %1

; <label>:293                                     ; preds = %1
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

; <label>:1                                       ; preds = %290, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %293

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
  br i1 %57, label %58, label %257

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %253, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %256

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
  %167 = load %struct._IO_FILE** @stderr, align 8
  %168 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %169 = zext i16 %168 to i32
  %170 = add nsw i32 3, %169
  %171 = load i16* %row, align 2
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 %170, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %174
  %176 = load i16* %175
  %177 = zext i16 %176 to i32
  %178 = sub nsw i32 %177, 1
  %179 = load i16* %col, align 2
  %180 = zext i16 %179 to i32
  %181 = add nsw i32 %178, %180
  %182 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 3, %183
  %185 = load i16* %row, align 2
  %186 = zext i16 %185 to i32
  %187 = add nsw i32 %184, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %188
  %190 = load i16* %189
  %191 = zext i16 %190 to i32
  %192 = sub nsw i32 %191, 1
  %193 = load i16* %col, align 2
  %194 = zext i16 %193 to i32
  %195 = add nsw i32 %192, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %196
  %198 = load float* %197
  %199 = fpext float %198 to double
  %200 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([22 x i8]* @.str10, i32 0, i32 0), i32 %181, double %199)
  %201 = load i16* %col, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %252

; <label>:204                                     ; preds = %147
  %205 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %206 = zext i16 %205 to i32
  %207 = add nsw i32 3, %206
  %208 = load i16* %row, align 2
  %209 = zext i16 %208 to i32
  %210 = add nsw i32 %207, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %211
  %213 = load i16* %212
  %214 = zext i16 %213 to i32
  %215 = sub nsw i32 %214, 1
  %216 = load i16* %col, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %219
  %221 = load float* %220
  %222 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 3, %223
  %225 = load i16* %row, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = load i16* %col, align 2
  %234 = zext i16 %233 to i32
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %236
  %238 = load float* %237
  %239 = call float @modifyInfo(float %221, float %238)
  %240 = load i16* %row, align 2
  %241 = zext i16 %240 to i64
  %242 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %241
  store float %239, float* %242
  %243 = load %struct._IO_FILE** @stderr, align 8
  %244 = load i16* %row, align 2
  %245 = zext i16 %244 to i32
  %246 = load i16* %row, align 2
  %247 = zext i16 %246 to i64
  %248 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %247
  %249 = load float* %248
  %250 = fpext float %249 to double
  %251 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %243, i8* getelementptr inbounds ([34 x i8]* @.str11, i32 0, i32 0), i32 %245, double %250)
  br label %252

; <label>:252                                     ; preds = %204, %147
  br label %253

; <label>:253                                     ; preds = %252
  %254 = load i16* %col, align 2
  %255 = add i16 %254, 1
  store i16 %255, i16* %col, align 2
  br label %59

; <label>:256                                     ; preds = %59
  br label %289

; <label>:257                                     ; preds = %54
  %258 = load i16* %range, align 2
  %259 = zext i16 %258 to i32
  %260 = icmp eq i32 %259, 1
  br i1 %260, label %261, label %288

; <label>:261                                     ; preds = %257
  %262 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 3, %263
  %265 = load i16* %row, align 2
  %266 = zext i16 %265 to i32
  %267 = add nsw i32 %264, %266
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %268
  %270 = load i16* %269
  %271 = zext i16 %270 to i32
  %272 = sub nsw i32 %271, 1
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x float]* @message12, i32 0, i64 %273
  %275 = load float* %274
  %276 = load i16* %row, align 2
  %277 = zext i16 %276 to i64
  %278 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %277
  store float %275, float* %278
  %279 = load %struct._IO_FILE** @stderr, align 8
  %280 = load i16* %row, align 2
  %281 = zext i16 %280 to i32
  %282 = load i16* %row, align 2
  %283 = zext i16 %282 to i64
  %284 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %283
  %285 = load float* %284
  %286 = fpext float %285 to double
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([34 x i8]* @.str11, i32 0, i32 0), i32 %281, double %286)
  br label %288

; <label>:288                                     ; preds = %261, %257
  br label %289

; <label>:289                                     ; preds = %288, %256
  br label %290

; <label>:290                                     ; preds = %289
  %291 = load i16* %row, align 2
  %292 = add i16 %291, 1
  store i16 %292, i16* %row, align 2
  br label %1

; <label>:293                                     ; preds = %1
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

; <label>:1                                       ; preds = %290, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %293

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
  br i1 %57, label %58, label %257

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %253, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %256

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
  %167 = load %struct._IO_FILE** @stderr, align 8
  %168 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %169 = zext i16 %168 to i32
  %170 = add nsw i32 3, %169
  %171 = load i16* %row, align 2
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 %170, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %174
  %176 = load i16* %175
  %177 = zext i16 %176 to i32
  %178 = sub nsw i32 %177, 1
  %179 = load i16* %col, align 2
  %180 = zext i16 %179 to i32
  %181 = add nsw i32 %178, %180
  %182 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 3, %183
  %185 = load i16* %row, align 2
  %186 = zext i16 %185 to i32
  %187 = add nsw i32 %184, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %188
  %190 = load i16* %189
  %191 = zext i16 %190 to i32
  %192 = sub nsw i32 %191, 1
  %193 = load i16* %col, align 2
  %194 = zext i16 %193 to i32
  %195 = add nsw i32 %192, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %196
  %198 = load float* %197
  %199 = fpext float %198 to double
  %200 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([22 x i8]* @.str12, i32 0, i32 0), i32 %181, double %199)
  %201 = load i16* %col, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %252

; <label>:204                                     ; preds = %147
  %205 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %206 = zext i16 %205 to i32
  %207 = add nsw i32 3, %206
  %208 = load i16* %row, align 2
  %209 = zext i16 %208 to i32
  %210 = add nsw i32 %207, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %211
  %213 = load i16* %212
  %214 = zext i16 %213 to i32
  %215 = sub nsw i32 %214, 1
  %216 = load i16* %col, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %219
  %221 = load float* %220
  %222 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 3, %223
  %225 = load i16* %row, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = load i16* %col, align 2
  %234 = zext i16 %233 to i32
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %236
  %238 = load float* %237
  %239 = call float @modifyInfo(float %221, float %238)
  %240 = load i16* %row, align 2
  %241 = zext i16 %240 to i64
  %242 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %241
  store float %239, float* %242
  %243 = load %struct._IO_FILE** @stderr, align 8
  %244 = load i16* %row, align 2
  %245 = zext i16 %244 to i32
  %246 = load i16* %row, align 2
  %247 = zext i16 %246 to i64
  %248 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %247
  %249 = load float* %248
  %250 = fpext float %249 to double
  %251 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %243, i8* getelementptr inbounds ([34 x i8]* @.str13, i32 0, i32 0), i32 %245, double %250)
  br label %252

; <label>:252                                     ; preds = %204, %147
  br label %253

; <label>:253                                     ; preds = %252
  %254 = load i16* %col, align 2
  %255 = add i16 %254, 1
  store i16 %255, i16* %col, align 2
  br label %59

; <label>:256                                     ; preds = %59
  br label %289

; <label>:257                                     ; preds = %54
  %258 = load i16* %range, align 2
  %259 = zext i16 %258 to i32
  %260 = icmp eq i32 %259, 1
  br i1 %260, label %261, label %288

; <label>:261                                     ; preds = %257
  %262 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 3, %263
  %265 = load i16* %row, align 2
  %266 = zext i16 %265 to i32
  %267 = add nsw i32 %264, %266
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %268
  %270 = load i16* %269
  %271 = zext i16 %270 to i32
  %272 = sub nsw i32 %271, 1
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x float]* @message21, i32 0, i64 %273
  %275 = load float* %274
  %276 = load i16* %row, align 2
  %277 = zext i16 %276 to i64
  %278 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %277
  store float %275, float* %278
  %279 = load %struct._IO_FILE** @stderr, align 8
  %280 = load i16* %row, align 2
  %281 = zext i16 %280 to i32
  %282 = load i16* %row, align 2
  %283 = zext i16 %282 to i64
  %284 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %283
  %285 = load float* %284
  %286 = fpext float %285 to double
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([34 x i8]* @.str13, i32 0, i32 0), i32 %281, double %286)
  br label %288

; <label>:288                                     ; preds = %261, %257
  br label %289

; <label>:289                                     ; preds = %288, %256
  br label %290

; <label>:290                                     ; preds = %289
  %291 = load i16* %row, align 2
  %292 = add i16 %291, 1
  store i16 %292, i16* %row, align 2
  br label %1

; <label>:293                                     ; preds = %1
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

; <label>:1                                       ; preds = %290, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %293

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
  br i1 %57, label %58, label %257

; <label>:58                                      ; preds = %54
  store i16 0, i16* %col, align 2
  br label %59

; <label>:59                                      ; preds = %253, %58
  %60 = load i16* %col, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16* %range, align 2
  %63 = zext i16 %62 to i32
  %64 = icmp slt i32 %61, %63
  br i1 %64, label %65, label %256

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
  %167 = load %struct._IO_FILE** @stderr, align 8
  %168 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %169 = zext i16 %168 to i32
  %170 = add nsw i32 3, %169
  %171 = load i16* %row, align 2
  %172 = zext i16 %171 to i32
  %173 = add nsw i32 %170, %172
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %174
  %176 = load i16* %175
  %177 = zext i16 %176 to i32
  %178 = sub nsw i32 %177, 1
  %179 = load i16* %col, align 2
  %180 = zext i16 %179 to i32
  %181 = add nsw i32 %178, %180
  %182 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %183 = zext i16 %182 to i32
  %184 = add nsw i32 3, %183
  %185 = load i16* %row, align 2
  %186 = zext i16 %185 to i32
  %187 = add nsw i32 %184, %186
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %188
  %190 = load i16* %189
  %191 = zext i16 %190 to i32
  %192 = sub nsw i32 %191, 1
  %193 = load i16* %col, align 2
  %194 = zext i16 %193 to i32
  %195 = add nsw i32 %192, %194
  %196 = sext i32 %195 to i64
  %197 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %196
  %198 = load float* %197
  %199 = fpext float %198 to double
  %200 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %167, i8* getelementptr inbounds ([22 x i8]* @.str14, i32 0, i32 0), i32 %181, double %199)
  %201 = load i16* %col, align 2
  %202 = zext i16 %201 to i32
  %203 = icmp eq i32 %202, 0
  br i1 %203, label %204, label %252

; <label>:204                                     ; preds = %147
  %205 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %206 = zext i16 %205 to i32
  %207 = add nsw i32 3, %206
  %208 = load i16* %row, align 2
  %209 = zext i16 %208 to i32
  %210 = add nsw i32 %207, %209
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %211
  %213 = load i16* %212
  %214 = zext i16 %213 to i32
  %215 = sub nsw i32 %214, 1
  %216 = load i16* %col, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %219
  %221 = load float* %220
  %222 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %223 = zext i16 %222 to i32
  %224 = add nsw i32 3, %223
  %225 = load i16* %row, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = load i16* %col, align 2
  %234 = zext i16 %233 to i32
  %235 = add nsw i32 %232, %234
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %236
  %238 = load float* %237
  %239 = call float @modifyInfo(float %221, float %238)
  %240 = load i16* %row, align 2
  %241 = zext i16 %240 to i64
  %242 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %241
  store float %239, float* %242
  %243 = load %struct._IO_FILE** @stderr, align 8
  %244 = load i16* %row, align 2
  %245 = zext i16 %244 to i32
  %246 = load i16* %row, align 2
  %247 = zext i16 %246 to i64
  %248 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %247
  %249 = load float* %248
  %250 = fpext float %249 to double
  %251 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %243, i8* getelementptr inbounds ([34 x i8]* @.str15, i32 0, i32 0), i32 %245, double %250)
  br label %252

; <label>:252                                     ; preds = %204, %147
  br label %253

; <label>:253                                     ; preds = %252
  %254 = load i16* %col, align 2
  %255 = add i16 %254, 1
  store i16 %255, i16* %col, align 2
  br label %59

; <label>:256                                     ; preds = %59
  br label %289

; <label>:257                                     ; preds = %54
  %258 = load i16* %range, align 2
  %259 = zext i16 %258 to i32
  %260 = icmp eq i32 %259, 1
  br i1 %260, label %261, label %288

; <label>:261                                     ; preds = %257
  %262 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 3, %263
  %265 = load i16* %row, align 2
  %266 = zext i16 %265 to i32
  %267 = add nsw i32 %264, %266
  %268 = sext i32 %267 to i64
  %269 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %268
  %270 = load i16* %269
  %271 = zext i16 %270 to i32
  %272 = sub nsw i32 %271, 1
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x float]* @message22, i32 0, i64 %273
  %275 = load float* %274
  %276 = load i16* %row, align 2
  %277 = zext i16 %276 to i64
  %278 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %277
  store float %275, float* %278
  %279 = load %struct._IO_FILE** @stderr, align 8
  %280 = load i16* %row, align 2
  %281 = zext i16 %280 to i32
  %282 = load i16* %row, align 2
  %283 = zext i16 %282 to i64
  %284 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %283
  %285 = load float* %284
  %286 = fpext float %285 to double
  %287 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %279, i8* getelementptr inbounds ([34 x i8]* @.str15, i32 0, i32 0), i32 %281, double %286)
  br label %288

; <label>:288                                     ; preds = %261, %257
  br label %289

; <label>:289                                     ; preds = %288, %256
  br label %290

; <label>:290                                     ; preds = %289
  %291 = load i16* %row, align 2
  %292 = add i16 %291, 1
  store i16 %292, i16* %row, align 2
  br label %1

; <label>:293                                     ; preds = %1
  ret void
}

define void @transverseCorrection11() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %col1 = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %310, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %313

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
  br i1 %57, label %58, label %242

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %155

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %151, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %154

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
  %110 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 3, %111
  %113 = load i16* %row, align 2
  %114 = zext i16 %113 to i32
  %115 = add nsw i32 %112, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %116
  %118 = load i16* %117
  %119 = zext i16 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = load i16* %col, align 2
  %122 = zext i16 %121 to i32
  %123 = add nsw i32 %120, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %124
  %126 = load float* %125
  %127 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %128 = zext i16 %127 to i32
  %129 = add nsw i32 3, %128
  %130 = load i16* %row, align 2
  %131 = zext i16 %130 to i32
  %132 = add nsw i32 %129, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %133
  %135 = load i16* %134
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 3, %136
  %138 = sub nsw i32 %137, 1
  %139 = load i16* %col, align 2
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 %138, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %142
  %144 = load i16* %143
  %145 = zext i16 %144 to i32
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %147
  %149 = load float* %148
  %150 = fadd float %149, %126
  store float %150, float* %148
  br label %151

; <label>:151                                     ; preds = %71
  %152 = load i16* %col, align 2
  %153 = add i16 %152, 1
  store i16 %153, i16* %col, align 2
  br label %65

; <label>:154                                     ; preds = %65
  br label %241

; <label>:155                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %156

; <label>:156                                     ; preds = %237, %155
  %157 = load i16* %col, align 2
  %158 = zext i16 %157 to i32
  %159 = load i16* %range, align 2
  %160 = zext i16 %159 to i32
  %161 = icmp slt i32 %158, %160
  br i1 %161, label %162, label %240

; <label>:162                                     ; preds = %156
  %163 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %164 = zext i16 %163 to i32
  %165 = add nsw i32 3, %164
  %166 = load i16* %row, align 2
  %167 = zext i16 %166 to i32
  %168 = add nsw i32 %165, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %169
  %171 = load i16* %170
  %172 = zext i16 %171 to i32
  %173 = sub nsw i32 %172, 1
  %174 = load i16* %col, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %177
  %179 = load float* %178
  %180 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %181 = zext i16 %180 to i32
  %182 = add nsw i32 3, %181
  %183 = load i16* %row, align 2
  %184 = zext i16 %183 to i32
  %185 = add nsw i32 %182, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %186
  %188 = load i16* %187
  %189 = zext i16 %188 to i32
  %190 = sub nsw i32 %189, 1
  %191 = load i16* %col, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %194
  store float %179, float* %195
  %196 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %197 = zext i16 %196 to i32
  %198 = add nsw i32 3, %197
  %199 = load i16* %row, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %202
  %204 = load i16* %203
  %205 = zext i16 %204 to i32
  %206 = sub nsw i32 %205, 1
  %207 = load i16* %col, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %206, %208
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %210
  %212 = load float* %211
  %213 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %214 = zext i16 %213 to i32
  %215 = add nsw i32 3, %214
  %216 = load i16* %row, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %219
  %221 = load i16* %220
  %222 = zext i16 %221 to i32
  %223 = add nsw i32 3, %222
  %224 = sub nsw i32 %223, 1
  %225 = load i16* %col, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %233
  %235 = load float* %234
  %236 = fadd float %235, %212
  store float %236, float* %234
  br label %237

; <label>:237                                     ; preds = %162
  %238 = load i16* %col, align 2
  %239 = add i16 %238, 1
  store i16 %239, i16* %col, align 2
  br label %156

; <label>:240                                     ; preds = %156
  br label %241

; <label>:241                                     ; preds = %240, %154
  br label %309

; <label>:242                                     ; preds = %54
  %243 = load i16* %range, align 2
  %244 = zext i16 %243 to i32
  %245 = icmp eq i32 %244, 1
  br i1 %245, label %246, label %308

; <label>:246                                     ; preds = %242
  store i16 0, i16* %col1, align 2
  %247 = load i16* %row, align 2
  %248 = zext i16 %247 to i64
  %249 = getelementptr inbounds [20000 x float]* @trans_info12_11, i32 0, i64 %248
  %250 = load float* %249
  %251 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %252 = zext i16 %251 to i32
  %253 = add nsw i32 3, %252
  %254 = load i16* %row, align 2
  %255 = zext i16 %254 to i32
  %256 = add nsw i32 %253, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %257
  %259 = load i16* %258
  %260 = zext i16 %259 to i32
  %261 = sub nsw i32 %260, 1
  %262 = load i16* %col1, align 2
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 %261, %263
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %265
  store float %250, float* %266
  %267 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %268 = zext i16 %267 to i32
  %269 = add nsw i32 3, %268
  %270 = load i16* %row, align 2
  %271 = zext i16 %270 to i32
  %272 = add nsw i32 %269, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %273
  %275 = load i16* %274
  %276 = zext i16 %275 to i32
  %277 = sub nsw i32 %276, 1
  %278 = load i16* %col1, align 2
  %279 = zext i16 %278 to i32
  %280 = add nsw i32 %277, %279
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [20000 x float]* @ext_info11, i32 0, i64 %281
  %283 = load float* %282
  %284 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 2)
  %285 = zext i16 %284 to i32
  %286 = add nsw i32 3, %285
  %287 = load i16* %row, align 2
  %288 = zext i16 %287 to i32
  %289 = add nsw i32 %286, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %290
  %292 = load i16* %291
  %293 = zext i16 %292 to i32
  %294 = add nsw i32 3, %293
  %295 = sub nsw i32 %294, 1
  %296 = load i16* %col1, align 2
  %297 = zext i16 %296 to i32
  %298 = add nsw i32 %295, %297
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [20000 x i16]* @mem11, i32 0, i64 %299
  %301 = load i16* %300
  %302 = zext i16 %301 to i32
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %304
  %306 = load float* %305
  %307 = fadd float %306, %283
  store float %307, float* %305
  br label %308

; <label>:308                                     ; preds = %246, %242
  br label %309

; <label>:309                                     ; preds = %308, %241
  br label %310

; <label>:310                                     ; preds = %309
  %311 = load i16* %row, align 2
  %312 = add i16 %311, 1
  store i16 %312, i16* %row, align 2
  br label %1

; <label>:313                                     ; preds = %1
  ret void
}

define void @transverseCorrection12() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %col1 = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %310, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %313

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
  br i1 %57, label %58, label %242

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %155

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %151, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %154

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
  %110 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 3, %111
  %113 = load i16* %row, align 2
  %114 = zext i16 %113 to i32
  %115 = add nsw i32 %112, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %116
  %118 = load i16* %117
  %119 = zext i16 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = load i16* %col, align 2
  %122 = zext i16 %121 to i32
  %123 = add nsw i32 %120, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %124
  %126 = load float* %125
  %127 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %128 = zext i16 %127 to i32
  %129 = add nsw i32 3, %128
  %130 = load i16* %row, align 2
  %131 = zext i16 %130 to i32
  %132 = add nsw i32 %129, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %133
  %135 = load i16* %134
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 3, %136
  %138 = sub nsw i32 %137, 1
  %139 = load i16* %col, align 2
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 %138, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %142
  %144 = load i16* %143
  %145 = zext i16 %144 to i32
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %147
  %149 = load float* %148
  %150 = fadd float %149, %126
  store float %150, float* %148
  br label %151

; <label>:151                                     ; preds = %71
  %152 = load i16* %col, align 2
  %153 = add i16 %152, 1
  store i16 %153, i16* %col, align 2
  br label %65

; <label>:154                                     ; preds = %65
  br label %241

; <label>:155                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %156

; <label>:156                                     ; preds = %237, %155
  %157 = load i16* %col, align 2
  %158 = zext i16 %157 to i32
  %159 = load i16* %range, align 2
  %160 = zext i16 %159 to i32
  %161 = icmp slt i32 %158, %160
  br i1 %161, label %162, label %240

; <label>:162                                     ; preds = %156
  %163 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %164 = zext i16 %163 to i32
  %165 = add nsw i32 3, %164
  %166 = load i16* %row, align 2
  %167 = zext i16 %166 to i32
  %168 = add nsw i32 %165, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %169
  %171 = load i16* %170
  %172 = zext i16 %171 to i32
  %173 = sub nsw i32 %172, 1
  %174 = load i16* %col, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %177
  %179 = load float* %178
  %180 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %181 = zext i16 %180 to i32
  %182 = add nsw i32 3, %181
  %183 = load i16* %row, align 2
  %184 = zext i16 %183 to i32
  %185 = add nsw i32 %182, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %186
  %188 = load i16* %187
  %189 = zext i16 %188 to i32
  %190 = sub nsw i32 %189, 1
  %191 = load i16* %col, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %194
  store float %179, float* %195
  %196 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %197 = zext i16 %196 to i32
  %198 = add nsw i32 3, %197
  %199 = load i16* %row, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %202
  %204 = load i16* %203
  %205 = zext i16 %204 to i32
  %206 = sub nsw i32 %205, 1
  %207 = load i16* %col, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %206, %208
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %210
  %212 = load float* %211
  %213 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %214 = zext i16 %213 to i32
  %215 = add nsw i32 3, %214
  %216 = load i16* %row, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %219
  %221 = load i16* %220
  %222 = zext i16 %221 to i32
  %223 = add nsw i32 3, %222
  %224 = sub nsw i32 %223, 1
  %225 = load i16* %col, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %233
  %235 = load float* %234
  %236 = fadd float %235, %212
  store float %236, float* %234
  br label %237

; <label>:237                                     ; preds = %162
  %238 = load i16* %col, align 2
  %239 = add i16 %238, 1
  store i16 %239, i16* %col, align 2
  br label %156

; <label>:240                                     ; preds = %156
  br label %241

; <label>:241                                     ; preds = %240, %154
  br label %309

; <label>:242                                     ; preds = %54
  %243 = load i16* %range, align 2
  %244 = zext i16 %243 to i32
  %245 = icmp eq i32 %244, 1
  br i1 %245, label %246, label %308

; <label>:246                                     ; preds = %242
  store i16 0, i16* %col1, align 2
  %247 = load i16* %row, align 2
  %248 = zext i16 %247 to i64
  %249 = getelementptr inbounds [20000 x float]* @trans_info11_12, i32 0, i64 %248
  %250 = load float* %249
  %251 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %252 = zext i16 %251 to i32
  %253 = add nsw i32 3, %252
  %254 = load i16* %row, align 2
  %255 = zext i16 %254 to i32
  %256 = add nsw i32 %253, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %257
  %259 = load i16* %258
  %260 = zext i16 %259 to i32
  %261 = sub nsw i32 %260, 1
  %262 = load i16* %col1, align 2
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 %261, %263
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %265
  store float %250, float* %266
  %267 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %268 = zext i16 %267 to i32
  %269 = add nsw i32 3, %268
  %270 = load i16* %row, align 2
  %271 = zext i16 %270 to i32
  %272 = add nsw i32 %269, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %273
  %275 = load i16* %274
  %276 = zext i16 %275 to i32
  %277 = sub nsw i32 %276, 1
  %278 = load i16* %col1, align 2
  %279 = zext i16 %278 to i32
  %280 = add nsw i32 %277, %279
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [20000 x float]* @ext_info12, i32 0, i64 %281
  %283 = load float* %282
  %284 = load i16* getelementptr inbounds ([20000 x i16]* @mem12, i32 0, i64 2)
  %285 = zext i16 %284 to i32
  %286 = add nsw i32 3, %285
  %287 = load i16* %row, align 2
  %288 = zext i16 %287 to i32
  %289 = add nsw i32 %286, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %290
  %292 = load i16* %291
  %293 = zext i16 %292 to i32
  %294 = add nsw i32 3, %293
  %295 = sub nsw i32 %294, 1
  %296 = load i16* %col1, align 2
  %297 = zext i16 %296 to i32
  %298 = add nsw i32 %295, %297
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [20000 x i16]* @mem12, i32 0, i64 %299
  %301 = load i16* %300
  %302 = zext i16 %301 to i32
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %304
  %306 = load float* %305
  %307 = fadd float %306, %283
  store float %307, float* %305
  br label %308

; <label>:308                                     ; preds = %246, %242
  br label %309

; <label>:309                                     ; preds = %308, %241
  br label %310

; <label>:310                                     ; preds = %309
  %311 = load i16* %row, align 2
  %312 = add i16 %311, 1
  store i16 %312, i16* %row, align 2
  br label %1

; <label>:313                                     ; preds = %1
  ret void
}

define void @transverseCorrection22() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %col1 = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %310, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %313

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
  br i1 %57, label %58, label %242

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %155

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %151, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %154

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
  %110 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 3, %111
  %113 = load i16* %row, align 2
  %114 = zext i16 %113 to i32
  %115 = add nsw i32 %112, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %116
  %118 = load i16* %117
  %119 = zext i16 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = load i16* %col, align 2
  %122 = zext i16 %121 to i32
  %123 = add nsw i32 %120, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %124
  %126 = load float* %125
  %127 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %128 = zext i16 %127 to i32
  %129 = add nsw i32 3, %128
  %130 = load i16* %row, align 2
  %131 = zext i16 %130 to i32
  %132 = add nsw i32 %129, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %133
  %135 = load i16* %134
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 3, %136
  %138 = sub nsw i32 %137, 1
  %139 = load i16* %col, align 2
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 %138, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %142
  %144 = load i16* %143
  %145 = zext i16 %144 to i32
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %147
  %149 = load float* %148
  %150 = fadd float %149, %126
  store float %150, float* %148
  br label %151

; <label>:151                                     ; preds = %71
  %152 = load i16* %col, align 2
  %153 = add i16 %152, 1
  store i16 %153, i16* %col, align 2
  br label %65

; <label>:154                                     ; preds = %65
  br label %241

; <label>:155                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %156

; <label>:156                                     ; preds = %237, %155
  %157 = load i16* %col, align 2
  %158 = zext i16 %157 to i32
  %159 = load i16* %range, align 2
  %160 = zext i16 %159 to i32
  %161 = icmp slt i32 %158, %160
  br i1 %161, label %162, label %240

; <label>:162                                     ; preds = %156
  %163 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %164 = zext i16 %163 to i32
  %165 = add nsw i32 3, %164
  %166 = load i16* %row, align 2
  %167 = zext i16 %166 to i32
  %168 = add nsw i32 %165, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %169
  %171 = load i16* %170
  %172 = zext i16 %171 to i32
  %173 = sub nsw i32 %172, 1
  %174 = load i16* %col, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %177
  %179 = load float* %178
  %180 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %181 = zext i16 %180 to i32
  %182 = add nsw i32 3, %181
  %183 = load i16* %row, align 2
  %184 = zext i16 %183 to i32
  %185 = add nsw i32 %182, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %186
  %188 = load i16* %187
  %189 = zext i16 %188 to i32
  %190 = sub nsw i32 %189, 1
  %191 = load i16* %col, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %194
  store float %179, float* %195
  %196 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %197 = zext i16 %196 to i32
  %198 = add nsw i32 3, %197
  %199 = load i16* %row, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %202
  %204 = load i16* %203
  %205 = zext i16 %204 to i32
  %206 = sub nsw i32 %205, 1
  %207 = load i16* %col, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %206, %208
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %210
  %212 = load float* %211
  %213 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %214 = zext i16 %213 to i32
  %215 = add nsw i32 3, %214
  %216 = load i16* %row, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %219
  %221 = load i16* %220
  %222 = zext i16 %221 to i32
  %223 = add nsw i32 3, %222
  %224 = sub nsw i32 %223, 1
  %225 = load i16* %col, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %233
  %235 = load float* %234
  %236 = fadd float %235, %212
  store float %236, float* %234
  br label %237

; <label>:237                                     ; preds = %162
  %238 = load i16* %col, align 2
  %239 = add i16 %238, 1
  store i16 %239, i16* %col, align 2
  br label %156

; <label>:240                                     ; preds = %156
  br label %241

; <label>:241                                     ; preds = %240, %154
  br label %309

; <label>:242                                     ; preds = %54
  %243 = load i16* %range, align 2
  %244 = zext i16 %243 to i32
  %245 = icmp eq i32 %244, 1
  br i1 %245, label %246, label %308

; <label>:246                                     ; preds = %242
  store i16 0, i16* %col1, align 2
  %247 = load i16* %row, align 2
  %248 = zext i16 %247 to i64
  %249 = getelementptr inbounds [20000 x float]* @trans_info21_22, i32 0, i64 %248
  %250 = load float* %249
  %251 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %252 = zext i16 %251 to i32
  %253 = add nsw i32 3, %252
  %254 = load i16* %row, align 2
  %255 = zext i16 %254 to i32
  %256 = add nsw i32 %253, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %257
  %259 = load i16* %258
  %260 = zext i16 %259 to i32
  %261 = sub nsw i32 %260, 1
  %262 = load i16* %col1, align 2
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 %261, %263
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %265
  store float %250, float* %266
  %267 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %268 = zext i16 %267 to i32
  %269 = add nsw i32 3, %268
  %270 = load i16* %row, align 2
  %271 = zext i16 %270 to i32
  %272 = add nsw i32 %269, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %273
  %275 = load i16* %274
  %276 = zext i16 %275 to i32
  %277 = sub nsw i32 %276, 1
  %278 = load i16* %col1, align 2
  %279 = zext i16 %278 to i32
  %280 = add nsw i32 %277, %279
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [20000 x float]* @ext_info22, i32 0, i64 %281
  %283 = load float* %282
  %284 = load i16* getelementptr inbounds ([20000 x i16]* @mem22, i32 0, i64 2)
  %285 = zext i16 %284 to i32
  %286 = add nsw i32 3, %285
  %287 = load i16* %row, align 2
  %288 = zext i16 %287 to i32
  %289 = add nsw i32 %286, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %290
  %292 = load i16* %291
  %293 = zext i16 %292 to i32
  %294 = add nsw i32 3, %293
  %295 = sub nsw i32 %294, 1
  %296 = load i16* %col1, align 2
  %297 = zext i16 %296 to i32
  %298 = add nsw i32 %295, %297
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [20000 x i16]* @mem22, i32 0, i64 %299
  %301 = load i16* %300
  %302 = zext i16 %301 to i32
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %304
  %306 = load float* %305
  %307 = fadd float %306, %283
  store float %307, float* %305
  br label %308

; <label>:308                                     ; preds = %246, %242
  br label %309

; <label>:309                                     ; preds = %308, %241
  br label %310

; <label>:310                                     ; preds = %309
  %311 = load i16* %row, align 2
  %312 = add i16 %311, 1
  store i16 %312, i16* %row, align 2
  br label %1

; <label>:313                                     ; preds = %1
  ret void
}

define void @transverseCorrection21() nounwind {
  %row = alloca i16, align 2
  %col = alloca i16, align 2
  %range = alloca i16, align 2
  %col1 = alloca i16, align 2
  store i16 0, i16* %row, align 2
  store i16 0, i16* %col, align 2
  store i16 0, i16* %range, align 2
  store i16 0, i16* %row, align 2
  br label %1

; <label>:1                                       ; preds = %310, %0
  %2 = load i16* %row, align 2
  %3 = zext i16 %2 to i32
  %4 = load i16* getelementptr inbounds ([20000 x i16]* @mem11, i32 0, i64 0)
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %3, %5
  br i1 %6, label %7, label %313

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
  br i1 %57, label %58, label %242

; <label>:58                                      ; preds = %54
  %59 = load i16* %row, align 2
  %60 = zext i16 %59 to i64
  %61 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %60
  %62 = load float* %61
  %63 = fcmp une float %62, 0.000000e+00
  br i1 %63, label %64, label %155

; <label>:64                                      ; preds = %58
  store i16 0, i16* %col, align 2
  br label %65

; <label>:65                                      ; preds = %151, %64
  %66 = load i16* %col, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16* %range, align 2
  %69 = zext i16 %68 to i32
  %70 = icmp slt i32 %67, %69
  br i1 %70, label %71, label %154

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
  %110 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %111 = zext i16 %110 to i32
  %112 = add nsw i32 3, %111
  %113 = load i16* %row, align 2
  %114 = zext i16 %113 to i32
  %115 = add nsw i32 %112, %114
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %116
  %118 = load i16* %117
  %119 = zext i16 %118 to i32
  %120 = sub nsw i32 %119, 1
  %121 = load i16* %col, align 2
  %122 = zext i16 %121 to i32
  %123 = add nsw i32 %120, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %124
  %126 = load float* %125
  %127 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %128 = zext i16 %127 to i32
  %129 = add nsw i32 3, %128
  %130 = load i16* %row, align 2
  %131 = zext i16 %130 to i32
  %132 = add nsw i32 %129, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %133
  %135 = load i16* %134
  %136 = zext i16 %135 to i32
  %137 = add nsw i32 3, %136
  %138 = sub nsw i32 %137, 1
  %139 = load i16* %col, align 2
  %140 = zext i16 %139 to i32
  %141 = add nsw i32 %138, %140
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %142
  %144 = load i16* %143
  %145 = zext i16 %144 to i32
  %146 = sub nsw i32 %145, 1
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %147
  %149 = load float* %148
  %150 = fadd float %149, %126
  store float %150, float* %148
  br label %151

; <label>:151                                     ; preds = %71
  %152 = load i16* %col, align 2
  %153 = add i16 %152, 1
  store i16 %153, i16* %col, align 2
  br label %65

; <label>:154                                     ; preds = %65
  br label %241

; <label>:155                                     ; preds = %58
  store i16 0, i16* %col, align 2
  br label %156

; <label>:156                                     ; preds = %237, %155
  %157 = load i16* %col, align 2
  %158 = zext i16 %157 to i32
  %159 = load i16* %range, align 2
  %160 = zext i16 %159 to i32
  %161 = icmp slt i32 %158, %160
  br i1 %161, label %162, label %240

; <label>:162                                     ; preds = %156
  %163 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %164 = zext i16 %163 to i32
  %165 = add nsw i32 3, %164
  %166 = load i16* %row, align 2
  %167 = zext i16 %166 to i32
  %168 = add nsw i32 %165, %167
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %169
  %171 = load i16* %170
  %172 = zext i16 %171 to i32
  %173 = sub nsw i32 %172, 1
  %174 = load i16* %col, align 2
  %175 = zext i16 %174 to i32
  %176 = add nsw i32 %173, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %177
  %179 = load float* %178
  %180 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %181 = zext i16 %180 to i32
  %182 = add nsw i32 3, %181
  %183 = load i16* %row, align 2
  %184 = zext i16 %183 to i32
  %185 = add nsw i32 %182, %184
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %186
  %188 = load i16* %187
  %189 = zext i16 %188 to i32
  %190 = sub nsw i32 %189, 1
  %191 = load i16* %col, align 2
  %192 = zext i16 %191 to i32
  %193 = add nsw i32 %190, %192
  %194 = sext i32 %193 to i64
  %195 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %194
  store float %179, float* %195
  %196 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %197 = zext i16 %196 to i32
  %198 = add nsw i32 3, %197
  %199 = load i16* %row, align 2
  %200 = zext i16 %199 to i32
  %201 = add nsw i32 %198, %200
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %202
  %204 = load i16* %203
  %205 = zext i16 %204 to i32
  %206 = sub nsw i32 %205, 1
  %207 = load i16* %col, align 2
  %208 = zext i16 %207 to i32
  %209 = add nsw i32 %206, %208
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %210
  %212 = load float* %211
  %213 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %214 = zext i16 %213 to i32
  %215 = add nsw i32 3, %214
  %216 = load i16* %row, align 2
  %217 = zext i16 %216 to i32
  %218 = add nsw i32 %215, %217
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %219
  %221 = load i16* %220
  %222 = zext i16 %221 to i32
  %223 = add nsw i32 3, %222
  %224 = sub nsw i32 %223, 1
  %225 = load i16* %col, align 2
  %226 = zext i16 %225 to i32
  %227 = add nsw i32 %224, %226
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %228
  %230 = load i16* %229
  %231 = zext i16 %230 to i32
  %232 = sub nsw i32 %231, 1
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %233
  %235 = load float* %234
  %236 = fadd float %235, %212
  store float %236, float* %234
  br label %237

; <label>:237                                     ; preds = %162
  %238 = load i16* %col, align 2
  %239 = add i16 %238, 1
  store i16 %239, i16* %col, align 2
  br label %156

; <label>:240                                     ; preds = %156
  br label %241

; <label>:241                                     ; preds = %240, %154
  br label %309

; <label>:242                                     ; preds = %54
  %243 = load i16* %range, align 2
  %244 = zext i16 %243 to i32
  %245 = icmp eq i32 %244, 1
  br i1 %245, label %246, label %308

; <label>:246                                     ; preds = %242
  store i16 0, i16* %col1, align 2
  %247 = load i16* %row, align 2
  %248 = zext i16 %247 to i64
  %249 = getelementptr inbounds [20000 x float]* @trans_info22_21, i32 0, i64 %248
  %250 = load float* %249
  %251 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %252 = zext i16 %251 to i32
  %253 = add nsw i32 3, %252
  %254 = load i16* %row, align 2
  %255 = zext i16 %254 to i32
  %256 = add nsw i32 %253, %255
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %257
  %259 = load i16* %258
  %260 = zext i16 %259 to i32
  %261 = sub nsw i32 %260, 1
  %262 = load i16* %col1, align 2
  %263 = zext i16 %262 to i32
  %264 = add nsw i32 %261, %263
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %265
  store float %250, float* %266
  %267 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %268 = zext i16 %267 to i32
  %269 = add nsw i32 3, %268
  %270 = load i16* %row, align 2
  %271 = zext i16 %270 to i32
  %272 = add nsw i32 %269, %271
  %273 = sext i32 %272 to i64
  %274 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %273
  %275 = load i16* %274
  %276 = zext i16 %275 to i32
  %277 = sub nsw i32 %276, 1
  %278 = load i16* %col1, align 2
  %279 = zext i16 %278 to i32
  %280 = add nsw i32 %277, %279
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [20000 x float]* @ext_info21, i32 0, i64 %281
  %283 = load float* %282
  %284 = load i16* getelementptr inbounds ([20000 x i16]* @mem21, i32 0, i64 2)
  %285 = zext i16 %284 to i32
  %286 = add nsw i32 3, %285
  %287 = load i16* %row, align 2
  %288 = zext i16 %287 to i32
  %289 = add nsw i32 %286, %288
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %290
  %292 = load i16* %291
  %293 = zext i16 %292 to i32
  %294 = add nsw i32 3, %293
  %295 = sub nsw i32 %294, 1
  %296 = load i16* %col1, align 2
  %297 = zext i16 %296 to i32
  %298 = add nsw i32 %295, %297
  %299 = sext i32 %298 to i64
  %300 = getelementptr inbounds [20000 x i16]* @mem21, i32 0, i64 %299
  %301 = load i16* %300
  %302 = zext i16 %301 to i32
  %303 = sub nsw i32 %302, 1
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %304
  %306 = load float* %305
  %307 = fadd float %306, %283
  store float %307, float* %305
  br label %308

; <label>:308                                     ; preds = %246, %242
  br label %309

; <label>:309                                     ; preds = %308, %241
  br label %310

; <label>:310                                     ; preds = %309
  %311 = load i16* %row, align 2
  %312 = add i16 %311, 1
  store i16 %312, i16* %row, align 2
  br label %1

; <label>:313                                     ; preds = %1
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
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %82
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
  %83 = getelementptr inbounds [13000 x float]* @aPosteriori1, i32 0, i64 %82
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

define void @top_daemon_1() nounwind {
  %nitr_1 = alloca i8, align 1
  %init_trans_info = alloca i8, align 1
  %aPosteriori_update_phase2_done = alloca i8, align 1
  %is_decoded_1 = alloca i8, align 1
  %is_decoded_2 = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  call void @initInputs()
  call void @initMem()
  call void @readCodeBlock()
  call void @write_uint8(i8* getelementptr inbounds ([24 x i8]* @.str16, i32 0, i32 0), i8 zeroext 1)
  call void @initialize_aPriori1()
  call void @initializeMessage11()
  call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str17, i32 0, i32 0), i8 zeroext 1)
  store i8 1, i8* %nitr_1, align 1
  br label %1

; <label>:1                                       ; preds = %27, %0
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
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str18, i32 0, i32 0), i8 zeroext 1)
  %8 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str19, i32 0, i32 0))
  store i8 %8, i8* %init_trans_info, align 1
  call void @transverseCorrection11()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0), i8 zeroext 0)
  %9 = load %struct._IO_FILE** @stderr, align 8
  %10 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([49 x i8]* @.str21, i32 0, i32 0))
  %11 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str22, i32 0, i32 0))
  store i8 %11, i8* %aPosteriori_update_phase2_done, align 1
  %12 = call zeroext i8 @checkIsdecoded1()
  store i8 %12, i8* %is_decoded_1, align 1
  %13 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([13 x i8]* @.str23, i32 0, i32 0))
  store i8 %13, i8* %is_decoded_2, align 1
  %14 = load i8* %is_decoded_1, align 1
  %15 = zext i8 %14 to i32
  %16 = load i8* %is_decoded_2, align 1
  %17 = zext i8 %16 to i32
  %18 = and i32 %15, %17
  %19 = trunc i32 %18 to i8
  store i8 %19, i8* %is_decoded, align 1
  %20 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str24, i32 0, i32 0), i8 zeroext %20)
  %21 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str25, i32 0, i32 0), i8 zeroext %21)
  %22 = load i8* %is_decoded, align 1
  call void @write_uint8(i8* getelementptr inbounds ([14 x i8]* @.str26, i32 0, i32 0), i8 zeroext %22)
  %23 = load i8* %is_decoded, align 1
  %24 = icmp ne i8 %23, 0
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %7
  br label %30

; <label>:26                                      ; preds = %7
  call void @updateMessage11()
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i8* %nitr_1, align 1
  %29 = add i8 %28, 1
  store i8 %29, i8* %nitr_1, align 1
  br label %1

.loopexit:                                        ; preds = %1
  br label %30

; <label>:30                                      ; preds = %.loopexit, %25
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str27, i32 0, i32 0), i8 zeroext 1)
  ret void
}

declare void @write_uint8(i8*, i8 zeroext)

declare zeroext i8 @read_uint8(i8*)

define void @top_daemon_2() nounwind {
  %init_mat = alloca i8, align 1
  %nitr_2 = alloca i8, align 1
  %init_trans_info = alloca i8, align 1
  %aPosteriori_update_phase2_done = alloca i8, align 1
  %is_decoded_2 = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([24 x i8]* @.str16, i32 0, i32 0))
  store i8 %1, i8* %init_mat, align 1
  call void @initialize_aPriori2()
  call void @initializeMessage12()
  call void @write_uint8(i8* getelementptr inbounds ([22 x i8]* @.str28, i32 0, i32 0), i8 zeroext 1)
  store i8 1, i8* %nitr_2, align 1
  br label %2

; <label>:2                                       ; preds = %20, %0
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
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str19, i32 0, i32 0), i8 zeroext 0)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str18, i32 0, i32 0))
  store i8 %9, i8* %init_trans_info, align 1
  call void @transverseCorrection12()
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([50 x i8]* @.str29, i32 0, i32 0))
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str30, i32 0, i32 0), i8 zeroext 1)
  %12 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str31, i32 0, i32 0))
  store i8 %12, i8* %aPosteriori_update_phase2_done, align 1
  %13 = call zeroext i8 @checkIsdecoded2()
  store i8 %13, i8* %is_decoded_2, align 1
  %14 = load i8* %is_decoded_2, align 1
  call void @write_uint8(i8* getelementptr inbounds ([13 x i8]* @.str23, i32 0, i32 0), i8 zeroext %14)
  %15 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str24, i32 0, i32 0))
  store i8 %15, i8* %is_decoded, align 1
  %16 = load i8* %is_decoded, align 1
  %17 = icmp ne i8 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %8
  br label %23

; <label>:19                                      ; preds = %8
  call void @updateMessage12()
  br label %20

; <label>:20                                      ; preds = %19
  %21 = load i8* %nitr_2, align 1
  %22 = add i8 %21, 1
  store i8 %22, i8* %nitr_2, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %23

; <label>:23                                      ; preds = %.loopexit, %18
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str32, i32 0, i32 0), i8 zeroext 1)
  ret void
}

define void @daemon_3() nounwind {
  %init_aPriori1 = alloca i8, align 1
  %nitr_3 = alloca i8, align 1
  %trans_info_computed = alloca i8, align 1
  %aPosteriori_update_phase1_done = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str17, i32 0, i32 0))
  store i8 %1, i8* %init_aPriori1, align 1
  call void @initializeMessage21()
  store i8 1, i8* %nitr_3, align 1
  br label %2

; <label>:2                                       ; preds = %22, %0
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
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str33, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str34, i32 0, i32 0))
  store i8 %9, i8* %trans_info_computed, align 1
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([52 x i8]* @.str35, i32 0, i32 0))
  %12 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str20, i32 0, i32 0))
  store i8 %12, i8* %aPosteriori_update_phase1_done, align 1
  %13 = load %struct._IO_FILE** @stderr, align 8
  %14 = load i8* %aPosteriori_update_phase1_done, align 1
  %15 = zext i8 %14 to i32
  %16 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([33 x i8]* @.str36, i32 0, i32 0), i32 %15)
  call void @transverseCorrection21()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str22, i32 0, i32 0), i8 zeroext 1)
  %17 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str25, i32 0, i32 0))
  store i8 %17, i8* %is_decoded, align 1
  %18 = load i8* %is_decoded, align 1
  %19 = icmp ne i8 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %8
  br label %25

; <label>:21                                      ; preds = %8
  call void @updateMessage21()
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i8* %nitr_3, align 1
  %24 = add i8 %23, 1
  store i8 %24, i8* %nitr_3, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %25

; <label>:25                                      ; preds = %.loopexit, %20
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str37, i32 0, i32 0), i8 zeroext 1)
  ret void
}

define void @daemon_4() nounwind {
  %init_aPriori2 = alloca i8, align 1
  %nitr_4 = alloca i8, align 1
  %trans_info_computed = alloca i8, align 1
  %aPosteriori_update_phase1_done = alloca i8, align 1
  %is_decoded = alloca i8, align 1
  %1 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([22 x i8]* @.str28, i32 0, i32 0))
  store i8 %1, i8* %init_aPriori2, align 1
  call void @initializeMessage22()
  store i8 1, i8* %nitr_4, align 1
  br label %2

; <label>:2                                       ; preds = %18, %0
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
  call void @write_uint8(i8* getelementptr inbounds ([32 x i8]* @.str34, i32 0, i32 0), i8 zeroext 1)
  %9 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([32 x i8]* @.str33, i32 0, i32 0))
  store i8 %9, i8* %trans_info_computed, align 1
  %10 = load %struct._IO_FILE** @stderr, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...)* @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([51 x i8]* @.str38, i32 0, i32 0))
  %12 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([26 x i8]* @.str30, i32 0, i32 0))
  store i8 %12, i8* %aPosteriori_update_phase1_done, align 1
  call void @transverseCorrection22()
  call void @write_uint8(i8* getelementptr inbounds ([26 x i8]* @.str31, i32 0, i32 0), i8 zeroext 1)
  %13 = call zeroext i8 @read_uint8(i8* getelementptr inbounds ([14 x i8]* @.str26, i32 0, i32 0))
  store i8 %13, i8* %is_decoded, align 1
  %14 = load i8* %is_decoded, align 1
  %15 = icmp ne i8 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %8
  br label %21

; <label>:17                                      ; preds = %8
  call void @updateMessage22()
  br label %18

; <label>:18                                      ; preds = %17
  %19 = load i8* %nitr_4, align 1
  %20 = add i8 %19, 1
  store i8 %20, i8* %nitr_4, align 1
  br label %2

.loopexit:                                        ; preds = %2
  br label %21

; <label>:21                                      ; preds = %.loopexit, %16
  call void @write_uint8(i8* getelementptr inbounds ([17 x i8]* @.str39, i32 0, i32 0), i8 zeroext 1)
  ret void
}
