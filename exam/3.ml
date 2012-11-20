type 'a tree = Lf | Br of ('a * 'a tree * 'a tree)

let rec trim f = function
    | Lf -> Lf
    | Br (label, l, r) when f label -> Lf
    | Br (label, l, r) -> Br (label, trim f l, trim f r)
    ;;
