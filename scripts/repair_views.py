from pathlib import Path
import json,sys,os,resource,shutil
RAW=Path.home()/'research/r2l-core-census-20261017/runs/corelib-census';sys.path.insert(0,str(RAW))
import measure_core as m
BASE=Path.home()/'research/rocq-core-by-file-20261018'
def limit():
 resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30));resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
m.limit=limit
runs=json.loads((BASE/'runs.json').read_text());lean=str(Path.home()/'.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean')
for meta in runs:
 out=Path(meta['evidence_dir']);stem=out
 if not (out/'translation_report.json').exists():continue
 if meta.get('kernel_views_exit')==0 and meta.get('entry_compile_exit')==0:continue
 rep=json.loads((out/'translation_report.json').read_text());by={d['source']:d for d in rep['results']}
 ok={'TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED','STATEMENT_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
 targets=[(r['name'],by[r['name']]['target']) for r in rep['roots'] if r['status'] in ok]
 code='import Rocq2LeanOut\nset_option pp.universes true\nset_option pp.fullNames true\nset_option pp.explicit true\nset_option format.width 120\nset_option pp.deepTerms true\nset_option pp.maxSteps 10000000\n'
 for i,(n,t) in enumerate(targets):code+=f'run_cmd Lean.logInfo "R2L_BEGIN_{i}"\n#print {t}\nrun_cmd Lean.logInfo "R2L_END_{i}"\n'
 (out/'lean/KernelViews.lean').write_text(code)
 if (out/'kernel-views.log').exists():shutil.copy2(out/'kernel-views.log',out/'initial-kernel-view-attempt.log')
 env=m.cli.lean_env();env['LEAN_PATH']=str(m.ROOT/'.lake/build/lib/lean')+':'+str(out/'lean')
 rc=m.run([lean,'-j','4','KernelViews.lean'],out/'lean',out/'kernel-views.log',env,300);meta['kernel_views_exit']=rc
 m.save(out/'kernel-view-index.json',[{'index':i,'source':n,'target':t} for i,(n,t) in enumerate(targets)])
 assert rc==0,(meta['module'],rc)
 rc=m.run([lean,'-j','4','-R',str(BASE),*m.cli.native_args(),str(stem.with_suffix('.lean')),'-o',str(stem.with_suffix('.olean'))],out,out/'entry-check.log',env,300);meta['entry_compile_exit']=rc
 assert rc==0,(meta['module'],rc)
 meta['run_status']='MEASURED';meta.pop('error',None)
 m.save(out/'run.json',meta)
m.save(BASE/'runs.json',runs)
m.save(BASE/'run-complete.json',{'modules':len(runs),'status':'COMPLETED','errors':[r['module'] for r in runs if r['run_status']=='INFRASTRUCTURE_ERROR']})

