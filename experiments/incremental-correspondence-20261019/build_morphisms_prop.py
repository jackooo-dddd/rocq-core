from pathlib import Path
import json,csv,re
W=Path(__file__).resolve().parent;R=W.parents[1];B=R/'experiments/mechanical-correspondence-20261019'
def take(path,names):
 blocks=re.split(r'(?m)(?=^(?:def|theorem) )',path.read_text())
 return '\n'.join(b.split('\nend NativeBridge')[0] for b in blocks if (m:=re.match(r'(?:def|theorem) (\w+)',b)) and m.group(1) in names)
base=take(W/'proofs/RelationClasses.lean',{'sourceFalse','sourceAnd','sourceOr','sourceIff','equivalence_native','iff_relation_native','flip_function_native'})
acc=take(W/'proofs/WellFounded.lean',{'accTo','accOf'})
impl=take(W/'proofs/Morphisms.lean',{'impl_function_native'})
s='import Auto_Classes_Morphisms_Prop\nset_option autoImplicit false\nnoncomputable section\nnamespace NativeBridge.Incremental.MorphismsProp\nopen NativeBridge\nopen Rocq.Corelib.Classes.RelationClasses\nuniverse u v w\n'+base+acc+impl
s+=(W/'morphisms-prop-extra.lean.inc').read_text()+'\nend NativeBridge.Incremental.MorphismsProp\n'
names=['NativeBridge.eq_correspondence']
names += ['NativeBridge.Incremental.MorphismsProp.'+n for n in ['sourceFalse','sourceAnd','sourceOr','sourceIff','equivalence_native','iff_relation_native','flip_function_native','impl_function_native','acc_native','acc_function_native','and_function_native','or_function_native','not_function_native']]
names += ['Rocq.Corelib.Relations.Relation_Definitions.relation','Rocq.Corelib.Classes.Morphisms.Proper','Rocq.Corelib.Classes.Morphisms.respectful']
cmd=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','Rocq.Corelib.Init.Wf.Acc')
rows=list(csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Classes.Morphisms_Prop' and r['bridge_status']=='STATEMENT_PARTIAL']
s+=cmd+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n'
(W/'proofs/MorphismsProp.lean').write_text(s)
(W/'morphisms-prop-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
