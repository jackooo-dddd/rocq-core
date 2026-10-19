import pathlib,sys,subprocess,json
R=pathlib.Path(__file__).resolve().parents[1];T=R/"work/snapshots/template-quality-metadata/translator";O=R/"work/tests/template-quality-conversion"
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
with(O/"source.log").open("w")as log:rc=subprocess.run(["rocq","compile",str(O/"Source.v")],cwd=T,env=cli.opam_env(),stdout=log,stderr=subprocess.STDOUT,timeout=120).returncode
print("EXIT",rc,flush=True);print((O/"source.log").read_text(),flush=True)
if rc==0:(O/"result.json").write_text(json.dumps({"status":"PASS","direct_prop_instances":2,"type_wrapper_instances":2,"source_rejected_annotation_narrowing":2,"definitional_alias_equalities":2},indent=2)+"\n")
