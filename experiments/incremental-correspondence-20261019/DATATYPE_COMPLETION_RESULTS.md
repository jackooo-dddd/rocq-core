# Datatypes corresponds to: the 19th batch

The 110 roots of Init.Datatypes have obtained explicit range correspondences: 14 type, 54 operation/predicate, 42 completely native statement. This batch adds 48 completion roots (2 type, 9 operation, 37 statement), and 4 supplementary certificates for existing type roots. Full project completion category 985 / 2180; 51 increments profile passed the current inspection, and 718 coverage certificates were jointly imported and passed.

## Complete container type for Sort

List/Option/Result for Rocq can accept the Sort parameter, while Lean and List/Option/Except have the element parameter Type. This batch of establishment List (PLift A), Option (PLift A), Except (PLift E) (PLift A) The bidirectional inverse of , covering any Sort parameters. PLift only appears in the native presentation layer of correspondence; the mechanical translation is not modified, nor is the ULift rule of the mechanical translator re-enabled.

The result after removing the PLift wrapper, when A/E is Type, has been shown to be exactly equal to the old List A / Option A / Except E A conversion. The original native API usage still works. This complete Sort extension covers new type correspondence and new statements; the original Type parameter range of the old container computing certificate has not been automatically expanded.

## Compare Specs vs. Reflection

BoolSpec, CompareSpec, and CompSpec correspond to the ordinary propositions selected by Bool/Ordering. CompareSpecT, CompSpecT and PLift carrying the proof of this proposition establish Iso. reflect supplements the similar Iso under the fixed Bool index. The four rec/rect branches corresponding to the native Bool/Ordering and PLift are eliminated, and the Type / Sort and motive ranges are recorded respectively.

The two CompareSpec2Type transformations jointly use 3 closure obligation proofs, all instantiated. The original mechanical product still contains explicit conditions; the closed root of correspondence layer increases to 18, leaving 313. Among the 17 independent task witnesses, 16 axiom closures are empty, and the other 1 are standard Lean axiom witnesses of the existing gcd. Conditional input records now clearly distinguish source IR from translation report hashes, and are checked against actual pending metadata.

## 37 native statements

Including inductive statements of Bool, comparison, list, Option, product/sum, Result, Unit/Empty, comparative specifications, inductive statements with proof parameters of reflect, and the transfer of dependent equations to pair. Instead of replacing the statement with True: first prove the conversion of the type/index/dependent function, and then generate the corresponding native statement from the proven iff rule.

simp does not iterate over some proof arguments, so the dedicated normalizer replaces proof terms with source symbols with local native proofs only if both are proofs, the proposition type does not contain source symbols, the proposition type definitions are equal, the proof terms definitions are equal, and finally the entire statement is checked for equality by definition. This step uses the proven independence of Lean, and the generated iff is still checked by kernel. The final target recursively expands the NativeBridge alias without source symbols.

37 in this batch are statement equivalence certificates, which do not increase the original original theorem proof count; the cumulative number of new original statement certificates is still 43.

Evidence entrance: reports/datatype-module-coverage.json, reports/datatype-statement-candidates.json, reports/certificates.json; supporting document DatatypeNormalization/DatatypeQuantifiers/DatatypeStatements/DatatypeSpecs.lean.
