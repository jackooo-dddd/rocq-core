From Corelib.Numbers.Cyclic.Int63 Require Import PrimInt63.
From Corelib.Floats Require Import PrimFloat.
Require Corelib.Strings.PrimString.
From MetaRocq.Utils Require Import utils.
From MetaRocq.Template Require Import All.
From Rocq2LeanRoundTrip Require Import RtEq.
Require Corelib.Floats.FloatClass.
Import MonadNotation.
Open Scope bs_scope.

Definition rt_0 : mutual_inductive_body := {| ind_finite := BiFinite; ind_npars := 0; ind_params := []; ind_bodies := [{| ind_name := "float_class"%bs; ind_indices := []; ind_sort := (sType (Universe.from_kernel_repr (Level.lzero, 0) [])); ind_type := (tSort (sType (Universe.from_kernel_repr (Level.lzero, 0) []))); ind_kelim := IntoAny; ind_ctors := [{| cstr_name := "PNormal"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "NNormal"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "PSubn"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "NSubn"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "PZero"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "NZero"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "PInf"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "NInf"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}; {| cstr_name := "NaN"%bs; cstr_args := []; cstr_indices := []; cstr_type := (tRel 0); cstr_arity := 0 |}]; ind_projs := []; ind_relevance := Relevant |}]; ind_universes := Monomorphic_ctx; ind_variance := None |}.
MetaRocq Run (tmBind (tmQuoteInductive ((MPfile ["FloatClass"%bs; "Floats"%bs; "Corelib"%bs]), "float_class"%bs)) (fun mib : mutual_inductive_body => tmBind (tmEval all (mib_eqb mib rt_0)) (fun b : bool => if b then tmMsg "RT_OK 0" else tmMsg "RT_MISMATCH 0"))).
