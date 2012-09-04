include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `timeSum (1, 10, 30) (4, 20, 20);;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `List.map fib (0 -- 20);;')dnl
ocamlexec(`2.ml', `List.map fibp (0 -- 20);;')dnl

taskheader(`3', `3.ml')dnl

以下に実行例を示す。

ocamlexec(`3.ml', `power 3 5;;')dnl
ocamlexec(`3.ml', `List.map (power 2) (0 -- 5);;')dnl
ocamlexec(`3.ml', `List.map (power 3) (0 -- 5);;')dnl
