from pathlib import Path
W=Path(__file__).resolve().parent
cases=[
 ('bool','','RBool','Bool','boolTo','boolOf','boolIso'),
 ('comparison','','RComparison','Ordering','comparisonTo','comparisonOf','comparisonIso'),
 ('unit','','Rocq.Corelib.Init.Datatypes.unit','Unit','unitIso.to','unitIso.of','unitIso'),
 ('empty','','Rocq.Corelib.Init.Datatypes.Empty_set','Empty','emptyIso.to','emptyIso.of','emptyIso'),
 ('list','{A : Sort u}','Rocq.Corelib.Init.Datatypes.list A','List (PLift A)','fullListTo','fullListOf','fullListIso A'),
 ('option','{A : Sort u}','Rocq.Corelib.Init.Datatypes.option A','Option (PLift A)','fullOptionTo','fullOptionOf','fullOptionIso A'),
 ('result','{A : Sort u} {E : Sort v}','Rocq.Corelib.Init.Datatypes.result A E','Except (PLift E) (PLift A)','fullResultTo','fullResultOf','fullResultIso A E'),
 ('prod','{A : Sort u} {B : Sort v}','Rocq.Corelib.Init.Datatypes.prod A B','PProd A B','pprodTo','pprodOf','pprodIso A B'),
 ('sum','{A : Sort u} {B : Sort v}','Rocq.Corelib.Init.Datatypes.sum A B','PSum A B','psumTo','psumOf','psumIso A B')]
s='import DatatypeNormalization\nnoncomputable section\nnamespace NativeBridge.Incremental.DatatypeQuantifiers\nopen NativeBridge NativeBridge.Incremental NativeBridge.Incremental.DatatypeNormalization\nuniverse u v w\n'
for label,binders,src,native,to,of,iso in cases:
 s+=f"""
theorem {label}_of_to {binders} (x : {src}) : {of} ({to} x) = x := ({iso}).of_to x
theorem {label}_to_of {binders} (x : {native}) : {to} ({of} x) = x := ({iso}).to_of x
theorem {label}_forall {binders} (P : {src} → Prop) :
    (∀ x, P x) ↔ ∀ x : {native}, P ({of} x) := by
  constructor
  · intro h x; exact h _
  · intro h x; simpa only [{label}_of_to] using h ({to} x)
theorem {label}_family_forall {binders} {{C : Sort w}} (F : ({src} → C) → Prop) :
    (∀ f, F f) ↔ ∀ f : {native} → C, F (fun x => f ({to} x)) := by
  constructor
  · intro h f; exact h _
  · intro h f; simpa only [{label}_of_to] using h (fun x => f ({of} x))
theorem {label}_eq {binders} (x y : {src}) :
    (x=y) ↔ {to} x = {to} y := (({iso}).eq_iff x y).symm
"""
s+='\nend NativeBridge.Incremental.DatatypeQuantifiers\n'
(W/'proofs/DatatypeQuantifiers.lean').write_text(s)
