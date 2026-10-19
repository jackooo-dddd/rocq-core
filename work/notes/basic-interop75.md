Basic Lean interoperability, final main75 artifacts

work/tests/basic-interop75/result.json: PASS. Nat.lean proves the translated add agrees with Lean Nat.add for all inputs. List.lean proves native and translated roundtrips and length/append agreement at arbitrary element universe. Five empty axiom closures.

First Nat proof used rfl for Lean 0+m=m, but Lean addition recurses on its second argument; the corrected proof uses Nat.zero_add. First List bridge used ordinary def, exposing that the importer registers kernel inductives without native compiler registration. The final bridges use noncomputable def so the kernel definitions remain reducible without requesting runtime code generation. Original failed attempts are retained with initial-/before-noncomputable- prefixes. No change to the translator was needed for these clients.

This supports formal interoperability, not a claim that all translated data types are definitional aliases of native Lean types or that native code generation has been packaged.
