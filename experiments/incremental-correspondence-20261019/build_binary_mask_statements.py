from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent;R=W.parents[1]
rows=list(csv.DictReader((R/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['source'] in ['Corelib.BinNums.PosDef.Pos.mask_ind','Corelib.BinNums.PosDef.Pos.mask_sind']]
names=['NativeBridge.Incremental.BinaryMask.'+n for n in ['mask_forall','mask_family_forall','positive_forall','positive_to_of_subtype','mask_to_of','mask_of_to','maskTo_nul','maskTo_neg','maskTo_pos']]
s=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','NativeBridge.RPositive')
(W/'proofs/BinaryMaskStatements.lean').write_text('import BinaryMask\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'binary-mask-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
