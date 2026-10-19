#!/usr/bin/env python3
import pathlib,sys,os,json,subprocess,copy
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();O=pathlib.Path(sys.argv[2]).resolve();O.mkdir(parents=True,exist_ok=True)
os.environ['LEAN_NUM_THREADS']='4';os.environ['ROCQ2LEAN_LEAN_THREADS']='4';sys.path.insert(0,str(T/'tools'));import audit
roots=['CorePoly.Poly.'+n for n in ['box','unbox','cell','value','tree','first','small','large','small_value','large_value']]
def run(args,label):
 with open(O/(label+'.log'),'w') as f:return subprocess.run([sys.executable,'-I',str(T/'tools/rocq2lean.py'),*map(str,args)],cwd=T,stdout=f,stderr=subprocess.STDOUT,timeout=600).returncode
checks={};positive=O/'positive';manifest=R/'translator/fixtures/corelib-poly/source.json'
for args,label in [(['export','--mode','statement','--manifest',manifest,'--roots',','.join(roots),'--out',positive],'export'),(['translate','--input',positive/'source.ndjson','--out',positive],'translate'),(['validate','--run',positive],'validate')]:
 rc=run(args,label);checks[label+'_exit']=rc
 if rc and label=='translate':
  rep=json.load(open(positive/'translation_report.json'))
  failed={r['name']:r['status'] for r in rep['roots'] if r['status']!='TRANSLATED_AND_CHECKED'}
  # Keep the constrained-cumulativity examples in the fixture and explicitly
  # report them as unresolved; this test certifies only the supported fragment.
  assert failed=={'CorePoly.Poly.large':'KERNEL_REJECTED','CorePoly.Poly.large_value':'BLOCKED_DEPENDENCY'},failed
  checks['known_unresolved_cumulativity']=failed
 elif rc:
  (O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');raise AssertionError((label,rc))
rep=json.load(open(positive/'translation_report.json'));checks['roots']=[{'name':r['name'],'status':r['status']} for r in rep['roots']]
rows=[json.loads(l) for l in open(positive/'source.ndjson')];decls={r['name']:r for r in rows if r['kind'] in ('constant','inductive')};checker=audit.Auditor(decls,rep['results']);name='CorePoly.Poly.box';r=next(r for r in rep['results'] if r['source']==name)
src={'k':'ind','ind':{'mind':name,'i':0},'u':[{'k':'set'}]};target={'k':'const','n':r['target'],'u':[{'k':'zero'}]};checker.check(src,target,[])
for label,bad in [('wrong_instance',dict(target,u=[{'k':'succ','l':{'k':'zero'}}])),('missing_instance',dict(target,u=[]))]:
 try:checker.check(src,bad,[])
 except audit.Mismatch:checks['reject_'+label]=True
 else:raise AssertionError(('audit accepted malformed universe reference',label))
bad=copy.deepcopy(r);bad['universe_poly_params']=0
try:audit.poly_count(decls[name],bad)
except audit.Mismatch:checks['reject_false_poly_count']=True
else:raise AssertionError('audit accepted false polymorphic arity')
checks['status']='PASS_SUPPORTED_FRAGMENT' if checks.get('known_unresolved_cumulativity') else 'PASS';(O/'result.json').write_text(json.dumps(checks,indent=2)+'\n');print(json.dumps(checks))
