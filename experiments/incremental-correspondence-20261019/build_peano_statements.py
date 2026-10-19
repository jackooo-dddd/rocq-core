from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent;R=W.parents[1]
rows=list(csv.DictReader((R/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Init.Peano' and r['bridge_status'] in ['STATEMENT_FULL_NATIVE','STATEMENT_PARTIAL']]
names=['NativeBridge.'+n for n in ['eq_correspondence','nat_eq_native','nat_family_forall','nat_binary_family_forall','nat_inner_family_forall','nat_forall_correspondence','nat_exists_correspondence','natTo_of','natOf_to','natTo_zero','natTo_succ','true_agrees','false_agrees','not_agrees','peano_le_agrees','peano_lt_agrees','peano_ge_agrees','peano_gt_agrees']]
names+=['NativeBridge.Incremental.PeanoBridge.'+n for n in ['pred_agrees','add_agrees','iteration_agrees','isSucc_agrees','mul_agrees','min_agrees','max_agrees']]
s=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','NativeBridge.MN')
(W/'proofs/PeanoStatements.lean').write_text('import PeanoBridge\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'peano-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))

# Reaudit the exact old native target bodies, including NativeBridge aliases.
old=[r for r in selected if r['bridge_status']=='STATEMENT_FULL_NATIVE']
audit='\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  let mut rows : Array Json := #[]\n'
for r in old:
 n='NativeBridge.Statements.'+r['target']+'.native'
 audit+='  let ci ← getConstInfo '+chr(96)+n+'\n  let some v := ci.value? | throwError "Missing old target"\n  let refs ← sourceRefs v\n  rows := rows.push (Json.mkObj [("source",.str '+json.dumps(r['source'])+'),("remaining_source_symbols",.arr (refs.map (fun n => .str n.toString)))])\n'
audit+='  IO.FS.writeFile "reports/Peano-baseline-target-audit.json" (Json.pretty (.arr rows))\n'
p=W/'proofs/PeanoStatements.lean';p.write_text(p.read_text()+audit)
