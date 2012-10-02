include(`../lib.m4')dnl
header()dnl

* base.ml

実装を以下に示す。

ocamlcode(`base.ml')dnl

buint 型は非負の多倍長整数を表す型である。この実体は int list 型である。buint 型で表される多倍長整数のリストとしての末尾(一番上の桁)の部分は必ず0以外の数値でなければならず、全ての要素は0から base_mask の範囲になければならない。(このような制約は、OCaml の型では表現できない)

buint_cons 関数は、リストの cons によって多倍長整数を作る。ただし、多倍長整数の0(リストとしては空のリスト)に0を cons してしまうと buint 型の値の制約を守れないので、その場合は空リストを返すようにする。

* 1 (1.ml)

実装を以下に示す。

ocamlcode(`1.ml')dnl

buint_add' 関数は、キャリーフラグ付きの多倍長整数の加算関数である。buint_add 関数は、キャリーフラグ無し(キャリーフラグが false 固定)の多倍長整数の加算関数である。

以下に実行例を示す。

ocamlexec(`1.ml', `buint_add [1] [base_mask; base_mask];;')dnl
ocamlexec(`1.ml', `buint_add [base_mask] [base_mask; base_mask];;')dnl
ocamlexec(`1.ml', `buint_add [1] (buint_add [base_mask; base_mask] [base_mask; base_mask]);;')dnl

* 2 (2.ml)

実装を以下に示す。

ocamlcode(`2.ml')dnl

buint_fib2 関数は、int 型の自然数 n を取りフィボナッチ数列の n 番目と 1+n 番目の値の組を返す関数である。

以下に実行例を示す。

ocamlexec(`2.ml', `buint_fib2 50;;')dnl
ocamlexec(`2.ml', `buint_fib2 100;;')dnl
ocamlexec(`2.ml', `buint_fib2 200;;')dnl

* 3 (3.ml)

実装を以下に示す。

ocamlcode(`3.ml')dnl

buint_suint_mult 関数は、多倍長整数 l と整数 n を取り、その積を多倍長整数で返す関数である。ただし、n は0から base_mask の範囲に収まらなければならない。

以下に実行例を示す。

ocamlexec(`3.ml', `buint_suint_mult (fst (buint_fib2 100)) 12345;;')dnl

* 4 (4.ml)

実装を以下に示す。

ocamlcode(`4.ml')dnl

buint_fact 関数は、整数 n を取り n の階乗を返す関数である。ただし、n は0から base_mask の範囲に収まらなければならない。

以下に実行例を示す。

ocamlexec(`4.ml', `buint_fact 30;;')dnl
ocamlexec(`4.ml', `buint_fact 50;;')dnl

* 5 (5.ml)

実装を以下に示す。

ocamlcode(`5.ml')dnl

buint_mult 関数は、多倍長整数の積を計算する関数である。

以下に実行例を示す。

ocamlexec(`5.ml', `buint_mult (buint_fact 20) (buint_fact 20);;')dnl
ocamlexec(`5.ml', `buint_mult (buint_fact 50) (buint_fact 50);;')dnl

* 6 (6.ml)

実装を以下に示す。

ocamlcode(`6.ml')dnl

buint_suint_div_mod 関数は多倍長整数を整数 n で割り、商と余りを返す関数である。ただし、n は0から base_mask の範囲に収まらなければならない。

以下に実行例を示す。

ocamlexec(`6.ml', `buint_suint_div_mod (buint_fact 30) 123;;')dnl

* 7 (7.ml)

実装を以下に示す。

ocamlcode(`7.ml')dnl

buint_baseconv 関数は、多倍長整数 l と整数 n を取り、l を n 進数に変換する関数である。ただし、n は0から base_mask の範囲に収まらなければならない。

buint_base10 関数は、多倍長整数を取り10進数に変換する関数である。

以下に実行例を示す。

ocamlexec(`7.ml', `buint_base10 (buint_fact 30);;')dnl

