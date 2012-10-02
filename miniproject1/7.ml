#use "6.ml";;

let buint_baseconv (base : int) : buint -> buint =
  let rec bbrec result =
    function
      | [] -> result
      | l -> let q, r = buint_suint_div_mod l base in bbrec (r :: result) q in
  bbrec [];;

let buint_base10 = buint_baseconv 10;;
