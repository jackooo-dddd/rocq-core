import BinaryPower
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.BinaryIterOp
open NativeBridge BinaryPower
universe u v

/-- Binary parenthesization for an arbitrary operation. Zero is an unused
extension; positive inputs preserve the exact source bracketing. -/
def iterOpNative {A : Sort u} (op : A → A → A) (n : Nat) (a : A) : A :=
  if h : n ≤ 1 then a
  else if n % 2 = 0 then iterOpNative op (n/2) (op a a)
  else op a (iterOpNative op (n/2) (op a a))
termination_by n
decreasing_by all_goals exact Nat.div_lt_self (by omega) (by decide)

theorem iterOp_bit0 {A : Sort u} (op : A → A → A) (n : Nat) (a : A) (hn : 0 < n) :
    iterOpNative op (2*n) a = iterOpNative op n (op a a) := by
  rw [iterOpNative]
  have h : ¬2*n ≤ 1 := by omega
  have hd : 2*n/2 = n := by omega
  have hm : 2*n%2 = 0 := by omega
  simp [h,hm,hd]

theorem iterOp_bit1 {A : Sort u} (op : A → A → A) (n : Nat) (a : A) (hn : 0 < n) :
    iterOpNative op (2*n+1) a = op a (iterOpNative op n (op a a)) := by
  rw [iterOpNative]
  have h : ¬2*n+1 ≤ 1 := by omega
  have hd : (2*n+1)/2 = n := by omega
  simp [h,hd]

theorem iter_op_transport {A : Sort u} {B : Sort v}
    (toB : A → B) (op : A → A → A) (nativeOp : B → B → B)
    (step : ∀ a b, toB (op a b) = nativeOp (toB a) (toB b)) (p : RPositive) (a : A) :
    toB (Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a) =
      iterOpNative nativeOp (positiveTo p) (toB a) := by
  induction p generalizing a with
  | xI p ih =>
    change toB (op a (Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p (op a a))) = _
    rw [step,ih,step,positiveTo_xI,iterOp_bit1 _ _ _ (positiveTo_pos p)]
  | xO p ih =>
    change toB (Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p (op a a)) = _
    rw [ih,step,positiveTo_xO,iterOp_bit0 _ _ _ (positiveTo_pos p)]
  | xH =>
    simp [Rocq.Corelib.BinNums.PosDef.Pos.iter_op,positiveTo_xH,iterOpNative]

theorem iter_op_agrees {A : Sort u} (op : A → A → A) (p : RPositive) (a : A) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a =
      iterOpNative op (positiveTo p) a :=
  iter_op_transport id op op (fun _ _ => rfl) p a

theorem iter_op_nat_add (p : RPositive) (a : Nat) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.add p a = positiveTo p * a := by
  induction p generalizing a with
  | xI p ih =>
    change a+Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.add p (a+a) = (2*positiveTo p+1)*a
    rw [ih]
    simp only [Nat.mul_add,Nat.add_mul,Nat.one_mul,Nat.mul_assoc]
    omega
  | xO p ih =>
    change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.add p (a+a) = (2*positiveTo p)*a
    rw [ih]
    simp only [Nat.mul_add,Nat.mul_assoc]
    omega
  | xH => simp [Rocq.Corelib.BinNums.PosDef.Pos.iter_op,positiveTo_xH]

theorem iter_op_nat_mul (p : RPositive) (a : Nat) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.mul p a = a ^ positiveTo p := by
  induction p generalizing a with
  | xI p ih =>
    change a*Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.mul p (a*a) = a^(2*positiveTo p+1)
    rw [ih,Nat.mul_pow,Nat.pow_succ,show 2*positiveTo p = positiveTo p+positiveTo p by omega,Nat.pow_add]
    ac_rfl
  | xO p ih =>
    change Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat Nat.mul p (a*a) = a^(2*positiveTo p)
    rw [ih,Nat.mul_pow,show 2*positiveTo p = positiveTo p+positiveTo p by omega,Nat.pow_add]
  | xH => simp [Rocq.Corelib.BinNums.PosDef.Pos.iter_op,positiveTo_xH]

theorem repeat_square {A : Sort u} (op : A → A → A)
    (assoc : ∀ x y z, op (op x y) z = op x (op y z)) (a : A) (n : Nat) :
    repeatNative (op (op a a)) n (op a a) = repeatNative (op a) (2*n+1) a := by
  induction n with
  | zero => rfl
  | succ n ih =>
    rw [repeat_succ,ih,assoc]
    have he : 2*(n+1)+1 = (2*n+1)+1+1 := by omega
    rw [he]
    simp only [repeat_succ]

theorem iter_op_associative {A : Sort u} (op : A → A → A)
    (assoc : ∀ x y z, op (op x y) z = op x (op y z)) (p : RPositive) (a : A) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a =
      repeatNative (op a) (positiveTo p-1) a := by
  induction p generalizing a with
  | xI p ih =>
    change op a (Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p (op a a)) =
      repeatNative (op a) ((2*positiveTo p+1)-1) a
    rw [ih,repeat_square op assoc]
    have hp := positiveTo_pos p
    have he : 2*positiveTo p+1-1 = (2*(positiveTo p-1)+1)+1 := by omega
    rw [he]
    simp only [repeat_succ]
  | xO p ih =>
    change Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p (op a a) =
      repeatNative (op a) ((2*positiveTo p)-1) a
    rw [ih,repeat_square op assoc]
    have hp := positiveTo_pos p
    have he : 2*positiveTo p-1 = 2*(positiveTo p-1)+1 := by omega
    rw [he]
  | xH => rfl

theorem repeat_foldr {A : Type u} (op : A → A → A) (a : A) (n : Nat) :
    repeatNative (op a) n a = List.foldr op a (List.replicate n a) := by
  induction n with
  | zero => rfl
  | succ n ih => simp [repeat_succ,List.replicate_succ,ih]

theorem iter_op_foldr {A : Type u} (op : A → A → A)
    (assoc : ∀ x y z, op (op x y) z = op x (op y z)) (p : RPositive) (a : A) :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op A op p a =
      List.foldr op a (List.replicate (positiveTo p-1) a) := by
  rw [iter_op_associative op assoc,repeat_foldr]

-- Without associativity, replacing binary bracketing by a linear fold is false.
theorem nonassociative_counterexample :
    Rocq.Corelib.BinNums.PosDef.Pos.iter_op Nat (fun a b => a+2*b) (.xO (.xO .xH)) 5 = 45 ∧
      List.foldr (fun a b => a+2*b) 5 (List.replicate 3 5) = 75 := by
  decide +kernel

end NativeBridge.Incremental.BinaryIterOp

open Lean Meta Elab Command
private partial def indexedNativeRefs (e : Expr) (seen : NameSet := {}) : MetaM (Array Name) := do
  let mut found : Array Name := #[]
  let mut seen := seen
  for n in e.getUsedConstants do
    if seen.contains n then continue
    seen := seen.insert n
    let s := n.toString
    if s.startsWith "Rocq." || s.startsWith "RocqPending." || s.startsWith "Rocq2Lean." then
      found := found.push n
    else if s.startsWith "NativeBridge." then
      let ci ← getConstInfo n
      let body? := match ci with
        | .defnInfo v => some v.value
        | .thmInfo v => some v.value
        | .opaqueInfo v => some v.value
        | _ => none
      if let some body := body? then
        found := found ++ (← indexedNativeRefs body seen)
  return found


open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  for name in ["NativeBridge.Incremental.BinaryIterOp.iterOpNative", "Nat.mul", "Nat.pow", "List.foldr"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
