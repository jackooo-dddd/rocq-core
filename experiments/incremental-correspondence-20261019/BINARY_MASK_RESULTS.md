# Binary Subtraction with mask: Batch 18

Added 15 completion roots: 1 types, 12 operations, 2 complete native statements. Accumulated 937 / 2180; 47 incremental profile current verification passed, and 666 incremental coverage certificates passed the joint import.

## Preserve source presentation information

mask corresponds to Option Nat Iso: IsNeg corresponds to none, IsNul corresponds to some 0, IsPos p corresponds some (positiveTo p). Source mask does not originally preserve the absolute value of negative differences; it does not pass off a many-to-one interpretation as a bijection.

double_mask and succ_double_mask correspond to the multiplication and multiplication under Option.map by one; double_pred_mask corresponds to some (2*n-2). sub_mask corresponds to if m ≤ n then some (n-m) else none, sub_mask_carry corresponds to n-(m+1). By generalizing both, the source recursion equations of all constructor branches are checked with rfl.

Pos.sub preserves saturation bounds for positive integers, targeting max 1 (n-m). N.sub corresponds to the saturated subtraction of ordinary Nat. Z.pos_sub, Z.add, and Z.sub correspond to the difference, addition, and subtraction of Int, and negative results are not truncated.

## elimination and statement

mask_rec corresponds to the elimination of the native Option/Nat branch, covering the pullback motive of Type-valued; mask_rect covers Sort u-valued motive. The original statements of mask_ind and mask_sind only contain Option Nat and positive natural number subtypes, passive symbols; the original original theorem proofs are not added in this batch.

The IntDef closure does not export Pos.add_carry / sub_mask_carry separately. The proof auxiliary definition switches from the outer first projection of the original mutual recursion result to the second projection; the code strictly checks this outer structure and preserves the inner recursive projection. All auxiliary constructor equations and final equations are still checked by kernel, the original mechanical functions are not modified, and no new axioms are introduced. BinaryMask is checked in the PosDef closure; BinaryNatSub is rechecked in the IntDef closure for the same subtraction invariants, and these auxiliary roots are not counted repeatedly.

## Workspace verification

The validator is now compiled in import dependency order; out-of-date dependencies and their consumers will be rebuilt when the selected module is run. Each record save relies on the source code and olean hash, and the report generator checks that they match the current product. Complete 47 increments profile have been recompiled, see reports/incremental-rebuild.json; this is not a full Corelib mechanical translation rerun, nor is it a complete recompile of the old baseline.

Main proof: BinaryMask.lean, BinaryMaskStatements.lean, BinaryArithmetic.lean, BinaryNatSub.lean. See reports/certificates.json for the exact certificate type and axiom closure.
