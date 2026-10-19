import Init.Data.BitVec.Basic

/-! Functional model of Rocq's bounded persistent primitive arrays.
The source runtime caps lengths at 4194303. Values outside the stored length
are represented by the separate default. No source axiom is introduced. -/
namespace Rocq2Lean.PrimArray

universe u

def maxLength : Nat := 4194303

structure Rep (A : Type u) : Type u where
  size : Fin (maxLength + 1)
  value : Fin size.val → A
  fallback : A

def boundedSize (n : Nat) : Fin (maxLength + 1) :=
  if h : n < maxLength + 1 then ⟨n, h⟩
  else ⟨maxLength, Nat.lt_succ_self maxLength⟩

def make (A : Type u) (n : BitVec 63) (a : A) : Rep A :=
  ⟨boundedSize n.toNat, fun _ => a, a⟩

def get (A : Type u) (t : Rep A) (i : BitVec 63) : A :=
  if h : i.toNat < t.size.val then t.value ⟨i.toNat, h⟩ else t.fallback

def set (A : Type u) (t : Rep A) (i : BitVec 63) (a : A) : Rep A :=
  ⟨t.size, fun j => if j.val == i.toNat then a else t.value j, t.fallback⟩

def length (A : Type u) (t : Rep A) : BitVec 63 := BitVec.ofNat 63 t.size.val
def default (A : Type u) (t : Rep A) : A := t.fallback
def copy (A : Type u) (t : Rep A) : Rep A := t

/-- Index a literal's finite payload, retaining its distinct out-of-bounds default. -/
def lookup (A : Type u) (fallback : A) : List A → Nat → A
  | [], _ => fallback
  | x :: _, 0 => x
  | _ :: xs, n + 1 => lookup A fallback xs n

def ofList (A : Type u) (xs : List A) (fallback : A) : Rep A :=
  ⟨boundedSize xs.length, fun i => lookup A fallback xs i.val, fallback⟩

end Rocq2Lean.PrimArray
