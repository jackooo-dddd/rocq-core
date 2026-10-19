# 文件阅读指南

所有复制文件及其仓库来源见 [FILES.json](FILES.json)。原运行的每一个文件另见 [EXPORT_FILES.md](EXPORT_FILES.md)。

| 路径 | 用途 |
|---|---|
| README.md | 入口、范围、阅读顺序和限制。 |
| SCOPE.md | 709/839/2180的准确来源。 |
| lean/KernelExample.lean | 机械构造器与加法归约示例，使用已有输出环境。 |
| TRANSLATION_FLOW.md | nat 与 add 的逐阶段解释，区分实际记录和解释。 |
| DECLARATIONS.md / .csv | 99 个专题根的可浏览/筛选索引。 |
| declarations/<源名>.md / .json | 每项译文、源 IR、目标 AST、尝试、条件及对应证书。 |
| source/*.v | 三个完整 Rocq 源模块，含原注释和非专题内容。 |
| lean/*.txt | Lean 实际打印结果，不是独立模块。 |
| lean/*.lean | 导入/打印入口，引用远程冻结路径。 |
| records/*.json | 三个完整模块的逐项记录。 |
| exports/<模块>/ | 关键导出/翻译/验证文件；含依赖闭包。 |
| correspondence/*.lean | 完整证明 profile，依赖生成环境。 |
| correspondence/fragments/ | 构造器、递归、算术/比较/位运算等证明片段。 |
| correspondence/audits/ 与 logs/ | 既有证书类型、公理依赖和检查日志。 |
| correspondence/DECLARATIONS.csv | 99项的对应覆盖与缺口。 |
| CORRESPONDENCE.md | 类型、构造器、运算和消去器的对应解释。 |
| CORELIB_NAT_REFERENCES.csv | 整个2180根范围中目标 AST 直接引用机械 Nat/运算的索引，非传递闭包。 |
| summary.json | 范围、状态和待证根。 |
| verify.py / VALIDATION.json | 文件复核及主要证明重验脚本/结果。 |
| build.py | 从现有结果确定性重建，不重新翻译。 |
| .work/ | 仅留远程的验证缓存/日志，已 gitignore。 |
