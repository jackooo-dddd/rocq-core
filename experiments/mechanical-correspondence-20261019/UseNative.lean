
import UnifiedInterfaces
set_option autoImplicit false
noncomputable section
namespace NativeBridge
theorem demo_source_eq_add_comm (n m : MN) :
 ME MN (Rocq.Corelib.Init.Nat.add n m) (Rocq.Corelib.Init.Nat.add m n) :=
 eqOf (translated_add_comm n m)
theorem demo_native_add (n m : Nat) :
 Interfaces.Rocq.Corelib.Init.Nat.add.native n m = n+m := by
 change natTo (Rocq.Corelib.Init.Nat.add (natOf n) (natOf m)) = _
 rw [nat_add_agrees,natTo_of,natTo_of]
theorem demo_nat_list_roundtrip (xs : Rocq.Corelib.Init.Datatypes.list MN) :
 ((listIso MN).trans (Iso.lists natIso)).of
   (((listIso MN).trans (Iso.lists natIso)).to xs) = xs :=
 ((listIso MN).trans (Iso.lists natIso)).of_to xs
theorem demo_list_length (xs : Rocq.Corelib.Init.Datatypes.list MN) :
 natTo (Rocq.Corelib.Init.Datatypes.length MN xs) =
   ((listTo xs).map natTo).length := by rw [length_agrees,List.length_map]
theorem demo_binary_int_mul (x y : RIntBinary) :
 binaryIntTo (Rocq.Corelib.BinNums.IntDef.Z.mul x y) = binaryIntTo y * binaryIntTo x := by
 rw [int_mul_agrees,Int.mul_comm]
end NativeBridge
run_cmd Lean.Elab.Command.liftTermElabM do
  let env ← Lean.getEnv
  let mut rows : Array Lean.Json := #[]
  for (n, ci) in env.constants.toList do
    if n.toString.startsWith "NativeBridge." then
      if ci.isDefinition || ci.isTheorem then
        let axs ← Lean.collectAxioms n
        for ax in axs do
          unless ["propext", "Quot.sound", "Classical.choice"].contains ax.toString do
            throwError "Unapproved axiom in {n}: {ax}"
        let ty ← Lean.Meta.ppExpr ci.type
        let mut bodyRefs : Array Lean.Json := #[]
        let mut bodyText := ""
        if n.toString.endsWith ".native" then
          if let some body := ci.value? then
            bodyText := (← Lean.Meta.ppExpr body).pretty
            for r in body.getUsedConstants do
              if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
                bodyRefs := bodyRefs.push (.str r.toString)
        let mut refs : Array Lean.Json := #[]
        for r in ci.type.getUsedConstants do
          if r.toString.startsWith "Rocq." || r.toString.startsWith "RocqPending." || r.toString.startsWith "Rocq2Lean." then
            refs := refs.push (.str r.toString)
        rows := rows.push (Lean.Json.mkObj [
          ("name", .str n.toString),
          ("kind", .str (if ci.isTheorem then "theorem" else "definition")),
          ("type", .str ty.pretty),
          ("source_references", .arr refs),
          ("native_body", .str bodyText),
          ("remaining_source_symbols", .arr bodyRefs),
          ("axioms", .arr (axs.map (fun a => .str a.toString)))])
  IO.FS.writeFile "/home/shunqwang4/research/rocq-core/experiments/mechanical-correspondence-20261019/audits/UseNative.json" (Lean.Json.pretty (.arr rows))
