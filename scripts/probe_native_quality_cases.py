import pathlib,subprocess,sys,json,collections,itertools,os,time,resource
R=pathlib.Path(__file__).resolve().parents[1];T=pathlib.Path(sys.argv[1]).resolve();N=pathlib.Path(sys.argv[2]).resolve();O=pathlib.Path(sys.argv[3]).resolve();O.mkdir()
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli,contract,protection
os.environ["LEAN_NUM_THREADS"]="4";os.environ["ROCQ2LEAN_LEAN_THREADS"]="4"
assert (N/"Native.vo").exists()
families=[json.loads(p.read_text())for p in sorted(N.glob("Corelib.*.json"))];assert len(families)==23
roots=[];decls=[];links=[]
for fam in families:
 assert {tuple(c["qualities"])for c in fam["cases"]}==set(itertools.product(["SProp","Prop","Type"],repeat=fam["quality_parameters"]))
 assert len(fam["cases"])==3**fam["quality_parameters"]
 for c in fam["cases"]:
  assert c["native_declared_type_conversion"]and c["native_value_conversion"]and c["native_kernel_check"]
  ident=fam["source"].replace(".","_")+"__"+"".join({"SProp":"S","Prop":"P","Type":"T"}[q]for q in c["qualities"])
  name="NativeQualityPrototype."+ident
  roots.append({"requested":name,"name":name,"term":{"k":"const","c":name,"u":[{"k":"var","i":i}for i in range(fam["level_parameters"])]}})
  decls.append({"kind":"constant","name":name,"mp":{"file":["NativeQualityPrototype"]},"id":ident,
   "type":c["type"],"body":c["body"],"body_state":"opaque_present"if fam["body_kind"]=="opaque"else"transparent",
   "universes":c["universes"],"deps":{"type":[],"body":[]},"native":{"body_kind":fam["body_kind"],"polymorphic":True,"typing_flags":fam["typing_flags"],
   "diagnostic_quality_family":{"source":fam["source"],"qualities":c["qualities"],"NOT_ORIGINAL_ROOT_COVERAGE":True}}})
  links.append({"source":fam["source"],"qualities":c["qualities"],"prototype":name})
assert len(decls)==603
header={"kind":"header","ir":"rocq2lean-ir/0.2","mode":"proof","rocq_version":"9.3.0","frontend":{"name":"native-quality-diagnostic","quoter":"Ast_quoter.quote_term after native exact declared-type and body conversion checks","NOT_ORIGINAL_ROOT_COVERAGE":True},"global_typing_flags":families[0]["typing_flags"]}
records=[header,{"kind":"roots","roots":roots},{"kind":"libraries","libraries":[]},{"kind":"universes","levels":[],"constraints":[]},{"kind":"universe_facts","levels":[],"relations":[],"source":"no global universe levels occur in these native-checked cases"},*decls,{"kind":"footer","declarations":len(decls)}]
(O/"source.ndjson").write_text("".join(json.dumps(d)+"\n"for d in records))
(O/"family-links.json").write_text(json.dumps(links,indent=2)+"\n")
con=contract.build(O/"source.ndjson",[r["name"]for r in roots],protection=protection.binding([d["name"]for d in decls]))
(O/"contract.json").write_text(json.dumps(con,indent=2)+"\n")
def limits():
 resource.setrlimit(resource.RLIMIT_AS,(12<<30,12<<30));resource.setrlimit(resource.RLIMIT_STACK,(8<<20,8<<20))
def run(label,args,env=None,cwd=T):
 print("START",label,flush=True);start=time.time()
 with(O/(label+".log")).open("w")as log:
  rc=subprocess.run([str(x)for x in args],cwd=cwd,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=1800,preexec_fn=limits).returncode
 print("END",label,rc,flush=True);return {"stage":label,"exit":rc,"seconds":time.time()-start}
steps=[run("translate",[sys.executable,"-I",T/"tools/rocq2lean.py","translate","--input",O/"source.ndjson","--out",O])]
ld=O/"lean";(ld/"Consumer.lean").write_text('import Rocq2LeanOut\nimport Rocq2Lean.Verify\n#rocq2lean_verify '+json.dumps(str(O/"contract.json"))+' '+json.dumps(str(O/"translation_report.json"))+' '+json.dumps(str(O/"consumer_result.json"))+'\n')
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")+":"+str(ld)
steps.append(run("consumer",[pathlib.Path.home()/".elan/bin/lean",*cli.native_args(),"Consumer.lean"],env,ld))
steps.append(run("audit",[sys.executable,"-I",T/"tools/audit.py",O/"source.ndjson",O/"contract.json",O/"translation_report.json",O/"audit.json",O/"consumer_result.json"]))
rep=json.loads((O/"translation_report.json").read_text());rows={r["source"]:r for r in rep["results"]}
result=[dict(l,status=rows[l["prototype"]]["status"],message=rows[l["prototype"]].get("message"))for l in links]
summary={"status":"DIAGNOSTIC_NOT_ORIGINAL_ROOT_COVERAGE","original_families":23,"branches":603,"counts":dict(collections.Counter(r["status"]for r in result)),"steps":steps,"source_roundtrip":"NOT_INTEGRATED","family_dispatch":"NOT_INTEGRATED","results":result}
(O/"result.json").write_text(json.dumps(summary,indent=2)+"\n");print("COMPLETE",summary["counts"],flush=True)
