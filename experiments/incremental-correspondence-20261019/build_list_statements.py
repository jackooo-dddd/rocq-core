from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent;R=W.parents[1]
rows=list(csv.DictReader((R/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Lists.ListDef' and r['bridge_status']=='STATEMENT_PARTIAL']
names=['NativeBridge.'+n for n in ['forall_list_agrees','list_to_of','list_of_to']]
names+=['NativeBridge.Incremental.ListBridge.'+n for n in ['list_forall','list_family_forall','listTo_nil','listTo_cons']]
s=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','NativeBridge.MN')
(W/'proofs/ListStatements.lean').write_text('import ListBridge\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'list-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
