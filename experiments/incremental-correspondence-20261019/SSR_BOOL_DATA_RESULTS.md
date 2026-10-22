# SSR Bool: Predicate packaging, logical data and statements (24th batch)

This batch adds 94 completion roots: 14 types, 34 operations, and 46 complete native statements. The current completion category of the entire project is 1355 / 2180 (approximately 62.2%): 84 type, 504 operation, 767 statement. All counts are based on deduplicated source roots; see the complete type for the applicable scope of each certificate.

The ssrbool module has a total of 451 roots. After this batch, the 251 roots (16 type, 46 operation, 189 statement) are completed. The remaining 200 roots are 128 with explicit conditionals, 41 unbridged, 29 partial statements, and 2 interfaces only; they have no completions mixed in.

## Type correspondence

| Source type | Native representation |
|---|---|
| simpl_pred、mem_pred、collective_pred、applicative_pred | A → Bool |
| simpl_rel | A → A → Bool |
| predArgType | Type u |
| predType | Sigma (fun S : Type u => S → A → Bool) |
| implies | P → Q; P and Q retain independent Sort parameters |
| decidable | Decidable P |
| and3、and4、and5 | Right associative nesting of native And |
| or3、or4 | Right associative nesting of native Or |

All provide two-way reverse. predType reserved carrier S and its interpretation function are not erasure encapsulation, leaving only one predicate. pred/simpl_pred/mem_pred, etc. follow the Type parameter range declared by the source, and do not claim to cover any Sort that the source declaration does not originally support.

## Operation correspondence

34 operations include:
- Projections of SimplPred, SimplRel, fun_of_pred, fun_of_rel and predicate/member wrappers.
- pred0, predT, predI, predU, predC, predD: constant Boolean functions and pointwise and/or/not.
- preim, relpre, relU: native function combination, relationship pullback, point-by-point extraction.
- pred_oapp：Option.any。
- pred_sort, topred: vector and interpretation function projections of the native Sigma.
- rec/rect of and3/4/5: applies the branch function to each proof parameter of the original conjunction; rec returns Type, rect returns Sort u.
- pre_symmetric, left_transitive, right_transitive, equivalence_rel: Preserve the definition order and the native Boolean relationship properties of the parameters.
- unless P Q ↔ Nonempty P ∨ Nonempty Q。
- classically P ↔ ¬¬ Nonempty P。

The last two terms hold for the Sort parameters, proving that classical selection is not used. The target of this batch of classically retains the double negative; it is not directly changed to P on the grounds that the names are similar.

The Function.comp, Option.any, Sigma projection, id, etc. in the target and the custom native combination expression are marked in certificates.json respectively. Types that can be converted to each other do not automatically mean that any upper-layer function is already equal to a certain Mathlib API.

## 46 statements upgraded

Renormalizing the remaining 75 partial statements, 46 results in targets that contain no source symbols at all. Includes inductive statements of and/or, Boolean distributive law, classicP/W/bind/ex/imply, partial homomorphism/monomorphic combinations and relational properties.

Normalize combines the proven iff and transformation rules, continuing with newly exposed subexpressions if necessary, preserving the equality proof at each step. The target check recursively expands the NativeBridge alias, and Final iff is checked by Lean kernel. The 29 candidates that still contain source symbols are only counted as partial statements and have no boost coverage.

There is no independent original theorem proof added in this batch; the above 46 item is statement iff. The number of original 139 copies of new original statement certificates remains unchanged.

## Verification and subsequent dependencies

Three new profile passed: SSRBoolData, SSRBoolLogic, SSRBoolExtendedStatements. Currently 74 verifications profile match source code and dependencies; 1093 incremental coverage certificates have been imported and passed by 68 coverage profile, 1388 entries, and 8655 copies of dependency declarations. There is no re-running all mechanical translations or all old baseline proofs.

The next dependency is: lossless representation of manifest/keyed package → mem / prop_in / prop_on native → remaining 29 partial statements; in addition, 128 conditional roots are processed according to shared dependencies. Computational opaque statements such as impliesP have the same computational equation issues as the previous batch of four ssrfun functions, and cannot be counted as complete just by reading the internal body.

Entrance:
- proofs/SSRBoolData.lean、proofs/SSRBoolLogic.lean
- proofs/SSRBoolExtendedStatements.lean
- ssrbool-extended-statement-selection.json
- reports/ssrbool-extended-statement-candidates.json
- reports/CERTIFICATES.md and reports/CORELIB_LEDGER.csv
