; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: norecurse nounwind
define void @conv(i8* nocapture readonly %inputBytes, i8* nocapture %outputBytes, i32 %width, i32 %height, i8* nocapture readonly %kernel, i32 %kernelWidth, i32 %kernelHeight) local_unnamed_addr #0 {
entry:
  %cmp272 = icmp sgt i32 %height, 0
  br i1 %cmp272, label %for.cond1.preheader.lr.ph, label %for.cond.cleanup

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp2268 = icmp sgt i32 %width, 0
  %div = sdiv i32 %kernelWidth, 2
  %div13 = sdiv i32 %kernelHeight, 2
  %0 = sext i32 %div to i64
  %1 = sext i32 %width to i64
  %2 = sext i32 %div13 to i64
  %3 = sext i32 %height to i64
  %4 = sext i32 %kernelWidth to i64
  %cmp6190.not = icmp slt i32 %kernelHeight, 52
  %cmp10185.not = icmp slt i32 %kernelWidth, 32
  %brmerge = or i1 %cmp6190.not, %cmp10185.not
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.cleanup3, %for.cond1.preheader.lr.ph
  %indvars.iv299 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next300, %for.cond.cleanup3 ]
  br i1 %cmp2268, label %for.cond5.preheader.lr.ph, label %for.cond.cleanup3

for.cond5.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %5 = mul nsw i64 %indvars.iv299, %1
  br label %for.cond5.preheader

for.cond.cleanup.loopexit:                        ; preds = %for.cond.cleanup3
  br label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond.cleanup.loopexit, %entry
  ret void

for.cond5.preheader:                              ; preds = %for.cond.cleanup7, %for.cond5.preheader.lr.ph
  %indvars.iv291 = phi i64 [ 0, %for.cond5.preheader.lr.ph ], [ %indvars.iv.next292, %for.cond.cleanup7 ]
  br i1 %brmerge, label %for.cond.cleanup7, label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond5.preheader
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.cond9.for.cond.cleanup11_crit_edge.us
  %indvars.iv283 = phi i64 [ %indvars.iv.next284, %for.cond9.for.cond.cleanup11_crit_edge.us ], [ 51, %for.cond9.preheader.us.preheader ]
  %rSum.0193.us = phi i16 [ %split189.us, %for.cond9.for.cond.cleanup11_crit_edge.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %kSum.0191.us = phi i16 [ %split.us, %for.cond9.for.cond.cleanup11_crit_edge.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %6 = sub nsw i64 %indvars.iv283, %2
  %7 = add nsw i64 %6, %indvars.iv299
  %cmp21.us = icmp slt i64 %7, %3
  %8 = mul nsw i64 %7, %1
  %9 = mul nsw i64 %indvars.iv283, %4
  %notrhs.us = icmp sgt i64 %7, -1
  %or.cond304 = and i1 %cmp21.us, %notrhs.us
  br i1 %or.cond304, label %for.body12.us.us.us.preheader, label %for.cond9.for.cond.cleanup11_crit_edge.us

for.body12.us.us.us.preheader:                    ; preds = %for.cond9.preheader.us
  br label %for.body12.us.us.us

for.cond9.for.cond.cleanup11_crit_edge.us.loopexit: ; preds = %cleanup.us.us.us
  br label %for.cond9.for.cond.cleanup11_crit_edge.us

for.cond9.for.cond.cleanup11_crit_edge.us:        ; preds = %for.cond9.for.cond.cleanup11_crit_edge.us.loopexit, %for.cond9.preheader.us
  %split.us = phi i16 [ %kSum.0191.us, %for.cond9.preheader.us ], [ %kSum.2.us.us.us, %for.cond9.for.cond.cleanup11_crit_edge.us.loopexit ]
  %split189.us = phi i16 [ %rSum.0193.us, %for.cond9.preheader.us ], [ %rSum.2.us.us.us, %for.cond9.for.cond.cleanup11_crit_edge.us.loopexit ]
  %indvars.iv.next284 = add nuw nsw i64 %indvars.iv283, 1
  %lftr.wideiv289 = trunc i64 %indvars.iv.next284 to i32
  %exitcond290 = icmp eq i32 %lftr.wideiv289, %kernelHeight
  br i1 %exitcond290, label %for.cond.cleanup7.loopexit, label %for.cond9.preheader.us

for.body12.us.us.us:                              ; preds = %for.body12.us.us.us.preheader, %cleanup.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %cleanup.us.us.us ], [ 31, %for.body12.us.us.us.preheader ]
  %rSum.1188.us.us.us = phi i16 [ %rSum.2.us.us.us, %cleanup.us.us.us ], [ %rSum.0193.us, %for.body12.us.us.us.preheader ]
  %kSum.1186.us.us.us = phi i16 [ %kSum.2.us.us.us, %cleanup.us.us.us ], [ %kSum.0191.us, %for.body12.us.us.us.preheader ]
  %10 = sub nsw i64 %indvars.iv, %0
  %11 = add nsw i64 %10, %indvars.iv291
  %cmp16.us.us.us = icmp sgt i64 %11, -1
  %notlhs.us.us.us = icmp slt i64 %11, %1
  %or.cond = and i1 %cmp16.us.us.us, %notlhs.us.us.us
  br i1 %or.cond, label %if.end.us.us.us, label %cleanup.us.us.us

if.end.us.us.us:                                  ; preds = %for.body12.us.us.us
  %12 = add nsw i64 %11, %8
  %13 = mul nsw i64 %12, 3
  %arrayidx.us.us.us = getelementptr inbounds i8, i8* %inputBytes, i64 %13
  %14 = load i8, i8* %arrayidx.us.us.us, align 1, !tbaa !1
  %add25.us.us.us = add i8 %14, 9
  %15 = add nsw i64 %indvars.iv, %9
  %arrayidx30.us.us.us = getelementptr inbounds i8, i8* %kernel, i64 %15
  %16 = load i8, i8* %arrayidx30.us.us.us, align 1, !tbaa !1
  %add32.us.us.us = add i8 %16, 23
  %conv34.us.us.us = sext i8 %add25.us.us.us to i32
  %conv35.us.us.us = sext i8 %add32.us.us.us to i32
  %mul36.us.us.us = mul nsw i32 %conv35.us.us.us, %conv34.us.us.us
  %conv37182.us.us.us = zext i16 %rSum.1188.us.us.us to i32
  %add38.us.us.us = add i32 %mul36.us.us.us, %conv37182.us.us.us
  %conv39.us.us.us = trunc i32 %add38.us.us.us to i16
  %conv41183.us.us.us = zext i16 %kSum.1186.us.us.us to i32
  %add42.us.us.us = add nsw i32 %conv35.us.us.us, %conv41183.us.us.us
  %conv43.us.us.us = trunc i32 %add42.us.us.us to i16
  br label %cleanup.us.us.us

cleanup.us.us.us:                                 ; preds = %for.body12.us.us.us, %if.end.us.us.us
  %kSum.2.us.us.us = phi i16 [ %conv43.us.us.us, %if.end.us.us.us ], [ %kSum.1186.us.us.us, %for.body12.us.us.us ]
  %rSum.2.us.us.us = phi i16 [ %conv39.us.us.us, %if.end.us.us.us ], [ %rSum.1188.us.us.us, %for.body12.us.us.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %kernelWidth
  br i1 %exitcond, label %for.cond9.for.cond.cleanup11_crit_edge.us.loopexit, label %for.body12.us.us.us

for.cond.cleanup3.loopexit:                       ; preds = %for.cond.cleanup7
  br label %for.cond.cleanup3

for.cond.cleanup3:                                ; preds = %for.cond.cleanup3.loopexit, %for.cond1.preheader
  %indvars.iv.next300 = add nuw nsw i64 %indvars.iv299, 1
  %lftr.wideiv302 = trunc i64 %indvars.iv.next300 to i32
  %exitcond303 = icmp eq i32 %lftr.wideiv302, %height
  br i1 %exitcond303, label %for.cond.cleanup.loopexit, label %for.cond1.preheader

for.cond.cleanup7.loopexit:                       ; preds = %for.cond9.for.cond.cleanup11_crit_edge.us
  br label %for.cond.cleanup7

for.cond.cleanup7:                                ; preds = %for.cond.cleanup7.loopexit, %for.cond5.preheader
  %kSum.0.lcssa = phi i16 [ 0, %for.cond5.preheader ], [ %split.us, %for.cond.cleanup7.loopexit ]
  %rSum.0.lcssa = phi i16 [ 0, %for.cond5.preheader ], [ %split189.us, %for.cond.cleanup7.loopexit ]
  %cmp51 = icmp slt i16 %kSum.0.lcssa, 1
  %.kSum.0 = select i1 %cmp51, i16 1, i16 %kSum.0.lcssa
  %conv55 = sext i16 %.kSum.0 to i32
  %conv56 = sext i16 %rSum.0.lcssa to i32
  %div57 = sdiv i32 %conv56, %conv55
  %conv58 = trunc i32 %div57 to i16
  %cmp60 = icmp slt i16 %conv58, 0
  %.conv58 = select i1 %cmp60, i16 2, i16 %conv58
  %cmp65 = icmp sgt i16 %.conv58, 255
  %..conv58 = select i1 %cmp65, i16 255, i16 %.conv58
  %conv97 = trunc i16 %..conv58 to i8
  %17 = add nsw i64 %indvars.iv291, %5
  %18 = mul nsw i64 %17, 3
  %arrayidx103 = getelementptr inbounds i8, i8* %outputBytes, i64 %18
  store i8 %conv97, i8* %arrayidx103, align 1, !tbaa !1
  %19 = add nsw i64 %18, 1
  %arrayidx109 = getelementptr inbounds i8, i8* %outputBytes, i64 %19
  store i8 123, i8* %arrayidx109, align 1, !tbaa !1
  %20 = add nsw i64 %18, 2
  %arrayidx116 = getelementptr inbounds i8, i8* %outputBytes, i64 %20
  store i8 0, i8* %arrayidx116, align 1, !tbaa !1
  %indvars.iv.next292 = add nuw nsw i64 %indvars.iv291, 1
  %lftr.wideiv297 = trunc i64 %indvars.iv.next292 to i32
  %exitcond298 = icmp eq i32 %lftr.wideiv297, %width
  br i1 %exitcond298, label %for.cond.cleanup3.loopexit, label %for.cond5.preheader
}

attributes #0 = { norecurse nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.9.0 (tags/RELEASE_390/final 286251)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"omnipotent char", !3, i64 0}
!3 = !{!"Simple C/C++ TBAA"}
