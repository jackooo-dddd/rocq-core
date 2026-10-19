from pathlib import Path
import os,sys,subprocess,json,time,hashlib
W=Path(__file__).resolve().parents[1];R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
T=R/'experiments/mechanical-nat-eq-20261019/translator'
M=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1/Corelib'
sys.path.insert(0,str(T/'tools'));import rocq2lean as cli
(W/'.work/interop').mkdir(exist_ok=True);(W/'reports/interop').mkdir(exist_ok=True)
env=cli.lean_env();env['LEAN_PATH']=str(T/'.lake/build/lib/lean')
with (W/'reports/interop/tool.log').open('w') as log:
 p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(W/'.work/interop/ProfilePack.olean'),str(W/'interop/ProfilePack.lean')],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
if p.returncode:sys.exit(p.returncode)
configs=[
 ('PackedNat','Iteration','Init/Nat',['NativeBridge.natIso','NativeBridge.nat_add_agrees','NativeBridge.Incremental.nat_iter_agrees']),
 ('PackedSSR','SSR','ssr/ssrfun',['NativeBridge.optionIso','NativeBridge.Incremental.ssr_option_map_agrees','NativeBridge.Incremental.ssr_comp_agrees']),
 ('PackedSetoid','SetoidBridge','Setoids/Setoid',['NativeBridge.Incremental.SetoidBridge.setoidTheoryIso','NativeBridge.Incremental.SetoidBridge.Seq_refl_closed'])]
results=[]
for output,source,module,roots in configs:
 report=W/'reports/interop'/(output+'.json')
 src=W/'.work/interop'/(output+'.lean')
 tick=chr(96)
 src.write_text('import ProfilePack\nset_option maxRecDepth 16384\nset_option maxHeartbeats 4000000\nopen Lean in\nrun_cmd Lean.Elab.Command.liftTermElabM do\n  ProfilePack.pack '+tick+source+' '+tick+output+' #['+', '.join(tick+n for n in roots)+'] '+json.dumps(str(report))+'\n')
 env=cli.lean_env();env['LEAN_PATH']=':'.join(map(str,[W/'.work/interop',W/'.work',B,M/module/'lean',T/'.lake/build/lib/lean']))
 start=time.time()
 with (W/'reports/interop'/(output+'.log')).open('w') as log:
  p=subprocess.run([str(Path.home()/'.elan/bin/lean'),*cli.native_args(),'-o',str(src.with_suffix('.olean')),str(src)],cwd=W,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=300)
 row=dict(source_sha256=hashlib.sha256((W/'proofs'/(source+'.lean')).read_bytes()).hexdigest(), packer_sha256=hashlib.sha256((W/'interop/ProfilePack.lean').read_bytes()).hexdigest(), profile=output,source_profile=source,module=module,exit=p.returncode,seconds=round(time.time()-start,3))
 results.append(row);print(row,flush=True)
 (W/'reports/interop/validation.json').write_text(json.dumps(results,indent=2))
 if p.returncode:sys.exit(p.returncode)
