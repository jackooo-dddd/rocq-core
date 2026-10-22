# SSR Packaging type, dependency data and condition statement (23rd batch)

Added 23 completion roots: 1 types, 20 operations, 2 complete native statements. The current completion category of the entire project is 1261 / 2180 (70 type, 470 operation, 721 statement); 124 root has been completed in the 128 root of ssrfun, and the remaining four items are shown below. All numbers are counted based on the deduplication source root, and the range is based on the complete type of the certificate.

## Corresponding result

| source statement | native target |
|---|---|
| wrapped、wrap、unwrap | A, id; wrappedIso proves the two-way inverse, A: Type u |
| SimplFunDelta | fun x => f x x |
| Tagged、Tagged2 | PSigma.mk; the second load uses PProd |
| tag、tag2 | PSigma.fst |
| tagged、tagged2、tagged2' | PSigma.snd and load PProd projection |
| tag_of_tag2 | id on PSigma (fun a => PProd (P a) (Q a)) |
| all_pair | Split the dependent function pair into two native expressions of the dependent function |
| s2val | Subtype.val |
| of_void | Empty.elim |
| phant_id | True → True; both sides phantom have only one proof constructor |
| pcancel、ocancel | The partial cancellation law defined by the native Option equation |
| pcomp | Option.bind |
| tag_of_sig | fun (x : Subtype P) => PSigma.mk x.val x.property |
| sig_of_sig2 | id on Subtype (fun a => P a ∧ Q a) |
| esymK、etrans_id | Quadratic symmetry law and right unit transitive law of original equality proof |

Data adaptation uses the full Sort parameters, except for the Type limitations of wrapped; Option uses Option (PLift A). The dependent projection proves the equation with native PSigma input and provides the bidirectional inverse of the input transformation, so it is not just a special case that is proved. Native combined expressions are differentiated from target_class in certificates.json by existing API.

Closure proofs are given for 5 different pre-declarations of tag_of_sig, sig_of_sig2, esymK and etrans_id, and the original mechanical declaration remains unchanged. esymK and etrans_id also have independent proof of the original statement, not just iff. The axiom closures proved by the five new predicate witnesses and the two original statements are all empty.

## Four remainders: the current product does not expose the calculation equation

| Statement | Current form | There are native candidates |
|---|---|---|
| all_tag | opaque, no explicit condition | PSigma depends on selection: the function takes fst, the evidence function takes snd |
| all_tag2 | opaque, no explicit condition | Dependency selection for PSigma / PProd |
| all_sig | opaque, 1 explicit conditions | Subtype depends on selection |
| all_sig2 | opaque, 4 explicit conditions | Subtype Dependent selection of conjunction predicate |

These candidates have not yet been registered as proven operational correspondences. SSRFunOpacity reads the current compilation environment and performs a synchronized kernel check: the four claims are indeed opaque, internal body exists, but rfl proves "claim = body" are all rejected by kernel with declTypeMismatch. There is also no theorem declaration of type directly mentioning these functions in the current import environment. Only body can be read, and it cannot be assumed to be equal to the opaque constant; copying body to become a new def does not constitute a proof of the equation.

The next step is to provide verified transparent implementation/computational equations and their source connections for the computational opaque claim in a separate mechanical product extension, and then pick up the native candidate here. You cannot directly rename the old opaque constant to the new def and then claim that the old correspondence has been established. all_sig2 must also close its prefix proof; it depends on all_sig, and the implementation of all_sig uses all_tag.

## Verify

- SSRFunData, SSRFunConditions: 23 newly added corresponding certificates, Lean kernel and the axiom closure check passed.
- SSRFunOpacity: Exact failure diagnosis of 4 opaque calculations without increasing the coverage number.
- The current 71 verifications profile all match the source code and dependency fingerprints.
- There are currently 999 incremental coverage certificates, which have been repackaged by 65 coverage profile and imported together; 1294 entries and 8015 dependency statement copies.
- There is no rerun of all machine translations, nor recompiling of all old baseline proofs.
- Compilation cache and temporary probes only remain in remote .work.

Documents: proofs/SSRFunData.lean, proofs/SSRFunConditions.lean, proofs/SSRFunOpacity.lean; itemized certificates see reports/CERTIFICATES.md; opaque diagnostics see reports/ssrfun-opacity.json.
