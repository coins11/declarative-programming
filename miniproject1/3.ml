#use "2.ml";;

let rec buint_suint_mult (l : buint) (n : int) : buint = 
  match l with
    | [] -> []
    | x :: xs ->
      buint_cons ((x * n) land base_mask) (buint_add
        (buint_cons (((x * n) lsr base_bits) land base_mask) [])
        (buint_suint_mult xs n))
  ;;
