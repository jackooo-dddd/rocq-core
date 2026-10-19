From Corelib.Init Require Import Equality.
From Corelib.ssr Require Import ssreflect_rw.
Set Universe Polymorphism.
Polymorphic Lemma opaque_data@{u v} (A : Type@{u}) (B : Type@{v}) (x : A) (f : A -> B) : B.
Proof. exact (@ssr_have_upoly@{Type Type;u v} A B x f). Qed.
Polymorphic Lemma opaque_proof@{u v} (A : Type@{u}) (B : Prop) (x : A) (f : A -> B) : B.
Proof. exact (@ssr_have_upoly@{Type Prop;u v} A B x f). Qed.
