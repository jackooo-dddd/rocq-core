# Corelib.ssr.ssrfun

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssrfun.Option.apply

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Option.apply

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.apply.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.Option.bind

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Option.bind

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.bind.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.Option.default

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Option.default

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.default.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.Option.lift

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Option.lift

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.lift.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.Option.map

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Option.map

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Option.map.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.SimplFunDelta

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.SimplFunDelta

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT rT

## Corelib.ssr.ssrfun.Some_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.Some_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.Some_inj.statement.correspondence

```lean
∀ (T : Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type),
  Rocq.Corelib.ssr.ssrfun.injective
    (Rocq.Corelib.Init.Datatypes.option
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
          (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T)))
    (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T))
    (Rocq.Corelib.Init.Datatypes.option.Some
      (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T)
          (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test T))
        (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result T) (Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame T)))
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.NonPropType.type;Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.callee;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.condition;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.result;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.test;Rocq.Corelib.ssr.ssreflect_rw.NonPropType.frame;Rocq.Corelib.Init.Datatypes.option.Some

## Corelib.ssr.ssrfun.Tagged

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Tagged

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Tagged.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.Tagged2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.Tagged2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.Tagged2.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.all_equal_to

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.all_equal_to

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.all_equal_to.roundtrip

## Corelib.ssr.ssrfun.all_pair

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.all_pair

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.all_pair.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.all_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.all_sig

## Corelib.ssr.ssrfun.all_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.all_sig2

## Corelib.ssr.ssrfun.all_tag

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.all_tag

## Corelib.ssr.ssrfun.all_tag2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.all_tag2

## Corelib.ssr.ssrfun.associative

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.associative

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.associative.roundtrip

## Corelib.ssr.ssrfun.bij_can_bij

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' : A → B), Rocq.Corelib.ssr.ssrfun.cancel A B f f' → Rocq.Corelib.ssr.ssrfun.bijective B A f'
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.bij_can_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_eq.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' f'' : A → B),
      Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
        Rocq.Corelib.ssr.ssrfun.cancel A B f f'' → Rocq.Corelib.ssr.ssrfun.eqfun B A f' f''
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.bij_can_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_can_sym.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (f' : A → B), Rocq.Corelib.ssr.ssrfun.cancel B A f' f ↔ Rocq.Corelib.ssr.ssrfun.cancel A B f f'
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.bij_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.bij_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_comp.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (C : Type u_Corelib_ssr_ssrfun_584)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    Rocq.Corelib.ssr.ssrfun.bijective B C h →
      Rocq.Corelib.ssr.ssrfun.bijective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.bij_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.bij_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.bij_inj.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_571) (B : Type u_Corelib_ssr_ssrfun_572) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f → Rocq.Corelib.ssr.ssrfun.injective A B f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.bijective

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.bijective

## Corelib.ssr.ssrfun.canLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.canLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.canLR.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : rT)
  (y : aT), Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → x = f y → g x = y
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.canRL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.canRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.canRL.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT) (x : aT)
  (y : rT), Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → f x = y → x = g y
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel

## Corelib.ssr.ssrfun.can_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.can_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f' : A → B) (h' : B → C),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.cancel B C h h' →
      Rocq.Corelib.ssr.ssrfun.cancel A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
        (Rocq.Corelib.ssr.ssrfun.comp C B A h' f')
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.can_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.can_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_inj.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g → Rocq.Corelib.ssr.ssrfun.injective rT aT f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.can_pcan

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.can_pcan.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.can_pcan.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g →
    Rocq.Corelib.ssr.ssrfun.pcancel rT aT f fun y => Rocq.Corelib.Init.Datatypes.option.Some aT (g y)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.Init.Datatypes.option.Some

## Corelib.ssr.ssrfun.cancel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.cancel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.cancel.roundtrip

## Corelib.ssr.ssrfun.catcomp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.catcomp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.catcomp.roundtrip

## Corelib.ssr.ssrfun.commutative

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.commutative

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.commutative.roundtrip

## Corelib.ssr.ssrfun.comp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.comp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.comp.roundtrip

## Corelib.ssr.ssrfun.compA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.compA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.compA.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_128) (B : Sort u_Corelib_ssr_ssrfun_129) (C : Sort u_Corelib_ssr_ssrfun_130)
  (D : Sort u_Corelib_ssr_ssrfun_131) (f : B → A) (g : C → B) (h : D → C),
  Rocq.Corelib.ssr.ssrfun.comp A B D f (Rocq.Corelib.ssr.ssrfun.comp B C D g h) =
    Rocq.Corelib.ssr.ssrfun.comp A C D (Rocq.Corelib.ssr.ssrfun.comp A B C f g) h
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.congr1

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrfun.congr1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.congr1.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (B : Sort u_Corelib_Init_Logic_46) (f : A → B) (x y : A), x = y → f x = f y
```

## Corelib.ssr.ssrfun.congr2

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrfun.congr2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.congr2.statement.correspondence

```lean
∀ (A1 : Sort u_Corelib_Init_Logic_107) (A2 : Sort u_Corelib_Init_Logic_108) (B : Sort u_Corelib_Init_Logic_109)
  (f : A1 → A2 → B) (x1 y1 : A1) (x2 y2 : A2), x1 = y1 → x2 = y2 → f x1 x2 = f y1 y2
```

## Corelib.ssr.ssrfun.eq_bij

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.eq_bij.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_582) (B : Type u_Corelib_ssr_ssrfun_583) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.bijective A B f →
    ∀ (g : B → A), Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.bijective A B g
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.bijective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_can

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.eq_can.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_can.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' g' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.eqfun A B f g →
      Rocq.Corelib.ssr.ssrfun.eqfun B A f' g' → Rocq.Corelib.ssr.ssrfun.cancel A B g g'
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.eq_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_114) (B : Sort u_Corelib_ssr_ssrfun_115) (C : Sort u_Corelib_ssr_ssrfun_116)
  (f f' : B → A) (g g' : C → B),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f f' →
    Rocq.Corelib.ssr.ssrfun.eqfun B C g g' →
      Rocq.Corelib.ssr.ssrfun.eqfun A C (Rocq.Corelib.ssr.ssrfun.comp A B C f g)
        (Rocq.Corelib.ssr.ssrfun.comp A B C f' g')
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.eq_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.eq_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A),
  Rocq.Corelib.ssr.ssrfun.injective A B f →
    Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.injective A B g
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.eq_omap

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.eq_omap.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.eq_omap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f h : aT → rT),
  Rocq.Corelib.ssr.ssrfun.eqfun rT aT f h →
    Rocq.Corelib.ssr.ssrfun.eqfun (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f) (Rocq.Corelib.ssr.ssrfun.Option.map aT rT h)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.eqfun

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.eqfun

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.eqfun.roundtrip

## Corelib.ssr.ssrfun.eqrel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.eqrel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.eqrel.roundtrip

## Corelib.ssr.ssrfun.esym

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrfun.esym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.esym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_31) (x y : A), x = y → y = x
```

## Corelib.ssr.ssrfun.esymK

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.esymK.statement

## Corelib.ssr.ssrfun.etrans

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrfun.etrans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.etrans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y z : A), x = y → y = z → x = z
```

## Corelib.ssr.ssrfun.etrans_id

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.etrans_id.statement

## Corelib.ssr.ssrfun.frefl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.frefl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.frefl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.fsym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.fsym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.fsym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.eqfun A B g f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.ftrans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.ftrans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.ftrans.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (f g h : B → A),
  Rocq.Corelib.ssr.ssrfun.eqfun A B f g → Rocq.Corelib.ssr.ssrfun.eqfun A B g h → Rocq.Corelib.ssr.ssrfun.eqfun A B f h
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.fun_of_simpl

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.fun_of_simpl

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT rT

## Corelib.ssr.ssrfun.homomorphism_1

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.homomorphism_1

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.homomorphism_1.roundtrip

## Corelib.ssr.ssrfun.homomorphism_2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.homomorphism_2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.homomorphism_2.roundtrip

## Corelib.ssr.ssrfun.idempotent_fun

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.idempotent_fun

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idempotent_fun.roundtrip

## Corelib.ssr.ssrfun.idempotent_op

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.idempotent_op

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idempotent_op.roundtrip

## Corelib.ssr.ssrfun.idfun

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.idfun

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.idfun.roundtrip

## Corelib.ssr.ssrfun.inj_can_eq

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_eq.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f g : B → A) (f' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.injective B A f' →
      Rocq.Corelib.ssr.ssrfun.cancel A B g f' → Rocq.Corelib.ssr.ssrfun.eqfun A B f g
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.eqfun

## Corelib.ssr.ssrfun.inj_can_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_can_sym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (f : B → A) (f' : A → B),
  Rocq.Corelib.ssr.ssrfun.cancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.injective B A f' → Rocq.Corelib.ssr.ssrfun.cancel B A f' f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.inj_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.injective A B f →
    Rocq.Corelib.ssr.ssrfun.injective B C h →
      Rocq.Corelib.ssr.ssrfun.injective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.inj_compr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_compr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_compr.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B),
  Rocq.Corelib.ssr.ssrfun.injective A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h) →
    Rocq.Corelib.ssr.ssrfun.injective B C h
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.inj_id

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_id.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_id.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512), Rocq.Corelib.ssr.ssrfun.injective A A fun x => x
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.inj_omap

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inj_omap.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inj_omap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_463) (rT : Sort u_Corelib_ssr_ssrfun_464) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.injective rT aT f →
    Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.injective

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.injective

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.injective.roundtrip

## Corelib.ssr.ssrfun.injective2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.injective2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.injective2.roundtrip

## Corelib.ssr.ssrfun.inl_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inl_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inl_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_690) (B : Sort u_Corelib_ssr_ssrfun_691),
  Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.sum A B) A (Rocq.Corelib.Init.Datatypes.sum.inl A B)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inl

## Corelib.ssr.ssrfun.inr_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inr_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inr_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_686) (B : Sort u_Corelib_ssr_ssrfun_687),
  Rocq.Corelib.ssr.ssrfun.injective (Rocq.Corelib.Init.Datatypes.sum A B) B (Rocq.Corelib.Init.Datatypes.sum.inr A B)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Datatypes.sum.inr

## Corelib.ssr.ssrfun.interchange

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.interchange

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.interchange.roundtrip

## Corelib.ssr.ssrfun.inv_bij

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inv_bij.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inv_bij.statement.correspondence

```lean
∀ (A : Type u_Corelib_ssr_ssrfun_587) (f : A → A),
  Rocq.Corelib.ssr.ssrfun.involutive A f → Rocq.Corelib.ssr.ssrfun.bijective A A f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.ssr.ssrfun.bijective

## Corelib.ssr.ssrfun.inv_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.inv_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.inv_inj.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_587) (f : A → A),
  Rocq.Corelib.ssr.ssrfun.involutive A f → Rocq.Corelib.ssr.ssrfun.injective A A f
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.involutive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.involutive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.involutive.roundtrip

## Corelib.ssr.ssrfun.left_commutative

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_commutative

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_commutative.roundtrip

## Corelib.ssr.ssrfun.left_distributive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_distributive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_distributive.roundtrip

## Corelib.ssr.ssrfun.left_id

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_id

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_id.roundtrip

## Corelib.ssr.ssrfun.left_injective

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_injective

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_injective.roundtrip

## Corelib.ssr.ssrfun.left_inverse

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_inverse

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_inverse.roundtrip

## Corelib.ssr.ssrfun.left_loop

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_loop

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_loop.roundtrip

## Corelib.ssr.ssrfun.left_zero

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.left_zero

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.left_zero.roundtrip

## Corelib.ssr.ssrfun.monomorphism_1

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.monomorphism_1

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.monomorphism_1.roundtrip

## Corelib.ssr.ssrfun.monomorphism_2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.monomorphism_2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.monomorphism_2.roundtrip

## Corelib.ssr.ssrfun.morphism_1

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.morphism_1

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.morphism_1.roundtrip

## Corelib.ssr.ssrfun.morphism_2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.morphism_2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.morphism_2.roundtrip

## Corelib.ssr.ssrfun.nesym

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrfun.nesym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.nesym.statement.correspondence

```lean
∀ (A : Sort u_Corelib_Init_Logic_45) (x y : A), ¬x = y → ¬y = x
```

## Corelib.ssr.ssrfun.oappEmap

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.oappEmap.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oappEmap.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT) (y0 : rT)
  (x : Rocq.Corelib.Init.Datatypes.option aT),
  Rocq.Corelib.ssr.ssrfun.Option.apply aT rT f y0 x =
    Rocq.Corelib.ssr.ssrfun.Option.default rT y0 (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f x)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.Option.default;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.oapp_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.oapp_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : sT),
  Rocq.Corelib.ssr.ssrfun.eqfun sT (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.apply aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) x)
    (Rocq.Corelib.ssr.ssrfun.comp sT (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.apply rT sT g x) (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f))
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.oapp_comp_f

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.oapp_comp_f.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT) (x : rT),
  Rocq.Corelib.ssr.ssrfun.eqfun sT (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.apply aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) (g x))
    (Rocq.Corelib.ssr.ssrfun.comp sT rT (Rocq.Corelib.Init.Datatypes.option aT) g
      (Rocq.Corelib.ssr.ssrfun.Option.apply aT rT f x))
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.obindEapp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.obindEapp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.obindEapp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144)
  (fo : aT → Rocq.Corelib.Init.Datatypes.option rT),
  Rocq.Corelib.ssr.ssrfun.Option.bind aT rT fo =
    Rocq.Corelib.ssr.ssrfun.Option.apply aT (Rocq.Corelib.Init.Datatypes.option rT) fo
      (Rocq.Corelib.Init.Datatypes.option.None rT)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.bind;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.ocan_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.ocan_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.ocan_comp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (fo : B → Rocq.Corelib.Init.Datatypes.option A) (ho : C → Rocq.Corelib.Init.Datatypes.option B) (f' : A → B)
  (h' : B → C),
  Rocq.Corelib.ssr.ssrfun.ocancel A B fo f' →
    Rocq.Corelib.ssr.ssrfun.ocancel B C ho h' →
      Rocq.Corelib.ssr.ssrfun.ocancel A C
        (Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option A) (Rocq.Corelib.Init.Datatypes.option B) C
          (Rocq.Corelib.ssr.ssrfun.Option.bind B A fo) ho)
        (Rocq.Corelib.ssr.ssrfun.comp C B A h' f')
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.ocancel;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.Option.bind

## Corelib.ssr.ssrfun.ocancel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.ocancel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.ocancel.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.of_void

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.of_void

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.of_void.roundtrip

## Corelib.ssr.ssrfun.of_voidK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.of_voidK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.of_voidK.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_493),
  Rocq.Corelib.ssr.ssrfun.pcancel T Rocq.Corelib.Init.Datatypes.Empty_set (Rocq.Corelib.ssr.ssrfun.of_void T)
    (Rocq.Corelib.ssr.ssrfun.fun_of_simpl T (Rocq.Corelib.Init.Datatypes.option Rocq.Corelib.Init.Datatypes.Empty_set)
      (Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun T
        (Rocq.Corelib.Init.Datatypes.option Rocq.Corelib.Init.Datatypes.Empty_set) fun a =>
        Rocq.Corelib.Init.Datatypes.option.None Rocq.Corelib.Init.Datatypes.Empty_set))
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.Init.Datatypes.Empty_set;Rocq.Corelib.ssr.ssrfun.of_void;Rocq.Corelib.ssr.ssrfun.fun_of_simpl;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.simpl_fun.SimplFun;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.olift_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.olift_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.olift_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT),
  Rocq.Corelib.ssr.ssrfun.Option.lift aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f) =
    Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option sT) rT aT
      (Rocq.Corelib.ssr.ssrfun.Option.lift rT sT g) f
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.lift;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.omapEapp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.omapEapp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapEapp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.Option.map aT rT f =
    Rocq.Corelib.ssr.ssrfun.Option.apply aT (Rocq.Corelib.Init.Datatypes.option rT)
      (Rocq.Corelib.ssr.ssrfun.Option.lift aT rT f) (Rocq.Corelib.Init.Datatypes.option.None rT)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.Option.apply;Rocq.Corelib.ssr.ssrfun.Option.lift;Rocq.Corelib.Init.Datatypes.option.None

## Corelib.ssr.ssrfun.omapEbind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.omapEbind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapEbind.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (f : aT → rT),
  Rocq.Corelib.ssr.ssrfun.Option.map aT rT f =
    Rocq.Corelib.ssr.ssrfun.Option.bind aT rT (Rocq.Corelib.ssr.ssrfun.Option.lift aT rT f)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.Option.bind;Rocq.Corelib.ssr.ssrfun.Option.lift

## Corelib.ssr.ssrfun.omapK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.omapK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omapK.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_483) (rT : Sort u_Corelib_ssr_ssrfun_484) (f : aT → rT) (g : rT → aT),
  Rocq.Corelib.ssr.ssrfun.cancel rT aT f g →
    Rocq.Corelib.ssr.ssrfun.cancel (Rocq.Corelib.Init.Datatypes.option rT) (Rocq.Corelib.Init.Datatypes.option aT)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f) (Rocq.Corelib.ssr.ssrfun.Option.map rT aT g)
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.omap_comp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.omap_comp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omap_comp.statement.correspondence

```lean
∀ (aT : Sort u_Corelib_ssr_ssrfun_143) (rT : Sort u_Corelib_ssr_ssrfun_144) (sT : Sort u_Corelib_ssr_ssrfun_145)
  (f : aT → rT) (g : rT → sT),
  Rocq.Corelib.ssr.ssrfun.eqfun (Rocq.Corelib.Init.Datatypes.option sT) (Rocq.Corelib.Init.Datatypes.option aT)
    (Rocq.Corelib.ssr.ssrfun.Option.map aT sT (Rocq.Corelib.ssr.ssrfun.comp sT rT aT g f))
    (Rocq.Corelib.ssr.ssrfun.comp (Rocq.Corelib.Init.Datatypes.option sT) (Rocq.Corelib.Init.Datatypes.option rT)
      (Rocq.Corelib.Init.Datatypes.option aT) (Rocq.Corelib.ssr.ssrfun.Option.map rT sT g)
      (Rocq.Corelib.ssr.ssrfun.Option.map aT rT f))
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map;Rocq.Corelib.ssr.ssrfun.comp

## Corelib.ssr.ssrfun.omap_id

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.omap_id.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.omap_id.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_144) (x : Rocq.Corelib.Init.Datatypes.option rT),
  Rocq.Corelib.ssr.ssrfun.Option.map rT rT (fun x => x) x = x
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.Option.map

## Corelib.ssr.ssrfun.pair_of_and

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.pair_of_and.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pair_of_and.statement.correspondence

```lean
∀ (P Q : Prop), P ∧ Q → Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod.qualityProp

## Corelib.ssr.ssrfun.pcan_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.pcan_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pcan_inj.statement.correspondence

```lean
∀ (rT : Sort u_Corelib_ssr_ssrfun_398) (aT : Sort u_Corelib_ssr_ssrfun_399) (f : aT → rT)
  (g : rT → Rocq.Corelib.Init.Datatypes.option aT),
  Rocq.Corelib.ssr.ssrfun.pcancel rT aT f g → Rocq.Corelib.ssr.ssrfun.injective rT aT f
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.ssr.ssrfun.injective

## Corelib.ssr.ssrfun.pcan_pcomp

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.pcan_pcomp.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_512) (B : Sort u_Corelib_ssr_ssrfun_513) (C : Sort u_Corelib_ssr_ssrfun_514)
  (f : B → A) (h : C → B) (f' : A → Rocq.Corelib.Init.Datatypes.option B)
  (h' : B → Rocq.Corelib.Init.Datatypes.option C),
  Rocq.Corelib.ssr.ssrfun.pcancel A B f f' →
    Rocq.Corelib.ssr.ssrfun.pcancel B C h h' →
      Rocq.Corelib.ssr.ssrfun.pcancel A C (Rocq.Corelib.ssr.ssrfun.comp A B C f h)
        (Rocq.Corelib.ssr.ssrfun.pcomp C B A h' f')
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.option;Rocq.Corelib.ssr.ssrfun.pcancel;Rocq.Corelib.ssr.ssrfun.comp;Rocq.Corelib.ssr.ssrfun.pcomp

## Corelib.ssr.ssrfun.pcancel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.pcancel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.pcancel.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.pcomp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.pcomp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.pcomp.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.phant_id

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.phant_id

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.phant_id.roundtrip

## Corelib.ssr.ssrfun.rev_left_loop

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.rev_left_loop

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.rev_left_loop.roundtrip

## Corelib.ssr.ssrfun.rev_right_loop

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.rev_right_loop

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.rev_right_loop.roundtrip

## Corelib.ssr.ssrfun.right_commutative

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_commutative

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_commutative.roundtrip

## Corelib.ssr.ssrfun.right_distributive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_distributive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_distributive.roundtrip

## Corelib.ssr.ssrfun.right_id

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_id

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_id.roundtrip

## Corelib.ssr.ssrfun.right_injective

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_injective

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_injective.roundtrip

## Corelib.ssr.ssrfun.right_inverse

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_inverse

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_inverse.roundtrip

## Corelib.ssr.ssrfun.right_loop

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_loop

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_loop.roundtrip

## Corelib.ssr.ssrfun.right_zero

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.right_zero

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.right_zero.roundtrip

## Corelib.ssr.ssrfun.rrefl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.rrefl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.rrefl.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrfun_95) (B : Sort u_Corelib_ssr_ssrfun_96) (C : Sort u_Corelib_ssr_ssrfun_97)
  (r : C → B → A), Rocq.Corelib.ssr.ssrfun.eqrel A B C r r
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.eqrel

## Corelib.ssr.ssrfun.s2val

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.s2val

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.s2val.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.s2valP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.s2valP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.s2valP.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (u : Rocq.Corelib.Init.Specif.sig2 T P Q),
  P (Rocq.Corelib.ssr.ssrfun.s2val T P Q u)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.ssr.ssrfun.s2val

## Corelib.ssr.ssrfun.s2valP'

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.s2valP'.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.s2valP'.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P Q : T → Prop) (u : Rocq.Corelib.Init.Specif.sig2 T P Q),
  Q (Rocq.Corelib.ssr.ssrfun.s2val T P Q u)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig2;Rocq.Corelib.ssr.ssrfun.s2val

## Corelib.ssr.ssrfun.self_inverse

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.self_inverse

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.self_inverse.roundtrip

## Corelib.ssr.ssrfun.sig_of_sig2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.sig_of_sig2

## Corelib.ssr.ssrfun.simpl_fun

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.simpl_fun

## Corelib.ssr.ssrfun.svalP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.svalP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.svalP.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrfun_280) (P : T → Prop) (u : Rocq.Corelib.Init.Specif.sig T P),
  P (Rocq.Corelib.Init.Specif.proj1_sig T P u)
```

Residual source symbols: Rocq.Corelib.Init.Specif.sig;Rocq.Corelib.Init.Specif.proj1_sig

## Corelib.ssr.ssrfun.tag

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.tag

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.tag.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.tag2

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrfun.tag2

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrfun.tag2.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrfun.tag_of_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrfun.tag_of_sig

## Corelib.ssr.ssrfun.tag_of_tag2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.tag_of_tag2

Reason for interface not covered: No registered type bijection for Rocq.Corelib.Init.Specif.sigT I fun x => Rocq.Corelib.Init.Datatypes.prod (T_ x) (U_ x)

## Corelib.ssr.ssrfun.tagged

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.tagged

Reason for interface not covered: No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT I fun x => T_ x) →
  T_ (Rocq.Corelib.ssr.ssrfun.tag I (fun x => T_ x) w)

## Corelib.ssr.ssrfun.tagged2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.tagged2

Reason for interface not covered: No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT2 I T_ U_) →
  T_ (Rocq.Corelib.ssr.ssrfun.tag2 I T_ U_ w)

## Corelib.ssr.ssrfun.tagged2'

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.tagged2'

Reason for interface not covered: No registered type bijection for (w : Rocq.Corelib.Init.Specif.sigT2 I T_ U_) →
  U_ (Rocq.Corelib.ssr.ssrfun.tag2 I T_ U_ w)

## Corelib.ssr.ssrfun.unitE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrfun.unitE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrfun.unitE.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.all_equal_to Rocq.Corelib.Init.Datatypes.unit Rocq.Corelib.Init.Datatypes.unit.tt
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.all_equal_to;Rocq.Corelib.Init.Datatypes.unit;Rocq.Corelib.Init.Datatypes.unit.tt

## Corelib.ssr.ssrfun.unwrap

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.unwrap

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.wrapped T

## Corelib.ssr.ssrfun.wrap

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.wrap

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.wrapped T

## Corelib.ssr.ssrfun.wrapped

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrfun.wrapped