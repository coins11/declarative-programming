(* 1.2.1 *)
let rec fib : int -> int =
  function
    | 0 -> 0
    | 1 -> 1
    | n -> fib (n - 1) + fib (n - 2)
  ;;

(* 1.2.2 *)
let rec fibp : int -> (int * int) =
  function
    | 0 -> (0, 1)
    | n -> let (a, b) = fibp (n - 1) in (b, a + b)
  ;;

(* range *)
let rec (--) (i : int) (j : int) : int list =
  if j < i then [] else i :: (succ i -- j);;

(* test *)
Format.print_bool (List.map fib (0 -- 10) =
                   List.map (fun n -> fst (fibp n)) (0 -- 10));;
