import Interface_Numbers_BinNums
set_option autoImplicit false
noncomputable section
namespace NativeBridge.Incremental.BinaryElimination
open NativeBridge
universe u
abbrev PositiveNat := {n : Nat // 0 < n}
abbrev positiveOdd (p : PositiveNat) : PositiveNat := ⟨2*p.1+1,by omega⟩
abbrev positiveEven (p : PositiveNat) : PositiveNat := ⟨2*p.1,by have := p.2; omega⟩
abbrev positiveOne : PositiveNat := ⟨1,by decide⟩

def natCases (P : Nat → Sort u) (zero : P 0) (pos : ∀ p : PositiveNat, P p.1) :
    ∀ n, P n
  | 0 => zero
  | n+1 => pos ⟨n+1,by omega⟩

theorem natCases_pos (P : Nat → Sort u) (zero : P 0) (pos : ∀ p : PositiveNat, P p.1)
    (p : PositiveNat) : natCases P zero pos p.1 = pos p := by
  obtain ⟨n,hn⟩ := p
  cases n with
  | zero => omega
  | succ n => rfl

def intCases (P : Int → Sort u) (zero : P 0)
    (pos : ∀ p : PositiveNat, P (Int.ofNat p.1))
    (neg : ∀ p : PositiveNat, P (-Int.ofNat p.1)) : ∀ z, P z
  | .ofNat 0 => zero
  | .ofNat (n+1) => pos ⟨n+1,by omega⟩
  | .negSucc n => neg ⟨n+1,by omega⟩

theorem intCases_pos (P : Int → Sort u) (zero : P 0)
    (pos : ∀ p : PositiveNat, P (Int.ofNat p.1))
    (neg : ∀ p : PositiveNat, P (-Int.ofNat p.1)) (p : PositiveNat) :
    intCases P zero pos neg (Int.ofNat p.1) = pos p := by
  obtain ⟨n,hn⟩ := p
  cases n with
  | zero => omega
  | succ n => rfl

theorem intCases_neg (P : Int → Sort u) (zero : P 0)
    (pos : ∀ p : PositiveNat, P (Int.ofNat p.1))
    (neg : ∀ p : PositiveNat, P (-Int.ofNat p.1)) (p : PositiveNat) :
    intCases P zero pos neg (-Int.ofNat p.1) = neg p := by
  obtain ⟨n,hn⟩ := p
  cases n with
  | zero => omega
  | succ n => rfl

theorem n_rect_agrees (P : Nat → Sort u) (zero : P 0)
    (pos : ∀ p : PositiveNat, P p.1) (n : RNatBinary) :
    Rocq.Corelib.Numbers.BinNums.N_rect (fun n => P (binaryNatTo n)) zero
      (fun p => pos (positiveIso.to p)) n = natCases P zero pos (binaryNatTo n) := by
  cases n with
  | N0 => rfl
  | Npos p => exact (natCases_pos P zero pos (positiveIso.to p)).symm

theorem n_rec_agrees (P : Nat → Type) (zero : P 0)
    (pos : ∀ p : PositiveNat, P p.1) (n : RNatBinary) :
    Rocq.Corelib.Numbers.BinNums.N_rec (fun n => P (binaryNatTo n)) zero
      (fun p => pos (positiveIso.to p)) n = natCases P zero pos (binaryNatTo n) :=
  n_rect_agrees P zero pos n

theorem z_rect_agrees (P : Int → Sort u) (zero : P 0)
    (pos : ∀ p : PositiveNat, P (Int.ofNat p.1))
    (neg : ∀ p : PositiveNat, P (-Int.ofNat p.1)) (z : RIntBinary) :
    Rocq.Corelib.Numbers.BinNums.Z_rect (fun z => P (binaryIntTo z)) zero
      (fun p => pos (positiveIso.to p)) (fun p => neg (positiveIso.to p)) z =
        intCases P zero pos neg (binaryIntTo z) := by
  cases z with
  | Z0 => rfl
  | Zpos p => exact (intCases_pos P zero pos neg (positiveIso.to p)).symm
  | Zneg p => exact (intCases_neg P zero pos neg (positiveIso.to p)).symm

theorem z_rec_agrees (P : Int → Type) (zero : P 0)
    (pos : ∀ p : PositiveNat, P (Int.ofNat p.1))
    (neg : ∀ p : PositiveNat, P (-Int.ofNat p.1)) (z : RIntBinary) :
    Rocq.Corelib.Numbers.BinNums.Z_rec (fun z => P (binaryIntTo z)) zero
      (fun p => pos (positiveIso.to p)) (fun p => neg (positiveIso.to p)) z =
        intCases P zero pos neg (binaryIntTo z) :=
  z_rect_agrees P zero pos neg z

def positiveRec (P : PositiveNat → Sort u)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne)
    (p : PositiveNat) : P p :=
  if h : p.1 = 1 then
    (show positiveOne = p from Subtype.ext h.symm) ▸ one
  else
    have hp := p.2
    let q : PositiveNat := ⟨p.1/2,by omega⟩
    if he : p.1%2 = 0 then
      (show positiveEven q = p from Subtype.ext (by dsimp [positiveEven,q]; omega)) ▸
        even q (positiveRec P odd even one q)
    else
      (show positiveOdd q = p from Subtype.ext (by dsimp [positiveOdd,q]; omega)) ▸
        odd q (positiveRec P odd even one q)
termination_by p.1
decreasing_by all_goals exact Nat.div_lt_self p.2 (by decide)

theorem step_cast (P : PositiveNat → Sort u) (F : PositiveNat → PositiveNat)
    (f : ∀ p, P (F p)) (q p : PositiveNat) (h : q = p) (he : F q = F p) :
    he ▸ f q = f p := by
  cases h
  rfl

theorem positiveRec_one (P : PositiveNat → Sort u)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne) :
    positiveRec P odd even one positiveOne = one := by
  rw [positiveRec]
  simp [positiveOne]

theorem positiveRec_odd (P : PositiveNat → Sort u)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne) (p : PositiveNat) :
    positiveRec P odd even one (positiveOdd p) = odd p (positiveRec P odd even one p) := by
  rw [positiveRec]
  have hp := p.2
  have h : (positiveOdd p).1 ≠ 1 := by dsimp [positiveOdd]; omega
  have hm : (positiveOdd p).1%2 ≠ 0 := by dsimp [positiveOdd]; omega
  have hd : (positiveOdd p).1/2 = p.1 := by dsimp [positiveOdd]; omega
  simp only [dif_neg h,dif_neg hm]
  exact step_cast P positiveOdd (fun q => odd q (positiveRec P odd even one q)) _ p
    (Subtype.ext hd) _

theorem positiveRec_even (P : PositiveNat → Sort u)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne) (p : PositiveNat) :
    positiveRec P odd even one (positiveEven p) = even p (positiveRec P odd even one p) := by
  rw [positiveRec]
  have hp := p.2
  have h : (positiveEven p).1 ≠ 1 := by dsimp [positiveEven]; omega
  have hm : (positiveEven p).1%2 = 0 := by dsimp [positiveEven]; omega
  have hd : (positiveEven p).1/2 = p.1 := by dsimp [positiveEven]; omega
  simp only [dif_neg h,dif_pos hm]
  exact step_cast P positiveEven (fun q => even q (positiveRec P odd even one q)) _ p
    (Subtype.ext hd) _

theorem positive_rect_agrees (P : PositiveNat → Sort u)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne) (p : RPositive) :
    Rocq.Corelib.Numbers.BinNums.positive_rect (fun p => P (positiveIso.to p))
      (fun p ih => odd (positiveIso.to p) ih)
      (fun p ih => even (positiveIso.to p) ih) one p =
      positiveRec P odd even one (positiveIso.to p) := by
  induction p with
  | xI p ih =>
    change odd (positiveIso.to p) _ = positiveRec P odd even one (positiveOdd (positiveIso.to p))
    rw [positiveRec_odd]
    exact congrArg (odd (positiveIso.to p)) ih
  | xO p ih =>
    change even (positiveIso.to p) _ = positiveRec P odd even one (positiveEven (positiveIso.to p))
    rw [positiveRec_even]
    exact congrArg (even (positiveIso.to p)) ih
  | xH => exact (positiveRec_one P odd even one).symm

theorem positive_rec_agrees (P : PositiveNat → Type)
    (odd : ∀ p, P p → P (positiveOdd p))
    (even : ∀ p, P p → P (positiveEven p)) (one : P positiveOne) (p : RPositive) :
    Rocq.Corelib.Numbers.BinNums.positive_rec (fun p => P (positiveIso.to p))
      (fun p ih => odd (positiveIso.to p) ih)
      (fun p ih => even (positiveIso.to p) ih) one p =
      positiveRec P odd even one (positiveIso.to p) :=
  positive_rect_agrees P odd even one p

def positiveInduction : Prop :=
  ∀ P : PositiveNat → Prop,
    (∀ p, P p → P (positiveOdd p)) →
    (∀ p, P p → P (positiveEven p)) →
    P positiveOne → ∀ p, P p
def natInduction : Prop :=
  ∀ P : Nat → Prop, P 0 → (∀ p : PositiveNat, P p.1) → ∀ n, P n
def intInduction : Prop :=
  ∀ P : Int → Prop, P 0 →
    (∀ p : PositiveNat, P (Int.ofNat p.1)) →
    (∀ p : PositiveNat, P (-Int.ofNat p.1)) → ∀ z, P z

theorem positive_ind_native : positiveInduction :=
  fun P odd even one p => positiveRec P odd even one p
theorem n_ind_native : natInduction :=
  fun P zero pos n => natCases P zero pos n
theorem z_ind_native : intInduction :=
  fun P zero pos neg z => intCases P zero pos neg z

theorem positive_ind_proof : Rocq.Corelib.Numbers.BinNums.positive_ind.statement := by
  intro P odd even one p
  induction p with
  | xI p ih => exact odd p ih
  | xO p ih => exact even p ih
  | xH => exact one
theorem positive_sind_proof : Rocq.Corelib.Numbers.BinNums.positive_sind.statement :=
  positive_ind_proof
theorem n_ind_proof : Rocq.Corelib.Numbers.BinNums.N_ind.statement := by
  intro P zero pos n
  cases n with
  | N0 => exact zero
  | Npos p => exact pos p
theorem n_sind_proof : Rocq.Corelib.Numbers.BinNums.N_sind.statement := n_ind_proof
theorem z_ind_proof : Rocq.Corelib.Numbers.BinNums.Z_ind.statement := by
  intro P zero pos neg z
  cases z with
  | Z0 => exact zero
  | Zpos p => exact pos p
  | Zneg p => exact neg p
theorem z_sind_proof : Rocq.Corelib.Numbers.BinNums.Z_sind.statement := z_ind_proof

theorem positive_ind_correspondence :
    Rocq.Corelib.Numbers.BinNums.positive_ind.statement ↔ positiveInduction :=
  ⟨fun _ => positive_ind_native,fun _ => positive_ind_proof⟩
theorem positive_sind_correspondence :
    Rocq.Corelib.Numbers.BinNums.positive_sind.statement ↔ positiveInduction :=
  ⟨fun _ => positive_ind_native,fun _ => positive_sind_proof⟩
theorem n_ind_correspondence :
    Rocq.Corelib.Numbers.BinNums.N_ind.statement ↔ natInduction :=
  ⟨fun _ => n_ind_native,fun _ => n_ind_proof⟩
theorem n_sind_correspondence :
    Rocq.Corelib.Numbers.BinNums.N_sind.statement ↔ natInduction :=
  ⟨fun _ => n_ind_native,fun _ => n_sind_proof⟩
theorem z_ind_correspondence :
    Rocq.Corelib.Numbers.BinNums.Z_ind.statement ↔ intInduction :=
  ⟨fun _ => z_ind_native,fun _ => z_ind_proof⟩
theorem z_sind_correspondence :
    Rocq.Corelib.Numbers.BinNums.Z_sind.statement ↔ intInduction :=
  ⟨fun _ => z_ind_native,fun _ => z_sind_proof⟩

-- A dependent consumer: the result type Fin (n+1) changes with the input.
def natBounded (n : Nat) : Fin (n+1) :=
  natCases (fun k => Fin (k+1)) ⟨0,by decide⟩
    (fun p => ⟨p.1,by omega⟩) n

theorem n_rect_dependent_example (n : RNatBinary) :
    Rocq.Corelib.Numbers.BinNums.N_rect (fun n => Fin (binaryNatTo n+1))
      ⟨0,by decide⟩ (fun p => ⟨positiveTo p,by change positiveTo p < positiveTo p+1; omega⟩) n = natBounded (binaryNatTo n) :=
  n_rect_agrees (fun k => Fin (k+1)) ⟨0,by decide⟩ (fun p => ⟨p.1,by omega⟩) n

end NativeBridge.Incremental.BinaryElimination

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
  for name in ["NativeBridge.Incremental.BinaryElimination.positiveRec", "NativeBridge.Incremental.BinaryElimination.natCases", "NativeBridge.Incremental.BinaryElimination.intCases", "NativeBridge.Incremental.BinaryElimination.positiveInduction", "NativeBridge.Incremental.BinaryElimination.natInduction", "NativeBridge.Incremental.BinaryElimination.intInduction"] do
    let n := name.toName
    let ci ← getConstInfo n
    let some body := ci.value? | throwError "Expected native definition"
    let refs := (← indexedNativeRefs body) ++ (← indexedNativeRefs ci.type)
    unless refs.isEmpty do throwError "Residual source references: {refs}"
    let expression ← Lean.Meta.ppExpr body
    logInfo ("NATIVE_TARGET " ++ (Json.compress (Json.mkObj [
      ("name", .str n.toString), ("native_expression", .str expression.pretty),
      ("remaining_source_symbols", .arr #[])])))
