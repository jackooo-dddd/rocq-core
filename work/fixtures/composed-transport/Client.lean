import Rocq2LeanOut
universe u v r s
def raiseFunction {A : Sort u} {B : Sort v} (f : A → B) : PULift.{s} (PULift.{r} A → B) :=
 PULift.up (fun x => f x.down)
def lowerFunction {A : Sort u} {B : Sort v} (f : PULift.{s} (PULift.{r} A → B)) : A → B :=
 fun x => f.down (PULift.up x)
theorem lower_raise {A : Sort u} {B : Sort v} (f : A → B) :
 lowerFunction (raiseFunction.{u,v,r,s} f) = f := rfl
theorem raise_lower {A : Sort u} {B : Sort v} (f : PULift.{s} (PULift.{r} A → B)) :
 raiseFunction (lowerFunction f) = f := rfl
theorem raised_application {A : Sort u} {B : Sort v} (f : A → B) (x : A) :
 (raiseFunction.{u,v,r,s} f).down (PULift.up x) = f x := rfl
#print axioms raiseFunction
#print axioms lowerFunction
#print axioms lower_raise
#print axioms raise_lower
#print axioms raised_application
