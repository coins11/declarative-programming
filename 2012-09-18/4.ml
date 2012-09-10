type 'a ftree = FBr of 'a * 'a ftree list;;

(* 1 *)
let rec fdepth (FBr (_, l) : 'a ftree) : int = succ (fldepth l) and
        fldepth l = List.fold_left max 0 (List.map fdepth l);;

(* 2 *)
let rec fpreorder (FBr (h, l) : 'a ftree) : 'a list =
  h :: List.concat (List.map fpreorder l);;
