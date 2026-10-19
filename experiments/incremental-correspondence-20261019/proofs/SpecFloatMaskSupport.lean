import SpecFloatNormalize
noncomputable section
namespace NativeBridge.Incremental.SpecFloatMaskSupport
open NativeBridge.Incremental.BinaryOrder
theorem subtractOne_agrees (p : RPositive) :
    positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.sub p .xH) = max 1 (positiveTo p-1) := by
  cases p with
  | xH => rfl
  | xI p =>
    change 2*positiveTo p = max 1 (2*positiveTo p+1-1)
    have hp := positiveTo_pos p
    omega
  | xO p =>
    change positiveTo (Rocq.Corelib.BinNums.PosDef.Pos.pred_double p) = max 1 (2*positiveTo p-1)
    rw [positive_pred_double_agrees]
    have hp := positiveTo_pos p
    omega
theorem positiveClamp_agrees (z : RIntBinary) :
    positiveTo (Rocq.Corelib.BinNums.IntDef.Z.to_pos z) = max 1 (binaryIntTo z).toNat := by
  cases z with
  | Z0 => rfl
  | Zpos p =>
    change positiveTo p = max 1 ((positiveTo p : Int)).toNat
    have := positiveTo_pos p
    omega
  | Zneg p => change 1 = max 1 (-(positiveTo p : Int)).toNat; omega
end NativeBridge.Incremental.SpecFloatMaskSupport
