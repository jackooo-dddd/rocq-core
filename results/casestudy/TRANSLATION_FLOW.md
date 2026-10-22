# Mechanical translation of Nat: Source → IR → Lean → Independent Correspondence Proof

This page separates the actual documentation from the explanation: the declaration status, try labels, and translations are from the freeze report; the "why recursor" explanation is from the source IR shape and translations. Existing materials do not preserve the step-by-step rewrite trajectory of each AST node.

## 1. Type and constructor of Rocq

[Definition in source/Datatypes.v](source/Datatypes.v):

    Inductive nat : Set :=
      | O : nat
      | S : nat -> nat.

For export records, see [mechanical_record.source_ir of [nat.json](declarations/Corelib.Init.Datatypes.nat.json)]. nat is an inductive block, and the constructor is stored in the block, not two independent root. Source Set is translated here as Lean Type.

The actual generated results are shown in [Datatypes.txt](lean/Datatypes.txt):

    inductive Rocq.Corelib.Init.Datatypes.nat : Type
    Rocq.Corelib.Init.Datatypes.nat.O : Rocq.Corelib.Init.Datatypes.nat
    Rocq.Corelib.Init.Datatypes.nat.S :
      Rocq.Corelib.Init.Datatypes.nat → Rocq.Corelib.Init.Datatypes.nat

The above three lines display the type and signature according to the printed content. The compiled inductive command cannot be pasted as it is. The real registration statement is the importer and Lean kernel.

The translation identities of the constructors are O → Rocq.Corelib.Init.Datatypes.nat.O, S → Rocq.Corelib.Init.Datatypes.nat.S. They are not aliases for Lean native Nat.zero/Nat.succ. The Lean core also generates its own nat.rec.

The actual allocation is inductive/generated, the attempt is i[pl], the result is TRANSLATED_AND_CHECKED, and there are no conditions to be verified. Here pl represents the induction path plain levels; should not be confused with the Prop lift switch for constant attempts.

## 2. How to generate export files

[exports/Datatypes/Export.v](exports/Datatypes/Export.v) / [exports/Nat/Export.v](exports/Nat/Export.v) is the MetaRocq export driver.
The exporter generates source.ndjson, which contains header, roots, dependency declarations, native universe information, and source type/body IR. It does not directly output the Lean source code.

[exports/Nat/source.ndjson](exports/Nat/source.ndjson) contains the dependency closure of Init.Nat, so it can reference the same source nat in Datatypes. The certification conditions that the source is prepared to extract also belong to the export process.
Source roundtrip Rebuild IR into a Rocq statement and return it to the Rocq kernel for review, see [RoundTrip.v](exports/Nat/source-roundtrip/RoundTrip.v) and the corresponding log; this check cannot replace the Lean check.

## 3. Use add to see function translation

[source/Nat.v](source/Nat.v) in:

    Fixpoint add n m :=
      match n with
      | 0 => m
      | S p => S (p + m)
      end
    where "n + m" := (add n m) : nat_scope.

[Full record of add source_ir.body in ](declarations/Corelib.Init.Nat.add.json) is a fix node: single definition, rarg=0; inside are two lambda and case to n.
The zero branch returns m; subsequent branches wrap recursive calls with the source constructor S. The variables in IR are indexed by de Bruijn, and construct is represented by the inductive block identity and constructor number.

Here the structural recursion can be expressed using the newly generated nat.rec. Which motive lets the recursive result itself be a "function taking a second argument", getting the actual output:

    def Rocq.Corelib.Init.Nat.add :
      Rocq.Corelib.Init.Datatypes.nat →
      Rocq.Corelib.Init.Datatypes.nat →
      Rocq.Corelib.Init.Datatypes.nat :=
    fun n m =>
      Rocq.Corelib.Init.Datatypes.nat.rec
        (motive := fun _ =>
          Rocq.Corelib.Init.Datatypes.nat →
          Rocq.Corelib.Init.Datatypes.nat)
        (fun m => m)
        (fun _ ih m => (ih m).S)
        n m

Here, the printed universe parameters are omitted and the useless binder name is rewritten for the sake of reading; [add declares page by page ](declarations/Corelib.Init.Nat.add.md) and [original Nat.txt](lean/Nat.txt) saves the printed result without this abbreviation.
The zero branch is fun m => m; the subsequent branch uses the recursive result ih m, and then calls the mechanical constructor S.

The actual tier record of add is only c[], the result is TRANSLATED_AND_CHECKED, and the parameters to be verified are empty. An empty switch list means that no additional policy switches in this tag are needed and cannot be interpreted as "no translation rules are applied".

## 4. Registration and Inspection

After the dependencies are ready, the constant/inductive block is dispatched differently; after the target expression passes the hierarchical solution, type and constraint check, it is accepted by the Lean kernel.
The itemized report is saved in translation_report.json; translation_timing.json records the attempt sequence and results; contract.json and translation_manifest.json associate this input/output and consumption contract.

There are also independent Lean consumer and structure audit. roundtrip, consumer, and audit of the three modules all passed; this case retains their original results without re-forging or re-running historical translations.

The main implementation entrances are translateSource, processInductiveCore, processConstantCore, and Translate.lean in warehouse translator/Rocq2Lean/Emit.lean. Native mapping registry Bootstrap.lean is empty.

## 5. Different products still have different restrictions.

- [gcd](declarations/Corelib.Init.Nat.gcd.md): PENDING_KERNEL_CHECKED, additionally carry Corelib.Init.Nat.gcd__rocq2lean_termination_1; this condition is not eliminated in this case.
- Many theorem outputs in Peano are propositional definitions; their types are checked and are not proven by migrated sources.
- Nat also relies on mechanical bool, comparison, digital representation, etc. Full module copies and exported closures retain these dependencies without artificially replacing them with Lean native types.
- The .lean file is the importer entry; .txt is the actual expanded print result for human reading in this case.

## 6. Connect the native Nat after the translation is completed.

natTo / natOf and their inverse laws, constructor correspondences, addition and other operation correspondences are established in a separate proof of correspondence.
For example, natTo (mechanical add n m) = natTo n + natTo m. On the right is the Lean native addition.
This proof is not the input of mechanical translation, nor is it a special bootstrap rule for nat.

See [CORRESPONDENCE.md](CORRESPONDENCE.md). [KernelExample.lean](lean/KernelExample.lean) provides a stand-alone mechanical constructor and additive kernel reduction demonstration.
