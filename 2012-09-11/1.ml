(* 1 *)
let listsum1 : float list -> float = List.fold_left (+.) 0.;;

(* 2 *)
let listsum2 : float list -> float =
  let rec ls2iter sum =
    function
      | [] -> sum
      | x :: xs -> ls2iter (x +. sum) xs
    in ls2iter 0.;;

(* 3 *)
let average (l : float list) : float =
  listsum1 l /. float_of_int (List.length l);;
