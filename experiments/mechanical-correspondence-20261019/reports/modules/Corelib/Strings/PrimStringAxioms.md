# Corelib.Strings.PrimStringAxioms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Strings.PrimStringAxioms.cat_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.cat_spec.statement.correspondence

```lean
∀ (s1 s2 : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.cat s1 s2) =
    Rocq.Corelib.Lists.ListDef.firstn Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))
      (Rocq.Corelib.Init.Datatypes.app Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s1) (Rocq.Corelib.Strings.PrimStringAxioms.to_list s2))
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.cat;Rocq.Corelib.Lists.ListDef.firstn;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length;Rocq.Corelib.Init.Datatypes.app

## Corelib.Strings.PrimStringAxioms.char63_valid

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.char63_valid

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.char63_valid.roundtrip

## Corelib.Strings.PrimStringAxioms.compare_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.compare_spec.statement.correspondence

```lean
∀ (s1 s2 : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimString.compare s1 s2 =
    Rocq.Corelib.Lists.ListDef.list_compare Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
      Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare (Rocq.Corelib.Strings.PrimStringAxioms.to_list s1)
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s2)
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.comparison;Rocq.Corelib.Strings.PrimString.compare;Rocq.Corelib.Lists.ListDef.list_compare;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.compare;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.get_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.get_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Strings.PrimString.get s i =
    Rocq.Corelib.Lists.ListDef.nth Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
      (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) 0#63
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimString.get;Rocq.Corelib.Lists.ListDef.nth;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.length_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.length_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.natTo
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z (Rocq.Corelib.Strings.PrimString.length s))) =
    NativeBridge.natTo
      (Rocq.Corelib.Init.Datatypes.length Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s))
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.length;Rocq.Corelib.Init.Datatypes.length;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.make_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.make_spec.statement.correspondence

```lean
∀ (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int) (c : Rocq.Corelib.Strings.PrimString.char63),
  Rocq.Corelib.Init.Logic.eq (Rocq.Corelib.Init.Datatypes.list Rocq.Corelib.Strings.PrimString.char63)
    (Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.make i c))
    (Rocq.Corelib.Lists.ListDef.repeat Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land c 255#63)
      (Rocq.Corelib.Init.Nat.min
        (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z i))
        (Rocq.Corelib.BinNums.IntDef.Z.to_nat
          (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))))
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Init.Logic.eq;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.make;Rocq.Corelib.Lists.ListDef.repeat;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.land;Rocq.Corelib.Init.Nat.min;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length

## Corelib.Strings.PrimStringAxioms.of_list

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.of_list

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.of_list.roundtrip

## Corelib.Strings.PrimStringAxioms.of_to_list

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.of_to_list.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Strings.PrimStringAxioms.of_list (Rocq.Corelib.Strings.PrimStringAxioms.to_list s) = s
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Strings.PrimStringAxioms.of_list;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.sub_spec

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.sub_spec.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string) (off len : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Strings.PrimStringAxioms.to_list (Rocq.Corelib.Strings.PrimString.sub s off len) =
    Rocq.Corelib.Lists.ListDef.firstn Rocq.Corelib.Strings.PrimString.char63
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z len))
      (Rocq.Corelib.Lists.ListDef.skipn Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.BinNums.IntDef.Z.to_nat (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z off))
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s))
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.list;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.Strings.PrimString.sub;Rocq.Corelib.Lists.ListDef.firstn;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Lists.ListDef.skipn

## Corelib.Strings.PrimStringAxioms.to_list

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.to_list

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.Strings.PrimStringAxioms.to_list.roundtrip

## Corelib.Strings.PrimStringAxioms.to_list_char63_valid

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.to_list_char63_valid.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  Rocq.Corelib.Lists.ListDef.Forall Rocq.Corelib.Strings.PrimString.char63
    Rocq.Corelib.Strings.PrimStringAxioms.char63_valid (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Lists.ListDef.Forall;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.char63_valid;Rocq.Corelib.Strings.PrimStringAxioms.to_list

## Corelib.Strings.PrimStringAxioms.to_list_length

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Strings.PrimStringAxioms.to_list_length.statement.correspondence

```lean
∀ (s : Rocq.Corelib.Strings.PrimString.string),
  NativeBridge.natTo
      (Rocq.Corelib.Init.Datatypes.length Rocq.Corelib.Strings.PrimString.char63
        (Rocq.Corelib.Strings.PrimStringAxioms.to_list s)) ≤
    NativeBridge.natTo
      (Rocq.Corelib.BinNums.IntDef.Z.to_nat
        (Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z Rocq.Corelib.Strings.PrimString.max_length))
```

Residual source symbols: Rocq.Corelib.Strings.PrimString.string;Rocq.Corelib.Init.Datatypes.length;Rocq.Corelib.Strings.PrimString.char63;Rocq.Corelib.Strings.PrimStringAxioms.to_list;Rocq.Corelib.BinNums.IntDef.Z.to_nat;Rocq.Corelib.Numbers.Cyclic.Int63.Uint63Axioms.to_Z;Rocq.Corelib.Strings.PrimString.max_length