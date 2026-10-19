import Init.Data.BitVec.Basic
import Init.Data.Nat.Log2

/-! Canonical Binary64 values. All NaNs are one value, while zeros retain sign.
Arithmetic is exact integer/rational arithmetic followed by one nearest-even
rounding step; no runtime Float value or axiom is used by the target helpers. -/
namespace Rocq2Lean.PrimFloat
universe u

inductive Rep where
  | finite (sign : Bool) (exponent : Fin 2047) (fraction : BitVec 52)
  | infinity (sign : Bool)
  | nan

def finite (s : Bool) (e f : Nat) : Rep :=
  .finite s ⟨e % 2047, Nat.mod_lt e (by decide)⟩ (BitVec.ofNat 52 f)
def zero (s : Bool) : Rep := finite s 0 0

def fromBits (b : BitVec 64) : Rep :=
  let s := b.toNat / 2^63 != 0
  let e := b.toNat / 2^52 % 2048
  let f := b.toNat % 2^52
  if e == 2047 then if f == 0 then .infinity s else .nan else finite s e f

def toBits : Rep → BitVec 64
  | .finite s e f => BitVec.ofNat 64 ((if s then 2^63 else 0) + e.val * 2^52 + f.toNat)
  | .infinity s => BitVec.ofNat 64 ((if s then 2^63 else 0) + 2047 * 2^52)
  | .nan => BitVec.ofNat 64 (2047 * 2^52 + 2^51)

def sign : Rep → Bool
  | .finite s _ _ | .infinity s => s
  | .nan => false
def isZero : Rep → Bool
  | .finite _ e f => e.val == 0 && f.toNat == 0
  | .infinity _ => false
  | .nan => false
def isNaN : Rep → Bool | .nan => true | .infinity _ => false | .finite .. => false
def opp : Rep → Rep
  | .finite s e f => .finite (!s) e f
  | .infinity s => .infinity (!s)
  | .nan => .nan
def abs : Rep → Rep
  | .finite _ e f => .finite false e f
  | .infinity _ => .infinity false
  | .nan => .nan

def mantissa : Rep → Nat
  | .finite _ e f => if e.val == 0 then f.toNat else 2^52 + f.toNat
  | .infinity _ => 0
  | .nan => 0
def exponent : Rep → Int
  | .finite _ e _ => if e.val == 0 then -1074 else (e.val : Int) - 1075
  | .infinity _ => 0
  | .nan => 0

def signed (s : Bool) (n : Nat) : Int := if s then -(n : Int) else n

/-- floor(log2(n/d)), for positive n,d. -/
def ratioLog2 (n d : Nat) : Int :=
  let k := (Nat.log2 n : Int) - (Nat.log2 d : Int)
  if k < 0 then
    if n * 2^(-k).toNat < d then k - 1 else k
  else if n < d * 2^k.toNat then k - 1 else k

def roundQuotient (n d : Nat) : Nat :=
  let q := n / d
  let r := n % d
  if 2*r > d || (2*r == d && q % 2 == 1) then q + 1 else q

/-- Pack an already rounded integer significand and its binary exponent. -/
def pack (s : Bool) (m : Nat) (q : Int) : Rep :=
  if m == 0 then zero s else
  let (m,q) := if m >= 2^53 then (m / 2, q + 1) else (m,q)
  if q > 971 then .infinity s
  else if q == -1074 && m < 2^52 then finite s 0 m
  else finite s (q + 1075).toNat (m - 2^52)

/-- Round the exact positive magnitude n/d * 2^e, preserving sign on underflow. -/
def round (s : Bool) (n d : Nat) (e : Int) : Rep :=
  if n == 0 then zero s else
  let q := max (-1074) (ratioLog2 n d + e - 52)
  let shift := e - q
  let m := if shift < 0 then roundQuotient n (d * 2^(-shift).toNat)
    else roundQuotient (n * 2^shift.toNat) d
  pack s m q

def add (x y : Rep) : Rep :=
  match x with
  | .nan => .nan
  | .infinity s =>
      match y with
      | .nan => .nan
      | .infinity t => if s == t then .infinity s else .nan
      | .finite .. => .infinity s
  | .finite sx _ _ =>
      match y with
      | .nan => .nan
      | .infinity s => .infinity s
      | .finite sy _ _ =>
          let e := min (exponent x) (exponent y)
          let a := mantissa x * 2^(exponent x - e).toNat
          let b := mantissa y * 2^(exponent y - e).toNat
          let n := signed sx a + signed sy b
          if n == 0 then zero (sx && sy)
          else round (n < 0) n.natAbs 1 e

def sub (x y : Rep) : Rep := add x (opp y)

def mul (x y : Rep) : Rep :=
  let s := sign x != sign y
  match x with
  | .nan => .nan
  | .infinity _ =>
      match y with
      | .nan => .nan
      | .infinity _ => .infinity s
      | .finite .. => if isZero y then .nan else .infinity s
  | .finite .. =>
      match y with
      | .nan => .nan
      | .infinity _ => if isZero x then .nan else .infinity s
      | .finite .. => round s (mantissa x * mantissa y) 1 (exponent x + exponent y)

def div (x y : Rep) : Rep :=
  let s := sign x != sign y
  match x with
  | .nan => .nan
  | .infinity _ =>
      match y with
      | .nan => .nan
      | .infinity _ => .nan
      | .finite .. => .infinity s
  | .finite .. =>
      match y with
      | .nan => .nan
      | .infinity _ => zero s
      | .finite .. =>
          if isZero y then if isZero x then .nan else .infinity s
          else round s (mantissa x) (mantissa y) (exponent x - exponent y)

/-- Structural base-four square root, whose kernel reduction does not depend on
unfolding a well-foundedness proof. Each step adds one binary root digit. -/
def sqrtDigits : Nat → Nat → Nat
  | 0, _ => 0
  | fuel + 1, n =>
      let r := 2 * sqrtDigits fuel (n / 4)
      if (r+1)^2 ≤ n then r+1 else r

def integerSqrt (n : Nat) : Nat := sqrtDigits (Nat.log2 n / 2 + 1) n

def sqrt (x : Rep) : Rep :=
  match x with
  | .nan => .nan
  | .infinity s => if s then .nan else x
  | .finite s _ _ =>
      if isZero x then x else if s then .nan else
      let k := (Nat.log2 (mantissa x) : Int) + exponent x
      let q := max (-1074) (k / 2 - 52)
      let shift := exponent x - 2*q
      let n := if shift < 0 then mantissa x else mantissa x * 2^shift.toNat
      let d := if shift < 0 then 2^(-shift).toNat else 1
      let m := integerSqrt (n / d)
      let mid := d * (2*m+1)^2
      let m := if 4*n > mid || (4*n == mid && m % 2 == 1) then m+1 else m
      pack false m q

def ofUint63 (x : BitVec 63) : Rep := round false x.toNat 1 0
def normfrMantissa (x : Rep) : BitVec 63 :=
  match x with
  | .finite _ e _ => BitVec.ofNat 63 (if e.val == 1022 then mantissa x else 0)
  | .infinity _ => BitVec.ofNat 63 0
  | .nan => BitVec.ofNat 63 0

def ldshiftexp (x : Rep) (e : BitVec 63) : Rep :=
  match x with
  | .finite s _ _ => round s (mantissa x) 1 (exponent x + (min e.toNat 4202 : Nat) - 2101)
  | .infinity _ => x
  | .nan => x
def frshiftexp (R : Type u) (pair : Rep → BitVec 63 → R) (x : Rep) : R :=
  match x with
  | .finite s _ _ =>
      if isZero x then pair x (BitVec.ofNat 63 0) else
      let e := (Nat.log2 (mantissa x) : Int) + exponent x + 1
      pair (round s (mantissa x) 1 (exponent x - e)) (BitVec.ofNat 63 (e + 2101).toNat)
  | .infinity _ => pair x (BitVec.ofNat 63 0)
  | .nan => pair x (BitVec.ofNat 63 0)

def nextUp (x : Rep) : Rep :=
  match x with
  | .nan => .nan
  | .infinity false => x
  | .infinity true => fromBits (BitVec.ofNat 64 (2^64 - 2^52 - 1))
  | .finite s _ _ =>
      if isZero x then finite false 0 1
      else fromBits (BitVec.ofNat 64 (if s then (toBits x).toNat - 1 else (toBits x).toNat + 1))
def nextDown (x : Rep) : Rep := opp (nextUp (opp x))

def eqb (x y : Rep) : Bool :=
  if isNaN x || isNaN y then false
  else (isZero x && isZero y) || (toBits x).toNat == (toBits y).toNat
def equal (x y : Rep) : Bool := (toBits x).toNat == (toBits y).toNat
def ltb (x y : Rep) : Bool :=
  if isNaN x || isNaN y || eqb x y then false
  else if sign x != sign y then sign x
  else if sign x then (toBits y).toNat < (toBits x).toNat
  else (toBits x).toNat < (toBits y).toNat
def leb (x y : Rep) : Bool := eqb x y || ltb x y

def compare (R : Type u) (eq lt gt nc : R) (x y : Rep) : R :=
  if ltb x y then lt else if ltb y x then gt else if eqb x y then eq else nc
def classify (R : Type u) (pn nn ps ns pz nz pi ni nan : R) (x : Rep) : R :=
  match x with
  | .nan => nan
  | .infinity s => if s then ni else pi
  | .finite s e f =>
      if e.val == 0 then
        if f.toNat == 0 then (if s then nz else pz) else (if s then ns else ps)
      else if s then nn else pn

/-- Compiler-side literal parser; target literals contain only canonical bits. -/
def parseLiteral (text : String) : Option Rep := do
  if text == "nan" then return .nan
  if text == "infinity" then return .infinity false
  if text == "neg_infinity" then return .infinity true
  let negative := text.startsWith "-"
  let text := if negative then text.drop 1 |>.toString else text
  let [mant, exp] := text.splitOn "p" | none
  unless mant.startsWith "0x" do none
  let exp := if exp.startsWith "+" then exp.drop 1 |>.toString else exp
  let e ← exp.toInt?
  let parts := (mant.drop 2 |>.toString).splitOn "."
  let (digits, fractional) ← match parts with
    | [a] => some (a,0)
    | [a,b] => some (a++b,b.length)
    | _ => none
  unless !digits.isEmpty do none
  let n ← digits.toList.foldlM (init := 0) fun n c => do
    let v ← if '0' ≤ c && c ≤ '9' then some (c.toNat - '0'.toNat)
      else if 'a' ≤ c && c ≤ 'f' then some (c.toNat - 'a'.toNat + 10)
      else none
    pure (16*n+v)
  return round negative n 1 (e - 4*(fractional : Int))

end Rocq2Lean.PrimFloat
