let base_bits = 31;;
let base_mask = (1 lsl base_bits) - 1;;

type buint = int list;;

let buint_cons (x : int) (xs : buint) : buint =
  match x, xs with
    | 0, [] -> []
    | _ -> x :: xs
  ;;
