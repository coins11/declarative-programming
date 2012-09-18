type 'a ftree = FBr of 'a * 'a ftree list;;

(* 1 *)
let rec fdepth (FBr (_, l) : 'a ftree) : int =
  List.fold_left (fun n t -> succ (max n (fdepth t))) 1 l;;

(* 2 *)
let rec fpreorder (FBr (e, l) : 'a ftree) : 'a list =
  e :: List.concat (List.map fpreorder l);;
