#!/usr/bin/env python3
import pathlib,json,sys,collections
run=pathlib.Path(sys.argv[1]).resolve();out=pathlib.Path(sys.argv[2]).resolve()
GOOD={'TRANSLATED_AND_CHECKED','STATEMENT_KERNEL_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED','BOOTSTRAP_RESOLVED'}
roots={};decls={};allrows={}
for p in sorted(run.rglob('result.json')):
 d=json.loads(p.read_text())
 if 'root_results' not in d:continue
 for name,row in d['root_results'].items():roots[name]=dict(row,module=d['module'],module_checked=d['checked'])
 src=p.parent/'source.ndjson'
 if src.exists():
  for row in map(json.loads,src.read_text().splitlines()):
   if row.get('kind') in ('constant','inductive'):decls[row['name']]=row
 rp=p.parent/'translation_report.json'
 if rp.exists():
  for row in json.loads(rp.read_text())['results']:allrows.setdefault(row['source'],row)
def refs(t):
 if isinstance(t,list):return set().union(*(refs(v) for v in t)) if t else set()
 if not isinstance(t,dict):return set()
 ans=set()
 if t.get('k')=='const':ans.add(t['c'])
 if t.get('k') in ('ind','construct','proj'):ans.add(t['ind']['mind'])
 for v in t.values():
  if isinstance(v,(dict,list)):ans|=refs(v)
 return ans
# Requested nested-module names use dots; exporter kernel names use slashes.
# Normalize both ends consistently so dependency reach does not omit nested roots.
canonical=lambda n:n.replace('/','.')
assert len({canonical(n) for n in decls})==len(decls), 'canonical declaration-name collision'
graph={canonical(name):{canonical(n) for n in refs(d)}-{canonical(name)} for name,d in decls.items()}
blocked={n:r for n,r in roots.items() if r['status'] not in GOOD}
frontier={n:r for n,r in blocked.items() if r['status']!='BLOCKED_DEPENDENCY'}
hits=collections.defaultdict(set)
for n in blocked:
 seen=set();stack=[n]
 while stack:
  x=stack.pop()
  if x in seen:continue
  seen.add(x)
  if x in frontier:hits[x].add(n)
  stack.extend(graph.get(x,set())-seen)
rows=[]
for n,r in frontier.items():
 rows.append(dict(source=n,module=r['module'],status=r['status'],message=r.get('message',''),blocked_roots_reaching_it=len(hits[n]),affected_roots=sorted(hits[n])))
rows.sort(key=lambda r:(-r['blocked_roots_reaching_it'],r['source']))
data={'run':str(run),'total':len(roots),'blocked':len(blocked),'direct_frontier_count':len(frontier),'status_counts':dict(collections.Counter(r['status'] for r in blocked.values())),'frontiers':rows}
out.parent.mkdir(parents=True,exist_ok=True);out.write_text(json.dumps(data,indent=2)+'\n')
print(json.dumps({k:v for k,v in data.items() if k!='frontiers'},indent=2))
for r in rows[:25]:print(r['blocked_roots_reaching_it'],r['source'],r['status'],r['message'][:180])
