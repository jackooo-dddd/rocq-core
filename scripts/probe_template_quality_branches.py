import pathlib,sys,os,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/template-quality-metadata/translator";O=R/"work/tests/template-quality-branches"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
results={}
for label,args,env in [
 ("source",["rocq","compile",str(O/"Source.v")],cli.opam_env()),
 ("lean",[str(pathlib.Path.home()/".elan/bin/lean"),str(O/"Representations.lean")],cli.lean_env())]:
 with(O/(label+".log")).open("w")as log:rc=subprocess.run(args,cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=120).returncode
 results[label]=rc
 assert rc==0,(label,(O/(label+".log")).read_text())
assert (O/"lean.log").read_text().count("does not depend on any axioms")==2
results.update(status="PASS",source_quality_combinations=8,target_quality_combinations=8,source_beta_laws=2,target_arbitrary_sort_beta_laws=2,translator_integrated=False)
(O/"result.json").write_text(json.dumps(results,indent=2)+"\n");print(json.dumps(results),flush=True)
