(* 1 *)
let flatten (l : 'a list list) : 'a list =
  List.fold_right (@) l [];;

(* 2 *)
let exists (f : 'a -> bool) (l : 'a list) : bool =
  List.fold_right (fun e -> (||) (f e)) l false;;
