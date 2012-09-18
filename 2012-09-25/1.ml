(* 1 *)
let inter (l : 'a list) : 'a list -> 'a list =
  List.filter (fun e -> List.mem e l);;

(* 2 *)
let pair (f : 'a) : 'b list -> ('a * 'b) list = List.map (fun s -> f, s);;

(* 3 *)
let prod (l1 : 'a list) (l2 : 'b list) : ('a * 'b) list =
  List.concat (List.map (fun e -> pair e l2) l1);;
