# Peano correspondence and review of old targets

This batch adds 6 completion roots: IsSucc corresponds to 0 < n of native Nat; f_equal_pred, le_pred, nat_rect_plus, nat_rect_succ_r, pred_Sn The statement of has been proved to be equivalent to the pure native statement. Init.Peano total 36 roots all have clear range correspondence.

PeanoBridge Reproves the auxiliary correspondence of predecessor, multiplication, maximin and iterator in the actual Auto_Init_Peano closure. PeanoStatements Check all 31 statements, of which 26 have been completely native and are not duplicated in the coverage certificate; 5 are added. Statement iff is not equivalent to proving the original original theorem.

The statement evidence of the old ledger comes from automatic profile, not the handwritten profile of the same name. audit_baseline_native.py accurately selects the original evidence module based on frozen reports/statements.json, and recursively expands the NativeBridge alias for 143 completely native targets of the old ledger; 10 modules and 143 targets all pass, with passive symbols. This check imports already compiled proofs without recompiling all old proofs. The 12 source symbol residues previously discovered in the handwritten Peano module do not belong to the targets adopted by the ledger and cannot be used to determine ledger errors.

Evidence: reports/peano-module-coverage.json, reports/peano-statement-candidates.json, reports/baseline-native-audit/. The inspection records contain the actual source code and compiled product hashes. Currently, 39 increments profile have successful records; 619 incremental coverage certificates have been jointly imported and passed, and the cumulative completion category is 890 / 2180.
