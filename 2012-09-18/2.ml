type 'a tree =
  | Lf
  | Br of 'a * 'a tree * 'a tree;;

(* 1 *)
let rec depth : 'a tree -> int =
  function
    | Lf -> 0
    | Br (_, l, r) -> succ (max (depth l) (depth r))
  ;;

(* 2 *)
let rec comptree : int -> 'a -> 'a tree =
  function
    | 0 -> fun _ -> Lf
    | n -> fun elem ->
      let c = comptree (pred n) elem in
        Br (elem, c, c)
  ;;
