from pathlib import Path
import csv,json
W=Path(__file__).resolve().parent;R=W.parents[1]
B=R/'experiments/mechanical-correspondence-20261019'
rows=list(csv.DictReader((B/'reports/CORELIB_LEDGER.csv').open()))
selected=[r for r in rows if r['module']=='Corelib.Classes.Morphisms' and r['bridge_status']=='STATEMENT_PARTIAL']
names=['NativeBridge.eq_correspondence']
names += ['NativeBridge.Incremental.RC.'+n for n in ['sourceFalse','sourceAnd','sourceOr','sourceIff','reflexive_native','symmetric_native','transitive_native','complement_native','irreflexive_native','asymmetric_native','subrelation_native','conjunction_native','disjunction_native','relation_equivalence_native','equivalence_native','preorder_native','per_native','strictOrder_native','rewriteRelation_native','eq_relation_native','iff_relation_native','complement_function_native','subrelation_function_native','relation_equivalence_function_native','conjunction_function_native','disjunction_function_native','flip_function_native']]
names += ['NativeBridge.Incremental.Morphisms.'+n for n in ['proper_native','properProxy_native','reflexiveProxy_native','respectful_native','respectful_hetero_native','pointwise_relation_native','forall_relation_native','normalizes_native','params_native','PartialApplication_native','apply_subrelation_native','normalization_done_native','compose_function_native','impl_function_native','pointwise_function_native','source_unit_forall_native']]
names += ['Rocq.Corelib.Classes.Morphisms.'+n for n in ['Proper','ProperProxy','ReflexiveProxy','respectful','respectful_hetero','pointwise_relation','forall_relation','forall_def','Normalizes']]
names += ['Rocq.Corelib.Relations.Relation_Definitions.relation','Rocq.Corelib.Program.Basics.flip','Rocq.Corelib.Program.Basics.impl','Rocq.Corelib.Init.Logic.not','Rocq.Corelib.Classes.RelationClasses.Antisymmetric','Rocq.Corelib.Classes.RelationClasses.PartialOrder']
s=(W/'statement-command.lean.inc').read_text().replace('RULE_NAMES',json.dumps(names)).replace('NativeBridge.RBool','Rocq.Corelib.Relations.Relation_Definitions.relation')
# Unfold only these native logical abbreviations to expose arguments to registered rules.
s=s.replace('if rule.startsWith "Rocq." then','if rule.startsWith "Rocq." || rule.endsWith "NativePreorder" || rule.endsWith "NativePER" || rule.endsWith "NativeStrictOrder" then')
names += ['NativeBridge.Incremental.RC.NativePreorder','NativeBridge.Incremental.RC.NativePER','NativeBridge.Incremental.RC.NativeStrictOrder']
# Replace the already-expanded list after appending the explicit native aliases.
start=s.index('  for rule in ');end=s.index(' do',start)
s=s[:start]+'  for rule in '+json.dumps(names)+s[end:]
(W/'proofs/MorphismStatements.lean').write_text('import Morphisms\n'+s+'\n'+'\n'.join('#incremental_statement '+r['target'] for r in selected)+'\n')
(W/'morphism-statement-selection.json').write_text(json.dumps([dict(source=r['source'],target=r['target']) for r in selected],indent=2))
print('candidates',len(selected))
