#!/usr/bin/env python3
import pathlib,sys,json,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();run=pathlib.Path(sys.argv[2]).resolve();out=pathlib.Path(sys.argv[3]).resolve();out.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tests'))
from lib import structurally_rejected,results
_,report=results(run);checks={}
prefix='Corelib.Numbers.Cyclic.Int63.PrimInt63.'
for name,replacement in [('add','BitVec.sub'),('div','Rocq2Lean.PrimInt63.umod'),('land','Rocq2Lean.PrimInt63.lor'),('divs','Rocq2Lean.PrimInt63.udiv'),('asr','Rocq2Lean.PrimInt63.lsr'),('lsl','Rocq2Lean.PrimInt63.lsr'),('head0','Rocq2Lean.PrimInt63.tail0'),('tail0','Rocq2Lean.PrimInt63.head0'),('addmuldiv','Rocq2Lean.PrimInt63.mul')]:
 if not any(r['source']==prefix+name for r in report['results']):continue
 rep=copy.deepcopy(report);row=next(r for r in rep['results'] if r['source']==prefix+name)
 row['target_value']['f']['n']=replacement
 assert structurally_rejected(run,rep,'int63-wrong-'+name,prefix+name),name
 checks[name]={'replacement':replacement,'structural_rejection':True}
rep=copy.deepcopy(report);row=next(r for r in rep['results'] if r['source']==prefix+'int');row['target_value']['a']['v']=64
assert structurally_rejected(run,rep,'int63-wrong-width',prefix+'int')
checks['type_width_64']={'structural_rejection':True}
(out/'result.json').write_text(json.dumps({'status':'PASS','checks':checks},indent=2)+'\n')
print(json.dumps(checks))
