include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `array_sum2 [|1; 2; 3|] [|4; 5|];;')dnl
ocamlexec(`1.ml', `inner_prod [| 1; 2; 3 |] [| 2; 3; 4 |];;')dnl
ocamlexec(`1.ml', `array_map (fun i -> i * i) [| 1; 2; 3 |];;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `preprod [2; 3; 4];;')dnl
ocamlexec(`2.ml', `preprod [2; 0; 4];;')dnl
ocamlexec(`2.ml', `prod [2; 3; 4];;')dnl
ocamlexec(`2.ml', `prod [2; 0; 4];;')dnl

taskheader(`3', `3.ml')dnl

以下に実行例を示す。

ocamlexec(`3.ml', `count_lines \"1.ml\";;')dnl
ocamlexec(`3.ml', `count_lines \"2.ml\";;')dnl
ocamlexec(`3.ml', `count_lines \"3.ml\";;')dnl
