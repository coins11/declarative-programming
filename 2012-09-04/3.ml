(* 1.3.1 *)
let rec power (x : int) : int -> int =
  function
    | 0 -> 1
    | n -> x * power x (n - 1)
  ;;

(* 1.3.2 *)
let rec power' (x : int) : int -> int =
  function
    | 0 -> 1
    | n ->
      if n mod 2 == 0
        then power' (x * x) (n / 2)
        else x * power' x (n - 1)
  ;;
