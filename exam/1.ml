let sum2 = List.fold_left
    (fun (a, b) n -> if 0 < n then (a + n, b) else (a, b + n)) (0, 0);;
