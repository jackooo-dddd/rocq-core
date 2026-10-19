#!/usr/bin/env python3
"""Read successful-path M events; rejected paths are rolled back with Lean's environment."""
from pathlib import Path
import collections,json
R=Path(__file__).resolve().parents[2]
W=Path(__file__).resolve().parent
RUN=R/'.work/used-rule-coverage-20261019/full'
BASE=R/'.work/used-rules-20261019/full'
def save(p,v):p.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n')
summary=json.loads((RUN/'summary.json').read_text())
assert summary['success'] and summary['distinct_requested']==2180 and summary['blocked_roots']==0,summary
rootmap=json.loads((RUN/'all-roots.json').read_text())
roots=set(rootmap)
events=collections.Counter();names=collections.defaultdict(set);mods=collections.defaultdict(set)
records=[];changes=[]
keys=['status','target_kind','target_type','target_value','target_ctors','level_params','pending_hypotheses','quality_prop']
for p in sorted(RUN.rglob('result.json')):
 rec=json.loads(p.read_text());assert rec['checked'],p
 if not rec['requested_names']:continue
 d=p.parent;rel=d.relative_to(RUN)
 report=json.loads((d/'translation_report.json').read_text())
 old=json.loads((BASE/rel/'translation_report.json').read_text())
 orig={x['source']:x for x in old['results']}
 for row in report['results']:
  diffs=[k for k in keys if row.get(k)!=orig[row['source']].get(k)]
  if diffs:changes.append([rec['module'],row['source'],diffs])
 hits=json.loads((d/'rule_hits.json').read_text())
 for rule,source in hits:
  assert rule in {f'M{i:02d}' for i in range(1,14)},rule
  source=source.removesuffix('.statement').removesuffix('.type').replace('/', '.')
  events[rule]+=1;names[rule].add(source);mods[rule].add(rec['module'])
 records.append({'module':rec['module'],'roots':len(rec['requested_names']),'validation':rec['validation'],'events':len(hits)})
assert not changes,changes[:10]
rules=[]
cat=json.loads((R/'experiments/mechanical-nat-eq-20261019/results/ALL_RULES.json').read_text())
items={x['id']:x for g in cat['groups'] for x in g['entries']}
for k in [f'M{i:02d}' for i in range(1,14)]:
 rules.append({'id':k,'name':items[k]['name'],'description':items[k]['description'],
  'surviving_events_including_repeated_dependencies':events[k],
  'distinct_declarations':sorted(names[k]),'distinct_declaration_count':len(names[k]),
  'direct_roots':sorted(names[k]&roots),'direct_root_count':len(names[k]&roots),
  'modules':sorted(mods[k]),'used':bool(events[k])})
save(W/'M_RULE_USAGE.json',{'scope':summary,'rule_count_used':sum(x['used'] for x in rules),'rules':rules,
 'target_changes':changes,'modules':records,
 'counting':'Successful transformation events surviving the translator environment rollback; repeated dependency appearances count as events, declarations and direct roots are separately deduplicated. Not a transitive impact count.'})
print('M_RULE_USAGE',[(x['id'],x['distinct_declaration_count'],x['direct_root_count']) for x in rules],flush=True)
