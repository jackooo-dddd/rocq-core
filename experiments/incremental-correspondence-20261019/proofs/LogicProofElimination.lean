import LogicExistsElimination
noncomputable section
namespace NativeBridge.Incremental.LogicProofElimination
open NativeBridge
universe w
def eq_ex_rec_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rec
theorem eq_ex_rec_agrees (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P)
    (F : ((ex_agrees P).mp a = (ex_agrees P).mp b) → Type) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rec) A P a b
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ _ => f) e = f := by rfl

def eq_ex_rect_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect
theorem eq_ex_rect_agrees (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P)
    (F : ((ex_agrees P).mp a = (ex_agrees P).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect) A P a b
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ _ => f) e = f := by rfl

def eq_ex_rec_uncurried_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rec_uncurried
theorem eq_ex_rec_uncurried_agrees (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P)
    (F : ((ex_agrees P).mp a = (ex_agrees P).mp b) → Type) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rec_uncurried) A P a b
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ => f) e = f := by rfl

def eq_ex_rect_uncurried_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_uncurried
theorem eq_ex_rect_uncurried_agrees (A : Prop) (P : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex A P)
    (F : ((ex_agrees P).mp a = (ex_agrees P).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_uncurried) A P a b
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ => f) e = f := by rfl

def eq_ex_rect_ex_intro_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro
theorem eq_ex_rect_ex_intro_agrees (A : Prop) (P : A → Prop) (a1 : A) (a2 : P a1) (b1 : A) (b2 : P b1)
    (F : ((ex_agrees P).mp (Rocq.Corelib.Init.Logic.ex.ex_intro A P a1 a2) = (ex_agrees P).mp (Rocq.Corelib.Init.Logic.ex.ex_intro A P b1 b2)) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) (Rocq.Corelib.Init.Logic.ex.ex_intro A P a1 a2) (Rocq.Corelib.Init.Logic.ex.ex_intro A P b1 b2)) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro) A P a1 a2 b1 b2
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ _ => f) e = f := by rfl

def eq_ex_rect_ex_intro_l_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_l
theorem eq_ex_rect_ex_intro_l_agrees (A : Prop) (P : A → Prop) (a1 : A) (a2 : P a1) (b : Rocq.Corelib.Init.Logic.ex A P)
    (F : ((ex_agrees P).mp (Rocq.Corelib.Init.Logic.ex.ex_intro A P a1 a2) = (ex_agrees P).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) (Rocq.Corelib.Init.Logic.ex.ex_intro A P a1 a2) b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_l) A P a1 a2 b
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ _ => f) e = f := by rfl

def eq_ex_rect_ex_intro_r_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_r
theorem eq_ex_rect_ex_intro_r_agrees (A : Prop) (P : A → Prop) (a : Rocq.Corelib.Init.Logic.ex A P) (b1 : A) (b2 : P b1)
    (F : ((ex_agrees P).mp a = (ex_agrees P).mp (Rocq.Corelib.Init.Logic.ex.ex_intro A P b1 b2)) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex A P) a (Rocq.Corelib.Init.Logic.ex.ex_intro A P b1 b2)) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex_rect_ex_intro_r) A P a b1 b2
      (fun e => F (congrArg (fun h => (ex_agrees P).mp h) (eqTo e)))
      (fun _ _ => f) e = f := by rfl

def eq_ex2_rec_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rec
theorem eq_ex2_rec_agrees (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q)
    (F : ((ex2_agrees P Q).mp a = (ex2_agrees P Q).mp b) → Type) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rec) A P Q a b
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ _ _ => f) e = f := by rfl

def eq_ex2_rect_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect
theorem eq_ex2_rect_agrees (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q)
    (F : ((ex2_agrees P Q).mp a = (ex2_agrees P Q).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect) A P Q a b
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ _ _ => f) e = f := by rfl

def eq_ex2_rec_uncurried_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rec_uncurried
theorem eq_ex2_rec_uncurried_agrees (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q)
    (F : ((ex2_agrees P Q).mp a = (ex2_agrees P Q).mp b) → Type) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rec_uncurried) A P Q a b
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ => f) e = f := by rfl

def eq_ex2_rect_uncurried_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_uncurried
theorem eq_ex2_rect_uncurried_agrees (A : Prop) (P Q : A → Prop) (a b : Rocq.Corelib.Init.Logic.ex2 A P Q)
    (F : ((ex2_agrees P Q).mp a = (ex2_agrees P Q).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_uncurried) A P Q a b
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ => f) e = f := by rfl

def eq_ex2_rect_ex_intro2_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2
theorem eq_ex2_rect_ex_intro2_agrees (A : Prop) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (F : ((ex2_agrees P Q).mp (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q a1 a2 a3) = (ex2_agrees P Q).mp (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q b1 b2 b3)) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q a1 a2 a3) (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q b1 b2 b3)) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2) A P Q a1 a2 a3 b1 b2 b3
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ _ _ => f) e = f := by rfl

def eq_ex2_rect_ex_intro2_l_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l
theorem eq_ex2_rect_ex_intro2_l_agrees (A : Prop) (P Q : A → Prop) (a1 : A) (a2 : P a1) (a3 : Q a1) (b : Rocq.Corelib.Init.Logic.ex2 A P Q)
    (F : ((ex2_agrees P Q).mp (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q a1 a2 a3) = (ex2_agrees P Q).mp b) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q a1 a2 a3) b) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_l) A P Q a1 a2 a3 b
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ _ _ => f) e = f := by rfl

def eq_ex2_rect_ex_intro2_r_closed := closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r
theorem eq_ex2_rect_ex_intro2_r_agrees (A : Prop) (P Q : A → Prop) (a : Rocq.Corelib.Init.Logic.ex2 A P Q) (b1 : A) (b2 : P b1) (b3 : Q b1)
    (F : ((ex2_agrees P Q).mp a = (ex2_agrees P Q).mp (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q b1 b2 b3)) → Sort w) (f : F rfl)
    (e : ME (Rocq.Corelib.Init.Logic.ex2 A P Q) a (Rocq.Corelib.Init.Logic.ex2.ex_intro2 A P Q b1 b2 b3)) :
    (closed_logic% RocqPending.Corelib.Init.Logic.eq_ex2_rect_ex_intro2_r) A P Q a b1 b2 b3
      (fun e => F (congrArg (fun h => (ex2_agrees P Q).mp h) (eqTo e)))
      (fun _ _ _ => f) e = f := by rfl

end NativeBridge.Incremental.LogicProofElimination
