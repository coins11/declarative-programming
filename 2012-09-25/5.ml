(* 2 *)
let rec merge (comp : 'a -> 'a -> bool) (ls : 'a list) (rs : 'a list) : 'a list =
  match ls , rs with
    | [], r -> r
    | l, [] -> l
    | (l :: ls), (r :: rs) when comp l r -> l :: merge comp ls (r :: rs)
    | ls, (r :: rs) -> r :: merge comp ls rs
  ;;

(* 3 *)
let msort (comp : 'a -> 'a -> bool) (xs : 'a list) : 'a list =
  let rec msort' =
    function
      | [] -> []
      | [x] -> [x]
      | (x :: x' :: xs) -> merge comp x x' :: msort' xs in
  let rec msort'' =
    function
      | [] -> []
      | [x] -> x
      | l -> msort'' (msort' l) in
  msort'' (List.map (fun a -> [a]) xs);;
