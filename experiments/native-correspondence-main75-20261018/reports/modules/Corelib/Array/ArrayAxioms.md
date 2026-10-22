# Corelib.Array.ArrayAxioms

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.Array.ArrayAxioms.array_ext

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.array_ext.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.array_ext.statement.correspondence

```lean
∀ (A : Type v_0) (t1 t2 : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A t1 = Rocq.Corelib.Array.PrimArray.length A t2 →
    (∀ (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
        Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t1) =
            Rocq.Corelib.Init.Datatypes.bool.true →
          Rocq.Corelib.Array.PrimArray.get A t1 i = Rocq.Corelib.Array.PrimArray.get A t2 i) →
      Rocq.Corelib.Array.PrimArray.default A t1 = Rocq.Corelib.Array.PrimArray.default A t2 → t1 = t2
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.default

## Corelib.Array.ArrayAxioms.default_set

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.default_set.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.default_set.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Array.PrimArray.default A (Rocq.Corelib.Array.PrimArray.set A t i a) =
    Rocq.Corelib.Array.PrimArray.default A t
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.default;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.get_copy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.get_copy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_copy.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.copy A t) i = Rocq.Corelib.Array.PrimArray.get A t i
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.copy

## Corelib.Array.ArrayAxioms.get_make

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.get_make.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_make.statement.correspondence

```lean
∀ (A : Type v_0) (a : A) (size i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.make A size a) i = a
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.make

## Corelib.Array.ArrayAxioms.get_out_of_bounds

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_out_of_bounds.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t) =
      Rocq.Corelib.Init.Datatypes.bool.false →
    Rocq.Corelib.Array.PrimArray.get A t i = Rocq.Corelib.Array.PrimArray.default A t
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.default

## Corelib.Array.ArrayAxioms.get_set_other

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_set_other.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i j : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  ¬i = j →
    Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.set A t i a) j =
      Rocq.Corelib.Array.PrimArray.get A t j
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.get_set_same

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.get_set_same.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb i (Rocq.Corelib.Array.PrimArray.length A t) =
      Rocq.Corelib.Init.Datatypes.bool.true →
    Rocq.Corelib.Array.PrimArray.get A (Rocq.Corelib.Array.PrimArray.set A t i a) i = a
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.ltb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Array.PrimArray.get;Rocq.Corelib.Array.PrimArray.set

## Corelib.Array.ArrayAxioms.leb_length

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.leb_length.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.leb_length.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb (Rocq.Corelib.Array.PrimArray.length A t)
      Rocq.Corelib.Array.PrimArray.max_length =
    Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.max_length;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.Array.ArrayAxioms.length_copy

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.length_copy.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_copy.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.copy A t) =
    Rocq.Corelib.Array.PrimArray.length A t
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.copy

## Corelib.Array.ArrayAxioms.length_make

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.length_make.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_make.statement.correspondence

```lean
∀ (A : Type v_0) (size : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int) (a : A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.make A size a) =
    Rocq.Corelib.Init.Datatypes.bool.rec size Rocq.Corelib.Array.PrimArray.max_length
      (Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb size Rocq.Corelib.Array.PrimArray.max_length)
```

Residual source symbols: Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.make;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Array.PrimArray.max_length;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.leb

## Corelib.Array.ArrayAxioms.length_set

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.Array.ArrayAxioms.length_set.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.Array.ArrayAxioms.length_set.statement.correspondence

```lean
∀ (A : Type v_0) (t : Rocq.Corelib.Array.PrimArray.array A) (i : Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int)
  (a : A),
  Rocq.Corelib.Array.PrimArray.length A (Rocq.Corelib.Array.PrimArray.set A t i a) =
    Rocq.Corelib.Array.PrimArray.length A t
```

Residual source symbols: Rocq.Corelib.Array.PrimArray.array;Rocq.Corelib.Numbers.Cyclic.Int63.PrimInt63.int;Rocq.Corelib.Array.PrimArray.length;Rocq.Corelib.Array.PrimArray.set