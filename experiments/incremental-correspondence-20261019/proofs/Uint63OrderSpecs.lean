import Uint63DefinitionSpecs
set_option maxHeartbeats 300000
noncomputable section
namespace NativeBridge.Incremental.Uint63OrderSpecs
open NativeBridge.Incremental.Uint63Operations
open NativeBridge.Incremental.Uint63Conversions
universe u
-- Comparison proof text rechecked in the Uint63Axioms source closure.
def compareCont (r : Ordering) (n m : Nat) : Ordering :=
  if n < m then .lt else if m < n then .gt else r

theorem cc_ii (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n+1) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oo (r : Ordering) (n m : Nat) :
    compareCont r n m = compareCont r (2*n) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_oi (r : Ordering) (n m : Nat) :
    compareCont .lt n m = compareCont r (2*n) (2*m+1) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem cc_io (r : Ordering) (n m : Nat) :
    compareCont .gt n m = compareCont r (2*n+1) (2*m) := by
  unfold compareCont
  repeat' first | split | omega | rfl

theorem compare_cont_agrees (r : RComparison) (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
      compareCont (comparisonTo r) (positiveTo p) (positiveTo q) := by
  induction q generalizing p r with
  | xI q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q+1)
      rw [ih]; exact cc_ii _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Lt p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q+1)
      rw [ih]; exact cc_oi _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q+1)
      have h : 1 < 2*positiveTo q+1 := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xO q ih =>
    cases p with
    | xI p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Gt p q) =
        compareCont (comparisonTo r) (2*positiveTo p+1) (2*positiveTo q)
      rw [ih]; exact cc_io _ _ _
    | xO p =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont r p q) =
        compareCont (comparisonTo r) (2*positiveTo p) (2*positiveTo q)
      rw [ih]; exact cc_oo _ _ _
    | xH =>
      change Ordering.lt = compareCont (comparisonTo r) 1 (2*positiveTo q)
      have h : 1 < 2*positiveTo q := by have := positiveTo_pos q; omega
      simp [compareCont,h]
  | xH =>
    cases p with
    | xI p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p+1) 1
      have h : 1 < 2*positiveTo p+1 := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xO p =>
      change Ordering.gt = compareCont (comparisonTo r) (2*positiveTo p) 1
      have h : 1 < 2*positiveTo p := by have := positiveTo_pos p; omega
      simp [compareCont,h,Nat.not_lt_of_ge (Nat.le_of_lt h)]
    | xH =>
      change comparisonTo r = compareCont (comparisonTo r) 1 1
      rfl

theorem positive_compare_agrees (p q : RPositive) :
    comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) = compare (positiveTo p) (positiveTo q) := by
  change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare_cont .Eq p q) = _
  rw [compare_cont_agrees, Nat.compare_eq_ite_lt]; rfl

theorem compare_ofNat (n m : Nat) :
    compare ((n : Int)) ((m : Int)) = compare n m := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]; simp
theorem compare_negNat (n m : Nat) :
    (compare n m).swap = compare (-(n : Int)) (-(m : Int)) := by
  rw [Int.compare_eq_ite_lt,Nat.compare_eq_ite_lt]
  repeat' first | split | omega | rfl

theorem z_compare_agrees (x y : RZ) :
    comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) =
      compare (zTo x) (zTo y) := by
  cases x with
  | Z0 =>
    cases y with
    | Z0 => rfl
    | Zpos p =>
      change Ordering.lt = compare 0 ((positiveTo p : Int))
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg p =>
      change Ordering.gt = compare 0 (-(positiveTo p : Int))
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zpos p =>
    cases y with
    | Z0 =>
      change Ordering.gt = compare ((positiveTo p : Int)) 0
      have h : 0 < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
    | Zpos q =>
      change comparisonTo (Rocq.Corelib.BinNums.PosDef.Pos.compare p q) =
        compare ((positiveTo p : Int)) ((positiveTo q : Int))
      rw [positive_compare_agrees,compare_ofNat]
    | Zneg q =>
      change Ordering.gt = compare ((positiveTo p : Int)) (-(positiveTo q : Int))
      have h : -(positiveTo q : Int) < (positiveTo p : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_neg (by omega), if_pos h]
  | Zneg p =>
    cases y with
    | Z0 =>
      change Ordering.lt = compare (-(positiveTo p : Int)) 0
      have h : -(positiveTo p : Int) < 0 := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zpos q =>
      change Ordering.lt = compare (-(positiveTo p : Int)) ((positiveTo q : Int))
      have h : -(positiveTo p : Int) < (positiveTo q : Int) := by have := positiveTo_pos p; omega
      rw [Int.compare_eq_ite_lt, if_pos h]
    | Zneg q =>
      change comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp (Rocq.Corelib.BinNums.PosDef.Pos.compare p q)) =
        compare (-(positiveTo p : Int)) (-(positiveTo q : Int))
      rw [compOpp_agrees,positive_compare_agrees,compare_negNat]

theorem mechanical_eq {A : Sort u} (x y : A) :
    Rocq.Corelib.Init.Logic.eq A x y ↔ x = y := by
  constructor
  · intro h; cases h; rfl
  · intro h; cases h; exact .eq_refl A x
theorem mechanical_not (P : Prop) : Rocq.Corelib.Init.Logic.not P ↔ ¬P := by
  constructor
  · intro h hp; cases h hp
  · intro h hp; exact (h hp).elim
theorem z_lt_agrees (x y : RZ) :
    Rocq.Corelib.BinNums.IntDef.Z.lt x y ↔ zTo x < zTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.lt
  rw [mechanical_eq,← comparisonIso.eq_iff]
  change comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.lt ↔ _
  rw [z_compare_agrees,Int.compare_eq_lt]
theorem z_le_agrees (x y : RZ) :
    Rocq.Corelib.BinNums.IntDef.Z.le x y ↔ zTo x ≤ zTo y := by
  unfold Rocq.Corelib.BinNums.IntDef.Z.le
  rw [mechanical_not,mechanical_eq,← comparisonIso.eq_iff]
  change (¬comparisonTo (Rocq.Corelib.BinNums.IntDef.Z.compare x y) = Ordering.gt) ↔ _
  rw [z_compare_agrees,Int.compare_eq_gt]; omega

def unsignedLtSpec : Prop := ∀ x y : Word,
  decide (x.toNat < y.toNat) = true ↔ Int.ofNat x.toNat < Int.ofNat y.toNat
def unsignedLeSpec : Prop := ∀ x y : Word,
  decide (x.toNat ≤ y.toNat) = true ↔ Int.ofNat x.toNat ≤ Int.ofNat y.toNat
theorem unsignedLtSpec_native : unsignedLtSpec := by intro x y; simp
theorem unsignedLeSpec_native : unsignedLeSpec := by intro x y; simp

theorem ltUnsigned (x y : Word) :
    Rocq.Corelib.BinNums.IntDef.Z.lt
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y) ↔ x.toNat < y.toNat := by
  rw [z_lt_agrees,toZ_agrees,toZ_agrees]
  simp [unsignedInteger]
theorem leUnsigned (x y : Word) :
    Rocq.Corelib.BinNums.IntDef.Z.le
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z x)
      (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z y) ↔ x.toNat ≤ y.toNat := by
  rw [z_le_agrees,toZ_agrees,toZ_agrees]
  simp [unsignedInteger]

theorem unsignedLtSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  have hb : Rocq.Corelib.Init.Logic.eq Rocq.Corelib.Init.Datatypes.bool
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y)
      Rocq.Corelib.Init.Datatypes.bool.true ↔ x.toNat < y.toNat := by
    constructor
    · intro h
      have hh := congrArg boolTo (eqTo h)
      rw [int63_ltb_agrees] at hh
      exact of_decide_eq_true hh
    · intro h
      apply eqOf
      apply NativeBridge.Incremental.Uint63Statements.boolInjective
      change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb x y) = true
      rw [int63_ltb_agrees]
      exact decide_eq_true h
  exact Rocq.Corelib.Init.Logic.and.conj _ _
    (fun h => (ltUnsigned x y).mpr (hb.mp h))
    (fun h => hb.mpr ((ltUnsigned x y).mp h))
theorem unsignedLtSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.ltb_spec.statement ↔ unsignedLtSpec :=
  ⟨fun _ => unsignedLtSpec_native,fun _ => unsignedLtSpec_proof⟩

theorem unsignedLeSpec_proof : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement := by
  change ∀ (x y : Word), _
  intro x y
  have hb : Rocq.Corelib.Init.Logic.eq Rocq.Corelib.Init.Datatypes.bool
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y)
      Rocq.Corelib.Init.Datatypes.bool.true ↔ x.toNat ≤ y.toNat := by
    constructor
    · intro h
      have hh := congrArg boolTo (eqTo h)
      rw [int63_leb_agrees] at hh
      exact of_decide_eq_true hh
    · intro h
      apply eqOf
      apply NativeBridge.Incremental.Uint63Statements.boolInjective
      change boolTo (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb x y) = true
      rw [int63_leb_agrees]
      exact decide_eq_true h
  exact Rocq.Corelib.Init.Logic.and.conj _ _
    (fun h => (leUnsigned x y).mpr (hb.mp h))
    (fun h => hb.mpr ((leUnsigned x y).mp h))
theorem unsignedLeSpec_correspondence : Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.leb_spec.statement ↔ unsignedLeSpec :=
  ⟨fun _ => unsignedLeSpec_native,fun _ => unsignedLeSpec_proof⟩

end NativeBridge.Incremental.Uint63OrderSpecs

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
  for name in ["NativeBridge.Incremental.Uint63OrderSpecs.unsignedLeSpec", "NativeBridge.Incremental.Uint63OrderSpecs.unsignedLtSpec"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
