#use "base.ml";;

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
