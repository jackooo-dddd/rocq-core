# Corelib.Lists.ListDef

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Lists.ListDef.Forall

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.Forall

Operation/Type Certificate: NativeBridge.forall_list_agrees

## Corelib.Lists.ListDef.Forall_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Lists.ListDef.Forall_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Lists.ListDef.Forall_ind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (P_1 : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P_1 (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (x : A) (l : Rocq.Corelib.Init.Datatypes.list A),
        P x → Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l → P_1 (Rocq.Corelib.Init.Datatypes.list.cons A x l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Lists.ListDef.Forall_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Lists.ListDef.Forall_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Lists.ListDef.Forall_sind.statement.correspondence

```lean
∀ (A : Type u_Corelib_Lists_ListDef_53) (P : A → Prop) (P_1 : Rocq.Corelib.Init.Datatypes.list A → Prop),
  P_1 (Rocq.Corelib.Init.Datatypes.list.nil A) →
    (∀ (x : A) (l : Rocq.Corelib.Init.Datatypes.list A),
        P x → Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l → P_1 (Rocq.Corelib.Init.Datatypes.list.cons A x l)) →
      ∀ (l : Rocq.Corelib.Init.Datatypes.list A), Rocq.Corelib.Lists.ListDef.Forall A P l → P_1 l
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Init.Datatypes.list.nil;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Init.Datatypes.list.cons

## Corelib.Lists.ListDef.firstn

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.firstn

Operation/Type Certificate: NativeBridge.firstn_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.firstn.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Lists.ListDef.list_compare

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Lists.ListDef.list_compare

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.list_compare.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Lists.ListDef.map

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.map

Operation/Type Certificate: NativeBridge.map_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.map.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Lists.ListDef.nth

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.nth

Operation/Type Certificate: NativeBridge.nth_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.nth.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Lists.ListDef.repeat

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.repeat

Operation/Type Certificate: NativeBridge.repeat_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.repeat.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.Lists.ListDef.seq

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.seq

Operation/Type Certificate: NativeBridge.seq_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.seq.roundtrip

## Corelib.Lists.ListDef.skipn

Status: OPERATION_CORRESPONDENCE. Agreement with the specified native operation/predicate has been proved; the certificate type specifies the premises.

Original target: Rocq.Corelib.Lists.ListDef.skipn

Operation/Type Certificate: NativeBridge.skipn_agrees

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Lists.ListDef.skipn.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.