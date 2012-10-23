include(`../lib.m4')dnl
header()dnl

taskheader(`1', `1.ml')dnl

以下に実行例を示す。

ocamlexec(`1.ml', `IntQueue.enqlist IntQueue.empty [1; 2; 3];;')dnl
ocamlexec(`1.ml', `IntQueue.deq (IntQueue.enqlist IntQueue.empty [1; 2; 3]);;')dnl
ocamlexec(`1.ml', `IntQueue.enqlist (snd (IntQueue.deq (IntQueue.enqlist IntQueue.empty [1; 2; 3]))) [4; 5];;')dnl
ocamlexec(`1.ml', `print_int_queue (IntQueue.enqlist IntQueue.empty [1; 2; 3; 4; 5]);;')dnl

taskheader(`2', `2.ml')dnl

以下に実行例を示す。

ocamlexec(`2.ml', `nexts \"a\" graph1;;')dnl
ocamlexec(`2.ml', `search graph1 \"a\";;')dnl
