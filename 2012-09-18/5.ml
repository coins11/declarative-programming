let rec qsort (cmp : 'a -> 'a -> bool) : 'a list -> 'a list =
  function
    | [] -> []
    | x :: xs ->
      let (l, r) = List.partition (fun e -> cmp e x) xs in
      qsort cmp l @ [x] @ qsort cmp r
  ;;
