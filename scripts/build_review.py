from pathlib import Path
import tarfile,json
b=Path.home()/'research/rocq-core-by-file-20261018';files=set()
for base in [b,b/'improved']:
 for pat in ['*.html','*.txt','*.json','*.csv','*.patch']:files.update(base.glob(pat))
 for meta in json.loads((base/'runs.json').read_text()):
  stem=Path(meta['evidence_dir'])
  for ext in ['.v','.lean','.json','.report.html','.report.txt','.kernel.txt']:files.add(stem.with_suffix(ext))
  files.update((stem/'records').glob('*.json'))
for name in ['trial-summary.json','root-status-delta.json','root-obligation-delta.json','test_statement.json','statement-suite-result.json','statement-suite.log']:files.add(b/'experiments'/name)
with tarfile.open(b/'review.tar.gz','w:gz',compresslevel=6) as t:
 for p in sorted(files):
  if p.is_file():t.add(p,arcname=str(p.relative_to(b)))
print('review archive',len(files),'files', (b/'review.tar.gz').stat().st_size,'bytes')
