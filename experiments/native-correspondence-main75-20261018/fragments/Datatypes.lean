def optionTo {A : Type u} : Rocq.Corelib.Init.Datatypes.option A → Option A :=
  Rocq.Corelib.Init.Datatypes.option.rec (fun x => some x) none
def optionOf {A : Type u} : Option A → Rocq.Corelib.Init.Datatypes.option A
  | some x => .Some A x
  | none => .None A
@[simp] theorem option_of_to {A : Type u} (x : Rocq.Corelib.Init.Datatypes.option A) : optionOf (optionTo x) = x := by cases x <;> rfl
@[simp] theorem option_to_of {A : Type u} (x : Option A) : optionTo (optionOf x) = x := by cases x <;> rfl
def optionIso (A : Type u) : Iso (Rocq.Corelib.Init.Datatypes.option A) (Option A) := ⟨optionTo, optionOf, option_of_to, option_to_of⟩

def prodTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.prod A B → A × B :=
  Rocq.Corelib.Init.Datatypes.prod.rec (fun a b => (a,b))
def prodOf {A : Type u} {B : Type v} (x : A × B) : Rocq.Corelib.Init.Datatypes.prod A B := .pair A B x.1 x.2
@[simp] theorem prod_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) : prodOf (prodTo x) = x := by cases x <;> rfl
@[simp] theorem prod_to_of {A : Type u} {B : Type v} (x : A × B) : prodTo (prodOf x) = x := by cases x <;> rfl
def prodIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.prod A B) (A × B) := ⟨prodTo, prodOf, prod_of_to, prod_to_of⟩

def sumTo {A : Type u} {B : Type v} : Rocq.Corelib.Init.Datatypes.sum A B → Sum A B :=
  Rocq.Corelib.Init.Datatypes.sum.rec Sum.inl Sum.inr
def sumOf {A : Type u} {B : Type v} : Sum A B → Rocq.Corelib.Init.Datatypes.sum A B
  | .inl x => .inl A B x
  | .inr y => .inr A B y
@[simp] theorem sum_of_to {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.sum A B) : sumOf (sumTo x) = x := by cases x <;> rfl
@[simp] theorem sum_to_of {A : Type u} {B : Type v} (x : Sum A B) : sumTo (sumOf x) = x := by cases x <;> rfl
def sumIso (A : Type u) (B : Type v) : Iso (Rocq.Corelib.Init.Datatypes.sum A B) (Sum A B) := ⟨sumTo, sumOf, sum_of_to, sum_to_of⟩

def resultTo {A : Type u} {E : Type v} : Rocq.Corelib.Init.Datatypes.result A E → Except E A :=
  Rocq.Corelib.Init.Datatypes.result.rec Except.ok Except.error
def resultOf {A : Type u} {E : Type v} : Except E A → Rocq.Corelib.Init.Datatypes.result A E
  | .ok x => .Ok A E x
  | .error e => .Error A E e
@[simp] theorem result_of_to {A : Type u} {E : Type v} (x : Rocq.Corelib.Init.Datatypes.result A E) : resultOf (resultTo x) = x := by cases x <;> rfl
@[simp] theorem result_to_of {A : Type u} {E : Type v} (x : Except E A) : resultTo (resultOf x) = x := by cases x <;> rfl
def resultIso (A : Type u) (E : Type v) : Iso (Rocq.Corelib.Init.Datatypes.result A E) (Except E A) := ⟨resultTo, resultOf, result_of_to, result_to_of⟩
def unitIso : Iso Rocq.Corelib.Init.Datatypes.unit Unit where
  to _ := ()
  of _ := .tt
  of_to x := by cases x; rfl
  to_of x := by cases x; rfl
def emptyIso : Iso Rocq.Corelib.Init.Datatypes.Empty_set Empty where
  to x := by cases x
  of x := nomatch x
  of_to x := by cases x
  to_of x := nomatch x

@[simp] theorem andb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.andb a b) = (boolTo a && boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem orb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.orb a b) = (boolTo a || boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem negb_agrees (a : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.negb a) = !boolTo a := by cases a <;> rfl
@[simp] theorem xorb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.xorb a b) = Bool.xor (boolTo a) (boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem implb_agrees (a b : RBool) : boolTo (Rocq.Corelib.Init.Datatypes.implb a b) = (!boolTo a || boolTo b) := by cases a <;> cases b <;> rfl
@[simp] theorem is_true_agrees (a : RBool) : Rocq.Corelib.Init.Datatypes.is_true a ↔ boolTo a = true := by
  cases a
  · constructor <;> intro h <;> rfl
  · constructor
    · intro h
      exact congrArg boolTo h
    · intro h
      exact Bool.noConfusion h
@[simp] theorem compOpp_agrees (c : RComparison) : comparisonTo (Rocq.Corelib.Init.Datatypes.CompOpp c) = (comparisonTo c).swap := by cases c <;> rfl
@[simp] theorem option_map_agrees {A : Type u} {B : Type v} (f : A → B) (x : Rocq.Corelib.Init.Datatypes.option A) :
  optionTo (Rocq.Corelib.Init.Datatypes.option_map A B f x) = (optionTo x).map f := by cases x <;> rfl
@[simp] theorem fst_agrees {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
  Rocq.Corelib.Init.Datatypes.fst A B x = (prodTo x).1 := by cases x <;> rfl
@[simp] theorem snd_agrees {A : Type u} {B : Type v} (x : Rocq.Corelib.Init.Datatypes.prod A B) :
  Rocq.Corelib.Init.Datatypes.snd A B x = (prodTo x).2 := by cases x <;> rfl
@[simp] theorem length_agrees {A : Type u} (xs : RList A) :
  Rocq.Corelib.Init.Datatypes.length A xs = (listTo xs).length :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => Rocq.Corelib.Init.Datatypes.length A xs = (listTo xs).length)
    rfl (fun x xs ih => by change Nat.succ (Rocq.Corelib.Init.Datatypes.length A xs) = Nat.succ (listTo xs).length; rw [ih]) xs
@[simp] theorem append_agrees {A : Type u} (xs ys : RList A) :
  listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = listTo xs ++ listTo ys :=
  @Rocq.Corelib.Init.Datatypes.list.rec A (fun xs => listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = listTo xs ++ listTo ys)
    rfl (fun x xs ih => by change x :: listTo (Rocq.Corelib.Init.Datatypes.app A xs ys) = x :: (listTo xs ++ listTo ys); rw [ih]) xs
