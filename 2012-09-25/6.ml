(* 1 *)
let addelm (h : 'a) : 'a list list -> 'a list list =
  List.map (fun l -> h :: l);;

(* 2 *)
let powset (l : 'a list) : 'a list list =
  List.fold_right (fun h l -> addelm h l @ l) l [[]];;
