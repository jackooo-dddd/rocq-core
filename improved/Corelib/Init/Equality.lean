import Lean
-- No source declaration could be exported; compilation intentionally fails.
run_cmd throwError "EXPORT_BLOCKED: Corelib.Init.Equality; 22 sort-polymorphic declarations unsupported by pinned MetaRocq. See Equality.report.txt"
