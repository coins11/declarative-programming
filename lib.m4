define(`ocamlcode', `syscmd(`cat $1 | sed "s/^/> /g"')')dnl
define(`ocamlexec',
`syscmd(`echo "# $2"')dnl
syscmd(`echo -n "$2" | ocaml -init $1 | tail -n +4')dnl
')dnl
define(`header',
`学籍番号: 201111365
名前: 坂口和彦
')dnl
define(`taskheader',
`* 課題$1

以下に課題$1のソースコードを示す。

ocamlcode(`$2')dnl
')dnl
