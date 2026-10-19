from pathlib import Path
import csv,json,re
W=Path(__file__).resolve().parent;R=W.parents[1]
rows=list(csv.DictReader((R/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv').open()))
covered={s['source'] for s in json.loads((W/'certificates.json').read_text()) if s['kind']=='STATEMENT_FULL_NATIVE'}
selected=[r for r in rows if r['source'] not in covered and r['module']=='Corelib.Init.Datatypes' and r['bridge_status']=='STATEMENT_PARTIAL']
names=[]
for profile in ['DatatypeNormalization','DatatypeQuantifiers']:
 for name in re.findall(r'^(?:@\[simp\] )?theorem (\w+)',(W/'proofs'/(profile+'.lean')).read_text(),re.M):
  if name not in ['compareSpecT_family_forall','compareSpecT_forall','comparison_dependent_family_forall','reflect_family_forall','reflect_forall','bool_dependent_family_forall']:
   names.append('NativeBridge.Incremental.'+profile+'.'+name)
names+=['NativeBridge.'+n for n in ['andb_agrees','orb_agrees','negb_agrees','xorb_agrees','implb_agrees','is_true_agrees','compOpp_agrees','eqTo_of','eqOf_to']]
names+=['NativeBridge.Incremental.datatypes_IDProp_agrees']
s=(W/'datatype-statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names))
(W/'proofs/DatatypeStatements.lean').write_text('import DatatypeQuantifiers\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'datatype-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
