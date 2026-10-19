From Corelib.Init Require Import Equality.
From Corelib.ssr Require Import ssreflect_rw.
Set Universe Polymorphism.
Polymorphic Definition bare_refl_SS@{u v} := @Corelib.Init.Equality.Has_refl@{SProp SProp;u v}.
Polymorphic Definition bare_refl_SP@{u v} := @Corelib.Init.Equality.Has_refl@{SProp Prop;u v}.
Polymorphic Definition bare_refl_ST@{u v} := @Corelib.Init.Equality.Has_refl@{SProp Type;u v}.
Polymorphic Definition bare_refl_PS@{u v} := @Corelib.Init.Equality.Has_refl@{Prop SProp;u v}.
Polymorphic Definition bare_refl_PP@{u v} := @Corelib.Init.Equality.Has_refl@{Prop Prop;u v}.
Polymorphic Definition bare_refl_PT@{u v} := @Corelib.Init.Equality.Has_refl@{Prop Type;u v}.
Polymorphic Definition bare_refl_TS@{u v} := @Corelib.Init.Equality.Has_refl@{Type SProp;u v}.
Polymorphic Definition bare_refl_TP@{u v} := @Corelib.Init.Equality.Has_refl@{Type Prop;u v}.
Polymorphic Definition bare_refl_TT@{u v} := @Corelib.Init.Equality.Has_refl@{Type Type;u v}.
Polymorphic Definition bare_j_SSS@{u v w} := @Corelib.Init.Equality.Has_J@{SProp SProp SProp;u v w}.
Polymorphic Definition bare_j_SSP@{u v w} := @Corelib.Init.Equality.Has_J@{SProp SProp Prop;u v w}.
Polymorphic Definition bare_j_SST@{u v w} := @Corelib.Init.Equality.Has_J@{SProp SProp Type;u v w}.
Polymorphic Definition bare_j_SPS@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Prop SProp;u v w}.
Polymorphic Definition bare_j_SPP@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Prop Prop;u v w}.
Polymorphic Definition bare_j_SPT@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Prop Type;u v w}.
Polymorphic Definition bare_j_STS@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Type SProp;u v w}.
Polymorphic Definition bare_j_STP@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Type Prop;u v w}.
Polymorphic Definition bare_j_STT@{u v w} := @Corelib.Init.Equality.Has_J@{SProp Type Type;u v w}.
Polymorphic Definition bare_j_PSS@{u v w} := @Corelib.Init.Equality.Has_J@{Prop SProp SProp;u v w}.
Polymorphic Definition bare_j_PSP@{u v w} := @Corelib.Init.Equality.Has_J@{Prop SProp Prop;u v w}.
Polymorphic Definition bare_j_PST@{u v w} := @Corelib.Init.Equality.Has_J@{Prop SProp Type;u v w}.
Polymorphic Definition bare_j_PPS@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Prop SProp;u v w}.
Polymorphic Definition bare_j_PPP@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Prop Prop;u v w}.
Polymorphic Definition bare_j_PPT@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Prop Type;u v w}.
Polymorphic Definition bare_j_PTS@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Type SProp;u v w}.
Polymorphic Definition bare_j_PTP@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Type Prop;u v w}.
Polymorphic Definition bare_j_PTT@{u v w} := @Corelib.Init.Equality.Has_J@{Prop Type Type;u v w}.
Polymorphic Definition bare_j_TSS@{u v w} := @Corelib.Init.Equality.Has_J@{Type SProp SProp;u v w}.
Polymorphic Definition bare_j_TSP@{u v w} := @Corelib.Init.Equality.Has_J@{Type SProp Prop;u v w}.
Polymorphic Definition bare_j_TST@{u v w} := @Corelib.Init.Equality.Has_J@{Type SProp Type;u v w}.
Polymorphic Definition bare_j_TPS@{u v w} := @Corelib.Init.Equality.Has_J@{Type Prop SProp;u v w}.
Polymorphic Definition bare_j_TPP@{u v w} := @Corelib.Init.Equality.Has_J@{Type Prop Prop;u v w}.
Polymorphic Definition bare_j_TPT@{u v w} := @Corelib.Init.Equality.Has_J@{Type Prop Type;u v w}.
Polymorphic Definition bare_j_TTS@{u v w} := @Corelib.Init.Equality.Has_J@{Type Type SProp;u v w}.
Polymorphic Definition bare_j_TTP@{u v w} := @Corelib.Init.Equality.Has_J@{Type Type Prop;u v w}.
Polymorphic Definition bare_j_TTT@{u v w} := @Corelib.Init.Equality.Has_J@{Type Type Type;u v w}.
Polymorphic Definition bare_have_SS@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{SProp SProp;u v}.
Polymorphic Definition bare_have_SP@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{SProp Prop;u v}.
Polymorphic Definition bare_have_ST@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{SProp Type;u v}.
Polymorphic Definition bare_have_PS@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Prop SProp;u v}.
Polymorphic Definition bare_have_PP@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Prop Prop;u v}.
Polymorphic Definition bare_have_PT@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Prop Type;u v}.
Polymorphic Definition bare_have_TS@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Type SProp;u v}.
Polymorphic Definition bare_have_TP@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Type Prop;u v}.
Polymorphic Definition bare_have_TT@{u v} := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Type Type;u v}.
Polymorphic Definition partial_have_SProp@{u v} (A : SProp) := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{SProp Type;u v} A.
Polymorphic Definition partial_have_Prop@{u v} (A : Prop) := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Prop Type;u v} A.
Polymorphic Definition partial_have_Type@{u v} (A : Type@{u}) := @Corelib.ssr.ssreflect_rw.ssr_have_upoly@{Type Type;u v} A.
Polymorphic Definition partial_refl@{u v} := @Corelib.Init.Equality.Has_refl@{Type Prop;u v} (fun (A : Type@{u}) (_ _ : A) => True).
Polymorphic Definition nested_bare@{u v} := (fun f => f) (@Corelib.Init.Equality.Has_refl@{Type Prop;u v}).
