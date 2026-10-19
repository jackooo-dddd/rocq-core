from pathlib import Path
import csv,json,collections,sys,graphlib
sys.setrecursionlimit(20000)
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019/reports/CORELIB_LEDGER.csv'
rows=list(csv.DictReader(B.open()));roots={r['source']:r for r in rows}
deps={};kinds={}
for mod in sorted({r['module'] for r in rows}):
 p=R/'experiments/mechanical-nat-eq-20261019/runs/full-v1'/Path(*mod.split('.'))/'source.ndjson'
 for line in p.open():
  d=json.loads(line);n=d.get('name','').replace('/','.')
  if n in roots and roots[n]['module']==mod and d.get('kind') in ('constant','inductive'):
   deps[n]={k:sorted(set(x.replace('/','.') for x in v)) for k,v in d.get('deps',{}).items()}
   kinds[n]=d['kind']
assert set(deps)==set(roots),(len(deps),set(roots)-set(deps))
adj={n:sorted({d for xs in dd.values() for d in xs if d in roots}) for n,dd in deps.items()}
idx={};low={};stack=[];on=set();components=[]
def visit(v):
 idx[v]=low[v]=len(idx);stack.append(v);on.add(v)
 for w in adj[v]:
  if w not in idx:visit(w);low[v]=min(low[v],low[w])
  elif w in on:low[v]=min(low[v],idx[w])
 if low[v]==idx[v]:
  c=[]
  while True:
   w=stack.pop();on.remove(w);c.append(w)
   if w==v:break
  components.append(sorted(c))
for n in sorted(roots):
 if n not in idx:visit(n)
owner={n:i for i,c in enumerate(components) for n in c}
edges=sorted({(owner[d],owner[n]) for n in adj for d in adj[n] if owner[d]!=owner[n]})
pred={i:set() for i in range(len(components))}
for a,b in edges:pred[b].add(a)
order=list(graphlib.TopologicalSorter(pred).static_order())
users=collections.defaultdict(set)
for n,ds in adj.items():
 for d in ds:users[d].add(n)
taskrows=[]
for n,r in roots.items():
 taskrows.append({'source':n,'module':r['module'],'baseline_status':r['bridge_status'],'current_status':r['bridge_status'],'progress':'baseline_only','source_dependencies':';'.join(adj[n]),'external_dependencies':';'.join(sorted({d for ds in deps[n].values() for d in ds if d not in roots})),'direct_users':len(users[n]),'source_scc':owner[n]})
def csvwrite(p,rs):
 with p.open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=list(rs[0]));w.writeheader();w.writerows(rs)
csvwrite(W/'tasks.csv',taskrows)
edge_rows=[{'dependency':d,'user':n,'edge_kind':k,'dependency_is_root':d in roots} for n,dd in deps.items() for k,ds in dd.items() for d in ds]
csvwrite(W/'source-dependencies.csv',edge_rows)
out={'source':'full-v1 source.ndjson deps (type/body/etc), module-own root record','edge_direction':'dependency -> user','root_count':len(roots),'source_edges':len(edge_rows),'scc_count':len(components),'recursive_components':[c for c in components if len(c)>1 or c[0] in adj[c[0]]],'components':components,'dag_edges':edges,'topological_order':order,'top_direct_users':sorted(((n,len(u)) for n,u in users.items()),key=lambda x:(-x[1],x[0]))[:30],'not_a_correspondence_prerequisite_proof':True}
(W/'dependency-graph.json').write_text(json.dumps(out,ensure_ascii=False,indent=2))
p=W/'DAG.md';text=p.read_text().split('<!-- generated -->')[0]
text+='<!-- generated -->\n\n## 实际源依赖检查\n\n'
text+=f'覆盖 {len(roots)} 根；{len(edge_rows)} 条带类别的依赖记录；收缩后 {len(components)} 个 SCC、{len(edges)} 条 DAG 边。已通过拓扑排序检查。\n'
text+='\n依赖源为 IR 的 deps 字段。递归分量和外部辅助依赖均保留；不能由这些边直接推断对应证明一定依赖哪些 Iso。\n\n| 被依赖根 | 直接使用者数 |\n|---|---:|\n'
for n,count in out['top_direct_users'][:15]:text+=f'| {n} | {count} |\n'
p.write_text(text)
print(json.dumps({k:v for k,v in out.items() if k in ['root_count','source_edges','scc_count','recursive_components']}))
