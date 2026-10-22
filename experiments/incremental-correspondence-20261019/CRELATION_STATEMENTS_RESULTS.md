# CRelationClasses statement corresponds to: the 32nd batch

Added **17 roots**: 1 types, 1 operations, 15 completely native statements. Cumulative **1614 / 2180**, CRelationClasses current **63 / 81**.

[Proof that source code ](proofs/CRelationStatements.lean) reuses type bridging of CRelationData:

- StrictOrder corresponds to the native anti-reflexivity proof of the PLift wrapper, multiplied by the Type value transfer function; retains the calculation data of the transfer function.
- StrictOrder_Transitive corresponds to the second projection of native recording.
- Three RewriteRelation mark instances correspond to True/True per carrier.
- The asymmetry and anti-reflexivity of StrictOrder; asymmetry, irreflexivity; the properties of complement relations and flip relations; equivalence relations can be marked as rewrites.
- Implied reflexivity, transitivity, and two explicit obligation roots.

All 15 statements have both native iff and independent native proofs and original statement proofs. The goal is to preserve the corresponding quantifiers, relational value types, and functional assumptions. RewriteRelation itself has no data tag, and its target is True; all other relationship properties are not replaced with True.

The vector/relational universe in the source declaration is explicitly instantiated in iff. Auxiliary types in native targets recursively check unsourced symbols. The proofs of types and functions retain the actual native targets at the same time, and interfaces that can only pass parameters are not counted as operation correspondences.

89 increments profile's current source code/dependency verification passed; 80 covering profile and 1353 covering certificates were jointly imported and passed, 1835 entries, and 12111 dependency copies passed. The new correspondence does not change the mechanical translation or expand the original opaque function. There is no need to add new certification conditions for this batch; the total number of original statement certifications is 199.

The remaining 18 items of this module are shown in [Itemized report ](reports/crelation-module-coverage.json). The next step deals with the data representation of PartialOrder and distinguishes between transparent composition definitions and opaque results that return function data; the latter cannot be considered consistent by proving irrelevance alone.
