import SpecifOperations
noncomputable section
namespace NativeBridge.Incremental.SpecifEqualityElimination
open NativeBridge NativeBridge.Incremental
universe u v w z
def eq_sig_rect_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect
theorem eq_sig_rect_agrees (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) a b)
    (F : (subtypeTo a = subtypeTo b) → Sort z) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect) A P a b
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig_rec_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rec
theorem eq_sig_rec_agrees (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) a b)
    (F : (subtypeTo a = subtypeTo b) → Type) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rec) A P a b
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig_rect_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_uncurried
theorem eq_sig_rect_uncurried_agrees (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) a b)
    (F : (subtypeTo a = subtypeTo b) → Sort z) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_uncurried) A P a b
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig_rec_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rec_uncurried
theorem eq_sig_rec_uncurried_agrees (A : Sort u) (P : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig A P)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) a b)
    (F : (subtypeTo a = subtypeTo b) → Type) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rec_uncurried) A P a b
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig_rect_exist_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist
theorem eq_sig_rect_exist_agrees (A : Sort u) (P : A → Prop) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2))
    (F : (subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) = subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2)) → Sort z) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist) A P a1 a2 b1 b2
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sig_rect_agrees A P (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2) e F f

def eq_sig_rect_exist_l_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_l
theorem eq_sig_rect_exist_l_agrees (A : Sort u) (P : A → Prop) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Specif.sig A P)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) b)
    (F : (subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) = subtypeTo b) → Sort z) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_l) A P a1 a2 b
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sig_rect_agrees A P (Rocq.Corelib.Init.Specif.sig.exist A P a1 a2) b e F f

def eq_sig_rect_exist_r_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_r
theorem eq_sig_rect_exist_r_agrees (A : Sort u) (P : A → Prop) (a : Rocq.Corelib.Init.Specif.sig A P) (b1 : A) (b2 : P b1)
    (e : ME (Rocq.Corelib.Init.Specif.sig A P) a (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2))
    (F : (subtypeTo a = subtypeTo (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2)) → Sort z) (f : F (congrArg subtypeTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig_rect_exist_r) A P a b1 b2
      (fun e => F (congrArg subtypeTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sig_rect_agrees A P a (Rocq.Corelib.Init.Specif.sig.exist A P b1 b2) e F f

def eq_sig2_rect_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect
theorem eq_sig2_rect_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
    (F : (subtype2To a = subtype2To b) → Sort z) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect) A P Q a b
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig2_rec_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rec
theorem eq_sig2_rec_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
    (F : (subtype2To a = subtype2To b) → Type) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rec) A P Q a b
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig2_rect_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_uncurried
theorem eq_sig2_rect_uncurried_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
    (F : (subtype2To a = subtype2To b) → Sort z) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_uncurried) A P Q a b
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig2_rec_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rec_uncurried
theorem eq_sig2_rec_uncurried_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a b : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a b)
    (F : (subtype2To a = subtype2To b) → Type) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rec_uncurried) A P Q a b
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sig2_rect_exist2_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2
theorem eq_sig2_rect_exist2_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3))
    (F : (subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) = subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3)) → Sort z) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2) A P Q a1 a2 a3 b1 b2 b3
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sig2_rect_agrees A P Q (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3) e F f

def eq_sig2_rect_exist2_l_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_l
theorem eq_sig2_rect_exist2_l_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b : Rocq.Corelib.Init.Specif.sig2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) b)
    (F : (subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) = subtype2To b) → Sort z) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_l) A P Q a1 a2 a3 b
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sig2_rect_agrees A P Q (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q a1 a2 a3) b e F f

def eq_sig2_rect_exist2_r_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_r
theorem eq_sig2_rect_exist2_r_agrees (A : Sort u) (P : A → Prop) (Q : A → Prop) (a : Rocq.Corelib.Init.Specif.sig2 A P Q) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (e : ME (Rocq.Corelib.Init.Specif.sig2 A P Q) a (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3))
    (F : (subtype2To a = subtype2To (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3)) → Sort z) (f : F (congrArg subtype2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sig2_rect_exist2_r) A P Q a b1 b2 b3
      (fun e => F (congrArg subtype2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sig2_rect_agrees A P Q a (Rocq.Corelib.Init.Specif.sig2.exist2 A P Q b1 b2 b3) e F f

def eq_sigT_rect_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect
theorem eq_sigT_rect_agrees (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
    (F : (psigmaTo a = psigmaTo b) → Sort z) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect) A P a b
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT_rec_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rec
theorem eq_sigT_rec_agrees (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
    (F : (psigmaTo a = psigmaTo b) → Type) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rec) A P a b
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT_rect_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_uncurried
theorem eq_sigT_rect_uncurried_agrees (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
    (F : (psigmaTo a = psigmaTo b) → Sort z) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_uncurried) A P a b
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT_rec_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rec_uncurried
theorem eq_sigT_rec_uncurried_agrees (A : Sort u) (P : A → Sort v) (a b : Rocq.Corelib.Init.Specif.sigT A P)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) a b)
    (F : (psigmaTo a = psigmaTo b) → Type) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rec_uncurried) A P a b
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT_rect_existT_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT
theorem eq_sigT_rect_existT_agrees (A : Sort u) (P : A → Sort v) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2))
    (F : (psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) = psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2)) → Sort z) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT) A P a1 a2 b1 b2
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sigT_rect_agrees A P (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2) e F f

def eq_sigT_rect_existT_l_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_l
theorem eq_sigT_rect_existT_l_agrees (A : Sort u) (P : A → Sort v) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Specif.sigT A P)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) b)
    (F : (psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) = psigmaTo b) → Sort z) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_l) A P a1 a2 b
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sigT_rect_agrees A P (Rocq.Corelib.Init.Specif.sigT.existT A P a1 a2) b e F f

def eq_sigT_rect_existT_r_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_r
theorem eq_sigT_rect_existT_r_agrees (A : Sort u) (P : A → Sort v) (a : Rocq.Corelib.Init.Specif.sigT A P) (b1 : A) (b2 : P b1)
    (e : ME (Rocq.Corelib.Init.Specif.sigT A P) a (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2))
    (F : (psigmaTo a = psigmaTo (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2)) → Sort z) (f : F (congrArg psigmaTo (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT_rect_existT_r) A P a b1 b2
      (fun e => F (congrArg psigmaTo (eqTo e)))
      (fun _ _ => f) e = f := by
  exact eq_sigT_rect_agrees A P a (Rocq.Corelib.Init.Specif.sigT.existT A P b1 b2) e F f

def eq_sigT2_rect_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect
theorem eq_sigT2_rect_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
    (F : (psigma2To a = psigma2To b) → Sort z) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect) A P Q a b
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT2_rec_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rec
theorem eq_sigT2_rec_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
    (F : (psigma2To a = psigma2To b) → Type) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rec) A P Q a b
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT2_rect_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_uncurried
theorem eq_sigT2_rect_uncurried_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
    (F : (psigma2To a = psigma2To b) → Sort z) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_uncurried) A P Q a b
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT2_rec_uncurried_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rec_uncurried
theorem eq_sigT2_rec_uncurried_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a b)
    (F : (psigma2To a = psigma2To b) → Type) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rec_uncurried) A P Q a b
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ => f) e = f := by
  cases e; cases a; rfl

def eq_sigT2_rect_existT2_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2
theorem eq_sigT2_rect_existT2_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3))
    (F : (psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) = psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3)) → Sort z) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2) A P Q a1 a2 a3 b1 b2 b3
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sigT2_rect_agrees A P Q (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3) e F f

def eq_sigT2_rect_existT2_l_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_l
theorem eq_sigT2_rect_existT2_l_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a1 : A) (a2 : P a1) (a3 : Q a1) (b : Rocq.Corelib.Init.Specif.sigT2 A P Q)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) b)
    (F : (psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) = psigma2To b) → Sort z) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_l) A P Q a1 a2 a3 b
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sigT2_rect_agrees A P Q (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q a1 a2 a3) b e F f

def eq_sigT2_rect_existT2_r_closed := closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_r
theorem eq_sigT2_rect_existT2_r_agrees (A : Sort u) (P : A → Sort v) (Q : A → Sort w) (a : Rocq.Corelib.Init.Specif.sigT2 A P Q) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (e : ME (Rocq.Corelib.Init.Specif.sigT2 A P Q) a (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3))
    (F : (psigma2To a = psigma2To (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3)) → Sort z) (f : F (congrArg psigma2To (eqTo e))) :
    (closed_specif% RocqPending.Corelib.Init.Specif.eq_sigT2_rect_existT2_r) A P Q a b1 b2 b3
      (fun e => F (congrArg psigma2To (eqTo e)))
      (fun _ _ _ => f) e = f := by
  exact eq_sigT2_rect_agrees A P Q a (Rocq.Corelib.Init.Specif.sigT2.existT2 A P Q b1 b2 b3) e F f


-- Every source branch here takes only proof arguments. These equalities explain
-- the branch-value presentation without assuming the branch ignores data.
theorem proof_branch1 {P : Prop} {C : P → Sort z} (p : P) (f : ∀ p, C p) :
    f = (fun _ => f p) := by funext q; rfl
theorem proof_branch2 {P : Prop} {Q : P → Prop} {C : (p : P) → Q p → Sort z}
    (p : P) (q : Q p) (f : ∀ p q, C p q) :
    f = (fun _ _ => f p q) := by funext p' q'; rfl
theorem proof_branch3 {P : Prop} {Q : P → Prop} {R : (p : P) → Q p → Prop}
    {C : (p : P) → (q : Q p) → R p q → Sort z}
    (p : P) (q : Q p) (r : R p q) (f : ∀ p q r, C p q r) :
    f = (fun _ _ _ => f p q r) := by funext p' q' r'; rfl
end NativeBridge.Incremental.SpecifEqualityElimination
