include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `inter [3; 1; 2] [2; 3];;')dnl
ocamlexec(`1.ml', `pair 1 [1; 2; 3];;')dnl
ocamlexec(`1.ml', `prod [1; 2; 3] [4, 5, 6];;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `flatten [[1; 2]; []; [3]];;')dnl
ocamlexec(`2.ml', `flatten [[1]; []; [2; 3; 4]; [5; 6]];;')dnl
ocamlexec(`2.ml', `exists (fun a -> a mod 2 = 0) [1; 3; 5; 7; 9];;')dnl
ocamlexec(`2.ml', `exists (fun a -> a mod 2 = 0) [1; 3; 5; 6; 7; 9];;')dnl

taskheader(`3', `3.ml')dnl

以下に実行例を示す。

ocamlexec(`3.ml', `add 3 (add 1 (add 2 Lf));;')dnl
ocamlexec(`3.ml', `min_elt (add 3 (add 1 (add 2 Lf)));;')dnl
ocamlexec(`3.ml', `remove 1 (add 3 (add 1 (add 2 Lf)));;')dnl
ocamlexec(`3.ml', `remove 2 (add 3 (add 1 (add 2 Lf)));;')dnl
ocamlexec(`3.ml', `remove 3 (add 3 (add 1 (add 2 Lf)));;')dnl

taskheader(`4', `4.ml')dnl

以下に実行例を示す。

ocamlexec(`4.ml', `fdepth (FBr (1, [FBr (2,[]); FBr (3, [FBr (4, [])])]));;')dnl
ocamlexec(`4.ml', `fpreorder (FBr (1, [FBr (2, [FBr (3, []); FBr (4, [])]); FBr (5, [])]));;')dnl

taskheader(`5', `5.ml')dnl

課題の指示(ヒント)通りの split を使ってしまうと安定ソートにならず、その上リストに対する split はその長さの分だけのコストがかかるので無駄が多い。そこで、bottom-up merge sort を実装した。以下に実行例を示す。

ocamlexec(`5.ml', `msort (<=) [7; 5; 9; 2; 4; 0; 8; 1; 6; 3];;')dnl
ocamlexec(`5.ml', `msort (>=) [16; 7; 12; 5; 9; 18; 2; 15; 8; 4; 10; 14; 0; 17; 11; 6; 13; 1; 19; 3];;')dnl

taskheader(`6', `6.ml')dnl

以下に実行例を示す。

ocamlexec(`6.ml', `powset [1; 2];;')dnl
ocamlexec(`6.ml', `powset [1; 2; 3];;')dnl
ocamlexec(`6.ml', `powset [1; 2; 3; 4];;')dnl

taskheader(`7', `7.ml')dnl

以下に実行例を示す。

ocamlexec(`7.ml', `satisfiable (Conj (Atom \"a\" , Disj (Atom \"b\", Atom \"c\")));;')dnl
ocamlexec(`7.ml', `satisfiable (Conj (Disj (Atom \"a\" , Neg (Atom \"b\")), Conj (Neg (Atom \"a\") , Atom \"b\")));;')dnl
