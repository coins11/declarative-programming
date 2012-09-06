let rec drop (l : 'a list) (n : int) : 'a list =
  match l, n with
    | l, 0 -> l
    | [], _ -> []
    | (_ :: l), n -> drop l (pred n)
  ;;

(* range *)
let rec (--) (i : int) (j : int) : int list =
  if j < i then [] else i :: (succ i -- j);;
