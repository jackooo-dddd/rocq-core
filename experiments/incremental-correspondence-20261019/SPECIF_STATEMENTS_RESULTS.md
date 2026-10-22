# Specif states the conversion result

49 candidates have all been checked by kernel; among them, 49 target expressions have unsourced symbols (including expansion of NativeBridge aliases). The new statement is iff, which does not prove the original theorem in this batch. Original mechanical translation unmodified.

The new rules cover the complete quantifiers, function family transfers, equations and projections of Subtype, PSigma, PSigma + PProd under Sort, as well as the native correspondence of the source existence quantifier/inhabited.

| source statement | Complete native |
|---|---|
| eq_existT2_curried | Yes |
| eq_existT2_l | Yes |
| eq_existT2_r | Yes |
| eq_existT2_uncurried | Yes |
| eq_existT_curried | Yes |
| eq_existT_l | Yes |
| eq_existT_r | Yes |
| eq_existT_uncurried | Yes |
| eq_sigT | Yes |
| eq_sigT2 | Yes |
| eq_sigT2_hprop | Yes |
| eq_sigT2_hprop_iff | Yes |
| eq_sigT2_nondep | Yes |
| eq_sigT2_uncurried | Yes |
| eq_sigT2_uncurried_iff | Yes |
| eq_sigT_hprop | Yes |
| eq_sigT_hprop_iff | Yes |
| eq_sigT_nondep | Yes |
| eq_sigT_uncurried | Yes |
| eq_sigT_uncurried_iff | Yes |
| eq_sig_hprop | Yes |
| eq_sig_hprop_iff | Yes |
| ex2_of_sig2 | Yes |
| ex2_of_sigT2 | Yes |
| ex_of_sig | Yes |
| ex_of_sigT | Yes |
| exists_to_inhabited_sig | Yes |
| inhabited_sig_to_exists | Yes |
| prod_sigT_prod | Yes |
| proj1_sig_eq | Yes |
| proj2_sig | Yes |
| projT1_eq | Yes |
| projT1_of_sigT2_eq | Yes |
| sig2_ind | Yes |
| sig2_sind | Yes |
| sigT2_eta | Yes |
| sigT2_ind | Yes |
| sigT2_sind | Yes |
| sigT_eta | Yes |
| sigT_ind | Yes |
| sigT_of_sigT2_eq | Yes |
| sigT_prod_sigT | Yes |
| sigT_sind | Yes |
| sig_ind | Yes |
| sig_sind | Yes |
| sumbool_ind | Yes |
| sumbool_sind | Yes |
| sumor_ind | Yes |
| sumor_sind | Yes |

The inductive statements of the ordinary Subtype, dependent pairs, doubly dependent pairs, sumbool and sumor, and the curried/uncurried statement of the dependent pair equations have been transformed. The existing Type-only Iso of sumor is extended to the complete Sort without duplicating the source root. The qualityProp version corresponds to the native existing quantifier and still retains its Prop semantics.

The transformation is performed in two stages: first rewriting in terms of proven quantifiers, function families and operational equations, and then reducing to concrete transformers and projections. simp does not process the proof parameters by default; in the end, only the clearly identified equation proof round trip and proof cast are cleaned up, isDefEq is checked for each replacement, and the definition is checked again for equality as a whole, and finally iff is verified by kernel. This is not about ignoring residual symbols: the actual expression in the output is replaced before its source symbol is checked.

The new certificate is a range extension of the existing types 49 iff and 1; there is no new original statement certificate. See reports/CERTIFICATES.md, specif-statement-candidates.json for detailed types, axioms and target entities. All 49 items are unconditional original statements, and the remaining explicit conditions are not processed in this batch.

P7 has been included in all new certificates in this batch; the actual record of reports/interop/all/import-all-validation.json shall prevail.
