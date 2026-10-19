#!/usr/bin/env python3
"""An itemized sufficient Corelib rule set; never equate missing usage evidence with non-use."""
import argparse,collections,hashlib,json,re
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BASE=ROOT/'experiments/mechanical-nat-eq-20261019'
T=BASE/'translator';OUT=ROOT/'results/used-rules-validation'
CAT=BASE/'results/ALL_RULES.json'
SUCCESS={'TRANSLATED_AND_CHECKED','PENDING_KERNEL_CHECKED','STATEMENT_KERNEL_CHECKED','STATEMENT_PENDING_KERNEL_CHECKED'}
OFF={'T06':'bootstrapRules 为空；nat/eq 走普通归纳类型生成。',
     'E14':'本次调用 translate，不调用 assemble；不填充外部证明。',
     'V02':'没有 bootstrap 注册项，因此不应用 bootstrap 签名适配。'}
CONFIRMED=set('E03 E04 E08 E09 E12 T01 T02 T03 T07 T10 U02 U03 U04 U06 U07 U09 U10 U11 U13 U15 U17 U19 U29 U30 U31 U32 C06 L01 L02 L03 Q02 Q03 Q05'.split())
# A semantic row can span a few functions. No group is replaced with an unlisted "fixed core".
E='Rocq2Lean/Emit.lean';X='Rocq2Lean/Translate.lean';O='rocq/exporter/src/r2l_export.ml'
Q='Rocq2Lean/Quality.lean';QS='Rocq2Lean/QualitySource.lean';K='Rocq2Lean/Kernel.lean'
LOC={
'E01':[(O,'let export_in')], 'E02':[(O,'let rec is_proof_type'),(O,'let proof_valued')],
'E03':[(O,'let statement_env '),(E,'partial def processConstantCore')],
'E04':[(O,'let extract_proofs')], 'E05':[(O,'let extract_proofs')], 'E06':[(O,'let statement_env ')],
'E07':[(O,'let extract_proofs')], 'E08':[(E,'def mkConstDecl')], 'E09':[(E,'def mkConstDecl')],
'E10':[(E,'let isStmt := c0.bodyState')], 'E11':[(O,'let sealed_impl')], 'E12':[(E,'def collapseHyps'),(X,'def applyHyps')],
'E13':[(O,'let statement_env ')], 'E14':[(E,'def asmAfter')],
'T01':[(X,'partial def trans (')], 'T02':[(X,'partial def trans (')], 'T03':[(X,'partial def transHead')],
'T04':[(X,'partial def trans (')], 'T05':[(X,'def transSort')], 'T06':[('Rocq2Lean/Bootstrap.lean','def bootstrapRules')],
'T07':[(E,'def processInductiveCore')], 'T08':[(E,'def processInductiveCore')], 'T09':[(E,'def processInductiveCore')],
'T10':[(X,'def nonRecursiveBlock'),(E,'def processInductiveCore')], 'T11':[(X,'def recursorOf'),(E,'def processInductiveCore')],
'M01':[(X,'partial def transCase (')], 'M02':[(X,'partial def transCaseNU')], 'M03':[(X,'partial def transFix1')],
'M04':[(X,'partial def changedParams')], 'M05':[(X,'def recResultOf'),(X,'partial def transFix1')],
'M06':[(X,'partial def transFix1')], 'M07':[(X,'partial def transFixMutual')], 'M08':[(X,'partial def inlineRecArgs'),(X,'partial def IR.Term.zetaFixLets')],
'M09':[(X,'def mkCovBelow'),(X,'partial def transCaseCov')], 'M10':[(X,'partial def transFixAcc')],
'M11':[(X,'partial def transFixWf')], 'M12':[(X,'partial def structuralIndexPaths')], 'M13':[(X,'partial def castRepair')],
'U01':[(O,'let universe_facts_json')], 'U02':[(X,'def transSort')], 'U03':[(E,'partial def processConstantCore'),(E,'def processInductiveCore')],
'U04':[(X,'def solveLevels')], 'U05':[(X,'def minimalModelLevel'),(X,'def checkBodyLevel')],
'U06':[(X,'def checkInstantiation')], 'U07':[(E,'def justifyResiduals')], 'U08':[(X,'def levelsOf')],
'U09':[(E,'def templateBinding'),(X,'def univArgs')], 'U10':[(E,'partial def processConstantCore')],
'U11':[(E,'def processInductiveCore')], 'U12':[(X,'def factReduceUniverse')], 'U13':[(X,'partial def ownLevelInterp')],
'U14':[(X,'def polyContextEntails')], 'U15':[(E,'def depGlobalLevels'),(E,'partial def processConstantCore')],
'U16':[(E,'def rsMinimalFor'),(E,'def processInductiveCore')], 'U17':[(X,'partial def motiveLevels')],
'U18':[('Rocq2Lean/Split.lean','def decoupledPairs')], 'U19':[(E,'let split := genv.carrierSplit')],
'U20':[(E,'the remaining copies are renumbered')], 'U21':[(E,'translateSplit (genv0')],
'U22':[(X,'def sharedOrFreshLevels'),(X,'def rebindShared')], 'U23':[(X,'def hypFor')],
'U24':[(X,'def sharedOrFreshLevels'),(E,'def processConstant (')], 'U25':[(E,'let sortInterp := plain && unify')],
'U26':[(E,'def identifyJointMVars')], 'U27':[(X,'def hypFor'),(E,'def processConstant (')],
'U28':[(E,'def processConstant (')], 'U29':[(E,'r2bpLevels :=')], 'U30':[(X,'partial def onlyInResultSort')],
'U31':[(E,'inheritSort')], 'U32':[(X,'def polyUniverseInterpretation')], 'U33':[(X,'def polyUniverseInterpretation')],
'U34':[(E,'let polyLvls := match polyInterp')], 'U35':[(X,'def solvePostponedLevels'),(X,'def closeUniverseDefaults')],
'U36':[(X,'partial def erasePhantomSorts')],
'C01':[(X,'partial def aliasPrefixView')], 'C02':[(X,'def erasingPolyBody?')], 'C03':[(X,'partial def binderOnlyCombinator')],
'C04':[(E,'for _ in [:2 * src.decls.size]')], 'C05':[(X,'partial def instantiateSourceUniverses')],
'C06':[(X,'partial def computeSourceTypes')], 'C07':[(E,'partial def processConstantCore')],
'L01':[(E,'partial def processConstantCore'),(X,'def liftCoerce')], 'L02':[(X,'def liftCoerce'),(X,'def coerceArgs')],
'L03':[(X,'partial def liftCoerceValue')], 'L04':[(X,'partial def liftCoerceValue')], 'L05':[(X,'def transportTypePosition')],
'L06':[(X,'def applyTypeCoercions')], 'L07':[(X,'partial def liftCoerceValue')], 'L08':[(X,'partial def liftCoerceValue')],
'L09':[(X,'def tryLiftConversion')], 'L10':[(E,'partial def liftChain')],
'Q01':[(O,'and template_info_json'),(O,'let native_quality_family_data')],
'Q02':[(E,'let templateSort :=')], 'Q03':[(Q,'def qualityFamilyPlan'),(E,'def processQualityFamily')],
'Q04':[(QS,'qualityDispatch')], 'Q05':[(O,'let native_quality_family_data'),('tools/quality_families.py','def ')],
'Q06':[(O,'let check_statement_prepared'),('tools/quality_families.py','def check_native')],
'Q07':[(O,'let quality_dispatch_env')],
'N01':[(X,'def int63OpTarget?')], 'N02':[(X,'def arrayOpTarget?')], 'N03':[(X,'def stringOpTarget?')],
'N04':[(X,'def floatOpTarget?')], 'N05':[(X,'def structuredIntOpTarget?'),(X,'def floatCtorOpTarget?')],
'N06':[(X,'partial def trans (')],
'V01':[('tools/roundtrip.py','def main')], 'V02':[('Rocq2Lean/Bootstrap.lean','def verifyBootstrap')],
'V03':[(K,'def addChecked'),(K,'def checkOnly')], 'V04':[(E,'partial def freeLevelPin'),(E,'def binderIndependence')],
'V05':[(X,'def checkUniverseObligations'),(X,'def checkBodyLevel')], 'V06':[(E,'private def blockedDeps')],
'V07':[('Rocq2Lean/Verify.lean','elab')], 'V08':[('tools/audit.py','def main')],
'V09':[('Rocq2Lean/Command.lean','rootContractProblem'),(E,'def budgeted')],
'S01':[(E,'def translateSource')], 'S02':[(E,'translateDecl (genv0')], 'S03':[(E,'P2-def:')],
'S04':[(E,'let ladder (i : IR.InductiveDecl)')], 'S05':[(E,'def budgeted'),(E,'def processConstant (')]
}
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def write_json(p,v):p.parent.mkdir(parents=True,exist_ok=True);p.write_text(json.dumps(v,indent=2,ensure_ascii=False)+'\n')
def locations(key):
 result=[]
 for filename,anchor in LOC[key]:
  p=T/filename;lines=p.read_text().splitlines()
  hits=[i+1 for i,line in enumerate(lines) if anchor in line]
  assert hits,(key,filename,anchor)
  result.append({'file':filename,'line':hits[0],'anchor':anchor})
 return result
def rows():
 catalog=json.loads(CAT.read_text());out=[]
 for group in catalog['groups']:
  for entry in group['entries']:
   key=entry['id'];usage=entry['usage'];enabled=key not in OFF
   kind='verification' if key.startswith('V') else 'scheduling' if key.startswith('S') else 'translation'
   known=key in CONFIRMED
   if not enabled:ev=OFF[key]
   elif known:ev=f"已确认产物／导出证据：{usage['primary_roots']} / {usage['family_roots']} 个根。{usage.get('basis','')}"
   elif usage['precision']=='未单独记录':ev='子机制未独立记录；本集合保留，不将其冒充已命中或未使用。'
   elif usage.get('primary_roots')==0 and usage.get('family_roots')==0:ev='既有统计口径为 0；保留实现，不将该 0 外推为所有依赖或重试中的零调用。'
   else:ev=f"{usage['precision']}：{usage.get('primary_roots')} / {usage.get('family_roots')} 个根；此证据不等于独立调用记录。"
   out.append({'id':key,'name':entry['name'],'description':entry['description'],'kind':kind,'enabled':enabled,
    'enabled_meaning':'included in this sufficient set; not a necessity claim' if enabled else OFF[key],
    'evidence':ev,'confirmed_output_evidence':known,'historical_usage':usage,'locations':locations(key)})
 assert len(out)==118 and len({x['id'] for x in out})==118
 assert set(LOC)=={x['id'] for x in out}
 return out,catalog
def manifest():
 # Semantics and validators are frozen; build artifacts and old run reports are not source rules.
 files={}
 for pattern in ['Rocq2Lean.lean','Rocq2Lean/*.lean','tools/*.py','tools/*.json','rocq/exporter/src/*.ml','rocq/exporter/src/*.mli','rocq/exporter/theories/*.v','rocq/roundtrip/*.v','lakefile.lean','lean-toolchain']:
  for p in T.glob(pattern):
   if p.is_file():files[str(p.relative_to(T))]=sha(p)
 for p in (T/'reports/prosa_inventory').glob('*'):
  if p.is_file():files[str(p.relative_to(T))]=sha(p)
 return dict(sorted(files.items()))
def build():
 rs,cat=rows();config={'schema':'rocq2lean-itemized-rules/1','scope_roots':2180,'scope_modules':67,
  'translator':str(T.relative_to(ROOT)),'mode':'statement','native_nat_eq_bootstrap':False,'external_proof_assembly':False,
  'enabled_translation_rules':[r['id'] for r in rs if r['enabled'] and r['kind']=='translation'],
  'enabled_checks':[r['id'] for r in rs if r['enabled'] and r['kind']=='verification'],
  'enabled_scheduling':[r['id'] for r in rs if r['enabled'] and r['kind']=='scheduling'],
  'not_enabled':[r['id'] for r in rs if not r['enabled']],
  'meaning':'Conservative sufficient set at the existing ALL_RULES row granularity; not a used-only or minimum set.',
  'source_implementation':manifest()}
 usage=json.loads((BASE/'results/RULE_USAGE.json').read_text())
 prim=usage['primitives'];assert len([p for p in prim if p['mapped_names']])==61
 config['primitive_operations']=[{k:p[k] for k in ['source','target','mapped_names']} for p in prim if p['mapped_names']]
 types={'Corelib.Array.PrimArray.array':'Rocq2Lean.PrimArray.Rep','Corelib.Floats.PrimFloat.float':'Rocq2Lean.PrimFloat.Rep',
 'Corelib.Numbers.Cyclic.Int63.PrimInt63.int':'BitVec','Corelib.Strings.PrimString.string':'Rocq2Lean.PrimString.Rep'}
 config['primitive_types']=types
 # Full usage name lists stay in the existing baseline evidence, not duplicated here.
 compact=[{k:v for k,v in row.items() if k!='historical_usage'} for row in rs]
 return rs,cat,config,compact
def render(rs,cat,cfg):
 proof=OUT/'VALIDATION.json'
 validation=json.loads(proof.read_text()) if proof.exists() else None
 def esc(s):return str(s).replace('|','&#124;').replace('\n',' ')
 lines=['# Corelib 翻译逐条规则清单','',
 '本清单按原 ALL_RULES 的逐项粒度展开，不再使用“固定核心＋可选机制”的分组。范围为当前 67 个模块、2180 个原始根。','',
 f"**翻译／源准备条目共 104 项：本集合启用 {len(cfg['enabled_translation_rules'])} 项、不启用 2 项；另外逐条列出 9 项检查（8 项启用）和 5 项调度。**",
 '4 个原语类型和 61 个原语操作也分别列出；它们是 N 组规则的具体映射，不与规则条目重复相加。','',
 '**“启用”表示纳入这套充分集合，满足适用条件时可以使用；不表示每项都在本次产生了译文，也不表示每项都不可删除。**',
 '已确认命中、仅有范围／元数据证据、尚未独立记录分别说明。没有独立记录的规则明确保留，不把它们写成“没用到”。',
 '证据数字沿用机械基线逐根统计，本次重跑已核对目标声明不变；它们不是新增的逐规则执行计数。表中 a / b 分别表示主产物覆盖的去重根数／纳入 quality family 辅助产物后的去重根数，不是成功率。',
 '原先 34 项只是有产物证据的清单；现在补全源准备、match、递归、转换子机制和求解路径，使整套实现的规则不再隐含在“核心”里。','']
 if validation:
  assert validation['status']=='PASS' and validation['configuration_sha256']==sha(OUT/'RULES.json')
  lines+=['**完整验证已通过：重新导出并翻译 2180 / 2180 项，0 受阻；51 个含声明模块的源端 roundtrip、Lean consumer、结构 audit 全部通过。**',
   '普通定理仍翻译陈述；331 个根仍带明确待证参数。这不是原定理证明全部移植或已建立 correspondence。','']
 else:lines+=['完整验证正在进行；以 [验证结果](used-rules-validation/VALIDATION.json) 为准。','']
 lines+=['| 类别 | 纳入集合 | 不启用 |','|---|---:|---:|','| 翻译／源准备规则 | 102 | 2 |','| 接受条件与独立检查 | 8 | 1 |','| 调度与回滚 | 5 | 0 |','']
 for group in cat['groups']:
  lines+=['**'+group['id']+'：'+group['title']+'**','',
    '| 编号 | 规则 | 本集合是否启用 | 作用 | 使用证据／保留理由 | 实现位置 |','|---|---|---|---|---|---|']
  for r in rs:
   if not r['id'].startswith(group['id']):continue
   links='；'.join(f"[{Path(x['file']).name}:{x['line']}](../{T.relative_to(ROOT)}/{x['file']}#L{x['line']})" for x in r['locations'])
   lines.append('| '+' | '.join([r['id'],esc(r['name']),'是' if r['enabled'] else '否',esc(r['description']),esc(r['evidence']),links])+' |')
  lines.append('')
 lines+=['**原语类型映射（逐项）**','','| 源声明 | 目标表示 | 本集合启用 |','|---|---|---|']
 for name,target in cfg['primitive_types'].items():lines.append(f'| {name} | {target} | 是 |')
 lines+=['','**原语操作映射（逐项）**','','| 原语 | 目标操作 | 源声明 | 本集合启用 |','|---|---|---|---|']
 for p in cfg['primitive_operations']:lines.append('| '+' | '.join(map(esc,[p['source'],p['target'],'；'.join(p['mapped_names']),'是']))+' |')
 lines+=['','**充分性验证与运行**','',
 '- [规则配置](used-rules-validation/RULES.json)：逐项启用 ID、原语表和已验证实现；没有未列出的“固定核心”选项。',
 '- [逐项机器可读清单](used-rules-validation/ITEMS.json)：每行的作用、证据状态及实现位置。',
 '- [完整验证](used-rules-validation/VALIDATION.json)与[逐模块结果](used-rules-validation/modules.json)：本次重新导出、翻译和三个独立检查的结果。',
 '- [既有逐项使用统计](../experiments/mechanical-nat-eq-20261019/results/RULE_USAGE.json)：使用证据的原始名单；未知调用数仍为未知。',
 '',
 '这是一套经验证的保守充分集合，尚不声称“只有实际命中的规则”或“最小规则集合”。',
 '验证绑定完整逐项配置及实现，当前提供整套已验证配置；修改或删减配置后，不能沿用本次 PASS，需要重新验证。',
 '',
 '仓库根运行：','','    python3 scripts/used_translation_rules.py --check',
 '    python3 scripts/translate_corelib_rules.py --input /path/source.ndjson --out /path/output','',
 '运行入口核对规则配置及实现后调用原翻译器；独立 consumer 和 audit 仍属于完整验收。源 IR、contract 和公开接口保护策略与原流程相同。',
 '编译文件、完整导出及运行日志保留远程 .work/used-rules-20261019/；Git/Mac 保存本表、配置、验证摘要和脚本。','']
 return '\n'.join(lines)
def main():
 p=argparse.ArgumentParser();p.add_argument('--check',action='store_true');p.add_argument('--initialize',action='store_true');a=p.parse_args()
 rs,cat,cfg,compact=build()
 if a.initialize:
  assert not (OUT/'RULES.json').exists(),'configuration already frozen'
  write_json(OUT/'RULES.json',cfg);write_json(OUT/'ITEMS.json',compact)
 else:
  assert json.loads((OUT/'RULES.json').read_text())==cfg,'configured rules or implementation changed'
  assert json.loads((OUT/'ITEMS.json').read_text())==compact,'itemized rule descriptions/locations changed'
 text=render(rs,cat,cfg);target=ROOT/'results/USED_RULES.md'
 if a.check:assert target.read_text()==text,'USED_RULES.md is stale'
 else:target.write_text(text)
 print('Itemized rules:',len(rs),'enabled translation rules:',len(cfg['enabled_translation_rules']),'checks:',len(cfg['enabled_checks']),'scheduling:',len(cfg['enabled_scheduling']))
if __name__=='__main__':main()
