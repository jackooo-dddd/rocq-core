from pathlib import Path
import sys,os,resource,json,shutil,subprocess,time,traceback
RAW=Path.home()/'research/r2l-core-census-20261017/runs/corelib-census'
sys.path.insert(0,str(RAW))
import measure_core as m
BASE=Path.home()/'research/rocq-core-by-file-20261018'
ROOT=m.ROOT
os.environ['LEAN_NUM_THREADS']='4'
def limit():
 resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30))
 resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
m.limit=limit
mods=[x for x in m.MODS if x['module'].startswith(('Corelib.Init.','Corelib.Lists.','Corelib.BinNums.')) or x['module'] in ['Corelib.Numbers.BinNums','Corelib.Program.Basics','Corelib.Relations.Relation_Definitions']]
fails=json.loads((RAW/'export_result.json').read_text())['failures']
allitems=[]
for mod in mods:
 name=mod['module']; stem=BASE/Path(*name.split('.'));stem.parent.mkdir(parents=True,exist_ok=True)
 out=stem;out.mkdir(exist_ok=True)
 if (out/'run.json').exists():
  allitems.append(json.loads((out/'run.json').read_text()));continue
 shutil.copy2(mod['file'],stem.with_suffix('.v'))
 requested=sorted({n.split('#')[0] for k,n in mod['entries'] if k in ('C','I')})
 blocked={n:fails[n] for n in requested if n in fails}
 selected=[n for n in requested if n not in blocked]
 meta={'module':name,'source_file':mod['file'],'source_copy':str(stem.with_suffix('.v')),'all_names':requested,'export_blocked':blocked,'selected_requests':selected,'total':len(requested),'translation_file':str(stem.with_suffix('.lean')),'evidence_dir':str(out)}
 m.save(out/'inventory.json',meta)
 try:
  if not selected:
   if blocked:
    meta['run_status']='EXPORT_BLOCKED'
    text='import Lean\n-- No source declaration could be exported; compilation intentionally fails.\nrun_cmd throwError "EXPORT_BLOCKED: '+name+'; '+str(len(blocked))+' sort-polymorphic declarations unsupported by pinned MetaRocq. See '+stem.name+'.report.txt"\n'
   else:
    meta['run_status']='NO_COUNTED_DECLARATIONS'
    text='import Lean\n-- '+name+': no counted kernel declarations.\n-- Rocq notation/tactic commands have not been translated.\n'
   stem.with_suffix('.lean').write_text(text)
   env=m.cli.lean_env();rc=m.run([str(Path.home()/'.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean'),str(stem.with_suffix('.lean'))],out,out/'entry-check.log',env,60)
   meta['entry_compile_exit']=rc
   m.save(out/'scope.json',{'requested':0,'selected':[],'requires':[name],'source_roundtrip':'NOT_APPLICABLE'})
  else:
   (out/'Export.v').write_text('From Rocq2LeanExport Require Import Loader.\nRequire '+name+'.\nRocq2Lean ExportStatements "'+str(out/'source.ndjson')+'" '+' '.join(selected)+'.\n')
   rc=m.run(['rocq','compile','-I',str(ROOT/'rocq/exporter/src'),'-Q',str(ROOT/'rocq/exporter/theories'),'Rocq2LeanExport','Export.v'],out,out/'export.log',m.ENV,600)
   if rc:raise RuntimeError('export failed '+str(rc))
   pre,rows=m.load_ir(out/'source.ndjson');roots=next(d['roots'] for d in pre if d['kind']=='roots')
   rt=out/'source-roundtrip';rt.mkdir(exist_ok=True)
   rc=m.run([sys.executable,'-I',str(ROOT/'tools/roundtrip.py'),str(out/'source.ndjson'),str(rt),'--',name],ROOT,out/'roundtrip.log',m.ENV,600)
   meta['roundtrip_exit']=rc
   con=m.contract.build(out/'source.ndjson',selected,protection=m.protection.binding([d['name'] for d in rows]));m.save(out/'contract.json',con)
   m.save(out/'scope.json',{'selected':[r['name'] for r in roots],'requested_names':selected,'requested':len(roots),'closure':len(rows),'requires':[name],'source_roundtrip':json.loads((rt/'roundtrip.json').read_text())['status'],'translation_commit':'3c79203'})
   m.measure(out)
   if not (out/'translation_report.json').exists():m.measure(out)
   rep=json.loads((out/'translation_report.json').read_text())
   meta['run_status']='MEASURED';meta['root_statuses']={r['name']:r['status'] for r in rep['roots']}
   for f in ['consumer_result.json','audit.json']:meta[f]=json.loads((out/f).read_text())['status']
   s=(out/'lean/Rocq2LeanOut.lean').read_text()
   stem.with_suffix('.lean').write_text('-- Source: '+name+'\n-- Independent unit including its dependency closure; see '+stem.name+'.report.txt.\n'+s)
   accepted={'TRANSLATED_AND_CHECKED','BOOTSTRAP_RESOLVED','STATEMENT_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
   by={d['source']:d for d in rep['results']}
   targets=[(r['name'],by[r['name']]['target']) for r in rep['roots'] if r['status'] in accepted]
   code='import Rocq2LeanOut\nset_option pp.universes true\nset_option pp.fullNames true\nset_option pp.explicit true\nset_option format.width 120\nset_option pp.deepTerms true\nset_option pp.maxSteps 10000000\n'
   for i,(n,t) in enumerate(targets):code+=f'run_cmd Lean.logInfo "R2L_BEGIN_{i}"\n#print {t}\nrun_cmd Lean.logInfo "R2L_END_{i}"\n'
   (out/'lean/KernelViews.lean').write_text(code)
   env=m.cli.lean_env();env['LEAN_PATH']=str(ROOT/'.lake/build/lib/lean')+':'+str(out/'lean')
   lean=str(Path.home()/'.elan/toolchains/leanprover--lean4---v4.33.1/bin/lean')
   rc=m.run([lean,'-j','4','KernelViews.lean'],out/'lean',out/'kernel-views.log',env,300)
   meta['kernel_views_exit']=rc
   m.save(out/'kernel-view-index.json',[{'index':i,'source':n,'target':t} for i,(n,t) in enumerate(targets)])
   if rc:raise RuntimeError('kernel view printing failed '+str(rc))
   rc=m.run([lean,'-j','4','-R',str(BASE),*m.cli.native_args(),str(stem.with_suffix('.lean')),'-o',str(stem.with_suffix('.olean'))],out,out/'entry-check.log',env,300)
   meta['entry_compile_exit']=rc
   if rc:raise RuntimeError('named translation entry compile failed '+str(rc))
  m.say('MODULE_DONE',name,meta['run_status'])
 except Exception:
  meta['run_status']='INFRASTRUCTURE_ERROR';meta['error']=traceback.format_exc();(out/'run-error.txt').write_text(meta['error']);m.say('MODULE_ERROR',name,meta['error'])
 m.save(out/'run.json',meta);allitems.append(meta);m.save(BASE/'runs.json',allitems)
m.save(BASE/'run-complete.json',{'modules':len(allitems),'status':'COMPLETED','errors':[r['module'] for r in allitems if r['run_status']=='INFRASTRUCTURE_ERROR']})

