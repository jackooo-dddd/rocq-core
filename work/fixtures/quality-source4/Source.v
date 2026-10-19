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
Definition mk_prod_p (a : True) (b : True) : @prod True True := @pair True True a b.
Definition use_prod_p (x : @prod True True) : nat := match x with @pair _ _ a b => O end.
Definition mk_prod_t (a : nat) (b : True) : @prod nat True := @pair nat True a b.
Definition use_prod_t (x : @prod nat True) : nat := match x with @pair _ _ a b => a end.
Definition mk_sig_p (a : True) (b : True) : @sig True (fun _ => True) := @exist True (fun _ => True) a b.
Definition use_sig_p (x : @sig True (fun _ => True)) : nat := match x with @exist _ _ a b => O end.
Definition mk_sig_t (a : nat) (b : True) : @sig nat (fun _ => True) := @exist nat (fun _ => True) a b.
Definition use_sig_t (x : @sig nat (fun _ => True)) : nat := match x with @exist _ _ a b => a end.
Definition mk_sig2_p (a : True) (b c : True) : @sig2 True (fun _ => True) (fun _ => True) := @exist2 True (fun _ => True) (fun _ => True) a b c.
Definition use_sig2_p (x : @sig2 True (fun _ => True) (fun _ => True)) : nat := match x with @exist2 _ _ _ a b c => O end.
Definition mk_sig2_t (a : nat) (b c : True) : @sig2 nat (fun _ => True) (fun _ => True) := @exist2 nat (fun _ => True) (fun _ => True) a b c.
Definition use_sig2_t (x : @sig2 nat (fun _ => True) (fun _ => True)) : nat := match x with @exist2 _ _ _ a b c => a end.
Definition mk_sigT_p (a : True) (b : True) : @sigT True (fun _ => True) := @existT True (fun _ => True) a b.
Definition use_sigT_p (x : @sigT True (fun _ => True)) : nat := match x with @existT _ _ a b => O end.
Definition mk_sigT_t (a : nat) (b : True) : @sigT nat (fun _ => True) := @existT nat (fun _ => True) a b.
Definition use_sigT_t (x : @sigT nat (fun _ => True)) : nat := match x with @existT _ _ a b => a end.
Definition mk_sigT2_p (a : True) (b c : True) : @sigT2 True (fun _ => True) (fun _ => True) := @existT2 True (fun _ => True) (fun _ => True) a b c.
Definition use_sigT2_p (x : @sigT2 True (fun _ => True) (fun _ => True)) : nat := match x with @existT2 _ _ _ a b c => O end.
Definition mk_sigT2_t (a : nat) (b c : True) : @sigT2 nat (fun _ => True) (fun _ => True) := @existT2 nat (fun _ => True) (fun _ => True) a b c.
Definition use_sigT2_t (x : @sigT2 nat (fun _ => True) (fun _ => True)) : nat := match x with @existT2 _ _ _ a b c => a end.
