#use "1.ml";;

let rec buint_fib2 : int -> buint * buint =
  function
    | 0 -> ([], [1])
    | n -> let (x, y) = buint_fib2 (pred n) in (y, buint_add x y)
  ;;
