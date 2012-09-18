(* 1 *)
let array_sum2 (a1 : int array) (a2 : int array) : int array =
  Array.init
    (min (Array.length a1) (Array.length a2)) (fun n -> a1.(n) + a2.(n));;

(* 2 *)
let inner_prod (a1 : int array) (a2 : int array) : int =
  let rec iprec : int -> int =
    function
      | 0 -> 0
      | n -> a1.(n-1) * a2.(n-1) + iprec (n-1)
  in
  iprec (min (Array.length a1) (Array.length a2));;

(* 3 *)
let array_map (f : 'a -> 'b) (arr : 'a array) : 'b array =
  Array.init (Array.length arr) (fun n -> f (arr.(n)));;
