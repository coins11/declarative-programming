type 'a tree =
  | Lf
  | Br of 'a * 'a tree * 'a tree;;

let rec inorder : 'a tree -> 'a list =
  function
    | Lf -> []
    | Br (e, l, r) -> inorder l @ [e] @ inorder r
  ;;

let rec postorder : 'a tree -> 'a list =
  function
    | Lf -> []
    | Br (e, l, r) -> inorder l @ inorder r @ [e]
  ;;
