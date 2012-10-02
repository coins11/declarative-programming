#use "5.ml";;

let rec buint_suint_div_mod (l : buint) (n : int) : buint * int =
  match l with
    | [] -> [], 0
    | x :: xs ->
      let q, r = buint_suint_div_mod xs n in
        (buint_cons ((r lsl base_bits + x) / n) q), (r lsl base_bits + x) mod n
  ;;
