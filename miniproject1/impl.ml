let base_bits = 31;;
let base_mask = (1 lsl base_bits) - 1;;

type buint = int list;;

let buint_cons (x : int) (xs : buint) : buint =
  match x, xs with
    | 0, [] -> []
    | _ -> x :: xs
  ;;

(* 1 *)
let rec buint_add' (l : buint) (r : buint) (cf : bool) : buint =
  match l, r, cf with
    | [], xs, false | xs, [], false -> xs
    | [], [], true -> [1]
    | [], x :: xs, true | x :: xs, [], true ->
      let x' = succ x land base_mask in
      buint_cons x' (buint_add' xs [] (x' <= x))
    | xl :: xls, xr :: xrs, _ ->
      let x = (xl + xr + if cf then 1 else 0) land base_mask in
      buint_cons x
        (buint_add' xls xrs (if cf then x <= max xl xr else x < max xl xr))
  ;;

let buint_add (l : buint) (r : buint) = buint_add' l r false;;

(* 2 *)
let rec buint_fib2 : int -> buint * buint =
  function
    | 0 -> ([], [1])
    | n -> let (x, y) = buint_fib2 (pred n) in (y, buint_add x y)
  ;;

(* 3 *)
let rec buint_suint_mult (l : buint) (n : int) : buint = 
  match l with
    | [] -> []
    | x :: xs ->
      buint_cons ((x * n) land base_mask) (buint_add
        (buint_cons (((x * n) lsr base_bits) land base_mask) [])
        (buint_suint_mult xs n))
  ;;

(* 4 *)
let rec buint_fact : int -> buint =
  function
    | 0 -> [1]
    | n -> buint_suint_mult (buint_fact (pred n)) n
  ;;

(* 5 *)
let rec buint_mult (l : buint) : buint -> buint =
  function
    | [] -> []
    | x :: xs ->
      buint_add (buint_suint_mult l x) (buint_cons 0 (buint_mult l xs))
  ;;

(* 6 *)
let rec buint_suint_div_mod (l : buint) (n : int) : buint * int =
  match l with
    | [] -> [], 0
    | x :: xs ->
      let q, r = buint_suint_div_mod xs n in
        (buint_cons ((r lsl base_bits + x) / n) q), (r lsl base_bits + x) mod n
  ;;

(* 7 *)
let buint_baseconv (base : int) : buint -> buint =
  let rec bbrec result =
    function
      | [] -> result
      | l -> let q, r = buint_suint_div_mod l base in bbrec (r :: result) q in
  bbrec [];;

let buint_base10 = buint_baseconv 10;;
