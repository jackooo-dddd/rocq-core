import pathlib,sys,json,copy,subprocess
R=pathlib.Path(__file__).resolve().parents[1]
T=pathlib.Path(sys.argv[1]);S=pathlib.Path(sys.argv[2]);O=pathlib.Path(sys.argv[3]);O.mkdir()
validation=json.loads((S/"result.json").read_text())["validation"]
assert all(validation[k]=="OK"for k in ["roundtrip","consumer","audit"]),validation
rep=json.loads((S/"translation_report.json").read_text());pre="Corelib.Classes.Morphisms_Prop."
rows={r["source"]:r for r in rep["results"]}
names=["all_iff_morphism","all_iff_morphism_obligation_1","all_impl_morphism","all_impl_morphism_obligation_1","ex_iff_morphism","ex_iff_morphism_obligation_1","ex_impl_morphism","ex_impl_morphism_obligation_1"]
for n in names:assert rows[pre+n]["status"] in ("STATEMENT_KERNEL_CHECKED","STATEMENT_PENDING_KERNEL_CHECKED") and rows[pre+n]["protected"]
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
env=cli.lean_env();env["LEAN_PATH"]=str(S/"lean")+":"+str(T/".lake/build/lib/lean")
def lean_run(file,log):
 with log.open("w")as f:
  return subprocess.run([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(file)],cwd=T,env=env,stdout=f,stderr=subprocess.STDOUT,timeout=300).returncode
import audit
decls={d["name"]:d for l in(S/"source.ndjson").open()if(d:=json.loads(l)).get("kind")in("constant","inductive")}
eligible=audit.erasing_poly_closure(decls)
name=pre+"all_iff_morphism";original=rows[name];d=decls[name]
bodies={n:eligible[n]for n in original["delta_inlined"]if n in eligible}
used=set();expanded=audit.inline_erasing_term(d["type"],bodies,used=used)
assert used==set(bodies)
assert '"c": "Corelib.Init.Logic.iff"'in json.dumps(expanded),"higher-order reference must survive"
extra=None
for n in sorted(eligible):
 if n in bodies:continue
 candidate=dict(bodies,**{n:eligible[n]});seen=set()
 audit.inline_erasing_term(d["type"],candidate,used=seen)
 if n not in seen:extra=n;break
assert extra is not None
def walk(e):
 if isinstance(e,dict):
  yield e
  for v in list(e.values()):yield from walk(v)
 elif isinstance(e,list):
  for v in e:yield from walk(v)
def unspine(e):
 args=[]
 while e["k"]=="app":args.insert(0,e["a"]);e=e["f"]
 return e,args
def app(h,args):
 for a in args:h={"k":"app","f":h,"a":a}
 return h
mut=[]
for tag in ["claim-unused-alias-expansion","replace-bare-iff-by-disjunction"]:
 bad=copy.deepcopy(rep);name=pre+"all_iff_morphism";row=next(r for r in bad["results"]if r["source"]==name)
 if tag=="claim-unused-alias-expansion":
  row["delta_inlined"]=sorted(set(row["delta_inlined"]+[extra]))
 else:
  hits=[e for e in walk(row["target_value"])if e.get("k")=="const"and e.get("n")=="Rocq.Corelib.Init.Logic.iff"]
  assert len(hits)==1,len(hits)
  h=hits[0];assert h["u"]==[]
  h["n"]="Or"
 inp=O/(tag+".json");inp.write_text(json.dumps(bad))
 kernel=copy.deepcopy(bad);pos=next(i for i,r in enumerate(kernel["results"])if r["source"]==name)
 kernel["results"]=kernel["results"][:pos+1]
 kinp=O/(tag+"-replay.json");kinp.write_text(json.dumps(kernel))
 ko=O/(tag+"-kernel.json");lc=O/(tag+".lean")
 lc.write_text("import Rocq2Lean.Replay\n#rocq2lean_replay "+json.dumps(str(kinp))+" "+json.dumps(str(ko))+"\n")
 assert lean_run(lc,O/(tag+"-kernel.log"))==0,(O/(tag+"-kernel.log")).read_text()
 kr=json.loads(ko.read_text());assert all(x["kernel"]=="ACCEPTED"for x in kr["results"]),kr
 ao=O/(tag+"-audit.json")
 with(O/(tag+"-audit.log")).open("w")as log:
  rc=subprocess.run([sys.executable,"-I",str(T/"tools/audit.py"),str(S/"source.ndjson"),str(S/"contract.json"),str(inp),str(ao),str(S/"consumer_result.json")],stdout=log,stderr=subprocess.STDOUT).returncode
 aud=json.loads(ao.read_text());assert rc==1 and any(name in x["message"]for x in aud["problems"]),aud
 mut.append({"name":tag,"kernel":"ACCEPTED","kernel_prefix_records":len(kr["results"]),"audit":"REJECTED"})
 print(tag,"PASS",flush=True)
res={"status":"PASS","new_actual_core_declarations":names,"expanded_alias_names":sorted(used),"bare_higher_order_reference_preserved":True,"mutations":mut}
(O/"result.json").write_text(json.dumps(res,indent=2)+"\n");print(json.dumps(res),flush=True)
