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
@message = common global [512 x float] zeroinitializer, align 16
@aPosteriori = common global [512 x float] zeroinitializer, align 16
@ext_info = common global [512 x float] zeroinitializer, align 16
@is_decoded = common global i16 0, align 2
@.str5 = private constant [19 x i8] c"code_block_decoded\00"
@.str6 = private constant [14 x i8] c"nitr_required\00"
@Nitr_required = common global i16 0, align 2

define void @initInputs() nounwind {
bb.nph3:
  %0 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0)) nounwind
  store i16 %0, i16* @maxNitr, align 2
  %1 = tail call float @read_float32(i8* getelementptr inbounds ([10 x i8]* @.str1, i64 0, i64 0)) nounwind
  store float %1, float* @ebbyNo, align 4
  br label %2

; <label>:2                                       ; preds = %2, %bb.nph3
  %indvar7 = phi i64 [ 0, %bb.nph3 ], [ %indvar.next8, %2 ]
  %scevgep10 = getelementptr [512 x i16]* @mem, i64 0, i64 %indvar7
  %3 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %3, i16* %scevgep10, align 2
  %indvar.next8 = add i64 %indvar7, 1
  %exitcond = icmp eq i64 %indvar.next8, 3
  br i1 %exitcond, label %._crit_edge4, label %2

._crit_edge4:                                     ; preds = %2
  %4 = load i16* getelementptr inbounds ([512 x i16]* @mem, i64 0, i64 0), align 16
  store i16 %4, i16* @nrows, align 2
  %5 = load i16* getelementptr inbounds ([512 x i16]* @mem, i64 0, i64 1), align 2
  store i16 %5, i16* @ncols, align 2
  %6 = load i16* getelementptr inbounds ([512 x i16]* @mem, i64 0, i64 2), align 4
  store i16 %6, i16* @ncol_ind, align 2
  %7 = sub i16 0, %6
  %8 = icmp eq i16 %4, %7
  br i1 %8, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %._crit_edge4
  %tmp = add i16 %4, %6
  %tmp1 = zext i16 %tmp to i64
  br label %9

; <label>:9                                       ; preds = %9, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %9 ]
  %tmp3 = add i64 %indvar, 3
  %scevgep = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp3
  tail call void @__loop_pipelining_on__(i32 16, i32 2, i32 1) nounwind
  %10 = tail call zeroext i16 @read_uint16(i8* getelementptr inbounds ([10 x i8]* @.str2, i64 0, i64 0)) nounwind
  store i16 %10, i16* %scevgep, align 2
  %indvar.next = add i64 %indvar, 1
  %exitcond2 = icmp eq i64 %indvar.next, %tmp1
  br i1 %exitcond2, label %._crit_edge.loopexit, label %9

._crit_edge.loopexit:                             ; preds = %9
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge4
  %11 = tail call float @read_float32(i8* getelementptr inbounds ([8 x i8]* @.str3, i64 0, i64 0)) nounwind
  store float %11, float* @rate, align 4
  ret void
}

declare zeroext i16 @read_uint16(i8*)

declare float @read_float32(i8*)

declare void @__loop_pipelining_on__(i32, i32, i32)

define void @readCodeBlock() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %0
  br label %bb.nph

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %3 = phi i8 [ %7, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp = add i8 %3, 1
  tail call void @__loop_pipelining_on__(i32 16, i32 2, i32 1) nounwind
  %4 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i64 0, i64 0)) nounwind
  %5 = zext i8 %3 to i64
  %6 = getelementptr inbounds [512 x float]* @code_block, i64 0, i64 %5
  store float %4, float* %6, align 4
  %7 = add i8 %3, 1
  %8 = zext i8 %tmp to i32
  %9 = load i16* @ncols, align 2
  %10 = zext i16 %9 to i32
  %11 = icmp ult i32 %8, %10
  br i1 %11, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initialize_aPriori() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %3 = load float* @ebbyNo, align 4
  %4 = load float* @rate, align 4
  %5 = fmul float %4, %3
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op6 = add i64 %6, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %7

; <label>:7                                       ; preds = %7, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %7 ]
  %scevgep5 = getelementptr [512 x float]* @aPriori, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar
  %8 = load float* %scevgep, align 4
  %9 = fmul float %8, -4.000000e+00
  %10 = fmul float %5, %9
  store float %10, float* %scevgep5, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %7

._crit_edge.loopexit:                             ; preds = %7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeMessage() nounwind {
  %1 = load i16* @ncol_ind, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @message, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = zext i16 %6 to i64
  %8 = getelementptr inbounds [512 x float]* @aPriori, i64 0, i64 %7
  %9 = load float* %8, align 4
  store float %9, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initialize_aPosteriori() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep5 = getelementptr [512 x float]* @aPosteriori, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPriori, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  store float %5, float* %scevgep5, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @initializeExtrinsicInfo() nounwind {
  %1 = load i16* @ncol_ind, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op5 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op5, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %scevgep = getelementptr [512 x float]* @ext_info, i64 0, i64 %indvar
  store float 0.000000e+00, float* %scevgep, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @checkNodeComputeEngine() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge12, label %bb.nph11.preheader

bb.nph11.preheader:                               ; preds = %0
  br label %bb.nph11

bb.nph11:                                         ; preds = %._crit_edge9, %bb.nph11.preheader
  %3 = phi i16 [ %4, %._crit_edge9 ], [ 0, %bb.nph11.preheader ]
  %tmp17 = add i16 %3, 1
  %4 = add i16 %3, 1
  tail call void @__loop_pipelining_on__(i32 16, i32 2, i32 1) nounwind
  %5 = load i16* @ncol_ind, align 2
  %6 = zext i16 %3 to i32
  %7 = load i16* @nrows, align 2
  %8 = zext i16 %7 to i32
  %9 = add nsw i32 %8, -1
  %10 = icmp eq i32 %6, %9
  %11 = zext i16 %5 to i64
  %12 = zext i16 %3 to i64
  %13 = add i64 %12, 3
  %14 = add i64 %13, %11
  br i1 %10, label %15, label %19

; <label>:15                                      ; preds = %bb.nph11
  %16 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %14
  %17 = load i16* %16, align 2
  %.neg1 = add i16 %5, 1
  %18 = sub i16 %.neg1, %17
  br label %27

; <label>:19                                      ; preds = %bb.nph11
  %20 = add i64 %12, 4
  %21 = add i64 %20, %11
  %22 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %14
  %23 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %21
  %24 = load i16* %22, align 2
  %25 = load i16* %23, align 2
  %26 = sub i16 %25, %24
  br label %27

; <label>:27                                      ; preds = %19, %15
  %range.0 = phi i16 [ %18, %15 ], [ %26, %19 ]
  %28 = icmp eq i16 %range.0, 0
  br i1 %28, label %._crit_edge9, label %bb.nph8

bb.nph8:                                          ; preds = %27
  %29 = zext i16 %3 to i64
  %30 = add i64 %29, 3
  %31 = add i64 %30, %11
  %32 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %31
  %33 = load i16* %32, align 2
  %tmp15 = add i16 %33, -1
  br label %bb.nph

bb.nph:                                           ; preds = %._crit_edge, %bb.nph8
  %34 = phi i16 [ 0, %bb.nph8 ], [ %59, %._crit_edge ]
  %tmp16 = add i16 %tmp15, %34
  br label %35

; <label>:35                                      ; preds = %53, %bb.nph
  %exor.25 = phi i8 [ 0, %bb.nph ], [ %exor.1, %53 ]
  %36 = phi i16 [ 0, %bb.nph ], [ %54, %53 ]
  %val.23 = phi float [ 0.000000e+00, %bb.nph ], [ %val.1, %53 ]
  %flag.12 = phi i8 [ 0, %bb.nph ], [ %flag.0, %53 ]
  %tmp13 = add i16 %tmp15, %36
  %37 = zext i16 %tmp13 to i64
  %38 = getelementptr inbounds [512 x float]* @message, i64 0, i64 %37
  %39 = load float* %38, align 4
  %40 = fpext float %39 to double
  %41 = fcmp olt double %40, 0.000000e+00
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %35
  %43 = fsub float -0.000000e+00, %39
  br label %44

; <label>:44                                      ; preds = %42, %35
  %temp1.0 = phi float [ %43, %42 ], [ %39, %35 ]
  %45 = icmp eq i16 %36, %34
  br i1 %45, label %53, label %46

; <label>:46                                      ; preds = %44
  %47 = fcmp ult double %40, 0.000000e+00
  %48 = zext i1 %47 to i8
  %exor.0 = xor i8 %48, %exor.25
  %49 = icmp eq i8 %flag.12, 0
  br i1 %49, label %53, label %50

; <label>:50                                      ; preds = %46
  %51 = fcmp olt float %temp1.0, %val.23
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %50
  br label %53

; <label>:53                                      ; preds = %52, %50, %46, %44
  %flag.0 = phi i8 [ %flag.12, %44 ], [ 1, %46 ], [ 1, %52 ], [ 1, %50 ]
  %val.1 = phi float [ %val.23, %44 ], [ %temp1.0, %46 ], [ %temp1.0, %52 ], [ %val.23, %50 ]
  %exor.1 = phi i8 [ %exor.25, %44 ], [ %exor.0, %46 ], [ %exor.0, %52 ], [ %exor.0, %50 ]
  %54 = add i16 %36, 1
  %exitcond1 = icmp eq i16 %54, %range.0
  br i1 %exitcond1, label %._crit_edge, label %35

._crit_edge:                                      ; preds = %53
  %exor.1.lcssa = phi i8 [ %exor.1, %53 ]
  %val.1.lcssa = phi float [ %val.1, %53 ]
  %55 = icmp eq i8 %exor.1.lcssa, 0
  %sign.0 = select i1 %55, float 1.000000e+00, float -1.000000e+00
  %56 = fmul float %val.1.lcssa, %sign.0
  %57 = zext i16 %tmp16 to i64
  %58 = getelementptr inbounds [512 x float]* @ext_info, i64 0, i64 %57
  store float %56, float* %58, align 4
  %59 = add i16 %34, 1
  %exitcond = icmp eq i16 %59, %range.0
  br i1 %exitcond, label %._crit_edge9.loopexit, label %bb.nph

._crit_edge9.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %27
  %60 = icmp ult i16 %tmp17, %7
  br i1 %60, label %bb.nph11, label %._crit_edge12.loopexit

._crit_edge12.loopexit:                           ; preds = %._crit_edge9
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %0
  ret void
}

define void @update_aPosteriori() nounwind {
  %1 = load i16* @ncol_ind, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op7 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op7, i64 1
  br label %4

; <label>:4                                       ; preds = %4, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %4 ]
  %tmp2 = add i64 %indvar, 3
  %scevgep6 = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp2
  %scevgep = getelementptr [512 x float]* @ext_info, i64 0, i64 %indvar
  %5 = load i16* %scevgep6, align 2
  %6 = add i16 %5, -1
  %7 = load float* %scevgep, align 4
  %8 = zext i16 %6 to i64
  %9 = getelementptr inbounds [512 x float]* @aPosteriori, i64 0, i64 %8
  %10 = load float* %9, align 4
  %11 = fadd float %10, %7
  store float %11, float* %9, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @checkIsdecoded() nounwind {
  store i16 1, i16* @is_decoded, align 2
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %0
  %tmp = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %3 = zext i16 %.op to i64
  %.op6 = add i64 %3, 1
  %tmp4 = select i1 %tmp, i64 %.op6, i64 1
  br label %4

; <label>:4                                       ; preds = %22, %bb.nph
  %indvar = phi i64 [ 0, %bb.nph ], [ %indvar.next, %22 ]
  %scevgep5 = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar
  %scevgep = getelementptr [512 x float]* @aPosteriori, i64 0, i64 %indvar
  %5 = load float* %scevgep, align 4
  %6 = fpext float %5 to double
  %7 = fcmp ogt double %6, 0.000000e+00
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %4
  %9 = load float* %scevgep5, align 4
  %10 = fpext float %9 to double
  %11 = fcmp ogt double %10, 0.000000e+00
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8
  store i16 0, i16* @is_decoded, align 2
  br label %13

; <label>:13                                      ; preds = %12, %8
  store float -1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:14                                      ; preds = %4
  %15 = fcmp olt double %6, 0.000000e+00
  br i1 %15, label %16, label %22

; <label>:16                                      ; preds = %14
  %17 = load float* %scevgep5, align 4
  %18 = fpext float %17 to double
  %19 = fcmp olt double %18, 0.000000e+00
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16
  store i16 0, i16* @is_decoded, align 2
  br label %21

; <label>:21                                      ; preds = %20, %16
  store float 1.000000e+00, float* %scevgep5, align 4
  br label %22

; <label>:22                                      ; preds = %21, %14, %13
  %indvar.next = add i64 %indvar, 1
  %exitcond1 = icmp eq i64 %indvar.next, %tmp4
  br i1 %exitcond1, label %._crit_edge.loopexit, label %4

._crit_edge.loopexit:                             ; preds = %22
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  ret void
}

define void @updateMessage() nounwind {
  %1 = load i16* @nrows, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge5, label %bb.nph4

bb.nph4:                                          ; preds = %0
  %3 = load i16* @ncol_ind, align 2
  %4 = zext i16 %1 to i32
  %5 = add nsw i32 %4, -1
  %.neg1 = add i16 %3, 1
  %tmp7 = icmp ugt i16 %1, 1
  %.op = add i16 %1, -1
  %6 = zext i16 %.op to i64
  %.op19 = add i64 %6, 1
  %tmp10 = select i1 %tmp7, i64 %.op19, i64 1
  %tmp3 = zext i16 %3 to i64
  %tmp4 = add i64 %tmp3, 4
  %tmp8 = add i64 %tmp3, 3
  br label %7

; <label>:7                                       ; preds = %._crit_edge, %bb.nph4
  %indvar = phi i64 [ 0, %bb.nph4 ], [ %indvar.next, %._crit_edge ]
  %tmp5 = add i64 %tmp4, %indvar
  %scevgep18 = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp5
  %tmp9 = add i64 %tmp8, %indvar
  %scevgep = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp9
  %tmp12 = trunc i64 %indvar to i32
  %8 = icmp eq i32 %tmp12, %5
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %7
  %10 = load i16* %scevgep, align 2
  %11 = sub i16 %.neg1, %10
  br label %16

; <label>:12                                      ; preds = %7
  %13 = load i16* %scevgep, align 2
  %14 = load i16* %scevgep18, align 2
  %15 = sub i16 %14, %13
  br label %16

; <label>:16                                      ; preds = %12, %9
  %17 = phi i16 [ %10, %9 ], [ %13, %12 ]
  %range.0 = phi i16 [ %11, %9 ], [ %15, %12 ]
  %18 = icmp eq i16 %range.0, 0
  br i1 %18, label %._crit_edge, label %bb.nph

bb.nph:                                           ; preds = %16
  %tmp = add i16 %17, -1
  br label %19

; <label>:19                                      ; preds = %19, %bb.nph
  %col.02 = phi i16 [ 0, %bb.nph ], [ %32, %19 ]
  %tmp6 = add i16 %tmp, %col.02
  %20 = zext i16 %tmp6 to i64
  %21 = add i64 %20, 3
  %22 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %21
  %23 = load i16* %22, align 2
  %24 = add i16 %23, -1
  %25 = zext i16 %24 to i64
  %26 = getelementptr inbounds [512 x float]* @aPosteriori, i64 0, i64 %25
  %27 = load float* %26, align 4
  %28 = getelementptr inbounds [512 x float]* @ext_info, i64 0, i64 %20
  %29 = load float* %28, align 4
  %30 = fsub float %27, %29
  %31 = getelementptr inbounds [512 x float]* @message, i64 0, i64 %20
  store float %30, float* %31, align 4
  %32 = add i16 %col.02, 1
  %exitcond1 = icmp eq i16 %32, %range.0
  br i1 %exitcond1, label %._crit_edge.loopexit, label %19

._crit_edge.loopexit:                             ; preds = %19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %16
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp10
  br i1 %exitcond, label %._crit_edge5.loopexit, label %7

._crit_edge5.loopexit:                            ; preds = %._crit_edge
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %0
  ret void
}

define void @send_output() nounwind {
  %1 = load i16* @ncols, align 2
  %2 = icmp eq i16 %1, 0
  br i1 %2, label %._crit_edge, label %bb.nph.preheader

bb.nph.preheader:                                 ; preds = %0
  br label %bb.nph

bb.nph:                                           ; preds = %bb.nph, %bb.nph.preheader
  %indvar = phi i64 [ %tmp, %bb.nph ], [ 0, %bb.nph.preheader ]
  %tmp1 = add i64 %indvar, 1
  %tmp2 = trunc i64 %tmp1 to i32
  %scevgep = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar
  %3 = load float* %scevgep, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str5, i64 0, i64 0), float %3) nounwind
  %tmp = add i64 %indvar, 1
  %4 = load i16* @ncols, align 2
  %5 = zext i16 %4 to i32
  %6 = icmp slt i32 %tmp2, %5
  br i1 %6, label %bb.nph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %bb.nph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %0
  %7 = load i16* @Nitr_required, align 2
  tail call void @write_uint16(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0), i16 zeroext %7) nounwind
  ret void
}

declare void @write_float32(i8*, float)

declare void @write_uint16(i8*, i16 zeroext)

define void @minSumDecode() noreturn nounwind {
  br label %1

; <label>:1                                       ; preds = %send_output.exit, %0
  tail call void @initInputs()
  %2 = load i16* @ncols, align 2
  %3 = icmp eq i16 %2, 0
  br i1 %3, label %initialize_aPriori.exit, label %bb.nph.i.preheader

bb.nph.i.preheader:                               ; preds = %1
  br label %bb.nph.i

bb.nph.i:                                         ; preds = %bb.nph.i, %bb.nph.i.preheader
  %4 = phi i8 [ %5, %bb.nph.i ], [ 0, %bb.nph.i.preheader ]
  %tmp64 = add i8 %4, 1
  %5 = add i8 %4, 1
  tail call void @__loop_pipelining_on__(i32 16, i32 2, i32 1) nounwind
  %6 = tail call float @read_float32(i8* getelementptr inbounds ([14 x i8]* @.str4, i64 0, i64 0)) nounwind
  %7 = zext i8 %4 to i64
  %8 = getelementptr inbounds [512 x float]* @code_block, i64 0, i64 %7
  store float %6, float* %8, align 4
  %9 = zext i8 %tmp64 to i32
  %10 = load i16* @ncols, align 2
  %11 = zext i16 %10 to i32
  %12 = icmp ult i32 %9, %11
  br i1 %12, label %bb.nph.i, label %readCodeBlock.exit

readCodeBlock.exit:                               ; preds = %bb.nph.i
  %.lcssa = phi i16 [ %10, %bb.nph.i ]
  %13 = icmp eq i16 %.lcssa, 0
  br i1 %13, label %initialize_aPriori.exit, label %bb.nph.i1

bb.nph.i1:                                        ; preds = %readCodeBlock.exit
  %14 = load float* @ebbyNo, align 4
  %15 = load float* @rate, align 4
  %16 = fmul float %15, %14
  %tmp.i = icmp ugt i16 %.lcssa, 1
  %.op.i = add i16 %.lcssa, -1
  %17 = zext i16 %.op.i to i64
  %.op6.i = add i64 %17, 1
  %tmp4.i = select i1 %tmp.i, i64 %.op6.i, i64 1
  br label %18

; <label>:18                                      ; preds = %18, %bb.nph.i1
  %indvar.i = phi i64 [ 0, %bb.nph.i1 ], [ %indvar.next.i, %18 ]
  %scevgep.i = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar.i
  %scevgep5.i = getelementptr [512 x float]* @aPriori, i64 0, i64 %indvar.i
  %19 = load float* %scevgep.i, align 4
  %20 = fmul float %19, -4.000000e+00
  %21 = fmul float %16, %20
  store float %21, float* %scevgep5.i, align 4
  %indvar.next.i = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %indvar.next.i, %tmp4.i
  br i1 %exitcond, label %initialize_aPriori.exit.loopexit, label %18

initialize_aPriori.exit.loopexit:                 ; preds = %18
  br label %initialize_aPriori.exit

initialize_aPriori.exit:                          ; preds = %initialize_aPriori.exit.loopexit, %readCodeBlock.exit, %1
  %22 = phi i16 [ 0, %1 ], [ 0, %readCodeBlock.exit ], [ %.lcssa, %initialize_aPriori.exit.loopexit ]
  %23 = load i16* @ncol_ind, align 2
  %24 = icmp eq i16 %23, 0
  br i1 %24, label %initializeMessage.exit.preheader, label %bb.nph.i5

bb.nph.i5:                                        ; preds = %initialize_aPriori.exit
  %tmp.i2 = icmp ugt i16 %23, 1
  %.op.i3 = add i16 %23, -1
  %25 = zext i16 %.op.i3 to i64
  %.op7.i = add i64 %25, 1
  %tmp4.i4 = select i1 %tmp.i2, i64 %.op7.i, i64 1
  br label %26

; <label>:26                                      ; preds = %26, %bb.nph.i5
  %indvar.i6 = phi i64 [ 0, %bb.nph.i5 ], [ %indvar.next.i8, %26 ]
  %scevgep.i7 = getelementptr [512 x float]* @message, i64 0, i64 %indvar.i6
  %tmp4 = add i64 %indvar.i6, 3
  %scevgep6.i = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp4
  %27 = load i16* %scevgep6.i, align 2
  %28 = add i16 %27, -1
  %29 = zext i16 %28 to i64
  %30 = getelementptr inbounds [512 x float]* @aPriori, i64 0, i64 %29
  %31 = load float* %30, align 4
  store float %31, float* %scevgep.i7, align 4
  %indvar.next.i8 = add i64 %indvar.i6, 1
  %exitcond3 = icmp eq i64 %indvar.next.i8, %tmp4.i4
  br i1 %exitcond3, label %initializeMessage.exit.loopexit, label %26

initializeMessage.exit.loopexit:                  ; preds = %26
  br label %initializeMessage.exit.preheader

initializeMessage.exit.preheader:                 ; preds = %initializeMessage.exit.loopexit, %initialize_aPriori.exit
  %.ph = phi i16 [ %23, %initializeMessage.exit.loopexit ], [ 0, %initialize_aPriori.exit ]
  br label %initializeMessage.exit

initializeMessage.exit:                           ; preds = %updateMessage.exit, %initializeMessage.exit.preheader
  %indvar18 = phi i16 [ 0, %initializeMessage.exit.preheader ], [ %indvar.next, %updateMessage.exit ]
  %32 = phi i16 [ %44, %updateMessage.exit ], [ %.ph, %initializeMessage.exit.preheader ]
  %33 = phi i16 [ %55, %updateMessage.exit ], [ %22, %initializeMessage.exit.preheader ]
  %indvar = add i16 %indvar18, 1
  %34 = load i16* @maxNitr, align 2
  %35 = icmp ult i16 %indvar, %34
  br i1 %35, label %36, label %checkIsdecoded.exit.thread

; <label>:36                                      ; preds = %initializeMessage.exit
  %37 = icmp eq i16 %33, 0
  br i1 %37, label %initialize_aPosteriori.exit, label %bb.nph.i18

bb.nph.i18:                                       ; preds = %36
  %tmp.i14 = icmp ugt i16 %33, 1
  %.op.i15 = add i16 %33, -1
  %38 = zext i16 %.op.i15 to i64
  %.op6.i16 = add i64 %38, 1
  %tmp4.i17 = select i1 %tmp.i14, i64 %.op6.i16, i64 1
  br label %39

; <label>:39                                      ; preds = %39, %bb.nph.i18
  %indvar.i19 = phi i64 [ 0, %bb.nph.i18 ], [ %indvar.next.i22, %39 ]
  %scevgep.i20 = getelementptr [512 x float]* @aPriori, i64 0, i64 %indvar.i19
  %scevgep5.i21 = getelementptr [512 x float]* @aPosteriori, i64 0, i64 %indvar.i19
  %40 = load float* %scevgep.i20, align 4
  store float %40, float* %scevgep5.i21, align 4
  %indvar.next.i22 = add i64 %indvar.i19, 1
  %exitcond15 = icmp eq i64 %indvar.next.i22, %tmp4.i17
  br i1 %exitcond15, label %initialize_aPosteriori.exit.loopexit, label %39

initialize_aPosteriori.exit.loopexit:             ; preds = %39
  br label %initialize_aPosteriori.exit

initialize_aPosteriori.exit:                      ; preds = %initialize_aPosteriori.exit.loopexit, %36
  %41 = icmp eq i16 %32, 0
  br i1 %41, label %initializeExtrinsicInfo.exit, label %bb.nph.i27

bb.nph.i27:                                       ; preds = %initialize_aPosteriori.exit
  %tmp.i24 = icmp ugt i16 %32, 1
  %.op.i25 = add i16 %32, -1
  %42 = zext i16 %.op.i25 to i64
  %.op5.i = add i64 %42, 1
  %tmp4.i26 = select i1 %tmp.i24, i64 %.op5.i, i64 1
  br label %43

; <label>:43                                      ; preds = %43, %bb.nph.i27
  %indvar.i28 = phi i64 [ 0, %bb.nph.i27 ], [ %indvar.next.i30, %43 ]
  %scevgep.i29 = getelementptr [512 x float]* @ext_info, i64 0, i64 %indvar.i28
  store float 0.000000e+00, float* %scevgep.i29, align 4
  %indvar.next.i30 = add i64 %indvar.i28, 1
  %exitcond14 = icmp eq i64 %indvar.next.i30, %tmp4.i26
  br i1 %exitcond14, label %initializeExtrinsicInfo.exit.loopexit, label %43

initializeExtrinsicInfo.exit.loopexit:            ; preds = %43
  br label %initializeExtrinsicInfo.exit

initializeExtrinsicInfo.exit:                     ; preds = %initializeExtrinsicInfo.exit.loopexit, %initialize_aPosteriori.exit
  tail call void @checkNodeComputeEngine()
  %44 = load i16* @ncol_ind, align 2
  %45 = icmp eq i16 %44, 0
  br i1 %45, label %update_aPosteriori.exit, label %bb.nph.i54

bb.nph.i54:                                       ; preds = %initializeExtrinsicInfo.exit
  %tmp.i50 = icmp ugt i16 %44, 1
  %.op.i51 = add i16 %44, -1
  %46 = zext i16 %.op.i51 to i64
  %.op7.i52 = add i64 %46, 1
  %tmp4.i53 = select i1 %tmp.i50, i64 %.op7.i52, i64 1
  br label %47

; <label>:47                                      ; preds = %47, %bb.nph.i54
  %indvar.i55 = phi i64 [ 0, %bb.nph.i54 ], [ %indvar.next.i59, %47 ]
  %scevgep.i56 = getelementptr [512 x float]* @ext_info, i64 0, i64 %indvar.i55
  %tmp13 = add i64 %indvar.i55, 3
  %scevgep6.i58 = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp13
  %48 = load i16* %scevgep6.i58, align 2
  %49 = add i16 %48, -1
  %50 = load float* %scevgep.i56, align 4
  %51 = zext i16 %49 to i64
  %52 = getelementptr inbounds [512 x float]* @aPosteriori, i64 0, i64 %51
  %53 = load float* %52, align 4
  %54 = fadd float %53, %50
  store float %54, float* %52, align 4
  %indvar.next.i59 = add i64 %indvar.i55, 1
  %exitcond12 = icmp eq i64 %indvar.next.i59, %tmp4.i53
  br i1 %exitcond12, label %update_aPosteriori.exit.loopexit, label %47

update_aPosteriori.exit.loopexit:                 ; preds = %47
  br label %update_aPosteriori.exit

update_aPosteriori.exit:                          ; preds = %update_aPosteriori.exit.loopexit, %initializeExtrinsicInfo.exit
  store i16 1, i16* @is_decoded, align 2
  %55 = load i16* @ncols, align 2
  %56 = icmp eq i16 %55, 0
  br i1 %56, label %checkIsdecoded.exit.thread.thread, label %bb.nph.i43

checkIsdecoded.exit.thread.thread:                ; preds = %update_aPosteriori.exit
  %indvar.lcssa17 = phi i16 [ %indvar, %update_aPosteriori.exit ]
  store i16 %indvar.lcssa17, i16* @Nitr_required, align 2
  br label %send_output.exit

bb.nph.i43:                                       ; preds = %update_aPosteriori.exit
  %tmp.i39 = icmp ugt i16 %55, 1
  %.op.i40 = add i16 %55, -1
  %57 = zext i16 %.op.i40 to i64
  %.op6.i41 = add i64 %57, 1
  %tmp4.i42 = select i1 %tmp.i39, i64 %.op6.i41, i64 1
  br label %58

; <label>:58                                      ; preds = %76, %bb.nph.i43
  %.pr85 = phi i16 [ 1, %bb.nph.i43 ], [ %.pr, %76 ]
  %indvar.i44 = phi i64 [ 0, %bb.nph.i43 ], [ %indvar.next.i47, %76 ]
  %scevgep.i45 = getelementptr [512 x float]* @aPosteriori, i64 0, i64 %indvar.i44
  %scevgep5.i46 = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar.i44
  %59 = load float* %scevgep.i45, align 4
  %60 = fpext float %59 to double
  %61 = fcmp ogt double %60, 0.000000e+00
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %58
  %63 = load float* %scevgep5.i46, align 4
  %64 = fpext float %63 to double
  %65 = fcmp ogt double %64, 0.000000e+00
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %62
  store i16 0, i16* @is_decoded, align 2
  br label %67

; <label>:67                                      ; preds = %66, %62
  %.pr87 = phi i16 [ 0, %66 ], [ %.pr85, %62 ]
  store float -1.000000e+00, float* %scevgep5.i46, align 4
  br label %76

; <label>:68                                      ; preds = %58
  %69 = fcmp olt double %60, 0.000000e+00
  br i1 %69, label %70, label %76

; <label>:70                                      ; preds = %68
  %71 = load float* %scevgep5.i46, align 4
  %72 = fpext float %71 to double
  %73 = fcmp olt double %72, 0.000000e+00
  br i1 %73, label %74, label %75

; <label>:74                                      ; preds = %70
  store i16 0, i16* @is_decoded, align 2
  br label %75

; <label>:75                                      ; preds = %74, %70
  %.pr84 = phi i16 [ 0, %74 ], [ %.pr85, %70 ]
  store float 1.000000e+00, float* %scevgep5.i46, align 4
  br label %76

; <label>:76                                      ; preds = %75, %68, %67
  %.pr = phi i16 [ %.pr84, %75 ], [ %.pr85, %68 ], [ %.pr87, %67 ]
  %indvar.next.i47 = add i64 %indvar.i44, 1
  %exitcond16 = icmp eq i64 %indvar.next.i47, %tmp4.i42
  br i1 %exitcond16, label %checkIsdecoded.exit, label %58

checkIsdecoded.exit:                              ; preds = %76
  %.pr.lcssa = phi i16 [ %.pr, %76 ]
  %77 = icmp eq i16 %.pr.lcssa, 1
  br i1 %77, label %checkIsdecoded.exit.thread, label %78

; <label>:78                                      ; preds = %checkIsdecoded.exit
  %79 = load i16* @nrows, align 2
  %80 = icmp eq i16 %79, 0
  br i1 %80, label %updateMessage.exit, label %bb.nph4.i

bb.nph4.i:                                        ; preds = %78
  %81 = zext i16 %79 to i32
  %82 = add nsw i32 %81, -1
  %tmp7.i = icmp ugt i16 %79, 1
  %.op.i32 = add i16 %79, -1
  %83 = zext i16 %.op.i32 to i64
  %.op19.i = add i64 %83, 1
  %tmp10.i = select i1 %tmp7.i, i64 %.op19.i, i64 1
  %.neg1.i = add i16 %44, 1
  %tmp = zext i16 %44 to i64
  %tmp7 = add i64 %tmp, 4
  %tmp10 = add i64 %tmp, 3
  br label %84

; <label>:84                                      ; preds = %._crit_edge.i, %bb.nph4.i
  %indvar.i33 = phi i64 [ 0, %bb.nph4.i ], [ %indvar.next.i38, %._crit_edge.i ]
  %tmp8 = add i64 %tmp7, %indvar.i33
  %scevgep18.i = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp8
  %tmp12.i = trunc i64 %indvar.i33 to i32
  %tmp11 = add i64 %tmp10, %indvar.i33
  %scevgep.i34 = getelementptr [512 x i16]* @mem, i64 0, i64 %tmp11
  %85 = icmp eq i32 %tmp12.i, %82
  br i1 %85, label %86, label %89

; <label>:86                                      ; preds = %84
  %87 = load i16* %scevgep.i34, align 2
  %88 = sub i16 %.neg1.i, %87
  br label %93

; <label>:89                                      ; preds = %84
  %90 = load i16* %scevgep.i34, align 2
  %91 = load i16* %scevgep18.i, align 2
  %92 = sub i16 %91, %90
  br label %93

; <label>:93                                      ; preds = %89, %86
  %94 = phi i16 [ %87, %86 ], [ %90, %89 ]
  %range.0.i = phi i16 [ %88, %86 ], [ %92, %89 ]
  %95 = icmp eq i16 %range.0.i, 0
  br i1 %95, label %._crit_edge.i, label %bb.nph.i36

bb.nph.i36:                                       ; preds = %93
  %tmp.i35 = add i16 %94, -1
  br label %96

; <label>:96                                      ; preds = %96, %bb.nph.i36
  %col.02.i = phi i16 [ 0, %bb.nph.i36 ], [ %109, %96 ]
  %tmp6.i = add i16 %tmp.i35, %col.02.i
  %97 = zext i16 %tmp6.i to i64
  %98 = add i64 %97, 3
  %99 = getelementptr inbounds [512 x i16]* @mem, i64 0, i64 %98
  %100 = load i16* %99, align 2
  %101 = add i16 %100, -1
  %102 = zext i16 %101 to i64
  %103 = getelementptr inbounds [512 x float]* @aPosteriori, i64 0, i64 %102
  %104 = load float* %103, align 4
  %105 = getelementptr inbounds [512 x float]* @ext_info, i64 0, i64 %97
  %106 = load float* %105, align 4
  %107 = fsub float %104, %106
  %108 = getelementptr inbounds [512 x float]* @message, i64 0, i64 %97
  store float %107, float* %108, align 4
  %109 = add i16 %col.02.i, 1
  %exitcond5 = icmp eq i16 %109, %range.0.i
  br i1 %exitcond5, label %._crit_edge.i.loopexit, label %96

._crit_edge.i.loopexit:                           ; preds = %96
  br label %._crit_edge.i

._crit_edge.i:                                    ; preds = %._crit_edge.i.loopexit, %93
  %indvar.next.i38 = add i64 %indvar.i33, 1
  %exitcond6 = icmp eq i64 %indvar.next.i38, %tmp10.i
  br i1 %exitcond6, label %updateMessage.exit.loopexit, label %84

updateMessage.exit.loopexit:                      ; preds = %._crit_edge.i
  br label %updateMessage.exit

updateMessage.exit:                               ; preds = %updateMessage.exit.loopexit, %78
  %indvar.next = add i16 %indvar18, 1
  br label %initializeMessage.exit

checkIsdecoded.exit.thread:                       ; preds = %checkIsdecoded.exit, %initializeMessage.exit
  %indvar.lcssa = phi i16 [ %indvar, %checkIsdecoded.exit ], [ %indvar, %initializeMessage.exit ]
  %.pr62 = phi i16 [ %55, %checkIsdecoded.exit ], [ %33, %initializeMessage.exit ]
  store i16 %indvar.lcssa, i16* @Nitr_required, align 2
  %110 = icmp eq i16 %.pr62, 0
  br i1 %110, label %send_output.exit, label %bb.nph.i13.preheader

bb.nph.i13.preheader:                             ; preds = %checkIsdecoded.exit.thread
  br label %bb.nph.i13

bb.nph.i13:                                       ; preds = %bb.nph.i13, %bb.nph.i13.preheader
  %indvar.i10 = phi i64 [ %tmp82, %bb.nph.i13 ], [ 0, %bb.nph.i13.preheader ]
  %scevgep.i11 = getelementptr [512 x float]* @code_block, i64 0, i64 %indvar.i10
  %tmp1 = add i64 %indvar.i10, 1
  %tmp2.i = trunc i64 %tmp1 to i32
  %tmp82 = add i64 %indvar.i10, 1
  %111 = load float* %scevgep.i11, align 4
  tail call void @write_float32(i8* getelementptr inbounds ([19 x i8]* @.str5, i64 0, i64 0), float %111) nounwind
  %112 = load i16* @ncols, align 2
  %113 = zext i16 %112 to i32
  %114 = icmp slt i32 %tmp2.i, %113
  br i1 %114, label %bb.nph.i13, label %send_output.exit.loopexit

send_output.exit.loopexit:                        ; preds = %bb.nph.i13
  %.pre = load i16* @Nitr_required, align 2
  br label %send_output.exit

send_output.exit:                                 ; preds = %send_output.exit.loopexit, %checkIsdecoded.exit.thread, %checkIsdecoded.exit.thread.thread
  %115 = phi i16 [ %.pre, %send_output.exit.loopexit ], [ %indvar.lcssa17, %checkIsdecoded.exit.thread.thread ], [ %indvar.lcssa, %checkIsdecoded.exit.thread ]
  tail call void @write_uint16(i8* getelementptr inbounds ([14 x i8]* @.str6, i64 0, i64 0), i16 zeroext %115) nounwind
  br label %1
}
