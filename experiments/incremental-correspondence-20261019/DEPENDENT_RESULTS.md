# Dependency Elimination and Conditional Instantiation: The Fifth Batch

This file retains the counts at the completion of the fifth batch; see RECURSION_STATEMENTS_RESULTS.md and README.md for the latest results.

This batch of 16 new operational roots passed correspondence, and 5 type certificates covering the complete Sort range were added; these 5 type roots originally already had Type range certificates, so the number of type roots will not be increased repeatedly. Total current completion categories 531 / 2180: 37 type, 202 operation, 292 completely native statement.

## Complete Sort range

| Mechanical type | native target | new certificate |
|---|---|---|
| sig A P | Subtype P | subtypeIso |
| sig2 A P Q | Subtype (fun x => P x ∧ Q x) | subtype2Iso |
| sigT A P | PSigma P | psigmaIso |
| sigT2 A P Q | PSigma (fun x => PProd (P x) (Q x)) | psigma2Iso |
| prod A B | PProd A B | pprodIso |

The carrier A and the data family allow Sort u, including Prop; there is no forced restriction to Type, and the data family is not pressed into a proposition. The existing bridges of Type → Sigma/Prod are still retained, and the new PSigma/PProd version is used for the wider universe range at the source.

## 12 originally unconditional operations

prod_of_sigT, sigT_of_prod, sigT_of_sigT2: corresponding to the structure/projection of native dependency pair and ordinary pair.
projT3: corresponds to the third component; use HEq to explicitly retain the dependent index and do not pretend that the two return types have been defined to be equal.

sig/sig2/sigT/sigT2 respective rec, rect, total 8 items:
- Native callbacks and motive are used in mechanical eliminators through type conversion;
- Output equals Subtype.rec, PSigma.rec, or an explicit native dependency pattern match;
- The result of rec is Type according to the source signature, and rect can be Sort;
- motive can still rely on full input without being reduced to a constant return type.

## 4 item conditional operation has been actually instantiated

| Original Machinery Statement | Number of condition parameters | Unconditional access to the entrance |
|---|---:|---|
| sigT_of_sig | 1 | NativeBridge.Incremental.sigTOfSigClosed |
| sig_of_sigT | 1 | NativeBridge.Incremental.sigOfSigTClosed |
| sig_of_sig2 | 1 | NativeBridge.Incremental.sigOfSig2Closed |
| sigT2_of_sig2 | 3 | NativeBridge.Incremental.sigT2OfSig2Closed |

Among them, the tasks of sig_of_sig2 are reused, with a total of 5 independent closed witnesses, and 6 secondary condition parameters are provided. The axiom closures of 5 witnesses are all empty. Each entry actually calls the original RocqPending definition and explicitly provides complete proof parameters; there is also a corresponding theorem that proves the result equal to the specified native construction/projection. There is no mere deletion of parameters, no assumption of obligations.

Inspections include:
- Matches item-by-item the set of pending_hypotheses in frozen translation_report;
- The Lean type witnessed corresponds to the actual obligation;
- The public type of the closed entry no longer contains obligatory parameters;
- The specific instantiation and operation correspond to kernel and axiom closure checks.

The original mechanical export has not been rewritten: it still has 331 conditional declarations. The 4 closed entries of the correspondence layer are already available, so the unprocessed condition root of this layer is 327. The ledger retains the original status=PENDING_KERNEL_CHECKED and prerequisites, while updating bridge_status to avoid confusion.

File:
- proofs/DependentElimination.lean: type bridge, 16 operation proofs, 5 witnesses, 4 entries.
- condition-obligations.json: List of conditions extracted from frozen export.
- reports/condition-discharges.json: Root-by-root conditions, complete witness types, axioms and entry types.
- reports/DependentElimination-audit.json, validation.json: Successfully verified evidence.

## Verification scope and follow-up

The new profile DependentElimination passed; a total of 12 increments profile have success records, and the certificate and source code of the old profile are still checked by the summary script. The auditor has added RocqPending reference collection to support the above instantiation, and the axiom permission has not changed; the previous successful audit of profile continues to use the original record, and does not re-claim all executions.

Plan your next steps:
- Handle more dependency statements with these complete Sort bridges and Eq transport;
- Reuse certified projection obligations, but each downstream root still needs to be actually instantiated and verified, and success cannot be automatically reported just because it relies on one certified obligation;
- Continue binary well-founded recursion, digital writing and unified import; the entire plan is not yet complete.
