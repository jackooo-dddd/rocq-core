> 此目录的实例来自历史 main75 bootstrap 基线，保留作为对照。当前机械 nat/eq 统一互操作示例请看 [UseNative.lean](../../../experiments/mechanical-correspondence-20261019/UseNative.lean) 和 [说明](../../../experiments/mechanical-correspondence-20261019/README.md)。

Lean 互操作实证

Nat.lean：翻译后的 Rocq add 直接接收／返回 Lean Nat。对任意 n,m，用 Lean 归纳证明 add n m = n+m；另有两个闭项计算等式。

List.lean：翻译后的 Rocq list 是单独的数据类型。显式 fromLean/toLean 双向转换；证明两个方向的往返恒等、length 与 Lean List.length 一致、app 与 Lean List.append 一致，均对任意元素宇宙有效。

五个定理的 axiom closure 均为空。这里使用的是最终 main75 的实际翻译结果，不是手写一个类似的替代实现。源测试第一次误以为 Lean 0+m 与 m 定义相等，已改用 Nat.zero_add；原失败日志保留在 work/tests/basic-interop75。

当前 importer 注册内核声明，并未为新归纳类型运行 Lean 编译器。List 的两个桥接定义因此标记 noncomputable：保留可归约的内核定义，不生成运行时代码；并非加入公理，也不影响上述证明。编译可执行程序属于额外打包工作。

复跑：python3 interop/run.py（完整仓库中）。
