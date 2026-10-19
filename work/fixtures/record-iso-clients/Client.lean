import Rocq2LeanOut
universe u v
theorem sigma_identity (A : Type u) (P : A → Prop) (s : Rocq.Corelib.Init.Specif.sigT A P) :
 Rocq.CoreRecordFunctions2.Source.pass_sigma A P (fun _ s => s) s = s := by
 apply Rocq.Corelib.Init.Specif.sigT.rec (motive := fun s =>
   Rocq.CoreRecordFunctions2.Source.pass_sigma A P (fun _ s => s) s = s) _ s
 intro x h
 rfl
theorem pair_identity (A : Type u) (s : Rocq.Corelib.Init.Datatypes.prod A A) :
 Rocq.CoreRecordFunctions2.Source.pass_pair.{u,v} A (fun _ s => s) s = s := by
 apply Rocq.Corelib.Init.Datatypes.prod.rec (motive := fun s =>
   Rocq.CoreRecordFunctions2.Source.pass_pair.{u,v} A (fun _ s => s) s = s) _ s
 intro x y
 rfl
theorem sigma_constructor (A : Type u) (P : A → Prop) (x : A) (h : P x) :
 Rocq.CoreRecordFunctions2.Source.pass_sigma A P (fun _ s => s)
  (Rocq.Corelib.Init.Specif.sigT.existT A P x h) =
  Rocq.Corelib.Init.Specif.sigT.existT A P x h := rfl
theorem pair_constructor (A : Type u) (x y : A) :
 Rocq.CoreRecordFunctions2.Source.pass_pair.{u,v} A (fun _ s => s)
  (Rocq.Corelib.Init.Datatypes.prod.pair A A x y) =
  Rocq.Corelib.Init.Datatypes.prod.pair A A x y := rfl
#print axioms sigma_identity
#print axioms pair_identity
#print axioms sigma_constructor
#print axioms pair_constructor
#print axioms Rocq.CoreRecordFunctions2.Source.pass_sigma
#print axioms Rocq.CoreRecordFunctions2.Source.pass_pair
