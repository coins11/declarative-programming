#use "3.ml";;

let rec buint_fact : int -> buint =
  function
    | 0 -> [1]
    | n -> buint_suint_mult (buint_fact (pred n)) n
  ;;
