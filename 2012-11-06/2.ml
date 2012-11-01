(* 1 *)
let inits (type a) (xs : a list) : (a list) list =
  let rec inits' r xs =
    r :: match xs with
      | [] -> []
      | x :: xs' -> inits' (r @ [x]) xs'
  in inits' [] xs;;

(* 2 *)
let rec tails : 'a. 'a list -> ('a list) list =
  function
    | [] -> [[]]
    | x :: xs as xs' -> xs' :: tails xs;;

(* 3 *)
let rec segs (type a) (xs : a list) : (a list) list =
  List.concat (List.map tails (inits xs));;

(* 4 *)
let rec mss (ns : int list) : int =
  List.fold_left max 0 (List.map (List.fold_left (+) 0) (segs ns));;
