include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `listsum1 [1.; 2.; 3.; 4.];;')dnl
ocamlexec(`1.ml', `listsum1 [1.1; 2.2; 3.3; -4.4];;')dnl
ocamlexec(`1.ml', `listsum2 [1.; 2.; 3.; 4.];;')dnl
ocamlexec(`1.ml', `listsum2 [1.1; 2.2; 3.3; -4.4];;')dnl
ocamlexec(`1.ml', `average [1.1; 2.2; 3.3; -4.4];;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `summation (fun x -> x) 3;;')dnl
ocamlexec(`2.ml', `summation2 (+) 2 2;;')dnl

taskheader(`3', `3.ml')dnl

以下に実行例を示す。

ocamlexec(`3.ml', `drop (1--10) 3;;')dnl
ocamlexec(`3.ml', `drop (1--20) 12;;')dnl
