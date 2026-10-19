"""Produce a per-source-file, evidence-linked Corelib result collection."""
import argparse,collections,csv,json,pathlib,shutil,subprocess,sys,concurrent.futures
P=pathlib.Path
a=argparse.ArgumentParser()
a.add_argument("--run",type=P,required=True);a.add_argument("--out",type=P,required=True)
a.add_argument("--baseline",type=P,required=True);a.add_argument("--campaign",type=P,required=True)
x=a.parse_args();S=x.run.resolve();O=x.out.resolve();R=P(__file__).resolve().parents[1]
manifest=json.loads((S/"manifest.json").read_text());T=P(manifest["translator"])
summary=json.loads((S/"summary.json").read_text())
assert summary["success"] and summary["distinct_requested"]==2180 and summary["modules"]==67
assert x.campaign.read_text().rstrip().endswith("CAMPAIGN_COMPLETE")
O.mkdir(parents=True,exist_ok=False)
sys.path.insert(0,str(T/"tools"));import rocq2lean as cli
base=json.loads((x.baseline/"all-roots.json").read_text())
inventory={d["module"]:d for d in json.loads((R/"work/inventory/modules.json").read_text())["modules"]}
labels={
 "TRANSLATED_AND_CHECKED":"完整定义／数据类型，无待证参数",
 "BOOTSTRAP_RESOLVED":"已有 Lean 对应",
 "STATEMENT_KERNEL_CHECKED":"定理／公理陈述，无待证参数；不是已证明定理",
 "PENDING_KERNEL_CHECKED":"带显式待证参数的定义",
 "STATEMENT_PENDING_KERNEL_CHECKED":"带显式待证参数的陈述；不是已证明定理"}
stages={"BLOCKED_DEPENDENCY":"依赖","BLOCKED_SOURCE_BODY":"源正文","UNSUPPORTED_FEATURE":"缺少转换支持",
"UNIVERSE_REJECTED":"宇宙约束","KERNEL_REJECTED":"Lean 内核","INTERFACE_REJECTED":"公共接口",
"OBLIGATION_EXTRACTION_REFUSED":"证明抽取","EXPORT_BLOCKED":"导出","TRANSLATION_FAILED":"项翻译"}
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
 text=[mod,"",f"原文件：{source_file}",f"冻结运行：{M}",
       f"原始根声明：{len(roots)}；当前受阻：0；检查：{result['validation']}。","",
       f"[Rocq 源文件]({dest.name}.v) · [Lean 入口]({dest.name}.lean) · [Lean 打印结果]({dest.name}.txt) · [逐项完整记录]({dest.name}.json)",""]
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
          "baseline":{"result":old,"stage":stages.get(old["status"],"基线已有结果"),
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
  text += ["---","",name,"",f"- 结果：{labels[status]}。",
           f"- Lean 名称：{root['target']}；目标声明种类：{row.get('target_kind')}。",
           f"- 源端种类：{source.get(canonical,{}).get('kind')} / {source.get(canonical,{}).get('body_state','inductive')}。",
           f"- 分派规则：{row.get('rule')}；实际启用机制：{json.dumps(used,ensure_ascii=False)}。",
           f"- 尝试顺序（标签、毫秒、结果）：{json.dumps(trace.get('tier_times',[]),ensure_ascii=False)}。",
           f"- 待证参数（{len(hyps)}）：{', '.join(hyps) or '无'}。",
           f"- 额外 Sort quality 分支：{len(variants)}（有分支时连同主项共 {len(variants)+1} 种）；完整分支、类型与正文 AST 在同名 JSON。",
           f"- 基线状态：{old['status']}；阶段：{record['baseline']['stage']}。",
           f"- 基线原因：{record['baseline']['message'] or '无阻塞'}。",
           f"- 基线失败路径：{record['baseline']['path'] or '未记录／无失败'}。",""]
  for rr in [row,*variants,*obligation_rows]:
   if rr.get("target") and rr["target"] not in printed:printed.append(rr["target"])
 if not roots:text+=["此源文件没有清单中的内核根声明。保留源文件和空 Lean 入口；不计作 tactic/notation 的翻译成功。",""]
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
readme=["Corelib 全量翻译结果","",f"固定范围：Rocq 9.3.0 安装中的 67 个源模块、2180 个常量／互归纳块根声明。16 个模块没有内核根声明；tactic、notation、extraction 指令不计作已翻译。",
        f"结果：2180 项检查通过，0 项受阻。运行：{S}。","",
        "| 分类 | 数量 | 使用含义 |","|---|---:|---|"]
for status in labels:
 readme.append(f"| {status} | {summary['root_counts'].get(status,0)} | {labels[status]} |")
readme += ["","完整定义可以用于 Lean 类型检查、证明和内核归约。导入器注册内核声明，但不为生成的数据类型自动执行 Lean 代码生成；因此不承诺直接 #eval／编译可执行程序，依赖这些类型的桥接定义可标记 noncomputable 来使用其内核语义。带待证参数的定义必须先提供这些参数。陈述对应一个命题的定义，并非该命题的证明；无待证依赖也不表示定理已经证明。",
           "nat/eq 的表示以本次报告的 target/rule 为准。当前 mechanical-nat-eq-20261019 基线不含 bootstrap，生成独立归纳类型；后续双向 correspondence 和迁移检查见仓库 experiments/mechanical-correspondence-20261019/README.md。历史运行仍保留其原始映射记录。",
           "","","文件对应关系：",
           "- Corelib/.../Name.v：原 Rocq 文件副本。",
           "- Corelib/.../Name.lean：可执行的独立翻译入口，并打印该文件所有根声明、quality 分支及显式条件。",
           "- Corelib/.../Name.txt：Lean 实际打印的类型／正文；不把打印文本伪装成独立可编译包。",
           "- Corelib/.../Name.md：逐声明状态、规则、尝试顺序、条件、基线失败阶段与原因。",
           "- Corelib/.../Name.json：完整源 IR、目标类型／正文 AST、quality 分支、条件声明和验证证据路径。",
           "- declarations.csv：2180 项可筛选总表；summary.json：固定范围、分类、逐模块计数。",
           "","过程：MetaRocq 导出依赖闭包与证明条件 → 按声明分派并尝试宇宙解释/表示转换 → Lean 注册声明 → Rocq 源端 roundtrip、独立 Lean consumer 与独立结构审计。所有有根声明的模块均通过这三项检查；补充 campaign 完成。",
           "JSON 中的机制是实际使用记录；并非声称每一项机制都是该声明不可缺少的最小集合。基线失败保留原始报错；未凭错误文本编造缺失规则。",
           "每个 Lean 入口包含自己的依赖闭包。它们是逐文件研究产物，不是保证可同时 import 的统一 Lean 库；入口引用远程冻结运行中的绝对路径，须在保留仓库路径的工作站使用。",
           "",f"运行单个入口：python3 {O}/run_lean_entry.py Corelib/Init/Nat.lean。冻结工具链已安装，不需新装框架。",
           "","| 源模块 | 根声明数 | 结果 |","|---|---:|---|"]
for m in modules:readme.append(f"| {m['module']} | {m['roots']} | [逐项结果]({m['report']}) |")
(O/"README.md").write_text("\n".join(readme)+"\n")
print("PACKAGE_COMPLETE",str(O),flush=True)
