from pathlib import Path
import json,csv,re
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
records=list(csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in records if r['module']=='Corelib.ssr.ssrbool' and r['bridge_status']=='STATEMENT_PARTIAL']
report=json.loads((R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib/ssr/ssrbool/translation_report.json').read_text())
targets={r['target'] for r in report['results'] if r.get('target')}
logic=[]
for b in re.split(r'(?=^@\[simp\] theorem |^theorem |^abbrev )',(B/'fragments/Logic.lean').read_text(),flags=re.M):
 refs=set(re.findall(r'Rocq(?:Pending)?\.Corelib(?:\.[a-zA-Z0-9_]+)+',b))
 if b.strip() and all(any(r==t or r.startswith(t+'.') for t in targets) for r in refs):logic.append(b)
properties=(W/'proofs/SSRProperties.lean').read_text().replace('import SSR','import SSRBool')
head,body=properties.split('theorem ',1)
body=('theorem '+body).split('end NativeBridge.Incremental')[0]
kept=[]
for block in re.split(r'(?=^theorem )',body,flags=re.M):
 refs=set(re.findall(r'Rocq(?:Pending)?\.Corelib(?:\.[a-zA-Z0-9_]+)+',block))
 if block.strip() and all(any(r==t or r.startswith(t+'.') for t in targets) for r in refs):kept.append(block)
properties=head+'\n'.join(kept)+'\nend NativeBridge.Incremental\n'
logicblock='\nnamespace NativeBridge.Incremental\nuniverse u\n'+'\n'.join(logic)+'''
theorem boolTo_true : boolTo Rocq.Corelib.Init.Datatypes.bool.true = true := rfl
theorem boolTo_false : boolTo Rocq.Corelib.Init.Datatypes.bool.false = false := rfl
end NativeBridge.Incremental
'''
base=['eq_correspondence','is_true_agrees','bool_to_of','bool_of_to','andb_agrees','orb_agrees','negb_agrees','xorb_agrees','implb_agrees','option_to_of','option_of_to']
inc=['bool_rec_native','bool_function_forall','bool_binary_function_forall','bool_forall_native','bool_exists_native','bool_equality_native','bool_eq_native','reflect_arrow_native','boolTo_true','boolTo_false','ssr_addb_agrees','ssr_if_expr_agrees','ssr_isSome_agrees','ssr_subpred_agrees','ssr_subrel_agrees','ssr_reflexive_agrees','ssr_irreflexive_agrees','ssr_symmetric_agrees','ssr_transitive_agrees','ssr_antisymmetric_agrees','ssr_total_agrees','ssr_cancel_agrees','ssr_commutative_agrees','ssr_associative_agrees','ssr_involutive_agrees','ssr_injective_agrees','ssr_eqfun_agrees','ssr_eqrel_agrees','ssr_left_id_agrees','true_agrees','false_agrees','and_agrees','or_agrees','not_agrees','notT_agrees','iff_agrees','ex_agrees','ex2_agrees','inhabited_agrees','all_agrees']
unfold=['right_commutative','left_commutative','interchange','right_id','right_injective','right_loop','left_loop','self_inverse','left_zero','right_zero','idempotent_op','idempotent_fun']
names=['NativeBridge.'+n for n in base]+['NativeBridge.Incremental.'+n for n in inc]+['Rocq.Corelib.ssr.ssrfun.'+n for n in unfold]
names += ['Rocq.Corelib.ssr.ssrbool.pred','Rocq.Corelib.ssr.ssrbool.rel']
cmd=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names,ensure_ascii=False))
s=properties+logicblock+cmd+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n'
(W/'proofs/SSRBoolStatements.lean').write_text(s)
(W/'statement-selection.json').write_text(json.dumps([{'source':r['source'],'target':r['target']} for r in selected],indent=2))
print('selected partial statements',len(selected))
