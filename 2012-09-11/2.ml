(* 1 *)
let summation (f : int -> int) : int -> int =
  let rec iter (sum : int) (n : int) : int =
    if n < 0
      then sum
      else iter (sum + f n) (pred n)
  in iter 0;;

(* 2 *)
let summation2 (f : int -> int -> int) (n : int) (m : int) : int =
  summation (fun n' -> summation (f n') m) n;;
