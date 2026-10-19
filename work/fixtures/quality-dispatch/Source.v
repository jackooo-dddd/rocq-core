From Corelib Require Import Init.Datatypes Init.Specif Init.Logic.
Set Printing Universes.
Definition direct_prod_pp : Prop := prod True True.
Definition through_type_prod (A B : Type) : Type := prod A B.
Fail Definition through_type_prod_pp : Prop := through_type_prod True True.
Definition through_type_prod_pp_data : Type := through_type_prod True True.
Definition direct_sigma_pp : Prop := @sigT True (fun _ => True).
Definition through_type_sigma (A : Type) (B : A -> Type) : Type := @sigT A B.
Fail Definition through_type_sigma_pp : Prop := through_type_sigma True (fun _ => True).
Definition through_type_sigma_pp_data : Type := through_type_sigma True (fun _ => True).
Print direct_prod_pp.
Print through_type_prod.
Print direct_sigma_pp.
Print through_type_sigma.
