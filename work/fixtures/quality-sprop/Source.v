From Corelib Require Import Init.Datatypes Init.Specif.
Inductive ST : SProp := st.
Definition prod_ss := @prod ST ST.
Definition prod_sp := @prod ST True.
Definition prod_st := @prod ST nat.
Definition sig_s := @sig ST (fun _ => True).
Definition sig2_s := @sig2 ST (fun _ => True) (fun _ => True).
Definition sigT_ss := @sigT ST (fun _ => ST).
Definition sigT_sp := @sigT ST (fun _ => True).
Definition sigT_st := @sigT ST (fun _ => nat).
Definition sigT_ps := @sigT True (fun _ => ST).
Definition sigT_ts := @sigT nat (fun _ => ST).
Definition sigT2_sss := @sigT2 ST (fun _ => ST) (fun _ => ST).
Definition sigT2_sps := @sigT2 ST (fun _ => True) (fun _ => ST).
Definition sigT2_sst := @sigT2 ST (fun _ => ST) (fun _ => nat).
