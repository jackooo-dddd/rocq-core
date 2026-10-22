# Correspondence to Lean native Nat

## Types and constructors

[fragments/MechanicalNat.lean](correspondence/fragments/MechanicalNat.lean) is the shortest reading entry; [NatEq.lean](correspondence/NatEq.lean) is the complete profile with public definitions and audits.

    natTo : MechanicalNat → Nat
    natOf : Nat → MechanicalNat

Two converse laws have been proved:

    natOf (natTo n) = n
    natTo (natOf n) = n

natIso packages both into Iso. MechanicalNat is the abbreviation of Rocq.Corelib.Init.Datatypes.nat in this article, and is not another defined third type.

There are four clear proofs corresponding to the constructor: natTo_zero, natTo_succ, natOf_zero, natOf_succ:

    natTo O = 0
    natTo (S n) = Nat.succ (natTo n)
    natOf 0 = O
    natOf (Nat.succ n) = S (natOf n)

NatEq also includes the conversion of mechanical eq and Lean Eq and its consistency in natural numbers. This is proving a correspondence between two independent types, and the two cannot be written to be equal by definition.

## Arithmetic and Eliminator

- [MechanicalNatOps](correspondence/fragments/MechanicalNatOps.lean): zero/one/two, succ/pred, addition, subtraction, multiplication, Boolean comparison, etc.
- [MechanicalNatExtra](correspondence/fragments/MechanicalNatExtra.lean): Comparison, parity, etc. for further proof.
- [MechanicalNatDiv](correspondence/fragments/MechanicalNatDiv.lean): Proof related to division; the parameters and conditions of each theorem are subject to the actual type.
- [MechanicalNatBits](correspondence/fragments/MechanicalNatBits.lean): Proof of bit manipulation.
- [DependentNat](correspondence/DependentNat.lean): Dependency elimination correspondence of source nat_rec/nat_rect; not an automatically generated arbitrary dependency function space round-trip interface.
- [Peano](correspondence/Peano.lean): Natural number relationships and statement conversion.
- [Interface_Init_Nat](correspondence/Interface_Init_Nat.lean): Automatic interface and round trip.
- [UseNative](correspondence/UseNative.lean): Uses native Nat addition, etc. in a unified build environment; relies on original experimental UnifiedInterfaces.
- [Boundaries](correspondence/Boundaries.lean): Digital representation of equal boundaries and auxiliary correspondence.

For example, the content of nat_add_agrees is:

    natTo (Rocq.Corelib.Init.Nat.add n m) = natTo n + natTo m

nat_mul_agrees gives the same conclusion for multiplication. The relevant Lean source file contains the proof body; the theorem type and axiom dependencies are recorded in audits/.

## Coverage of 99 topic roots

| Category | Roots | meaning |
|---|---:|---|
| TYPE_ISO | 2 | nat corresponds to the type of Init.Nat.t |
| OPERATION_CORRESPONDENCE | 39 | There is already a certificate corresponding to the specified operation/predicate/eliminator |
| STATEMENT_FULL_NATIVE | 28 | The transformed statement retains no source symbols; it is not an original theorem proof |
| STATEMENT_PARTIAL | 5 | Statement iff exists, but source symbols remain |
| TRANSPORT_INTERFACE_ONLY | 15 | There is an interface round trip; it cannot be determined based on this that it is consistent with the operation of the same name as Lean |
| EXPLICIT_PROOF_PARAMETERS | 1 | gcd still requires terminating conditions |
| NOT_YET_BRIDGED | 9 | No required bridging certificate yet |
| Total | 99 | Each root is classified according to the main category of the existing ledger |

The 58 items of Init.Nat are viewed separately: the 33 item operation corresponds, the 1 item type corresponds, the 14 item only interfaces, the 1 item has conditions, and the 9 item is not bridged.
The unbridged 9 items are of_hex_int, of_int, of_num_int, of_num_uint, to_hex_int, to_int, to_num_hex_uint, to_num_int, and to_num_uint. They involve digital representation conversion; not bridging does not mean that no correspondence can be established.

For complete itemized certificate names, interface specializations, and remaining source symbols, see [DECLARATIONS.csv](correspondence/DECLARATIONS.csv) and [itemized pages ](DECLARATIONS.md).
These numbers are primary category counts, not all attestation certificate counts; the same item may have both operational correspondence and interface roundtrips.

## Evidence and review

correspondence/audits/, logs/ and VERIFIED.json are existing experimental records. VERIFIED.json and 101 passed. profile is the entire experimental range and cannot be written in this case. 101 were rechecked.

This case verify.py will be reviewed separately. Nat/Peano/ depends on elimination/interface/statement profile and native usage demonstration. See VALIDATION.json for the exact list and new results.
It uses an unchanged copy of the proof source text, only redirects the audit file output to .work/ in a temporary copy, and does not change the proof.
