# Nat mechanical translation case

Subsequent increments: 58 roots of Init.Nat now have correspondences within the explicit range, gcd conditions have been closed, sqrt/log2 and seven digital prints have corresponded to the native API, see [Nat latest result ](../../experiments/incremental-correspondence-20261019/NAT_COMPLETION_RESULTS.md). The item-by-item table in this case retains the proof snapshot at the time of construction, and the latest status is based on [incremental ledger ](../../experiments/incremental-correspondence-20261019/reports/CORELIB_LEDGER.csv)].

This case includes the source definition, function, translation process evidence of Nat in Rocq Corelib, the actual output of Lean and the existing correspondence certificate. Baseline is mechanical-nat-eq-20261019/full-v1: Source nat/eq all generate independent inductive types, bootstrap table is empty.

## where to start

1. [Translation process of types, constructors and addition ](TRANSLATION_FLOW.md): Let’s look at specific examples first.
2. [99 before and after statements ](DECLARATIONS.md): click on each item to view the actual Lean body, attempts and corresponding certificates; and [CSV](DECLARATIONS.csv).
3. [Native Nat correspondence proof and gap ](CORRESPONDENCE.md): Distinguish type bijection, operational correspondence, interface round trip, and statement iff.
4. [File reading guide ](FILES.md) and [Explanation of each exported file ](EXPORT_FILES.md).
5. [Full Corelib range evolution ](SCOPE.md): 709 → 839 → 2180.

## Inclusion range

| Source | Number of topics | content |
|---|---:|---|
| Init.Datatypes | 5 | nat, nat_ind, nat_rec, nat_rect, nat_sind; O/S recorded with inductive block |
| Init.Nat | 58 | Constants, arithmetic, comparison, recursive auxiliary, division, bit operations, numerical representation conversion |
| Init.Peano | 36 | Large and small relations, elimination aids and theorem statements |
| Total | 99 | Not the entire 2180 root range, nor all passing clients of Nat |

To preserve source code context, source/, records/ and lean/ contain three complete modules, of which Datatypes also contains other types. Only the above-mentioned 99 items are selected for thematic statistics.
There is also [CORELIB_NAT_REFERENCES.csv](CORELIB_NAT_REFERENCES.csv): In the entire 2180 root range, the final target AST directly references the 149 roots of the mechanical nat/ and its constructor and eliminator or the Init.Nat operation (including quality deduplication after the branch). This is not a transitive dependency closure, which is not equivalent to "all declarations related to natural numbers".

Mechanical results: 65 item complete definition/data type, 33 item theorem/axiom statement, 1 item with conditional definition (gcd), 0 item blocked. The 33 item statement check has been migrated through the inequality theorem proof. See [summary.json](summary.json) for details.

## read and run

You can directly read the entire text of this catalog, JSON and the certification source code on Mac. The Lean entry still refers to the absolute path of the remote freeze run, and cannot be regarded as a packaged portable library that can simultaneously run import.

Run at the root of the remote repository:

    python3 results/casestudy/build.py
    python3 results/casestudy/verify.py

build.py Rebuild the index and copy from the existing frozen evidence without re-translation. verify.py checks the copy and rechecks the main correspondence proof and a mechanical addition example; the result is written VALIDATION.json, and the cached and complete new log only writes the ignored .work/. Requires existing remote Lean toolchain and build module cache.

Nat correspondence proof is an independent step after translation and does not participate in the mechanical translation selection rules. There is no new Mathlib interoperability verification, nor is there any commitment to generate type support for #eval; the calculation example uses kernel reduction with rfl.
