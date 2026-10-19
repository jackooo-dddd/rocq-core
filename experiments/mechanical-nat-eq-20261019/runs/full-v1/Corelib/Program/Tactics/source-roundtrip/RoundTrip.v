From Corelib.Numbers.Cyclic.Int63 Require Import PrimInt63.
From Corelib.Floats Require Import PrimFloat.
Require Corelib.Strings.PrimString.
From MetaRocq.Utils Require Import utils.
From MetaRocq.Template Require Import All.
From Rocq2LeanRoundTrip Require Import RtEq.
Require Corelib.Program.Tactics.
Import MonadNotation.
Open Scope bs_scope.

Definition rt_0 : constant_body := {| cst_type := (tProd {| binder_name := (nNamed "A"%bs); binder_relevance := Relevant |} (tSort (sType (Universe.from_kernel_repr ((Level.level "Corelib.Program.Tactics.21"%bs), 0) []))) (tProd {| binder_name := (nNamed "a"%bs); binder_relevance := Relevant |} (tRel 0) (tRel 1))); cst_body := (Some (tLambda {| binder_name := (nNamed "A"%bs); binder_relevance := Relevant |} (tSort (sType (Universe.from_kernel_repr ((Level.level "Corelib.Program.Tactics.21"%bs), 0) []))) (tLambda {| binder_name := (nNamed "a"%bs); binder_relevance := Relevant |} (tRel 0) (tRel 0)))); cst_universes := Monomorphic_ctx; cst_relevance := Relevant |}.
MetaRocq Run (tmBind (tmQuoteConstant ((MPfile ["Tactics"%bs; "Program"%bs; "Corelib"%bs]), "fix_proto"%bs) true) (fun cb : constant_body => tmBind (tmEval all (cb_eqb cb rt_0)) (fun b : bool => tmBind (tmQuoteConstant ((MPfile ["Tactics"%bs; "Program"%bs; "Corelib"%bs]), "fix_proto"%bs) false) (fun cb' : constant_body => tmBind (tmEval all (match cst_body cb' with None => true | Some _ => false end)) (fun h : bool => if b then (if Bool.eqb h false then tmMsg "RT_OK 0" else tmMsg "RT_OPACITY_MISMATCH 0") else tmMsg "RT_MISMATCH 0"))))).
