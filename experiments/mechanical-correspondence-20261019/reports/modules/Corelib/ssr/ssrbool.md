# Corelib.ssr.ssrbool

Each entry corresponds to one root in the mechanical translation baseline. The complete native statement / interface types are in the aggregate JSON file.



## Corelib.ssr.ssrbool.ApplicativePred

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.ApplicativePred

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_pred

## Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.DefaultKeying.default_keyed_qualifier

## Corelib.ssr.ssrbool.KeyedPred

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.KeyedPred

## Corelib.ssr.ssrbool.KeyedQualifier

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.KeyedQualifier

## Corelib.ssr.ssrbool.PredOfSimpl.coerce

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.SimplPred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.SimplPred

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.SimplRel

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.SimplRel

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.addFb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addFb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addIb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addIb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addIb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addKb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addKb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addKb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_loop Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool (fun x => x)
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_loop;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addNb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addNb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addNb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb (Rocq.Corelib.Init.Datatypes.negb a) b =
    Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.ssr.ssrbool.addb a b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addTb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addTb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb Rocq.Corelib.Init.Datatypes.bool.true b = Rocq.Corelib.Init.Datatypes.negb b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addb

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.addb

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.addb.roundtrip

## Corelib.ssr.ssrbool.addbA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbAC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbAC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbACA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbACA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbCA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbCA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbI

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbI.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbI.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbK.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_loop Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool (fun x => x)
  Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_loop;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.addbN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb a (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.ssr.ssrbool.addb a b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addbP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.addbP

## Corelib.ssr.ssrbool.addbT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.ssr.ssrbool.addb b Rocq.Corelib.Init.Datatypes.bool.true = Rocq.Corelib.Init.Datatypes.negb b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.addb;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.addbb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.addbb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.addbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.self_inverse Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.self_inverse;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.all_and2

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_and2

## Corelib.ssr.ssrbool.all_and3

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_and3

## Corelib.ssr.ssrbool.all_and4

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_and4

## Corelib.ssr.ssrbool.all_and5

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_and5

## Corelib.ssr.ssrbool.all_sig2_cond

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_sig2_cond

## Corelib.ssr.ssrbool.all_sig_cond

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_sig_cond

## Corelib.ssr.ssrbool.all_sig_cond_dep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_sig_cond_dep

## Corelib.ssr.ssrbool.all_tag_cond

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_tag_cond

## Corelib.ssr.ssrbool.all_tag_cond_dep

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.all_tag_cond_dep

## Corelib.ssr.ssrbool.altP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.altP

## Corelib.ssr.ssrbool.alt_spec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.alt_spec

## Corelib.ssr.ssrbool.and3

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and3P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.and3P

## Corelib.ssr.ssrbool.and3_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and3_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and3_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and3_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and3_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3

## Corelib.ssr.ssrbool.and3_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and3_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3

## Corelib.ssr.ssrbool.and3_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and3_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and3_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P2 → P3 → P) → Rocq.Corelib.ssr.ssrbool.and3 P1 P2 P3 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and3

## Corelib.ssr.ssrbool.and4

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and4P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.and4P

## Corelib.ssr.ssrbool.and4_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and4_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and4_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and4_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and4_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4

## Corelib.ssr.ssrbool.and4_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and4_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4

## Corelib.ssr.ssrbool.and4_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and4_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and4_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P2 → P3 → P4 → P) → Rocq.Corelib.ssr.ssrbool.and4 P1 P2 P3 P4 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and4

## Corelib.ssr.ssrbool.and5

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.and5P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.and5P

## Corelib.ssr.ssrbool.and5_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and5_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and5_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.and5_rec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and5_rec

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5

## Corelib.ssr.ssrbool.and5_rect

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.and5_rect

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5

## Corelib.ssr.ssrbool.and5_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.and5_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.and5_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P5 P : Prop), (P1 → P2 → P3 → P4 → P5 → P) → Rocq.Corelib.ssr.ssrbool.and5 P1 P2 P3 P4 P5 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.and5

## Corelib.ssr.ssrbool.andFb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andFb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_zero Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_zero;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andKb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andKb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andKb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.orb a (Rocq.Corelib.Init.Datatypes.andb b a) = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andNb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andNb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andNb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.negb b) b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.andP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.andP

## Corelib.ssr.ssrbool.andPP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.andPP

## Corelib.ssr.ssrbool.andTb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andTb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andTb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbAC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbAC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbACA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbACA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
  Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbCA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbCA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_zero Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_zero;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbK.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.andb a b) a = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andbN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbN.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.andb b (Rocq.Corelib.Init.Datatypes.negb b) = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.andbT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbT.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.true Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_addl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_addl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_addl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.andb_addr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_addr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_addr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.ssr.ssrbool.addb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.ssr.ssrbool.addb

## Corelib.ssr.ssrbool.andb_id2l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_id2l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → b = c) →
    Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.andb a c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_id2r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_id2r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_id2r.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → a = c) →
    Rocq.Corelib.Init.Datatypes.andb a b = Rocq.Corelib.Init.Datatypes.andb c b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_idl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_idl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true a) →
    Rocq.Corelib.Init.Datatypes.andb a b = b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_idr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_idr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.andb a b = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.andb_orl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_orl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_orl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.andb_orr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andb_orr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andb_orr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.andb Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.andbb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.andbb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.andbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.idempotent_op Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.idempotent_op;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.antisymmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.antisymmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.antisymmetric.roundtrip

## Corelib.ssr.ssrbool.appP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.appP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.appP.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect Q b), P → Q
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.app_predE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.app_predE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.app_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (ap : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p),
  Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap x =
    Rocq.Corelib.ssr.ssrbool.in_mem T x (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) p)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.registered_applicative_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.applicative_pred_value;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType

## Corelib.ssr.ssrbool.applicative_mem_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.applicative_mem_pred

## Corelib.ssr.ssrbool.applicative_mem_pred_value

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p → Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T p

## Corelib.ssr.ssrbool.applicative_pred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.applicative_pred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.applicative_pred.roundtrip

## Corelib.ssr.ssrbool.applicative_pred_applicative

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.applicative_pred_applicative

## Corelib.ssr.ssrbool.applicative_pred_of_simpl

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.applicative_pred_of_simpl

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.applicative_pred_value

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.applicative_pred_value

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p → Rocq.Corelib.ssr.ssrbool.pred T

## Corelib.ssr.ssrbool.bijective_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.bijective_in

## Corelib.ssr.ssrbool.bijective_on

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.bijective_on

## Corelib.ssr.ssrbool.bind_unless

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.bind_unless

## Corelib.ssr.ssrbool.boolP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.boolP

## Corelib.ssr.ssrbool.boolfunPredType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.boolfunPredType

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.canLR_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.canLR_in.statement

## Corelib.ssr.ssrbool.canLR_on

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.canLR_on.statement

## Corelib.ssr.ssrbool.canRL_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.canRL_in.statement

## Corelib.ssr.ssrbool.canRL_on

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.canRL_on.statement

## Corelib.ssr.ssrbool.can_in_comp

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.can_in_comp.statement

## Corelib.ssr.ssrbool.can_in_inj

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.can_in_inj.statement

## Corelib.ssr.ssrbool.can_in_pcan

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.can_in_pcan.statement

## Corelib.ssr.ssrbool.can_mono

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.can_mono.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.can_mono.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      Rocq.Corelib.ssr.ssrfun.monomorphism_2 rT aT Rocq.Corelib.Init.Datatypes.bool g (fun x y => rR x y) fun x y =>
        aR x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.can_mono_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.can_mono_in.statement

## Corelib.ssr.ssrbool.check_applicative_mem_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.check_applicative_mem_pred

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  (ap : Rocq.Corelib.ssr.ssrbool.registered_applicative_pred T p) →
    Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T (Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap) →
      Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T (Rocq.Corelib.ssr.ssrbool.applicative_pred_value T p ap)

## Corelib.ssr.ssrbool.classicP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classicP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classicP.statement.correspondence

```lean
∀ (P : Prop), Rocq.Corelib.ssr.ssrbool.classically P ↔ ¬¬P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classicW

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classicW.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classicW.statement.correspondence

```lean
∀ (P : Sort u_Corelib_ssr_ssrbool_432) (a : P), Rocq.Corelib.ssr.ssrbool.classically P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_EM

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_EM.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_EM.statement.correspondence

```lean
∀ (P : Prop), Rocq.Corelib.ssr.ssrbool.classically (Rocq.Corelib.ssr.ssrbool.decidable P)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.ssr.ssrbool.decidable

## Corelib.ssr.ssrbool.classic_bind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_bind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_bind.statement.correspondence

```lean
∀ (P : Sort u_Corelib_ssr_ssrbool_435) (Q : Sort u_Corelib_ssr_ssrbool_436),
  (∀ (a : P), Rocq.Corelib.ssr.ssrbool.classically Q) →
    Rocq.Corelib.ssr.ssrbool.classically P → Rocq.Corelib.ssr.ssrbool.classically Q
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_ex

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_ex.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_ex.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_512) (P : T → Prop),
  (¬∀ (x : T), ¬P x) → Rocq.Corelib.ssr.ssrbool.classically (∃ x, P x)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_imply

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_imply.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_imply.statement.correspondence

```lean
∀ (P : Type u_Corelib_ssr_ssrbool_481) (Q : Type u_Corelib_ssr_ssrbool_482),
  (∀ (a : P), Rocq.Corelib.ssr.ssrbool.classically Q) → Rocq.Corelib.ssr.ssrbool.classically (P → Q)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically

## Corelib.ssr.ssrbool.classic_pick

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_pick.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_pick.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_458) (P : T → Prop),
  Rocq.Corelib.ssr.ssrbool.classically
    (Rocq.Corelib.Init.Datatypes.sum (Rocq.Corelib.Init.Specif.sig T fun x => P x) (∀ (x : T), ¬P x))
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.Init.Datatypes.sum;Rocq.Corelib.Init.Specif.sig

## Corelib.ssr.ssrbool.classic_sigW

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.classic_sigW.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.classic_sigW.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_498) (P : T → Prop),
  Rocq.Corelib.ssr.ssrbool.classically (∃ x, P x) ↔
    Rocq.Corelib.ssr.ssrbool.classically (Rocq.Corelib.Init.Specif.sig T fun x => P x)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.classically;Rocq.Corelib.Init.Specif.sig

## Corelib.ssr.ssrbool.classically

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.classically

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.classically.roundtrip

## Corelib.ssr.ssrbool.clone_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.clone_pred

Reason for interface not covered: No registered type bijection for (pT : Rocq.Corelib.ssr.ssrbool.predType T) →
  (Rocq.Corelib.ssr.ssrbool.pred_sort T pT → U) →
    (toP : U → Rocq.Corelib.ssr.ssrbool.pred T) →
      Rocq.Corelib.ssr.ssrfun.phant_id (Rocq.Corelib.ssr.ssrbool.predType T) (Rocq.Corelib.ssr.ssrbool.predType T)
          (Rocq.Corelib.ssr.ssrbool.predType.PredType T U toP) pT →
        Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.collective_pred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.collective_pred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.collective_pred.roundtrip

## Corelib.ssr.ssrbool.collective_pred_of_simpl

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.contra

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contra.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraFF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraFF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false → c = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraFN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraFN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraFT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraFT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraFnot

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraFnot.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraFnot.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (P → Rocq.Corelib.Init.Datatypes.is_true b) → b = Rocq.Corelib.Init.Datatypes.bool.false → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraL.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraLR.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraNF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      c = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraNN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraNN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraNT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraNnot

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraNnot.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraNnot.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (P → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraPF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → ¬P) → P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraPN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraPN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → ¬P) →
    P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraPT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P) →
    P → Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraPnot

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrbool.contraPnot.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraPnot.statement.correspondence

```lean
∀ (P Q : Prop), (Q → ¬P) → P → ¬Q
```

## Corelib.ssr.ssrbool.contraR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraR.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
      Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraTF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraTF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTF.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → c = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contraTN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraTN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTN.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true c → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraTT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraTT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTT.statement.correspondence

```lean
∀ (c b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb c) →
      Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contraTnot

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contraTnot.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contraTnot.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool) (P : Prop),
  (P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contra_not

Status: STATEMENT_FULL_NATIVE. A statement iff has been proved, and the result contains no Rocq/RocqPending/Rocq2Lean symbols; the original theorem itself has not been proved.

Original target: Rocq.Corelib.ssr.ssrbool.contra_not.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_not.statement.correspondence

```lean
∀ (P Q : Prop), (Q → P) → ¬P → ¬Q
```

## Corelib.ssr.ssrbool.contra_notF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contra_notF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → P) → ¬P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.contra_notN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contra_notN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → P) →
    ¬P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.contra_notT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.contra_notT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.contra_notT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → P) →
    ¬P → Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.decP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.decP

## Corelib.ssr.ssrbool.decPcases

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.decPcases.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.decPcases.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.decidable

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.decidable

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.decidable.roundtrip

## Corelib.ssr.ssrbool.elimF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  b = Rocq.Corelib.Init.Datatypes.bool.false → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimFn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimFn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimFn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  b' = Rocq.Corelib.Init.Datatypes.bool.false → P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.elimNTF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimNTF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimNTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.negb b = c → Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimNf

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimNf.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimNf.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false → P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.elimT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.is_true b → P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.elimTF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimTF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  b = c → Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimTFn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimTFn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTFn.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  b = c → Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.elimTn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.elimTn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.elimTn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  Rocq.Corelib.Init.Datatypes.is_true b' → ¬P
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.eq_mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.eq_mem

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.eqbLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.eqbLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.eqbLR.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = b2 → Rocq.Corelib.Init.Datatypes.is_true b1 → Rocq.Corelib.Init.Datatypes.is_true b2
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.eqbRL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.eqbRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.eqbRL.statement.correspondence

```lean
∀ (b1 b2 : Rocq.Corelib.Init.Datatypes.bool),
  b1 = b2 → Rocq.Corelib.Init.Datatypes.is_true b2 → Rocq.Corelib.Init.Datatypes.is_true b1
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.equivP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.equivP

## Corelib.ssr.ssrbool.equivPif

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.equivPif.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivPif.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  (Q → P) → (P → Q) → Rocq.Corelib.Init.Datatypes.bool.rec Q (¬Q) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.equivPifn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.equivPifn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivPifn.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  (Q → P) → (P → Q) → Rocq.Corelib.Init.Datatypes.bool.rec (¬Q) Q b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.equivalence_rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.equivalence_rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.equivalence_rel.roundtrip

## Corelib.ssr.ssrbool.equivalence_relP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.equivalence_relP.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.equivalence_rel T R ↔
    Rocq.Corelib.ssr.ssrbool.reflexive T R ∧ Rocq.Corelib.ssr.ssrbool.left_transitive T R
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.equivalence_rel;Rocq.Corelib.ssr.ssrbool.reflexive;Rocq.Corelib.ssr.ssrbool.left_transitive

## Corelib.ssr.ssrbool.equivalence_relP_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.equivalence_relP_in.statement

## Corelib.ssr.ssrbool.expose_mem_pred

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.expose_mem_pred

## Corelib.ssr.ssrbool.expose_simpl_pred

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.expose_simpl_pred

## Corelib.ssr.ssrbool.forE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.forE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.forE.statement.correspondence

```lean
∀ (T1 : Sort u_Corelib_ssr_ssrbool_1531) (x : T1) (P : T1 → Prop)
  (phP : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)),
  Rocq.Corelib.ssr.ssrbool.prop_for T1 x P phP = P x
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_for

## Corelib.ssr.ssrbool.fun_if

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.fun_if.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.fun_if.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (B : Sort u_Corelib_ssr_ssrbool_179) (f : A → B)
  (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  f (Rocq.Corelib.Init.Datatypes.bool.rec vT vF b) = Rocq.Corelib.Init.Datatypes.bool.rec (f vT) (f vF) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.fun_of_pred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.fun_of_pred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.fun_of_pred.roundtrip

## Corelib.ssr.ssrbool.fun_of_rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.fun_of_rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.fun_of_rel.roundtrip

## Corelib.ssr.ssrbool.has_quality

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.has_quality

Reason for interface not covered: No registered type bijection for (n : Rocq.Corelib.Init.Datatypes.nat) →
  (T : Type u_Corelib_ssr_ssrbool_1121) →
    Rocq.Corelib.ssr.ssrbool.qualifier n T →
      Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)

## Corelib.ssr.ssrbool.homoLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.homoLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homoLR.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      ∀ (x : aT) (y : rT),
        Rocq.Corelib.Init.Datatypes.is_true (aR x (g y)) → Rocq.Corelib.Init.Datatypes.is_true (rR (f x) y)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homoLR_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.homoLR_in.statement

## Corelib.ssr.ssrbool.homoRL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.homoRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homoRL.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      ∀ (x : rT) (y : aT),
        Rocq.Corelib.Init.Datatypes.is_true (aR (g x) y) → Rocq.Corelib.Init.Datatypes.is_true (rR x (f y))
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homoRL_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.homoRL_in.statement

## Corelib.ssr.ssrbool.homo_mono

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.homo_mono.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homo_mono.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
        Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
      (Rocq.Corelib.ssr.ssrfun.homomorphism_2 rT aT g (fun x y => Rocq.Corelib.Init.Datatypes.is_true (rR x y))
          fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) →
        Rocq.Corelib.ssr.ssrfun.monomorphism_2 rT aT Rocq.Corelib.Init.Datatypes.bool g (fun x y => rR x y) fun x y =>
          aR x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.homo_mono_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.homo_mono_in.statement

## Corelib.ssr.ssrbool.homo_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.homo_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.homo_sym.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (aR : Rocq.Corelib.ssr.ssrbool.rel aT)
  (rR : Rocq.Corelib.ssr.ssrbool.rel rT) (f : aT → rT),
  (Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun y x => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun y x =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.homo_sym_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.homo_sym_in.statement

## Corelib.ssr.ssrbool.homo_sym_in11

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.homo_sym_in11.statement

## Corelib.ssr.ssrbool.idP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.idP

## Corelib.ssr.ssrbool.idPn

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.idPn

## Corelib.ssr.ssrbool.ifE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.ifE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifE.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = Rocq.Corelib.ssr.ssrbool.if_expr A b vT vF
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.ssr.ssrbool.if_expr

## Corelib.ssr.ssrbool.ifF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.ifF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifF.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vF
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.ifN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.ifN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifN.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) →
    Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vF
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.ifP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.ifP

## Corelib.ssr.ssrbool.ifPn

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.ifPn

## Corelib.ssr.ssrbool.ifT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.ifT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.ifT.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.bool.rec vT vF b = vT
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_arg

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.if_arg.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_arg.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (B : Sort u_Corelib_ssr_ssrbool_179) (x : A)
  (b : Rocq.Corelib.Init.Datatypes.bool) (fT fF : A → B),
  Rocq.Corelib.Init.Datatypes.bool.rec (motive := fun t => A → B) fT fF b x =
    Rocq.Corelib.Init.Datatypes.bool.rec (fT x) (fF x) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_expr

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.if_expr

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.if_expr.roundtrip

## Corelib.ssr.ssrbool.if_neg

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.if_neg.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_neg.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT vF : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vF (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.bool.rec vF vT b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.if_same

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.if_same.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.if_same.statement.correspondence

```lean
∀ (A : Sort u_Corelib_ssr_ssrbool_178) (b : Rocq.Corelib.Init.Datatypes.bool) (vT : A),
  Rocq.Corelib.Init.Datatypes.bool.rec vT vT b = vT
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.if_spec

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.if_spec

## Corelib.ssr.ssrbool.iffP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.iffP

## Corelib.ssr.ssrbool.implies

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.implies

## Corelib.ssr.ssrbool.impliesP

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.impliesP

## Corelib.ssr.ssrbool.impliesPn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.impliesPn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.impliesPn.statement.correspondence

```lean
∀ (P Q : Prop) (a : Rocq.Corelib.ssr.ssrbool.implies P Q), ¬Q → ¬P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.implies

## Corelib.ssr.ssrbool.implyFb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyFb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyFb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb Rocq.Corelib.Init.Datatypes.bool.false b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.implyNb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyNb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyNb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb (Rocq.Corelib.Init.Datatypes.negb a) b = Rocq.Corelib.Init.Datatypes.orb a b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.implyP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.implyP

## Corelib.ssr.ssrbool.implyPP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.implyPP

## Corelib.ssr.ssrbool.implyTb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyTb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.implb Rocq.Corelib.Init.Datatypes.bool.true b = b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.implybE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybE.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb a) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybF.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb b Rocq.Corelib.Init.Datatypes.bool.false = Rocq.Corelib.Init.Datatypes.negb b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb a (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.implb b (Rocq.Corelib.Init.Datatypes.negb a)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybNN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybNN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybNN.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.implb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b) =
    Rocq.Corelib.Init.Datatypes.implb b a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.implybT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb b Rocq.Corelib.Init.Datatypes.bool.true)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.implyb_id2l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → b = c) →
    Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.implb a c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implyb_idl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyb_idl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.implb a b = b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implyb_idr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implyb_idr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implyb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a)) →
    Rocq.Corelib.Init.Datatypes.implb a b = Rocq.Corelib.Init.Datatypes.negb a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.implybb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.implybb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.implybb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.implb b b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.implb

## Corelib.ssr.ssrbool.in1T

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in1T.statement

## Corelib.ssr.ssrbool.in1W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in1W.statement

## Corelib.ssr.ssrbool.in1_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in1_sig.statement

## Corelib.ssr.ssrbool.in2T

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in2T.statement

## Corelib.ssr.ssrbool.in2W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in2W.statement

## Corelib.ssr.ssrbool.in2_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in2_sig.statement

## Corelib.ssr.ssrbool.in3T

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in3T.statement

## Corelib.ssr.ssrbool.in3W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in3W.statement

## Corelib.ssr.ssrbool.in3_sig

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in3_sig.statement

## Corelib.ssr.ssrbool.inE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.inE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.inE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253),
  Rocq.Corelib.Init.Datatypes.prod.qualityProp
    (Rocq.Corelib.Init.Datatypes.prod.qualityProp
      (∀ (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T) (amp : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p),
        Rocq.Corelib.ssr.ssrbool.in_mem T x
            (Rocq.Corelib.ssr.ssrbool.mem_pred_value T p
              (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value T p amp)) =
          p x)
      (∀ (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T) (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
        Rocq.Corelib.ssr.ssrbool.in_mem T x
            (Rocq.Corelib.ssr.ssrbool.mem_pred.Mem T fun x =>
              Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp) x) =
          p x))
    (∀ (p : Rocq.Corelib.ssr.ssrbool.pred T),
      Rocq.Corelib.ssr.ssrfun.eqfun Rocq.Corelib.Init.Datatypes.bool T
        (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.SimplPred T p)) p)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod.qualityProp;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred_value;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.ssr.ssrbool.mem_pred.Mem;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_pred_value;Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.ssr.ssrbool.SimplPred

## Corelib.ssr.ssrbool.inPhantom

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.inPhantom.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.inPhantom.statement.correspondence

```lean
∀ (p : Prop), Rocq.Corelib.ssr.ssreflect_rw.phantom Prop p
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.phantom

## Corelib.ssr.ssrbool.inT_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.inT_bij.statement

## Corelib.ssr.ssrbool.inW_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.inW_bij.statement

## Corelib.ssr.ssrbool.in_applicative

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.in_applicative.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_applicative.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (amp : Rocq.Corelib.ssr.ssrbool.applicative_mem_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem_pred_value T p (Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value T p amp)) =
    p x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred_value;Rocq.Corelib.ssr.ssrbool.applicative_mem_pred_value

## Corelib.ssr.ssrbool.in_collective

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.in_collective.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_collective.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp))) =
    p x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.collective_pred_of_simpl;Rocq.Corelib.ssr.ssrbool.simpl_pred_value

## Corelib.ssr.ssrbool.in_inj_comp

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_inj_comp.statement

## Corelib.ssr.ssrbool.in_mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.in_mem

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.in_on1P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1P.statement

## Corelib.ssr.ssrbool.in_on1S

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1S.statement

## Corelib.ssr.ssrbool.in_on1W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1W.statement

## Corelib.ssr.ssrbool.in_on1lP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1lP.statement

## Corelib.ssr.ssrbool.in_on1lS

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1lS.statement

## Corelib.ssr.ssrbool.in_on1lW

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on1lW.statement

## Corelib.ssr.ssrbool.in_on2P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on2P.statement

## Corelib.ssr.ssrbool.in_on2S

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on2S.statement

## Corelib.ssr.ssrbool.in_on2W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_on2W.statement

## Corelib.ssr.ssrbool.in_onS_can

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_onS_can.statement

## Corelib.ssr.ssrbool.in_onW_can

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.in_onW_can.statement

## Corelib.ssr.ssrbool.in_simpl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.in_simpl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.in_simpl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T)
  (msp : Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem_pred.Mem T fun x =>
        Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_pred_value T p msp) x) =
    p x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem_pred.Mem;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_pred_value

## Corelib.ssr.ssrbool.inj_can_sym_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in.statement

## Corelib.ssr.ssrbool.inj_can_sym_in_on

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_in_on.statement

## Corelib.ssr.ssrbool.inj_can_sym_on

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.inj_can_sym_on.statement

## Corelib.ssr.ssrbool.introF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introF.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  ¬P → b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introFn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introFn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introFn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  P → b' = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introN.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  ¬P → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.introNTF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introNTF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introNTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c → Rocq.Corelib.Init.Datatypes.negb b = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.introNf

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introNf.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introNf.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P → Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.introP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.introP

## Corelib.ssr.ssrbool.introT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introT.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P → Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.introTF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introTF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTF.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Rocq.Corelib.Init.Datatypes.bool.rec P (¬P) c → b = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.introTFn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introTFn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTFn.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  Rocq.Corelib.Init.Datatypes.bool.rec (¬P) P c → b = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.introTn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.introTn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.introTn.statement.correspondence

```lean
∀ (P : Prop) (b' : Rocq.Corelib.Init.Datatypes.bool)
  (Pb' : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b')),
  ¬P → Rocq.Corelib.Init.Datatypes.is_true b'
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.irreflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.irreflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.irreflexive.roundtrip

## Corelib.ssr.ssrbool.isSome

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.isSome

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.isSome.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrbool.isT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.isT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.isT.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.is_inl

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.is_inl

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_inl.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrbool.is_inleft

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.is_inleft

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_inleft.roundtrip

The interface only covers the Type universe instance; no Prop branch is claimed to cover the original bare Sort.

## Corelib.ssr.ssrbool.is_left

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.is_left

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.is_left.roundtrip

## Corelib.ssr.ssrbool.is_true_locked_true

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.is_true_locked_true.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true
  (Rocq.Corelib.ssr.ssreflect_rw.locked Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool.true)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.ssr.ssreflect_rw.locked;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.is_true_true

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.is_true_true.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.is_true_true.statement.correspondence

```lean
Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.keyed_mem

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.keyed_mem

## Corelib.ssr.ssrbool.keyed_mem_simpl

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.keyed_mem_simpl

## Corelib.ssr.ssrbool.keyed_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.keyed_pred

## Corelib.ssr.ssrbool.keyed_predE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.keyed_predE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.keyed_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1345)
  (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T))
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T p) (k_p : Rocq.Corelib.ssr.ssrbool.keyed_pred T p k),
  Rocq.Corelib.ssr.ssrbool.eq_mem T
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.unkey_pred T p k k_p))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) p)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.pred_key;Rocq.Corelib.ssr.ssrbool.keyed_pred;Rocq.Corelib.ssr.ssrbool.eq_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.unkey_pred

## Corelib.ssr.ssrbool.keyed_qualifier

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.keyed_qualifier

## Corelib.ssr.ssrbool.keyed_qualifier_keyed

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.keyed_qualifier_keyed

## Corelib.ssr.ssrbool.keyed_qualifier_suproof

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.keyed_qualifier_suproof.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1348) (n : Nat) (q : Rocq.Corelib.ssr.ssrbool.qualifier (NativeBridge.natOf n) T)
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T q))
  (k_q : Rocq.Corelib.ssr.ssrbool.keyed_qualifier T (NativeBridge.natOf n) q k),
  Rocq.Corelib.ssr.ssrbool.eq_mem T
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T
        (Rocq.Corelib.ssr.ssrbool.unkey_qualifier T (NativeBridge.natOf n) q k k_q)))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
      (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T q))
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.qualifier;Rocq.Corelib.ssr.ssrbool.pred_key;Rocq.Corelib.ssr.ssrbool.has_quality;Rocq.Corelib.ssr.ssrbool.keyed_qualifier;Rocq.Corelib.ssr.ssrbool.eq_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.unkey_qualifier

## Corelib.ssr.ssrbool.left_transitive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.left_transitive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.left_transitive.roundtrip

## Corelib.ssr.ssrbool.manifest_mem_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.manifest_mem_pred

## Corelib.ssr.ssrbool.manifest_simpl_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred

## Corelib.ssr.ssrbool.mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.mem

Reason for interface not covered: No registered type bijection for (pT : Rocq.Corelib.ssr.ssrbool.predType T) →
  Rocq.Corelib.ssr.ssrbool.pred_sort T pT → Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.memE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.memE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.memE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (sp : Rocq.Corelib.ssr.ssrbool.simpl_pred T),
  Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T
      (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T
        (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T) sp)) =
    Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T sp
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.simpl_pred;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.simplPredType

## Corelib.ssr.ssrbool.memPredType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.memPredType

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.mem_mem

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.mem_mem.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_mem.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (mp : Rocq.Corelib.ssr.ssrbool.mem_pred T),
  Rocq.Corelib.Init.Datatypes.prod.qualityProp
    (Rocq.Corelib.Init.Datatypes.prod.qualityProp
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.memPredType T) mp = mp)
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T)
          (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T mp) =
        mp))
    (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T mp)) =
      mp)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.Init.Datatypes.prod.qualityProp;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.memPredType;Rocq.Corelib.ssr.ssrbool.simplPredType;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce

## Corelib.ssr.ssrbool.mem_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.mem_pred

## Corelib.ssr.ssrbool.mem_pred_value

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.mem_pred_value

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.manifest_mem_pred T p → Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.mem_simpl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.mem_simpl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_simpl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (sp : Rocq.Corelib.ssr.ssrbool.simpl_pred T),
  Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T
      (Rocq.Corelib.ssr.ssrbool.simpl_of_mem T
        (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.simplPredType T) sp)) =
    Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T sp
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.simpl_pred;Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.simpl_of_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.simplPredType

## Corelib.ssr.ssrbool.mem_topred

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.mem_topred.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mem_topred.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (pT : Rocq.Corelib.ssr.ssrbool.predType T)
  (pp : Rocq.Corelib.ssr.ssrbool.pred_sort T pT),
  Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) (Rocq.Corelib.ssr.ssrbool.topred T pT pp) =
    Rocq.Corelib.ssr.ssrbool.mem T pT pp
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predType;Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.ssr.ssrbool.topred

## Corelib.ssr.ssrbool.mono1W_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.mono1W_in.statement

## Corelib.ssr.ssrbool.mono2W

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.mono2W.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mono2W.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
      rR x y) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_2 aT rT f (fun x y => Rocq.Corelib.Init.Datatypes.is_true (aR x y)) fun x y =>
      Rocq.Corelib.Init.Datatypes.is_true (rR x y)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrfun.homomorphism_2;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.monoLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.monoLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoLR.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      ∀ (x : aT) (y : rT), rR (f x) y = aR x (g y)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.monoLR_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.monoLR_in.statement

## Corelib.ssr.ssrbool.monoRL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.monoRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoRL.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT) (g : rT → aT)
  (aR : Rocq.Corelib.ssr.ssrbool.rel aT) (rR : Rocq.Corelib.ssr.ssrbool.rel rT),
  Rocq.Corelib.ssr.ssrfun.cancel aT rT g f →
    (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
        rR x y) →
      ∀ (x : rT) (y : aT), rR x (f y) = aR (g x) y
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.cancel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.monoRL_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.monoRL_in.statement

## Corelib.ssr.ssrbool.monoW

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.monoW.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.monoW.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2175) (rT : Type u_Corelib_ssr_ssrbool_2176) (f : aT → rT)
  (aP : Rocq.Corelib.ssr.ssrbool.pred aT) (rP : Rocq.Corelib.ssr.ssrbool.pred rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_1 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x => aP x) fun x => rP x) →
    Rocq.Corelib.ssr.ssrfun.homomorphism_1 aT rT f (fun x => Rocq.Corelib.Init.Datatypes.is_true (aP x)) fun x =>
      Rocq.Corelib.Init.Datatypes.is_true (rP x)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrfun.monomorphism_1;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrfun.homomorphism_1;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.monoW_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.monoW_in.statement

## Corelib.ssr.ssrbool.mono_sym

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.mono_sym.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.mono_sym.statement.correspondence

```lean
∀ (aT : Type u_Corelib_ssr_ssrbool_2262) (rT : Type u_Corelib_ssr_ssrbool_2263) (aR : Rocq.Corelib.ssr.ssrbool.rel aT)
  (rR : Rocq.Corelib.ssr.ssrbool.rel rT) (f : aT → rT),
  (Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun x y => aR x y) fun x y =>
      rR x y) →
    Rocq.Corelib.ssr.ssrfun.monomorphism_2 aT rT Rocq.Corelib.Init.Datatypes.bool f (fun y x => aR x y) fun y x =>
      rR x y
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrfun.monomorphism_2;Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.mono_sym_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.mono_sym_in.statement

## Corelib.ssr.ssrbool.mono_sym_in11

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.mono_sym_in11.statement

## Corelib.ssr.ssrbool.nandP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.nandP

## Corelib.ssr.ssrbool.negP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.negP

## Corelib.ssr.ssrbool.negPP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.negPP

## Corelib.ssr.ssrbool.negPf

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.negPf

## Corelib.ssr.ssrbool.negPn

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.negPn

## Corelib.ssr.ssrbool.negbF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbF.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.negbFE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbFE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbFE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.negbK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbK.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.involutive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.negb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.involutive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbLR

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbLR.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbLR.statement.correspondence

```lean
∀ (b c : Rocq.Corelib.Init.Datatypes.bool),
  b = Rocq.Corelib.Init.Datatypes.negb c → Rocq.Corelib.Init.Datatypes.negb b = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbNE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbNE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbNE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.negb b)) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbRL

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbRL.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbRL.statement.correspondence

```lean
∀ (b c : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb b = c → b = Rocq.Corelib.Init.Datatypes.negb c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  b = Rocq.Corelib.Init.Datatypes.bool.false → Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negbTE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negbTE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negbTE.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → b = Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.negb_and

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negb_and.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_and.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.andb a b) =
    Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.negb_imply

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negb_imply.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_imply.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.implb a b) =
    Rocq.Corelib.Init.Datatypes.andb a (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.implb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.negb_inj

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negb_inj.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_inj.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.injective Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.negb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.injective;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.negb_or

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.negb_or.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.negb_or.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.negb (Rocq.Corelib.Init.Datatypes.orb a b) =
    Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.negb a) (Rocq.Corelib.Init.Datatypes.negb b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.norP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.norP

## Corelib.ssr.ssrbool.notF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.notF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.notF.statement.correspondence

```lean
¬Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.not_false_is_true

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.not_false_is_true.statement.correspondence

```lean
¬Rocq.Corelib.Init.Datatypes.is_true Rocq.Corelib.Init.Datatypes.bool.false
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.bool.false

## Corelib.ssr.ssrbool.ocan_in_comp

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.ocan_in_comp.statement

## Corelib.ssr.ssrbool.on1S

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1S.statement

## Corelib.ssr.ssrbool.on1S_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1S_in.statement

## Corelib.ssr.ssrbool.on1T

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1T.statement

## Corelib.ssr.ssrbool.on1W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1W.statement

## Corelib.ssr.ssrbool.on1W_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1W_in.statement

## Corelib.ssr.ssrbool.on1lS

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1lS.statement

## Corelib.ssr.ssrbool.on1lS_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1lS_in.statement

## Corelib.ssr.ssrbool.on1lT

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1lT.statement

## Corelib.ssr.ssrbool.on1lW

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1lW.statement

## Corelib.ssr.ssrbool.on1lW_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on1lW_in.statement

## Corelib.ssr.ssrbool.on2S

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on2S.statement

## Corelib.ssr.ssrbool.on2S_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on2S_in.statement

## Corelib.ssr.ssrbool.on2T

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on2T.statement

## Corelib.ssr.ssrbool.on2W

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on2W.statement

## Corelib.ssr.ssrbool.on2W_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on2W_in.statement

## Corelib.ssr.ssrbool.onPhantom

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.onPhantom.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.onPhantom.statement.correspondence

```lean
∀ (T : Sort u_Corelib_ssr_ssrbool_1694) (P : T → Prop) (x : T), Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (P x)
```

Residual source symbols: Rocq.Corelib.ssr.ssreflect_rw.phantom

## Corelib.ssr.ssrbool.onS_can

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onS_can.statement

## Corelib.ssr.ssrbool.onS_can_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onS_can_in.statement

## Corelib.ssr.ssrbool.onT_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onT_bij.statement

## Corelib.ssr.ssrbool.onW_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onW_bij.statement

## Corelib.ssr.ssrbool.onW_can

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onW_can.statement

## Corelib.ssr.ssrbool.onW_can_in

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.onW_can_in.statement

## Corelib.ssr.ssrbool.on_can_inj

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.on_can_inj.statement

## Corelib.ssr.ssrbool.or3

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or3P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.or3P

## Corelib.ssr.ssrbool.or3_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.or3_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or3_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or3_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.or3_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or3_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → Rocq.Corelib.ssr.ssrbool.or3 P1 P2 P3 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.or3

## Corelib.ssr.ssrbool.or4

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.or4P

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.or4P

## Corelib.ssr.ssrbool.or4_ind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.or4_ind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or4_ind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.or4_sind

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.or4_sind.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.or4_sind.statement.correspondence

```lean
∀ (P1 P2 P3 P4 P : Prop), (P1 → P) → (P2 → P) → (P3 → P) → (P4 → P) → Rocq.Corelib.ssr.ssrbool.or4 P1 P2 P3 P4 → P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.or4

## Corelib.ssr.ssrbool.orFb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orFb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orFb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orKb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orKb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orKb.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.andb a (Rocq.Corelib.Init.Datatypes.orb b a) = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orNb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orNb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orNb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.orb (Rocq.Corelib.Init.Datatypes.negb b) b = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.orP

## Corelib.ssr.ssrbool.orPP

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.orPP

## Corelib.ssr.ssrbool.orTb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orTb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orTb.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.bool.true b)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orbA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.associative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.associative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbAC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbAC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbAC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbACA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbACA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbACA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.interchange Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
  Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.interchange;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbC

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbC.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbC.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbCA

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbCA.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbCA.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_commutative Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_commutative;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbF

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbF.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbF.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_id Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.bool.false Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_id;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.bool.false;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbK

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbK.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbK.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool), Rocq.Corelib.Init.Datatypes.andb (Rocq.Corelib.Init.Datatypes.orb a b) a = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.andb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbN

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbN.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbN.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.orb b (Rocq.Corelib.Init.Datatypes.negb b) = Rocq.Corelib.Init.Datatypes.bool.true
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orbT

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbT.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbT.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.orb b Rocq.Corelib.Init.Datatypes.bool.true)
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.bool.true

## Corelib.ssr.ssrbool.orb_andl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_andl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_andl.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.left_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.left_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.orb_andr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_andr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_andr.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.right_distributive Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.bool
  Rocq.Corelib.Init.Datatypes.orb Rocq.Corelib.Init.Datatypes.andb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.right_distributive;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb;Rocq.Corelib.Init.Datatypes.andb

## Corelib.ssr.ssrbool.orb_id2l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_id2l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2l.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb a) → b = c) →
    Rocq.Corelib.Init.Datatypes.orb a b = Rocq.Corelib.Init.Datatypes.orb a c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_id2r

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_id2r.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_id2r.statement.correspondence

```lean
∀ (a b c : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → a = c) →
    Rocq.Corelib.Init.Datatypes.orb a b = Rocq.Corelib.Init.Datatypes.orb c b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_idl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_idl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_idl.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true a → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.orb a b = b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orb_idr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orb_idr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orb_idr.statement.correspondence

```lean
∀ (a b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true b → Rocq.Corelib.Init.Datatypes.is_true a) →
    Rocq.Corelib.Init.Datatypes.orb a b = a
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.orbb

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.orbb.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.orbb.statement.correspondence

```lean
Rocq.Corelib.ssr.ssrfun.idempotent_op Rocq.Corelib.Init.Datatypes.bool Rocq.Corelib.Init.Datatypes.orb
```

Residual source symbols: Rocq.Corelib.ssr.ssrfun.idempotent_op;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.orb

## Corelib.ssr.ssrbool.pair_andP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.pair_andP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.pair_andP.statement.correspondence

```lean
∀ (P Q : Prop), P ∧ Q ↔ Rocq.Corelib.Init.Datatypes.prod.qualityProp P Q
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.prod.qualityProp

## Corelib.ssr.ssrbool.pcan_in_comp

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.pcan_in_comp.statement

## Corelib.ssr.ssrbool.pcan_in_inj

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.pcan_in_inj.statement

## Corelib.ssr.ssrbool.pre_symmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.pre_symmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pre_symmetric.roundtrip

## Corelib.ssr.ssrbool.pred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.pred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pred.roundtrip

## Corelib.ssr.ssrbool.pred0

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.pred0

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predArgType

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.predArgType

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.predArgType.roundtrip

## Corelib.ssr.ssrbool.predC

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predC

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predD

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predD

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predI

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predI

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predPredType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predPredType

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.predT

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predT

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.predType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predType

## Corelib.ssr.ssrbool.predU

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.predU

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.pred_key

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.pred_key

## Corelib.ssr.ssrbool.pred_oapp

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.pred_oapp

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.pred_oapp.roundtrip

## Corelib.ssr.ssrbool.pred_of_argType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.pred_of_argType

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.pred_of_mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.pred_of_mem

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.pred_sort

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.pred_sort

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.preim

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.preim

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.prop_congr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.prop_congr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.prop_congr.statement.correspondence

```lean
∀ (b b' : Rocq.Corelib.Init.Datatypes.bool),
  b = b' → Rocq.Corelib.Init.Datatypes.is_true b = Rocq.Corelib.Init.Datatypes.is_true b'
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.prop_for

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_for

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P x)

## Corelib.ssr.ssrbool.prop_in1

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in1

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in11

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in11

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in111

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in111

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in12

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in12

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in2

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in21

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in21

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_in3

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_in3

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T1

## Corelib.ssr.ssrbool.prop_on1

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_on1

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T2

## Corelib.ssr.ssrbool.prop_on2

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.prop_on2

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T2

## Corelib.ssr.ssrbool.qualifE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.qualifE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.qualifE.statement.correspondence

```lean
∀ (n : Nat) (T : Type u_Corelib_ssr_ssrbool_1343)
  (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)) (x : T),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T)
        (Rocq.Corelib.ssr.ssrbool.has_quality (NativeBridge.natOf n) T
          (Rocq.Corelib.ssr.ssrbool.qualifier.Qualifier (NativeBridge.natOf n) T p))) =
    p x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.ssr.ssrbool.predPredType;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.has_quality;Rocq.Corelib.ssr.ssrbool.qualifier.Qualifier

## Corelib.ssr.ssrbool.qualifier

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.qualifier

## Corelib.ssr.ssrbool.reflexive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.reflexive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.reflexive.roundtrip

## Corelib.ssr.ssrbool.registered_applicative_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.registered_applicative_pred

## Corelib.ssr.ssrbool.rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.rel.roundtrip

## Corelib.ssr.ssrbool.relU

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.relU

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.rel_of_simpl

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.rel_of_simpl

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun T Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.relpre

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.relpre

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrfun.simpl_fun aT Rocq.Corelib.Init.Datatypes.bool

## Corelib.ssr.ssrbool.rev_trans

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.rev_trans.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rev_trans.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1105) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.transitive T fun x y => R y x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.transitive

## Corelib.ssr.ssrbool.right_transitive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.right_transitive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.right_transitive.roundtrip

## Corelib.ssr.ssrbool.rwP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.rwP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rwP.statement.correspondence

```lean
∀ (P : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b),
  P ↔ Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.is_true

## Corelib.ssr.ssrbool.rwP2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.rwP2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.rwP2.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect Q b), P ↔ Q
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.sameP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sameP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sameP.statement.correspondence

```lean
∀ (P : Prop) (b c : Rocq.Corelib.Init.Datatypes.bool) (Pb : Rocq.Corelib.Init.Datatypes.reflect P b)
  (a : Rocq.Corelib.Init.Datatypes.reflect P c), b = c
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect

## Corelib.ssr.ssrbool.simplPredType

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.simplPredType

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.predType T

## Corelib.ssr.ssrbool.simpl_of_mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.simpl_of_mem

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.simpl_pred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.simpl_pred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.simpl_pred.roundtrip

## Corelib.ssr.ssrbool.simpl_predE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.simpl_predE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.simpl_predE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (p : Rocq.Corelib.ssr.ssrbool.pred T),
  Rocq.Corelib.ssr.ssrfun.eqfun Rocq.Corelib.Init.Datatypes.bool T
    (Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce T (Rocq.Corelib.ssr.ssrbool.SimplPred T p)) p
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.ssr.ssrfun.eqfun;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.PredOfSimpl.coerce;Rocq.Corelib.ssr.ssrbool.SimplPred

## Corelib.ssr.ssrbool.simpl_pred_value

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.simpl_pred_value

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred T) →
  Rocq.Corelib.ssr.ssrbool.manifest_simpl_pred T p → Rocq.Corelib.ssr.ssrbool.simpl_pred T

## Corelib.ssr.ssrbool.simpl_rel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.simpl_rel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.simpl_rel.roundtrip

## Corelib.ssr.ssrbool.sort_of_predArgType

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.sort_of_predArgType

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.sort_of_predArgType.roundtrip

## Corelib.ssr.ssrbool.sub_in1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in1.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (P1 : T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), P1 x)),
      Rocq.Corelib.ssr.ssrbool.prop_in1 T1 d1' P1 Ph → Rocq.Corelib.ssr.ssrbool.prop_in1 T1 d1 P1 Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in1

## Corelib.ssr.ssrbool.sub_in11

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in11.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in11.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (P2 : T1 → T2 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2), P2 x y)),
        Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 d1' d2' P2 Ph → Rocq.Corelib.ssr.ssrbool.prop_in11 T1 T2 d1 d2 P2 Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in11

## Corelib.ssr.ssrbool.sub_in111

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in111.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in111.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (T3 : Rocq.Corelib.ssr.ssrbool.predArgType) (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (d3 d3' : Rocq.Corelib.ssr.ssrbool.mem_pred T3)
  (P3 : T1 → T2 → T3 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
      Rocq.Corelib.ssr.ssrbool.sub_mem T3 d3 d3' →
        ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y : T2) (z : T3), P3 x y z)),
          Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 d1' d2' d3' P3 Ph →
            Rocq.Corelib.ssr.ssrbool.prop_in111 T1 T2 T3 d1 d2 d3 P3 Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in111

## Corelib.ssr.ssrbool.sub_in12

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in12.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in12.statement.correspondence

```lean
∀ (T1 : Type u_Corelib_ssr_ssrbool_2134) (T : Type u_Corelib_ssr_ssrbool_2135)
  (d1 d1' : Rocq.Corelib.ssr.ssrbool.mem_pred T1) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T1 → T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T1 d1 d1' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1) (y z : T), P x y z)),
        Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T d1' d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in12 T1 T d1 d P Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in12

## Corelib.ssr.ssrbool.sub_in2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in2.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2112) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T), P x y)),
      Rocq.Corelib.ssr.ssrbool.prop_in2 T d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in2 T d P Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in2

## Corelib.ssr.ssrbool.sub_in21

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in21.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in21.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2150) (T3 : Type u_Corelib_ssr_ssrbool_2151)
  (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (d3 d3' : Rocq.Corelib.ssr.ssrbool.mem_pred T3) (P : T → T → T3 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    Rocq.Corelib.ssr.ssrbool.sub_mem T3 d3 d3' →
      ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T) (z : T3), P x y z)),
        Rocq.Corelib.ssr.ssrbool.prop_in21 T T3 d' d3' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in21 T T3 d d3 P Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in21

## Corelib.ssr.ssrbool.sub_in3

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_in3.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_in3.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_2121) (d d' : Rocq.Corelib.ssr.ssrbool.mem_pred T) (P : T → T → T → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T d d' →
    ∀ (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y z : T), P x y z)),
      Rocq.Corelib.ssr.ssrbool.prop_in3 T d' P Ph → Rocq.Corelib.ssr.ssrbool.prop_in3 T d P Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_in3

## Corelib.ssr.ssrbool.sub_in_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.sub_in_bij.statement

## Corelib.ssr.ssrbool.sub_mem

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.sub_mem

Reason for interface not covered: No registered type bijection for Rocq.Corelib.ssr.ssrbool.mem_pred T

## Corelib.ssr.ssrbool.sub_refl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sub_refl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sub_refl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1226) (mp : Rocq.Corelib.ssr.ssrbool.mem_pred T),
  Rocq.Corelib.ssr.ssrbool.sub_mem T mp mp
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem

## Corelib.ssr.ssrbool.subon1

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.subon1.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon1.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (Q1 : (T1 → T2) → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), Q1 f x)),
      Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 Prop d2' f (fun f'' => ∀ (x : T1), Q1 f'' x) (Q1 f) Phf Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 Prop d2 f (fun f'' => ∀ (x : T1), Q1 f'' x) (Q1 f) Phf Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on1

## Corelib.ssr.ssrbool.subon1l

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.subon1l.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon1l.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (T3 : Rocq.Corelib.ssr.ssrbool.predArgType) (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (h : T3)
  (Q1l : (T1 → T2) → T3 → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf : Rocq.Corelib.ssr.ssreflect_rw.phantom (T3 → Prop) fun h' => ∀ (x : T1), Q1l f h' x)
      (Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x : T1), Q1l f h x)),
      Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 (T3 → Prop) d2' f (fun f'' h' => ∀ (x : T1), Q1l f'' h' x) (Q1l f h) Phf
          Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on1 T1 T2 (T3 → Prop) d2 f (fun f'' h' => ∀ (x : T1), Q1l f'' h' x) (Q1l f h) Phf
          Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on1

## Corelib.ssr.ssrbool.subon2

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.subon2.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subon2.statement.correspondence

```lean
∀ (T1 : Rocq.Corelib.ssr.ssrbool.predArgType) (T2 : Rocq.Corelib.ssr.ssrbool.predArgType)
  (d2 d2' : Rocq.Corelib.ssr.ssrbool.mem_pred T2) (f : T1 → T2) (Q2 : (T1 → T2) → T1 → T1 → Prop),
  Rocq.Corelib.ssr.ssrbool.sub_mem T2 d2 d2' →
    ∀ (Phf Ph : Rocq.Corelib.ssr.ssreflect_rw.phantom Prop (∀ (x y : T1), Q2 f x y)),
      Rocq.Corelib.ssr.ssrbool.prop_on2 T1 T2 Prop d2' f (fun f'' => ∀ (x y : T1), Q2 f'' x y) (Q2 f) Phf Ph →
        Rocq.Corelib.ssr.ssrbool.prop_on2 T1 T2 Prop d2 f (fun f'' => ∀ (x y : T1), Q2 f'' x y) (Q2 f) Phf Ph
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predArgType;Rocq.Corelib.ssr.ssrbool.mem_pred;Rocq.Corelib.ssr.ssrbool.sub_mem;Rocq.Corelib.ssr.ssreflect_rw.phantom;Rocq.Corelib.ssr.ssrbool.prop_on2

## Corelib.ssr.ssrbool.subon_bij

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.subon_bij.statement

## Corelib.ssr.ssrbool.subpred

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.subpred

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.subpred.roundtrip

## Corelib.ssr.ssrbool.subrel

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.subrel

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.subrel.roundtrip

## Corelib.ssr.ssrbool.subrelUl

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.subrelUl.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subrelUl.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1199) (r1 r2 : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.subrel T r1 (Rocq.Corelib.ssr.ssrbool.rel_of_simpl T (Rocq.Corelib.ssr.ssrbool.relU T r1 r2))
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.subrel;Rocq.Corelib.ssr.ssrbool.rel_of_simpl;Rocq.Corelib.ssr.ssrbool.relU

## Corelib.ssr.ssrbool.subrelUr

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.subrelUr.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.subrelUr.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1201) (r1 r2 : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.subrel T r2 (Rocq.Corelib.ssr.ssrbool.rel_of_simpl T (Rocq.Corelib.ssr.ssrbool.relU T r1 r2))
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.subrel;Rocq.Corelib.ssr.ssrbool.rel_of_simpl;Rocq.Corelib.ssr.ssrbool.relU

## Corelib.ssr.ssrbool.sumboolP

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.sumboolP

## Corelib.ssr.ssrbool.sym_left_transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sym_left_transitive.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.symmetric T R →
    Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.left_transitive T R
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.symmetric;Rocq.Corelib.ssr.ssrbool.transitive;Rocq.Corelib.ssr.ssrbool.left_transitive

## Corelib.ssr.ssrbool.sym_right_transitive

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.sym_right_transitive.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1473) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.symmetric T R →
    Rocq.Corelib.ssr.ssrbool.transitive T R → Rocq.Corelib.ssr.ssrbool.right_transitive T R
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.symmetric;Rocq.Corelib.ssr.ssrbool.transitive;Rocq.Corelib.ssr.ssrbool.right_transitive

## Corelib.ssr.ssrbool.symmetric

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.symmetric

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.symmetric.roundtrip

## Corelib.ssr.ssrbool.symmetric_from_pre

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.symmetric_from_pre.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1105) (R : Rocq.Corelib.ssr.ssrbool.rel T),
  Rocq.Corelib.ssr.ssrbool.pre_symmetric T R → Rocq.Corelib.ssr.ssrbool.symmetric T R
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.rel;Rocq.Corelib.ssr.ssrbool.pre_symmetric;Rocq.Corelib.ssr.ssrbool.symmetric

## Corelib.ssr.ssrbool.topred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.topred

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.predType T) →
  Rocq.Corelib.ssr.ssrbool.pred_sort T p → Rocq.Corelib.ssr.ssrbool.pred T

## Corelib.ssr.ssrbool.topredE

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.topredE.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.topredE.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (pT : Rocq.Corelib.ssr.ssrbool.predType T) (x : T)
  (pp : Rocq.Corelib.ssr.ssrbool.pred_sort T pT),
  Rocq.Corelib.ssr.ssrbool.topred T pT pp x = Rocq.Corelib.ssr.ssrbool.in_mem T x (Rocq.Corelib.ssr.ssrbool.mem T pT pp)
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.predType;Rocq.Corelib.ssr.ssrbool.pred_sort;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.topred;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem

## Corelib.ssr.ssrbool.total

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.total

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.total.roundtrip

## Corelib.ssr.ssrbool.transitive

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.transitive

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.transitive.roundtrip

## Corelib.ssr.ssrbool.unfold_in

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.unfold_in.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.unfold_in.statement.correspondence

```lean
∀ (T : Type u_Corelib_ssr_ssrbool_1253) (x : T) (p : Rocq.Corelib.ssr.ssrbool.pred T),
  Rocq.Corelib.ssr.ssrbool.in_mem T x
      (Rocq.Corelib.ssr.ssrbool.mem T (Rocq.Corelib.ssr.ssrbool.predPredType T) fun x => p x) =
    p x
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.pred;Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.ssr.ssrbool.in_mem;Rocq.Corelib.ssr.ssrbool.mem;Rocq.Corelib.ssr.ssrbool.predPredType

## Corelib.ssr.ssrbool.unkey_pred

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.unkey_pred

Reason for interface not covered: No registered type bijection for (p : Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)) →
  (k : Rocq.Corelib.ssr.ssrbool.pred_key T p) →
    Rocq.Corelib.ssr.ssrbool.keyed_pred T p k →
      Rocq.Corelib.ssr.ssrbool.pred_sort T (Rocq.Corelib.ssr.ssrbool.predPredType T)

## Corelib.ssr.ssrbool.unkey_qualifier

Status: NOT_YET_BRIDGED. No certificate in this batch yet; this does not imply that a correspondence is mathematically impossible.

Original target: Rocq.Corelib.ssr.ssrbool.unkey_qualifier

Reason for interface not covered: No registered type bijection for (n : Rocq.Corelib.Init.Datatypes.nat) →
  (q : Rocq.Corelib.ssr.ssrbool.qualifier n T) →
    (k : Rocq.Corelib.ssr.ssrbool.pred_key T (Rocq.Corelib.ssr.ssrbool.has_quality n T q)) →
      Rocq.Corelib.ssr.ssrbool.keyed_qualifier T n q k → Rocq.Corelib.ssr.ssrbool.qualifier n T

## Corelib.ssr.ssrbool.unless

Status: TRANSPORT_INTERFACE_ONLY. Round-trip laws for the native-type interface have been proved; equality with the corresponding existing Lean function has not yet been proved.

Original target: Rocq.Corelib.ssr.ssrbool.unless

Interface round-trip certificate: NativeBridge.Interfaces.Rocq.Corelib.ssr.ssrbool.unless.roundtrip

## Corelib.ssr.ssrbool.unlessL

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.unlessL

## Corelib.ssr.ssrbool.unlessP

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.unlessP.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.unlessP.statement.correspondence

```lean
∀ (C P : Prop), Rocq.Corelib.ssr.ssrbool.unless C P ↔ C ∨ P
```

Residual source symbols: Rocq.Corelib.ssr.ssrbool.unless

## Corelib.ssr.ssrbool.unlessR

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.unlessR

## Corelib.ssr.ssrbool.unless_contra

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.unless_contra

## Corelib.ssr.ssrbool.unless_sym

Status: EXPLICIT_PROOF_PARAMETERS. The original translation still has explicit proof parameters; this batch neither discharges nor assumes them.

Original target: RocqPending.Corelib.ssr.ssrbool.unless_sym

## Corelib.ssr.ssrbool.wlog_neg

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.wlog_neg.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.wlog_neg.statement.correspondence

```lean
∀ (b : Rocq.Corelib.Init.Datatypes.bool),
  (Rocq.Corelib.Init.Datatypes.is_true (Rocq.Corelib.Init.Datatypes.negb b) → Rocq.Corelib.Init.Datatypes.is_true b) →
    Rocq.Corelib.Init.Datatypes.is_true b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.is_true;Rocq.Corelib.Init.Datatypes.negb

## Corelib.ssr.ssrbool.xorPif

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.xorPif.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.xorPif.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool) (Hb : Rocq.Corelib.Init.Datatypes.reflect P b),
  Q ∨ P → ¬(Q ∧ P) → Rocq.Corelib.Init.Datatypes.bool.rec (¬Q) Q b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.bool.rec

## Corelib.ssr.ssrbool.xorPifn

Status: STATEMENT_PARTIAL. An iff has been proved, but the result still contains source types, functions, or auxiliary models; it is not fully expressed in native terms.

Original target: Rocq.Corelib.ssr.ssrbool.xorPifn.statement

Statement certificate: NativeBridge.Statements.Rocq.Corelib.ssr.ssrbool.xorPifn.statement.correspondence

```lean
∀ (P Q : Prop) (b : Rocq.Corelib.Init.Datatypes.bool)
  (Hb : Rocq.Corelib.Init.Datatypes.reflect P (Rocq.Corelib.Init.Datatypes.negb b)),
  Q ∨ P → ¬(Q ∧ P) → Rocq.Corelib.Init.Datatypes.bool.rec Q (¬Q) b
```

Residual source symbols: Rocq.Corelib.Init.Datatypes.bool;Rocq.Corelib.Init.Datatypes.reflect;Rocq.Corelib.Init.Datatypes.negb;Rocq.Corelib.Init.Datatypes.bool.rec