From Corelib Require Import Init.Datatypes Init.Specif.
Definition prod_pp : Prop := prod True True.
Definition prod_pt : Type := prod True nat.
Definition prod_tp : Type := prod nat True.
Definition prod_tt : Type := prod nat bool.
Definition sig_p : Prop := @sig True (fun _ => True).
Definition sig_t : Type := @sig nat (fun _ => True).
Definition sig2_p : Prop := @sig2 True (fun _ => True) (fun _ => True).
Definition sig2_t : Type := @sig2 nat (fun _ => True) (fun _ => True).
Definition sigT_pp : Prop := @sigT True (fun _ => True).
Definition sigT_pt : Type := @sigT True (fun _ => nat).
Definition sigT_tp : Type := @sigT nat (fun _ => True).
Definition sigT_tt : Type := @sigT nat (fun _ => nat).
Definition sigT2_ppp : Prop := @sigT2 True (fun _ => True) (fun _ => True).
Definition sigT2_ppt : Type := @sigT2 True (fun _ => True) (fun _ => nat).
Definition sigT2_ptp : Type := @sigT2 True (fun _ => nat) (fun _ => True).
Definition sigT2_ptt : Type := @sigT2 True (fun _ => nat) (fun _ => nat).
Definition sigT2_tpp : Type := @sigT2 nat (fun _ => True) (fun _ => True).
Definition sigT2_tpt : Type := @sigT2 nat (fun _ => True) (fun _ => nat).
Definition sigT2_ttp : Type := @sigT2 nat (fun _ => nat) (fun _ => True).
Definition sigT2_ttt : Type := @sigT2 nat (fun _ => nat) (fun _ => nat).
Definition through_type_prod (A B : Type) : Type := prod A B.
Definition through_type_sigma (A : Type) (P : A -> Type) : Type := @sigT A P.
Definition nested_direct_pp : Prop := prod (prod True True) True.
Definition nested_annotated : Type := prod (through_type_prod True True) True.
Definition forall_prop : Prop := prod (forall _ : nat, True) True.
Definition forall_type : Type := prod (forall _ : nat, nat) True.
Definition let_annotated (A : Type) : Type := let B : Type := True in prod B A.
Definition let_prop : Prop := let B : Prop := True in prod B True.
Definition case_prop (b : bool) : Prop := prod (if b then True else False) True.
Definition case_type (b : bool) : Type := prod (if b then nat else bool) True.
Definition recurse_prop (n : nat) : Prop :=
  prod ((fix F (k : nat) : Prop := match k with O => True | S j => F j end) n) True.
Definition recurse_type (n : nat) : Type :=
  prod ((fix F (k : nat) : Type := match k with O => nat | S j => F j end) n) True.
Definition dependent_family (A : Type) (P : A -> Prop) : Type := @sigT A P.
Definition dependent_proof_family (A : Prop) (P : A -> Prop) : Prop := @sigT A P.
