#!/usr/bin/env python3
"""Package the pinned mechanical Nat case study from existing evidence."""
from pathlib import Path
import argparse,csv,json,re,shutil
from collections import Counter
ap=argparse.ArgumentParser()
ap.add_argument('--repo',type=Path,default=None)
R=(ap.parse_args().repo or Path(__file__).resolve().parents[2]).resolve();W=R/'results/casestudy'
C=R/'results/corelib-complete';M=R/'experiments/mechanical-nat-eq-20261019';B=R/'experiments/mechanical-correspondence-20261019'
W.mkdir(parents=True,exist_ok=True);bt=chr(96);fence=bt*3
def write(p,t):
 p=W/p;p.parent.mkdir(parents=True,exist_ok=True);p.write_text(t)
def dump(p,x):write(p,json.dumps(x,ensure_ascii=False,indent=2)+'\n')
def table(rows,cols):
 return '| '+' | '.join(cols)+' |\n|'+'|'.join('---' for _ in cols)+'|\n'+''.join('| '+' | '.join(str(v).replace('|','&#124;').replace('\n','<br>') for v in row)+' |\n' for row in rows)
files=[]
def copy(src,dest,why):
 out=W/dest;out.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(src,out)
 files.append({'file':dest,'source':str(src.relative_to(R)),'bytes':out.stat().st_size,'explanation':why})
def csvout(p,rows,cols):
 p=W/p;p.parent.mkdir(parents=True,exist_ok=True)
 with p.open('w',newline='') as f:
  w=csv.DictWriter(f,fieldnames=cols,lineterminator='\n');w.writeheader();w.writerows({k:r.get(k,'') for k in cols} for r in rows)
mods=['Datatypes','Nat','Peano'];selected={}
for m in mods:
 d=json.loads((C/f'Corelib/Init/{m}.json').read_text())
 for k,v in d['roots'].items():
  if m!='Datatypes' or k.rsplit('.',1)[1] in ['nat','nat_ind','nat_rec','nat_rect','nat_sind']:selected[k]=(m,v)
assert len(selected)==99
ledger={r['source']:r for r in csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open())}
counts=Counter(x['result']['status'] for m,x in selected.values())
bridgecounts=Counter(ledger[k]['bridge_status'] for k in selected)
for m in mods:
 for ext,folder,why in [('v','source','完整 Rocq 源模块，保留其他定义和注释。'),('txt','lean','Lean 实际打印结果，非独立可编译源文件。'),('lean','lean','已验证导入及打印入口，引用远程冻结运行绝对路径。'),('json','records','完整源 IR、目标 AST、条件、分支和检查记录。')]:
  copy(C/f'Corelib/Init/{m}.{ext}',f'{folder}/{m}.{ext}',why)
copy(C/'SOURCE-NOTICES.txt','SOURCE-NOTICES.txt','源代码来源及许可说明。')
descriptions={
 'Export.v':'MetaRocq 导出驱动：导入模块并指定 roots。',
 'inventory.json':'本模块原始 root 清单。',
 'source.ndjson':'IR 头部、宇宙上下文、依赖顺序中的声明及证明条件；包含依赖闭包。',
 'translation_report.json':'目标状态、类型/正文 AST、报告字段、依赖与条件。',
 'translation_timing.json':'逐声明 tier 标签、耗时和结果；不是逐 AST 事件日志。',
 'contract.json':'导入/消费检查所用声明与约束契约。',
 'translation_manifest.json':'运行输入、报告和生成模块的关联信息。',
 'result.json':'模块导出、翻译与验证汇总。',
 'audit.json':'独立结构审计结果。',
 'consumer_result.json':'独立 Lean consumer 检查结果。',
 'lean/Rocq2LeanOut.lean':'从 IR/报告注册 Lean 内核声明的导入入口。',
 'lean/Consumer.lean':'独立 consumer 校验入口。',
 'source-roundtrip/RoundTrip.v':'由 IR 重建的 Rocq 声明，用于源端内核复查。',
 'source-roundtrip/RoundTripNative.v':'原生元数据的源端复查入口。',
 'source-roundtrip/RoundTripUniverses.v':'宇宙上下文的源端复查入口。',
 'source-roundtrip/RoundTripUniverses.tsv':'宇宙事实表。',
 'source-roundtrip/RoundTripUniverses.out':'宇宙复查输出。',
 'source-roundtrip/roundtrip.json':'源端 roundtrip 结果。'}
inventory=[]
for m in mods:
 run=M/f'runs/full-v1/Corelib/Init/{m}'
 for src in sorted(run.rglob('*')):
  if not src.is_file():continue
  rel=src.relative_to(run).as_posix();why=descriptions.get(rel)
  if src.suffix=='.log':why='阶段日志：'+rel+'；用于定位导出、翻译或验证问题。'
  keep=why is not None
  if not keep:why='编译缓存、锁或辅助产物，保留原运行路径，不重复提交。'
  dest=f'exports/{m}/{rel}' if keep else ''
  inventory.append({'module':m,'file':rel,'bytes':src.stat().st_size,'included':keep,'explanation':why,'original':str(src),'case_file':dest})
  if keep:copy(src,dest,why)
dump('EXPORT_FILES.json',inventory)
write('EXPORT_FILES.md','# 导出文件逐项说明\n\n列出三个冻结运行目录中的每个文件；未收录的编译缓存仍留在远程原目录。\n\n'+table([(r['module'],f"[{r['file']}]({r['case_file']})" if r['included'] else r['file'],'是' if r['included'] else '否',r['explanation']) for r in inventory],['模块','文件','已收录','解释']))
proofs=['NatEq','Nat','DependentNat','Peano','Boundaries','Interface_Init_Nat','Interface_Init_Datatypes','Interface_Init_Peano','Auto_Init_Datatypes','Auto_Init_Peano','UseNative']
for name in proofs:
 copy(B/(name+'.lean'),'correspondence/'+name+'.lean','既有证明原样副本；原依赖环境和审计输出路径不变。')
 for folder,ext in [('audits','json'),('logs','log')]:
  f=B/folder/(name+'.'+ext)
  if f.exists():copy(f,'correspondence/'+folder+'/'+f.name,'既有证明检查证据，并非本次新运行。')
for n in ['VERIFIED.json','final-validation.json']:copy(B/n,'correspondence/'+n,'整个 correspondence 实验验证摘要，范围大于本案例。')
profiles=json.loads((B/'profiles.json').read_text());frags=set()
for name in ['NatEq','Nat','DependentNat','Peano','Boundaries']:frags.update(profiles[name]['fragments'])
for name in sorted(frags):copy(B/'fragments'/(name+'.lean'),'correspondence/fragments/'+name+'.lean','证明片段，需组合公共定义后使用，非独立模块。')
audit_map={}
for audit in (W/'correspondence/audits').glob('*.json'):
 for entry in json.loads(audit.read_text()):
  audit_map[entry['name']]=entry
printed={}
for m in mods:
 text=(W/f'lean/{m}.txt').read_text();starts=list(re.finditer(r'^(?:def|theorem|opaque|inductive|axiom) ([^\s:]+)',text,re.M))
 for i,match in enumerate(starts):
  name=match[1].split('.{',1)[0];printed[name]=text[match.start():starts[i+1].start() if i+1<len(starts) else len(text)].rstrip()
rows=[]
for k,(m,x) in selected.items():
 t=x['target_report'];b=ledger[k];target=t['target'];text=printed.get(target);assert text is not None,(k,target)
 file='declarations/'+k
 certnames=set(re.findall(r'NativeBridge\.[A-Za-z0-9_.]+',' '.join(b[z] for z in ['bridge_certificates','interface_certificate','statement_certificate'])))
 certrecords=[audit_map[n] for n in sorted(certnames) if n in audit_map]
 dump(file+'.json',{'source_name':k,'mechanical_record':x,'correspondence':b,'available_certificate_types':certrecords})
 row={'source':k,'module':m,'target':target,'status':x['result']['status'],'pending_parameters':len(t.get('pending_hypotheses',[])),'bridge_status':b['bridge_status'],'certificates':b['bridge_certificates'],'interface_certificate':b['interface_certificate'],'statement_certificate':b['statement_certificate'],'page':file+'.md'};rows.append(row)
 write(file+'.md',f'# {k}\n\n[总索引](../DECLARATIONS.md) · [源模块](../source/{m}.v) · [完整记录]({k}.json)\n\n'+
  f"机械结果：{row['status']}；分派：{t['rule']}；待证参数：{row['pending_parameters']}。\n\n"+
  '## 源端信息\n\n源 IR 类型、正文/归纳块在同名 JSON 的 mechanical_record.source_ir；原始源码在完整 .v 中。\n\n'+
  '## Lean 实际打印结果\n\n'+fence+'lean\n'+text+'\n'+fence+'\n\n'+
  '## 翻译过程记录\n\n'+table(x.get('attempts',{}).get('tier_times',[]),['尝试标签','耗时 ms','结果'])+'\n'+
  '标签表示尝试配置；不是逐 AST 步骤日志。0 ms 是计时精度下的记录，不表示没有执行。\n\n'+
  '待证参数：'+json.dumps(t.get('pending_hypotheses',[]),ensure_ascii=False)+'。\n\n'+
  '完整 target_report 保留宇宙字段、目标 AST 与分支；prerequisite_declarations 保留条件声明。报告字段与开关不能直接换算为规则调用次数。源 roundtrip、consumer、audit 结果见 module_validation。\n\n'+
  '## 与原生 Lean 的对应\n\n'+f"覆盖类别：{b['bridge_status']}。\n\n类型/运算证书：{b['bridge_certificates'] or '未记录'}。\n\n接口往返证书：{b['interface_certificate'] or '未记录'}。\n\n陈述 iff 证书：{b['statement_certificate'] or '未记录'}。\n\n"+
  '陈述 iff 不证明命题本身；接口往返不自动证明等于 Lean 同名运算。\n\n'+
  (('原生陈述：\n\n'+fence+'lean\n'+b['native_statement']+'\n'+fence+'\n\n') if b['native_statement'] else '')+
  (('尚存源符号：'+b['remaining_source_symbols']+'。\n\n') if b['remaining_source_symbols'] else '')+
  '## 已收录证书的实际类型\n\n'+
  ''.join(c['name']+'\n\n'+fence+'lean\n'+c['type']+'\n'+fence+'\n\n公理依赖：'+str(c.get('axioms',[]))+'。\n\n' for c in certrecords)+
  ('证书类型以复制的 audit 为准；其他证书见原实验。\n\n' if not certrecords else '')+
  '[对应证明说明](../CORRESPONDENCE.md)\n')
csvout('DECLARATIONS.csv',rows,list(rows[0]))
write('DECLARATIONS.md','# Nat 逐声明前后对照\n\n99 个专题根：Datatypes 中 nat 及四个消去声明（5）、Init.Nat（58）、Init.Peano（36）。O/S 属于 nat 归纳块，不额外计根。Datatypes 完整副本中的其他类型不计入本专题分母。\n\n'+table([(f"[{r['source']}]({r['page']})",r['status'],r['pending_parameters'],r['bridge_status']) for r in rows],['声明（点击查看译文及过程）','机械状态','条件数','对应状态']))
csvout('correspondence/DECLARATIONS.csv',[ledger[k] for k in selected],list(next(iter(ledger.values()))))
ev=json.loads((C/'rule-usage-evidence.json').read_text());cross=[]
for x in ev:
 hits=set()
 for t in [x['primary']]+x['variants']:
  for name in t['consts']:
   if name=='Rocq.Corelib.Init.Datatypes.nat' or name.startswith(('Rocq.Corelib.Init.Datatypes.nat.','Rocq.Corelib.Init.Nat.','RocqPending.Corelib.Init.Nat.')):hits.add(name)
 if hits:cross.append({'source':x['name'],'module':x['module'],'references':';'.join(sorted(hits)),'report':'../corelib-complete/'+x['module'].replace('.','/')+'.md'})
csvout('CORELIB_NAT_REFERENCES.csv',cross,['source','module','references','report'])
dump('summary.json',{'baseline':'mechanical-nat-eq-20261019/full-v1','corelib_roots':2180,'case_roots':99,'modules':{'Datatypes_nat_subset':5,'Nat':58,'Peano':36},'mechanical_status':dict(counts),'correspondence_status':dict(bridgecounts),'direct_nat_reference_roots':len(cross),'reference_scope':'Final target AST explicitly references generated nat/constructors/eliminators or Init.Nat operations; primary and quality branches deduplicated. Not transitive closure.','pending_roots':[r['source'] for r in rows if r['pending_parameters']]})
write('.gitignore','.work/\n__pycache__/\n')
dump('FILES.json',files)
write('FILES.md','# 文件阅读指南\n\n所有复制文件及其仓库来源见 [FILES.json](FILES.json)。原运行的每一个文件另见 [EXPORT_FILES.md](EXPORT_FILES.md)。\n\n'+table([
 ('README.md','入口、范围、阅读顺序和限制。'),('SCOPE.md','709/839/2180的准确来源。'),('lean/KernelExample.lean','机械构造器与加法归约示例，使用已有输出环境。'),('TRANSLATION_FLOW.md','nat 与 add 的逐阶段解释，区分实际记录和解释。'),
 ('DECLARATIONS.md / .csv','99 个专题根的可浏览/筛选索引。'),('declarations/<源名>.md / .json','每项译文、源 IR、目标 AST、尝试、条件及对应证书。'),
 ('source/*.v','三个完整 Rocq 源模块，含原注释和非专题内容。'),('lean/*.txt','Lean 实际打印结果，不是独立模块。'),('lean/*.lean','导入/打印入口，引用远程冻结路径。'),
 ('records/*.json','三个完整模块的逐项记录。'),('exports/<模块>/','关键导出/翻译/验证文件；含依赖闭包。'),
 ('correspondence/*.lean','完整证明 profile，依赖生成环境。'),('correspondence/fragments/','构造器、递归、算术/比较/位运算等证明片段。'),
 ('correspondence/audits/ 与 logs/','既有证书类型、公理依赖和检查日志。'),('correspondence/DECLARATIONS.csv','99项的对应覆盖与缺口。'),
 ('CORRESPONDENCE.md','类型、构造器、运算和消去器的对应解释。'),('CORELIB_NAT_REFERENCES.csv','整个2180根范围中目标 AST 直接引用机械 Nat/运算的索引，非传递闭包。'),
 ('summary.json','范围、状态和待证根。'),('verify.py / VALIDATION.json','文件复核及主要证明重验脚本/结果。'),('build.py','从现有结果确定性重建，不重新翻译。'),('.work/','仅留远程的验证缓存/日志，已 gitignore。')
],['路径','用途']))
if Path(__file__).resolve()!=W/'build.py':shutil.copyfile(__file__,W/'build.py')
print(json.dumps({'case_roots':len(rows),'statuses':dict(counts),'correspondence':dict(bridgecounts),'copied_files':len(files),'direct_nat_reference_roots':len(cross)},ensure_ascii=False))
