import PackedNat
import PackedSSR
import PackedSetoid
import Mathlib.Data.Nat.Prime.Basic

noncomputable section
namespace InteropDemo
open PackedNat.NativeBridge
open PackedSSR.NativeBridge

abbrev MechanicalNat := PackedNat.Rocq.Corelib.Init.Datatypes.nat
abbrev MechanicalOption := PackedSSR.Rocq.Corelib.Init.Datatypes.option MechanicalNat

def increment (n : MechanicalNat) : MechanicalNat :=
  PackedNat.Rocq.Corelib.Init.Nat.add n (natOf 1)
def mechanicalInput (xs : Option Nat) : MechanicalOption :=
  optionOf (xs.map natOf)
def mechanicalMap (xs : Option Nat) : MechanicalOption :=
  PackedSSR.Rocq.Corelib.ssr.ssrfun.Option.map MechanicalNat MechanicalNat
    increment (mechanicalInput xs)

theorem mapped_add_one (xs : Option Nat) :
    (optionTo (mechanicalMap xs)).map natTo = xs.map (fun n => n + 1) := by
  unfold mechanicalMap mechanicalInput
  rw [PackedSSR.NativeBridge.Incremental.ssr_option_map_agrees, option_to_of]
  cases xs with
  | none => rfl
  | some n =>
    change some (natTo (PackedNat.Rocq.Corelib.Init.Nat.add (natOf n) (natOf 1))) =
      some (n + 1)
    rw [nat_add_agrees,natTo_of,natTo_of]

theorem mechanicalEqTheory :
    PackedSetoid.Rocq.Corelib.Setoids.Setoid.Setoid_Theory Nat (fun x y => x = y) :=
  (PackedSetoid.NativeBridge.Incremental.SetoidBridge.setoidTheoryIso Nat _).of
    ⟨fun _ => rfl, fun h => h.symm, fun h1 h2 => h1.trans h2⟩
def nativeSetoid : Setoid Nat :=
  ⟨(fun x y => x = y),
    (PackedSetoid.NativeBridge.Incremental.SetoidBridge.setoidTheoryIso Nat _).to mechanicalEqTheory⟩

theorem pipeline_into_quotient (xs : Option Nat) :
    ((optionTo (mechanicalMap xs)).map natTo).map (Quotient.mk nativeSetoid) =
      (xs.map (fun n => n + 1)).map (Quotient.mk nativeSetoid) :=
  congrArg (Option.map (Quotient.mk nativeSetoid)) (mapped_add_one xs)

theorem quotient_add_comm (n m : MechanicalNat) :
    Quotient.mk nativeSetoid (natTo (PackedNat.Rocq.Corelib.Init.Nat.add n m)) =
      Quotient.mk nativeSetoid (natTo (PackedNat.Rocq.Corelib.Init.Nat.add m n)) := by
  apply Quotient.sound
  change natTo (PackedNat.Rocq.Corelib.Init.Nat.add n m) =
    natTo (PackedNat.Rocq.Corelib.Init.Nat.add m n)
  rw [nat_add_agrees,nat_add_agrees,Nat.add_comm]

theorem mechanical_one_plus_one_prime :
    Nat.Prime (natTo (PackedNat.Rocq.Corelib.Init.Nat.add (natOf 1) (natOf 1))) := by
  simpa only [nat_add_agrees,natTo_of] using Nat.prime_two

end InteropDemo

open Lean in
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← getEnv
  let forbidden := #[`Rocq2LeanOut,`Iteration,`Nat,`SSR,`SetoidBridge]
  for n in env.header.moduleNames do
    if forbidden.contains n then throwError "Original conflicting module was imported: {n}"
  let mut roots : Array Json := #[]
  for n in [`InteropDemo.mapped_add_one,`InteropDemo.pipeline_into_quotient,
      `InteropDemo.quotient_add_comm,`InteropDemo.mechanical_one_plus_one_prime] do
    let axioms ← collectAxioms n
    for ax in axioms do
      unless [`propext,`Quot.sound,`Classical.choice].contains ax do
        throwError "Unexpected axiom {ax}"
    roots := roots.push (Json.mkObj [("name",.str n.toString),
      ("axioms",.arr (axioms.map (fun ax => .str ax.toString)))])
  IO.FS.writeFile "reports/interop/consumer.json" (Json.pretty (Json.mkObj [
    ("original_conflicting_imports",.arr #[]),("mathlib_theorem",.str "Nat.prime_two"),
    ("proofs",.arr roots)]))
