> Historical bootstrap baseline. Its identity nat/eq bridges are superseded by [mechanical-correspondence-20261019](../mechanical-correspondence-20261019/README.md). Original measurements below are retained for comparison, not claimed as current proofs.

# Bridging Rocq mechanical translation and Lean native objects

Working directory: `/home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018`.
Baseline: `quality-main75`, Lean, 4.33.1. All proofs use real machine translation products as input, and no handwritten replacement data types are used to pretend to be source types.

**Status: This batch of bridging and full inventory has been completed, but all native correspondences of the entire Corelib have not yet been completed. **
Unmatched or unproven items are not called "impossible"; the remaining items remain in the list.

## How to use

Preferred `Unified.lean`: 141 selected original roots translated in the same new export with verification of source roundtrip, standalone Lean consumer, structural audit and bridge attestation. `UnifiedInterfaces.lean` additionally provides 109 automatic packaging interfaces in this environment. `UseNative.lean` is an independent imported user, and all examples of 5 are passed.

Run the ready-made example:

```sh
cd /home/shunqwang4/research/rocq-core/experiments/native-correspondence-main75-20261018
python3 run.py UseNative unified
```

```lean
import UnifiedInterfaces
open NativeBridge

-- The translated addition directly borrows the Lean native commutative law.
example (n m : Nat) :
    Rocq.Corelib.Init.Nat.add n m = Rocq.Corelib.Init.Nat.add m n := by
  rw [nat_add_agrees, nat_add_agrees, Nat.add_comm]

-- Actual mechanical translation of map, accepting and returning native Lean List through the interface.
example :
    Interfaces.Rocq.Corelib.Lists.ListDef.map.native
      Nat Nat (fun n => n + 1) [1, 2, 3] = [2, 3, 4] := rfl
```

The original file-by-file products all use the module name `Rocq2LeanOut`, which corresponds to different environments. All file-by-file profile cannot be directly mixed in one import path. `run.py` selects the correct environment for each profile; the unified library addresses the common use of the current 141 roots, and there is no claim that all 480 file-by-file interfaces have been merged into the unified library.

## Three certificates of different strengths

1. **Type bijection**: `Iso A B` contains `to : A → B`, `of : B → A` and inverse laws in both directions. You can pass values ​​back and forth, borrow native functions and transfer properties. The local small structure Iso is used here, with the complete inverse law required for bijections; Mathlib is not installed.
2. **Consistency of specified operations**: such as `nat_add_agrees`, `nat_land_agrees`, `map_agrees`, `int_mul_agrees`. Show that the actual mechanical translation operations form a commutative graph with the specified Lean native operations.
3. **Automatic native interface**: `Interfaces.…native` wraps the source function through a proven type bijection; `…roundtrip` proves that the original function is obtained by converting it back to the original representation. It provides native parameter and result interfaces, but does not automatically prove that it is equivalent to another implementation of the same name in the Lean library.

`Iso.functions`, `lists`, `options`, `products`, `sums`, `subtypes` support combination; `call`, `call₂` use native functions to process source representation; `exportFunction` Wrap the source function in the opposite direction; `forall_iff`, `exists_iff`, `transfer`, `transferBack` support the handling theorem.

## Verification statistics

| Project | Quantity |
|---|---:|
| Baseline source file | 67 (51 includes kernel roots) |
| Itemized retained source statement | 2180 |
| Different source types with bijections | 27 |
| type bijective certificate | 28 (the general form of sumbool and the special case of Decidable are proved respectively) |
| Specify native operation/predicate correspondence | 108 item source statement, 109 certificates |
| Automatic native type interface and round-trip proof | 480 / 839 candidate definitions |
| Which only covers the interfaces of the Type instance | 36 |
| Theorem Statement iff Certificate | 845 |
| Statement that has no source symbol | 143 |
| Statements that still retain source symbols | 702 |
| Original profile check | 17 / 17 |
| Statement profile Check | 36 / 36 |
| Interface profile check | 45 / 45 |

These counts intersect and cannot be added together as the total number of claims from different sources. `reports/CORELIB_LEDGER.csv` also gives a mutually exclusive status, which just covers all 2180 items.

## Established major type correspondences

| Rocq mechanical translation object | Lean corresponding |
|---|---|
| nat、eq | The baseline has been changed from bootstrap to Nat and Eq; the operation of Nat is still proved step by step |
| bool、comparison | Bool、Ordering |
| list、option、prod、sum、result | List, Option, Prod, Sum, Except (note the parameter order) |
| unit、Empty_set | Unit、Empty |
| sig、sig2 | Subtype; Subtype that satisfies both predicates at the same time |
| sigT、sigT2 | Sigma; Sigma contains a pair of values |
| sumbool、sumor | PSum; sumbool P (¬P) also corresponds to Decidable P |
| positive、N、Z | {n : Nat // 0 < n}, Nat, Int, retain numerical meanings |
| Int63.int、int_wrapper | BitVec 63 |
| byte | Fin 256 |
| Decimal.uint、Hexadecimal.uint | List (Fin 10), List (Fin 16), leading zeros retained |
| float_class | Fin 9; this is a categorical enumeration, not a floating point value or floating point operation |
| PrimArray.array A | Bounded length Vector A plus independent default value |
| PrimString.string | Bounded length Vector (BitVec 8) |

See `reports/ISOMORPHISMS.md` for exact types, parameters, and axiomatic closures.
There is no claim that Decimal.uint is numerically decoded as a bijection with Nat: `decimal_numeric_decode_not_injective` It has been shown that Nil is numerically the same as D0 Nil is represented differently.
The raw byte string can contain any bytes other than String which is not naturally equivalent to the valid UTF-8.
Upper array length limits and default values are not discarded.

## Semantic correspondence coverage

Nat: basic constants, addition, subtraction, multiplication, power, comparison, min/max, tail recursive arithmetic, odd and even, division by two, shift, division, modulus, testbit, land/lor/lxor/ldiff; bounded bitwise also gives general theorems with clear premises.
List: length, append, map, repeat, take/drop, nth, seq, Forall.
Positive numbers: succ, add, add_carry, mul, pred_double, numerical conversion; binary integers: negation, multiplication and partial conversion.
Int63: Modulo addition, subtraction, multiplication and division, unsigned/signed comparison, bit operations and logical shifts.
Arrays: length, default value, copy, access, created length and content, update.
Logic and Peano: basic logical structures, quantifiers, and order relationships.

The complete equation (with possible premises) is found in `reports/OPERATIONS.md`. There is no replacement for proofs of these operations by saying "This type has bijections".

## Universe, proof and execution bounds

- The bijective type explicitly quantifies universe, `Type u` is not tested only on a specific data type.
- For the automatic interface of bare `Sort u` parameters, first try to keep the original universe; if the target container must be Type, only generate and record the corresponding Type instance. The 36 entry uses this restriction and does not overwrite the original Prop branch and does not modify the source declaration.
- 845 iff proves statement correspondence. Proving `P ↔ Q` is not equivalent to proving P or Q. 331 statements with explicit proof parameters in the original baseline were not treated as unconditional results.
- All accepted bridge definitions/theorems check transitive axiom closures, only Lean is allowed for standard `propext`, `Quot.sound`, `Classical.choice`; no `sorryAx`, source theorem hypothesis axioms or new translation axioms. Which axioms are actually used for each item can be found in JSON.
- These are the working definitions and proofs for the Lean kernel layer. The original mechanical products do not uniformly provide executable code generation, so the noncomputable environment is used here; there is no claim that all wrappers can directly `#eval` or run at native speed.
- The Mathlib package integration has not been verified and the large frame has not been installed.

## File navigation and remaining work

- `reports/CORELIB_LEDGER.csv`: 2180 entry source declaration, original target, bridge status, corresponding certificate, residual symbols, unmatched types and universe restrictions.
- `reports/modules/Corelib/…md`: One report for each 67 and core source files; files without kernel and roots are also clearly stated.
- `reports/ISOMORPHISMS.md`, `OPERATIONS.md`: bijection and semantic proof specifying API.
- `reports/statements.json`: The specific native/partially native statement of the 845 item.
- `reports/interfaces.json`: The actual interface type and round-trip certificate for the 480 item.
- `fragments/`: editable proof; `audits/`: type and axiom dependencies extracted from the Lean environment; `logs/`: actual build log.
- `reports/summary.json`: Machine-readable summary. Not being bridged yet does not mean that there is no correspondence.

There are still 488 items that do not have this round of bridging certificates, 331 items that require explicit attestation parameters, 702 statements that are only partially nativeized, and 1 Type-valued statement that require different processing than iff. In addition, the 379 project currently only has a proven interface wrapper, and has not yet specified a semantic consistency certificate for the native API. They are all retained without deleting the denominator and are not counted as completed.

## Recurrence

```sh
python3 build_all.py
python3 prepare_auto.py
python3 run_auto.py
python3 prepare_interfaces.py
python3 run_interfaces.py
python3 build_unified.py
python3 build_interfaces_unified.py
python3 run.py UseNative unified
python3 make_report.py
```

Relies on original frozen snapshot and file-by-file export paths; these large artifacts are not copied to this directory. The unified translation command can return ROOTS_NOT_TRANSLATED/exit 2 because an explicitly requested nat/eq is marked as BOOTSTRAP_RESOLVED; the script only accepts if all roots are TRANSLATED_AND_CHECKED or BOOTSTRAP_RESOLVED, then independent consumer and the audit must pass.
