> Instances of this directory are from the historical main75 bootstrap baseline and are retained as controls. For current mechanical nat/eq unified interoperability examples please see [UseNative.lean](../../../experiments/mechanical-correspondence-20261019/UseNative.lean) and [Description ](../../../experiments/mechanical-correspondence-20261019/README.md).

Lean interoperability demonstration

Nat.lean: The translated Rocq add directly receives/returns Lean Nat. For any n, m, use Lean to inductively prove that add n m = n+m; there are also two closed term calculation equations.

List.lean: Translated Rocq list is a separate data type. Explicit fromLean/toLean bidirectional conversion; prove that the round-trip identity in both directions, length is consistent with Lean List.length, app is consistent with Lean List.append, are valid for any element universe.

axiom closure of the five theorems are all empty. What is used here is the actual translation result of the final main75, rather than hand-writing a similar alternative implementation. The source test mistakenly thought that Lean 0+m was defined equal to m for the first time, and Nat.zero_add was used instead; the original failure log was retained in work/tests/basic-interop75.

Currently importer registers kernel declarations and is not running the Lean compiler for the new inductive type. The two bridging definitions of List are therefore marked noncomputable: retaining the reducible kernel definition and generating no runtime code; not adding an axiom, nor affecting the above proof. Compiling an executable program is additional packaging work.

Rerun: python3 interop/run.py (complete in warehouse).
