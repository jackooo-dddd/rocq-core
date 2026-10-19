from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
rows=list(csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Classes.Equivalence' and r['bridge_status']=='STATEMENT_PARTIAL']
names=['NativeBridge.Incremental.RC.'+n for n in ['reflexive_native','symmetric_native','transitive_native','equivalence_native']]
names += ['NativeBridge.Incremental.EquivalenceBridge.'+n for n in ['pointwise_function_native','equivalence_fields_native','sig_forall_native','proj_sigOf_native']]
names += ['Rocq.Corelib.Relations.Relation_Definitions.relation','Rocq.Corelib.Classes.Equivalence.equiv','Rocq.Corelib.Classes.Equivalence.pequiv','Rocq.Corelib.Classes.Equivalence.respecting']
s=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','Rocq.Corelib.Init.Specif.sig')
(W/'proofs/EquivalenceStatements.lean').write_text('import EquivalenceBridge\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'equivalence-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
