From Corelib.Numbers.Cyclic.Int63 Require Import PrimInt63.
From Corelib.Floats Require Import PrimFloat.
Require Corelib.Strings.PrimString.
From MetaRocq.Utils Require Import utils.
From MetaRocq.Template Require Import All.
From Rocq2LeanRoundTrip Require Import RtEq.
Require Corelib.Array.PrimArray.
Import MonadNotation.
Open Scope bs_scope.

Definition rt_0 : constant_body := {| cst_type := (tProd {| binder_name := nAnon; binder_relevance := Relevant |} (tSort (sType (Universe.from_kernel_repr ((Level.lvar 0), 0) []))) (tSort (sType (Universe.from_kernel_repr ((Level.lvar 0), 0) [])))); cst_body := None; cst_universes := (Polymorphic_ctx ([(nNamed "u"%bs)], (List.fold_right ConstraintSet.add ConstraintSet.empty []))); cst_relevance := Relevant |}.
MetaRocq Run (tmBind (tmQuoteConstant ((MPfile ["PrimArray"%bs; "Array"%bs; "Corelib"%bs]), "array"%bs) true) (fun cb : constant_body => tmBind (tmEval all (cb_eqb cb rt_0)) (fun b : bool => tmBind (tmQuoteConstant ((MPfile ["PrimArray"%bs; "Array"%bs; "Corelib"%bs]), "array"%bs) false) (fun cb' : constant_body => tmBind (tmEval all (match cst_body cb' with None => true | Some _ => false end)) (fun h : bool => if b then (if Bool.eqb h true then tmMsg "RT_OK 0" else tmMsg "RT_OPACITY_MISMATCH 0") else tmMsg "RT_MISMATCH 0"))))).
Definition rt_3 : constant_body := {| cst_type := (tSort (sType (Universe.from_kernel_repr (Level.lzero, 0) []))); cst_body := None; cst_universes := Monomorphic_ctx; cst_relevance := Relevant |}.
MetaRocq Run (tmBind (tmQuoteConstant ((MPfile ["PrimInt63"%bs; "Int63"%bs; "Cyclic"%bs; "Numbers"%bs; "Corelib"%bs]), "int"%bs) true) (fun cb : constant_body => tmBind (tmEval all (cb_eqb cb rt_3)) (fun b : bool => tmBind (tmQuoteConstant ((MPfile ["PrimInt63"%bs; "Int63"%bs; "Cyclic"%bs; "Numbers"%bs; "Corelib"%bs]), "int"%bs) false) (fun cb' : constant_body => tmBind (tmEval all (match cst_body cb' with None => true | Some _ => false end)) (fun h : bool => if b then (if Bool.eqb h true then tmMsg "RT_OK 3" else tmMsg "RT_OPACITY_MISMATCH 3") else tmMsg "RT_MISMATCH 3"))))).
Definition rt_7 : constant_body := {| cst_type := (tConst ((MPfile ["PrimInt63"%bs; "Int63"%bs; "Cyclic"%bs; "Numbers"%bs; "Corelib"%bs]), "int"%bs) []); cst_body := (Some (tInt (4194303%uint63))); cst_universes := Monomorphic_ctx; cst_relevance := Relevant |}.
MetaRocq Run (tmBind (tmQuoteConstant ((MPfile ["PrimArray"%bs; "Array"%bs; "Corelib"%bs]), "max_length"%bs) true) (fun cb : constant_body => tmBind (tmEval all (cb_eqb cb rt_7)) (fun b : bool => tmBind (tmQuoteConstant ((MPfile ["PrimArray"%bs; "Array"%bs; "Corelib"%bs]), "max_length"%bs) false) (fun cb' : constant_body => tmBind (tmEval all (match cst_body cb' with None => true | Some _ => false end)) (fun h : bool => if b then (if Bool.eqb h false then tmMsg "RT_OK 7" else tmMsg "RT_OPACITY_MISMATCH 7") else tmMsg "RT_MISMATCH 7"))))).
