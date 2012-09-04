(* 1 *)
let m2time (n : int) : (int * int * int) =
  (n / (60 * 24) , n / 60 mod 24, n mod 60);;

(* 2 *)
let time2m (d, h, m) : int =
  d * 60 * 24 + h * 60 + m;;

(* 3 *)
let timeSum l1 l2 = m2time (time2m l1 + time2m l2);;
