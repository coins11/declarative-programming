type 'a btree =
  | Lf
  | Br of 'a * 'a btree * 'a btree;;

(* 1 *)
let rec add (e1 : 'a) : 'a btree -> 'a btree =
  function
    | Lf -> Br (e1, Lf, Lf)
    | Br (e2, tl, tr) ->
      if e1 = e2 then Br (e2, tl, tr)
      else if e1 < e2 then Br (e2, add e1 tl, tr)
      else Br (e2, tl, add e1 tr)
  ;;

(* 2 *)
let rec min_elt : 'a btree -> 'a =
  function
    | Lf -> raise Not_found
    | Br (e, Lf, _) -> e
    | Br (_, t, _) -> min_elt t
  ;;

(* 3 *)
let rec splitmax : 'a btree -> ('a * 'a btree) =
  function
    | Lf -> raise (Invalid_argument "splitmax")
    | Br (e, tl, Lf) -> e, tl
    | Br (e, tl, tr) ->
      let (em, tr') = splitmax tr in (em, Br (e, tl, tr'))
  ;;

let rec remove (e1 : 'a) : 'a btree -> 'a btree =
  function
    | Lf -> Lf
    | Br (e2, tl, tr) ->
      if e1 = e2 then
        match (tl, tr) with
          | (Lf, _) -> tr
          | (_, Lf) -> tl
          | _ -> let (em, tl') = splitmax tl in Br (em, tl', tr)
      else if e1 < e2 then Br (e2, remove e1 tl, tr)
      else Br (e2, tl, remove e1 tr)
  ;;
