"""Produce a per-source-file, evidence-linked Corelib result collection."""
import argparse,collections,csv,json,pathlib,shutil,subprocess,sys,concurrent.futures
P=pathlib.Path
a=argparse.ArgumentParser()
a.add_argument("--run",type=P,required=True);a.add_argument("--out",type=P,required=True)
a.add_argument("--baseline",type=P,required=True);a.add_argument("--campaign",type=P,required=True)
x=a.parse_args();S=x.run.resolve();O=x.out.resolve();R=P(__file__).resolve().parents[2]
manifest=json.loads((S/"manifest.json").read_text());T=P(manifest["translator"])
summary=json.loads((S/"summary.json").read_text())
assert summary["success"] and summary["distinct_requested"]==2180 and summary["modules"]==67
assert x.campaign.read_text().rstrip().endswith("CAMPAIGN_COMPLETE")
O.mkdir(parents=True,exist_ok=False)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
base=json.loads((x.baseline/"all-roots.json").read_text())
inventory={d["module"]:d for d in json.loads((R/"work/inventory/modules.json").read_text())["modules"]}
labels={
 "TRANSLATED_AND_CHECKED":'Complete definition/data type, with no proof parameters to discharge',
 "BOOTSTRAP_RESOLVED":'Already corresponds to Lean',
 "STATEMENT_KERNEL_CHECKED":'Theorem/axiom statement with no proof parameters to discharge; not a proved theorem',
 "PENDING_KERNEL_CHECKED":'Definition with explicit proof parameters to discharge',
 "STATEMENT_PENDING_KERNEL_CHECKED":'Statement with explicit proof parameters to discharge; not a proved theorem'}
stages={"BLOCKED_DEPENDENCY":'Depend on',"BLOCKED_SOURCE_BODY":'source body',"UNSUPPORTED_FEATURE":'Missing conversion support',
"UNIVERSE_REJECTED":'cosmic constraints',"KERNEL_REJECTED":'Lean core',"INTERFACE_REJECTED":'public interface',
"OBLIGATION_EXTRACTION_REFUSED":'Prove extraction',"EXPORT_BLOCKED":'Export',"TRANSLATION_FAILED":'item translation'}
features=["source_computed","erasing_poly_inlined","poly_level_interp","level_interp","type_lift_coercions",
"prop_lift_coercions","admitting_levels","universe_lowered","result_sort_inherited","delta_inlined",
"level_copies","sort_interp","sort_fact_reduced","phantom_lowered","coinductive_as_inductive"]
flat=[];modules=[];print_jobs=[];all_seen=set()
def dump(p,obj):p.write_text(json.dumps(obj,ensure_ascii=False,indent=2)+"\n")
def lean_name(n):return ".".join("«"+p+"»" for p in n.split("."))
for mod in manifest["modules"]:
 rel=P(*mod.split("."));M=S/rel;dest=O/rel;dest.parent.mkdir(parents=True,exist_ok=True)
for mod in manifest["modules"]:
 rel=P(*mod.split("."));M=S/rel;dest=O/rel
 result=json.loads((M/"result.json").read_text());assert result["checked"]
 roots=result["root_results"]
 source_file=P(inventory[mod]["file"])
 shutil.copy2(source_file,dest.with_suffix(".v"))
 for_root={};rows={};timings={};source={};baseline_rows={}
 if roots:
  report=json.loads((M/"translation_report.json").read_text());rows={r["source"]:r for r in report["results"]}
  timings={r["source"]:r for r in json.loads((M/"translation_timing.json").read_text())["declarations"]}
  for line in (M/"source.ndjson").open():
   d=json.loads(line)
   if d.get("kind") in {"constant","inductive"}:source[d["name"]]=d
  bp=x.baseline/rel/"translation_report.json"
  if bp.exists():baseline_rows={r["source"]:r for r in json.loads(bp.read_text())["results"]}
 counts=collections.Counter(d["status"] for d in roots.values())
 text=[mod,"",f"Original file: {source_file}",f"Freeze operation: {M}",
       f"Original root declarations: {len(roots)}; currently blocked: 0; checks: {result['validation']}.","",
       f"[Rocq source]({dest.name}.v) · [Lean entry point]({dest.name}.lean) · [Lean printed output]({dest.name}.txt) · [Complete per-declaration records]({dest.name}.json)",""]
 printed=[]
 for name,root in sorted(roots.items()):
  assert name not in all_seen;all_seen.add(name)
  canonical=root.get("canonical",name);row=rows[canonical];status=root["status"];assert status in labels
  variants=[r for n,r in rows.items() if n.startswith(canonical+"__rocq2lean_quality_")]
  hyps=row.get("pending_hypotheses",[])
  obligation_rows=[rows[h] for h in hyps if h in rows]
  old=base[name];oldrow=baseline_rows.get(old.get("canonical",name),{})
  used={k:row[k] for k in features if row.get(k)}
  trace=timings.get(canonical,{})
  record={"source":name,"canonical":canonical,"result":root,"meaning":labels[status],
          "source_ir":source.get(canonical),"target_report":row,"quality_variants":variants,
          "prerequisite_declarations":obligation_rows,"attempts":trace,
          "baseline":{"result":old,"stage":stages.get(old["status"],'Result already present in the baseline'),
                      "path":oldrow.get("path"),"message":oldrow.get("message") or old.get("message"),
                      "native_diagnostics":oldrow.get("universe_diagnostics")},
          "module_validation":result["validation"],"evidence_directory":str(M)}
  for_root[name]=record
  flat.append({"source":name,"module":mod,"source_kind":source.get(canonical,{}).get("kind",""),
               "source_body_state":source.get(canonical,{}).get("body_state",""),
               "status":status,"target":root["target"],"prerequisites":len(hyps),
               "quality_variants":len(variants),"baseline_status":old["status"],
               "baseline_message":old.get("message",""),
               "rules":json.dumps(used,ensure_ascii=False),"final_tier":trace.get("tier_times",[[None]])[-1][0] if trace.get("tier_times") else ""})
  text += ["---","",name,"",f"- Result: {labels[status]}.",
           f"- Lean name: {root['target']}; target declaration kind: {row.get('target_kind')}.",
           f"- Source kind: {source.get(canonical,{}).get('kind')} / {source.get(canonical,{}).get('body_state','inductive')}.",
           f"- Dispatch rule: {row.get('rule')}; mechanisms actually enabled: {json.dumps(used,ensure_ascii=False)}.",
           f"- Attempt sequence (label, milliseconds, result): {json.dumps(trace.get('tier_times',[]),ensure_ascii=False)}.",
           f"- Proof parameters to discharge ({len(hyps)}): {', '.join(hyps) or 'none'}.",
           f"- Additional Sort quality branches: {len(variants)} ({len(variants)+1} representations including the primary one); the complete branches, types, and body AST are in the corresponding JSON file.",
           f"- Baseline status: {old['status']}; stage: {record['baseline']['stage']}.",
           f"- Baseline reason: {record['baseline']['message'] or 'no blocking issue'}.",
           f"- Baseline failure path: {record['baseline']['path'] or 'not recorded / no failure'}.",""]
  for rr in [row,*variants,*obligation_rows]:
   if rr.get("target") and rr["target"] not in printed:printed.append(rr["target"])
 if not roots:text+=['This source file does not have a kernel root declaration in the manifest. Keep the source file and the empty Lean entry; do not count as a successful translation of tactic/notation.',""]
 dump(dest.with_suffix(".json"),{"module":mod,"roots":for_root,"validation":result["validation"],
                                "state":result.get("state"),"evidence_directory":str(M)})
 dest.with_suffix(".md").write_text("\n".join(text))
 if roots:
  code=(M/"lean/Rocq2LeanOut.lean").read_text()
  code+="\nset_option pp.universes true\n"
  code+="\n".join("#print "+lean_name(n) for n in printed)+"\n"
 else:code="import Rocq2Lean\n-- No inventoried kernel roots; tactics and notation are not translated.\n"
 dest.with_suffix(".lean").write_text(code)
 modules.append({"module":mod,"roots":len(roots),"counts":dict(counts),"checked":True,
                 "validation":result["validation"],"printed_targets":len(printed),"report":str(rel)+".md"})
 print_jobs.append((mod,dest,M))
 print("ASSEMBLED",mod,len(roots),flush=True)
assert len(all_seen)==2180 and all_seen==set(base)
def print_module(job):
 mod,dest,M=job;env=cli.lean_env()
 env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
 with dest.with_suffix(".txt").open("w") as log:
  p=subprocess.run([str(P.home()/".elan/bin/lean"),*cli.native_args(),str(dest.with_suffix(".lean"))],
                   cwd=T,env=env,stdout=log,stderr=subprocess.STDOUT,timeout=600)
 print("PRINTED",mod,p.returncode,flush=True)
 return {"module":mod,"exit":p.returncode}
with concurrent.futures.ThreadPoolExecutor(max_workers=2) as pool:printed=list(pool.map(print_module,print_jobs))
dump(O/"print-validation.json",printed);assert all(d["exit"]==0 for d in printed),printed
with (O/"declarations.csv").open("w",newline="") as f:
 w=csv.DictWriter(f,fieldnames=list(flat[0]));w.writeheader();w.writerows(flat)
dump(O/"summary.json",{"source_run":str(S),"translator":str(T),"campaign":str(x.campaign.resolve()),
                      "scope":summary,"modules":modules,"printing":"67 entries compiled successfully"})
(O/"run_lean_entry.py").write_text("""import pathlib,sys,json,subprocess
R=pathlib.Path(__file__).resolve().parent
T=pathlib.Path(json.loads((R/"summary.json").read_text())["translator"])
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
entry=pathlib.Path(sys.argv[1]);entry=entry if entry.is_absolute() else R/entry
env=cli.lean_env();env["LEAN_PATH"]=str(T/".lake/build/lib/lean")
sys.exit(subprocess.call([str(pathlib.Path.home()/".elan/bin/lean"),*cli.native_args(),str(entry)],cwd=T,env=env))
""")
shutil.copy2(x.campaign,O/"campaign.log")
shutil.copy2(R/"SOURCE-NOTICES.txt",O/"SOURCE-NOTICES.txt")
readme=['Corelib full translation results',"",f"Fixed range: Rocq 9.3.0 67 source modules, 2180 constant/mutual inductive block root declarations in the installation. 16 modules have no kernel root declaration; tactic, notation, extraction instructions are not counted as translated.",
        f"Result: Check items 2180 passed and items 0 blocked. Run: {S}.","",
        '| Classification | Quantity | Usage meaning |',"|---|---:|---|"]
for status in labels:
 readme.append(f"| {status} | {summary['root_counts'].get(status,0)} | {labels[status]} |")
readme += ["",'The complete definition can be used for Lean type checking, proofs, and kernel reductions. The importer registers kernel declarations but does not automatically perform Lean code generation for the generated data types; therefore it does not commit to directly #eval/compiled executables, and bridge definitions that rely on these types can be marked noncomputable to use their kernel semantics. Definitions with unvalidated parameters must first provide these parameters. A statement corresponds to the definition of a proposition, not a proof of the proposition; unproven dependence does not mean that the theorem has been proven.',
           'The representation of nat/eq shall be subject to target/rule in this report. The current mechanical-nat-eq-20261019 baseline does not contain bootstrap, and an independent inductive type is generated; for subsequent bidirectional correspondence and migration checks, please see the warehouse experiments/mechanical-correspondence-20261019/README.md. Historical runs still retain their original mapping records.',
           "","",'File correspondence:',
           '- Corelib/.../Name.v: A copy of the original Rocq file.',
           '- Corelib/.../Name.lean: Executable independent translation entry, and prints all root declarations, quality branches and explicit conditions of the file.',
           '- Corelib/.../Name.txt: Lean The actual printed type/body; does not disguise the printed body as a stand-alone compilable package.',
           '- Corelib/.../Name.md: State the status, rules, attempt sequence, conditions, baseline failure stages and reasons one by one.',
           '- Corelib/.../Name.json: Complete source IR, target type/body AST, quality branch, conditional statement and verification evidence path.',
           '- declarations.csv: 2180 items can be filtered in the total list; summary.json: Fixed range, classification, and module-by-module counting.',
           "",'Process: MetaRocq Export dependency closure with proof condition → Dispatch by claim and attempt universe interpretation/representation transformation → Lean Register claim → Rocq Source roundtrip, standalone Lean consumer with standalone structural audit. All root-declared modules pass these three checks; addendum campaign completes.',
           'The mechanisms in JSON are records of actual use; not every mechanism is claimed to be the minimum set essential to that claim. If the baseline fails, the original error report is retained; the missing rules are not fabricated based on the error text.',
           'Each Lean entry contains its own dependency closure. They are the product of file-by-file research and are not a unified Lean library that guarantees simultaneous import; the entry refers to the absolute path in remote freeze operation and must be used on a workstation that retains the warehouse path.',
           "",f"Run a single entry: python3 {O}/run_lean_entry.py Corelib/Init/Nat.lean. The freezing tool chain is already installed and no new framework is required.",
           "",'| source module | Number of root declarations | Result |',"|---|---:|---|"]
for m in modules:readme.append(f"| {m['module']} | {m['roots']} | [Per-declaration results]({m['report']}) |")
(O/"README.md").write_text("\n".join(readme)+"\n")
print("PACKAGE_COMPLETE",str(O),flush=True)
