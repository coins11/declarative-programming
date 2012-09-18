exception Zero;;

(* 1 *)
let preprod : int list -> int =
  List.fold_left (fun a b -> if b = 0 then raise Zero else a * b) 1;;

(* 2 *)
let prod (l : int list) : int =
  try preprod l with Zero -> 0
