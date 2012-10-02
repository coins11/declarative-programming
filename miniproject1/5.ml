#use "4.ml";;

let rec buint_mult (l : buint) : buint -> buint =
  function
    | [] -> []
    | x :: xs ->
      buint_add (buint_suint_mult l x) (buint_cons 0 (buint_mult l xs))
  ;;
