Require Import Arith.

Inductive list (A : Type) : Type :=
  | nil : list A
  | cons : A -> list A -> list A.

Implicit Arguments nil [A].
Implicit Arguments cons [A].

Notation "x :: xs" := (cons x xs).

Fixpoint map {A B : Type} (f : A -> B) (xs : list A) : list B :=
  match xs with
    | nil => nil
    | x :: xs' => f x :: map f xs'
  end.

Fixpoint append {A : Type} (xs ys : list A) : list A :=
  match xs with
    | nil => ys
    | x :: xs' => x :: append xs' ys
  end.

Fixpoint rev {A : Type} (xs : list A) : list A :=
  match xs with
    | nil => nil
    | x :: xs' => append (rev xs') (x :: nil)
  end.

Fixpoint revapp {A : Type} (xs ys : list A) : list A :=
  match xs with
    | nil => ys
    | x :: xs' => revapp xs' (x :: ys)
  end.

Inductive tree (A : Type) : Type :=
  | Lf : tree A
  | Br : A -> tree A -> tree A -> tree A.

Implicit Arguments Lf [A].
Implicit Arguments Br [A].

Fixpoint reflect {A : Type} (t : tree A) : tree A :=
  match t with
    | Lf => Lf
    | Br v t1 t2 => Br v (reflect t2) (reflect t1)
  end.

Fixpoint size {A : Type} (t : tree A) : nat :=
  match t with
    | Lf => 0
    | Br v t1 t2 => S (size t1 + size t2)
  end.

Theorem appmap :
  forall A B (f : A -> B) (xs ys : list A),
  map f (append xs ys) = append (map f xs) (map f ys).
Proof.
  intros A B f xs ys.
  induction xs.
  - reflexivity.
  - simpl.
    f_equal.
    apply IHxs.
Qed.

Theorem revmap :
  forall A B (f : A -> B) (xs : list A), map f (rev xs) = rev (map f xs).
Proof.
  intros A B f xs.
  induction xs.
  - reflexivity.
  - simpl.
    rewrite appmap.
    f_equal.
    auto.
Qed.

Theorem apprevapp :
  forall A (xs ys zs : list A),
  revapp (append xs ys) zs = revapp ys (revapp xs zs).
Proof.
  intros A xs ys.
  induction xs as [ | x xs] ; intro zs.
  - reflexivity.
  - apply (IHxs (x :: zs)).
Qed.

Theorem size_reflect : forall A (t : tree A), size (reflect t) = size t.
  intros A t.
  induction t as [ | v t1 t2].
  - reflexivity.
  - simpl.
    rewrite plus_comm.
    do 2 f_equal ; auto.
Qed.
