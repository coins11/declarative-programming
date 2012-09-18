type prop =
  | Atom of string
  | Neg of prop
  | Conj of prop * prop
  | Disj of prop * prop;;

(* 1 *)
let atoms (p : prop) : string list =
  let rec atoms' : prop -> string list =
    function
      | Atom s -> [s]
      | Neg p -> atoms' p
      | Conj (p1, p2) -> atoms' p1 @ atoms' p2
      | Disj (p1, p2) -> atoms' p1 @ atoms' p2
  in
  List.fold_right (fun s l -> s :: List.filter ((!=) s) l) (atoms' p) [];;

(* 2 *)
let rec prop (al : string list) : prop -> bool =
  function
    | Atom s -> List.mem s al
    | Neg p -> not (prop al p)
    | Conj (p1, p2) -> prop al p1 && prop al p2
    | Disj (p1, p2) -> prop al p1 || prop al p2
  ;;

(* 3 *)
#use "2.ml";;
#use "6.ml";;
let satisfiable (p : prop) : bool =
  exists (fun al -> prop al p) (powset (atoms p));;
