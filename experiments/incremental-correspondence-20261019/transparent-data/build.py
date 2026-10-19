"""Re-export retained mechanical bodies in an explicitly separate namespace."""
from pathlib import Path
import sys,json,subprocess,time,hashlib,re
D=Path(__file__).resolve().parent;W=D.parent;R=W.parents[1]
T=R/'experiments/mechanical-nat-eq-20261019/translator'
M=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
B=R/'experiments/mechanical-correspondence-20261019'
P=W/'.work/transparent-data';P.mkdir(parents=True,exist_ok=True)
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
configs={
 'CRelation':('Classes/CRelationClasses',['CRelationData','CRelationOrder','CRelationStatements']),
 'CMorphism':('Classes/CMorphisms',['CMorphismData']),
 'SSRBool':('ssr/ssrbool',['SSRPredicatePackages','SSRBoolClosedOperations','SSRBoolFinalWitnesses']),
 'SSRFun':('ssr/ssrfun',['SSRFunOpacity','SSRFunConditions','SSRFunData','SSRFunNormalization']),
 'SSRRewrite':('ssr/ssreflect_rw',['SSRRewriteData','SSRRewriteStatements']),
 'ProgramWf':('Program/Wf',['ProgramWellFounded']),
}
def run(src,env,log):
 start=time.time()
 with log.open('w') as f:
  p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(P/(src.stem+'.olean')),str(src)],cwd=W,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300)
 if p.returncode:print(log.read_text());raise SystemExit(p.returncode)
 return round(time.time()-start,3)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')
run(D/'TransparentPack.lean',env,D/'reports/exporter.log')
audit=json.loads((W/'reports/REMAINING_BODY_AUDIT.json').read_text())
for name in sys.argv[1:] or configs:
 module,imports=configs[name]
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[P,W/'.work',B,M/module/'lean',T/'.lake/build/lib/lean']))
 inp=P/('TransparentInput'+name+'.lean');inp.write_text(''.join('import '+i+'\n' for i in imports))
 run(inp,env,D/'reports'/('input-'+name+'.log'))
 selected=[r['target'] for r in audit['roots'] if r['module']=='Corelib.'+module.replace('/','.')]
 helpers=[]
 for profile in imports:
  helpers += [(n if n.startswith('NativeBridge.') else 'NativeBridge.Incremental.'+profile+'.'+n) for n in re.findall(r'^(?:def|abbrev|theorem)\s+([\w.]+)',(W/'proofs'/(profile+'.lean')).read_text(),re.M)]
 if name == "SSRBool": helpers += ["NativeBridge.sigmaIso","NativeBridge.sigIso","NativeBridge.sig2Iso","NativeBridge.is_true_agrees","NativeBridge.bool_to_of","NativeBridge.Incremental.SSRBoolData.impliesIso","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrfun.tag_of_sig__rocq2lean_obligation_1.statement","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrfun.sig_of_sig2__rocq2lean_obligation_1.statement","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_1.statement","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_tag_cond_dep__rocq2lean_obligation_2.statement","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_1.statement","NativeBridge.Incremental.SSRBoolWitnesses.closed.Rocq.Corelib.ssr.ssrbool.all_sig2_cond__rocq2lean_obligation_2.statement"]
 roots=sorted(set(selected+helpers))
 src=P/('Data'+name+'.lean')
 src.write_text('import TransparentPack\nset_option maxRecDepth 16384\nset_option maxHeartbeats 12000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  TransparentPack.pack '+chr(96)+inp.stem+' '+chr(96)+'Computational.'+name+' #['+', '.join(chr(96)+n for n in roots)+'] '+json.dumps(str(D/'reports'/('export-'+name+'.json')))+'\n')
 elapsed=run(src,env,D/'reports'/('export-'+name+'.log'))
 report=json.loads((D/'reports'/('export-'+name+'.json')).read_text())
 validation=dict(profile=name,exit=0,seconds=elapsed,requested_incomplete_roots=selected,
   supporting_roots=helpers,opaque_values_exposed=len(report['exposed_non_prop_opaque']),
   exporter_sha256=hashlib.sha256((D/'TransparentPack.lean').read_bytes()).hexdigest(),
   source_ir_sha256=hashlib.sha256((M/module/'source.ndjson').read_bytes()).hexdigest(),
   output_olean_sha256=hashlib.sha256((P/(src.stem+'.olean')).read_bytes()).hexdigest())
 (D/'reports'/('export-validation-'+name+'.json')).write_text(json.dumps(validation,indent=2)+'\n')
 print(name,'PASS',len(selected),'outstanding roots;',len(report['exposed_non_prop_opaque']),'opaque data exposed',flush=True)
