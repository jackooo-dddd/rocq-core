#!/usr/bin/env python3
"""Restore large final JSON evidence from the checked-in lossless gzip copies."""
from pathlib import Path
import gzip,json
R=Path(__file__).resolve().parents[1]
for row in json.loads((R/'ARTIFACTS.json').read_text())['files']:
 path=R/row['path'];data=gzip.decompress((R/row['compressed']).read_bytes())
 assert len(data)==row['bytes'],row['path']
 if path.exists():
  if path.read_bytes()!=data:raise SystemExit('Local file differs; preserved: '+str(path))
 else:
  path.parent.mkdir(parents=True,exist_ok=True);path.write_bytes(data)
 print(row['path'])
