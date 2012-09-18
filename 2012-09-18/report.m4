include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `Circle 1.0;;')dnl
ocamlexec(`1.ml', `Square 2.0;;')dnl
ocamlexec(`1.ml', `Rectangle (1.0, 2.0);;')dnl
ocamlexec(`1.ml', `area (Circle 1.0);;')dnl
ocamlexec(`1.ml', `area (Square 2.0);;')dnl
ocamlexec(`1.ml', `area (Rectangle (1.0, 2.0));;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `depth (Br (1, (Br (2, (Br (3, Lf, Br (4, Lf, Lf))), Lf)), (Br (5, Br (6, Lf, Lf), Lf))));;')dnl
ocamlexec(`2.ml', `comptree 2 1;;')dnl

taskheader(`3', `3.ml')dnl

以下に実行例を示す。

ocamlexec(`3.ml', `inorder (Br (1, (Br (2, (Br (3, Lf, Br (4, Lf, Lf))), Lf)), (Br (5, Br (6, Lf, Lf), Lf))));;')dnl
ocamlexec(`3.ml', `postorder (Br (1, (Br (2, (Br (3, Lf, Br (4, Lf, Lf))), Lf)), (Br (5, Br (6, Lf, Lf), Lf))));;')dnl

taskheader(`4', `4.ml')dnl

以下に実行例を示す。

ocamlexec(`4.ml', `fdepth (FBr (1, [FBr (2,[]); FBr (3, [FBr (4, [])])]));;')dnl
ocamlexec(`4.ml', `fpreorder (FBr (1, [FBr (2, [FBr (3, []); FBr (4, [])]); FBr (5, [])]));;')dnl

taskheader(`5', `5.ml')dnl

以下に実行例を示す。

ocamlexec(`5.ml', `qsort (fun x y -> (x <= y)) [2; 1; 2; 3];;')dnl
ocamlexec(`5.ml', `qsort (fun x y -> x >= y) [4.0; 3.0; 7.0];;')dnl
