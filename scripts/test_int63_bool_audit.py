#!/usr/bin/env python3
import pathlib,sys,json,copy,subprocess,os
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();run=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tests'));from lib import structurally_rejected,results
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
_,report=results(run);prefix='Corelib.Numbers.Cyclic.Int63.PrimInt63.';checks={}
for tag in ['swapped-results','wrong-predicate','swapped-arguments']:
 rep=copy.deepcopy(report);row=next(r for r in rep['results'] if r['source']==prefix+'ltb');value=row['target_value']['b']['b']
 if tag=='swapped-results':value['f']['a'],value['f']['f']['a']=value['f']['f']['a'],value['f']['a']
 elif tag=='wrong-predicate':value['a']['f']['f']['f']['n']='Rocq2Lean.PrimInt63.leb'
 else:value['a']['a'],value['a']['f']['a']=value['a']['f']['a'],value['a']['a']
 assert structurally_rejected(run,rep,'native-bool-'+tag,prefix+'ltb'),tag
 checks[tag]='STRUCTURALLY_REJECTED'
rows=[json.loads(l) for l in (run/'source.ndjson').read_text().splitlines()]
for d in rows:
 if d.get('name')==prefix+'ltb':
  roles=d['native']['primitive_signature']['bool_constructors']
  roles['true'],roles['false']=roles['false'],roles['true']
src=O/'wrong-native-roles.ndjson';src.write_text(''.join(json.dumps(r)+'\n' for r in rows))
with (O/'native-roles.log').open('w') as log:
 rc=subprocess.run([sys.executable,'-I',str(T/'tools/roundtrip.py'),str(src),str(O/'wrong-native-roles'),'-Q',str(R/'translator/fixtures/corelib-int63-bool'),'CorePred','--','CorePred.Ops'],env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=600).returncode
rep=json.loads((O/'wrong-native-roles/roundtrip.json').read_text())
assert rc!=0 and rep['status']=='EXPORT_VALIDATION_FAILED' and any('native metadata differs' in p for p in rep['problems']),rep
checks['wrong-native-registration']=rep['problems']
(O/'result.json').write_text(json.dumps({'status':'PASS','checks':checks},indent=2)+'\n');print(json.dumps(checks))
