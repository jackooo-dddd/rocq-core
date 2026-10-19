from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent
rows=list(csv.DictReader((W.parents[1]/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Init.Specif' and r['bridge_status']=='STATEMENT_PARTIAL']
names=['NativeBridge.'+n for n in ['eq_correspondence','eqTo_of','eqOf_to','sumbool_to_of','true_agrees','false_agrees','and_agrees','or_agrees','not_agrees','notT_agrees','iff_agrees','ex_agrees','ex2_agrees','inhabited_agrees','all_agrees']]
names+=['NativeBridge.Incremental.'+n for n in [
 'subtype_forall_native','subtype_exists_native','subtype_of_equality',
 'subtype2_forall_native','subtype2_native_roundtrip','subtype2_equality_native',
 'psigma_forall_native','psigma_exists_native','psigma_of_equality',
 'psigma2_forall_native','psigma2_exists_native','psigma2_of_equality',
 'subtype_forward_roundtrip','psigma_forward_roundtrip','psigma2_forward_roundtrip',
 'subtype_projection_native','psigma_projection_native','psigma_value_native','source_iff_native','specif_ex_native','specif_ex2_native','specif_inhabited_native','subtype_nonempty_native','psigma_equality_native','psigma2_equality_native','psigma_constructor_native','psigma2_constructor_native','psigma2_drop_native','psigma2_third_native','specif_eq_rect_native','subtype_family_forall','subtype2_family_forall','psigma_family_forall','psigma2_family_forall','subtype_constructor_native','subtype2_constructor_native','subtype2_of_equality','psigma_eta_projection_native','psigma_eta_value_native','psigma2_eta_drop_native','sumbool_forall_native','sumbool_family_forall','sumor_forall_native','sumor_family_forall','sumbool_left_native','sumbool_right_native','sumor_left_native','sumor_right_native','sumor_forward_roundtrip','quality_sigT_native','quality_sigT2_native','eq_proof_exists_native','eq_proof_forall_native','pprod_forall_native','pprod_equality_native','pprod_forward_roundtrip','prod_of_sigT_agrees','sigT_of_prod_agrees']]
s=(W/'specif-statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','Rocq.Corelib.Init.Specif.sig')
(W/'proofs/SpecifStatements.lean').write_text('import SpecifNormalization\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'specif-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
